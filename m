Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFFB70639E
	for <lists+alsa-devel@lfdr.de>; Wed, 17 May 2023 11:09:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE32B1F4;
	Wed, 17 May 2023 11:09:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE32B1F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684314591;
	bh=+tFoiyZyg8X92vuEQaogEHjQLzegXCksat8B0ossj5I=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ZjgAgy6Y0895R7NhUUoZApX+CVpB3tjQkP0hZspbB36nlIpriPDTy9hbdHG/FLsEn
	 bBeyL1sjW7s34OHCdKuLEd1hDgU3lt3BD1kwnf/XEwHVZxnQd7e45U9PXcfnELQAsH
	 tm3yRKeG+sM/Nfy9jAHm7PtrFchklaRVwX8YxnPc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30A55F8016A; Wed, 17 May 2023 11:09:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E8DF1F8025A;
	Wed, 17 May 2023 11:09:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3718AF80272; Wed, 17 May 2023 11:08:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20613.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::613])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9D5A1F8016A
	for <alsa-devel@alsa-project.org>; Wed, 17 May 2023 11:08:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D5A1F8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=ZEwSx4NR
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bkfIG6q8Kn9Pqc9R/zEjapnuIB1T/koOqM94VJJoVJYboo7g/ErtF/jOtQitpRdO5C9VXZYwhp+4YWiTwrAaOFhWyysbfInuT3GfgzLLOTCt7d7o5hxmzOahZfuZ488aWzTgHEBNFAUnDKMRDcfVglA94Hiv+hIy+oE80ayz4tEtqXxiZDBwUTxoCis3bO71CoFQGQdXhTnFcUuYaG7Z7TCoiX3k6Kj+WXXQAZHij5OerTtlEydTNcMiS7dIfnTSxjvhjV4ZINkQPB3YOlxTDpIDQ+SDifDbqjhCMYRAPhQBwF24XnIPq5B1pm8kzQGgBQuT1Zx77vwFk3dsrJb/Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UaKO0xdWMvRoDA5/R/vhebIqEam3Ma2iSc0z1kM87SQ=;
 b=mJjqFG23/WuLm4kWEI/ZAjOvo5TRI9BKjP0+rpEk5qdpF/qqtlQF9lEM5YIKFTZhp8iHHOBvewrVp6AAIvEQYNqV/2vKi/4bYaoZqkdPiqWCrtstU4fNjoY2NzwXFc5CL6YVEp6G/PUzETAzXmxiE8AUztHyNBG29QNFLHdLLlRljLOYAPDv963lk+Z4X1rgINNL5H2fRxslod5M+C45MI81fYhZzRgQQfOkLwAZ/8AE52MqG3IM2Hz+jPf2YHWFMCNC9xA3mMPnKUoDixUAMpOn6rSiVoHkXcEhe4X6WQ4c+1ocS2otepCGWapRf2w3MobVB7ZtNlDdDQjtGdq74w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=suse.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UaKO0xdWMvRoDA5/R/vhebIqEam3Ma2iSc0z1kM87SQ=;
 b=ZEwSx4NR5Lfp5pcnCiFnJcKv75XGFjvk1EAOYXzeOS9GIo3LqCUxUbqvOfcZiisGSKuqDhIfrWYNA1IgNtMiyRlWcXPxlGuOYICQM6/M3fV/kTnIg0hA6t6k7j6wIU+iJ/8gAO+hxvflcIHdn1NKIeJlgh7hLhyBII5KTRDfjlkYdj7Zqj5OogCIQCzcKR6/4qlROZSBkDOSW/31A9BoW5vBfHme4KGqBqdPvc7vLdYNf7SG0Cqs+AvQ3vl9djabY+bViJfK9ADQusg+TadO1ye+WB4uvTeHjmvMIBQg3KNtMxHhx+7wLHAA+npMMjOOX9OWI/yHHWKU72+GnOXLpg==
