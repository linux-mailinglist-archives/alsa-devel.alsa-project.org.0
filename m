Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F67970C1E6
	for <lists+alsa-devel@lfdr.de>; Mon, 22 May 2023 17:04:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55B98DE;
	Mon, 22 May 2023 17:03:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55B98DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684767867;
	bh=FFjp9TlBTb9pZ6Q8XbdWktID7xpqUqBNNGV6hRLdV9Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BeBt6o1FTvqJL234lVo9I50uUI4MndTPhohfHayr/yr04cy6KyUpcOWnDwe5FWu7E
	 8iZY+2ON0pEcOuC8CSskgZR0eNenyGy+YboqVGn6/MjW4sBMWp1XSkzARVAeh3aiOl
	 ETLl4JomZTIUEBMN8f6V5v/y005esMkj9Z0AZ/ng=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6350FF805B5; Mon, 22 May 2023 17:02:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 883F5F805AB;
	Mon, 22 May 2023 17:02:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A26CBF8057B; Mon, 22 May 2023 17:01:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2A4EDF80549
	for <alsa-devel@alsa-project.org>; Mon, 22 May 2023 17:01:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A4EDF80549
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ghmuTwgI
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AFD5661ACC;
	Mon, 22 May 2023 15:01:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83FB5C433D2;
	Mon, 22 May 2023 15:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684767710;
	bh=FFjp9TlBTb9pZ6Q8XbdWktID7xpqUqBNNGV6hRLdV9Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ghmuTwgIiZv74F1eDiHQ5tZDEgWJE8W8AEPC/A6QpZHk0rZ4gvIYtfJXByOMLobWG
	 MdbfimjGjHHZn9iBOSOkloEoJ/DnRib7ngA4HK9yzE5FVxoE4CoMiOyGD60BHbfFx4
	 aqi7ZEbRcyZG3OyGjDId25UZS25Req3+FtMasAtdpaBqWx1ImDb3+WZn9LvBWpcJaR
	 a/q3LViHxMx7YdWxiypdobic9Hqh14NoiAo7SX2yPCqlpp0GJWiS1gX0rOfJA6aNla
	 3mfCLaVOCM1rjHBehdpLx5naPikrpg1A1zetUN7iygVReotvcWx5qbM06srQu8tuLu
	 eR4yg8nWfdewg==
From: Mark Brown <broonie@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 alsa-devel@alsa-project.org
In-Reply-To: 
 <5b44b2fddd8973e949e4ae2132971b147cfd1ec1.1684594544.git.christophe.jaillet@wanadoo.fr>
References: 
 <5b44b2fddd8973e949e4ae2132971b147cfd1ec1.1684594544.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] ASoC: rt5659: Use the devm_clk_get_optional() helper
Message-Id: <168476770826.849172.16102240174611371988.b4-ty@kernel.org>
Date: Mon, 22 May 2023 16:01:48 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: RQR5V2OJC32P7FLX53MBAOWT3DU3SMUR
X-Message-ID-Hash: RQR5V2OJC32P7FLX53MBAOWT3DU3SMUR
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RQR5V2OJC32P7FLX53MBAOWT3DU3SMUR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 20 May 2023 16:56:00 +0200, Christophe JAILLET wrote:
> Use devm_clk_get_optional() instead of hand writing it.
> This saves some LoC and improves the semantic.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt5659: Use the devm_clk_get_optional() helper
      commit: f364eb563164f52dcc42ea265a66510c6f15f829

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

