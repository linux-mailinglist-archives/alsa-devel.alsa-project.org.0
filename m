Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C16A8348793
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Mar 2021 04:39:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E888166A;
	Thu, 25 Mar 2021 04:38:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E888166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616643570;
	bh=cACkLRo1YFmy0P3kbuDdbyKrGp8sMYWU0C2dUW/VKSk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YuBj10+E35iBcs6b8j4sDg5wXyeNs5BKLM+hjXPv+e1kYYghkqP9rUoxZejwTtWIa
	 z/9VQGVMS5+nfgm9yOrRmyat4dRdR+6V20UI4rHRnz+z62hQ8tmR5ngRFlYN8tCvOH
	 fZSiUDirwuwZplvn/1Q/p53vwH5phL8AQRpgmZTk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F644F8032B;
	Thu, 25 Mar 2021 04:37:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57E7CF80257; Thu, 25 Mar 2021 04:37:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam04on070f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe4d::70f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E95B8F8025F
 for <alsa-devel@alsa-project.org>; Thu, 25 Mar 2021 04:37:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E95B8F8025F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=maximintegrated.onmicrosoft.com
 header.i=@maximintegrated.onmicrosoft.com header.b="J2APmxxY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=czrIyGroAzIqfMwJWLekKe4ysVHmU3W2Zvn0sHgyF230l9jaSgcw73XEmDOhBKfN8bN+5H0+hRNL5RUzThugMKl83x2RWIxTftif2Q1zvv7AkBrUyn4plcJdabhh7wELmxqr8qf8N2dwTM1uzZqFDVAzWL9N68tGT5O36n02xLH28wXib43XouoN38fLPSqd1oeDtsM4uZrwpRveSnqHV+xz/GnFx5EyT1vlSfjl7LGUcMF1oQ13Bi51bhcfpYEv4TiIQNKQDbqljT3YrzamR3l0b6O6I6V13O5dHi6nADJINecxhi+pC1drCvQZ87VNbK/8jPhqCx1Jdrxhbgo9SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+wDd7n5cgXIcltEj8IDCLemSRUOR5/Ppb2B5PRam3yo=;
 b=PA7JeROCSKPimThY/o0QUkJs9h70b/JLhQOUZ1ytq8Ii501sqYxzlT723r5vnjtxL2NR+7QaJNqG60FrxPxSX53xdfNkP3XJcALwa9rhd7ay5MC/up9mcG/siao1ghFb7xadS+fAqAGvX5dWrFpKFNbllmw6JabGMz8nc39KBiR9VdA7Yx3Va0ECmsIgeZtFr474c0GxroBuiV36PxUwKlwkkh2H+XAk1MhBFVqkYFJ0sJihV5ZF13OgZ2RjyvzdPbXFjt+sVTqlgp2peuMgbD/ODzI1af6aRP0Xgob8Cz5mW/wT7S31yA7oYjeGSIeZqax/vclZHihTM1GNfymfoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=maximintegrated.com; dmarc=pass action=none
 header.from=maximintegrated.com; dkim=pass header.d=maximintegrated.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=maximintegrated.onmicrosoft.com;
 s=selector2-maximintegrated-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+wDd7n5cgXIcltEj8IDCLemSRUOR5/Ppb2B5PRam3yo=;
 b=J2APmxxYal1Jn8Lhem0RGi0eclC328mZbfD+XzIXdmbIL4oZ/K3QjqtxdxuouOKj61fVWRgixnEAVttFO2LftsLUb/aNpbmCCSwxKctiMSIPc/LAPLM2ZYKTxN8IACKB9n/YA6byVMJ9ShaXPUES0x0q44vT4nsSLTsCNHh1BpA=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none
 header.from=maximintegrated.com;
