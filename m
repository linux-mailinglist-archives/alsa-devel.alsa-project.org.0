Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF32F4C0177
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Feb 2022 19:36:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6884A182B;
	Tue, 22 Feb 2022 19:35:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6884A182B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645554982;
	bh=OTqe7P6ZDt3BcL/rzHwWxH0caW7iOvtaHWapELEE1Oc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pRJStpd2DhDhlJk/QmrCmYKDAQXXZwRk0n3AiSu3VeAUGuxzgo838ZIj4dqWXQcI3
	 SFGOR//YkVsROJsjjeoh3g9SB+eA34cCwQNCYoyNGsjKWLVNnnKfNcenGwz6ayUGl5
	 Qe/6u18Tn1sDop0r+Ny24kj1ErRVgteVIin3K53U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49CEFF8053B;
	Tue, 22 Feb 2022 19:32:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B689F80534; Tue, 22 Feb 2022 19:32:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98A7CF804FD
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 19:32:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98A7CF804FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="sfphTkw+"
Received: by mail-wr1-x42e.google.com with SMTP id u1so35073229wrg.11
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 10:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9SOM2m1l2t9AVsCxObqTWKpNPnvoS4HHumlCtnLuW+M=;
 b=sfphTkw+TIFpSiVfPCDWpMWe0C1Hsg7TxDv/6tfs6owKtzUL1mTcl48e3eStB74Lry
 uIssrDlUyTqB/NWDuogXlOJicUGDIxOIRoOklIWCxm/G59moqOpR/KO2kpdJAvB9Dbjb
 OpNJsrrUggRFjN3EJ9mi+XzfPV36vrKFTxix6WBQRJGaphTeLj837GYeNQ+67NZZRZ33
 CzFcOzTK8yOoOIh8/noDccHBda9/RW/EpdSy7Lkoh7h9ohKJDcJzrlGWNx/N6TrPhC0p
 Nyon9yBws48hbyhjumRz7VOjjcOhMGNOShwsB/3BQnJYZCi+3FsHMYCACVW+rdSr7KNB
 1p+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9SOM2m1l2t9AVsCxObqTWKpNPnvoS4HHumlCtnLuW+M=;
 b=MPEeumZxIykFbBzaLR0lOrOUD6xqdihAvrNEb4Qpoq6AL81DpGLbYemjUXfZiLwJK7
 OZDRSX42hqaAiIH+Ro2VR6zE2rkiu0eqlftZrU+fGJYTLpC8GqpF3/9s+TUTeics8GNw
 qXVpHRs8q4vzsi06RQJ6vb54Fe3p97PRtnp95bFWmOzDEcdWZol29CUu2/PKq7AiobRd
 K9TfHpleVCEcsh4R67/Y+5P6qVPyqdU5utK8msfjRuRqIQ3rw1ywvUIDJGYXyoqH1y7W
 E6lYf3F9mU3c9zz0Df4nNQ8VzVJskqpAEwf0dmyi+YKzbSoDis7mv6zS5hW5bJreFtcu
 17Yg==
X-Gm-Message-State: AOAM533b/cMeFzzwC0H5vKQqXis79KpUYY5l/k/FY7CTOCZCgOIN5qZ7
 IBzY36+EYlBA49xwRMfMQmnQxQ==
X-Google-Smtp-Source: ABdhPJzB9kZCiPNVRCRgOj5KpMPtb6jZTEiWIL2vVd2Ge5yGwr0q0OgrFnxxtDDpv23Msgbzlkcb2Q==
X-Received: by 2002:a05:6000:3c6:b0:1e4:a380:bb53 with SMTP id
 b6-20020a05600003c600b001e4a380bb53mr20490779wrg.559.1645554754454; 
 Tue, 22 Feb 2022 10:32:34 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id l28sm57642165wrz.90.2022.02.22.10.32.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 10:32:34 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 8/9] ASoC: codecs: wcd934x: fix kcontrol max values
Date: Tue, 22 Feb 2022 18:32:11 +0000
Message-Id: <20220222183212.11580-9-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220222183212.11580-1-srinivas.kandagatla@linaro.org>
References: <20220222183212.11580-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 quic_srivasam@quicinc.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

set "HPH Type" Kcontrol max value of WCD_MBHC_HPH_STEREO instead of UINT_MAX.
set "HPHL/R Impedance" Kcontrols max value to INT_MAX instead of UINT_MAX as
max field is integer type.

Without this patch amixer for these controls will show -1 as max value to userspace.

Fixes: 9fb9b1690f0b ("ASoC: codecs: wcd934x: add mbhc support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/wcd934x.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index 6c468527fec6..f2674905a4a7 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -3023,14 +3023,14 @@ static int wcd934x_hph_impedance_get(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 static const struct snd_kcontrol_new hph_type_detect_controls[] = {
-	SOC_SINGLE_EXT("HPH Type", 0, 0, UINT_MAX, 0,
+	SOC_SINGLE_EXT("HPH Type", 0, 0, WCD_MBHC_HPH_STEREO, 0,
 		       wcd934x_get_hph_type, NULL),
 };
 
 static const struct snd_kcontrol_new impedance_detect_controls[] = {
-	SOC_SINGLE_EXT("HPHL Impedance", 0, 0, UINT_MAX, 0,
+	SOC_SINGLE_EXT("HPHL Impedance", 0, 0, INT_MAX, 0,
 		       wcd934x_hph_impedance_get, NULL),
-	SOC_SINGLE_EXT("HPHR Impedance", 0, 1, UINT_MAX, 0,
+	SOC_SINGLE_EXT("HPHR Impedance", 0, 1, INT_MAX, 0,
 		       wcd934x_hph_impedance_get, NULL),
 };
 
-- 
2.21.0

