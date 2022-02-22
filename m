Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7384BF7A2
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Feb 2022 13:02:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7783017B6;
	Tue, 22 Feb 2022 13:01:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7783017B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645531325;
	bh=KeHoijlGPwYDj/ey1agbpqvcLCXSfxbw7neMyY12oAo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g01SVwnv7Ilc/502fRvmajI/SfoWdjYb1SrfxhKpN7/hHaLiFRptluaLPj2UdjUzp
	 uuUeQsWRULnSdnOC5EX5bE8AMXrfMoRUaD9tqqlDg9RbV43Ne0ip9HGIVXSSvrjfit
	 +OHIgNTGeKrBd0qhoSC4GrjT/irYx7YU5Z1QnaF8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 002A5F8051D;
	Tue, 22 Feb 2022 13:00:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C837F80516; Tue, 22 Feb 2022 13:00:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB0D7F8012C
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 12:59:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB0D7F8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="hQhF2lYs"
Received: by mail-wm1-x32a.google.com with SMTP id
 n18-20020a05600c4f9200b003806ce86c6dso1606881wmq.5
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 03:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Gs0UQYeLXZEFiZSAa7cijQLwxToifauUEWbaq2HVPLo=;
 b=hQhF2lYshRddH8Qmwv6xe2HTRpj9tSjW0CaazwoE+mE1cgElLDzWzmHuTV4JXiPGBV
 AUCQ3FQZjP57GvQ/sZ+mowISk/cqEhdDw1pCl9dnIXJl2h0YmJVZH8FEMvRGK+Bp0jH9
 a3ll4LnZqjVMJeTYMDzK9pS24gsjGYrCqfo7gnOX93w9EYceBMXSKj//bdtpmuDrZlLA
 5pKTIcQPPBLBxiNwOLzcTtlJL0zUTlATc34BKwdBlTN1vBPOyfahVVMyf907TFJAID4z
 1WJ1NElr9prP+F+zAoLIxcCzvfJNyxWSZPliGfYddxe/hfyeA7s3mPhLGtl4kAXUi0n8
 M3Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gs0UQYeLXZEFiZSAa7cijQLwxToifauUEWbaq2HVPLo=;
 b=htdFl1uA9iZj2bBotZsxyBisFdC/R8ZLndeLivJL5DdfFgm5EYwBjNY7z4WX3VBk6k
 cUjyzw48y1Y8738XSORdG18zAyevxDP95s0tgyEbdGlKBGj5nhk3LLg7NFoM++E0ZgFt
 8eX6RJCnyLGBVgENtm89ko8mspdgYiAy88xzSpcu+iY6/C0eFFIKhQj4/K3malqHqMQ8
 QxyV27OXZfCCuFm7sN4v108KC82TfuBOaIIAJgkbDLy2FsjoYIVKstsqgyUazfbYeAuk
 nl/itOcNdoQb3p2y2BSZgCn1A0RPydZP7cLubonDEeNIDJaW7REA2wL5RZ14YoJSm2Oa
 IpWg==
X-Gm-Message-State: AOAM530zdP/410DHNNRYCLqHJ50ajaUFol6G0PVCrPpy/vGj7oiWjlQw
 iRpWADx3Cv5kQvMRUCP04ovreg==
X-Google-Smtp-Source: ABdhPJyerxVrI5Q29+9f2FJy6PGgtGJNzvbGOEfw9WxIncxMV/L+KX65i3zEOZrwD0cL3u9DIN+fNw==
X-Received: by 2002:a1c:4d09:0:b0:380:e340:bfba with SMTP id
 o9-20020a1c4d09000000b00380e340bfbamr888266wmh.80.1645531194962; 
 Tue, 22 Feb 2022 03:59:54 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id a18sm50014661wrg.13.2022.02.22.03.59.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 03:59:54 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 07/16] ASoC: codecs: wcd938x: fix kcontrol max values
Date: Tue, 22 Feb 2022 11:59:24 +0000
Message-Id: <20220222115933.9114-8-srinivas.kandagatla@linaro.org>
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

