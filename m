Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF9989A005
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Apr 2024 16:42:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07BBB2D29;
	Fri,  5 Apr 2024 16:42:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07BBB2D29
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712328149;
	bh=sxY2AEeSba+Q/Kxf5OSL1C7dhwkaGiayEInG3JEg4Go=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=fEPMTMPs2GL1x9HOSIid/iNqdw+PHFMDvWpFC1sRwEDLW6zbZjcahPxNdFZuQj1o9
	 POrdcZfRFcX+DpfyNB+t+TrjU5SA8WqEVKmQ3NqM8Yo1DlAMX95O5NYfRa7T1ngyCs
	 pNccNYk1/M75XKi6h7wHZX74zr3ESl1EkxM21vk8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38DABF805A9; Fri,  5 Apr 2024 16:41:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A967F805A1;
	Fri,  5 Apr 2024 16:41:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30049F80238; Fri,  5 Apr 2024 16:41:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B5991F80130
	for <alsa-devel@alsa-project.org>; Fri,  5 Apr 2024 16:41:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5991F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=u6/HhRU3
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a51a701bc21so81009766b.1
        for <alsa-devel@alsa-project.org>;
 Fri, 05 Apr 2024 07:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712328107; x=1712932907;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JTqiLc0V7BtkLzywEdmRvMeMh3GhRnDflsLTNgiO3NQ=;
        b=u6/HhRU3kRysFcPaNkTGitAcspK/pJoJaHu603VSIGfEoS0hUHnLoyVeP+ZWFDnFCu
         /qXYEw0MfjHIX8Dk/gi8fmn2oq4SdllifMXJuwYXcP4SdSiWInGvOOsis/ggIOvL6f8v
         r35mGvouqODoLZ6zdCUZ8YlqlNwu2rQjigurIjLolIhsdcH67n8lRRoO6pc5JNJhazxl
         mJ5g6B/LZDygO54WApPPc9OLDf+3zHQkEKHT3Uan524NhO2oQQN6/g0ig4KDrfVbLEG/
         +pXnGc1qfTbYUAHB4+n7C59TPkYJxi15RtCl23TIxoH7UNkCyy5kUR1cA789R+Mx0tIv
         ryBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712328107; x=1712932907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JTqiLc0V7BtkLzywEdmRvMeMh3GhRnDflsLTNgiO3NQ=;
        b=dgCvbPOrqAfC6pevQGxmjbm13x7kdJLVaEoTiymFTfHDzOoXmDARYPJ7ejHiXVHaVn
         DxOTtfeoI97e2UBR3KYGquFrs6YjOQGB6AIeidFfjes6VHpp5l1/3P98D4Ro3yRw44Md
         KjOYcgfMKhVem9rdjsG4sfhH1hL5DDy87sNVt/Ur0r/iBM97Kz+191lh1WKlIljrRplP
         qz2g4Pk9HJVe0Vy8iJTT9WUITXF3//tDMABfXjWg4KM6/piPVbdGtvXlW1538wVntfdS
         I7DjC1OajdBf9AVX6QOKeR770KkJ8gRFEVLxM9seQJjBbv/Vt32q/VjqPMVxEmPltKRp
         OhbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSHGaROjCzD8DNCBw71Borfn0lj0RIo+kNYw0wgdImbDTBESloCy4rJib4sIxTzecOXNWpJmVw377bVbvNAE1Cl8l7nUXuHGyCJQI=
X-Gm-Message-State: AOJu0YwkgNCFChsRjkCqYsprd/UJ5UfYPSgRMrI9cRpNRKDoWsJwpHpe
	23pDiqhhdNuRexWxgBs3DYRFOsmnatpAsy9Uf0EA217+TbvkwEgeYmvdpb2juB0=
X-Google-Smtp-Source: 
 AGHT+IHh+ZxoCzU1FGg+Ay1sdVh8yffh8/bUZTifdB3YwV0ck6OUItK6hnnakWAv1mKM1jDatQrBDA==
X-Received: by 2002:a17:906:5ad8:b0:a4e:a204:e699 with SMTP id
 x24-20020a1709065ad800b00a4ea204e699mr1326916ejs.17.1712328107384;
        Fri, 05 Apr 2024 07:41:47 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id
 g15-20020a170906198f00b00a4e2bf2f743sm899183ejd.184.2024.04.05.07.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 07:41:46 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v2] soundwire: qcom: allow multi-link on newer devices
Date: Fri,  5 Apr 2024 16:41:41 +0200
Message-Id: <20240405144141.47217-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4SJDBI3OXDLTQDR2IRRPSTLINODP5VLV
X-Message-ID-Hash: 4SJDBI3OXDLTQDR2IRRPSTLINODP5VLV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4SJDBI3OXDLTQDR2IRRPSTLINODP5VLV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Newer Qualcomm SoCs like X1E80100 might come with four speakers spread
over two Soundwire controllers, thus they need a multi-link Soundwire
stream runtime.

Cc: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Only rebase (slightly different context)
---
 drivers/soundwire/qcom.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index fb70afe64fcc..ce5cf3ecceb5 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -905,6 +905,18 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 	return 0;
 }
 
+static int qcom_swrm_read_prop(struct sdw_bus *bus)
+{
+	struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
+
+	if (ctrl->version >= SWRM_VERSION_2_0_0) {
+		bus->multi_link = true;
+		bus->hw_sync_min_links = 3;
+	}
+
+	return 0;
+}
+
 static enum sdw_command_response qcom_swrm_xfer_msg(struct sdw_bus *bus,
 						    struct sdw_msg *msg)
 {
@@ -1056,6 +1068,7 @@ static const struct sdw_master_port_ops qcom_swrm_port_ops = {
 };
 
 static const struct sdw_master_ops qcom_swrm_ops = {
+	.read_prop = qcom_swrm_read_prop,
 	.xfer_msg = qcom_swrm_xfer_msg,
 	.pre_bank_switch = qcom_swrm_pre_bank_switch,
 };
@@ -1173,6 +1186,15 @@ static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
 
 	mutex_lock(&ctrl->port_lock);
 	list_for_each_entry(m_rt, &stream->master_list, stream_node) {
+		/*
+		 * For streams with multiple masters:
+		 * Allocate ports only for devices connected to this master.
+		 * Such devices will have ports allocated by their own master
+		 * and its qcom_swrm_stream_alloc_ports() call.
+		 */
+		if (ctrl->bus.id != m_rt->bus->id)
+			continue;
+
 		if (m_rt->direction == SDW_DATA_DIR_RX) {
 			maxport = ctrl->num_dout_ports;
 			port_mask = &ctrl->dout_port_mask;
-- 
2.34.1

