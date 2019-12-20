Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 252D5127598
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Dec 2019 07:15:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DDFF15E5;
	Fri, 20 Dec 2019 07:14:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DDFF15E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576822500;
	bh=OjGaRjlqnCiT/9li2qaT0fAVucjvCA/8+bpcjUOQHY8=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tkSGUOy7tqj0RfTGS9Bzd9AL+aeMN3m7SdwUyhpOqY4dgLduzsQuEW2nSBNc3PKwy
	 n7xy/PmUFHpVYu2qOTF16SbiLtSzdd11/OavRUDEfBYiNRB5ZF5t+dywW4M26CW1SO
	 Q08tGGqSsP3kAdFQelxUoltVK+J8Vwpogc1HOh0U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F9B8F8015A;
	Fri, 20 Dec 2019 07:13:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3D25F8015A; Fri, 20 Dec 2019 07:13:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,MSGID_FROM_MTA_HEADER,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2063.outbound.protection.outlook.com [40.107.223.63])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8AC9F800B5
 for <alsa-devel@alsa-project.org>; Fri, 20 Dec 2019 07:13:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8AC9F800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="XNxhr+M0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RNIXh1aT3tKEst6zzwCWarzWd0RVXKKYS7/IOlnjNzXaQWlvO0gEgZLoOsKRXk3N3xqFs0OuL5RakTEjcCBd0R0bre9H6kAkSjGPXiX4mgOMhT+6/lGVAf/Gol2k1VtNZ3Vvk2MgxbePgBK4l3oWcvJOEHDpwVCl8zIRDf+4wvROsn82lvEZOZhSDLJ37H1lpTuAKvcPKWWF36Uc1jhx/YYk1n1+ossIsAfIcO3FjXNjNSiCSEUdNG3A8JYNf0hSBK7OVVZbNmFlIk5oqECUpDPPHuRoNOMnpMRDR1T4TI0qrlhcH6n8lvPxILKiPoMtv7qkdy7Lzo1cQLBMlQiogg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Qa+aMJ9hftRyKUDN1LXdUAUje3dhtD9BQj2cJoEgZU=;
 b=I2vcku89hMKmiVKdzyvc/Hg3FHpIawgpXiWFUDQCaLvHI6a/KTdtKwdGuyKPtuYVSiU+Y6EIPzT3nCs65BFKOd/2Z4ai6hZt0dGKe2UJso4MQoR0/yJ/+4Ljj0dbLt+k/IT2uG5ByZUOwK6X/L8i83iwqhpAquDiUt0emcTyodz6FjkqRumNrVELXtjXbdOXbDH4VXnuIYPQatvREaw5r7RFc1JSe6URXWe7q0bnGmhc8QqONV4JITxZttos3t/cW9cHuwzHlXR0lr7jSZdZUHPEo0nWq5g91iYXnJbll7eWyrlhhmN1sG+R+RF7M4y+jZCOikEr4So27fWRzK1iDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Qa+aMJ9hftRyKUDN1LXdUAUje3dhtD9BQj2cJoEgZU=;
 b=XNxhr+M0dhvSseupzTDkMNumdTl1cRotGAYwiPPjoJKdcr+wL8ghyBILtM+0WCS/PyEMWPExrfz2kVxHP1q1yy9lUtGDyeFC8QhRXguYAb74DLWNZW6+22jlxIZvVGXlNn746Ow1krQ3WQVVaZcjl55On/m0rilQUWHie0ZEQ4c=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Akshu.Agrawal@amd.com; 
Received: from MN2PR12MB2878.namprd12.prod.outlook.com (20.179.80.143) by
 MN2PR12MB4000.namprd12.prod.outlook.com (10.255.238.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.18; Fri, 20 Dec 2019 06:13:05 +0000
Received: from MN2PR12MB2878.namprd12.prod.outlook.com
 ([fe80::c97e:d4c0:bfaf:5edf]) by MN2PR12MB2878.namprd12.prod.outlook.com
 ([fe80::c97e:d4c0:bfaf:5edf%3]) with mapi id 15.20.2559.012; Fri, 20 Dec 2019
 06:13:04 +0000
From: Akshu Agrawal <akshu.agrawal@amd.com>
To: 
Date: Fri, 20 Dec 2019 11:42:19 +0530
Message-Id: <20191220061220.229679-1-akshu.agrawal@amd.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: MA1PR0101CA0031.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:22::17) To MN2PR12MB2878.namprd12.prod.outlook.com
 (2603:10b6:208:aa::15)
