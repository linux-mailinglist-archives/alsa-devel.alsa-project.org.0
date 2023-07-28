Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8E0766BB0
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jul 2023 13:30:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2A3183B;
	Fri, 28 Jul 2023 13:29:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2A3183B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690543823;
	bh=RutGFLL00nwxj/1qF/OsAfHR18eTjgSNwXfD/wWVVHE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=k5lhDx4jwY4O5aWL467hTREb/kCWsznVJdotsfZXrbirxqPi2Hx6lTFPCmDAebbuc
	 yUbZh3WQ4XpxDQOs4o9f5H4GLqZj+WF7QSghdOSI6sSTaQEa5iDA0MG6DWSONSFc8y
	 vTkZeumDjlQxGUVT8DB1NFg0FV3xUpL2lj966Is4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96806F80548; Fri, 28 Jul 2023 13:29:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D7CE8F80163;
	Fri, 28 Jul 2023 13:29:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C7895F801F5; Fri, 28 Jul 2023 13:29:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BB1BCF80153
	for <alsa-devel@alsa-project.org>; Fri, 28 Jul 2023 13:28:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB1BCF80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=S9h7ZBuC
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4fbb281eec6so3472436e87.1
        for <alsa-devel@alsa-project.org>;
 Fri, 28 Jul 2023 04:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690543733; x=1691148533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K2Jmh76fX0cC8X5svQlpl0lqLBg/8T7Qn+TkbmMn87g=;
        b=S9h7ZBuCSi0Nut2p7zcsCvS49l7LMk2fQUD6ZCtk3vzETaAV/v/RbDrvVLeqW6KtKX
         dFAfEfF+YpNY7jutfP9MhLts8g94NsTU2yWUwRGiZDREjalRpF72DjJUPD87fuXOvpek
         db6axTaetmJVobJsOdNh5bVSpdIJv91xiwvfV/QM5cj6DSoRqW9bFjMI00ROFMcbfYXY
         gmuy4+XDI8AEPi445GKoex3AnU7NMRn2YNVDHokT7AK2CgHmvAvEFOtcnQepRhBqzCta
         JyO8cCRAr/7b6jIOi5nrjAtbUjeYzzvLQfXIf+AXNlV++0sKT1rDq/R7UI5nDKpfy64n
         uuWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690543733; x=1691148533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K2Jmh76fX0cC8X5svQlpl0lqLBg/8T7Qn+TkbmMn87g=;
        b=WSH3Wv7kO8hW96IqH+2ttl6yy0uxLJM7ZU8THwMJXL4RHwVKhhAbvzIr0WyCtxHFim
         47X3mOjtenSNdYtneJUrAfGij6Jr+2bZbDMCNObIQJd2vUvIqMCHqZsXYYVdb/X4084x
         xBH8oED76ekwf9CxR096YQnJ0VGjqAeFVAyUIf0TGEKpqebdTSpVm0p4E76EKPOEmC+9
         iM5Iou3pdb0o6cGSsZvIn+F8aANpceMMuKbqE2GI4d8aOhROl4rtkz6O7syV3d9qhXVM
         9evkMw67XWbc8D5pXvgl3/Jj/iOC0BgXuaNbfpijcJcZduL0PcLD3a2IGEf3IGL5zCSL
         xSiQ==
X-Gm-Message-State: ABy/qLa4ACytn8+hMx03zyJr3aMVBpQEk6CYJNgZ3PCtXPvGmvB/fWQE
	OyCNKwXDmTEwfqEu9Fy1sYh/eQ==
X-Google-Smtp-Source: 
 APBJJlE8LHHYDebc1KhpOSqEnYawJSpwTyAliGv5Ek3/yrFTWhjeqVKhn92X3qglPd/utyr8ietUhA==
X-Received: by 2002:a05:6512:348f:b0:4fb:8616:7a03 with SMTP id
 v15-20020a056512348f00b004fb86167a03mr1331586lfr.4.1690543733205;
        Fri, 28 Jul 2023 04:28:53 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id
 q10-20020a1cf30a000000b003fbb618f7adsm4011911wmq.15.2023.07.28.04.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 04:28:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] soundwire: qcom: handle command ignored interrupt
Date: Fri, 28 Jul 2023 13:28:48 +0200
Message-Id: <20230728112848.67092-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230728112848.67092-1-krzysztof.kozlowski@linaro.org>
References: <20230728112848.67092-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MMKVQDEYGYPGIYFYKBGO5Z75QSRO6CRI
X-Message-ID-Hash: MMKVQDEYGYPGIYFYKBGO5Z75QSRO6CRI
X-MailFrom: krzysztof.kozlowski@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MMKVQDEYGYPGIYFYKBGO5Z75QSRO6CRI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Qualcomm Soundwire v2.0.0 controller comes with new interrupt bit for
ignored commands.  Add code to handle it in the interrupt service
routine.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soundwire/qcom.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 3ae3e5896308..3061db6adac7 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -61,6 +61,7 @@
 #define SWRM_INTERRUPT_STATUS_BUS_RESET_FINISHED_V2		BIT(13)
 #define SWRM_INTERRUPT_STATUS_CLK_STOP_FINISHED_V2		BIT(14)
 #define SWRM_INTERRUPT_STATUS_EXT_CLK_STOP_WAKEUP		BIT(16)
+#define SWRM_INTERRUPT_STATUS_CMD_IGNORED_AND_EXEC_CONTINUED	BIT(19)
 #define SWRM_INTERRUPT_MAX					17
 #define SWRM_V1_3_INTERRUPT_MASK_ADDR				0x204
 #define SWRM_V1_3_INTERRUPT_CLEAR				0x208
@@ -792,6 +793,17 @@ static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
 				break;
 			case SWRM_INTERRUPT_STATUS_EXT_CLK_STOP_WAKEUP:
 				break;
+			case SWRM_INTERRUPT_STATUS_CMD_IGNORED_AND_EXEC_CONTINUED:
+				ctrl->reg_read(ctrl,
+					       ctrl->reg_layout[SWRM_REG_CMD_FIFO_STATUS],
+					       &value);
+				dev_err(ctrl->dev,
+					"%s: SWR CMD ignored, fifo status %x\n",
+					__func__, value);
+
+				/* Wait 3.5ms to clear */
+				usleep_range(3500, 3505);
+				break;
 			default:
 				dev_err_ratelimited(ctrl->dev,
 						"%s: SWR unknown interrupt value: %d\n",
-- 
2.34.1

