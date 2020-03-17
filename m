Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE864187C03
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Mar 2020 10:28:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 324951847;
	Tue, 17 Mar 2020 10:27:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 324951847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584437322;
	bh=BogpSd9r9QJcIrt33hV7KHki6SjT0m66955rCneaH9k=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GBTimxrgBMP6Ax/BAGYtGzH+vkQj5RPF9sQLTXhyRAFZPdvFLG3leuZhX0KLW+eii
	 gJxIkZnelgQogCERW8ubVFpttCpgJShdz3FmBXtFNBcqBHJikW7xdHY+foArI6A1iw
	 mQ+cacj5FVZAmFEzes7KZYxC7nPLwSnPV4NVBoMY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0ABD1F800CD;
	Tue, 17 Mar 2020 10:27:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29B33F8022B; Tue, 17 Mar 2020 10:26:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6534FF800CD
 for <alsa-devel@alsa-project.org>; Tue, 17 Mar 2020 10:26:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6534FF800CD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="wuD0ztJR"
Received: by mail-wr1-x441.google.com with SMTP id 6so24631567wre.4
 for <alsa-devel@alsa-project.org>; Tue, 17 Mar 2020 02:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SGKeTvW6q46o0z04U45tAiO5ENrZM8rn9zZ0ol15d5I=;
 b=wuD0ztJRI3RLuTITfffwl+JEdhxK6cXwDqiyX+R6eCSfIVykDAIXlkIeJH3BgIJI/V
 k8rsS5TdXj9gSAfu1X0oH/o1PfgARBiIBK0u5RsewiJQQs7Qel8zZySPl2VpuW67FUgh
 /+wcIqaOJetGSGiYSYS5JZKkxP7Kh+VGRW4Hzpvml4CbeIshJEf9RELwt+klC//guK1d
 u2VtoOa1RaKXqkSyjMOQ7x5lxjyLURt/sVd9XSYhu7Qmf1gJY6zRQzkUf7zIrPkcMqB0
 bCo2k9IpzhfbB2ih1/Y9LhsScAEbA2XJGzMSYqdCmzCuIqVhsPkmTj3mHovRuAEV1yV7
 ypIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SGKeTvW6q46o0z04U45tAiO5ENrZM8rn9zZ0ol15d5I=;
 b=azhh1joJSVnNMYk7etsWzzfjytJax8MxgcbBDtW82+L2GKws5fzJu/8Z1lNOHLwRUp
 Zx+Z8QltlkSUDfAr5EPYk9bacm2ItWaEiUKZa5JvzrcVq2lsr49OTDB4KdaWdXVl2B3k
 EXN0Mt5T6nrVyD2NXDj5dhEeSsl1zg4NVqN1lCVF01chg5a91L6yhxi9E0zvm8z/LsPg
 mbYaGtBc9DdgEQZQqSBqpUzstGP0eV93INna+RHtn220l85Nc6EvQKV/jBALZPi1qm77
 a7K8U6jq1WnGNDbMMxqU/od5qq/XMf35pPmnpmJNPdIuYRAEvI3znnSwi5Z9q/O+efKr
 ZRFQ==
X-Gm-Message-State: ANhLgQ10n0V3B8C4FdhHf6UWV9idnINbxLjPf4ebc8ujMC11pUJXCVR1
 WTt5IoNUfSsVG5y3T4kPZhgxgA==
X-Google-Smtp-Source: ADFU+vvsal4oOlKksw/GljEIXMh34Te99+wzC49/nuKJ0Bgp84m/3vQweGyDMeP1xry0AFJ55Vp4gQ==
X-Received: by 2002:adf:a295:: with SMTP id s21mr4917919wra.26.1584437214268; 
 Tue, 17 Mar 2020 02:26:54 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id k12sm3899483wrm.26.2020.03.17.02.26.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Mar 2020 02:26:52 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org
Subject: [PATCH] soundwire: qcom: add support for get_sdw_stream()
Date: Tue, 17 Mar 2020 09:26:45 +0000
Message-Id: <20200317092645.5705-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org
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

Adding support to new get_sdw_stream() that can help machine
driver to deal with soundwire stream.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/qcom.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 440effed6df6..ba810fbfa3c7 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -588,6 +588,13 @@ static int qcom_swrm_set_sdw_stream(struct snd_soc_dai *dai,
 	return 0;
 }
 
+static void * qcom_swrm_get_sdw_stream(struct snd_soc_dai *dai, int direction)
+{
+	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dai->dev);
+
+	return ctrl->sruntime[dai->id];
+}
+
 static int qcom_swrm_startup(struct snd_pcm_substream *substream,
 			     struct snd_soc_dai *dai)
 {
@@ -632,6 +639,7 @@ static const struct snd_soc_dai_ops qcom_swrm_pdm_dai_ops = {
 	.startup = qcom_swrm_startup,
 	.shutdown = qcom_swrm_shutdown,
 	.set_sdw_stream = qcom_swrm_set_sdw_stream,
+	.get_sdw_stream = qcom_swrm_get_sdw_stream,
 };
 
 static const struct snd_soc_component_driver qcom_swrm_dai_component = {
-- 
2.21.0

