Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A6499017
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 12:00:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9448F167B;
	Thu, 22 Aug 2019 11:59:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9448F167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566468008;
	bh=wzeUiIOlmOORD8yTAOpzdngsKg6Lcuj95UgyukRizvc=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FfaAWqMffNyJu3BlCBBGJgdEovca1Dndjx3BVamQjp4fwZF5HDa4aa3hXUJvuU1Jm
	 Wp0INhbgXywmz8Eo4DHynmmDun/k8BrnSMl+qRLxFglz1Qykotpmz3EKFJPJyrCRbH
	 0deuBjpsyv0eYInxOcEKPdT2i+r6yPEV3hbZ7lpE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22E20F805A1;
	Thu, 22 Aug 2019 11:57:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54336F803F3; Thu, 22 Aug 2019 11:57:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77828F8036D
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 11:57:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77828F8036D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="KNnlO3AS"
Received: by mail-wm1-x344.google.com with SMTP id i63so5099788wmg.4
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 02:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7lEwavhf3fUGzkEL5MEZgCjXL2zMuro3WN6EEJNDNjU=;
 b=KNnlO3ASgv4ah2d8gdkaMFHttHgLNVvTnm4UPZ74Eqwfy7YLV+R7o/vIGBjnfyEh9E
 Xv1tzEw7a0qZuTR4qmbCKAeMqQFEJyk4L2SOdZhCRPcm2dCoG58ReEhEDi5blIeHiiFd
 VzKuaX13KfllCzPzSn3OiuysWFMb1eZQ9VePTg63dOcHiSVD6LX0OHU6EyaTuK1MaPx3
 Fq1QgUzvgl/WKVRERRfykRgAnriXiGyZZPViuba/+Tlcbhv76oHh3cPV1qcdbAYWX27j
 lcydCzTlT7ABHQBsbCx7if52dsaxPcdMPGkyCSfG9L4xAE8gEzVYW0iXOkFs0llHuKFV
 XmDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7lEwavhf3fUGzkEL5MEZgCjXL2zMuro3WN6EEJNDNjU=;
 b=O3zqZHljE3O+1bpgijyvnw0fcUVvYgj2OCNYbCFtIBBCfzjesSvFsCUCb2ByZsJfS6
 azFnA6wnz5QWvUpDVOQAMaiZCfwVwbCXY3Ei0WZYdeyXmDnNTRQZx9yf4lYdg12mANw0
 Z/ZcPOJAvBXiSEW6VRyLSnjsgIwy5mqzf/VYEl6oU8DO7zBfJIbzCne3F266cdbwI6SN
 mmGUrI1HgaXqtJZq/l7nqAOMRJ4UDJcphGPObAPaZRhAqmUHgtXPNFG7ErfBP3BFPWj1
 Zrco/Uu4Fv/iRSClDve+EtsreMCRzfTNJxDF0J7WxzaoWWMSde/S+VBatCepaJ/iial4
 JFhQ==
X-Gm-Message-State: APjAAAVbVUQhOkiUGsfvGSdZ3/a2Ke9QEoY7IzyVn9UHvN18DdnNFAOO
 HQzLVxLymFwHviHW+t77RZFW/Q==
X-Google-Smtp-Source: APXvYqwUnYGJLfqkiROJD+X4tEsIDFB40pxu7PvSCUNNiAEanKhCCKYvuvg1SrblgBqPqyIcx/v9bg==
X-Received: by 2002:a1c:4c06:: with SMTP id z6mr5154610wmf.47.1566467849478;
 Thu, 22 Aug 2019 02:57:29 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id t24sm3298909wmj.14.2019.08.22.02.57.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2019 02:57:28 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	tiwai@suse.de
Date: Thu, 22 Aug 2019 10:56:50 +0100
Message-Id: <20190822095653.7200-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190822095653.7200-1-srinivas.kandagatla@linaro.org>
References: <20190822095653.7200-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 Vidyakumar Athota <vathota@codeaurora.org>, spapothi@codeaurora.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, plai@codeaurora.org
Subject: [alsa-devel] [PATCH v2 1/4] ALSA: pcm: add support for 352.8KHz and
	384KHz sample rate
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Vidyakumar Athota <vathota@codeaurora.org>

Most of the modern codecs supports 352.8KHz and 384KHz sample rates.
Currenlty HW params fails to set 352.8Kz and 384KHz sample rate
as these are not in known rates list.
Add these new rates to known list to allow them.

This patch also adds defines in pcm.h so that drivers can use it.

Signed-off-by: Vidyakumar Athota <vathota@codeaurora.org>
Signed-off-by: Banajit Goswami <bgoswami@codeaurora.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 include/sound/pcm.h     | 5 +++++
 sound/core/pcm_native.c | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 1e9bb1c91770..bbe6eb1ff5d2 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -117,6 +117,8 @@ struct snd_pcm_ops {
 #define SNDRV_PCM_RATE_96000		(1<<10)		/* 96000Hz */
 #define SNDRV_PCM_RATE_176400		(1<<11)		/* 176400Hz */
 #define SNDRV_PCM_RATE_192000		(1<<12)		/* 192000Hz */
+#define SNDRV_PCM_RATE_352800		(1<<13)		/* 352800Hz */
+#define SNDRV_PCM_RATE_384000		(1<<14)		/* 384000Hz */
 
 #define SNDRV_PCM_RATE_CONTINUOUS	(1<<30)		/* continuous range */
 #define SNDRV_PCM_RATE_KNOT		(1<<31)		/* supports more non-continuos rates */
@@ -129,6 +131,9 @@ struct snd_pcm_ops {
 					 SNDRV_PCM_RATE_88200|SNDRV_PCM_RATE_96000)
 #define SNDRV_PCM_RATE_8000_192000	(SNDRV_PCM_RATE_8000_96000|SNDRV_PCM_RATE_176400|\
 					 SNDRV_PCM_RATE_192000)
+#define SNDRV_PCM_RATE_8000_384000	(SNDRV_PCM_RATE_8000_192000|\
+					 SNDRV_PCM_RATE_352800|\
+					 SNDRV_PCM_RATE_384000)
 #define _SNDRV_PCM_FMTBIT(fmt)		(1ULL << (__force int)SNDRV_PCM_FORMAT_##fmt)
 #define SNDRV_PCM_FMTBIT_S8		_SNDRV_PCM_FMTBIT(S8)
 #define SNDRV_PCM_FMTBIT_U8		_SNDRV_PCM_FMTBIT(U8)
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 703857aab00f..11e653c8aa0e 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -2170,7 +2170,7 @@ static int snd_pcm_hw_rule_sample_bits(struct snd_pcm_hw_params *params,
 
 static const unsigned int rates[] = {
 	5512, 8000, 11025, 16000, 22050, 32000, 44100,
-	48000, 64000, 88200, 96000, 176400, 192000
+	48000, 64000, 88200, 96000, 176400, 192000, 352800, 384000
 };
 
 const struct snd_pcm_hw_constraint_list snd_pcm_known_rates = {
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