Received: from BYAPR11MB3382.namprd11.prod.outlook.com (2603:10b6:a03:7f::15)
 by SJ0PR11MB4798.namprd11.prod.outlook.com (2603:10b6:a03:2d5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Thu, 25 Mar
 2021 03:36:39 +0000
Received: from BYAPR11MB3382.namprd11.prod.outlook.com
 ([fe80::cce5:1aa1:302f:a956]) by BYAPR11MB3382.namprd11.prod.outlook.com
 ([fe80::cce5:1aa1:302f:a956%5]) with mapi id 15.20.3977.025; Thu, 25 Mar 2021
 03:36:39 +0000
From: Ryan Lee <ryans.lee@maximintegrated.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, rander.wang@linux.intel.com,
 ryans.lee@maximintegrated.com, guennadi.liakhovetski@linux.intel.com,
 vkoul@kernel.org, yong.zhi@intel.com, judyhsiao@google.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] ASoC:codec:max98373: Added controls for autorestart config
Date: Wed, 24 Mar 2021 20:35:55 -0700
Message-Id: <20210325033555.29377-3-ryans.lee@maximintegrated.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210325033555.29377-1-ryans.lee@maximintegrated.com>
References: <20210325033555.29377-1-ryans.lee@maximintegrated.com>
Content-Type: text/plain
X-Originating-IP: [73.189.52.211]
X-ClientProxiedBy: BY5PR04CA0001.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::11) To BYAPR11MB3382.namprd11.prod.outlook.com
 (2603:10b6:a03:7f::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (73.189.52.211) by
 BY5PR04CA0001.namprd04.prod.outlook.com (2603:10b6:a03:1d0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24 via Frontend
 Transport; Thu, 25 Mar 2021 03:36:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 075c2253-ac2e-41b1-1d13-08d8ef3f321a
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4798:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR11MB47984DB8FBDF51CEDF09D2B0E7629@SJ0PR11MB4798.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:327;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DGaaZwVfZxeMRqYrqJjyYbWEE2NdYWRIdhR38zJw+7tD4Gu5b76hfGiRYO5o5dW+zjcxh+dd8fU4VxLmIWAbfOkvfrZoXiDhozTIACIDlhlcdvX/ffEFqoSUgv/B/v58YsT2OqBPbWkEN+eMrXQ4+nZbav7c0RRQjbL8iznu9WZxiacW+V1ibCMo8B8fkWjz0VOr1O3hBWeWg3Qm46V39C1xsN1q/jbIV9uif0UufTm+W1pEWICLdSX4M7MwQPZDZQWWcDIVyoM3itKd03niAz5kuP6ClPYjsxeDLGuT5Qw0ONbsSdBmfVSkit18iyH70LkpmoG1GufyyM9Xk0I3v/cl6QqGa85vj/6uHqQiOJiETXlekJIAebsXUN37fT17H8J5DaT7znB4fbutuvCMyxgV2wxsMSX6K4IMD1d5k8PLS2aKN7CDUPOvbcLbB3zn19gOBo670ga9b2g/ZuOsmW/viGM9PJDw2XnBdN2hLS60y4tQ+GQPvF++ucsrA92tVo4YFWA8fNQuXUW/p9SmmtX7H1cboaOTjidA5pW6uE1UOvadeobBami1emKUo1FI6zAkIg4iEKTn2TI7V/ppw/oNWNva3zsg7mXhWQOfq1rC9R8k7Qe5a41qPV6qs+FPJTu38aU5uOJQof8lMdac8qFgdilstWRC1SJKSf2yVWkANouhceEQwjOksPoR0qrpEMnieAJztbmU7pw5lzQtkg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3382.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(376002)(136003)(396003)(346002)(921005)(478600001)(52116002)(6486002)(4326008)(6666004)(7416002)(186003)(69590400012)(26005)(2906002)(6506007)(16526019)(6512007)(316002)(8676002)(2616005)(83380400001)(66476007)(1076003)(36756003)(66556008)(5660300002)(66946007)(86362001)(38100700001)(956004)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?taFvgZS9P2jsiijG4g+f4TpAM0iUuY/xAbWv33f0opHlXk8RkGuP0zD2vQMe?=
 =?us-ascii?Q?pAjSm83PWk+ygFUaDkUvGwXGOMZp/7VkuLGsXQF6Lyf736LKkpf4CLcrri51?=
 =?us-ascii?Q?OupE35JU1PAKwmQf0abcHcWdbJ6jWAGGj7Z8q20CgJetnaFOZePzVGh7qowD?=
 =?us-ascii?Q?LKgBo6UmPmtWV0frp9cTRF7QpKcfH/6tbV4ETGGh/HkN98B1pu1yW9S/g1Kx?=
 =?us-ascii?Q?GbOgLr53ADqhRz6ZEWe1vjr9t0HiU496UPYkSJSfxJLTubMsSmiDydC6v4y8?=
 =?us-ascii?Q?u2G66y6k9+sH2Lm2M9whbvrk7MPjHN8HqYqOYwl+Plm4zyOcR5+I5feg6hD3?=
 =?us-ascii?Q?waT5pBhohJzVP0RR+HyX/I5QQbvEhHL0gG2qOaRpztmc2RuTPzGLr3Wf70HU?=
 =?us-ascii?Q?HRR0LTAl9+TD5ghSnzujFz2g3HiOZ7x1whOvVH/8Lb4I2E8+mONTPJBJbGyi?=
 =?us-ascii?Q?gtE5dDNi2M4DbPVWOodNoCadGn36SMDtlW0Rq9GJuV70Z0NTyNEIrQLTJLkG?=
 =?us-ascii?Q?TYkYqxyqLOxHtYpyJtaUc7LkxLUzI9Zcj2ioFkOxk+8gqw9R15qzZYK28qM9?=
 =?us-ascii?Q?VktyCKq+53G1f4MDdN4L23arzRWGTuAoKzp2PfP1G+uCRoKBvi+YxIeiGhYB?=
 =?us-ascii?Q?eNUhFKjRRLO69DW7Quw0z+3TNTtKL4ccRtQJp2sUH79BbhHqXtcoH6kUbcJg?=
 =?us-ascii?Q?c0UyZ5PIVKDHoyw4Qr2/teb9UeUJ1x0fbgNSICH5XyJbghaCDZcza9uTglgY?=
 =?us-ascii?Q?Ln0QVKMcRpr8xNClcbPCT168ixyP/c7rJ7jqBK7p3FQtlrxd3gvNCkacCfP9?=
 =?us-ascii?Q?DnVtTg2HTPPTg0AP+FM7xLPNhCEstnQ4y+sqeZ2tFG8eUZaRNE+kjkndGchl?=
 =?us-ascii?Q?BNaCQaVRy2f/5rv6JXEMry2pcW9WXeQ6d/YTV7qDEl+H+SM0NMgdBDifB5PM?=
 =?us-ascii?Q?QMQItETIlKiF2PYEC2toglhJzVabAu2iG9GkmDcSohGt9uaX9at5SgzKxXXj?=
 =?us-ascii?Q?UzzaxEvp+DMIapeZ5bAORdcvlJfDllYv8GVRm2kO9n/lOG/FE5eWEPJev0kC?=
 =?us-ascii?Q?2bDhHFq64olIwGjfqK8Oby3ZtCa0DLowCz8bctJpGob3v+gVFQo3HlLlLKrF?=
 =?us-ascii?Q?5kMVJR57BXrdUfRtTKL2eiNma/ligZshBmim7tJW1Q9qqTdPFf62myuXDvXx?=
 =?us-ascii?Q?/hU/Fc7xfzrCzvsHibkogD2KAKmg4i6g6dtmId+Yef7S0wLmI8SGpPUD4BrS?=
 =?us-ascii?Q?Dj72tX8668g9kxA0QJtGSg9/jja1765xx6FGzw+MKENyz+o+FD0khaySU4IQ?=
 =?us-ascii?Q?F+/6mFL0X4FaTn8NIdIRsZXV?=
X-OriginatorOrg: maximintegrated.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 075c2253-ac2e-41b1-1d13-08d8ef3f321a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3382.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2021 03:36:38.7168 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd909df-ea69-4788-a554-f24b7854ad03
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0BoOj3FFX98oUJjoYulgb3ocflQI8y9hR2mDS0ZkV5lW5xH1C6nFOvG4u8zEI7f8pzC5TFNb5/lEltNqX8g8/3tOZJ0Q1MC/vIPPNHFOu6Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4798
Cc: ryan.lee.maxim@gmail.com
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

3 new controls are added.
"OVC Autorestart Switch" : controls whether or not the speaker amplifier
automatically re-enables after an overcurrent fault condition.
"THERM Autorestart Switch" : controls whether or not the device
automatically resumes playback when the die temperature recovers from
thermal shutdown.
"CMON Autorestart Switch" : controls whether or not the device
automatically resumes playback when the clock returns after stopping.

Above Auto Restart functions are enabled by default.

Signed-off-by: Ryan Lee <ryans.lee@maximintegrated.com>
---
 sound/soc/codecs/max98373.c | 14 ++++++++++++++
 sound/soc/codecs/max98373.h |  3 +++
 2 files changed, 17 insertions(+)

diff --git a/sound/soc/codecs/max98373.c b/sound/soc/codecs/max98373.c
index 1346a98ce8a1..e14fe98349a5 100644
--- a/sound/soc/codecs/max98373.c
+++ b/sound/soc/codecs/max98373.c
@@ -204,6 +204,15 @@ SOC_SINGLE("Ramp Up Switch", MAX98373_R203F_AMP_DSP_CFG,
 	MAX98373_AMP_DSP_CFG_RMP_UP_SHIFT, 1, 0),
 SOC_SINGLE("Ramp Down Switch", MAX98373_R203F_AMP_DSP_CFG,
 	MAX98373_AMP_DSP_CFG_RMP_DN_SHIFT, 1, 0),
+/* Speaker Amplifier Overcurrent Automatic Restart Enable */
+SOC_SINGLE("OVC Autorestart Switch", MAX98373_R20FE_DEVICE_AUTO_RESTART_CFG,
+	MAX98373_OVC_AUTORESTART_SHIFT, 1, 0),
+/* Thermal Shutdown Automatic Restart Enable */
+SOC_SINGLE("THERM Autorestart Switch", MAX98373_R20FE_DEVICE_AUTO_RESTART_CFG,
+	MAX98373_THERM_AUTORESTART_SHIFT, 1, 0),
+/* Clock Monitor Automatic Restart Enable */
+SOC_SINGLE("CMON Autorestart Switch", MAX98373_R20FE_DEVICE_AUTO_RESTART_CFG,
+	MAX98373_CMON_AUTORESTART_SHIFT, 1, 0),
 SOC_SINGLE("CLK Monitor Switch", MAX98373_R20FE_DEVICE_AUTO_RESTART_CFG,
 	MAX98373_CLOCK_MON_SHIFT, 1, 0),
 SOC_SINGLE("Dither Switch", MAX98373_R203F_AMP_DSP_CFG,
@@ -392,6 +401,11 @@ static int max98373_probe(struct snd_soc_component *component)
 			MAX98373_R2021_PCM_TX_HIZ_EN_2,
 			1 << (max98373->i_slot - 8), 0);
 
+	/* enable auto restart function by default */
+	regmap_write(max98373->regmap,
+		MAX98373_R20FE_DEVICE_AUTO_RESTART_CFG,
+		0xF);
+
 	/* speaker feedback slot configuration */
 	regmap_write(max98373->regmap,
 		MAX98373_R2023_PCM_TX_SRC_2,
diff --git a/sound/soc/codecs/max98373.h b/sound/soc/codecs/max98373.h
index 71f5a5228f34..73a2cf69d84a 100644
--- a/sound/soc/codecs/max98373.h
+++ b/sound/soc/codecs/max98373.h
@@ -195,6 +195,9 @@
 #define MAX98373_LIMITER_EN_SHIFT (0)
 
 /* MAX98373_R20FE_DEVICE_AUTO_RESTART_CFG */
+#define MAX98373_OVC_AUTORESTART_SHIFT (3)
+#define MAX98373_THERM_AUTORESTART_SHIFT (2)
+#define MAX98373_CMON_AUTORESTART_SHIFT (1)
 #define MAX98373_CLOCK_MON_SHIFT (0)
 
 /* MAX98373_R20FF_GLOBAL_SHDN */
-- 
2.17.1

