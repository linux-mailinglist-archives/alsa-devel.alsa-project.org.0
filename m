Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A790F808006
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Dec 2023 06:13:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA7F2820;
	Thu,  7 Dec 2023 06:13:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA7F2820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701926031;
	bh=Ywo/QY55XBrYEewY8gYm1Qf89Se/ZSU288RtGDetaA0=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=SCPNKvqC2+8mbMT/l9lHzq22Wuj7VoxBaYZFJcuDhgHrR8/1XmzRyhPGbT9wZu4EV
	 cBBx2uQ1xl0iiTmDoog6tT++KrYvsNuJL6IyGLkVzfbM21bvuC5TiE/ok0hspEbF27
	 tIzObne81TpBaT6de1Jjz9VMWc6jE3PizlN4eqz8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37B2CF8028D; Thu,  7 Dec 2023 06:13:28 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D355F80570;
	Thu,  7 Dec 2023 06:13:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2EF1EF800E4; Thu,  7 Dec 2023 06:00:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	TIME_LIMIT_EXCEEDED,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable version=3.4.6
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2061c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e83::61c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 04A2BF800E4
	for <alsa-devel@alsa-project.org>; Thu,  7 Dec 2023 05:55:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04A2BF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=k8ap0Rrp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U4tAsPiIe3HfMgjpj8L8f0Q2e1IpVoArkk31Of8xpnWuSrSIdY7rB+vZPLSXcOQTh3KIlX9yBa8E12ld8POaOBg58wDSIGMftzWRKQZd7erpKquzRL8fQBlpC34w75oqV9JTUnp8plMcUP6TI/UIyPf/+OBw6c+w4aHM7Xu+zRYLN5gsV2l9fzvKg7q7RKy9OxEYuF4xpvlFWls7PDbWBvTsFz217nxbocD56Kcex/oIKCWGYzCsxaZeqJNIIBFgG5J2h/ay5tZYvg6rpBREorx/+y2u8Im/t2kO/EQslQ3elJxdu4wt2k+EG4+wdlAYLM8tFTPjnsXKsw1OC7eE4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=whrnH9ZlT0MK4HkNt6K9N/JI6oeK8QRp5CpZEtyHDBg=;
 b=k8tHx4bPoCdpSOf1qbn5gbF7g447ic4jKCgF945Mna2qergDgpLm2/udPLMU/mQhO0MqbB1ni1uyHf3OnZvVz3wxhUDxV/7xNm7P9qUoSUYQpivTP43SqwggC2XKh+HVR5JonWrB/E3ZCTAxLLzF9QxiXNi3niPznymUcicqMWfHlR+XpmrinB9DjHvPuTvGdMBHWfF6W5fHgGLAC3W91t0zE1y6wJ67dCAgwiu6aqVo2Z+UUcWit2SntdqFu0URik4jY3HM93avWJIXcE/tPNMpMKgSHnXcqUI8L6DtBavCI5gF9mkhdTx2CopBGjMYhxHo9M+llZ/JU1wkqbk5ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=whrnH9ZlT0MK4HkNt6K9N/JI6oeK8QRp5CpZEtyHDBg=;
 b=k8ap0RrpGMrGYhzy4HB+afqzCHWarMbrrA+9y0SNyloaWAjNyVh8TnrdA6YkUJBipvCTAsC45vtjo0villPqMFUxpJFpNc25p6nihDzBkGHmUqVokn0pNUOIju9OUATYtM3X0nuA6xjQe2N30Y7IXhtYoa8TNAGjeQ1mt4NAuoQ=
