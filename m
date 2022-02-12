Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E49024B34FA
	for <lists+alsa-devel@lfdr.de>; Sat, 12 Feb 2022 13:26:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7341C1898;
	Sat, 12 Feb 2022 13:25:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7341C1898
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644668805;
	bh=6etDxp3Ky/agh9twXmdm/jmH028qgl0pgNwwehLQ9FA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m6EPIS0+1tSStHcVWaPVOZe+OOqtPj103R3DWUEc3rG8MR8Xh+X/Ja6iU+If5hLnb
	 lFICr9E0Q+PSR8nwP6BlAlrw9Eb4RbggtBWpyBJkiQRYpqCCON9GCIETbGfAt4gTEf
	 fREzTpaw9FudI4QUAY5DZH5KUGBs69cZxKJ16Ysc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 070B0F804E0;
	Sat, 12 Feb 2022 13:25:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 081C1F804B4; Sat, 12 Feb 2022 13:25:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3D273F800BF
 for <alsa-devel@alsa-project.org>; Sat, 12 Feb 2022 13:25:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D273F800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="F/CoDgs+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644668703; x=1676204703;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=TEMYFhk0n4HsdRun8CXSQrSB6m779nzdiTPZlRDB+Wo=;
 b=F/CoDgs+Sy1Cvm7FSsBtg5qnWQMss5mZkxQIz/C98O+ruXPaDn3MVBWb
 ObeX8omyTyye0/Lu7qnCPiSXTeE9ZLg1lRGExumGx62RvoE8YAteLtZhI
 fXxMFjJp5HmjlLDnCMVXIGSLXZUZQXJV87deKN3iZF5qYi8qpRT1O7Cak Y=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 12 Feb 2022 04:24:59 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2022 04:24:59 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Sat, 12 Feb 2022 04:24:58 -0800
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Sat, 12 Feb 2022 04:24:52 -0800
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
To: <agross@kernel.org>, <bjorn.andersson@linaro.org>, <lgirdwood@gmail.com>, 
 <broonie@kernel.org>, <robh+dt@kernel.org>, <quic_plai@quicinc.com>,
 <bgoswami@codeaurora.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <srinivas.kandagatla@linaro.org>, <rohitkr@codeaurora.org>,
 <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <swboyd@chromium.org>, <judyhsiao@chromium.org>
Subject: [PATCH 1/2] ASoC: codec: wcd938x: Add switch control for selecting
 CTIA/OMTP Headset
Date: Sat, 12 Feb 2022 17:54:31 +0530
Message-ID: <1644668672-29790-2-git-send-email-quic_srivasam@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1644668672-29790-1-git-send-email-quic_srivasam@quicinc.com>
References: <1644668672-29790-1-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Cc: Venkata Prasad Potturu <quic_potturu@quicinc.com>,
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
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

Add switch control for selecting CTIA or OMTP Headset by swapping
gnd and mic with the help of GPIO.

Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
---
 sound/soc/codecs/wcd938x.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index eff200a..08d16a9 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -194,6 +194,7 @@ struct wcd938x_priv {
 	int ear_rx_path;
 	int variant;
 	int reset_gpio;
+	int us_euro_gpio;
 	u32 micb1_mv;
 	u32 micb2_mv;
 	u32 micb3_mv;
@@ -4196,6 +4197,33 @@ static void wcd938x_dt_parse_micbias_info(struct device *dev, struct wcd938x_pri
 		dev_info(dev, "%s: Micbias4 DT property not found\n", __func__);
 }
 
+static bool wcd938x_swap_gnd_mic(struct snd_soc_component *component, bool active)
+{
+	int value;
+
+	struct wcd938x_priv *wcd938x;
+
+	if (!component) {
+		dev_err(component->dev, "%s component is NULL\n", __func__);
+		return false;
+	}
+
+	wcd938x = snd_soc_component_get_drvdata(component);
+	if (!wcd938x) {
+		dev_err(component->dev, "%s private data is NULL\n", __func__);
+		return false;
+	}
+
+	value = gpio_get_value(wcd938x->us_euro_gpio);
+
+	gpio_set_value(wcd938x->us_euro_gpio, !value);
+	/* 20us sleep required after changing the gpio state*/
+	usleep_range(20, 30);
+
+	return true;
+}
+
+
 static int wcd938x_populate_dt_data(struct wcd938x_priv *wcd938x, struct device *dev)
 {
 	struct wcd_mbhc_config *cfg = &wcd938x->mbhc_cfg;
@@ -4208,6 +4236,16 @@ static int wcd938x_populate_dt_data(struct wcd938x_priv *wcd938x, struct device
 		return wcd938x->reset_gpio;
 	}
 
+	wcd938x->us_euro_gpio = of_get_named_gpio(dev->of_node, "us-euro-gpios", 0);
+	if (wcd938x->us_euro_gpio < 0) {
+		dev_err(dev, "Failed to get us-euro-gpios gpio: err = %d\n", wcd938x->us_euro_gpio);
+	} else {
+		cfg->swap_gnd_mic = wcd938x_swap_gnd_mic;
+		gpio_direction_output(wcd938x->us_euro_gpio, 0);
+		/* 20us sleep required after pulling the reset gpio to LOW */
+		usleep_range(20, 30);
+	}
+
 	wcd938x->supplies[0].supply = "vdd-rxtx";
 	wcd938x->supplies[1].supply = "vdd-io";
 	wcd938x->supplies[2].supply = "vdd-buck";
-- 
2.7.4

