Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E96CE9715CE
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Sep 2024 12:57:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5EE14829;
	Mon,  9 Sep 2024 12:57:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5EE14829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725879471;
	bh=FwGWC34J0BSS9eRkEcPVl6s6DaKQBtK3urjmjwtiixQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ug/YC7rMArn7VohIdscM/nkzER4bO+dLBG08EXLd0Nfm/bqYYIFlVfAAKMOYU/Qes
	 JjrCIV2IVB0Yy5mdv5UMpnjDAQQS3Pjl9RyoaP2hSBBkBtwESn68E45pmsnghxMc3N
	 0XQzhZRWtXpwXPcAUTeMomJCVkbBsKk0wmSqF5ik=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 124CBF8060B; Mon,  9 Sep 2024 12:56:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 88F68F8019B;
	Mon,  9 Sep 2024 12:56:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33CCEF805E9; Mon,  9 Sep 2024 12:56:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 35889F805E6
	for <alsa-devel@alsa-project.org>; Mon,  9 Sep 2024 12:56:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35889F805E6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=Le7RifJl
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 4899JpMZ026363;
	Mon, 9 Sep 2024 10:56:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ox0BgJVMaAfBw4Bd5/ID1MmEDGKGCNbq2C5Vj0HEJa4=; b=Le7RifJlBrKI0VJf
	pc9wbWZIY++0CeTkTP7m4F5sl/GTKBFE+UEd2N5Sk7XVQPo5KOzeEF7zWNx4lGbO
	WMEv1ZofVGDauPqTUxOoxxcObtfOjOEe/Uq7JkycvAuf1kfrhKEV+BcM9b98NegV
	J8GVlk7VRKWR31m8vyFFiCLlX7SF2pEuRH2yfoYgi9CyHd29dgadBLm957f2nXcJ
	/liYWCGKGkeJDrp42BrgEGnDYGLgiB7Un4yRfVvcyBiGG/f22usu3CavJuP/K0VX
	ik0/s4gQCY4PLBs8Oizzam9vGNUJXGv2kxWLLvt0ii6mu2pxxqzMZbeoBrt4fGa+
	4Xzeow==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41he5dsr6y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Sep 2024 10:56:49 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id
 489AumZx003371
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Sep 2024 10:56:48 GMT
Received: from hu-mohs-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 9 Sep 2024 03:56:40 -0700
From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bard Liao
	<yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>
CC: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Sanyog Kale
	<sanyog.r.kale@intel.com>,
        <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_rohkumar@quicinc.com>,
        <kernel@quicinc.com>, <quic_pkumpatl@quicinc.com>,
        Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Subject: [PATCH v1 2/4] soundwire: stream: Add set_master_channel_map() to set
 static channel mapping
Date: Mon, 9 Sep 2024 16:25:45 +0530
Message-ID: <20240909105547.2691015-3-quic_mohs@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240909105547.2691015-1-quic_mohs@quicinc.com>
References: <20240909105547.2691015-1-quic_mohs@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: LepE_-l8i2T62ysaYHDJqI7Qz8TRRY31
X-Proofpoint-GUID: LepE_-l8i2T62ysaYHDJqI7Qz8TRRY31
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 mlxscore=0 phishscore=0 bulkscore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409090086
Message-ID-Hash: TUBMTKEWIJ2EZ6S5JHULI72WVRJJZDQS
X-Message-ID-Hash: TUBMTKEWIJ2EZ6S5JHULI72WVRJJZDQS
X-MailFrom: quic_mohs@quicinc.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TUBMTKEWIJ2EZ6S5JHULI72WVRJJZDQS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add set_master_channel_map() to set the static channel map between
master and slave. Patch change will resolve the channel mask mismatch
between the master and slave.

The sdw_set_channel_map_stream() will triggered by a slave with active
port number and channel mask.

Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
---
 drivers/soundwire/stream.c    | 16 ++++++++++++++++
 include/linux/soundwire/sdw.h |  5 +++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index f275143d7b18..8cfea2ccb5bd 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1972,6 +1972,22 @@ int sdw_stream_remove_master(struct sdw_bus *bus,
 }
 EXPORT_SYMBOL(sdw_stream_remove_master);
 
+int sdw_set_channel_map_stream(struct sdw_stream_runtime *stream,
+			       int *ch_mask, unsigned int active_port_num)
+{
+	struct sdw_master_runtime *m_rt;
+	struct sdw_bus *bus;
+
+	list_for_each_entry(m_rt, &stream->master_list, stream_node) {
+		bus = m_rt->bus;
+		if (bus->ops->set_master_channel_map)
+			bus->ops->set_master_channel_map(bus, ch_mask, active_port_num);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(sdw_set_channel_map_stream);
+
 /**
  * sdw_stream_add_slave() - Allocate and add master/slave runtime to a stream
  *
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 5e0dd47a0412..264450763bab 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -857,6 +857,8 @@ struct sdw_master_ops {
 			(struct sdw_bus *bus);
 	int (*set_bus_conf)(struct sdw_bus *bus,
 			struct sdw_bus_params *params);
+	int (*set_master_channel_map)(struct sdw_bus *bus, int *ch_mask,
+				      unsigned int port_num);
 	int (*pre_bank_switch)(struct sdw_bus *bus);
 	int (*post_bank_switch)(struct sdw_bus *bus);
 	u32 (*read_ping_status)(struct sdw_bus *bus);
@@ -1049,6 +1051,9 @@ int sdw_bus_exit_clk_stop(struct sdw_bus *bus);
 int sdw_compare_devid(struct sdw_slave *slave, struct sdw_slave_id id);
 void sdw_extract_slave_id(struct sdw_bus *bus, u64 addr, struct sdw_slave_id *id);
 
+int sdw_set_channel_map_stream(struct sdw_stream_runtime *stream,
+			       int *ch_mask, unsigned int active_port_num);
+
 #if IS_ENABLED(CONFIG_SOUNDWIRE)
 
 int sdw_stream_add_slave(struct sdw_slave *slave,
-- 
2.25.1

