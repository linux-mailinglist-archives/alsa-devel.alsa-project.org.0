Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 449054C4EFC
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 20:36:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE6CE1F3A;
	Fri, 25 Feb 2022 20:35:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE6CE1F3A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645817788;
	bh=O6smHUpz+RI2jUmpM6QoiqRPk9IIyK0u1CQDYStDJrI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kqZsZwlfjQFsWC/GuNCC0nQP+qOdWxtbL7KhI1joRMjgGH6clkkjZZ9uEqBxGtXYY
	 ZrduzBpcwYgmRhswVwLYORZLZISy6FrjSIqkb8Zu8Lo4jQYboxmRy7P3AxRNmpl3q+
	 +mX37+kiyKIHiVg/hKnLaKuRbzBogA5tGX5v1wso=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 493C5F804DF;
	Fri, 25 Feb 2022 20:35:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65DE7F80518; Fri, 25 Feb 2022 20:35:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::601])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33EE0F804DF
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 20:34:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33EE0F804DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="Ukx2NbGE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kSq7Acg54sa+lcWvOnePqkXLX11pVualbQ1gG4SMT5eV8ArOjh73R2EBjnN58q8+BNjkwEMYW/7f+Dy1E5v01Lvmy2DcIzNR8w8TNyff691hhOeglgm12tGUKfdiIG9SgA3q6ePBNjXj/AW+JJWeILp3rvMvYmliQBP3YW46vDH2x1qc6HOLzstQghrT/sogFHmSPsXG3G4Jy/slS0WE1lxiex90uIeiXfGNncDxL7IXKWSCDEMSsGx3akjatM3aRjYvCRDY0jbg5qJ7RoEuzKbD9N4Mxl4jEx8fxIs4jJqhcWzVI6TIAsKKMtw5iWvkwS0zk1BE3HwjTHutG4z5fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ahqjXs1Gj7NtpnkeeymB0RB1xWhMci7+WgZ5gcIFCrY=;
 b=jQB5Ecl2ZPRTrgmvGyt5SMl4dQVsV/WNhuKtii6YUmQRb0kymuI+rA/yHkRAZcdY89j1Jx8ku+4QF8IMA7J8ZFDrV40Y0eH1VqZs50FSoXZxAKRWsXKhUxrnyqHK4PiKjff8y/vej7kxNODnAu+7rw7ZOVuedPRqUGuPBqLGiS/hKUJDXDbqqiN/FAcWlCV/fV4+BY8ymMS+gIcOTJbPk48r/pa96XqJQWDh5+s3lFS0s2pRmjrJkpqF/zO8+OFcXUmIKjFJnaLknag3gHxE5s42PEgqJXMUbmCsjQcX5G58TsB35TkbmqPKCVXwPf8CU6FOp06LM4/QWgJdo5qsqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ahqjXs1Gj7NtpnkeeymB0RB1xWhMci7+WgZ5gcIFCrY=;
 b=Ukx2NbGE8K0pZlS94IW7PiKzKg5iXiyBaVcnTtz4N4UOW92xmii4N0LGneL2aNKGmvvTA3oraGXemmdY4AWEQmO1+zzpgzjncmriCJeptWHfC7dBLmuN1tHoKML/T5MrlkYevoiFFM51thOwPaC24mzEtYGAQKoLWsSFyyCzs8Q=
