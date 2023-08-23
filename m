Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBD7785D58
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Aug 2023 18:34:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2C58847;
	Wed, 23 Aug 2023 18:33:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2C58847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692808440;
	bh=oAGOZ+ekiLiOmp7hE1/xSBjmF1EMKp3By99T76ldHzg=;
	h=From:Date:Subject:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=gxzvESfCzfhz+9ml2VFCwWr2msYxUGCY9kp5TTd7Oon0qJWFtVCRPhz80t+wDuc5g
	 R/Feb4iSCVw3Z4gAbnQ74DPUzLub7GMjeEG4d9wRlJp0vvc2G4u7M0ocZruy+1hgni
	 XY2wxLFfuhf4Bj8b5FTeBKdcWadtnMr6BriPalR4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 79F88F800BF; Wed, 23 Aug 2023 18:33:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 34C50F800D1;
	Wed, 23 Aug 2023 18:33:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E53DF80158; Wed, 23 Aug 2023 18:33:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 68275F80022
	for <alsa-devel@alsa-project.org>; Wed, 23 Aug 2023 18:33:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68275F80022
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KfEEuG4P
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C711963323;
	Wed, 23 Aug 2023 16:33:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A79BC433C7;
	Wed, 23 Aug 2023 16:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692808381;
	bh=oAGOZ+ekiLiOmp7hE1/xSBjmF1EMKp3By99T76ldHzg=;
	h=From:Date:Subject:To:Cc:From;
	b=KfEEuG4PAxY+ze4/trTba3y0v4nzMF2BU5VQfCVQnFpu9pRUZ7Ux3SN75/QrFpzAo
	 MFD6Brikt3mf0knjuDtlvfKsjFOVpLszis5h6+dIcBXSXmxFkhf6OeJnMpl0Suhjbp
	 fXMKS6ja78Kxrp4Ky6hzacwWbjwDctt+8eeWfPbk2uF2qFYibsYCNurqPBr7aWUjNV
	 jRmSmMi4luN/Q48pxbKV6KufC86IzQPlrKe22/CJA+t0YWHOSRlxtfRx0xHg1DfGBz
	 h1hmiNhG66WLAZDwpR9GqTB+sD3W1pNbvMMab3higzVyUnatOzoyR4HOscDsYI+kCD
	 Y02cA9VNqcG8g==
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 23 Aug 2023 09:32:50 -0700
Subject: [PATCH] ASoC: cs42l43: Initialize ret in default case in
 cs42l43_pll_ev()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230823-cs42l43_pll_ev-init-ret-v1-1-5836f1ad5dad@kernel.org>
X-B4-Tracking: v=1; b=H4sIALE05mQC/x3MQQqDMBBG4avIrB2ISVqlVxGRaH/bgZBKEkQI3
 t3Q5bd4r1BCFCR6NYUiDknyCxVd29D6deEDlnc1aaWNGrThNVntrZl372ccLEEyR2Telg62h1N
 P9aBa7xGbnP/zOF3XDdE0twtpAAAA
To: james.schulman@cirrus.com, david.rhodes@cirrus.com,
 rf@opensource.cirrus.com, ckeepax@opensource.cirrus.com, broonie@kernel.org
Cc: lgirdwood@gmail.com, ndesaulniers@google.com, trix@redhat.com,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 patches@lists.linux.dev, llvm@lists.linux.dev,
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1488; i=nathan@kernel.org;
 h=from:subject:message-id; bh=oAGOZ+ekiLiOmp7hE1/xSBjmF1EMKp3By99T76ldHzg=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDCnPTPYo171w2Pom4577NeuFIve5ctWWe6hPO5ci+n2Sl
 vCFvXyKHaUsDGIcDLJiiizVj1WPGxrOOct449QkmDmsTCBDGLg4BWAiJqWMDL8NDPbONpAy98zu
 0lzgG++Uff/7vt1ZdyL9ti07WRGWrM7I8Ej8WpfCI3N3u5163u4vuTd9f/s1nd1pt3cij9BRtfe
 buQA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
Message-ID-Hash: KVOE6T7OH723DXFMRBWUOKTU3ZMWH5YL
X-Message-ID-Hash: KVOE6T7OH723DXFMRBWUOKTU3ZMWH5YL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KVOE6T7OH723DXFMRBWUOKTU3ZMWH5YL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

clang warns (or errors with CONFIG_WERROR=y):

  sound/soc/codecs/cs42l43.c:1371:2: error: variable 'ret' is used uninitialized whenever switch default is taken [-Werror,-Wsometimes-uninitialized]
   1371 |         default:
        |         ^~~~~~~
  sound/soc/codecs/cs42l43.c:1377:9: note: uninitialized use occurs here
   1377 |         return ret;
        |                ^~~
  sound/soc/codecs/cs42l43.c:1349:9: note: initialize the variable 'ret' to silence this warning
   1349 |         int ret;
        |                ^
        |                 = 0
  1 error generated.

Initialize ret to 0 in the default case, as there was nothing to do for
other event types.

Closes: https://github.com/ClangBuiltLinux/linux/issues/1922
Fixes: fc918cbe874e ("ASoC: cs42l43: Add support for the cs42l43")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 sound/soc/codecs/cs42l43.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index 55a79219af35..18178ffa82f2 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -1369,6 +1369,7 @@ static int cs42l43_pll_ev(struct snd_soc_dapm_widget *w,
 			clk_disable_unprepare(priv->mclk);
 		break;
 	default:
+		ret = 0;
 		break;
 	}
 

---
base-commit: 014ee0692f29da8b08fed5da0fa14e04698a50f7
change-id: 20230823-cs42l43_pll_ev-init-ret-fb1e47ea0605

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>

