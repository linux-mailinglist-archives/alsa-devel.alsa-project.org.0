Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D73217FBD96
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Nov 2023 16:01:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04B6EDEC;
	Tue, 28 Nov 2023 16:01:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04B6EDEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701183701;
	bh=EheT/ApgWjx2JIYcWwXliT1Xy1WZZaG+tu/CrGJHHy0=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=YuhIEYBfZ5a14cDgIYMGyj6coNAmwJUEIITJ1Pu6alDqKq/AQNGb+huzwDJABWOCI
	 bIVahwDDBS9ZjQphFdodsb4SmKZJKgYaV7bmrt6KV0/pjShSqKR3vGAm4uRodY10nN
	 LyXLJHUANTDsKBR45x43SsPsuLu83IlnSQ4iN1+A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02032F80580; Tue, 28 Nov 2023 16:01:08 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4EDDDF8055C;
	Tue, 28 Nov 2023 16:01:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8EBAF8016E; Tue, 28 Nov 2023 16:01:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 377BEF80104
	for <alsa-devel@alsa-project.org>; Tue, 28 Nov 2023 16:00:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 377BEF80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=spSDC+eX
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a013d22effcso754996566b.2
        for <alsa-devel@alsa-project.org>;
 Tue, 28 Nov 2023 07:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701183654; x=1701788454;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wtzvOORU1m23t60LTV9e86QfYgBtpGNq+GKxLg73wN0=;
        b=spSDC+eXwH/DS4VC0cyqkzzbFij7iHgbINhCdD6+Y+dYR2z/VXJfwkZMU4YzciDm4U
         nWvPFkZaxwYru4wCgjuW+G+/rtBS3dIKOUlkwpMkBdPvliowjyty+5XgupfwyoLjkiEB
         gXxIwFTF+TqXku399ri+yKqdxpYDU073OR7IJouMJtE8OEV1aYMEr/Xk5ZRmPSqkIz95
         STylV14DVgCSk6HHmSTZbDZWbIA3tZt8fHVTwjFvQcGiMwvkEfw1mvj/SK65ZuuO+G01
         1xvxSgdwM3eKUfmuSTvnGhyTd1sOFdrGr7jIlR9AKIdAq/V6m/IuUBmTTcEAit4VuzDv
         oXyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701183654; x=1701788454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wtzvOORU1m23t60LTV9e86QfYgBtpGNq+GKxLg73wN0=;
        b=oWo0PZOQJokPncyy1lfkjuus3gAHddJQbcnRolDDCZvk0nA8Fvx+Wh5nRq7ogOT9FF
         hGnpsPhhqX7VIEDsyDHRKChcLYldYYsY+t+o/CQRr5aTmoLidbe/pe+P2J8olH6R3sLd
         QS4QUSXV0EdtA0oAwWlEfpGgp0te3o8vlpw4OJYHP4+YzfaDN7307AlfO8sxpAyd6xqa
         ZdzbG2rOa1oqeapQewgHKsafoMLL4HQl5qCfGUccjQJKuK5ZfRoIOYDvAapDOIHuVTuT
         IDZX7AcV0enuHUCqcFucbflPLwfgmvuCzzUmPY8SUlM+I/0D2nLHWdsUptGcixGk/Y76
         OQew==
X-Gm-Message-State: AOJu0YxL2EiRsLPdtmJ2cadC/Uu9MviL6Ki9eVZYs3OkS647wgfrQvhQ
	VY1bMLV14zUWnKqEgDdTVgUPCg==
X-Google-Smtp-Source: 
 AGHT+IFRWlG86Ino62rK496hPwfuaTK2b6cocVn/StHlsrRflRZQOwgPf8SPpdGuQOvrfjs/iOsLkA==
X-Received: by 2002:a17:907:1687:b0:a12:9aa8:c560 with SMTP id
 cx7-20020a170907168700b00a129aa8c560mr1808321ejd.59.1701183654099;
        Tue, 28 Nov 2023 07:00:54 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.109])
        by smtp.gmail.com with ESMTPSA id
 xo25-20020a170907bb9900b00a0b6541b592sm4433071ejc.88.2023.11.28.07.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 07:00:53 -0800 (PST)
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH] soundwire: qcom: allow multi-link on newer devices
Date: Tue, 28 Nov 2023 16:00:49 +0100
Message-Id: <20231128150049.412236-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RLUZZTBJBWY2I3Z7YPGRDDEG77GOCVBW
X-Message-ID-Hash: RLUZZTBJBWY2I3Z7YPGRDDEG77GOCVBW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RLUZZTBJBWY2I3Z7YPGRDDEG77GOCVBW/>
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
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

This is an entirely different approach than my previous try here:
https://lore.kernel.org/all/20231025144601.268645-1-krzysztof.kozlowski@linaro.org/
---
 drivers/soundwire/qcom.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 412b8e663a0a..57943724f0eb 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -920,6 +920,18 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
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
@@ -1078,6 +1090,7 @@ static const struct sdw_master_port_ops qcom_swrm_port_ops = {
 };
 
 static const struct sdw_master_ops qcom_swrm_ops = {
+	.read_prop = qcom_swrm_read_prop,
 	.xfer_msg = qcom_swrm_xfer_msg,
 	.pre_bank_switch = qcom_swrm_pre_bank_switch,
 	.post_bank_switch = qcom_swrm_post_bank_switch,
@@ -1196,6 +1209,15 @@ static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
 
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

