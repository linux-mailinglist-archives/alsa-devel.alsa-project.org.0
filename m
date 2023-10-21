Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B987D1DAE
	for <lists+alsa-devel@lfdr.de>; Sat, 21 Oct 2023 16:55:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 792AB93A;
	Sat, 21 Oct 2023 16:54:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 792AB93A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697900140;
	bh=akl1dhw+uIDA7aFj5EVe+lO7SIy9hxx5/+cbZjvi6Oc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Pga8JOlZ3buFHr6E80mfvkx22TOiOnnuTnGtFlViNbD0ORI25XSuNu4c4opPCghzp
	 j18gwwAHnc8Hw0TuK27Ty5NE0V2PwpeP5ir1U0uw7cl9YrMKdyPmTg50jbXmMpxdgo
	 I93o2vXg7Z/CgrGNBmODFmupolsjjysP5Yc4llaA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5293FF8055B; Sat, 21 Oct 2023 16:54:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EDBBEF8055B;
	Sat, 21 Oct 2023 16:54:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68419F8025F; Sat, 21 Oct 2023 16:51:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20605.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8c::605])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A7FBAF8025F
	for <alsa-devel@alsa-project.org>; Sat, 21 Oct 2023 16:51:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7FBAF8025F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=BRRl1Ij1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QF7O9TYDTw2MxKuTZcZ2bmtwbsOdwEiIchkYVX9aO3T3ITH4GzFRuzGQPa5qCTiGlGu6ZmgQG8Me4NLvhZ2c0VM/wvDdZ0uaQYwR2nDbyseicaERJZtAFX5nHU46I7Lx7yWpC27N+SOpu0ZTn2i1CwtMekd8e6CHJm6Abh2KTn34vdGsIhrAArpPceWiMHfTRZflaiFzZzwbpEUvKwLfbV7pmMySG5q7y/2iLOGTwgCCvS5UiP1wlDhklUPxDEtJmKG9yqw0JGV9EX14v7J2+ZGMxWIdHWbJZRjYW91pYH6rp0f40mq0ZegdeFiVo23QhOktXJUDW0xn5fgUWyJNsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X1gdeGaFPOZ8uVrIuwhhlwEbvP+4u8K/xjoJY4vtV9Q=;
 b=JppS9Y7lJL8CBdJTol0+Na5jUk28r2eAysWUjJdfsi5qWDoapj3TpMiKaZmn45qVTwVEXQK54xV454L8c27RhrT51fCwT2E7rYYR3u4Gk2BVxex8AA+SXk7vzLSrpjG7xxjIv8Y4sDmZZXnKDDw9LDYUnkKVUBc74Y1v7iMeHaD8g04t3rv9GZR9FTA4r+Q1mYYsBnJd35Q2A7HU9UreON0ay6rgIoyaoi8EvsOXfrAErwU5g1F6MzfHDWtz73PIMcWnzePzDqwvamADZx0pEvbeNf+XlT+jN8aPQkT9rpoIoAGieO+njOrZ1N1bW78xOVg0X/Q12zM2wMIdCvSYMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X1gdeGaFPOZ8uVrIuwhhlwEbvP+4u8K/xjoJY4vtV9Q=;
 b=BRRl1Ij1fDCQuI7caDkr84nZHE3ggp3P16ga/Pb7bxOvIZ8s32uBj/1YKVl4vZKCWXlSmHLvAWKtN1pPO1Qzp2WYbOfIynZFee73JSC07I1msfbL69LvBeCxlVAPjlTcRxVhQhWPOnDrwzmV87k2YFQH4gPBvYPJRbB45uKV6Oc=
