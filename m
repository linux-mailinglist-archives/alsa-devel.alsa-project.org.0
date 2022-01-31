Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A02B4A46D0
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jan 2022 13:21:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99F67166B;
	Mon, 31 Jan 2022 13:20:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99F67166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643631673;
	bh=tVtd+Mvho3tn3+97c2t3uLh/axpT161IoJI/7erCeNk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vX/EDjNDkCw1676wDpKoyJTGQTGuQL2F0pU9SWl/yh5UA42BogMh4GPNfx5yXC9ik
	 eGmwxLGBkrmSxqVPaSGXaOigyCRliM9g8PsDTJhxmhgYwreeiC3P5BEQKsG5FiX+P2
	 aBuHQBttlrCLq1kma0PAE7sX9yuQkUW3EANpbcLw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 036B4F80302;
	Mon, 31 Jan 2022 13:20:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14D54F800CE; Mon, 31 Jan 2022 13:20:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DATE_IN_FUTURE_06_12,
 DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2061.outbound.protection.outlook.com [40.107.101.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2E24F800CE
 for <alsa-devel@alsa-project.org>; Mon, 31 Jan 2022 13:19:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2E24F800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="hE/0Sur9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sfcpvgehq73A6pSo8dezdUKvfISRY4BB0lBoqo/L0A6MO/KNyDQBzmgVcxnNicSgIgtaueSvBeb0CrycdpEOLKp7na2EVGDkAWMhZom5ObWyOux/MdilIKduGgWUTyJumbmSlSONmJ36BvObaCLZZkOg+jlsGdVgpuxT9sS2HI717cauXudbJbEfoHtnuch/mJ3W48Ta8oanBExeHUzKXC8LPSfg1obxuuIkNH5cCEvN/cs8X2SLLpJ6k168J3//P0/WdNYpAfA+AHgPtQOA1POQO4pYk3Za1QdBLl9f1IME2dPJVSrALf1lfkLgrcgMLO68vKltz+y7EpS/5SSsxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b6VA/y3wMaekNgG6yqVkXH9mVHuZLOl8OH8xr6DOUZQ=;
 b=ie+6fYcMHTgJ9M8U26SBVbjEssXcWKy7kqU3LKFXKfTEeCNMrOcQw5OjXpYt3+faj7nZNpYdbAJYsDYT3YgW94SGdOeNmLFw+Zgl7MThVlDFimJW+ZGEx3FrlDt7Ull1tUL2iXPA4qbEiQ6UdY35azL60eKKGxOeAWaF9wD4MD7zSRnEcJRw3y3LVYJGjZ4jfepf4866y5JP66S6y1pBPr4IxFx9eahJZGwMK40fNMiLPw1O3NbNsuhn6FibzDNMrJ7hhC0XFPacPrYbSxvd5OQ5TetbPGP9cp/7+/CcRLx7GFDg/FQ4pGAHtcUj/W0QwoIJjPjguB8kd1Md79IUww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b6VA/y3wMaekNgG6yqVkXH9mVHuZLOl8OH8xr6DOUZQ=;
 b=hE/0Sur9fquJ/46QDWJPyV8154oP2cKllGuGyUjW6b0fKB0tx2PKsfRu5Ic1OqQAFJLDftKyL01gOuWplBfmz8g9zo0rVLIcFpoFr5PCbAuF0HAMuRXUryeFKj3ZlS7gI7jsq0LSChnhujJuH5deeZ9afOYJRj5JtZZE1TGCtZ8=
Received: from DM6PR06CA0055.namprd06.prod.outlook.com (2603:10b6:5:54::32) by
 SN1PR12MB2590.namprd12.prod.outlook.com (2603:10b6:802:2e::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4930.15; Mon, 31 Jan 2022 12:19:53 +0000
Received: from DM6NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:54:cafe::af) by DM6PR06CA0055.outlook.office365.com
 (2603:10b6:5:54::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17 via Frontend
 Transport; Mon, 31 Jan 2022 12:19:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT058.mail.protection.outlook.com (10.13.172.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Mon, 31 Jan 2022 12:19:52 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Mon, 31 Jan
 2022 06:19:52 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Mon, 31 Jan
 2022 06:19:51 -0600
Received: from sof-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.18
 via Frontend Transport; Mon, 31 Jan 2022 06:19:43 -0600
From: V sujith kumar Reddy <vsujithkumar.reddy@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH] ASoC: amd: acp: Set gpio_spkr_en to None for max speaker
 amplifer in machine driver
Date: Tue, 1 Feb 2022 02:02:15 +0530
Message-ID: <20220131203225.1418648-1-vsujithkumar.reddy@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: decce333-3c7e-488d-e323-08d9e4b3fc17
X-MS-TrafficTypeDiagnostic: SN1PR12MB2590:EE_
X-Microsoft-Antispam-PRVS: <SN1PR12MB2590A3A8BCB3D1C6BD3DBACB92259@SN1PR12MB2590.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yTLSwsmPOWTVaio4bh8jfTHqbkJISTzbqDz9jhrDnJpEbdOmMk5i1nOo+ZkHABjuwdprONJMwayZQLkVoFWmJcukTtsE5Wkkym0dHNuxg0Fz6w74n4NNO549QxNECkIrg7nDs05/i/CY1B4Vngywm9DS6hJm5g8/jZPHi5SYtZFH8xEuS5PUkRDH7qTFGHW711kt5H8wuqJRe0zYQKnnMMjMgyRm4lC2RxvNVIppYx0QAInvB2+3l5WyCSLnw9WyYcgvQPadQtS8eKsWmwRdJzbL7m5z3YSahi2hgN1gowfVrD/2PLex1r1ICi38jDtOeH8O3gyJJlgQnQo5E/HhC5bHMUWtPluVL+XrQIXrZ/RMUNxcgCs1euUWjbawF7xQ12InXWKpGllX6nIg1rWgmiM6NPpZ7TuuMNicAYqjlahYQnEJZCoIN0hWQ2CMXhW/q6UyDhcQagmlFzKhWPHTCaf6YRxLr1JdHzBVvTZNKSssaX6MBRJVKgWFPXHdeMBad4ms6ROhN1Ehmrhvnt9saXw7PXezZ+dwy78Y9DpRhm/M4uZflwsOzqmz/FRf7tYaGYmPVTvYxAkrbi1ESQcJqUCi53hOImtCFuxJcNNUtgV56GdXoov0x+0BWyQo1//F5sPR6M3CghrkScpU5gJAqQHpeBx7LOtEdkun+7O57bUnbhn8Cr+0cZfnckuZoqth+PAr2HdgcMhI6KnALmrOnVOjRGDuFTts9Kz4sihy/4+OYw0gPrUhwi5uJhorUJPO
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(6666004)(7696005)(54906003)(70206006)(70586007)(5660300002)(508600001)(40460700003)(26005)(1076003)(316002)(2616005)(186003)(426003)(336012)(110136005)(36756003)(8936002)(81166007)(82310400004)(86362001)(4326008)(2906002)(8676002)(83380400001)(47076005)(356005)(36860700001)(461764006)(36900700001)(20210929001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2022 12:19:52.8244 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: decce333-3c7e-488d-e323-08d9e4b3fc17
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2590
Cc: Sunil-kumar.Dommati@amd.com, Ajit Kumar
 Pandey <AjitKumar.Pandey@amd.com>, open list <linux-kernel@vger.kernel.org>,
 Basavaraj.Hiregoudar@amd.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Vijendar.Mukunda@amd.com, V sujith kumar
 Reddy <vsujithkumar.reddy@amd.com>
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

Maxim codec driver already enabling/disabling spk_en_gpio in form of sd_mode gpio
hence remove such gpio access control from machine driver to avoid conflict

Signed-off-by: V sujith kumar Reddy <vsujithkumar.reddy@amd.com>
---
 sound/soc/amd/acp/acp-mach.h     | 1 -
 sound/soc/amd/acp/acp-sof-mach.c | 4 ++--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/amd/acp/acp-mach.h b/sound/soc/amd/acp/acp-mach.h
index fd6299844ebe..c855f50d6b34 100644
--- a/sound/soc/amd/acp/acp-mach.h
+++ b/sound/soc/amd/acp/acp-mach.h
@@ -21,7 +21,6 @@
 #include <linux/gpio/consumer.h>
 
 #define EN_SPKR_GPIO_GB                0x11F
-#define EN_SPKR_GPIO_NK                0x146
 #define EN_SPKR_GPIO_NONE      -EINVAL
 
 enum be_id {
diff --git a/sound/soc/amd/acp/acp-sof-mach.c b/sound/soc/amd/acp/acp-sof-mach.c
index c1d9650fc222..3346677949e3 100644
--- a/sound/soc/amd/acp/acp-sof-mach.c
+++ b/sound/soc/amd/acp/acp-sof-mach.c
@@ -37,7 +37,7 @@ static struct acp_card_drvdata sof_rt5682_max_data = {
 	.hs_codec_id = RT5682,
 	.amp_codec_id = MAX98360A,
 	.dmic_codec_id = DMIC,
-	.gpio_spkr_en = EN_SPKR_GPIO_NK,
+	.gpio_spkr_en = EN_SPKR_GPIO_NONE,
 };
 
 static struct acp_card_drvdata sof_rt5682s_rt1019_data = {
@@ -56,7 +56,7 @@ static struct acp_card_drvdata sof_rt5682s_max_data = {
 	.hs_codec_id = RT5682S,
 	.amp_codec_id = MAX98360A,
 	.dmic_codec_id = DMIC,
-	.gpio_spkr_en = EN_SPKR_GPIO_NK,
+	.gpio_spkr_en = EN_SPKR_GPIO_NONE,
 };
 
 static const struct snd_kcontrol_new acp_controls[] = {
-- 
2.25.1

