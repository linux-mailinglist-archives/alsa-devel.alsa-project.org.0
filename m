Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9139B9258A3
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jul 2024 12:31:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86A1E14DD;
	Wed,  3 Jul 2024 12:31:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86A1E14DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720002707;
	bh=6uKd3zEd6o2IBq3WPpQXHIDwXFMOpWhIbBFNpjD55Eg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=k9VIfPqO/tirzni2rLEOMSRj3UVXHR998tCOtlBWjquCz3O2bsp+n48ZkvxTSTNVs
	 4mIPCR9YzoEw8zxuuQPHzy8UC3XOufhzXV1DojuyCTpT71MrcDKBpbxFb2Ig6iW2QB
	 rIAZprQsFd+2m5/Z0thS2h+yJVZ2YUCIyJ3gLCPM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03259F805D5; Wed,  3 Jul 2024 12:30:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B8D2F805FA;
	Wed,  3 Jul 2024 12:30:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E4F0F8014C; Wed,  3 Jul 2024 12:28:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7B514F80272
	for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2024 12:18:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B514F80272
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=fBTw6Ki2
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a724b3a32d2so608304866b.2
        for <alsa-devel@alsa-project.org>;
 Wed, 03 Jul 2024 03:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720001776; x=1720606576;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2RGXPX/CSKzMjftTA4WDyZ6uPyqorccsRYB38Y+ET/0=;
        b=fBTw6Ki2KK/QoaKEwRBEP2YyeW33xWR+m5yRj7pqRIuVRuSBRlG0WIj/HyWtm0MeS7
         enOBGySKAxNf6GMx0XDy8072KvlwBcEjP01s2CiiphMwKcQjLCUbD1HZ5kZBIxzU18if
         vmT2K97N515w4hPnPEjY1DCF65iEYuWOMO2wBkVOlYhMS8N4Rn3ESUvsZ08ZJBOp1Vc2
         B3MZDhwxLdKQ39WLxqb0mM1Lqfp/9EErNY1/T7F84jAONiUrVI5JwLTLBih6MA71uvVU
         WMltOlEIKrOLLjT6OTJ7hfkyH+d92VqW/diwEVMKDsphG2DSEh7o9K5EQEeMPJoOxO8J
         cBQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720001776; x=1720606576;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2RGXPX/CSKzMjftTA4WDyZ6uPyqorccsRYB38Y+ET/0=;
        b=hHg+dT3OtwqQV1jdxM0KpLdUo+3XHzIdH+lZg9mAseiJubdoS5P2wmlq869nZfcRJO
         f9rm4N4w/PhMQ6pv6ih+ZMnNMDKTnBGhMEe+z89XPCo5WFXY+NTa75UXs95gFwrqqYEu
         91CZzLudtR7iZLQsHYeq3paI7avzQS0mJs/OkM4B/FK5qcRH6mUyfzcHb50LBxRvUjPQ
         A4G9jFjqY26V6dhS/7xNEyvGHJpep+sUn6+jBkvtw+FQ/sduPIVXOc7HnNQlAY/r7c1n
         cDSMgL+e20D7L3eS3SXDfHKqlfMnW+gpvI58hKbzyRYYVNQ8qyg6rSIMKwfJvF8Msybf
         IsgA==
X-Gm-Message-State: AOJu0YyKDQgf0VPKtWzYDJChiPreFNsDihAffxj2DcLPo37aP1InZFa+
	NvNaM44x+wbStlSuhom228VMMEhkgYliuWEy5JKV6pROFOhofydVxRVcH6YcojQ=
X-Google-Smtp-Source: 
 AGHT+IFpjC/UncuvZVsjweNMYxrJoEVZ09OWbbmaVadtytsY9DAfzhNDTF5hguxVUFge710PE/lfJg==
X-Received: by 2002:a17:906:ce28:b0:a72:7c0d:8fdc with SMTP id
 a640c23a62f3a-a75144631bemr673990966b.14.1720001776609;
        Wed, 03 Jul 2024 03:16:16 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72ab06565csm494291466b.103.2024.07.03.03.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 03:16:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 03 Jul 2024 12:15:56 +0200
