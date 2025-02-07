Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CE9A2BBF8
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Feb 2025 08:01:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D36960296;
	Fri,  7 Feb 2025 08:00:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D36960296
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1738911668;
	bh=YeeRrlx3vwYeXAibQkf/NGSSMODM57I6UFCORA9SHnw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Oo8G6ZdwYwMjtXbjTYT+PA0cxTvrwY97R74IIWqE/QPX90ZSzsCIEkUQNmFtUYnIU
	 tk6IJFIdiUhMvL91SnG8VprYkGkeN4FJXEB2oDmiI6nbqsq6E9njTRB5VtyJ+H2aUU
	 pYF0NB1ZoXQEc+tAHeq3cB/pzKWiIpkVtStpIdGs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D366F80693; Fri,  7 Feb 2025 07:59:34 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B856F8068C;
	Fri,  7 Feb 2025 07:59:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99EE5F80641; Fri,  7 Feb 2025 07:59:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20621.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::621])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B0332F80638
	for <alsa-devel@alsa-project.org>; Fri,  7 Feb 2025 07:59:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0332F80638
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=G7yTpHlo
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U5btdIP7V4S6zc6OGgRznzv5VEIwbM7j93zoZLBJ4NwBmcr8JdPhWnIVJlrDtQZ8TPyxzFAENs0d4s3YFEoJTc3pq7lxiFGEjzJdjESds6pDUQGZ2YjNuMcfG/cVEC42QPqC/476TRv4Njo7vuqDXs4lqNvjW8M6jTgFf1n9fBILWLv3mAHRgoToWvmVnNhcmaED0Z/WCS33dmuRtJyVWm4fE40LkMD68rqVtMO98+wIyapvkUQAkkIuDezLKs6Bk4zzM2UIQhL3q+xRa6+GqfnBNGhqu4Tmir63Be/FD/k0lQa2boCn3yKBLTOx2AvWwo3Agy4pWCslSPuUZo3qxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DdhEz9JR14cUYOgjTS8vDJCWGKbPW5n/qE9URGJsJpQ=;
 b=bAOq5YLrTAFl8XdacXKrdy1qfHT30G9fW0pDNwZ777y9HRTezpH/HA8mAIukc8suS3hrQqHnfIYHQ7KIXXQ9K7luZ6y5oRKn60DdjVkiUVQFUdektNRWt+Q0hpOlBQW0XhsMZ01AF52Fr0SdETJ9/7BwboVkWG2Aa/Xx/YzYPNIeYRV1dC9gdS4EGg6KrbU5hxouCP9Ak7zwHsBe+UJHAlLpdVAxR2Kui12x437iTQG51r3byMrB2Okc9c3YYHysIcsnQLrxpaMCEEzH8vunprdozmKqcFCBd173fQvBXA3av2a0YtXr5NT18TBBHU/kBIzcVeF9NktwdYitgwh4BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DdhEz9JR14cUYOgjTS8vDJCWGKbPW5n/qE9URGJsJpQ=;
 b=G7yTpHloj+g8AFEO6qxuT2Rr79IOlTOHYnf8DZOxvW/6vovCJUh24L0BlXN2SRdcz2JsvH0TSdwYnHVTQy6Q6rOY4weV5mB4CNBbtH1ZRMqADLs0sMmHZ9XiTAhop4PvQYGRyyaEwb3XlmTdl2GVfVL+9PENM73f4G/9YA8EPIM=
