Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2C88296C9
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jan 2024 11:00:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3320EF50;
	Wed, 10 Jan 2024 11:00:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3320EF50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704880831;
	bh=xtnWNxMlZ/kFUbpB1SCxK9crj+rv9OD5nBPgbH1ApHw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Fx22UjpVhKkfeiUgAa7p0PIPJYciSbH0OoEIfjk28fB9tTZG5AQ5GsQ1Q14GFrd3n
	 Dr43Gt5psKn5b02eP7P4zHzT+cpsyv4Z6Yi6yXB0QEDbabA9ADLF0wVKFo6SmyP7uN
	 Y3sh8QeSvejvbKfyj+S/2a9rEFUIIH7+oKVyLLxk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB97BF8068C; Wed, 10 Jan 2024 10:59:05 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 06EF8F80637;
	Wed, 10 Jan 2024 10:59:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83404F8057F; Wed, 10 Jan 2024 10:51:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,TIME_LIMIT_EXCEEDED,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable version=3.4.6
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20631.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::631])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CB0ECF80520
	for <alsa-devel@alsa-project.org>; Wed, 10 Jan 2024 10:45:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB0ECF80520
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=OD9yE4iT
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C7VU545qw6+LDcB2/+WMHomb/oFN9WW3Uy05SovrwAB5i04NIjUnfWljuHXSmejj9SAmKiBY+mqwovoD8Ak8ZXh0pQFvKXBHWsm/ZleQugxLkz0nrLgRMveMulWowUqP6fuf1ZvpYfp8dWCCTzt1V2Dpum6T8D/lqXCKjCnpR3c8fFfb2IUVEzWCEeOuJ2FwyupkHmdRp0obPXjuSlAbVwLByIQ4LURurp7cIqYDp2QGpfdMaO06P/PLFmn4iP2qN2dXc+51oAvQ3vTX5R2Bq5AGN8k+5+Fe/++8XXvKfHFotbHo6DkjeGr8Rwc9gEZVvNOHlP6S+ua7ZAsytw74sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xj1JFc79FiePafhI2kF+P2W/uJVnyNwBTnBQWQ8j/Vk=;
 b=n5ovqoTPHVaZwY9jFkyuUq0C37ezqBUf6tw38NUiI+8Ueru1AxpW9lqqk5KF4OA/u4CspMEGWFJnfqvH7zwj34tg/D35FEU5gBXt5/k+VWpq5Y8GnXqBYeISfjBCHyFIbsurc5gaQHlgFkFsGxxXd8j65Rf23Olcqsjoje3rhehsWnlZmofQzU+KGJA3EKMaUFmiSmeqyek4JCTa6D2ve3gKHGrST9KYwHdAmeojkmYxM7wXyDFaNMfh5f7EsJf0HLjGEaCwdDP7L3AAaBxJvbixcLqKf+/4tJUh+tD4KhgoCVZMVOI3NOVb0oHwGOhAdZI+X+J8hwv8timGDHABeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xj1JFc79FiePafhI2kF+P2W/uJVnyNwBTnBQWQ8j/Vk=;
 b=OD9yE4iT0m7EOhLCD8UBnNCqcrO4Jho9iu+Q1svvAISRNRRBDTHxr3RbX2OTdQ3l5DDmmRmW7/Am3hZC2axa/BllWgGF30GZHayObqv0lRR3G9UCE8yViONJ6KaOwxamkGOyUr0nzyrMoQyPnBg9stjq3vkFA6sl1FFXEBCoLo0=
