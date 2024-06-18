Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DA790D4A5
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2024 16:23:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF0C884C;
	Tue, 18 Jun 2024 16:23:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF0C884C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718720635;
	bh=+4CUL0HKoZlb276ERUwdvPbHn/bW1BFwyupgf2+mb/Q=;
	h=From:Date:Subject:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=FPrVUjSnK/8CMF8TilzqJGAPinNesHkwTHx2zlKN/0KENfDYXbVliq7VG2tnGuWM2
	 8vLZZgGFbpwLVInsTJ44P8OujVQACoOm1mFTzx3aacaXl9aVonH/j8pteGzlugFMq3
	 Hb+74UHPzeQP5yOInzIyjb/yR0UncvJltCLH6loE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 14842F80617; Tue, 18 Jun 2024 16:22:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 749C6F8061F;
	Tue, 18 Jun 2024 16:22:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E21FF80266; Tue, 18 Jun 2024 16:20:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D6E0FF80578
	for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2024 16:15:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6E0FF80578
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=EgI2w9/I
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4217c7eb6b4so48482915e9.2
        for <alsa-devel@alsa-project.org>;
 Tue, 18 Jun 2024 07:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718719872; x=1719324672;
 darn=alsa-project.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D6ChPm2ZVDCBI9wwPc6qqPViwCOCp7xGdlugGTVGuBk=;
        b=EgI2w9/IAAo+xTleSaP2fIc6v/TJiocTwKZyBl1SnAR8AFu6BH86Vrb6tZHEN37Boo
         eU++8kDsOZ9NqpTkJ3PJDBeGsUDsFrQCcdnSE8oLMGpax2GTK2krNhqeDjw8Q5c3B23l
         FYbbI5M7N8Bk+sEpWo5QnaK291Q7SjSDLuI5tqPt9QuamgAHRus9H+e6WmBzycQTnPzV
         fol9g6/y4nE1URBcFBb8Yr1DvwGjXlBX2nDSg88X8qL0MvwM5/K9IbGNNd38lIkd3eis
         4GkcuPKmNR8N6RHZlEz6uPAfygwOzgkTESUIVGBZ/ENBpw3vDPbIwq7jE6pc/glaC1+O
         OKUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718719872; x=1719324672;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D6ChPm2ZVDCBI9wwPc6qqPViwCOCp7xGdlugGTVGuBk=;
        b=PeD+LvqRlAzfvWp/6FTHJOqdJZ2MNQIJ/vLDjYOjAUC3hjmiKu4MfQWrnCANB3YU1+
         utz9MCf9wWbtLyOM/EyB4TC1L9/s+I/ha+JsirEu9LPMFzcjQapsc1UCC33PmQ3bKmlf
         PEVchk3T55cBzzPYXPidI4eXNe/Vej6CgilEGBotf5JsmEgn0LCC63IFsncP4EA7N0Oe
         oU6JwJoruQXOOdp5lCW4LGiWNjY2pUCaqKVmKJVSwSVWchv70vX0t1xXh021NT5v7Td5
         eokXzztgNKfuJdhzdKbHhcpMKoFNdqy1yRek57qwBMGL+uq4R8SpM0HK+BDlIzcH4axP
         txww==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4ZG44QnDVTaU+2+M1MSpLuuxMjdzfqERaM5FwUT7KuifaXoXzVOJMJzwljV6wR31EV9zc1GDKdYtDDXMsVfElmnOVarCP7KtBkqs=
X-Gm-Message-State: AOJu0YyVmDKtrtxzMePPVBCo3rA7iebJReyQA9VPufXSUjSQOXZV9zRX
	pXIRV/s5mRbC3NlyRoeB8p+K6Dal4dvLiBMdyWgiRC+E5/UjWDaVbhXEy+sOxc8WPD44RmoaNTd
	rjqY=
X-Google-Smtp-Source: 
 AGHT+IG3ro8Zjz5M3lMie8NKLPIuT19SAyYyyup6jrLjzzoy1DgniE0/49fX7ZOxIcmnlH11xqxWAw==
X-Received: by 2002:a17:907:c713:b0:a6f:69ee:dcd2 with SMTP id
 a640c23a62f3a-a6f69eee6famr911053966b.57.1718718917112;
        Tue, 18 Jun 2024 06:55:17 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56f41721sm622645566b.154.2024.06.18.06.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 06:55:16 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Tue, 18 Jun 2024 14:55:15 +0100
