Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4D2A7633F
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Mar 2025 11:35:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC9A2601ED;
	Mon, 31 Mar 2025 11:35:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC9A2601ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1743413746;
	bh=KYRf8FAvcQvcO2tBFkiviugXdc04+kNMvvgWmThug88=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=VsXtabGmUBs+CBvY2BVmaPgzK+8ZwbijVOann1cEPSh3ozOMslI7P3hrA5swgQwYf
	 vl1rrc68arTwOIDyLmgxlufQrPV52gusHs7T0C+wf/QtF4CIzoR1vxig1KrpDDPypv
	 hInTIvMOHKdRjd19gvGXNNAM9vfwbyuf2UF/PlPQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04637F805B6; Mon, 31 Mar 2025 11:35:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EB0E4F805B6;
	Mon, 31 Mar 2025 11:35:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EC14AF8013D; Mon, 31 Mar 2025 11:35:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A8887F800ED
	for <alsa-devel@alsa-project.org>; Mon, 31 Mar 2025 11:35:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8887F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=FAIz7G2W;
	dkim=pass (1024-bit key,
 unprotected) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com
 header.b=RCKcPYs7
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 52V5ag2R011552;
	Mon, 31 Mar 2025 04:35:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=rQ6MFXwwfRrMdry4
	q4jsuQ/BhI0nC6urImVsizcMQt8=; b=FAIz7G2W3fxrz/HrChDUGS4ZefHFlB9l
	md/BJ3ftDsqFbNCUpkOrvDk6ywRgJwDYhWNBm1urXBCdpXB7n2RvjdG+L/x6rkF4
	uFx4hDZ1axOo7D1pTBWw6/tfbn77rMSbcaD6VTac/B1BxHkO+FVHkkjUGGbip4OZ
	r2GKU+leX/KYsfartDhF2ZhL9iALfj5oid8VmOltu/EmcVNYUXoyuDfHZFNsf4Ka
	/oB8Jy4Ktr14u2nMOrZoPp9XacrTEJ34Ld+RiX7+GXNsxyfAfPEsHRHf0bw3AJju
	r+lceiH24hAhVqtZhRf8WY72h8NCa63e8GThhCue23VpHnKaNQRUww==
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 45pd9hjdjd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Mar 2025 04:35:02 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LCg57HFk/7TwDnzxu9rjNqv/r+dNIi2r/mOB8ikWovVtO8t3eWoEkPfHbaNgrVP8K7zNKQPv0tvqoRdlMoLeBsmDRijOho4pH523tE66nZJlFO0Af/1Ee/rQr/hKuxhQ0Eh61YmVzxm9cOYQpn5v6lX8O1jwh1iqrEmqBC+kj4EWhxPHNFmIkgkF1g/Nri8BRnI2dlB5YTIkXw3Ela9SXK8DoAm1MkNXMe6E8htFUqleMg53OdPFm1FqY/qur8ZiG5/AoQSif7huP9Y/rxSHfXjhwSqM4jTpS9YDSE9pqqZbwFAgNpBMtiBs2Ev1LaM7zalurBW1gBY/F6XxPmn3mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rQ6MFXwwfRrMdry4q4jsuQ/BhI0nC6urImVsizcMQt8=;
 b=V9I7y8yIaFvJIGTdZcyHuwsj9d5vulWVKnqcCcIIrJOAuxsmEZlNrOmY3+SpGtfO1JGJlOeNDVepR5kN+Q5eG1MAdlBwzup6JjTIQG4T3JHk3s+kjPfX+2mmQh3usQPBADYRN1zsDOUpjGfDO1UGGQQD4PdwYEEfigiNFhHlj6Dwz9KMbaMUSaUdpt/y1WH//zwvWbB0rprM/yduDuCmCBQO4TefRAGqijicW49kGPO0PhhLJgEFnICZL6wpNNwmBT5NJW1zMtb0pVFu7WR1z4zpmxix+gBZsBO4wj7v30GC/lh4zrnzGr86x32P0NoBe1FwYhwBOMUHr0b4pxrviA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rQ6MFXwwfRrMdry4q4jsuQ/BhI0nC6urImVsizcMQt8=;
 b=RCKcPYs7SH853leVQhqes4kQKbKVY3DgGDbqlj9Ib5bNz0gJPBVivqq+2CmRmD7EstGXYPqBA6lDFB8Aq531uZIEPIzCu7JXC2LHhqryvrM0tDSL5C7NuSFRqi5GZaku+cKfx0GZkvhydppDIujIXy0mw2xx0APsf74eIItmDfs=
