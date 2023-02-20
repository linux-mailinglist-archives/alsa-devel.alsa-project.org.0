Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D3469C83B
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Feb 2023 11:04:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D166F08;
	Mon, 20 Feb 2023 11:03:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D166F08
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676887476;
	bh=dQ22xVqeeDbPg1mP+sGSbcQFjzhxR1kMPg94Z0ZQlbw=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YH4QDRCN8cQN5+nUt/NNcj9XFrFYeHjtn1dCqbWpFy3fRZdudg83jRM5RWm8jyg2b
	 TyoMuOxDgwFDoVMz7v1QMn0wfqlH3Uvfn3lnmrOhdtriFPsPxcRUTwR/qYwx8uEoMu
	 SmLR8KoKzUgQ7KF3/aF1/yfVidzvZd0XhOEzonVY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F2083F80496;
	Mon, 20 Feb 2023 11:02:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18CC4F80570; Mon, 20 Feb 2023 11:02:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20622.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8d::622])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9E9EDF80496
	for <alsa-devel@alsa-project.org>; Mon, 20 Feb 2023 11:02:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E9EDF80496
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=V7y7pYy5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OUg++kzhgSw0yXaUaFiJYaiLXT7m69e0eN0fI4neR9bsuVHYujLtDZhrqBBfprnm8VOD5z0aZOAlMNPledzDT34m0rKznat2JyrtD+J/IL22QkWHDX69jkphzKDH4FA5f42j+xZB6baZdOFw8V7Gr5ZT0RSUVGiSyEsRUpZssrZ+xIGzQhkCtFzuZdDV4eJXfTnPBGsGMEQ5TTaBykop989kh+o84eq9wEyvQ0eNwEy655b+/1GWoC5HIPSAYXRDmWcl17oWkb14AgWP4wWC587iVGJwzJN+d0MNwEUBB0RpWf0A5b7mqfJ7mQ0ID0N9cQDkVWqHNRRrneqcQmwWPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2+WAW5FtO4Ro2HWINN6+qyNUE5nso7XQfRhjl/8PbFg=;
 b=GhafRtn8o395nhxQkeNkFWjTRHeVqdpZmAfLDa/8xgzKIgan93EkVAo5ES3BYHVQMNtQcWyjRauqIK95xpXtbpmxxn1cMIc0b9ramz4Hx7A6joGx/qnW3tUSVoYQRLNlScIXgEsfHgVYiu/3tm8Ey8pVc6/8slf/GhtyZtw9Pa5OZufG2fcjpUkBYAyGiUXPxOgJrLhPSqRMBudTKcjtNTvyHPzKLgyT+l1HgtTxtxUwWW9pJFddVeoni41ajwcmdXptSYfO7z0Z/ZHlOGdIk+uGk5U+SMfJXmRZ+nzutxpGgCyCp2AUJGLxOPDut2llfcvV51qkxEwrEWzWNHERqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2+WAW5FtO4Ro2HWINN6+qyNUE5nso7XQfRhjl/8PbFg=;
 b=V7y7pYy5m05ZW1T0TXZNdJXZbe/TVxRA2qqgjIU5enAirV5Sreme/URepH3NxlEROSh54OzUDZLAuYpY69smF1Vje86DAKSy3WbGG5Dq8LWy4kHtzLN/GNghrzDcvEDf7GVXoPwljk6YDFVuHDpewMx4qIcz04OLs8PypVeMMH4=