Received: from BY5PR04CA0010.namprd04.prod.outlook.com (2603:10b6:a03:1d0::20)
 by SA1PR12MB8644.namprd12.prod.outlook.com (2603:10b6:806:384::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Thu, 7 Dec
 2023 04:55:11 +0000
Received: from CO1PEPF000044EE.namprd05.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::6b) by BY5PR04CA0010.outlook.office365.com
 (2603:10b6:a03:1d0::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34 via Frontend
 Transport; Thu, 7 Dec 2023 04:55:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044EE.mail.protection.outlook.com (10.167.241.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Thu, 7 Dec 2023 04:55:10 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 6 Dec
 2023 22:55:09 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Wed, 6 Dec
 2023 20:55:09 -0800
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34
 via Frontend Transport; Wed, 6 Dec 2023 22:55:06 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <Mario.Limonciello@amd.com>, Vijendar Mukunda
	<Vijendar.Mukunda@amd.com>, Liam Girdwood <lgirdwood@gmail.com>, "Jaroslav
 Kysela" <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Venkata Prasad
 Potturu" <venkataprasad.potturu@amd.com>, Marian Postevca
	<posteuca@mutex.one>, "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER
 MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] ASoC: amd: acp: modify config flag read logic
Date: Thu, 7 Dec 2023 10:25:01 +0530
Message-ID: <20231207045505.1519151-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044EE:EE_|SA1PR12MB8644:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d38d7ab-8bf8-41f7-ce2f-08dbf6e0b132
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Z6OExujGyWPxYsSyMaqzKwFbVh+6BLvzvDRTrhmCchT2GlrRurKbrAs40Nj0fTVCId+GIT1qWH0uWIsuB9NJIIdUG+0a98XSI7k+jIeP5ov0II+Ii18EetoDGai55IQRQl+G4SJM3KjTmZseG852uCmU6L2cvUCBy/5aPQC4fjEnZcHlkDMVHQPHjxLmZR2wnmXQhDn2BTRS5D7btS1OBLlLzHwg/ULWTw1VM7WtQcmCi5yY1WpBTzLMdLJsvecrdywHKgbL37YtVLBoqQXVUcieRWcJ0crqq9usbCUEb7WxEiBXIUX29v58w+goD1ufzIo59+drgfgfzn0yB2TihmrZ71CtcGja5yhYWuihkIoGgcRlkCRtu0DYOuk8C6FnPe9uVO81Jl4/oLatYioX2Y9fi/YlSYhbrINdq+pqN1YG5XHnVCLqwyQnISGjH4kXw53Bb8b6uBNpV5fBb0q3XNhaKZgnYqDIxffVO/LmOwTzA3TNXcidommyvDY3vSXc+Zo1FYRyM/E95aeGMXC+rf8w/C3mKVhTsuB0aj1X88wVQACoApvQxRkWzTAZEbmCWKk2pyWDebMhNKrejhEdfYwogcSC0Q+EVR2he6gzCX6PmjsFF/6Hd5/hK5CWeXnYLx3i3yTVTLldfwyjEDw+WHAWQPaHtuuL2+GPVTAANyZBmdAEjRdIfssaE0QLpKhWiLpvwRXzQMa92PbkDl41KjlUx8pLmu+DgF4CYNrnMOJ9GDlMrFG55o5IB8eNiqJjYd+jJGfumKNtmzSqaWFXtQ==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(346002)(376002)(396003)(230922051799003)(451199024)(82310400011)(186009)(1800799012)(64100799003)(36840700001)(46966006)(40470700004)(1076003)(41300700001)(2616005)(36756003)(26005)(426003)(40460700003)(86362001)(83380400001)(336012)(70586007)(8676002)(316002)(70206006)(6916009)(54906003)(6666004)(4326008)(8936002)(7696005)(478600001)(82740400003)(356005)(81166007)(36860700001)(2906002)(40480700001)(47076005)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2023 04:55:10.7498
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1d38d7ab-8bf8-41f7-ce2f-08dbf6e0b132
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000044EE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8644
Message-ID-Hash: WHRLK4EFRIZCTMVPPRGSACAEFGPUJWY6
X-Message-ID-Hash: WHRLK4EFRIZCTMVPPRGSACAEFGPUJWY6
X-MailFrom: Vijendar.Mukunda@amd.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WHRLK4EFRIZCTMVPPRGSACAEFGPUJWY6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Modify acp config flag read logic from ACP v7.0 onwards.
Instead of reading from DMI table match entry, read the
config flag value from BIOS ACPI table.
This will remove updating DMI table when new platform support
is added.
Use FLAG_AMD_LEGACY_ONLY_DMIC flag as default one.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp-config.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/acp-config.c b/sound/soc/amd/acp-config.c
index 20cee7104c2b..a9aac8f05cb9 100644
--- a/sound/soc/amd/acp-config.c
+++ b/sound/soc/amd/acp-config.c
@@ -19,6 +19,8 @@
 #include "../sof/amd/acp.h"
 #include "mach-config.h"
 
+#define ACP_7_0_REV	0x70
+
 static int acp_quirk_data;
 
 static const struct config_entry config_table[] = {
@@ -133,15 +135,33 @@ static const struct config_entry config_table[] = {
 	},
 };
 
+static int snd_amd_acp_acpi_find_config(struct pci_dev *pci)
+{
+	const union acpi_object *obj;
+	int acp_flag = FLAG_AMD_LEGACY_ONLY_DMIC;
+
+	if (!acpi_dev_get_property(ACPI_COMPANION(&pci->dev), "acp-audio-config-flag",
+				   ACPI_TYPE_INTEGER, &obj))
+		acp_flag = obj->integer.value;
+
+	return acp_flag;
+}
+
 int snd_amd_acp_find_config(struct pci_dev *pci)
 {
 	const struct config_entry *table = config_table;
 	u16 device = pci->device;
 	int i;
 
-	/* Do not enable FLAGS on older platforms with Rev id zero */
+	/* Do not enable FLAGS on older platforms with Rev Id zero
+	 * For platforms which has ACP 7.0 or higher, read the acp
+	 * config flag from BIOS ACPI table and for older platforms
+	 * read it from DMI tables.
+	 */
 	if (!pci->revision)
 		return 0;
+	else if (pci->revision >= ACP_7_0_REV)
+		return snd_amd_acp_acpi_find_config(pci);
 
 	for (i = 0; i < ARRAY_SIZE(config_table); i++, table++) {
 		if (table->device != device)
-- 
2.34.1