Received: from BYAPR01CA0013.prod.exchangelabs.com (2603:10b6:a02:80::26) by
 PH0PR12MB7487.namprd12.prod.outlook.com (2603:10b6:510:1e9::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8422.10; Fri, 7 Feb 2025 06:59:18 +0000
Received: from CO1PEPF000042A9.namprd03.prod.outlook.com
 (2603:10b6:a02:80:cafe::36) by BYAPR01CA0013.outlook.office365.com
 (2603:10b6:a02:80::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.27 via Frontend Transport; Fri,
 7 Feb 2025 06:59:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042A9.mail.protection.outlook.com (10.167.243.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Fri, 7 Feb 2025 06:59:17 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Feb 2025 00:59:13 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <alsa-devel@alsa-project.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <sanyog.r.kale@intel.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Mario.Limonciello@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH V4 5/6] soundwire: amd: set ACP_PME_EN during runtime suspend
 sequence
Date: Fri, 7 Feb 2025 12:28:40 +0530
Message-ID: <20250207065841.4718-6-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250207065841.4718-1-Vijendar.Mukunda@amd.com>
References: <20250207065841.4718-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A9:EE_|PH0PR12MB7487:EE_
X-MS-Office365-Filtering-Correlation-Id: 607aa32b-c992-422a-b236-08dd4744f09d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?rL53iDhrWKEo/ei4P68QHVVEv2JjxSpxduuMtLmEkwfDYnxd/0/ISQgK094B?=
 =?us-ascii?Q?YpuEuagwrNHCQjQ8JWlhKawNz1g9KhP76v83jnVNr6QjeQPmTnM+0uKLT2/t?=
 =?us-ascii?Q?EG1ahuIzziKHD1Zddc+sH2tv6RkqrBlQYdUHhB5zSKtRCwRAOPHFzz/q0e53?=
 =?us-ascii?Q?ftNJ15Aqp4XanVsjdj5if2fKShOYsCmZKsV8EGNhmYf2bbFlBQuopl+EvEtJ?=
 =?us-ascii?Q?fVK3s8R0AB5ezctUcUZ/eqy2KekBFxpTGY4p0Ya2H66HTAeJRfdI89MFPgsZ?=
 =?us-ascii?Q?PdFjBy/3TUMxKECeFZHuugxOtvBIWBtn49IEt4eS6Ms2SFynZVjYpBchpSca?=
 =?us-ascii?Q?66pYVaE9qgXxJLwzFdwOYRHecMGta5AQnjjlj3l+IbDPO/LDMcGVk0xSCWfc?=
 =?us-ascii?Q?QZvINYySidThKA+zTIrSTF6VsVl0sURtkbqR1HJp1W2ewRVzwd2IQjAHDtd5?=
 =?us-ascii?Q?xg/g0CweSvvanuvy9WZpkSBrCNBH7X3qK3Cal1Gecyaobhx5oFpvU9VNUUdy?=
 =?us-ascii?Q?lljlvqDgCOQJDNT0l4PuqPP5O4/yqfEnZAP7VLHCN1pDXWO4n8DA2tzK0cYw?=
 =?us-ascii?Q?okqHvspai8Vo/cGUEGT0zY07MRPP/185OvP0w04Qhhgidbk92/S0luQyCvUC?=
 =?us-ascii?Q?+xWJxJrWJtPakAuZgLpSWBZWospC0oYeGPMFM1L5H5jPrLvElMTT2f1YlvGa?=
 =?us-ascii?Q?AUpvT1p5Ahbt55E2OQpFch4ugUncCkYg2OdUnv1Nd6WVI2OtnbzJ1FIvf4Eg?=
 =?us-ascii?Q?YbkwNIosdDz5jtTSYzm1atVjB9SuugSboZdOSKtOQIPTvD/TXYuM242gJbuh?=
 =?us-ascii?Q?K00krn2yhmBMJG9XqW1dfmbvytA/J0f6J9wROWQmiRpltAhULVFQUx4k+71w?=
 =?us-ascii?Q?iorz2E9+8cJRG8eRv4IwM9nPsNqT5pQRFMuPktrBg9bx1zTzk104IbcwR6bV?=
 =?us-ascii?Q?Zo7SFxYKyJanKz31d7Cs09zjbR1B0L8Zacf5aloJCcIXHnd8afA/UrBBeFIz?=
 =?us-ascii?Q?aEatFHhLRW9YfMNI+vqmWHAKFYQzMkG8Ba2enR7kG8TntolfD6ru2yMMAhkK?=
 =?us-ascii?Q?pWzw5pImLin7jnDI1N4ZKq83+BX6Jf0dGFpPBIuI/56k8xpvCCd8gWYTHZ3h?=
 =?us-ascii?Q?WmqTLX1VLlsLTsWPL7UciSeHEadT7FqG5e0fKNYtSSr/y3+D/w3LdMbjhBR5?=
 =?us-ascii?Q?p0u2Fj0gtnXM6mpNoj6rKJMC4N6Uxrh6q+JsdP5rbbvv4b+Q8AydgP0pxoG+?=
 =?us-ascii?Q?wJcrwCvUxa2Fm0FKfIJB1RfeSJEX02ZdXwDtFNvD+RXPUhy29g5lOpTIVF92?=
 =?us-ascii?Q?1Tsxslsk/hj6nTIres7f3yr6df2xdW5WhgKwXQbZTPAFqaGyFbBuPwu6Tre9?=
 =?us-ascii?Q?CmxxQ0fLmXWiWM/I0vQhAAcVBjcaK2rLLt7DrvnYXjvsxni3PkEjtFDSKTFz?=
 =?us-ascii?Q?9IyrXIEpW+RyBvG759UCGB7VUH7D44RoxjosKa8/KS8pnOtDdGadnHQRpL9L?=
 =?us-ascii?Q?BlZwucDe2gfNSK4=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 06:59:17.4974
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 607aa32b-c992-422a-b236-08dd4744f09d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000042A9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7487
Message-ID-Hash: 55R5NZ2IIGAJTD3TJHOJFCUYN6RZQF5S
X-Message-ID-Hash: 55R5NZ2IIGAJTD3TJHOJFCUYN6RZQF5S
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/55R5NZ2IIGAJTD3TJHOJFCUYN6RZQF5S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Set ACP_PME_EN to 1 during runtime suspend sequence as per design flow
for ACP7.0 & ACP7.1 platforms.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 9 +++++++++
 drivers/soundwire/amd_manager.h | 1 +
 2 files changed, 10 insertions(+)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index cc87e77f1dd7..d38b4baee221 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1211,6 +1211,7 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
 	struct amd_sdw_manager *amd_manager = dev_get_drvdata(dev);
 	struct sdw_bus *bus = &amd_manager->bus;
 	int ret;
+	u32 val;
 
 	if (bus->prop.hw_disabled) {
 		dev_dbg(bus->dev, "SoundWire manager %d is disabled,\n",
@@ -1235,6 +1236,14 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
 		ret = amd_sdw_set_device_state(amd_manager, AMD_SDW_DEVICE_STATE_D3);
 		if (ret)
 			return ret;
+		if (amd_manager->wake_en_mask) {
+			val = readl(amd_manager->acp_mmio + ACP_PME_EN);
+			if (!val) {
+				writel(1, amd_manager->acp_mmio + ACP_PME_EN);
+				val = readl(amd_manager->acp_mmio + ACP_PME_EN);
+				dev_dbg(amd_manager->dev, "ACP_PME_EN:0x%x\n", val);
+			}
+		}
 	}
 	return 0;
 }
diff --git a/drivers/soundwire/amd_manager.h b/drivers/soundwire/amd_manager.h
index 8430f279d88e..1d5e94371f81 100644
--- a/drivers/soundwire/amd_manager.h
+++ b/drivers/soundwire/amd_manager.h
@@ -199,6 +199,7 @@
 #define AMD_SDW1_DEVICE_STATE_MASK			GENMASK(3, 2)
 #define AMD_SDW_DEVICE_STATE_D0				0
 #define AMD_SDW_DEVICE_STATE_D3				3
+#define ACP_PME_EN					0x0001400
 
 static u32 amd_sdw_freq_tbl[AMD_SDW_MAX_FREQ_NUM] = {
 	AMD_SDW_DEFAULT_CLK_FREQ,
-- 
2.34.1

