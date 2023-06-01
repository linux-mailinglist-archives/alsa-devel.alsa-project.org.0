Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8F671EE90
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Jun 2023 18:18:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFC6C820;
	Thu,  1 Jun 2023 18:17:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFC6C820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685636297;
	bh=Jh63NPvsuxWbiA6YLq4msAEnAjHOHF40b+S3upHkGk0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VBy5Aglz2ANLcGXIu5lJ1xnhifAYE09RKANkSwhcmRRIr0R5dVMG/AUCxAtRG0Hh0
	 ttKKtY2NpRy7IoGOIHleqZXgvIB2PQQ3sbcHzHJ4a+7a+l+kcZFK6ODHOWgx1xRJqU
	 Fh4E1j38obopvlRP+3Hy0VYBGwburTIqoY7C2Kx4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D813F80563; Thu,  1 Jun 2023 18:16:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A8BA8F8055A;
	Thu,  1 Jun 2023 18:16:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98A51F80149; Thu,  1 Jun 2023 18:16:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BD8CAF8016B
	for <alsa-devel@alsa-project.org>; Thu,  1 Jun 2023 18:16:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD8CAF8016B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=bIDo2vpn
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 351BpAhQ020645;
	Thu, 1 Jun 2023 11:16:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=4bof8nBseyDbvNFvNKVeZgVmTN/4A2KqkGyonD3SDoo=;
 b=bIDo2vpnCwrHVAWqaEfOJHEtkOPL2/1g/hDKEW8ZgyXGoT+9eFRMDthUVCxKfJ5z5aFR
 vZisPCZPSi/ncY7V5MhadUDEYbMgwsxOshkSU99LoT61227CpsExLNvcEUXXSh2NGh2G
 LTtqfvsgCdT8PV8WQEKvfC+mtHSu3L1F5RYzZbOXGhjf43zYWVUXK7iJ9QZmHXISbn6n
 yHAIeg/35fmCneuA5de/671BCFNHXvJDE2i2AX/hpKXMpxIYUs5JXnRIT4XQd24G7vcR
 49WLXZjyDW7dJqzBLQV0AK3sJKBypqc7AcdDNKQIeeuFRm6r1uWtNuW+GmCz07axo+qi /g==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3que9mxmbs-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Jun 2023 11:16:25 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Thu, 1 Jun
 2023 17:16:22 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 1 Jun 2023 17:16:22 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D9D9611C6;
	Thu,  1 Jun 2023 16:16:22 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.intel.com>,
        <sanyog.r.kale@intel.com>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>
Subject: [PATCH 3/4] soundwire: stream: Remove unnecessary gotos
Date: Thu, 1 Jun 2023 17:16:21 +0100
Message-ID: <20230601161622.1808135-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230601161622.1808135-1-ckeepax@opensource.cirrus.com>
References: <20230601161622.1808135-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: nVWJLd2g_bmK5eV8r0sQiZap5HBz0RG6
X-Proofpoint-ORIG-GUID: nVWJLd2g_bmK5eV8r0sQiZap5HBz0RG6
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: TXEZVCK24GNSVAQU3Z3ATFA4NYAME2AJ
X-Message-ID-Hash: TXEZVCK24GNSVAQU3Z3ATFA4NYAME2AJ
X-MailFrom: prvs=1516d3aa90=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TXEZVCK24GNSVAQU3Z3ATFA4NYAME2AJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There is a lot of code using gotos to skip small sections of code, this
is a fairly dubious use of a goto, especially when the level of
intentation is really low. Most of this code doesn't even breach 80
characters when naively shifted over.