Received: from PH7PR10CA0003.namprd10.prod.outlook.com (2603:10b6:510:23d::24)
 by MN0PR12MB5834.namprd12.prod.outlook.com (2603:10b6:208:379::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Sat, 21 Oct
 2023 14:51:37 +0000
Received: from SN1PEPF000252A2.namprd05.prod.outlook.com
 (2603:10b6:510:23d:cafe::25) by PH7PR10CA0003.outlook.office365.com
 (2603:10b6:510:23d::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26 via Frontend
 Transport; Sat, 21 Oct 2023 14:51:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF000252A2.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6907.20 via Frontend Transport; Sat, 21 Oct 2023 14:51:36 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sat, 21 Oct
 2023 09:51:36 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sat, 21 Oct
 2023 09:51:36 -0500
Received: from amd-B450M-DS3H.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Sat, 21 Oct 2023 09:51:31 -0500
From: Syed Saba Kareem <Syed.SabaKareem@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <mario.limonciello@amd.com>,
	<venkataprasad.potturu@amd.com>, <arungopal.kondaveeti@amd.com>,
	<mastan.katragadda@amd.com>, <juan.martinez@amd.com>, Syed Saba Kareem
	<Syed.SabaKareem@amd.com>, Liam Girdwood <lgirdwood@gmail.com>, "Jaroslav
 Kysela" <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, open list <linux-kernel@vger.kernel.org>
Subject: [PATCH 03/13] ASoC: amd: acp: add i2s clock generation support for
 acp6.3 based platforms
Date: Sat, 21 Oct 2023 20:20:44 +0530
Message-ID: <20231021145110.478744-3-Syed.SabaKareem@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231021145110.478744-1-Syed.SabaKareem@amd.com>
References: <20231021145110.478744-1-Syed.SabaKareem@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A2:EE_|MN0PR12MB5834:EE_
X-MS-Office365-Filtering-Correlation-Id: 695df26f-c2ba-49cf-419e-08dbd24539de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	32b6GS97myme6z82EnnhbyBM1R+tEw/rSAn8A/9uE+7tnmeRMJR0MkCaZKNsQur7V6yztT94q+te/6KMuWZZdBp1xVbXf46ofiPFIZQAZ8Wlh0uLM3q56Hhb9LCa0shu5HGCXiR679iogWtIpz/LU4i4x5L/rhRgYA+Mlfj6pyE+8PdNvQOJiaTxiJ74TeK0nLm8oQe9+P7i3Di8SCcb82sbq/ur4xtkT8H3v1fs5Xdo+ua4GysPXCLUauE5Ly/NrgvcEaWE5jJS+UPgoAMfzsZsVuVM9Q82VUuUmaf/s4qVaS0mO5pDkQbFg3Vvu6dUo45m6Dr9Zy7/zL/OP+aa4dtgY2gV2iXNlVB2fkOtwakoaMw2yEX6YmEQujgX6x2b3Gr5WIImnNX1x0ALXAUYmifkSKCNjHjoAdVv8MMFEezLB3MJcXlLUAgDZ2T0hmbePXPHAnBeeiFZ7k7g1TbBQF3juESXXTkkxAlG83W8h6/HKvlYe2UojwTZK/7ijLB1dJ7DKt2L/4juCin/c6M2sqhVxYhlm95SAGKivQQpmPkQ06dw3NxO0JFRYJQ07mxTVqVdQb0XZjmkfNFlAoRStWCclQ6DSwRoTi84FBOkJuvKp6kvq4wi+yCWs08m8Bcrfxv+kypReRBdC94Y55PuEs+7t+kffsfTtiQ6hE9j4/9KNtgGQx9UbnmVIb7AqkNrhC++rgFIRyN/vEmU7CWMXW2KXY9gdSDwMzumhQH5+Rt6DWGCb4FIeqzbqO2Ngh3Ia7ZW4ghfr++5ZQQob64tzg==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(346002)(396003)(39860400002)(230922051799003)(64100799003)(186009)(1800799009)(82310400011)(451199024)(36840700001)(40470700004)(46966006)(7696005)(336012)(40460700003)(426003)(54906003)(4326008)(316002)(6666004)(36860700001)(83380400001)(478600001)(41300700001)(8936002)(8676002)(2906002)(5660300002)(47076005)(70586007)(81166007)(110136005)(356005)(70206006)(82740400003)(26005)(1076003)(2616005)(86362001)(40480700001)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2023 14:51:36.8031
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 695df26f-c2ba-49cf-419e-08dbd24539de
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF000252A2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5834
Message-ID-Hash: 3WNYBW6H7CN7GKYLBG263B23BP3OEAYV
X-Message-ID-Hash: 3WNYBW6H7CN7GKYLBG263B23BP3OEAYV
X-MailFrom: Syed.SabaKareem@amd.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3WNYBW6H7CN7GKYLBG263B23BP3OEAYV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add I2S LRCLK & BCLK generation code for ACP6.3 based platforms.

Signed-off-by: Syed Saba Kareem <Syed.SabaKareem@amd.com>
---
 sound/soc/amd/acp/acp-i2s.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/sound/soc/amd/acp/acp-i2s.c b/sound/soc/amd/acp/acp-i2s.c
index 59d3a499771a..1185e5aac523 100644
--- a/sound/soc/amd/acp/acp-i2s.c
+++ b/sound/soc/amd/acp/acp-i2s.c
@@ -27,14 +27,19 @@
 #define DRV_NAME "acp_i2s_playcap"
 #define	I2S_MASTER_MODE_ENABLE		1
 #define	I2S_MODE_ENABLE			0
-#define	I2S_FORMAT_MODE			GENMASK(1, 1)
 #define	LRCLK_DIV_FIELD			GENMASK(10, 2)
 #define	BCLK_DIV_FIELD			GENMASK(23, 11)
+#define	ACP63_LRCLK_DIV_FIELD		GENMASK(12, 2)
+#define	ACP63_BCLK_DIV_FIELD		GENMASK(23, 13)
 
 static inline void acp_set_i2s_clk(struct acp_dev_data *adata, int dai_id)
 {
 	u32 i2s_clk_reg, val;
+	struct acp_chip_info *chip;
+	struct device *dev;
 
+	dev = adata->dev;
+	chip = dev_get_platdata(dev);
 	switch (dai_id) {
 	case I2S_SP_INSTANCE:
 		i2s_clk_reg = ACP_I2STDM0_MSTRCLKGEN;
@@ -52,8 +57,16 @@ static inline void acp_set_i2s_clk(struct acp_dev_data *adata, int dai_id)
 
 	val  = I2S_MASTER_MODE_ENABLE;
 	val |= I2S_MODE_ENABLE & BIT(1);
-	val |= FIELD_PREP(LRCLK_DIV_FIELD, adata->lrclk_div);
-	val |= FIELD_PREP(BCLK_DIV_FIELD, adata->bclk_div);
+
+	switch (chip->acp_rev) {
+	case ACP63_DEV:
+		val |= FIELD_PREP(ACP63_LRCLK_DIV_FIELD, adata->lrclk_div);
+		val |= FIELD_PREP(ACP63_BCLK_DIV_FIELD, adata->bclk_div);
+		break;
+	default:
+		val |= FIELD_PREP(LRCLK_DIV_FIELD, adata->lrclk_div);
+		val |= FIELD_PREP(BCLK_DIV_FIELD, adata->bclk_div);
+	}
 	writel(val, adata->acp_base + i2s_clk_reg);
 }
 
-- 
2.25.1