Subject: [PATCH 4/9] soundwire: intel: simplify return path in hw_params
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-soundwire-cleanup-h-v1-4-24fa0dbb948f@linaro.org>
References: <20240703-soundwire-cleanup-h-v1-0-24fa0dbb948f@linaro.org>
In-Reply-To: <20240703-soundwire-cleanup-h-v1-0-24fa0dbb948f@linaro.org>
To: Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1567;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=6uKd3zEd6o2IBq3WPpQXHIDwXFMOpWhIbBFNpjD55Eg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmhSTku0e0ZPNzRqNV/p6R7MRgwqF6z2Drikr2X
 zBVT0McBfCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZoUk5AAKCRDBN2bmhouD
 1xzpD/47ioCRH55FERGs7W33sRBsRuCldVHnisxShW4zIspBBmfU+Jfo+bH9fEXFga5oqS8E3G3
 0SOJ5ACjYR3l5UC7lYgFQBUrlLPCFehm1jIPrMcmMpMV5ub/0IPrKvGEirCejtdQ+9FazVcFd2Y
 oX46M4grsOcL06/LtLN9Fl2TMqs8k1B7k3kbLZZRXMLg2dmdxRqxWlMtTmPVh2l9Eo9PEhNPNdl
 2ASelRKxbmfAXpHEUC7cPANXn2JXKaxdLLZf64s13ln3DA1uKQ0YpYUbs27A+hu03UwAY4zjEF7
 tKCQEvedWmRFScBot2e3fBLIsuh7FfiTaT5niF4rmOpA14AutLhj3UFrTSl3Jl7oAKsR5JMU+Eg
 necUljx9SfZcYDYTKzjLntNsL17HBP1xFu1crn2l3iqmS43gg/Q72L2+dXP667INVwJOFPqgDHO
 2PGN3gEn5WOmdt1ZyJwPsB5vBxplg8D5Eml/TXB/7e2xzUC8RyEUy0SqA9UJIUVIRt7sv7FsQYU
 8MU0MYaU8coIKxU+U2lrITGfsqMXy+Gd2BrThJX3Wn1g6gDMgE/gR1VJV9duD8nhvJKPDHzKDV/
 5O0f+6QEa5+m0ColVNshZip7vZ+nsL3D5KoEXvNtneRpXGy/iy/Vi2CqQ3cxGO8KVAt5qsOvLsH
 ahjuM42P2e+E/zw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: 4AWZHVVETF46TKIBGRZ56OQ2YJWSDMJ2
X-Message-ID-Hash: 4AWZHVVETF46TKIBGRZ56OQ2YJWSDMJ2
X-MailFrom: krzysztof.kozlowski@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4AWZHVVETF46TKIBGRZ56OQ2YJWSDMJ2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Remove unused error path (label+goto) to make the code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soundwire/intel.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 01e1a0f3ec39..b4449095b423 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -743,10 +743,8 @@ static int intel_hw_params(struct snd_pcm_substream *substream,
 
 	pdi = sdw_cdns_alloc_pdi(cdns, &cdns->pcm, ch, dir, dai->id);
 
-	if (!pdi) {
-		ret = -EINVAL;
-		goto error;
-	}
+	if (!pdi)
+		return -EINVAL;
 
 	/* do run-time configurations for SHIM, ALH and PDI/PORT */
 	intel_pdi_shim_configure(sdw, pdi);
@@ -763,7 +761,7 @@ static int intel_hw_params(struct snd_pcm_substream *substream,
 				  sdw->instance,
 				  pdi->intel_alh_id);
 	if (ret)
-		goto error;
+		return ret;
 
 	sconfig.direction = dir;
 	sconfig.ch_count = ch;
@@ -774,10 +772,8 @@ static int intel_hw_params(struct snd_pcm_substream *substream,
 
 	/* Port configuration */
 	pconfig = kzalloc(sizeof(*pconfig), GFP_KERNEL);
-	if (!pconfig) {
-		ret =  -ENOMEM;
-		goto error;
-	}
+	if (!pconfig)
+		return -ENOMEM;
 
 	pconfig->num = pdi->num;
 	pconfig->ch_mask = (1 << ch) - 1;
@@ -788,7 +784,7 @@ static int intel_hw_params(struct snd_pcm_substream *substream,
 		dev_err(cdns->dev, "add master to stream failed:%d\n", ret);
 
 	kfree(pconfig);
-error:
+
 	return ret;
 }
 

-- 
2.43.0

