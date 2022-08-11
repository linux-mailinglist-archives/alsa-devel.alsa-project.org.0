Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC0658F742
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Aug 2022 07:28:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8128B41;
	Thu, 11 Aug 2022 07:27:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8128B41
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660195719;
	bh=yQfXPkBPyql0UBy+H8UPGlMEBIeiKxKSS7uHeFIIHvE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EgRJDtxIjz55fBv4d8kkWDv1IJKVkwYvf0XHFGt7e+4HDJFWCZQ0qNmJy+15seSuo
	 EQbXsKhQb2ZtIFS/n7/froRm8lKiFbEW7gkza0rT5bzJVVHXj++7PJ2OQAR/lkjryO
	 LYmMZDmX7Hif/+L875hzMtRNJlfcvfsC5GwWtRQ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA1F2F802DB;
	Thu, 11 Aug 2022 07:27:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27760F80246; Thu, 11 Aug 2022 07:27:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2056.outbound.protection.outlook.com [40.107.94.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21942F8012A
 for <alsa-devel@alsa-project.org>; Thu, 11 Aug 2022 07:27:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21942F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="OQrR5sw8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nZUVRBCmm67jnpMCnB2G7jGd3SRshgCBb/AeFKIIRYT1JRtiQ7S52dX7sD2lc/7Y/7+HwNwHBKh92rc14CNxQ5DsJUhGDSMYZAbA5GUXps3m43PDzFU+0v7dBcK893CX1Ep5aMmlMqb7/qWr4xgq10jqDIAjZapAjo4B/gSQ4v/OPFSxCYginID0eCXilTNkQGCLuHPNrnuAdIxL6ay+DoeVEPKb9ZloJ9gQz5nc/b1RKWdbodX6FnC1qY3Tvtsh4ap9GA4zM7CX7nUp0u8IiMuE8lJ8HL29l7cIvM0Wm+vlHU0Ch9oyoksMB6T3yZC5mSrxslozd4eQhi0td35veA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G+vqrM9ZA0w7w4UfrJsSezdCWU8XWx80q4ncgkC4Z9M=;
 b=XFXR0pnHYJ5n1F2Mo1/UdC0FNIpSgEAXSkILdpDupLBOrhQf0cpWULrrRO9+ed6bAOX0dWHScGLHpyvnQYDRSOIDBv65hKdXiiESbVF4JT/L1+Oj8Eu5RV8jibO/velbcPkGt9obArxA8yCBG9cwI1RDX8dWt2PX5de+85jidylNwcOMATuWId41FqyrZrHwaYRGyw3lfXuBdS/pn0uhdyEE10GyBYXrarug5JGqfhNknQB4LKDPGxPU5odVbrAZwyDQxI5cSz6ZZozI1zTnj1Iu6EWHPzaVxpzYx40OGgFmopvPQXbqkJRzOuGwrsO6TcC7xfWBP3LDeHdFL/wcWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G+vqrM9ZA0w7w4UfrJsSezdCWU8XWx80q4ncgkC4Z9M=;
 b=OQrR5sw8DuQFQHHnzx6Ym4zcQ68iGe2724BouhgY3qxA6Dftnx29LnkbNkHBeXANjdQ5p3IRqwY9nmxoPPQVb0ZfHLImavfKbYYKnhk8j+qYJSFMqMBRoqLLB/Bqz2xtN8GLtzKIMCPMQ428+DphQnwxckPyY6LFCcRzPWlK83aji2rjJhBh3qaKSUCNl4B6FjUYZwbgIz//Zkyi8sPPwEi+oKJIlQIcr5yoklA3NSi6RYolCzXXKIECJI5x/fdFglfRpvdbmsjP5l8z/xaea5IJT0EA//ECsxwbDuzT+WGE9wtvIjdnYb7ztxKSbio0qctbDsFo7B8xCKoEt187tA==
Received: from MW4PR04CA0358.namprd04.prod.outlook.com (2603:10b6:303:8a::33)
 by DM5PR12MB1708.namprd12.prod.outlook.com (2603:10b6:3:10e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15; Thu, 11 Aug
 2022 05:27:22 +0000
Received: from CO1NAM11FT044.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8a:cafe::bd) by MW4PR04CA0358.outlook.office365.com
 (2603:10b6:303:8a::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17 via Frontend
 Transport; Thu, 11 Aug 2022 05:27:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.235) by
 CO1NAM11FT044.mail.protection.outlook.com (10.13.175.188) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5525.11 via Frontend Transport; Thu, 11 Aug 2022 05:27:21 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Thu, 11 Aug 2022 05:27:20 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Wed, 10 Aug
 2022 22:27:19 -0700
Received: from mkumard.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.986.26 via Frontend
 Transport; Wed, 10 Aug 2022 22:27:17 -0700
From: Mohan Kumar <mkumard@nvidia.com>
To: <tiwai@suse.com>, <perex@perex.cz>, <cezary.rojewski@intel.com>
Subject: [PATCH] ALSA: hda: Fix crash due to jack poll in suspend
Date: Thu, 11 Aug 2022 10:57:04 +0530
Message-ID: <20220811052704.2944-1-mkumard@nvidia.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a2d7ace1-afb5-4400-3754-08da7b5a2a38
X-MS-TrafficTypeDiagnostic: DM5PR12MB1708:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZKDKY1bD4IFCfVzVBwVTsfcl/keu9uNY54wkVFvqxPX/P/nR98UnikREm76io0H/QWb44lAerI7iibjdzB0OlHUgEEmHhdJumo0jve0D3kAH286mxcUU6gwEKYkTJLFXjSnapG195zreS+mgaSPSiW5rSQOeyxYO2AWgBaFQcdVb+/cSl3qx33mXNhyeUEDbfnhZWzOwgWvxtWO9NMT1nU6zU2bJNZ+pc4wYoN6DwGwyH1mpcgr0RXP0RmkZ/+7M4md7rB0xUzg+7A9MwrS+f9XH/tbR0gu5ZeO5vkLtx7jRwYGlK871OizA5KP8NJz4c1HtnQpHanZjYLZidXx9oWLx8ZzF8zwUW43AnFYx2sbOITH8yyrZuelct/hWhcXM/E8QncbJkJb5gXbyq0DTvJCOwVu5AL5qgXxqNNUGRlmZU3nsCnye5qSqJgJdcjREds5PKWGW7IqVb02q57ynGANLm+U/jH9z8GjuucUL4J9Zs7yYvcKrk2AZKuEpEOW75Mh5fzkFsj0/rF5J0uw4yc+3qH/uYxFDksjcC/JXbhkL31Q+1pjTrFOevT3+PFTveqD07VpL+ecdRfHlzS+aqlx4h50yxZMQD9J4KbmjloJTJ0djEv9dom8WKVOWTB0UFECP91MzgiiTgPyrVw+2MY9LNbkqEW3D//BXDT7x/eUNBXwdN6s4usB++JmMKOYoRnm06BhiaLVrFwXiYBK14DnMVjxi1yRVkKLj38/hn9CyyUZcak/2kiAqJK6tuRDgXL8itvStox0mv/9E0ORaSpWdSLbqM8/OUeFsgvAIU10LBohyhvlgcCR4aOieQQxBTXHb+LM67iVoCNqG62BTOg==
X-Forefront-Antispam-Report: CIP:12.22.5.235; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(376002)(136003)(39860400002)(346002)(40470700004)(46966006)(36840700001)(83380400001)(70206006)(316002)(2906002)(4326008)(8676002)(478600001)(110136005)(40480700001)(36756003)(40460700003)(15650500001)(5660300002)(8936002)(70586007)(36860700001)(7696005)(356005)(54906003)(41300700001)(26005)(186003)(336012)(6666004)(81166007)(2616005)(82310400005)(426003)(107886003)(86362001)(82740400003)(1076003)(47076005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2022 05:27:21.0853 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2d7ace1-afb5-4400-3754-08da7b5a2a38
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.235];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT044.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1708
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 jonathanh@nvidia.com, linux-tegra@vger.kernel.org, treding@nvidia.com,
 Mohan Kumar <mkumard@nvidia.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

With jackpoll_in_suspend flag set, there is a possibility that
jack poll worker thread will run even after system suspend was
completed. Any register access after system pm callback flow
will result in kernel crash as still jack poll worker thread
tries to access registers.

To fix the crash issue during system flow, cancel the jack poll
worker thread during system pm prepare callback and cancel the
worker thread at start of runtime suspend callback and re-schedule
at last to avoid any unwarranted access of register by worker thread
during suspend flow.

Signed-off-by: Mohan Kumar <mkumard@nvidia.com>
---
 sound/pci/hda/hda_codec.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index 7b2e62fa82d5..384426d7e9dd 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -2940,8 +2940,7 @@ static int hda_codec_runtime_suspend(struct device *dev)
 	if (!codec->card)
 		return 0;
 
-	if (!codec->bus->jackpoll_in_suspend)
-		cancel_delayed_work_sync(&codec->jackpoll_work);
+	cancel_delayed_work_sync(&codec->jackpoll_work);
 
 	state = hda_call_codec_suspend(codec);
 	if (codec->link_down_at_suspend ||
@@ -2949,6 +2948,11 @@ static int hda_codec_runtime_suspend(struct device *dev)
 	     (state & AC_PWRST_CLK_STOP_OK)))
 		snd_hdac_codec_link_down(&codec->core);
 	snd_hda_codec_display_power(codec, false);
+
+	if (codec->bus->jackpoll_in_suspend &&
+		(dev->power.power_state.event != PM_EVENT_SUSPEND))
+		schedule_delayed_work(&codec->jackpoll_work,
+					codec->jackpoll_interval);
 	return 0;
 }
 
@@ -2972,6 +2976,9 @@ static int hda_codec_runtime_resume(struct device *dev)
 #ifdef CONFIG_PM_SLEEP
 static int hda_codec_pm_prepare(struct device *dev)
 {
+	struct hda_codec *codec = dev_to_hda_codec(dev);
+
+	cancel_delayed_work_sync(&codec->jackpoll_work);
 	dev->power.power_state = PMSG_SUSPEND;
 	return pm_runtime_suspended(dev);
 }
@@ -2991,9 +2998,6 @@ static void hda_codec_pm_complete(struct device *dev)
 
 static int hda_codec_pm_suspend(struct device *dev)
 {
-	struct hda_codec *codec = dev_to_hda_codec(dev);
-
-	cancel_delayed_work_sync(&codec->jackpoll_work);
 	dev->power.power_state = PMSG_SUSPEND;
 	return pm_runtime_force_suspend(dev);
 }
-- 
2.17.1

