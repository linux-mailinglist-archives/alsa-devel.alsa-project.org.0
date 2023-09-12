Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E36C79B749
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 02:06:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16B2414FB;
	Tue, 12 Sep 2023 02:05:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16B2414FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694477201;
	bh=DgTYRQBSoJwFvdOE21aqdGWssFdi96AaqXB7ox6Gvl8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JPq2Vzrv/IxdXWx4DeNK7RZMwwEgkgjEWgAoDYU4sKlHtOqSJLVLw3mTZ5nw8Ii+2
	 iJYbSSdFUb6EyMJcJZwJLtMxNnswG1VKfJIYK93fEsrI7D/QSmoBHAX5dK4b81e3zr
	 wME/No4oB82e59Un919mH5HeJWmWoY1sgE5NC22Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E652F805D9; Tue, 12 Sep 2023 01:58:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 24028F805B3;
	Tue, 12 Sep 2023 01:58:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DE6EEF8061B; Tue, 12 Sep 2023 01:57:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CD260F805E8
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 01:57:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD260F805E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=sCsbC+kB
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B33CB614B3;
	Mon, 11 Sep 2023 23:57:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9376C32779;
	Mon, 11 Sep 2023 23:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694476662;
	bh=DgTYRQBSoJwFvdOE21aqdGWssFdi96AaqXB7ox6Gvl8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=sCsbC+kBVOnYpheOEgpvIQenH7Rc5ejskACNLgOFadmXomrRduMQWUqt747gbZEYn
	 DJWD9sn8SQpvwnUc5i4Er6yDrW0g/ekW5W/18qnu6473W9xqN8DJ27U0VgvRRvaoeb
	 z/GXRQYMe8bwrZ2zkCFgV6g2pvNY3MluE9cr97p4/2BpIx4VQgRu9Q//+PChIVK7dU
	 ewEQjQgO2jiYrE/FmbTpFfinrqanrbUgcneOk6iBk53977A06j109yuNWsG9ctKUdY
	 +Hoet91nTSOyQ7Pq/zKpGAFXddjr3wD2u4CUurCxwTylM7HYRd/alkV9cAKR47ST8u
	 SB7Rb7xiu+/rw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 Trevor Wu <trevor.wu@mediatek.com>
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20230825024935.10878-1-trevor.wu@mediatek.com>
References: <20230825024935.10878-1-trevor.wu@mediatek.com>
Subject: Re: [RESEND,v3 0/3] ASoC: mt8188-mt6359: add SOF support
Message-Id: <169447666040.2387538.8880759925016184457.b4-ty@kernel.org>
Date: Tue, 12 Sep 2023 00:57:40 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: AKD5HCALWCAPVUTGFCSQLA6FU4LPBHYP
X-Message-ID-Hash: AKD5HCALWCAPVUTGFCSQLA6FU4LPBHYP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AKD5HCALWCAPVUTGFCSQLA6FU4LPBHYP/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 25 Aug 2023 10:49:32 +0800, Trevor Wu wrote:
> This series introduces dynamic pinctrl and adds support for the SOF on
> the mt8188-mt6359 machine driver.
> 
> Changes since v2:
>   - revise mtk_sof_check_tplg_be_dai_link_fixup().
> 
> Changes since v1:
>   - minor changes to incorporate the suggestions from the reviewer.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: mediatek: mt8188-mt6359: support dynamic pinctrl
      commit: d601bb78f06b9e3cbb52e6b87b88add9920a11b6
[2/3] ASoC: mediatek: common: revise SOF common code
      commit: 4047b35c836ff9f8bf1f57c4ab871136899267e9
[3/3] ASoC: mediatek: mt8188-mt6359: add SOF support
      commit: 1bce95deab841ece9602f941e68c7b919fde303d

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