MIME-Version: 1.0
Received: from ETHANOL2.amd.com (165.204.156.251) by
 MA1PR0101CA0031.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:22::17) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Fri, 20 Dec 2019 06:13:01 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [165.204.156.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 308757b1-4d57-45cf-a0bc-08d78513ac79
X-MS-TrafficTypeDiagnostic: MN2PR12MB4000:|MN2PR12MB4000:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB40007CF9F713E64E11F729CAF82D0@MN2PR12MB4000.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:130;
X-Forefront-PRVS: 025796F161
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(39860400002)(136003)(376002)(396003)(189003)(199004)(478600001)(36756003)(4326008)(8936002)(6666004)(1076003)(2616005)(8676002)(81156014)(54906003)(956004)(7696005)(26005)(6486002)(86362001)(5660300002)(2906002)(316002)(44832011)(52116002)(66556008)(81166006)(16526019)(186003)(109986005)(66476007)(66946007)(266003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4000;
 H:MN2PR12MB2878.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rmAdEvTo2tgv1LIuEXJNpZ6KXByTF6p8xrfJoGH9GayqQUOk53b4/0pn6U0Su1McfYTkOw5fteMzRwff/AX1ys702wYEoYhFF7npy4p2/B0q1ngGmGECth+7KKg6bpFkTpWyGUi1hE5SdBVV4ZezmTOgTxLjMbxIWb9WxEI3WtTevoskep85mQU/1nWsB2ZsbH6OjqEyx+t4/ntOm/WZFPCEnqWbHu3EWtav0ZC9BcAqanItnSa5s0XqxppH+Q38oH5Kx4lXUwylCDJygqs12AzF0nre52eabvHvi0zkI6TOK+NmRWA9OJGLav7BJi2EpImZJF7t6Y9n+PZ4bzFAja+ExfUcfe+VmMRk7E08PDIF7E/SuUEPe4axlPXygAaq0krBs4tadQsCLrUpKCVaM+yEwViDQc1tCLPcggYgTPITSpnanD/08Mdys3WJ2QAGoQSZKkGrqW7g7L2ZrKYzlTkmLtyTouAP1yzP/FKY8pI=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 308757b1-4d57-45cf-a0bc-08d78513ac79
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2019 06:13:04.5306 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nj0LQbCPQmb3MTSj8fbRgkFk0qxDDbQvLo8RdovajDp2kKjc7T0Pu3M3V/WSm/G3SbXZs+TjozxcgPMmiOCeHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4000
Cc: Oder Chiou <oder_chiou@realtek.com>,
 "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Bard Liao <bardliao@realtek.com>, akshu.agrawal@amd.com, yuhsuan@chromium.org
Subject: [alsa-devel] [PATCH] ASoC: rt5682: Add option to select pulse IRQ
	in jack detect
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Some SoC need to set IRQ type as pulse along with other JD1 options.

Signed-off-by: Akshu Agrawal <akshu.agrawal@amd.com>
---
 include/sound/rt5682.h    | 1 +
 sound/soc/codecs/rt5682.c | 3 +++
 sound/soc/codecs/rt5682.h | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/include/sound/rt5682.h b/include/sound/rt5682.h
index bc2c31734df1..64cfa77ec9ee 100644
--- a/include/sound/rt5682.h
+++ b/include/sound/rt5682.h
@@ -22,6 +22,7 @@ enum rt5682_dmic1_clk_pin {
 enum rt5682_jd_src {
 	RT5682_JD_NULL,
 	RT5682_JD1,
+	RT5682_JD2,
 };
 
 struct rt5682_platform_data {
diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index ae6f6121bc1b..5135d7757361 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -1009,6 +1009,9 @@ static int rt5682_set_jack_detect(struct snd_soc_component *component,
 	}
 
 	switch (rt5682->pdata.jd_src) {
+	case RT5682_JD2:
+		regmap_update_bits(rt5682->regmap, RT5682_IRQ_CTRL_2,
+			RT5682_JD1_PULSE_MASK, RT5682_JD1_PULSE_EN);
 	case RT5682_JD1:
 		snd_soc_component_update_bits(component, RT5682_CBJ_CTRL_2,
 			RT5682_EXT_JD_SRC, RT5682_EXT_JD_SRC_MANUAL);
diff --git a/sound/soc/codecs/rt5682.h b/sound/soc/codecs/rt5682.h
index 18faaa2a49a0..434b1c9778b2 100644
--- a/sound/soc/codecs/rt5682.h
+++ b/sound/soc/codecs/rt5682.h
@@ -1091,6 +1091,8 @@
 #define RT5682_JD1_POL_MASK			(0x1 << 13)
 #define RT5682_JD1_POL_NOR			(0x0 << 13)
 #define RT5682_JD1_POL_INV			(0x1 << 13)
+#define RT5682_JD1_PULSE_MASK			(0x1 << 10)
+#define RT5682_JD1_PULSE_EN			(0x1 << 10)
 
 /* IRQ Control 3 (0x00b8) */
 #define RT5682_IL_IRQ_MASK			(0x1 << 7)
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
