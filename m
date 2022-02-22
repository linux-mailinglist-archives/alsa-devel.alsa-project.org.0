Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D884C016E
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Feb 2022 19:34:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F47C1843;
	Tue, 22 Feb 2022 19:33:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F47C1843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645554884;
	bh=a/gDuJqvGpB+h1vShPhG0kbkJ78oLKgRW285jppuhDs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u6IJKGiYuwMSZuu/KIQYM44PQSPtUv/hpoxaU5XJhI8AP6JkGzQuFPDflIigWmYsf
	 z0rL5dfrSxxs51r7llgz5diaeX/adY2V2Sb0Focyg6Yqt6bVyZPJEgeBI36e74WgAd
	 T7qj3H4rfV/1ahLe45MmRxdhw5GK8cpzvZwM8iSI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ABAD6F80516;
	Tue, 22 Feb 2022 19:32:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB0B2F80518; Tue, 22 Feb 2022 19:32:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36785F80118
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 19:32:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36785F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="PUVWweJs"
Received: by mail-wr1-x434.google.com with SMTP id d27so35130664wrb.5
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 10:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2QZz8ASXss+gfpOAKkDwr+gWAwAdXQYtNmwvaBY30o0=;
 b=PUVWweJs2/2O32Gy46OrYrDIIpF+i7Om8rp92BVlIoi95NIXn7DzXPWS1FCmqdRmJ9
 Fq11XK6G3DlSILHq7jq67p6QqaohcX3UDv2bm2LINSWHyZ10UaVCmGixyryIblgZgdbo
 ahZ83ghJDir0lwMemh0wyNjXy4K4vMxd//ito95JwUZBtSFcYoJxLgIStaqu5inIVQc8
 ad/75IsjnGZ6/OaHYcS3j4h2TDZoOocwvqGuuxRyWs8S19+b+PPlC/88JbAGzZD4BtbE
 GfvAbJBVjGvdLnbqOPlHEZIBdl8/tdHNwqGJCM5ADUKprNSFGQfYPIfaS/5akfHq5gRc
 9sRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2QZz8ASXss+gfpOAKkDwr+gWAwAdXQYtNmwvaBY30o0=;
 b=LnJNseIwFduICYeoJt5yJ6ZeWjT+B6vGJN9WtTVCmrTx2HKchiXCv0ySSf9vy+Mazq
 fp4m245gMAzjl1hTsp4E2d55fI1uGMUTL8dfFkRf5Xyzz1/yqUAx4mWj/9vYER5Hnc/6
 +APk1xrIlzkkqrXEFS9nOwlAr3NAcsRwt9Hy3lNqazMYhs1GFjU1rX8FiCrMNjn0Z2Tt
 6mw2K5Z2bzH+NM9GVOpdFSN76VWRrsl1FsvA4wZzxZ7pgLYNQd9PUncW6u9GexUpptV1
 b/iD4XmPbhlfE6HUCaNYVGqANTTs7dSYkSuJaKDEXAOA3+aRCj4QKEhDgFdFINJt3UBr
 Z0ZQ==
X-Gm-Message-State: AOAM531mvhDmSQktNumyMw5JlozqnPYq9j2KgfC+iZO7RYVjGTqPysZk
 Cd/ISVDCuEHvz6hv7X0sFlujdw==
X-Google-Smtp-Source: ABdhPJyxTDVpwUPAosm4aHtqCWhd+dyKFZGHxVAsLjrwCuLfN5Ne4PJ6ODBR/1iomV5X/XXdO5Vq/A==
X-Received: by 2002:a5d:46d2:0:b0:1e4:a653:e010 with SMTP id
 g18-20020a5d46d2000000b001e4a653e010mr21743448wrs.77.1645554750328; 
 Tue, 22 Feb 2022 10:32:30 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id l28sm57642165wrz.90.2022.02.22.10.32.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 10:32:29 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 4/9] ASoC: codecs: va-macro: fix accessing array out of
 bounds for enum type
Date: Tue, 22 Feb 2022 18:32:07 +0000
Message-Id: <20220222183212.11580-5-srinivas.kandagatla@linaro.org>
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

Accessing enums using integer would result in array out of bounds access
on platforms like aarch64 where sizeof(long) is 8 compared to enum size
which is 4 bytes.

Fixes: 908e6b1df26e ("ASoC: codecs: lpass-va-macro: Add support to VA Macro")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/lpass-va-macro.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index 11147e35689b..e14c277e6a8b 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -780,7 +780,7 @@ static int va_macro_dec_mode_get(struct snd_kcontrol *kcontrol,
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	int path = e->shift_l;
 
-	ucontrol->value.integer.value[0] = va->dec_mode[path];
+	ucontrol->value.enumerated.item[0] = va->dec_mode[path];
 
 	return 0;
 }
@@ -789,7 +789,7 @@ static int va_macro_dec_mode_put(struct snd_kcontrol *kcontrol,
 				 struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
-	int value = ucontrol->value.integer.value[0];
+	int value = ucontrol->value.enumerated.item[0];
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	int path = e->shift_l;
 	struct va_macro *va = snd_soc_component_get_drvdata(comp);
-- 
2.21.0

