Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 465844BF7C2
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Feb 2022 13:04:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE59B183A;
	Tue, 22 Feb 2022 13:03:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE59B183A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645531469;
	bh=OTqe7P6ZDt3BcL/rzHwWxH0caW7iOvtaHWapELEE1Oc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VusFo0/ar9nbgEZcz802OpUTtKud1ubhszwutSYrZEO/YqIzEVecdlU5nwKQlKqx+
	 WDLp3/B7ATUxs9rThKEu1SR/gKfb0xJELI9oFkbyvubLCPKQSUrw9b8AtPNuXn0FPH
	 g40bfHb8w5C/IN0nRR05ZtNkGIUhaI/yQV9YZyqM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA693F80548;
	Tue, 22 Feb 2022 13:00:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21458F80529; Tue, 22 Feb 2022 13:00:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 40F02F8051C
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 12:59:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40F02F8051C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Ws7XkwwK"
Received: by mail-wm1-x335.google.com with SMTP id
 n29-20020a05600c3b9d00b00380e379bae2so211766wms.3
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 03:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9SOM2m1l2t9AVsCxObqTWKpNPnvoS4HHumlCtnLuW+M=;
 b=Ws7XkwwKIezWgelZILQpFNUflefi0UZ+gNdHXODwz5Wgz6M7G4Lkz03OEg8ypHxZSh
 F1dAdWeyAZAq/ggyhtolZpE13XXYYVaZHSHu1k2Lnk4ASX7aXK8xXL0mj6yGKxZeqbLi
 I+DNvCVWd2qRSyMKkFs1GpZyBSI6fAbUTHA6jzXS2lQHOEn/zrHOBiH+Bad2DUGbq26E
 3CIXJU2YwhumujO1PvGEQFUqWQ3sfAwWig01vvqeznAA+YaHlz/Tzxjrsaz2iZVheRZ6
 DSD2sDIWZpRw0TjFCniFsNcLLfp9VAUbEG37WPP3dlQykVOMA+1ZoESKqRirFR+Qxb0C
 oRXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9SOM2m1l2t9AVsCxObqTWKpNPnvoS4HHumlCtnLuW+M=;
 b=cH2suXlUDZSrOr9DHhYs3rn/RodPSw/C4Do50VB4AKbpxfEn00NQ9Y4YtDGucm2vVD
 7jHvRP3w6kpLqVpjfWqrql6fX+0kAAq1rsN6t+6Gs09cyNwUp7ZoSbv1PaLiB8rFPujf
 1bEf8zbLU08CWOsjHBLvvLBd5R9sWjZxYrmPE6XtvE4G+YLvEA4reX6EY/MhpX3bb95W
 qzKueMtFL7J7k9/oodv71Ufh4RYDzRsNsO/NdIeWdY13KfZkM31KY6p3QOUKF164QZie
 IfyxwlNWbBjdDUkOAS2VaGLp8Nk2HhYyY8hz8zr7DYhh3L5Q9UrWVanGO0lb7+Iju9kz
 OewA==
X-Gm-Message-State: AOAM533yaCXx9VnDOvrS1cjcbq8AhrXXLvuqDtbSeiekcb4nr4/kND5g
 40hb2yIrRzrMIcjyfRAxfvxI/A==
X-Google-Smtp-Source: ABdhPJzqXjAvt+WjhqvdqALlx7KBzS2s2u+JGKdes+D0KUZHJe2rkc1SqLbt7miNgQbZuB+oG+Iv1Q==
X-Received: by 2002:a7b:c159:0:b0:37c:c0d5:6534 with SMTP id
 z25-20020a7bc159000000b0037cc0d56534mr3022313wmi.182.1645531195942; 
 Tue, 22 Feb 2022 03:59:55 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id a18sm50014661wrg.13.2022.02.22.03.59.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 03:59:55 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 08/16] ASoC: codecs: wcd934x: fix kcontrol max values
Date: Tue, 22 Feb 2022 11:59:25 +0000
Message-Id: <20220222115933.9114-9-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220222115933.9114-1-srinivas.kandagatla@linaro.org>
References: <20220222115933.9114-1-srinivas.kandagatla@linaro.org>
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