Received: from SN6PR05CA0018.namprd05.prod.outlook.com (2603:10b6:805:de::31)
 by SA0PR12MB4511.namprd12.prod.outlook.com (2603:10b6:806:95::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.18; Wed, 10 Jan
 2024 09:45:44 +0000
Received: from SA2PEPF00001506.namprd04.prod.outlook.com
 (2603:10b6:805:de:cafe::e5) by SN6PR05CA0018.outlook.office365.com
 (2603:10b6:805:de::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.18 via Frontend
 Transport; Wed, 10 Jan 2024 09:45:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00001506.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.14 via Frontend Transport; Wed, 10 Jan 2024 09:45:44 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 10 Jan
 2024 03:45:26 -0600
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34
 via Frontend Transport; Wed, 10 Jan 2024 03:45:23 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <vkoul@kernel.org>
CC: <alsa-devel@alsa-project.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.intel.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <vinod.koul@intel.com>,
	<venkataprasad.potturu@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH V2 06/13] drivers: soundwire: amd: refactor register mask
 structure
Date: Wed, 10 Jan 2024 15:14:09 +0530
Message-ID: <20240110094416.853610-7-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240110094416.853610-1-Vijendar.Mukunda@amd.com>
References: <20240110094416.853610-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001506:EE_|SA0PR12MB4511:EE_
X-MS-Office365-Filtering-Correlation-Id: 759fbdd6-b88d-4a8a-6db7-08dc11c0eaa1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wUH7ZCWamP0gE4UDji50gkBTW62A7PHIcTjAenWnZfP6xi148wEXd8IAwKWvjBlGl2Kz97hNgxz6zzHlj8CFEUYL1h8//GVkfVjrCGEW474nkqBZTduqIzEuOdxxVelkJqzMLN2+qzv4nxdvS4P9+Ub/Jf5PeVBRdfuGUi805/XL/0iNPEYe0NJnUJZmPGoq4+Mj5zTPg88/FQ6YuzMXZdDF45AftHufuSxfvLlsKsUlaNhLN16kaB0EqP2lN+1zRxxN5pE2CMQL/+o5l8qy62D5l6ulFMEJ903n32c8cd4lQV+TXtCpZtIAMNEzBSba0ql2rmr/S9OXOajLXQij+FiYB/PP3JdSxSIwCbrQ7FGWzVJlt+Jok0/DESY9u9UKe7fR4838vYvislMC0PrBQHz5lsQW63hul6bkNu2OYUdU9AnOx5HJWB5ttCI9DPiSVfIzXLNVFHV9NywerqQN1B3FRZ8aJeJA5lsluxVG8YhhjdxediQn7UogaRQW9qxeW3L6d5QRPzVzr3OJZpmEDiJ+J8NHkRnQSRu/AwVJODk9JLz1ptcbpC5EaZqt/wotGCyRPm2q3TPto0rVJu/5tnx0dUZjh8gWvf7Q+ruFeQitoOxZQVe5GFNOPghEJuRd3xuusqJFcTyKaqIJMGacooozN6c771aeUnvUj516cdpbAq2XOMmkYZ6aQpKpGhaLS32XBe6G7EPiwotr+MxzMLEzWVwcfZRUjnHfadleLme0+NdL+Vn5rIgeV7zGgZwz4kg/SS5ot/Mpi6I0rloHiKKFkh9RWCA/nOmAZ507XI4KeShLKXdO5a5h57GgW0Qj
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(346002)(396003)(136003)(230173577357003)(230273577357003)(230922051799003)(64100799003)(1800799012)(186009)(82310400011)(451199024)(40470700004)(46966006)(36840700001)(2616005)(26005)(1076003)(336012)(426003)(6666004)(7696005)(478600001)(36860700001)(83380400001)(47076005)(5660300002)(2906002)(41300700001)(4326008)(70586007)(70206006)(8676002)(8936002)(110136005)(54906003)(316002)(81166007)(356005)(86362001)(82740400003)(36756003)(40460700003)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2024 09:45:44.7140
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 759fbdd6-b88d-4a8a-6db7-08dc11c0eaa1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00001506.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4511
Message-ID-Hash: 4HNYV2CYJI3NP6433MQLPDGGSQL2ZGNW
X-Message-ID-Hash: 4HNYV2CYJI3NP6433MQLPDGGSQL2ZGNW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4HNYV2CYJI3NP6433MQLPDGGSQL2ZGNW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Register mask array structure is no longer needed as except interrupt
control masks, rest of the register masks are not used in code.
Use array for interrupt masks instead of structure.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c   |  7 ++-----
 drivers/soundwire/amd_manager.h   | 12 ++----------
 include/linux/soundwire/sdw_amd.h |  8 --------
 3 files changed, 4 insertions(+), 23 deletions(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 7ccafd8eab7d..111891cb601d 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -86,12 +86,11 @@ static int amd_disable_sdw_manager(struct amd_sdw_manager *amd_manager)
 
 static void amd_enable_sdw_interrupts(struct amd_sdw_manager *amd_manager)
 {
-	struct sdw_manager_reg_mask *reg_mask = amd_manager->reg_mask;
 	u32 val;
 
 	mutex_lock(amd_manager->acp_sdw_lock);
 	val = readl(amd_manager->acp_mmio + ACP_EXTERNAL_INTR_CNTL(amd_manager->instance));
-	val |= reg_mask->acp_sdw_intr_mask;
+	val |= sdw_manager_reg_mask_array[amd_manager->instance];
 	writel(val, amd_manager->acp_mmio + ACP_EXTERNAL_INTR_CNTL(amd_manager->instance));
 	mutex_unlock(amd_manager->acp_sdw_lock);
 
@@ -104,12 +103,11 @@ static void amd_enable_sdw_interrupts(struct amd_sdw_manager *amd_manager)
 
 static void amd_disable_sdw_interrupts(struct amd_sdw_manager *amd_manager)
 {
-	struct sdw_manager_reg_mask *reg_mask = amd_manager->reg_mask;
 	u32 val;
 
 	mutex_lock(amd_manager->acp_sdw_lock);
 	val = readl(amd_manager->acp_mmio + ACP_EXTERNAL_INTR_CNTL(amd_manager->instance));
-	val &= ~reg_mask->acp_sdw_intr_mask;
+	val &= ~sdw_manager_reg_mask_array[amd_manager->instance];
 	writel(val, amd_manager->acp_mmio + ACP_EXTERNAL_INTR_CNTL(amd_manager->instance));
 	mutex_unlock(amd_manager->acp_sdw_lock);
 
@@ -922,7 +920,6 @@ static int amd_sdw_manager_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	amd_manager->reg_mask = &sdw_manager_reg_mask_array[amd_manager->instance];
 	params = &amd_manager->bus.params;
 	params->max_dr_freq = AMD_SDW_DEFAULT_CLK_FREQ * 2;
 	params->curr_dr_freq = AMD_SDW_DEFAULT_CLK_FREQ * 2;
diff --git a/drivers/soundwire/amd_manager.h b/drivers/soundwire/amd_manager.h
index f57165bbb9d9..f877492a8c55 100644
--- a/drivers/soundwire/amd_manager.h
+++ b/drivers/soundwire/amd_manager.h
@@ -243,16 +243,8 @@ static struct sdw_manager_dp_reg sdw1_manager_dp_reg[AMD_SDW1_MAX_DAI] =  {
 	 ACP_SW_AUDIO1_RX_OFFSET, ACP_SW_AUDIO1_RX_CHANNEL_ENABLE_DP0}
 };
 
-static struct sdw_manager_reg_mask sdw_manager_reg_mask_array[2] =  {
-	{
-		AMD_SDW0_PAD_KEEPER_EN_MASK,
-		AMD_SDW0_PAD_PULLDOWN_CTRL_ENABLE_MASK,
-		AMD_SDW0_EXT_INTR_MASK
-	},
-	{
-		AMD_SDW1_PAD_KEEPER_EN_MASK,
-		AMD_SDW1_PAD_PULLDOWN_CTRL_ENABLE_MASK,
+static u32 sdw_manager_reg_mask_array[AMD_SDW_MAX_MANAGER_COUNT] =  {
+		AMD_SDW0_EXT_INTR_MASK,
 		AMD_SDW1_EXT_INTR_MASK
-	}
 };
 #endif
diff --git a/include/linux/soundwire/sdw_amd.h b/include/linux/soundwire/sdw_amd.h
index ae53664f87cb..c5bc44cd150a 100644
--- a/include/linux/soundwire/sdw_amd.h
+++ b/include/linux/soundwire/sdw_amd.h
@@ -34,12 +34,6 @@ struct acp_sdw_pdata {
 	struct mutex *acp_sdw_lock;
 };
 
-struct sdw_manager_reg_mask {
-	u32 sw_pad_enable_mask;
-	u32 sw_pad_pulldown_mask;
-	u32 acp_sdw_intr_mask;
-};
-
 /**
  * struct sdw_amd_dai_runtime: AMD sdw dai runtime  data
  *
@@ -61,7 +55,6 @@ struct sdw_amd_dai_runtime {
  * @dev: linux device
  * @mmio: SoundWire registers mmio base
  * @acp_mmio: acp registers mmio base
- * @reg_mask: register mask structure per manager instance
  * @amd_sdw_irq_thread: SoundWire manager irq workqueue
  * @amd_sdw_work: peripheral status work queue
  * @acp_sdw_lock: mutex to protect acp share register access
@@ -84,7 +77,6 @@ struct amd_sdw_manager {
 	void __iomem *mmio;
 	void __iomem *acp_mmio;
 
-	struct sdw_manager_reg_mask *reg_mask;
 	struct work_struct amd_sdw_irq_thread;
 	struct work_struct amd_sdw_work;
 	/* mutex to protect acp common register access */
-- 
2.34.1

