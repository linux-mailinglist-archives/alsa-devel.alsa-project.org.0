Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA2979435B
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Sep 2023 20:58:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2EA974C;
	Wed,  6 Sep 2023 20:57:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2EA974C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694026688;
	bh=cIH9om/GNhIxk31g3AXC3UFpJVqp6UUNDUoU65Va4U4=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=MkhQlJHtw7DN8QIkaEDIe9Z+c8wsxWBUlsX2Bge7kUrC12wLqa266Yb2utHuX7bTQ
	 jK7U+7/H5/X1C049tUK+PlU8+voG2J/1gUUWn8aDzHo8gn1c7BU9qPLUXtLf7GK1pF
	 IgVIS8twYre1LmxR/bkbczmWFpMeUJnrOjcUdkYo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A08EF80537; Wed,  6 Sep 2023 20:57:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DBE14F8047D;
	Wed,  6 Sep 2023 20:57:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89B08F80494; Wed,  6 Sep 2023 20:57:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20609.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::609])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 832EFF80431
	for <alsa-devel@alsa-project.org>; Wed,  6 Sep 2023 20:57:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 832EFF80431
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=WFjaYZxB
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IY7wSww6FgUFdbNAeqcXA918BJ3k3VlAeyU0ohdbh0uKmqDjbx2cc1DLtr3C5lzIjn4VYrADfp36N5rZLSmT7bgpaX9hChR9OMxw1knKP4b6xlyv5+ZIjS7uWixozc4t9Sc8MHRpa1nfTNBoe9KO9EE5bczdit6AQSKabg+inSHhDhPmOZa7UBmhgt2GJ9OvjAe1jLcM7fcMcAA5LSlIPg2zsr6c3hOtb75EBJiQNwPtuL3WwA47IR+oVDGnhIYH2xQRkf/xVVEyU2QEqzNzcN5kZlKezzpi6gR/vOjo1/EsOA3CaPaYMuQ7TYV+4SZqfr4umrYn8qDVDICUowp0gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JUhPFoaOxWMnPIJglh6t9xLOG5iIvyEo7v83sTN76Ss=;
 b=KEFGLpeNkrJwihn+wjAHr7Ocqci/SRUUGYmhMbrfeywRTYSjzBCaLPPXbHfN+CGERcmOBuowLaqEAgdgOLdAFUl5A5Q0teXLhia+3qpQFS41DDsds22CfnrQn8OZKE8Pm1bZBWZluzbyc2ukJKUycWv0uVolaPwTRsMCDJI7tmAchNQ1vJuqI1mK8SBLZ0/5/XxSquORqTgA2zEuWAW08fllWZph0oPNcgYTjQ2TP9x30nfPguaZRkwRX/n7iVucf0FwClINxlvKmJhPkodZ538aPjxmZJDFS0LbSQ7Zi1SIManM63yegr1dXZ+cybYU0mD6l9TAtHZdTixx7XhPCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JUhPFoaOxWMnPIJglh6t9xLOG5iIvyEo7v83sTN76Ss=;
 b=WFjaYZxBsswkB8a7u6Fb+MqZMkj05ziaytuTLtWM+ISzP1BBl8PiiUvNzCxNqdG0BFSU6nt5pnCQIl852+Q2BxrTDO4YjCoCP8J5g4V/L3rEjarSem9uDG156Uf5nVOSe63nrKzRMDN6AgbwNRkSgE3NvltZE7BH8905OW13fZw=
