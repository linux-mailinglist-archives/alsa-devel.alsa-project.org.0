Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9126B8171
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Mar 2023 20:09:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2A9F1423;
	Mon, 13 Mar 2023 20:08:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2A9F1423
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678734579;
	bh=NSgcGMlvHaZdY1J2Us1HiQZa412OdeIu/4FLhrIhJVY=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bVqf+NJdpQoC1B0ZSgoMpI9VDNmhhR/KF54JBRpT7yC9o5ei1dUs88ritq9d1b2Pl
	 ocTn5DmdU88VpgNVEhT/ODn+eshxtkKbgiQxfyR2zv3H1RPz8QgCunwqqDpJ3c6hud
	 BbeBx2peoE0mPQ5Cj87v52dRhhXbL9vvbWT1a6BI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BD324F804B1;
	Mon, 13 Mar 2023 20:07:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7C65F80482; Mon, 13 Mar 2023 20:07:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A2218F80272
	for <alsa-devel@alsa-project.org>; Mon, 13 Mar 2023 20:07:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2218F80272
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Hke5SM/m
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 52644B811F0;
	Mon, 13 Mar 2023 19:07:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E98ABC433D2;
	Mon, 13 Mar 2023 19:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678734461;
	bh=NSgcGMlvHaZdY1J2Us1HiQZa412OdeIu/4FLhrIhJVY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Hke5SM/mxLaeP5gd2fw1qU77XLIYsy+ZXz0S7dsUv8LMn1YYsIlQ6sXh+uiX1zMho
	 wMadRJNLkrsf+GDOtvxXZ7rhhtkafdpZp1pXKaGOJp9aWdzK+9CKn/67GFQ1EWF6A2
	 c4s27L+XyF3z4d18AuPa8c/tist0WAr6kC1SvAacWEA/KYWex07XzZw2tDWVJO85ID
	 44i1KbUg9ph5zxCOfrcQxri2+1o25dXnLu2gRnZYcZkWxCTkWGOhQImXGWGa7BUmto
	 UQl8KN52L6Qz4CjVdj743JQ1EDE66kiT6ixeUJwJlUxpWl0gKjHrbJMH88r+oIaSfc
	 W/tGN9jJcNGEQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 Trevor Wu <trevor.wu@mediatek.com>
In-Reply-To: <20230307040938.7484-1-trevor.wu@mediatek.com>
References: <20230307040938.7484-1-trevor.wu@mediatek.com>
Subject: Re: [PATCH 0/4] ASoC: mediatek: fix coverity problems
Message-Id: <167873445867.106067.16026073006550113761.b4-ty@kernel.org>
Date: Mon, 13 Mar 2023 19:07:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
Message-ID-Hash: D6DDGYJTRLAWRXY5GHOGYF32E2IP3EB3
X-Message-ID-Hash: D6DDGYJTRLAWRXY5GHOGYF32E2IP3EB3
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: jiaxin.yu@mediatek.com, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D6DDGYJTRLAWRXY5GHOGYF32E2IP3EB3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 07 Mar 2023 12:09:34 +0800, Trevor Wu wrote:
> Coverity reports some UNINIT and CERT STR31-C problems, so we add
> initialization and dai id check to resolve problems.
> 
> Trevor Wu (4):
>   ASoC: mediatek: mt8195: add dai id check before accessing array
>   ASoC: mediatek: mt9195-mt6359: fix UNINIT problem
>   ASoC: mediatek: mt6358: fix UNINIT problem
>   ASoC: mediatek: mt6359: fix UNINIT problem
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: mediatek: mt8195: add dai id check before accessing array
      commit: ff728899065922534d80170685fb807194d6487b
[2/4] ASoC: mediatek: mt9195-mt6359: fix UNINIT problem
      commit: 1a3f0116b74ba2f9477c28fcf9d66ac7126455fd
[3/4] ASoC: mediatek: mt6358: fix UNINIT problem
      commit: 9760e01b3851dc51d1901876668168328d34a647
[4/4] ASoC: mediatek: mt6359: fix UNINIT problem
      commit: 3a60fa4c063dacc5eb66660aa23107f3cb8a477e

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

