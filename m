Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8092F6B4CC8
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Mar 2023 17:25:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D040018E6;
	Fri, 10 Mar 2023 17:24:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D040018E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678465500;
	bh=rZl3K4GiCL70YaB98lADIITXgvKNaj8SKqwh+lojFKQ=;
	h=To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=KQx99uOBxzS6Mmk077rBbE9GW0MEKMk8D+v9uBARkT/j43mXWjyazzeeSTuft1J23
	 YuEOwwu0S14XzED68qYaTWJx2+NPHsmtHKicv3vBb7yOLPg460mIWX2mei1U+s6qgM
	 4eX0H6+dqQx9UXHEf9bQfOTZSN73ZahDJEo6X40Y=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 43A23F80570;
	Fri, 10 Mar 2023 17:22:53 +0100 (CET)
To: <vkoul@kernel.org>
Subject: [PATCH V7 8/8] soundwire: amd: add pm_prepare callback and pm ops
 support
Date: Fri, 10 Mar 2023 21:55:54 +0530
In-Reply-To: <20230310162554.699766-1-Vijendar.Mukunda@amd.com>
References: <20230310162554.699766-1-Vijendar.Mukunda@amd.com>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SAOSS3LILOFGR7WTL746AKMU3WC4XNTS/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167846537154.26.2191049749879005071@mailman-core.alsa-project.org>
From: Vijendar Mukunda via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 Mario.Limonciello@amd.com, amadeuszx.slawinski@linux.intel.com,
 Mastan.Katragadda@amd.com, Arungopal.kondaveeti@amd.com,
 claudiu.beznea@microchip.com, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF4A4F8055B; Fri, 10 Mar 2023 17:22:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A8A35F80542
	for <alsa-devel@alsa-project.org>; Fri, 10 Mar 2023 17:22:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8A35F80542
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=rAYXqeiK
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GzjoNGCPaFBzF6F7dAecRm5q97REFZFTEdLjTzw2fR0ADt4i/00hhX53TJveTnEd5IOoEpc6MabBWdi1WYgDMtSRsSm6+rVz97dfAVMfCpO+SQMmmdf6d41sgK2mWN/zCVAR8QqZFBqCb6TFyuPfXwj6AezztlSkyw3LcfTPV0mG+17xCmT5dC1Jm99v+qhdrLJJTdqjjk8hTvMJH1KEye7XovFLXp5vz+yFrjoM0zxCwBQNtAFKhivPgbKEN95bciAMYFozwwQcl9j6fWvjE3vJ42YSKwX2BL8nQ9j8D2sGPoXZN06REnZ8IT9xQPeLwzRHjlSn7GiP0741FSXxqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kzpQjbhaLOBXjglmhoMhL9THO3EPsQ51brYeudnOifk=;
 b=Nyt2ABHmMcyLs052AJjW6FfggRaLdq356OOcl2sbBG095ybBanbNI5/y8EL4cPqigiTu9i8tz501+WTSyp2/qowJGh/LGLyoSVtKCKWtAYAGqa2XyQYpvpiDQJZoXPw9aHpiuC6iRmv/BPphkzf7obBG0JNKv/TwPOStx9nVzJsPaN/XOoqKpzhaxQ4O1yKMI2JobTHhTwGzKUtiO6n38Ghzka3pI9RvVaNevBR+3/l64pGcWDxfDE4H7vTYUr5F8i8pyBYolVnZCIMNIgEADUMy1gNosQc4/e+im105CL7k6Sk7KI1VBS2b7hCiRNV9nWMqziHOPDotTYAGUrqUBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kzpQjbhaLOBXjglmhoMhL9THO3EPsQ51brYeudnOifk=;
 b=rAYXqeiKE8vvSI8FalsRLVm4xkN1Hd6aqopZ8rnzPCUxsO6YoaezextP/hfndy1XOHioW5hBBEz+A5HfN/bzHghWMT3g7T8uRj6ipfWaHV32T9sn7kRqPw4HLVEFIV4E1JKraL1b6KQX+bCDKOlMGLD1wYJcAS7bu++fjf2zklo=
