Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0A516FC7D
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Feb 2020 11:50:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F65C1689;
	Wed, 26 Feb 2020 11:49:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F65C1689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582714201;
	bh=zrDL0zPXlqXLlJajJa28X8nbamB74ZT0CoNk4GT5+7U=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tI97m5BzQaFo06X4RBdH9VoERdbioBMjfxS6uhugNCYK5Qg8FuU3TftvDPaWaRu3F
	 QeAJ2kUdS/aLdC3eeEf0j7TsaluylTEDHvpujI7nlH15YgVfj/IJfv6O/56Hsugz/b
	 ejMIvxCcCqMjP6M8IS0F/yyffdpssxIHusPkEQ7g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC971F80089;
	Wed, 26 Feb 2020 11:48:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27D74F8014E; Wed, 26 Feb 2020 11:48:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_NONE, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2082.outbound.protection.outlook.com [40.107.94.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97A64F80089
 for <alsa-devel@alsa-project.org>; Wed, 26 Feb 2020 11:48:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97A64F80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="iUmc3+8l"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jlm4NdWdxKoCoLRfR4c50s88mvBEVGMebcU9SkahPTAzHNkHBxQ7DHC+lOeZtkG1kO8iQQOD0ZxecPpdbth+h6DaaaLiN87fi4kS2s1GjGWZ6Yul+7KFFKSiu4Br+0ILqQnpFq6jW5ajM9FWwMBk6gZ5fK31dHhMxq1Su60GsgxzMTJR3GzWF9C6K29CSc70ZGj0iTEedGPTbhKw07FNvZqlLokFScapaGrRu47F4Q8W+J8LDEo5cmbny/BghnvOQ2WIevlLs8VxcBejjNE9Z4myZzSeK7wsYZFe+fErtKeehR9YqbEUD03z8uBj/DFIlHe7Q2vdl2sBPxIme3kfmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e05O7S0fVACmLEUf4sQLdymJPZrazZng7CpD9B9TZqc=;
 b=DyEGUlxlSkluRnCTaAJxTaey3Kt5XxSQbRQ5ZMoRA2Yud0BQzgrhIIv6/JXI2x2saP1/meR/GxXIpnTMAK8kSrJSyzchXP4hLyoVbfYsHLqVfyEMfI47EOeZFwNzZutkzDhsp213u6vb2SDALdL1XjqeVBptSZ6/ZQyfD9c04Ymw+G9j2xDRUGHzxXxR7t/qtggzmp91gWYZQLCiqBE1p0KiUupGHP3hqtXDcyCLYARtxoS3MotAf5jHmoochP8fMCV9oJlBoSWOgl60BRH1g3g+NosKG5CAcAL9QtrWlMKCmFNQwCzRhrKho3OLt3W5OrVhzhguwg4/ot7Rdh7vlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e05O7S0fVACmLEUf4sQLdymJPZrazZng7CpD9B9TZqc=;
 b=iUmc3+8lEBxNmrrmvGoiwLhpii89biNTF+/92YInBEoPeJZ9IE8H4p/mxX3h9NGee1CO/NMJTBh21xUTJ4uTLvAIScb10I0MQFp0ngJwKlDqsx0o242kXLzfXrcD1PHb2OoZO0SSrEu+HaSM3WTHrJJBaFwdoiSDU6XtEDbHRVU=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Akshu.Agrawal@amd.com; 
Received: from MN2PR12MB2878.namprd12.prod.outlook.com (2603:10b6:208:aa::15)
 by MN2PR12MB3933.namprd12.prod.outlook.com (2603:10b6:208:162::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.21; Wed, 26 Feb
 2020 10:48:09 +0000
Received: from MN2PR12MB2878.namprd12.prod.outlook.com
 ([fe80::c895:8c76:61ae:980f]) by MN2PR12MB2878.namprd12.prod.outlook.com
 ([fe80::c895:8c76:61ae:980f%3]) with mapi id 15.20.2750.021; Wed, 26 Feb 2020
 10:48:09 +0000
From: Akshu Agrawal <akshu.agrawal@amd.com>
To: 
Subject: [PATCH] ASoC: amd: Allow I2S wake event after ACP is powerd On
Date: Wed, 26 Feb 2020 16:17:44 +0530
Message-Id: <20200226104746.208656-1-akshu.agrawal@amd.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: MAXPR0101CA0011.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:c::21) To MN2PR12MB2878.namprd12.prod.outlook.com
 (2603:10b6:208:aa::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ETHANOL2.amd.com (165.204.156.251) by
 MAXPR0101CA0011.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.18 via Frontend
 Transport; Wed, 26 Feb 2020 10:48:06 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [165.204.156.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 05ecfdab-50cc-4128-2458-08d7baa95e35
X-MS-TrafficTypeDiagnostic: MN2PR12MB3933:|MN2PR12MB3933:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3933B7DE54A25F2EFFE6850CF8EA0@MN2PR12MB3933.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-Forefront-PRVS: 0325F6C77B
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(136003)(396003)(39860400002)(376002)(189003)(199004)(7696005)(52116002)(4326008)(86362001)(109986005)(26005)(186003)(4744005)(6666004)(6486002)(66476007)(66556008)(66946007)(16526019)(478600001)(81166006)(316002)(36756003)(8936002)(1076003)(8676002)(81156014)(44832011)(2906002)(2616005)(956004)(5660300002)(54906003)(266003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3933;
 H:MN2PR12MB2878.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C5J+773CcQoj6IuBubWZfetl0KizZytqnnJWyVQlHXrGOFdob+VotnsGQlLWKYj8CZ2U2l6A3EjNwr6AhhbO9Rm3Jj2JAORqSANuUhnfGbVpGn+TnJ1NO+SCLdtJBV8BR6yt5LuQ8iNLJlbRyaiqYUfeCR11VDot/jX1B/BFgJLo9u2AFUu3qHAffOLDNhPzN144kTwmEpTYu0DXphol4kGhK8cE33pbnYCIk76ozfv1bupQBWEfISeswbZDWlsyCqeXmSuEWkOy7NDyjD2kp0kCUX7dSQqsUM7LMl4X36kWCB8Hi5oP+R73wX0+NTGJgVKIol+2W6V6RjPwr0tjIB49I9mqVKIcjo37jecH1Daw+AQqapCBrINN32jsSwuqWfojTNkpPgy5sWE9b/qbKk8HyjEJ9WWRH4u7NaCkLfQWkL249j70PpRhT9IzMVSPQ+QG3+5VLmCa6Lg+6e7ilRYkp3vytl8Lgcj83UocewA=
X-MS-Exchange-AntiSpam-MessageData: Z7DxFJib44MiGgv53aQjZjx9fioIo37G2p/9E+33yZfiYAwDbrPSyM7p33XjFd5IcKjyxhZiGMoCsA58geqLIYCD2cB0fmwKC1MEzd3hOgb8YDfCRkhrzNUxFthkSpcfuFAmzbDM01aE3r+g56uoMw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05ecfdab-50cc-4128-2458-08d7baa95e35
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2020 10:48:09.3652 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7zhSEfmkIPS3deL0oQEhhFZUa6J2sLzH+8wRXS85CogxsJgiRp1TKYQHk3bbtpBaHYTJBwUajiIqsmGgK/PwVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3933
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 akshu.agrawal@amd.com, Dan Carpenter <dan.carpenter@oracle.com>
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

ACP_PME_EN allows wake interrupt to be generated when I2S wake
feature is enabled. On turning ACP On, ACP_PME_EN gets cleared.
Setting the bit back ensures that wake event can be received
when ACP is On.

Signed-off-by: Akshu Agrawal <akshu.agrawal@amd.com>
---
 sound/soc/amd/raven/pci-acp3x.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/raven/pci-acp3x.c b/sound/soc/amd/raven/pci-acp3x.c
index da60e2ec5535..f25ce50f1a90 100644
--- a/sound/soc/amd/raven/pci-acp3x.c
+++ b/sound/soc/amd/raven/pci-acp3x.c
@@ -38,8 +38,13 @@ static int acp3x_power_on(void __iomem *acp3x_base)
 	timeout = 0;
 	while (++timeout < 500) {
 		val = rv_readl(acp3x_base + mmACP_PGFSM_STATUS);
-		if (!val)
+		if (!val) {
+			/* Set PME_EN as after ACP power On,
+			 * PME_EN gets cleared
+			 */
+			rv_writel(0x1, acp3x_base + mmACP_PME_EN);
 			return 0;
+		}
 		udelay(1);
 	}
 	return -ETIMEDOUT;
-- 
2.17.1

