Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5DD33C302
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Mar 2021 18:00:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF0E61801;
	Mon, 15 Mar 2021 17:59:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF0E61801
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615827626;
	bh=1sU0DotZcbbIYyj9QF4P3yo6C1y6MqZ/eSG36T9vmpk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A9uI9j2HvqHI1+Hx37mnI97AjZegd+UV2WmyhMBtSLufrf8sl89LMhxbatNUx4WVQ
	 lj8dLtJ41q/7ei4pqQDOKdHNhTm6SITIEDvrOkz9vOr3uGZxzAyBaaaenXPNf2p21L
	 ZZQ3IknI77WOBNg8sJzMbp5+D3G3RLbsajJ9ZOrU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78008F804A9;
	Mon, 15 Mar 2021 17:57:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AEC9BF802DB; Mon, 15 Mar 2021 17:57:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7D37F80171
 for <alsa-devel@alsa-project.org>; Mon, 15 Mar 2021 17:56:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7D37F80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="D+RkpBUZ"
Received: by mail-wr1-x434.google.com with SMTP id 61so6045531wrm.12
 for <alsa-devel@alsa-project.org>; Mon, 15 Mar 2021 09:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gA35ua4Yb5kX/gYxKzQIpMpiocNgTXC/pKSapK7rZJo=;
 b=D+RkpBUZvmx2ksCWz/nuPCkQks6oZo5RNsym556b8uzRQERFm2Km0gQB96/n5mO/nL
 XvAih+bknAm8O2nbaQvc8g5BYvk+hE2TDeKhlhf9rZH3n77WHWFzF4mUBttPZu34s2aK
 tdmjEVI13eH4SWbH4rtQy2IWpZ0XuumM5VH5tBpylqgtMS9iCl4F5b4C9Va0taLfDLVa
 YcmGNnOHLJS6kr2YGxgHQlMtUFfH6pZ61nXmZWzlmaZuu2TGex0eEd1q9m/Rh1/Iy4Yl
 SsFURVQHig3gX4JF/WhaSrIcxU3V6gkN8qc54qCtUVomZd29YKHv2+ytE9onqvjT35hr
 nCJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gA35ua4Yb5kX/gYxKzQIpMpiocNgTXC/pKSapK7rZJo=;
 b=jiPVJxLW+Ig75t/sWxxkCvBXldO9EDbs/5je8hJ1Ylnr2a7NLMQLgrUjozZ+QLpoLd
 2UrAefnzS6m74incVe3InMOuIe1nNQevwzvDTmf5TkUhbSG68nWoujeiY7O+UTff16GG
 I6lXWLvxdFtpfSk3ZndKSLaCRKFdV35VC20Uh2tGsLi1Go/FAbINTka0O5w6vu1DlJra
 rNqQlswVTMTfjGoLK8+BHr+PdIESSl4g3JHcCzHiAsDdMdlQn9jdAFz7sWNvF+A8QK6E
 3Cv5Eic7I4wJgzpFn31XvS4agFFVs8WGM7MfMPVMe0CpeCytKAKXV2bHszUgHyIShYg4
 prvg==
X-Gm-Message-State: AOAM531EeD3xBkpaZ9YCwCB7nQCiDNpAZu6S9DkA2BXZx0kYJ4QOZvx3
 5mAufcgcUTZscumwZV3r9jzMPg==
X-Google-Smtp-Source: ABdhPJxRes1KXiUtFYzyJmPqYvE0hS2ibaUnRcVamO96i5/EH7joHzxqesr8UwYW9dvBa4itDTaALg==
X-Received: by 2002:a05:6000:114e:: with SMTP id
 d14mr611460wrx.236.1615827418929; 
 Mon, 15 Mar 2021 09:56:58 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id o2sm227656wmc.23.2021.03.15.09.56.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 09:56:58 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	vkoul@kernel.org
Subject: [PATCH v4 5/5] ASoC: codecs: wsa881x: add static port map support
Date: Mon, 15 Mar 2021 16:56:50 +0000
Message-Id: <20210315165650.13392-6-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210315165650.13392-1-srinivas.kandagatla@linaro.org>
References: <20210315165650.13392-1-srinivas.kandagatla@linaro.org>
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

