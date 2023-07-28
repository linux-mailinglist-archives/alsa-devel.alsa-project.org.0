Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8114B766BB1
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jul 2023 13:30:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71E4E207;
	Fri, 28 Jul 2023 13:29:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71E4E207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690543847;
	bh=Pd039UjLSgfEOIJ6mOul7cpS/BFBpKy1AjDe6AZ0SWc=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=b7+mn5pTp59c8ExClyt3DakCSBx0NRPPMpNitDdgx40Zfdbv8QZK0M/Ln4PUOu2vd
	 Y9zfOZ/fO/rJiPWj1GbX13rTvgHH+x/ucbm3iiSKlcGYaG1A52MSkvvIx4U5OcDpdA
	 gA/C6aDfIxxgnX3FXbBSUfaAo0MXB9IfRKBYR0gs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E47D6F80552; Fri, 28 Jul 2023 13:29:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 75C56F80549;
	Fri, 28 Jul 2023 13:29:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 197EEF8019B; Fri, 28 Jul 2023 13:29:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EBDD1F800C7
	for <alsa-devel@alsa-project.org>; Fri, 28 Jul 2023 13:28:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBDD1F800C7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=bOkI9D8d
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3fbc77e76abso20239475e9.1
        for <alsa-devel@alsa-project.org>;
 Fri, 28 Jul 2023 04:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690543731; x=1691148531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BQ34vB3coODdnCqDRzNfJbwKt6237pIU9W1p9j3eoLQ=;
        b=bOkI9D8dNzJpn9aOYEnooCIj1cr2YtJDjjbFmyJvdCWIILWwPhp3mgLj6I3/vayjFC
         wm93ZBG78NEwwxCQWagNXxT98EUSP1Kmvy5PwxiJdEnbrPE4FGZBcFgXP0Yr7sOkbsnb
         NsHP1lST+OyJwaINFmtQOPSJcjS3xHQgvfSeVcfwOCnke2d7tDVwoqTjEGxlCd8hh0+w
         7sNLdIkAcxXjGUtlPX+twW7fjeEhGre1tWsekg9KAjwPfjFP8Kkp849K/We9epd30M4b
         VN6K4Z99oOCGYx0jhqtjxrRwiv7sTEmRPuQTWKB+1Qj0bzWcL367ad9bgsczm97PCDuQ
         y/+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690543731; x=1691148531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BQ34vB3coODdnCqDRzNfJbwKt6237pIU9W1p9j3eoLQ=;
        b=Sys2bN/z6n6GdC4MrFgEP7aa0YUCk7CYxf0ENpQ0RiiIUjRs6UPtQpciFra5vhCJ7z
         91HqfFnE7W79uw+Z7vPLhV9g50y3wuPVxaxK60q/EI8fdH2WlsiEbvm/Uvjm1BNwXjDt
         DcWW8AhX6kn914JZPcum8JZB0y9YfHOULGvfUP7wLoeEiaNtYxmWmy24HdXMEflYGtqe
         k4VyCQJaCwl8XHQKvuV7GOA7U415BLBeF7pSPU30fpxA9QUwpOYnwOL/tcSX7X38KEwX
         chrU5RLoK0LCpFqOz5FYLzeeNi8+fSah2eKpVl0Bsovw2+Ol/hctf8pXuiVdCE5+/Te9
         bm0Q==
X-Gm-Message-State: ABy/qLZ9SwwtKe4zOLatEfOVUnnjd9Fh52SedFVwf4mI4vWDJgYc0Exh
	IZxQHZ3biXU0r2upw4/jwp1Kfw==
X-Google-Smtp-Source: 
 APBJJlHXUGNVhjNXkYvUnBfA5cPneRuKYRGzxZjx6jl9lNQLLXcdU37HddGAzCimNmmjr1yI9PQOkw==
X-Received: by 2002:a05:600c:2208:b0:3fc:a49:4c05 with SMTP id
 z8-20020a05600c220800b003fc0a494c05mr1355381wml.40.1690543731305;
        Fri, 28 Jul 2023 04:28:51 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id
 q10-20020a1cf30a000000b003fbb618f7adsm4011911wmq.15.2023.07.28.04.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 04:28:50 -0700 (PDT)
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
Subject: [PATCH 1/2] soundwire: qcom: use newer link status tregister on
 v2.0.0
Date: Fri, 28 Jul 2023 13:28:47 +0200
Message-Id: <20230728112848.67092-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: P2D2Q6PLT6HFRLUJHW54UWTOASSFGB7D
X-Message-ID-Hash: P2D2Q6PLT6HFRLUJHW54UWTOASSFGB7D
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P2D2Q6PLT6HFRLUJHW54UWTOASSFGB7D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Soundwire v2.0.0 comes with a new register LINK_STATUS for the
FRAME_GEN_ENABLED field (bit indicating that an active frame is
running).  The old register COMP_STATUS is still there and still works,
although the new one is preferred in downstream sources.  Probably
because it allows to choose Soundwire instance per CPU.  Most of the
code allowing to use new register for Soundwire v2.0.0 was already there
as part of commit 312355a6a9f6 ("soundwire: qcom: add support for v2.0.0
controller"), so switch to it in swrm_wait_for_frame_gen_enabled()
function.  This should not have functional impact, because the old
register still behaves correctly.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soundwire/qcom.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index f8fd2eb4a2bb..3ae3e5896308 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -817,8 +817,8 @@ static bool swrm_wait_for_frame_gen_enabled(struct qcom_swrm_ctrl *ctrl)
 	int comp_sts;
 
 	do {
-		ctrl->reg_read(ctrl, SWRM_COMP_STATUS, &comp_sts);
-
+		ctrl->reg_read(ctrl, ctrl->reg_layout[SWRM_REG_FRAME_GEN_ENABLED],
+			       &comp_sts);
 		if (comp_sts & SWRM_FRM_GEN_ENABLED)
 			return true;
 
-- 
2.34.1

