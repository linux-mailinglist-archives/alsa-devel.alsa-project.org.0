Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7925D338CC8
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Mar 2021 13:26:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 151301729;
	Fri, 12 Mar 2021 13:25:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 151301729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615551975;
	bh=1sU0DotZcbbIYyj9QF4P3yo6C1y6MqZ/eSG36T9vmpk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=juFFGtfcfxflldv9HmdYHYCSJV7MTpyaUQT0itCbTOfolgn8ZVjFyfgE+UG3Mlfhc
	 Thd1AR4upigj/adYb81yCYc8PUf8MC5RtaSiZ7mvW/+nw+/TQXIp9YfxQjJTbR+NAR
	 ODbbJ90J+0qgs/Lr0as2IH5mFvBB4d536nkpQddI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 27CADF80431;
	Fri, 12 Mar 2021 13:23:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97C68F8032B; Fri, 12 Mar 2021 13:23:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7432F801D8
 for <alsa-devel@alsa-project.org>; Fri, 12 Mar 2021 13:23:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7432F801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="rFfAknAn"
Received: by mail-wr1-x42d.google.com with SMTP id j7so1665784wrd.1
 for <alsa-devel@alsa-project.org>; Fri, 12 Mar 2021 04:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gA35ua4Yb5kX/gYxKzQIpMpiocNgTXC/pKSapK7rZJo=;
 b=rFfAknAn5CJnRejX4QyXzIFMwYrLIm4HeDtYghHnkwcBjzWm4mw9uVi+8lsyFKmg6Q
 Ur+iwXV2EnLl4daPvmsRLkD64G/qP0II7UX7EwwNBOV5zcwEhKxrRsYHRg4FxaTiZNDH
 rOBUOk9yVSoXYcqSklkyDf5aTB14iYxsZvLz7qmkqI478nBi+Mx9+aUAeOuAaXPNwB1L
 RDcWpIotREa04xviaPO5/0AJKENpkeYGESffgMNcxOyspnwLGj0+nxGkorXSZbc32mFZ
 R1U0rKrd7I0Jyqgg8+iPsoZokxoniKhdZTn0SrfTnGl/wrcKW5JADRN5d33zmip5s9R/
 Dn8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gA35ua4Yb5kX/gYxKzQIpMpiocNgTXC/pKSapK7rZJo=;
 b=fP/peefIqz1GfRsIefPDCY7mEcvQTqc0u5N/pteFK5uzB1mnEdPb0nZOuJwHWwu6cd
 o7k3h+ec/VTXdhf2fxOc5oTLf6NDfyixyx8nX8+IrQ+WA30KzsF9JHbTammQMaqVMNrl
 iGSzFELC+TwKf+Oo+46T/2v6g8jQ7qqMZqLC/0KZgiJFFgQfrdf79/JVoRHJTJhf0ZFj
 UJXP7TpeZdpuKK2xeh/RxWfV4N85wWXGXr5dGWp7x8MqhBh/HvCaVXTmSemJlL96ESyF
 qCDlIRLSF9MmbFv3VNJDxDiPmqnfI2JdIMf3FH05RKI8Z0feShhunNCA0cYd8woi7GoJ
 Q2RQ==
X-Gm-Message-State: AOAM533I0O5ESEIzuZ6NxjIj0ctIKZl0OlMjCBTDkm4YnwrkcblaLa2u
 OjoTkcBvvGQ5rElU/PiguLR6pQ==
X-Google-Smtp-Source: ABdhPJxde2aKuylrPArbfyabrQXXX1VMQFK2766pT0EBSLYkk5PaAgVgCylkPI5TKE5otNy07rnPqA==
X-Received: by 2002:adf:9f54:: with SMTP id f20mr13793513wrg.362.1615551783189; 
 Fri, 12 Mar 2021 04:23:03 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id 3sm8804329wry.72.2021.03.12.04.23.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 04:23:02 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	vkoul@kernel.org
Subject: [RESEND PATCH v3 5/5] ASoC: codecs: wsa881x: add static port map
 support
Date: Fri, 12 Mar 2021 12:22:55 +0000
Message-Id: <20210312122255.3143-6-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210312122255.3143-1-srinivas.kandagatla@linaro.org>
References: <20210312122255.3143-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, sanyog.r.kale@intel.com,
 yung-chuan.liao@linux.intel.com
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

Two instances of WSA881x(Speaker Right, Speaker Left) ports
are statically mapped to master ports. Allow the driver to parse
those mappings from device tree.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/wsa881x.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/codecs/wsa881x.c b/sound/soc/codecs/wsa881x.c
index db87e07b11c9..b3568aec0cd0 100644
--- a/sound/soc/codecs/wsa881x.c
+++ b/sound/soc/codecs/wsa881x.c
@@ -1093,6 +1093,7 @@ static int wsa881x_probe(struct sdw_slave *pdev,
 			 const struct sdw_device_id *id)
 {
 	struct wsa881x_priv *wsa881x;
+	struct device *dev = &pdev->dev;
 
 	wsa881x = devm_kzalloc(&pdev->dev, sizeof(*wsa881x), GFP_KERNEL);
 	if (!wsa881x)
@@ -1105,6 +1106,12 @@ static int wsa881x_probe(struct sdw_slave *pdev,
 		return PTR_ERR(wsa881x->sd_n);
 	}
 
+	/* valid port numbers on this codec starts from 1, so skip 0th index */
+	if (of_property_read_u32_array(dev->of_node, "qcom,port-mapping",
+				       &pdev->m_port_map[1],
+				       WSA881X_MAX_SWR_PORTS))
+		dev_info(dev, "Static Port mapping not specified\n");
+
 	dev_set_drvdata(&pdev->dev, wsa881x);
 	wsa881x->slave = pdev;
 	wsa881x->dev = &pdev->dev;
-- 
2.21.0