Received: from DM6PR01CA0029.prod.exchangelabs.com (2603:10b6:5:296::34) by
 SN7PR12MB7978.namprd12.prod.outlook.com (2603:10b6:806:34b::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6111.20; Mon, 20 Feb 2023 10:02:33 +0000
Received: from DS1PEPF0000E654.namprd02.prod.outlook.com
 (2603:10b6:5:296:cafe::b3) by DM6PR01CA0029.outlook.office365.com
 (2603:10b6:5:296::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.20 via Frontend
 Transport; Mon, 20 Feb 2023 10:02:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E654.mail.protection.outlook.com (10.167.18.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6134.14 via Frontend Transport; Mon, 20 Feb 2023 10:02:32 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 20 Feb
 2023 04:02:29 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 20 Feb
 2023 02:02:02 -0800
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Mon, 20 Feb 2023 04:01:59 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
Subject: [PATCH V3 8/8] soundwire: amd: add pm_prepare callback and pm ops
 support
Date: Mon, 20 Feb 2023 15:34:18 +0530
Message-ID: <20230220100418.76754-9-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230220100418.76754-1-Vijendar.Mukunda@amd.com>
References: <20230220100418.76754-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E654:EE_|SN7PR12MB7978:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e0a0cd7-a953-4416-c201-08db132995ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mNJuOyUw7ERXfmxw3jZjM3+Ck0Er5XLktAxpzifMqmAHMUa/3wAiJf4E6LbjgGFbn7vIEhFZ6q1cc1U88CztaOems7ZBO+lmnw9NNes1EHMbt56kmqwr9Ad/IM0Tj2W9XcdQxBpqUR2tAv1qKtS/rEnDPkJmFGPdEzduOA4eQkauf+QdVC3DDnjbQV1b0VLvAhycwSMkRR1DO72CgMN8lITOoV8ui+AYGExD+w1e0bRwASwe1x5roo+se45984qldXHb6grVw4qH8vDtYYiLi+V6Smg82ihsbseqB0dBwX8JKN414WJb0hKDtr6V1UZOHt9N/BgFMQsJkfOOnqP3sntWga6Qzyl6sUx/a7h6nJAPA/0VwETkYyC0eRc1ttkQHthsI199oAb2QB0wnKipTehX8L7gBjqpSwIITGSMH0swnjrGw9QEhJ5YTh2Ruc85X+OgqUvegcEMjfgBUePIMHOKBlFa3dYw4HumX+qJTRzKsCy2046PkrBffta6fo602dKFIf7Dh9vCQt7jIZ0mR6HE2Gbtzdx0PqbLAXPHIu6BwOM+kRXXULv+a8aoRaeYAXtNd6gFMi2jwRrDg+6VSxIvVc+6rCJxi93Rlin7sb6i5gll+ozvLvcB8O81u20zAPGn1w4TEe/mp89FgN0sYxKuQfu8c4IMblIqaq6mrHE70opJVo73G8Api7ScUEaUfxJF6Bon3Ml0BzB3jxL6c4Ytjj4J3leIjzYeXfyTlAo=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(376002)(136003)(39860400002)(396003)(346002)(451199018)(46966006)(40470700004)(36840700001)(36860700001)(8936002)(356005)(40460700003)(478600001)(5660300002)(2616005)(40480700001)(426003)(36756003)(336012)(7696005)(54906003)(83380400001)(81166007)(316002)(47076005)(86362001)(70206006)(70586007)(4326008)(6916009)(82310400005)(8676002)(41300700001)(82740400003)(26005)(186003)(1076003)(2906002)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2023 10:02:32.6986
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3e0a0cd7-a953-4416-c201-08db132995ab
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF0000E654.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7978
Message-ID-Hash: W56YIR5SLWNGWZ4HG6E4TRR7RFSNABFJ
X-Message-ID-Hash: W56YIR5SLWNGWZ4HG6E4TRR7RFSNABFJ
X-MailFrom: Vijendar.Mukunda@amd.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 amadeuszx.slawinski@linux.intel.com, Mario.Limonciello@amd.com,
 Sunil-kumar.Dommati@amd.com, Basavaraj.Hiregoudar@amd.com,
 Mastan.Katragadda@amd.com, Arungopal.kondaveeti@amd.com,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 open list <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W56YIR5SLWNGWZ4HG6E4TRR7RFSNABFJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add pm_prepare callback and System level pm ops support for
AMD SoundWire manager driver.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Signed-off-by: Mastan Katragadda <Mastan.Katragadda@amd.com>
---
 drivers/soundwire/amd_manager.c | 89 +++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index a7182aa78652..b974e52248da 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1155,6 +1155,93 @@ static int amd_sdw_clock_stop_exit(struct amd_sdw_manager *amd_manager)
 	return 0;
 }
 
+static int amd_resume_child_device(struct device *dev, void *data)
+{
+	int ret;
+	struct sdw_slave *slave = dev_to_sdw_dev(dev);
+
+	if (!slave->probed) {
+		dev_dbg(dev, "skipping device, no probed driver\n");
+		return 0;
+	}
+	if (!slave->dev_num_sticky) {
+		dev_dbg(dev, "skipping device, never detected on bus\n");
+		return 0;
+	}
+	if (!pm_runtime_suspended(dev))
+		return 0;
+	ret = pm_request_resume(dev);
+	if (ret < 0)
+		dev_err(dev, "pm_request_resume failed: %d\n", ret);
+
+	return ret;
+}
+
+static int __maybe_unused amd_pm_prepare(struct device *dev)
+{
+	struct amd_sdw_manager *amd_manager = dev_get_drvdata(dev);
+	struct sdw_bus *bus = &amd_manager->bus;
+	int ret;
+
+	if (bus->prop.hw_disabled) {
+		dev_dbg(bus->dev, "SoundWire manager %d is disabled, ignoring\n",
+			bus->link_id);
+		return 0;
+	}
+	/*
+	 * When multiple peripheral devices connected over the same link, if SoundWire manager
+	 * device is not in runtime suspend state, observed that device alerts are missing
+	 * without pm_prepare on AMD platforms in clockstop mode0.
+	 */
+	if (pm_runtime_suspended(dev) && amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
+		ret = pm_request_resume(dev);
+		if (ret < 0) {
+			dev_err(bus->dev, "pm_request_resume failed: %d\n", ret);
+			return 0;
+		}
+	}
+	/* To force peripheral devices to system level suspend state, resume the devices
+	 * from runtime suspend state first. Without that unable to dispatch the alert
+	 * status to peripheral driver during system level resume as they are in runtime
+	 * suspend state.
+	 */
+	ret = device_for_each_child(bus->dev, NULL, amd_resume_child_device);
+	if (ret < 0)
+		dev_err(dev, "amd_resume_child_device failed: %d\n", ret);
+	return 0;
+}
+
+static int __maybe_unused amd_suspend(struct device *dev)
+{
+	struct amd_sdw_manager *amd_manager = dev_get_drvdata(dev);
+	struct sdw_bus *bus = &amd_manager->bus;
+	int ret;
+
+	if (bus->prop.hw_disabled) {
+		dev_dbg(bus->dev, "SoundWire manager %d is disabled, ignoring\n",
+			bus->link_id);
+		return 0;
+	}
+
+	if (amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
+		ret = amd_sdw_clock_stop(amd_manager);
+		if (ret)
+			return ret;
+	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
+		/*
+		 * As per hardware programming sequence on AMD platforms,
+		 * clock stop should be invoked first before powering-off
+		 */
+		ret = amd_sdw_clock_stop(amd_manager);
+		if (ret)
+			return ret;
+		ret = amd_deinit_sdw_manager(amd_manager);
+		if (ret)
+			return ret;
+	}
+	return 0;
+}
+
 static int __maybe_unused amd_suspend_runtime(struct device *dev)
 {
 	struct amd_sdw_manager *amd_manager = dev_get_drvdata(dev);
@@ -1227,6 +1314,8 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
 }
 
 static const struct dev_pm_ops amd_pm = {
+	.prepare = amd_pm_prepare,
+	SET_SYSTEM_SLEEP_PM_OPS(amd_suspend, amd_resume_runtime)
 	SET_RUNTIME_PM_OPS(amd_suspend_runtime, amd_resume_runtime, NULL)
 };
 
-- 
2.34.1

