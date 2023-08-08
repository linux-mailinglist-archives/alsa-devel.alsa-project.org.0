Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A45774AB5
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Aug 2023 22:33:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51F8A823;
	Tue,  8 Aug 2023 22:32:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51F8A823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691526825;
	bh=qewne48Hucqc657V12FXXvGjJPxSyV07SN2JHI9cYD8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MOFrMAZ6d8vAUfKqg/8zIr3249nwvT9RGpZ2Fgbrd0iFbr2SCA4UumRHSsw6aL7Nc
	 t4vcQ+OUtHNXBLrT/kktuIcfFX+DDdfQmBbSJTJgUmQ5q3xayT8ojdYJog4zxZh/Wx
	 /byq5DanQOEOHMgBDPHTIgDemw+olJAacHC60rGs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A04D7F80551; Tue,  8 Aug 2023 22:32:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3EB59F80154;
	Tue,  8 Aug 2023 22:32:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 48E22F8053B; Tue,  8 Aug 2023 22:32:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1C77DF800B8
	for <alsa-devel@alsa-project.org>; Tue,  8 Aug 2023 22:32:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C77DF800B8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=iKFAgVD3
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B501A62C78;
	Tue,  8 Aug 2023 20:32:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 264BEC433C8;
	Tue,  8 Aug 2023 20:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691526760;
	bh=qewne48Hucqc657V12FXXvGjJPxSyV07SN2JHI9cYD8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=iKFAgVD3iFl5s8e93Hf1+1OwVYtQwUpxFuksU0TNXw1W74bWzz+fBh1Cv7SVGuBUT
	 8YTzjIyhPUWQG9JlkAkay8qP7dSt4htMNusG0N+brPKoN/nDcpc29cXy2irRsh6tKf
	 McNSp0HAP1AHFjKm++QXPKcgfD7TjOGWjxUKwbUvCokAYJi6gG9Ch9JMjtsLnTzcuk
	 /9x+Xpvnun7GhrAdSOD6cMKNUXjKGumTylyODKq6xxj3kHlS/9ETeL28blPNHg7bNj
	 03Lf1B+NEB136u6P3ScDKtyg6/KWuLesmvwUCNkRdWVMmrKcX8tHiljMuJtPX4IUmZ
	 dIsKOrF5RrLEA==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 linux-imx@nxp.com, Li Zetao <lizetao1@huawei.com>
Cc: linuxppc-dev@lists.ozlabs.org, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20230808021728.2978035-1-lizetao1@huawei.com>
References: <20230808021728.2978035-1-lizetao1@huawei.com>
Subject: Re: [PATCH -next] ASoC: imx-audio-rpmsg: Remove redundant
 initialization owner in imx_audio_rpmsg_driver
Message-Id: <169152675686.192712.3518358575478738982.b4-ty@kernel.org>
Date: Tue, 08 Aug 2023 21:32:36 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: 775GZVYHESMVTL56H44EDQIMJ35SI4CF
X-Message-ID-Hash: 775GZVYHESMVTL56H44EDQIMJ35SI4CF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/775GZVYHESMVTL56H44EDQIMJ35SI4CF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 08 Aug 2023 10:17:28 +0800, Li Zetao wrote:
> The module_rpmsg_driver() will set "THIS_MODULE" to driver.owner when
> register a rpmsg_driver driver, so it is redundant initialization to set
> driver.owner in the statement. Remove it for clean code.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: imx-audio-rpmsg: Remove redundant initialization owner in imx_audio_rpmsg_driver
      commit: 8e5c4a9fc47ab6d8e1d9cf6c1f11c90675c1d968

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