Received: from BN9P220CA0007.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::12)
 by SA0PR12MB4493.namprd12.prod.outlook.com (2603:10b6:806:72::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.20; Fri, 10 Mar
 2023 16:22:37 +0000
Received: from BN8NAM11FT066.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13e:cafe::95) by BN9P220CA0007.outlook.office365.com
 (2603:10b6:408:13e::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.20 via Frontend
 Transport; Fri, 10 Mar 2023 16:22:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT066.mail.protection.outlook.com (10.13.177.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.20 via Frontend Transport; Fri, 10 Mar 2023 16:22:36 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 10 Mar
 2023 10:22:35 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 10 Mar
 2023 08:22:35 -0800
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Fri, 10 Mar 2023 10:22:31 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
Subject: [PATCH V7 8/8] soundwire: amd: add pm_prepare callback and pm ops
 support
Date: Fri, 10 Mar 2023 21:55:54 +0530
Message-ID: <20230310162554.699766-9-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310162554.699766-1-Vijendar.Mukunda@amd.com>
References: <20230310162554.699766-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT066:EE_|SA0PR12MB4493:EE_
X-MS-Office365-Filtering-Correlation-Id: 42bd39a8-474b-4f18-2bba-08db2183a8e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	y8fMMXlmSU+jTIAKuBQ3VSpBiaR4aDNWG33jLS2+HNASDfgQMUhz4m4IHkU/+vLXAIoAJGpp7ZmY9M4p2Cl3IAJAUCYqTFAsJGtS2uwQHdB8U1ctAukaJZqFxi72gYPLtd2WutTika6FlJI3IwRsNSfBgSIkkstftCNO3Gbbivauw6/iqTKJ48ki6r4sRvPCLSiwok3D8JZVQUyMquh3Hb81XrUCtzWZADuNksbwgi6fyuW+vnAOjThWPWLvnRl+hFchXg94H3BMokPS+jsvAeNDFE5IHAK1lB+fm9N1UDVnQ5KbpGHIrBKQ9enTPL3wTgj5hA520upEWRi/+B/ro6P7hg6vX7sS2sQpCblmnKqk+L67ymBLgoBdcRz9E8ZhWy64BncE4v3a2qUC6Dhy0ZwTGkZsEuElEHv/cUwrA05rRFZOMb0GqtMwUgqCDd+C+BmjFwocti/Xdy9VIybCTHhYhbQOwJTzkd1iKbi8Kr4Y5SKRSU7yrh626ivyeejoysoF7RJZ6WHLnisF1UIAdKA8aTs7olzrpypXJym60PGD6Ujf0m0l4bwY/OAkqIw+MyAxx3QzpZVFsJcvd+WRxhKDwWl2Ntijh1skVjNx4XAXG16vg7eXS3hjuRzEJs2vdjM4gQi2JTXjNw81FUPB6o1aqhfcpXg+hyTpr6y5v2MyFuSrRoryAPVSPcHHa2uSOoomGAnpqQ2N4mE6PyQsRHHub2LzgHr1M5QM6J0gR6g=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(396003)(376002)(39860400002)(136003)(346002)(451199018)(46966006)(40470700004)(36840700001)(36756003)(83380400001)(47076005)(426003)(82740400003)(6666004)(36860700001)(1076003)(26005)(7696005)(186003)(336012)(40460700003)(2616005)(8936002)(41300700001)(6916009)(70206006)(70586007)(8676002)(4326008)(86362001)(5660300002)(2906002)(40480700001)(356005)(81166007)(316002)(478600001)(54906003)(82310400005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 16:22:36.0743
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 42bd39a8-474b-4f18-2bba-08db2183a8e7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN8NAM11FT066.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4493
Message-ID-Hash: SAOSS3LILOFGR7WTL746AKMU3WC4XNTS
X-Message-ID-Hash: SAOSS3LILOFGR7WTL746AKMU3WC4XNTS
X-MailFrom: Vijendar.Mukunda@amd.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 Mario.Limonciello@amd.com, amadeuszx.slawinski@linux.intel.com,
 Mastan.Katragadda@amd.com, Arungopal.kondaveeti@amd.com,
 claudiu.beznea@microchip.com, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 open list <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SAOSS3LILOFGR7WTL746AKMU3WC4XNTS/>
List-Archive: <>
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
 drivers/soundwire/amd_manager.c | 84 +++++++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index fe9f5ae84a23..3698bb8e00d4 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1079,6 +1079,88 @@ static int amd_sdw_clock_stop_exit(struct amd_sdw_manager *amd_manager)
 	return 0;
 }
 
+static int amd_resume_child_device(struct device *dev, void *data)
+{
+	struct sdw_slave *slave = dev_to_sdw_dev(dev);
+	int ret;
+
+	if (!slave->probed) {
+		dev_dbg(dev, "skipping device, no probed driver\n");
+		return 0;
+	}
+	if (!slave->dev_num_sticky) {
+		dev_dbg(dev, "skipping device, never detected on bus\n");
+		return 0;
+	}
+	ret = pm_request_resume(dev);
+	if (ret < 0) {
+		dev_err(dev, "pm_request_resume failed: %d\n", ret);
+		return ret;
+	}
+	return 0;
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
+	if (amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
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
+		return amd_sdw_clock_stop(amd_manager);
+	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
+		/*
+		 * As per hardware programming sequence on AMD platforms,
+		 * clock stop should be invoked first before powering-off
+		 */
+		ret = amd_sdw_clock_stop(amd_manager);
+		if (ret)
+			return ret;
+		return amd_deinit_sdw_manager(amd_manager);
+	}
+	return 0;
+}
+
 static int __maybe_unused amd_suspend_runtime(struct device *dev)
 {
 	struct amd_sdw_manager *amd_manager = dev_get_drvdata(dev);
@@ -1141,6 +1223,8 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
 }
 
 static const struct dev_pm_ops amd_pm = {
+	.prepare = amd_pm_prepare,
+	SET_SYSTEM_SLEEP_PM_OPS(amd_suspend, amd_resume_runtime)
 	SET_RUNTIME_PM_OPS(amd_suspend_runtime, amd_resume_runtime, NULL)
 };
 
-- 
2.34.1