Received: from MW4PR04CA0061.namprd04.prod.outlook.com (2603:10b6:303:6b::6)
 by DS0PR12MB8269.namprd12.prod.outlook.com (2603:10b6:8:fd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Wed, 17 May
 2023 09:08:46 +0000
Received: from CO1NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:6b:cafe::f9) by MW4PR04CA0061.outlook.office365.com
 (2603:10b6:303:6b::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33 via Frontend
 Transport; Wed, 17 May 2023 09:08:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1NAM11FT048.mail.protection.outlook.com (10.13.175.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.17 via Frontend Transport; Wed, 17 May 2023 09:08:45 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Wed, 17 May 2023
 02:08:28 -0700
Received: from nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37; Wed, 17 May
 2023 02:08:26 -0700
From: Nikhil Mahale <nmahale@nvidia.com>
To: <tiwai@suse.com>, <alsa-devel@alsa-project.org>, <perex@perex.cz>
CC: <linux-kernel@vger.kernel.org>, <aplattner@nvidia.com>, Nikhil Mahale
	<nmahale@nvidia.com>
Subject: [PATCH] ALSA: hda: Add NVIDIA codec IDs a3 through a7 to patch table
Date: Wed, 17 May 2023 14:37:36 +0530
Message-ID: <20230517090736.15088-1-nmahale@nvidia.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT048:EE_|DS0PR12MB8269:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b0c3610-6450-473e-ed22-08db56b651ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ocv/2grHVqo3QbKkWHFVMBJwFDeAKElFrsiwUcjgkFj3qxgXgx8URblAkBMNz/L59KsJNphtiu0kzz6QQ5DpK6LIhKoccwRGyJ0LD0tFgvoeX3Ye0lyYifvEo9JmVgFN9d+vHGD6nAg8NQeFHZdygtjX8CuoiPPwHSWfA3mrDGB5aAPVY3/zYA6cZaACY5OpBI9Y09lIyTpzKxXZjK/lTkRbUI7wI+8yDEAvqfiKsqMDIiDoLR9fT4TVsCyjn/bPxS28KQlrNnGPVDdaUUTwXWTji7hjLPuB9aCqhkRMo3ZofLqZ+eaFkI0zKQ9vpmHgNb/7OXN1Qrexstf7n9VO0Io32bqT+ZlI/aQAFHHmv6LT8QTowBp9LBgkYH2ncMa6jbFoVukhur2UQydpSh9jTFofErU/8n9ZEab/y16s5/a94G+P94osqSc4MyJLBJEsG0GEDtQ419gDCiIRTuTxesN/n2cgcHHilBT0/XjDxilv/IK79pHqHFxNFzCxbXSL9bhvBaD0zAbS/rDZB7WAUmOj0LTvJiypRE2bXwB8bYyE3mHJ3oGJavSeFKYEO4NyQBqcQ2WIJ8sRBYygYDXmhPmZN9UD+KhtzdeJYNrLLu+by8b0cQnFXwxTkIDGsSJ8JS4zc0qlOqE4+xypIzpiv8FwN73k61jUkdd+AkpYB/Npy+Vt5WLY6dqYOzOEdy7JkV/4cpfCiIsJ3T4JCl1QxY43f0JCu5Ca/7h7l8Fm1gxNMwlIrBAS+IdC3ccrUS3M
X-Forefront-Antispam-Report: 
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(136003)(39860400002)(451199021)(46966006)(36840700001)(40470700004)(5660300002)(8676002)(8936002)(86362001)(336012)(426003)(2616005)(47076005)(36860700001)(82310400005)(16526019)(107886003)(186003)(356005)(26005)(6286002)(1076003)(82740400003)(7636003)(40460700003)(41300700001)(478600001)(110136005)(6666004)(54906003)(7696005)(55016003)(40480700001)(70586007)(70206006)(36756003)(4326008)(316002)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 09:08:45.6736
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7b0c3610-6450-473e-ed22-08db56b651ba
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8269
Message-ID-Hash: W42KEHNVEM7QD27RXGMHPWZQTRXLO7EF
X-Message-ID-Hash: W42KEHNVEM7QD27RXGMHPWZQTRXLO7EF
X-MailFrom: nmahale@nvidia.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W42KEHNVEM7QD27RXGMHPWZQTRXLO7EF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

These IDs are for AD102, AD103, AD104, AD106, and AD107 gpus with
audio functions that are largely similar to the existing ones.

Tested audio using gnome-settings, over HDMI, DP-SST and DP-MST
connections on AD106 gpu.

Signed-off-by: Nikhil Mahale <nmahale@nvidia.com>
---
 sound/pci/hda/patch_hdmi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 64a944016c78..5c0b1a09fd57 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -4589,6 +4589,11 @@ HDA_CODEC_ENTRY(0x10de009d, "GPU 9d HDMI/DP",	patch_nvhdmi),
 HDA_CODEC_ENTRY(0x10de009e, "GPU 9e HDMI/DP",	patch_nvhdmi),
 HDA_CODEC_ENTRY(0x10de009f, "GPU 9f HDMI/DP",	patch_nvhdmi),
 HDA_CODEC_ENTRY(0x10de00a0, "GPU a0 HDMI/DP",	patch_nvhdmi),
+HDA_CODEC_ENTRY(0x10de00a3, "GPU a3 HDMI/DP",	patch_nvhdmi),
+HDA_CODEC_ENTRY(0x10de00a4, "GPU a4 HDMI/DP",	patch_nvhdmi),
+HDA_CODEC_ENTRY(0x10de00a5, "GPU a5 HDMI/DP",	patch_nvhdmi),
+HDA_CODEC_ENTRY(0x10de00a6, "GPU a6 HDMI/DP",	patch_nvhdmi),
+HDA_CODEC_ENTRY(0x10de00a7, "GPU a7 HDMI/DP",	patch_nvhdmi),
 HDA_CODEC_ENTRY(0x10de8001, "MCP73 HDMI",	patch_nvhdmi_2ch),
 HDA_CODEC_ENTRY(0x10de8067, "MCP67/68 HDMI",	patch_nvhdmi_2ch),
 HDA_CODEC_ENTRY(0x67663d82, "Arise 82 HDMI/DP",	patch_gf_hdmi),
-- 
2.35.3

