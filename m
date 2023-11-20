Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9710D7F1D1C
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Nov 2023 20:08:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 127F0E72;
	Mon, 20 Nov 2023 20:08:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 127F0E72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700507321;
	bh=FpvpcXsF6QOAKDHyNhoncj99puNYtYw/t4txj7sygec=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eVXAzH7UDSJKTsRF9jkOWsysOtTGP59l7dUD7eUJv473hBmMH15dKKgU6nynrwJfp
	 Xwf3TS5ABorFbiJf+MaOlweZGnQCdUEXbezZ+txWryPMI44ma/bbLRwgI7ZIH3tYF8
	 LenPKVr6qpezdMd8BuOyQrrzJ6lHH2Z3+CeHrwLI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 70C24F8057E; Mon, 20 Nov 2023 20:07:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 79FB9F8057E;
	Mon, 20 Nov 2023 20:07:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 263ACF802E8; Mon, 20 Nov 2023 20:07:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9D393F80093
	for <alsa-devel@alsa-project.org>; Mon, 20 Nov 2023 20:07:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D393F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=RZ5lHyyc
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-9ae2cc4d17eso647039766b.1
        for <alsa-devel@alsa-project.org>;
 Mon, 20 Nov 2023 11:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700507265; x=1701112065;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fcghsarjrS3tHRySGsk8wGm4K++pTmTjyafJFK3g/Cs=;
        b=RZ5lHyyc1Ww2wMwhj1iR3I2zEa+LNgN221kcnt1VuY9kgrpydVyHfADkb2mEUCEw5X
         Powtvw/A3VnQaWcykgZjglyrk0D00+n0EE8bMs/hdIowhSpNUG1aeRAy/+bhKmxCoNFy
         xTVJzhw5vOkby4I33IB2KFx7cpMga4+swDmk5jLjahe/h17iNy3Fu45KNJdb16htTEts
         h5JB2pAXG6wuIOna2puNFliVFtztdRxwjeE+YtyGMHApBOCho3KeuezCOkOOmtTnQV8v
         9RNSyRtfqBzfmrbYvveOVhQgY0iFtkiD8+35IWDn7zOmOhgpc+U0ZsIKfBmqgIzvYVWH
         AvgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700507265; x=1701112065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fcghsarjrS3tHRySGsk8wGm4K++pTmTjyafJFK3g/Cs=;
        b=ElEtmCDwMKP7Qizshwy8NChKjAbKRAYSBg0s44QJq2+4ok0rbLEsXUndkgMQ2sVQNd
         BZtOGXVBa7Mts08Z8057pREvdf6rVcSGrhHQ/W2QND7jTFsnbVVrp2xBSmEOXvFzHdJS
         V3jOp5SkOJJRl+kAVpUVhpPgwzGP4gHuoqETeZEVlyvg07ACPi17m5wzdS0VTeLvYtix
         73zgMmiq9eYmgn1uW8XwR2C0y4KGc6EXlOpupOgtgRPqs52KlOfLGVQJ8WMMLeYZbYUP
         YKBlja5j3vZYIaiwWgz2h/NZlnpf/mCR6jPnJpTznRTy/5Mq8726eFtOxMU+6CYbADmG
         wv+g==
X-Gm-Message-State: AOJu0Yz7NWFb+wu1XTDYb2jbAScnI4hNOu8jpvK2QdEpas/K0HzW891u
	phJormfVq5cdiRjyxXiPfkynRA==
X-Google-Smtp-Source: 
 AGHT+IFzePfbHnSU85wD/UiMsfBrFBH+dK0SBJM1TR0leyATrt8D374mvtWaZJyFxdwoOqbJ+3B6KA==
X-Received: by 2002:a17:906:3f18:b0:9fe:aacb:bf6a with SMTP id
 c24-20020a1709063f1800b009feaacbbf6amr2737368ejj.69.1700507264786;
        Mon, 20 Nov 2023 11:07:44 -0800 (PST)
Received: from krzk-bin.. ([178.197.222.11])
        by smtp.gmail.com with ESMTPSA id
 a18-20020a1709066d5200b00977cad140a8sm4177521ejt.218.2023.11.20.11.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 11:07:44 -0800 (PST)
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
Subject: [PATCH 2/2] soundwire: qcom: move sconfig in
 qcom_swrm_stream_alloc_ports() out of critical section
Date: Mon, 20 Nov 2023 20:07:40 +0100
Message-Id: <20231120190740.339350-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231120190740.339350-1-krzysztof.kozlowski@linaro.org>
References: <20231120190740.339350-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 63MADI2ZPNTL6M2XLZ6QYU4M6HFIESBF
X-Message-ID-Hash: 63MADI2ZPNTL6M2XLZ6QYU4M6HFIESBF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/63MADI2ZPNTL6M2XLZ6QYU4M6HFIESBF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Setting members of local variable "sconfig" in
qcom_swrm_stream_alloc_ports() does not depend on any earlier code in
this function, so can be moved up before the critical section.  This
makes the code a bit easier to follow because critical section is
smaller.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soundwire/qcom.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 754870a4a047..e9a52c1bd359 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -1160,6 +1160,17 @@ static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
 	int maxport, pn, nports = 0, ret = 0;
 	unsigned int m_port;
 
+	if (direction == SNDRV_PCM_STREAM_CAPTURE)
+		sconfig.direction = SDW_DATA_DIR_TX;
+	else
+		sconfig.direction = SDW_DATA_DIR_RX;
+
+	/* hw parameters wil be ignored as we only support PDM */
+	sconfig.ch_count = 1;
+	sconfig.frame_rate = params_rate(params);
+	sconfig.type = stream->type;
+	sconfig.bps = 1;
+
 	mutex_lock(&ctrl->port_lock);
 	list_for_each_entry(m_rt, &stream->master_list, stream_node) {
 		if (m_rt->direction == SDW_DATA_DIR_RX) {
@@ -1193,16 +1204,6 @@ static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
 		}
 	}
 
-	if (direction == SNDRV_PCM_STREAM_CAPTURE)
-		sconfig.direction = SDW_DATA_DIR_TX;
-	else
-		sconfig.direction = SDW_DATA_DIR_RX;
-
-	/* hw parameters wil be ignored as we only support PDM */
-	sconfig.ch_count = 1;
-	sconfig.frame_rate = params_rate(params);
-	sconfig.type = stream->type;
-	sconfig.bps = 1;
 	sdw_stream_add_master(&ctrl->bus, &sconfig, pconfig,
 			      nports, stream);
 out:
-- 
2.34.1

