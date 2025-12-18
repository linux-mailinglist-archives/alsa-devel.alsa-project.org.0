Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C285CCC7E9
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Dec 2025 16:34:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DAC7260227;
	Thu, 18 Dec 2025 16:34:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DAC7260227
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1766072071;
	bh=z0fXM45sgVSyfzITVbX/gHZahLGojvuS7/CdlK1LMwI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FJZ/+YcBREIsmgpbSt3WOOO0UMNhk2FJPFqqic0rnypo9sR7HJZu1t9H+iTpCOrC3
	 ssgzCK2JnUHtaBx/rsXJiidilUws/CuswP7VXOxm62pKAgzoQnD/z0bgXAKkylDm3X
	 bIsCGHYzqk01TSmL371eQvIFPFfA4E/325REK7Qk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0CB31F805C5; Thu, 18 Dec 2025 16:33:58 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C01EF805D7;
	Thu, 18 Dec 2025 16:33:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 190EAF8053B; Thu, 18 Dec 2025 16:32:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 80554F804B3
	for <alsa-devel@alsa-project.org>; Thu, 18 Dec 2025 16:32:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80554F804B3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=oR3hYIMV
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 855DF409A6;
	Thu, 18 Dec 2025 15:32:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B17BC4CEFB;
	Thu, 18 Dec 2025 15:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766071941;
	bh=z0fXM45sgVSyfzITVbX/gHZahLGojvuS7/CdlK1LMwI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oR3hYIMVuO4xyRuNfYiB/VVU4RsKge+4vc30KdPDexk8F2c+x7crBNSrgkE6MrbQq
	 +H3BbHMk4rDifHN/PRWFbt5EbJyKsDN3SZCNmXpczkrfcsCHS6csw5XWWcYEHpvIOB
	 0O0+M38TJvmQs2xoefU0FJGsPGA/1mKk4CBT1H4n80QSw87GpjWMTKTTpZo93KPiRQ
	 YdLJX60PcgK/6dkjznaa5+d2wv3GgMUqOCmNrOKgtofG+LM2KFRAiAaEki6eO7lEc2
	 Kqpn82/GaitrAJMn9noE8HR7X2WBGVwFnWJB8dbErNSGxsKlgWQlrXbUpd2XMc61yG
	 b/BNmu7XZ8N5Q==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Niranjan H Y <niranjan.hy@ti.com>
Cc: linux-sound@vger.kernel.org, ckeepax@opensource.cirrus.com,
 lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, perex@perex.cz, tiwai@suse.com,
 cezary.rojewski@intel.com, peter.ujfalusi@linux.intel.com,
 kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.dev,
 shenghao-ding@ti.com, v-hampiholi@ti.com, baojun.xu@ti.com,
 dan.carpenter@linaro.org, sandeepk@ti.com
In-Reply-To: <20251215153219.810-1-niranjan.hy@ti.com>
References: <20251215153219.810-1-niranjan.hy@ti.com>
Subject: Re: [PATCH v2 1/8] ASoC: tas2783A: sdw_utils: support ch 3 & 4
Message-Id: <176607193812.209701.4994905607089165654.b4-ty@kernel.org>
Date: Thu, 18 Dec 2025 15:32:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773
Message-ID-Hash: ZXGREQQXRCCDWCNIP3TN5TSSIB4J36P5
X-Message-ID-Hash: ZXGREQQXRCCDWCNIP3TN5TSSIB4J36P5
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZXGREQQXRCCDWCNIP3TN5TSSIB4J36P5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 15 Dec 2025 21:02:12 +0530, Niranjan H Y wrote:
>  Currently the machine driver for tas2783A can only
> support 2 channels. This patch adds support for
> 2 channel playback with 4 device setup.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/8] ASoC: tas2783A: sdw_utils: support ch 3 & 4
      commit: 5965df0670d9f4a092aa111a01c62a450e689c8a
[2/8] ASoC: tas2783A: use custom firmware
      commit: a3b0cd63f212686dd57eacd5d685ac259631248f
[3/8] ASoC: tas2783A: update default init writes
      commit: f8f1f0d8f0255d1e7c758dba9e3deb5a58a51aa1
[4/8] ASoC: tas2783A: fix error log for calibration data
      commit: ce65a90222e94eec1e5b7d0224b4d647af644cdc
[5/8] ASoc: tas2783A: fw name based on system details
      commit: 2bc4b4f77cb70df3ef05b80d0cb19edba17f04a6
[6/8] ASoc: tas2783A: acpi match for 4 channel for mtl
      commit: a6b5629e131c76c4ab8f2036f09a05f976f7eb73
[7/8] ASoC: tas2783A: use acpi initialisation table
      commit: ca8f3611dcf85489cae315f4844cccf858bbe9b3
[8/8] ASoC: tas2783A: read slave properties from acpi table
      commit: 961f20faa4b950c449dc98fa95a056ef368a24fc

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