Received: from MW4PR04CA0250.namprd04.prod.outlook.com (2603:10b6:303:88::15)
 by DS7PR19MB6376.namprd19.prod.outlook.com (2603:10b6:8:94::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.50; Mon, 31 Mar 2025 09:34:56 +0000
Received: from MWH0EPF000989EC.namprd02.prod.outlook.com
 (2603:10b6:303:88:cafe::92) by MW4PR04CA0250.outlook.office365.com
 (2603:10b6:303:88::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.54 via Frontend Transport; Mon,
 31 Mar 2025 09:34:56 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of cirrus.com does not
 designate 84.19.233.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=84.19.233.75; helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000989EC.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.22
 via Frontend Transport; Mon, 31 Mar 2025 09:34:54 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com
 [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id EC230406547;
	Mon, 31 Mar 2025 09:34:52 +0000 (UTC)
Received: from lonswws02.ad.cirrus.com (lonswws02.ad.cirrus.com
 [198.90.188.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id B447C820244;
	Mon, 31 Mar 2025 09:34:52 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
        Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PATCH alsa-ucm-conf v1] sof-soundwire: Add LED support for cs35l56
 amplifiers
Date: Mon, 31 Mar 2025 10:34:30 +0100
Message-ID: <20250331093440.9412-1-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EC:EE_|DS7PR19MB6376:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 71c3450a-2dfe-4e89-4c18-08dd70374b98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|61400799027|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?D75EReaTOFwwjECsGEZgwvqJbnzFYrutwMEMQQyrGFp8LMAJHeHz5w+UoB2+?=
 =?us-ascii?Q?ZbxOMyItHBJ2urMekwWVSxYeObYClo5O/sdUzJer7G5rTyiDqSZF6wVjOGlD?=
 =?us-ascii?Q?X0JiaCYtRh5bjcwqMJekIU/YY8AaVm5Dc1A2V54U4A7u6ckNUUDQ04M+rZ4K?=
 =?us-ascii?Q?3BCDVoYI715Mq1jv0jGf/Yboo633PSvJQCBvfYT+etSCHRGf+nWRpUwb8Uoh?=
 =?us-ascii?Q?2hxzhXHBB1qSi44ulqfTofBgydekRJKoHMnTw7UPMBl21JlyZULRDtATQK8y?=
 =?us-ascii?Q?c3m44cHHGw1ZqBFznDv4T/Kevi7C05OGt0QE8lNHx36zIZxKpD1JMcBoVGUi?=
 =?us-ascii?Q?WH5qRMyAykMM3hTGGTwHzUwI1d30NP2oD0mahsxZ1VAhdn/QxrIm1wOun+k1?=
 =?us-ascii?Q?1+iztb8U3JyV3zIP/iz1WMQ/vg+4iLBh26P+cxNExe1jKUa6ReQXU5PcXcGA?=
 =?us-ascii?Q?gsi9aKQJGmdRqTFB6cPPhoKf8y43tNAbVSFpNjp77Uv2X7NTBPKZX/fLtP7j?=
 =?us-ascii?Q?nuRplyQjRkABhtuWOHXOuZYOBkzl32zZH6Ew6sJ9UtsoOnPLgqkdEMgLeHaV?=
 =?us-ascii?Q?kzMqAimjPW0FvvNDcLNhuWS2y7sJD+PwJ6pqp/Yt5IRHnOSMM1lnxmAj1Csj?=
 =?us-ascii?Q?gKGN2EC8uWRyaEGkD+PY9edkYZ7qGszdYwMLBh26OdZBCbSvNo2qtKiTbFP8?=
 =?us-ascii?Q?AAMEmZ1afVKODx3eoToPoNcZXhGBVLdUwBGO467Uk5XkCtSZ0WV4fLtg6344?=
 =?us-ascii?Q?YVNmIMkyjrr3wMlMqSDNSKatKcP3xmFfSsYvD9OqctJr+friJBNFHRM6K3pS?=
 =?us-ascii?Q?7HzqHnjawmD8XaCeqMB8AV8A29ioiDBq2BDYs7gOMtJwIw7LHJb0Rb+wrz8G?=
 =?us-ascii?Q?x+DnhNNtrCU24Q2uyPBPzs/ebFQnCRFdeUjVln5NHWgXDP4jE+SYnXSzqBXM?=
 =?us-ascii?Q?h07+PU3WMEJEEc1QKh2B2uSOwnC+pXJrEg2KCdPcEWCcu8MJsxYLNtu6WmUQ?=
 =?us-ascii?Q?Nc3TTZbiWg7hmbhVo/urW1Sk+t5WPO39X8PmlEhm/SfGyao8Eh4sYWNXgFFY?=
 =?us-ascii?Q?cKgrTFUP9cW6XpTAaus3V9AjJNtYByeWm1Wcne9tC/lQlTbYchONB8YN7dru?=
 =?us-ascii?Q?iPNgWEd5SRzQ/vMUv9Pdzbl3p2Rj/iAYD8oUevXQUkGk8Ullwx5cmFDgvTeR?=
 =?us-ascii?Q?1Gl9dNsbVnwZXnyoEgt5d+JrfxZVXo0MCbvAV8glPtPh+mI4HtP1c87snwvg?=
 =?us-ascii?Q?L66ixZSl2Y/3axA/ixSUeh7RVQ3TuNRiwZqZgK2bkpfqwbLqJaQ/q/gka2ky?=
 =?us-ascii?Q?CTqpqrZrk3VOZeCa/wBE8eXUAErwHrEmij9cINWh7DsXAew99yy1GC+7Cwb/?=
 =?us-ascii?Q?UZz17YzPIdG0/KpWlycXPUnFFj6SgOOaK96x/8Fqh4xjOY/QIY5IsQKaZeiK?=
 =?us-ascii?Q?8+MV8p8bFQCNuhZHZxA19sGH+Nb7n2VWqoRglXDdOLB+8WMijJsBlI9njdjV?=
 =?us-ascii?Q?MT8i7X1Q138gU+k=3D?=
X-Forefront-Antispam-Report: 
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 09:34:54.6981
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 71c3450a-2dfe-4e89-4c18-08dd70374b98
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000989EC.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB6376
X-Authority-Analysis: v=2.4 cv=VYn3PEp9 c=1 sm=1 tr=0 ts=67ea61c7 cx=c_pps
 a=7lEIVCGJCL/qymYIH7Lzhw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=Vs1iUdzkB0EA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=hG3oIBug7HT4u3wZ-x4A:9
 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-GUID: kTMkivWSnuPq-nWjvOKDrs6lnUq0u-cw
X-Proofpoint-ORIG-GUID: kTMkivWSnuPq-nWjvOKDrs6lnUq0u-cw
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: JN4LQQNV46OIICF2JDJRYD5IXX7YDQYN
X-Message-ID-Hash: JN4LQQNV46OIICF2JDJRYD5IXX7YDQYN
X-MailFrom: prvs=3185ccb388=stefan.binding@cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JN4LQQNV46OIICF2JDJRYD5IXX7YDQYN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Systems may have up to 8 CS35L56 amplifiers, and each amplifier should
be attached to the speaker LED. A mapped Playback switch is required to
ensure all amps are muted and unmute appropriately.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 ucm2/codecs/cs35l56-bridge/init.conf  | 11 ++++++++
 ucm2/codecs/cs35l56/init.conf         | 36 +++++++++++++++++++++++++++
 ucm2/sof-soundwire/cs35l56.conf       | 32 ++----------------------
 ucm2/sof-soundwire/sof-soundwire.conf |  4 +--
 4 files changed, 51 insertions(+), 32 deletions(-)
 create mode 100644 ucm2/codecs/cs35l56-bridge/init.conf
 create mode 100644 ucm2/codecs/cs35l56/init.conf

diff --git a/ucm2/codecs/cs35l56-bridge/init.conf b/ucm2/codecs/cs35l56-bridge/init.conf
new file mode 100644
index 000000000000..407bb0937559
--- /dev/null
+++ b/ucm2/codecs/cs35l56-bridge/init.conf
@@ -0,0 +1,11 @@
+# cs35l56 specific control settings
+
+FixedBootSequence [
+	cset "name='AMPL Speaker Switch' 0"
+	cset "name='AMPR Speaker Switch' 0"
+]
+
+Macro [
+	{ SetLED { LED="speaker" Action="attach" CtlId="AMPL Speaker Switch" } }
+	{ SetLED { LED="speaker" Action="attach" CtlId="AMPR Speaker Switch" } }
+]
\ No newline at end of file
diff --git a/ucm2/codecs/cs35l56/init.conf b/ucm2/codecs/cs35l56/init.conf
new file mode 100644
index 000000000000..dca14c709fda
--- /dev/null
+++ b/ucm2/codecs/cs35l56/init.conf
@@ -0,0 +1,36 @@
+# cs35l56 specific control settings
+
+#
+# Arguments:
+#   ForAmps - regex filter for var:SpeakerAmps
+#   Amp - amplifier number 1-8
+#
+DefineMacro.cs35l56spkInit.If.0 {
+	Condition {
+		Type RegexMatch
+		Regex "${var:__ForAmps}"
+		String "${var:SpeakerAmps}"
+	}
+	True {
+		LibraryConfig.remap.Config.ctl.default.map {
+			"name='cs35l56 Speaker Playback Switch'" {
+				"name='AMP${var:__Amp} Speaker Switch'".vindex."${eval:($__Amp-1)}" 0
+			}
+		}
+		FixedBootSequence [
+			cset "name='AMP${var:__Amp} Speaker Switch' 0"
+		]
+		Macro [{ SetLED { LED="speaker" Action="attach" CtlId="AMP${var:__Amp} Speaker Switch" } }]
+	}
+}
+
+Macro [
+	{ cs35l56spkInit { ForAmps "[1-8]" Amp 1 } }
+	{ cs35l56spkInit { ForAmps "[2-8]" Amp 2 } }
+	{ cs35l56spkInit { ForAmps "[3-8]" Amp 3 } }
+	{ cs35l56spkInit { ForAmps "[4-8]" Amp 4 } }
+	{ cs35l56spkInit { ForAmps "[5-8]" Amp 5 } }
+	{ cs35l56spkInit { ForAmps "[6-8]" Amp 6 } }
+	{ cs35l56spkInit { ForAmps "[78]" Amp 7 } }
+	{ cs35l56spkInit { ForAmps "8" Amp 8 } }
+]
diff --git a/ucm2/sof-soundwire/cs35l56.conf b/ucm2/sof-soundwire/cs35l56.conf
index f74b99afbb55..53e4d6dd8eda 100644
--- a/ucm2/sof-soundwire/cs35l56.conf
+++ b/ucm2/sof-soundwire/cs35l56.conf
@@ -1,40 +1,12 @@
 # Use case Configuration for sof-soundwire card
 
-#
-# Arguments:
-#   ForAmps - regex filter for var:SpeakerAmps
-#   Amp - amplifier number 1-8
-#
-DefineMacro.cs42l43spk.If.0 {
-	Condition {
-		Type RegexMatch
-		Regex "${var:__ForAmps}"
-		String "${var:SpeakerAmps}"
-	}
-	True {
-		EnableSequence [
-			cset "name='AMP${var:__Amp} Speaker Switch' 1"
-		]
-		DisableSequence [
-			cset "name='AMP${var:__Amp} Speaker Switch' 0"
-		]
-	}
-}
-
 SectionDevice."Speaker" {
 	Comment "Speaker"
 
-	Macro.num1.cs42l43spk { ForAmps "[1-8]" Amp 1 }
-	Macro.num2.cs42l43spk { ForAmps "[2-8]" Amp 2 }
-	Macro.num3.cs42l43spk { ForAmps "[3-8]" Amp 3 }
-	Macro.num4.cs42l43spk { ForAmps "[4-8]" Amp 4 }
-	Macro.num5.cs42l43spk { ForAmps "[5-8]" Amp 5 }
-	Macro.num6.cs42l43spk { ForAmps "[6-8]" Amp 6 }
-	Macro.num7.cs42l43spk { ForAmps "[78]" Amp 7 }
-	Macro.num8.cs42l43spk { ForAmps "8" Amp 8 }
-
 	Value {
 		PlaybackPriority 100
 		PlaybackPCM "hw:${CardId},2"
+		PlaybackMixer "default:${CardId}"
+		PlaybackMixerElem "cs35l56 Speaker"
 	}
 }
diff --git a/ucm2/sof-soundwire/sof-soundwire.conf b/ucm2/sof-soundwire/sof-soundwire.conf
index 1cddfbf4cfbf..8f9bc82c2d3b 100644
--- a/ucm2/sof-soundwire/sof-soundwire.conf
+++ b/ucm2/sof-soundwire/sof-soundwire.conf
@@ -102,10 +102,10 @@ If.multi_headset {
 	}
 }
 
-If.spk_init_rt1318 {
+If.spk_init {
 	Condition {
 		Type RegexMatch
-		Regex "(rt1318(-1)?)"
+		Regex "(rt1318(-1)?|cs35l56(-bridge)?)"
 		String "${var:SpeakerCodec1}"
 	}
 	True.Include.spk_init.File "/codecs/${var:SpeakerCodec1}/init.conf"
-- 
2.43.0