Received: from BL0PR0102CA0034.prod.exchangelabs.com (2603:10b6:207:18::47) by
 DM4PR12MB5866.namprd12.prod.outlook.com (2603:10b6:8:65::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6745.34; Wed, 6 Sep 2023 18:56:58 +0000
Received: from BL6PEPF0001AB56.namprd02.prod.outlook.com
 (2603:10b6:207:18:cafe::11) by BL0PR0102CA0034.outlook.office365.com
 (2603:10b6:207:18::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.30 via Frontend
 Transport; Wed, 6 Sep 2023 18:56:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB56.mail.protection.outlook.com (10.167.241.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6768.26 via Frontend Transport; Wed, 6 Sep 2023 18:56:57 +0000
Received: from AUS-P9-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 6 Sep
 2023 13:56:56 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: <tiwai@suse.com>, <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
	<Syed.SabaKareem@amd.com>, Mario Limonciello <mario.limonciello@amd.com>,
	<wildjim@kiwinet.org>
Subject: [PATCH] ASoC: amd: yc: Fix a non-functional mic on Lenovo 82TL
Date: Wed, 6 Sep 2023 13:22:57 -0500
Message-ID: <20230906182257.45736-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB56:EE_|DM4PR12MB5866:EE_
X-MS-Office365-Filtering-Correlation-Id: ee1c32b5-141e-459a-5a9c-08dbaf0b0ba0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2G2108Z9VAtJ17lSkln00fK8z7b1zoNF02w1zkA0xup72tBRgt7GVmqhNubad/NXyv70OFwNQVtnJWhwGE96Dnra468bTe/JlI8Xcr5BmFsBGgvvkOQ0DsOFuic2ej/PkQEx0ifZoMAT6z2yM74HgEJJ/tt1YTk1lmPzRhRUR4Un961TUZdoA9hGJf3qGnH1V2ovpphiToWo0e5eOU3sRUKXakm7pPUvN/2t4+xsdbyS6hABufJ3LftXskV5q/7vvyS6VBGI9FBE9613oJrXm2DDlmCbyKaHVcfiMUfNgfFV2DjLBJ0SWC1CrLg+tT+IqAnn7Z4m117+IqkKe+Cr2+5t8/hQHTn1W6HH4GVJefQLInt0VtnKFdfu82zjUVCW6GXyj0J2MpanXPVQmnO0LvZAsSYjEFgAR48BtMJ6RsQvbIVTLu0s1gqyM6UxMuk+tIJFH6RGqtqSTunH9Oz3TaG0+Rt0KTVPLq6XbnORA9MMfOAW9lP3SI5tqpU5r4bK7NWy6R16c/uM2U98Lw19Jdpz9y5BiU03JPmHH3Mj9Lm7gae5rbhrslDaBKjH9CS1M4TpHDtT8CTNRKAFuge9nl05Xs2YJy4tTUvlrWWCGegXormZ9JA2L4B8/qLi25sLGsVBLrv3EkmNs04r3+WUPQFALnvUjy0GlCcQzcoDFDbb/3VJPBpPlCBA4R4XDXo7oD5NrbzE0eIgoWyireGCdiNMsL+ucpw96sK1XRCJhr3/Zi/B3ZJIYkdH4CLagLug6LftBgqHo7uZkehJ9YK/HcfwU6ME1tjtT5eULZhhjut1rGuidn7Ph3g/lIQdpR/k
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(376002)(396003)(346002)(186009)(1800799009)(82310400011)(451199024)(36840700001)(46966006)(40470700004)(40460700003)(2906002)(966005)(82740400003)(86362001)(36860700001)(426003)(336012)(1076003)(16526019)(2616005)(26005)(36756003)(478600001)(7696005)(47076005)(83380400001)(356005)(81166007)(40480700001)(41300700001)(8936002)(4326008)(8676002)(4744005)(70586007)(110136005)(316002)(54906003)(5660300002)(70206006)(44832011)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 18:56:57.7147
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ee1c32b5-141e-459a-5a9c-08dbaf0b0ba0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB56.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5866
Message-ID-Hash: OCOCV7SSKN7S65BH34PAKYI7OTK5E7KP
X-Message-ID-Hash: OCOCV7SSKN7S65BH34PAKYI7OTK5E7KP
X-MailFrom: Mario.Limonciello@amd.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OCOCV7SSKN7S65BH34PAKYI7OTK5E7KP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Lenovo 82TL has DMIC connected like 82V2 does.  Also match
82TL.

Reported-by: wildjim@kiwinet.org
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217063
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index b304b3562c82..7c3b32d6f2fb 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -213,6 +213,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "21J6"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "82TL"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
-- 
2.34.1

