Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB3A776700
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Aug 2023 20:13:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD291826;
	Wed,  9 Aug 2023 20:12:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD291826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691604802;
	bh=dQSxAwTg/Ur8+g1iyJEmUIHV6QtyBHM7QCfl22I5E88=;
	h=From:Date:Subject:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=jvZn5lSHAu2QbP8J9lpvPt433LDLvJfJPN2EPiCx4QkKFcWfgrGj6h8IwrjdSN+ZQ
	 dELZv7wkSBLh4mjpowbp5Ns0wS1QM7CcGLmrEGs6Hk7xkFtSp+2QzC2Rg6Fcn2kY+E
	 wsMJwzdxGdFPsjlDgB2opGmSDSvaFdI9q9UMTUKI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 56DE6F80549; Wed,  9 Aug 2023 20:12:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A42B2F80116;
	Wed,  9 Aug 2023 20:12:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 05E57F80134; Wed,  9 Aug 2023 20:12:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A9B03F800FE;
	Wed,  9 Aug 2023 20:12:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9B03F800FE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QExAzpIx
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AE74C63A7D;
	Wed,  9 Aug 2023 18:12:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CCE1C433C8;
	Wed,  9 Aug 2023 18:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691604737;
	bh=dQSxAwTg/Ur8+g1iyJEmUIHV6QtyBHM7QCfl22I5E88=;
	h=From:Date:Subject:To:Cc:From;
	b=QExAzpIxW8VIhUg0Dx3HmURl8L8cDXikq01/z7xjlsz992JPeLyzHZatsyZdgx8Fe
	 SD8Jaca7/bbEOVQeWY8qiEF9DyRf6lkHZya2xYqHWJQZ9AAEkKTXQ7lG2YsoiYcl8Q
	 76wMGGYPqhdnyqpsLlxdglMv9nWYzowNf3LllrA5d/HNTRUnr9UnCbQhLK5wC34dSu
	 UfPqScmBzgYm68ZLPTVQCa8BzvWtK8SWHZGwk4w2rBG3bChG2LGjWxh4A9RmibSyab
	 QwEapEYqjVHdo1kvwUIrf/LUQNK+H28VSI4xvdTjvushDEew3K+PsYEsgH3ESQJaE3
	 xko1vLC9gP0VA==
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 09 Aug 2023 11:12:07 -0700
Subject: [PATCH] ASoC: SOF: Intel: Initialize chip in
 hda_sdw_check_wakeen_irq()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20230809-intel-hda-missing-chip-init-v1-1-61557ca6fa8a@kernel.org>
X-B4-Tracking: v=1; b=H4sIAPbW02QC/x3MQQqDMBBG4avIrB1I1Urbq4iLOJmaH9pUMiKCe
 HdDl99bvINMM9ToVR2UdYPhlwpudUUSfZqVEYqpcU3rHu7JSKt+OAbPX5ghzSwRS8lYOYjIpH3
 b331H5bBkfWP/34fxPC/UGTIgbQAAAA==
To: broonie@kernel.org, pierre-louis.bossart@linux.intel.com,
 lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com,
 yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
 daniel.baluta@nxp.com
Cc: kai.vehmanen@linux.intel.com, ndesaulniers@google.com, trix@redhat.com,
 rander.wang@intel.com, sound-open-firmware@alsa-project.org,
 alsa-devel@alsa-project.org, llvm@lists.linux.dev, patches@lists.linux.dev,
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1494; i=nathan@kernel.org;
 h=from:subject:message-id; bh=dQSxAwTg/Ur8+g1iyJEmUIHV6QtyBHM7QCfl22I5E88=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDCmXrzPYTvdaPP30JJdUySrx88FcXYe+p3ScPHqfSdrV/
 KerY21vRykLgxgHg6yYIkv1Y9XjhoZzzjLeODUJZg4rE8gQBi5OAZgItxwjw6kXaxRKy0pFy15t
 nhx3bf6RacFfap7fl8itvCgl8+Rc+z2GP1w5N62F+FcE1HD3HLvlE+dx4MH1mxsbXsi8YFB5N8d
 akRUA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
Message-ID-Hash: 55BZCV76LZEKSDYHVGOGQKZNHKZF6SUZ
X-Message-ID-Hash: 55BZCV76LZEKSDYHVGOGQKZNHKZF6SUZ
X-MailFrom: nathan@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/55BZCV76LZEKSDYHVGOGQKZNHKZF6SUZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Clang warns (or errors with CONFIG_WERROR):

  sound/soc/sof/intel/hda.c:423:6: error: variable 'chip' is uninitialized when used here [-Werror,-Wuninitialized]
    423 |         if (chip && chip->check_sdw_wakeen_irq)
        |             ^~~~
  sound/soc/sof/intel/hda.c:418:39: note: initialize the variable 'chip' to silence this warning
    418 |         const struct sof_intel_dsp_desc *chip;
        |                                              ^
        |                                               = NULL
  1 error generated.

Add the missing initialization, following the pattern of the other irq
functions.

Fixes: 9362ab78f175 ("ASoC: SOF: Intel: add abstraction for SoundWire wake-ups")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 sound/soc/sof/intel/hda.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 04c748a72b13..15e6779efaa3 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -420,6 +420,7 @@ static bool hda_sdw_check_wakeen_irq(struct snd_sof_dev *sdev)
 	if (!(interface_mask & BIT(SOF_DAI_INTEL_ALH)))
 		return false;
 
+	chip = get_chip_info(sdev->pdata);
 	if (chip && chip->check_sdw_wakeen_irq)
 		return chip->check_sdw_wakeen_irq(sdev);
 

---
base-commit: 59146c3cd326a622e9041614842346aada11ca99
change-id: 20230809-intel-hda-missing-chip-init-dcccbe6365a4

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>