Received: from MWHPR07CA0014.namprd07.prod.outlook.com (2603:10b6:300:116::24)
 by DM6PR12MB4761.namprd12.prod.outlook.com (2603:10b6:5:75::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Fri, 25 Feb
 2022 19:34:52 +0000
Received: from CO1NAM11FT051.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:116:cafe::1) by MWHPR07CA0014.outlook.office365.com
 (2603:10b6:300:116::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22 via Frontend
 Transport; Fri, 25 Feb 2022 19:34:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT051.mail.protection.outlook.com (10.13.174.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5017.22 via Frontend Transport; Fri, 25 Feb 2022 19:34:51 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 25 Feb
 2022 13:34:50 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 25 Feb
 2022 13:34:50 -0600
Received: from LinuxHost.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.18 via Frontend
 Transport; Fri, 25 Feb 2022 13:34:46 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH V2 3/4] ASoC: amd: vg: remove warnings and errors pointed out
 by checkpatch pl
Date: Sat, 26 Feb 2022 01:00:24 +0530
Message-ID: <20220225193054.24916-3-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220225193054.24916-1-Vijendar.Mukunda@amd.com>
References: <20220225193054.24916-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb23e599-8a96-4a56-cb7d-08d9f895e480
X-MS-TrafficTypeDiagnostic: DM6PR12MB4761:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB476132EC29EEA302B21A860C973E9@DM6PR12MB4761.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eEglWkZh+fdbnuxV0lcvk7GOUtKKr5eNhrMe5xXZCpaywz9MQWBcmh4/c8xy6BCtKhAl12RhdJubFLNqsKtteHOJp7LaMgt56ISes1MsQ6gTw5aOv2aL6sQ+E83SZTTidOFhJfi1I3JxjjYBfkopMDGAbwWIQEifBJYBjGs7sqSwQifbATlsg4T9VabMt0SOkBi88rvd+kojjMjdR3mu8VaJkpxShtB7cBp0hKsUD5ooqzuHv0KesTttNpKDyJtwzKhBtIQHfuaSJcojor0G3GJMNz8v6cHB/9BngH/79pqayVerghJdmPtwP4Tjkw/kdgQPR8pY82Qp5PQObT0O15zbWru2izFNl8rTJ9HstBGfhzTqlOUc1sVNLsGQ7BD8y3nqec8J0arLVxZDbbSvEr8+9M5P4/6PlfwqRXUOK2yW6MW+fDSeuLtaKpuyoYoYRZW47Ib91bxUhzkoMRqOz0ZW+5hoDyAn/zEYgRcBTGoxkK631oZLMJ42Tes5ZUkrljr4J2G0skcse0HI93RzwGEk+UVvfC9GbkKSGMnxwdA2RIJmr/jjyLxYh3xgUiIVWlKb51dC/hzQ+GdEs+unCIFlXDFr5jqB7IcMsbqaK9lHufwmXsRcMNHXX/40EyOzBgBDo+c2qkcXKCII5dGxUiD5ckVETlhhewFqN4tsturKdejRf7CaVDdPOjQmaSh7yIZ8fJXahKIDnbMqDuXxXg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(110136005)(8936002)(26005)(54906003)(82310400004)(8676002)(356005)(81166007)(4744005)(186003)(70206006)(70586007)(1076003)(4326008)(508600001)(36860700001)(36756003)(316002)(2616005)(83380400001)(47076005)(40460700003)(86362001)(6666004)(5660300002)(2906002)(426003)(336012)(7696005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 19:34:51.5066 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb23e599-8a96-4a56-cb7d-08d9f895e480
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT051.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4761
Cc: Sunil-kumar.Dommati@amd.com, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com,
 krisman@collabora.com, dan.carpenter@oracle.com
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

Fix checkpatch pl errors and warnings in vangogh machine driver.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
v1 -> v2: fixed spell error in commit message

 sound/soc/amd/vangogh/acp5x-mach.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/amd/vangogh/acp5x-mach.c b/sound/soc/amd/vangogh/acp5x-mach.c
index 287efd9282db..c574e80907f0 100644
--- a/sound/soc/amd/vangogh/acp5x-mach.c
+++ b/sound/soc/amd/vangogh/acp5x-mach.c
@@ -341,7 +341,6 @@ static struct snd_soc_card acp5x_card = {
 	.num_controls = ARRAY_SIZE(acp5x_8821_controls),
 };
 
-
 static int acp5x_vg_quirk_cb(const struct dmi_system_id *id)
 {
 	acp5x_machine_id = VG_JUPITER;
@@ -371,7 +370,7 @@ static int acp5x_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	dmi_check_system(acp5x_vg_quirk_table);
-	switch(acp5x_machine_id) {
+	switch (acp5x_machine_id) {
 	case VG_JUPITER:
 		card = &acp5x_card;
 		acp5x_card.dev = &pdev->dev;
-- 
2.17.1

