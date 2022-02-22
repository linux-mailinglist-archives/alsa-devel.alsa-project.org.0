Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 385534C0173
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Feb 2022 19:35:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1E871843;
	Tue, 22 Feb 2022 19:35:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1E871843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645554951;
	bh=KeHoijlGPwYDj/ey1agbpqvcLCXSfxbw7neMyY12oAo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tpFVDT5wtkivd5LQK9oqoT0R2d3sqB+LnKsEyIs3y64QrRjiUlcOLRk1hFaSTkat1
	 c8xxY7Dt7nOmPQWSmPc8IEFfAo6xHh/+VNHxasf1tf6wr5ZQNa4zdcdJyvHcz5z9Kc
	 gobm3CA0M66VUvSRO91zbLTmWcjQQ52VKnuggD9U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F2D5F8052D;
	Tue, 22 Feb 2022 19:32:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44F67F8051F; Tue, 22 Feb 2022 19:32:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC950F80516
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 19:32:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC950F80516
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="SG8yKfuD"
Received: by mail-wr1-x42b.google.com with SMTP id d17so241308wrc.9
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 10:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Gs0UQYeLXZEFiZSAa7cijQLwxToifauUEWbaq2HVPLo=;
 b=SG8yKfuDMo92Gj+ppDPWnH5Z/qVOKABWnTVjTMNpa5Blh2Lh7NmjPfENG/wwsBjGym
 gZQTS7fycdhAyz/lVF7KAqAjbpy8a/or4Dk3cQC7HAxo1Yzmj9oreNJtPBHiQkUxvVVD
 gOMKXgrFD+VD1YeWaBjA0x65zJlhaX4olAuUpJm9M4s8rnrPhFgaX43CjdyFYtX43SLo
 2B/FiQyuL8+6ALRpNVzEDqT1dM3rsOFDR1jzvPi0tYx2NIdAJnOnAODkHSu4bwWcInLW
 4jPwv+ULu9yNl/Tzl+dqpBDGLrS6p+/9hSaLT5U5hxtBEa71KZv4if7zn/87DjG7j5TB
 Cq0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gs0UQYeLXZEFiZSAa7cijQLwxToifauUEWbaq2HVPLo=;
 b=ypszIZMIpacHnNSXTl2eu2WBjZl9Uvc+j1nRo4zjZlaAUSZQhr0ejPWjpJND+p3Ko1
 dgnrVd48cKquMLgml9tfz1JIkjM0l+JKR5fpkZGi62iJ28xdfipOwSRYT7c7vYMmPqAk
 U9RdpJc1WSM68BvSabV/YNV9wvjfvMG/GQov0uhAufQFW+UWMUK9/dmTSXSsHuTeoQ3r
 SvDM3UZcy2vWdus17Au1+VDLLwhZN3GQyBwGGUEOdknAp0gdXlICvTJHaJvgFuPkzhvq
 hwyT67zEE/u4ABW62+k7b2rm8kUPKmhSbcFe/91UDQX/0zAfoMFQHzsO16dtFjOmkwnO
 db7w==
X-Gm-Message-State: AOAM532ilwPnNvkTP3YTOdXB3D90eXDmObarqWrKLrbf2G4/tQrAtH/R
 r0XWVfBsNATDVvYFvRNZ9pt+cg==
X-Google-Smtp-Source: ABdhPJx9ufhte9u4mOwDexPtu1IQtPstNEvnTrTxaGq3xRUlczgS5HyGu7VLb7Ai7VgEWDiOd3HhMA==
X-Received: by 2002:a5d:45ca:0:b0:1ea:9bf9:ce5a with SMTP id
 b10-20020a5d45ca000000b001ea9bf9ce5amr2408659wrs.620.1645554753408; 
 Tue, 22 Feb 2022 10:32:33 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id l28sm57642165wrz.90.2022.02.22.10.32.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 10:32:33 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 7/9] ASoC: codecs: wcd938x: fix kcontrol max values
Date: Tue, 22 Feb 2022 18:32:10 +0000
Message-Id: <20220222183212.11580-8-srinivas.kandagatla@linaro.org>
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

Fixes: bcee7ed09b8e ("ASoC: codecs: wcd938x: add Multi Button Headset Control support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/wcd938x.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index deecc83eb592..782877db8c3c 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -3577,14 +3577,14 @@ static int wcd938x_hph_impedance_get(struct snd_kcontrol *kcontrol,
 }
 
 static const struct snd_kcontrol_new hph_type_detect_controls[] = {
-	SOC_SINGLE_EXT("HPH Type", 0, 0, UINT_MAX, 0,
+	SOC_SINGLE_EXT("HPH Type", 0, 0, WCD_MBHC_HPH_STEREO, 0,
 		       wcd938x_get_hph_type, NULL),
 };
 
 static const struct snd_kcontrol_new impedance_detect_controls[] = {
-	SOC_SINGLE_EXT("HPHL Impedance", 0, 0, UINT_MAX, 0,
+	SOC_SINGLE_EXT("HPHL Impedance", 0, 0, INT_MAX, 0,
 		       wcd938x_hph_impedance_get, NULL),
-	SOC_SINGLE_EXT("HPHR Impedance", 0, 1, UINT_MAX, 0,
+	SOC_SINGLE_EXT("HPHR Impedance", 0, 1, INT_MAX, 0,
 		       wcd938x_hph_impedance_get, NULL),
 };
 
-- 
2.21.0

