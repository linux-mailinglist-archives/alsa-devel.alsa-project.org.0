Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB76E7BE9B5
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Oct 2023 20:37:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD652EA1;
	Mon,  9 Oct 2023 20:37:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD652EA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696876675;
	bh=cleXwwfg4OCGw1Kekzev2WGKdvehBL0Gc1xi4pIDrp0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ufsj6rB4enf8M/y66f+OIVAevhXjCrktOWBuTUE2ZPW2qK+102xKD8ttmUNfZLT8Y
	 4YJZjC0d3NuFFc79MFjv5xufIheZ+J0sWrBbm4paTiiTnJYOZyBCgWvHl7G2Z22UZ3
	 aJLtWhUAGwo9hbtDnubcUkAOCFlRg2KFPFGw3jjA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E400F802BE; Mon,  9 Oct 2023 20:36:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 69381F802BE;
	Mon,  9 Oct 2023 20:36:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AAFD5F80536; Mon,  9 Oct 2023 20:36:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B84B3F80166
	for <alsa-devel@alsa-project.org>; Mon,  9 Oct 2023 20:36:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B84B3F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=lRVKJnS8
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4FD4ACE19D1;
	Mon,  9 Oct 2023 18:36:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2E92C433C8;
	Mon,  9 Oct 2023 18:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696876577;
	bh=cleXwwfg4OCGw1Kekzev2WGKdvehBL0Gc1xi4pIDrp0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=lRVKJnS86mkBgUwHEKu3kTFmSyz0+HRJuREm/e4ClHEh1+kRaNQ0DZNol8dHUriEU
	 MNX+R3wWHACHrBArrmULIe7ymsvBD4q8CMJn11vgxPdNOc72FMylFe60KtEQEKXHaS
	 T2Ujs52iMz2UKlImVbFCPfNuoA+lzj+nuJt7VwIn6uw72hhQvtLGQ2QAlfiSFmkNEc
	 6UAA3hV9J73+xnqT4RgkckUG8QdipOceou+nwaYBhqAqdDrDSF1vAqzKi5mIee85OC
	 d5ZFnpbbIEjUMv8z380k9BIVNG1LB+SHEeLJ685xGevfbyzZJ2Z/NIdFcXeqkMznXG
	 hgebKbLav8evA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Heiko Stuebner <heiko@sntech.de>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: alsa-devel@alsa-project.org, linux-gpio@vger.kernel.org,
 linux-rockchip@lists.infradead.org
In-Reply-To: <20230929-descriptors-asoc-rockchip-v2-0-2d2c0e043aab@linaro.org>
References: <20230929-descriptors-asoc-rockchip-v2-0-2d2c0e043aab@linaro.org>
Subject: Re: [PATCH v2 0/4] Convert Rockchip ASoC drivers to GPIO
 descriptors
Message-Id: <169687657441.138823.7986058351382162360.b4-ty@kernel.org>
Date: Mon, 09 Oct 2023 19:36:14 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: IUWBDSHBW2IDLAXWMD6HBWBDLC6PMRU4
X-Message-ID-Hash: IUWBDSHBW2IDLAXWMD6HBWBDLC6PMRU4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IUWBDSHBW2IDLAXWMD6HBWBDLC6PMRU4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 29 Sep 2023 00:12:53 +0200, Linus Walleij wrote:
> The Rockchip drivers are pretty straight-forward to convert
> over to using GPIO descriptors.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: rockchip: Convert RK3288 HDMI to GPIO descriptors
      commit: 15b26d8165b39a07f038fb4d2b67a04c50463eb9
[2/4] ASoC: rockchip: Drop includes from RK3399
      commit: 3116dc2e16542d56bd173e90ce1893bed697a830
[3/4] ASoC: rockchip: Drop includes from Rockchip MAX98090
      commit: 7214141067922836b48157e8266335096a0ea4ea
[4/4] ASoC: rockchip: Drop includes from Rockchip RT5645
      commit: 329b017ccdf80cdcc3550f6caecbf2bc80a67432

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