Simplify the code a bit, by replacing these unnecessary gotos with
simple ifs.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/soundwire/stream.c | 131 +++++++++++++++++--------------------
 1 file changed, 59 insertions(+), 72 deletions(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index 379228f221869..248ab243ec6e4 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1355,25 +1355,23 @@ static int _sdw_prepare_stream(struct sdw_stream_runtime *stream,
 			return -EINVAL;
 		}
 
-		if (!update_params)
-			goto program_params;
-
-		/* Increment cumulative bus bandwidth */
-		/* TODO: Update this during Device-Device support */
-		bus->params.bandwidth += m_rt->stream->params.rate *
-			m_rt->ch_count * m_rt->stream->params.bps;
-
-		/* Compute params */
-		if (bus->compute_params) {
-			ret = bus->compute_params(bus);
-			if (ret < 0) {
-				dev_err(bus->dev, "Compute params failed: %d\n",
-					ret);
-				goto restore_params;
+		if (update_params) {
+			/* Increment cumulative bus bandwidth */
+			/* TODO: Update this during Device-Device support */
+			bus->params.bandwidth += m_rt->stream->params.rate *
+				m_rt->ch_count * m_rt->stream->params.bps;
+
+			/* Compute params */
+			if (bus->compute_params) {
+				ret = bus->compute_params(bus);
+				if (ret < 0) {
+					dev_err(bus->dev, "Compute params failed: %d\n",
+						ret);
+					goto restore_params;
+				}
 			}
 		}
 
-program_params:
 		/* Program params */
 		ret = sdw_program_params(bus, true);
 		if (ret < 0) {
@@ -1864,7 +1862,7 @@ int sdw_stream_add_master(struct sdw_bus *bus,
 			  struct sdw_stream_runtime *stream)
 {
 	struct sdw_master_runtime *m_rt;
-	bool alloc_master_rt = true;
+	bool alloc_master_rt = false;
 	int ret;
 
 	mutex_lock(&bus->bus_lock);
@@ -1886,30 +1884,25 @@ int sdw_stream_add_master(struct sdw_bus *bus,
 	 * it first), if so skip allocation and go to configuration
 	 */
 	m_rt = sdw_master_rt_find(bus, stream);
-	if (m_rt) {
-		alloc_master_rt = false;
-		goto skip_alloc_master_rt;
-	}
-
-	m_rt = sdw_master_rt_alloc(bus, stream);
 	if (!m_rt) {
-		dev_err(bus->dev, "%s: Master runtime alloc failed for stream:%s\n",
-			__func__, stream->name);
-		ret = -ENOMEM;
-		goto unlock;
-	}
-skip_alloc_master_rt:
-
-	if (sdw_master_port_allocated(m_rt))
-		goto skip_alloc_master_port;
+		m_rt = sdw_master_rt_alloc(bus, stream);
+		if (!m_rt) {
+			dev_err(bus->dev, "%s: Master runtime alloc failed for stream:%s\n",
+				__func__, stream->name);
+			ret = -ENOMEM;
+			goto unlock;
+		}
 
-	ret = sdw_master_port_alloc(m_rt, num_ports);
-	if (ret)
-		goto alloc_error;
+		alloc_master_rt = true;
+	}
 
-	stream->m_rt_count++;
+	if (!sdw_master_port_allocated(m_rt)) {
+		ret = sdw_master_port_alloc(m_rt, num_ports);
+		if (ret)
+			goto alloc_error;
 
-skip_alloc_master_port:
+		stream->m_rt_count++;
+	}
 
 	ret = sdw_master_rt_config(m_rt, stream_config);
 	if (ret < 0)
@@ -1990,8 +1983,8 @@ int sdw_stream_add_slave(struct sdw_slave *slave,
 {
 	struct sdw_slave_runtime *s_rt;
 	struct sdw_master_runtime *m_rt;
-	bool alloc_master_rt = true;
-	bool alloc_slave_rt = true;
+	bool alloc_master_rt = false;
+	bool alloc_slave_rt = false;
 
 	int ret;
 
@@ -2002,47 +1995,41 @@ int sdw_stream_add_slave(struct sdw_slave *slave,
 	 * and go to configuration
 	 */
 	m_rt = sdw_master_rt_find(slave->bus, stream);
-	if (m_rt) {
-		alloc_master_rt = false;
-		goto skip_alloc_master_rt;
-	}
-
-	/*
-	 * If this API is invoked by Slave first then m_rt is not valid.
-	 * So, allocate m_rt and add Slave to it.
-	 */
-	m_rt = sdw_master_rt_alloc(slave->bus, stream);
 	if (!m_rt) {
-		dev_err(&slave->dev, "%s: Master runtime alloc failed for stream:%s\n",
-			__func__, stream->name);
-		ret = -ENOMEM;
-		goto unlock;
-	}
+		/*
+		 * If this API is invoked by Slave first then m_rt is not valid.
+		 * So, allocate m_rt and add Slave to it.
+		 */
+		m_rt = sdw_master_rt_alloc(slave->bus, stream);
+		if (!m_rt) {
+			dev_err(&slave->dev, "%s: Master runtime alloc failed for stream:%s\n",
+				__func__, stream->name);
+			ret = -ENOMEM;
+			goto unlock;
+		}
 
-skip_alloc_master_rt:
-	s_rt = sdw_slave_rt_find(slave, stream);
-	if (s_rt) {
-		alloc_slave_rt = false;
-		goto skip_alloc_slave_rt;
+		alloc_master_rt = true;
 	}
 
-	s_rt = sdw_slave_rt_alloc(slave, m_rt);
+	s_rt = sdw_slave_rt_find(slave, stream);
 	if (!s_rt) {
-		dev_err(&slave->dev, "Slave runtime alloc failed for stream:%s\n", stream->name);
-		alloc_slave_rt = false;
-		ret = -ENOMEM;
-		goto alloc_error;
-	}
+		s_rt = sdw_slave_rt_alloc(slave, m_rt);
+		if (!s_rt) {
+			dev_err(&slave->dev, "Slave runtime alloc failed for stream:%s\n",
+				stream->name);
+			ret = -ENOMEM;
+			goto alloc_error;
+		}
 
-skip_alloc_slave_rt:
-	if (sdw_slave_port_allocated(s_rt))
-		goto skip_port_alloc;
+		alloc_slave_rt = true;
+	}
 
-	ret = sdw_slave_port_alloc(slave, s_rt, num_ports);
-	if (ret)
-		goto alloc_error;
+	if (!sdw_slave_port_allocated(s_rt)) {
+		ret = sdw_slave_port_alloc(slave, s_rt, num_ports);
+		if (ret)
+			goto alloc_error;
+	}
 
-skip_port_alloc:
 	ret =  sdw_master_rt_config(m_rt, stream_config);
 	if (ret)
 		goto unlock;
-- 
2.30.2

