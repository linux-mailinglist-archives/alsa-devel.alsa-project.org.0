Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D90247EAF56
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Nov 2023 12:41:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7EA174C;
	Tue, 14 Nov 2023 12:40:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7EA174C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699962064;
	bh=97BRiXf4JbXXukYFppXJ7uNq0Zs+/0mBGGc7q3vbL1U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IIFq74FpexuIEMaW2kJ2FoFbKEevc4vlsGYFMhZ48zeVXRmupH2Ill8RphIsl6Vk3
	 kEPrAzCaJZhTsqX3jUm8AKTVFnvP444do1gUegVDJyyi17MCjGltE2qa1UH/PpYBCo
	 aO1xQfyfEr72p1zOFwtYdPJ9g2l8gURXV/02IYv0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ECD52F8055B; Tue, 14 Nov 2023 12:39:24 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B417F80549;
	Tue, 14 Nov 2023 12:39:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1378FF80249; Tue, 14 Nov 2023 12:39:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 46C1CF80166
	for <alsa-devel@alsa-project.org>; Tue, 14 Nov 2023 12:39:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46C1CF80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=n6LGPqQp
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1014D6121C;
	Tue, 14 Nov 2023 11:39:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 024A8C433C7;
	Tue, 14 Nov 2023 11:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699961951;
	bh=97BRiXf4JbXXukYFppXJ7uNq0Zs+/0mBGGc7q3vbL1U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=n6LGPqQpwcRSd3ol8dgWNjZT9I1tORwYKRhT4YMDrIojFMnyxZVx4CbW3xNghl3s5
	 mlj0xUgnIZspuMxeoMPNwwWpTb34b+Fze5jGdyxU6NfCmq6533L1qbzR0lGlhhh8Na
	 O5RNTqkPuGiNHAVuyLOsTEF4Rk/JOnyvmdI/YMMIq06VoJUDDF4faZlFpTNSA300E2
	 afm0WXuV4gmcMzWP9LxxsmIYcEEVhz04O4+d72f2wc5sEIhckcxyj3D0s9cSzFC1Q/
	 +zcAXlch4HNai1TpcrHVXBLXCi1pNUjWiSOJC7zUqrMuy4GQX2mw2pRgGzQ5ikz8VV
	 VEszedm19iFkQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Mac Chiang <mac.chiang@intel.com>
Cc: cezary.rojewski@intel.com, pierre-louis.bossart@linux.intel.com,
 liam.r.girdwood@linux.intel.com, peter.ujfalusi@linux.intel.com,
 yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, perex@perex.cz, tiwai@suse.com
In-Reply-To: <20231113115907.18539-1-mac.chiang@intel.com>
References: <20231113115907.18539-1-mac.chiang@intel.com>
Subject: Re: [RESEND,v3] ASoC: Intel: sof_rt5682: add mtl_rt5650 support
Message-Id: <169996194872.29934.679497935803942387.b4-ty@kernel.org>
Date: Tue, 14 Nov 2023 11:39:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: E42GNSBO444NTSV7BLXH7W3DYYJW4J2X
X-Message-ID-Hash: E42GNSBO444NTSV7BLXH7W3DYYJW4J2X
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E42GNSBO444NTSV7BLXH7W3DYYJW4J2X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 13 Nov 2023 06:59:07 -0500, Mac Chiang wrote:
> RT5650 is I2S codec integrated with HP and SPK.
> The HW board connects SoC I2S to RT5650 codec as below:
> 
> I2S0: ALC5650 aif1 for Speaker
> I2S2: ALC5650 aif2 for Headphone
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: sof_rt5682: add mtl_rt5650 support
      commit: a55ea47bb8743ee044550c5dfdd3cb3147602e05

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