Subject: [PATCH] drivers:soundwire: qcom: cleanup port maask calculations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240618-soundwire-port-map-v1-1-9644e5545b9b@linaro.org>
X-B4-Tracking: v=1; b=H4sIAMKRcWYC/x2NQQqDQAwAvyI5NxClFO1XSg/RzdYc3F0Sawvi3
 7v2OAzD7OBiKg73ZgeTTV1zqtBeGphmTi9BDZWho+5Kt7ZHz+8UPmqCJduKCxck6uMQIgvFAWo
 4sguOxmmaz3RhX8VOUUyifv+3x/M4fgWldN59AAAA
To: Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2420;
 i=srinivas.kandagatla@linaro.org; h=from:subject:message-id;
 bh=+4CUL0HKoZlb276ERUwdvPbHn/bW1BFwyupgf2+mb/Q=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmcZHEZx0WD6S7YcEFm9sOro2WXS44qUag4slA8
 6hz7200ceOJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZnGRxAAKCRB6of1ZxzRV
 N882B/9JXKa/oPIDvV+BnarwrBTCXvFaYTVycNw4sgqDsEa5a2aE+ggUnpksuZjjus/nv6VBUL8
 d80oUOZ6Y2d2qduf7Wvw76pLJtNYdDLeBE35ADRjR9yTYfFVSPlIXTi2HxpqanUkEJCF7MQ45Gn
 nnLw9qj2K7E8NCVzkgdVBAFNI9F0NoHbKf2WUSQSwEH+L6RUyxj8YCstMJEH5Wctwl8fphZZrOT
 RXWgc0sZ4pQfdULRQ+KTXGBGoJrMpwy5oMZa8ZhB6DiNnHJTaL7lhebUeRAY0u8hIcbALAkO2qC
 8vcgFAOEuDXK/ttKLumsSmLcYRkJ0xhPPkrVn2GXEqsHZVIf
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6
Message-ID-Hash: YHSUQH2R5QCB64RO6MLSPAHPAMFDJ2QM
X-Message-ID-Hash: YHSUQH2R5QCB64RO6MLSPAHPAMFDJ2QM
X-MailFrom: srinivas.kandagatla@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YHSUQH2R5QCB64RO6MLSPAHPAMFDJ2QM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Cleanup the port map calculations, existing masks of having separate
masks for in and out ports is not really required.
Having a single mask for all the ports in the controller is simple and
cuts of some unnecessary code.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/qcom.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index ce5cf3ecceb5..aed57002fd0e 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -197,8 +197,7 @@ struct qcom_swrm_ctrl {
 	int num_dout_ports;
 	int cols_index;
 	int rows_index;
-	unsigned long dout_port_mask;
-	unsigned long din_port_mask;
+	unsigned long port_mask;
 	u32 intr_mask;
 	u8 rcmd_id;
 	u8 wcmd_id;
@@ -1146,11 +1145,7 @@ static void qcom_swrm_stream_free_ports(struct qcom_swrm_ctrl *ctrl,
 	mutex_lock(&ctrl->port_lock);
 
 	list_for_each_entry(m_rt, &stream->master_list, stream_node) {
-		if (m_rt->direction == SDW_DATA_DIR_RX)
-			port_mask = &ctrl->dout_port_mask;
-		else
-			port_mask = &ctrl->din_port_mask;
-
+		port_mask = &ctrl->port_mask;
 		list_for_each_entry(p_rt, &m_rt->port_list, port_node)
 			clear_bit(p_rt->num, port_mask);
 	}
@@ -1195,13 +1190,9 @@ static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
 		if (ctrl->bus.id != m_rt->bus->id)
 			continue;
 
-		if (m_rt->direction == SDW_DATA_DIR_RX) {
-			maxport = ctrl->num_dout_ports;
-			port_mask = &ctrl->dout_port_mask;
-		} else {
-			maxport = ctrl->num_din_ports;
-			port_mask = &ctrl->din_port_mask;
-		}
+		port_mask = &ctrl->port_mask;
+		maxport = ctrl->num_dout_ports + ctrl->num_din_ports;
+
 
 		list_for_each_entry(s_rt, &m_rt->slave_rt_list, m_rt_node) {
 			slave = s_rt->slave;
@@ -1401,8 +1392,7 @@ static int qcom_swrm_get_port_config(struct qcom_swrm_ctrl *ctrl)
 		return -EINVAL;
 
 	/* Valid port numbers are from 1-14, so mask out port 0 explicitly */
-	set_bit(0, &ctrl->dout_port_mask);
-	set_bit(0, &ctrl->din_port_mask);
+	set_bit(0, &ctrl->port_mask);
 
 	ret = of_property_read_u8_array(np, "qcom,ports-offset1",
 					off1, nports);

---
base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
change-id: 20240618-soundwire-port-map-008f9dfae0f9

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

