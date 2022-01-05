Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5589F485BEB
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jan 2022 23:54:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E78901A24;
	Wed,  5 Jan 2022 23:53:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E78901A24
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641423280;
	bh=fgvR67pJL1Jnk7JvkJI7hOw/vstTi44avJCH99nZTIc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mDSHhpOtXre9wTRROAlCysVssYD+sGEJrm2GJjxy69npWcc3TikPHUQO40KYIDOtW
	 hAumTNU6nscgw2O7vvEsuZx32yKJSohp0dGsixWTJS4c+oTL6AatukRhNeUoIUTUA8
	 4Jt8Z+tS0+4oz3hkkctHd2nUG0JFJxKJ00mNAfgw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BD2CF80510;
	Wed,  5 Jan 2022 23:52:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1EB2F80507; Wed,  5 Jan 2022 23:52:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0c-0054df01.pphosted.com (mx0c-0054df01.pphosted.com
 [67.231.159.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9907EF801D8
 for <alsa-devel@alsa-project.org>; Wed,  5 Jan 2022 23:52:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9907EF801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=calian.com header.i=@calian.com
 header.b="n6/wzZXb"
Received: from pps.filterd (m0208999.ppops.net [127.0.0.1])
 by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 205CIoUh021088;
 Wed, 5 Jan 2022 17:52:22 -0500
Received: from can01-to1-obe.outbound.protection.outlook.com
 (mail-to1can01lp2059.outbound.protection.outlook.com [104.47.61.59])
 by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3dc72w9gcm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jan 2022 17:52:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X3jg5AM3zSbqn0tPSnJX8kzBSK+gEoUDK3OUKME2YPltZQbrUVE77fDaSmsf0eoHGZ+OmY96LeIbNPyqTbS2YLst2Aog5cduk+xu72wolVxdGuwX8EvK/kWz6aLThrZEHx+FYxOxT9vyUo67F9HO1CQEIC4eDEhsH3LLlx7HyCIPFusGUt1V1VDhYVPMib8r0k6ikWpxAflX04s6WFyHzD5WugtDvZUY9b2Um+52jYOgKniGaKFmCIE1bidK/GrF9pMR1us1jPX7MXVU5/uBKBor/SxE7meVYQlnverx9pgXqIsJQm/qIz49kVJJyJLOPbdoHe/gjUwol4ExQRmEjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K/m9bPXn54SMU72qCxPtvD5LlrqMp4lSdOwbUAAQ6lg=;
 b=hQgonGj3sRXPiYdVpbZ98bzzKWXyDScaA75R5UgWAlyW3uY+eUuK+NGGU5naOZqQLKoVmhQUwrMuiRp7A8uDKjCkYvaTwX25+bEKYp/iWVwz0cQCBOPCW2ja5YsdXQVmWtJA8HoobG4vBJiMn1KKVaf9SwVGfgMCJOv/KzBJkqKAo8XCWYRNoK0fIl4/GYlHzZdEokasJEmzJwvbXQ4DoVmkJD0p538JWS4LU74UoPPKfiXXNM5XtgUUmN1AZUpnrkrmrrdjpoF19knx1clkzVAJ9OMNeaytfaC2MWIsWOasy62Vw39piw3K9di+VA87ocV0ooAo3nuqtGBViRDdWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/m9bPXn54SMU72qCxPtvD5LlrqMp4lSdOwbUAAQ6lg=;
 b=n6/wzZXbEasMFOuzFnMzqYmc6x9u1xikCLg9dOMV3OX8Xxuu4JyCXZG1jM3TE1TvcBtqyujmSWauai/vzmTGyMsyEd1oEEvCyd8gsf3AYL5siRE2XKpPllEydADEk6+qTQDv+q+jdMRnY9jqYqfhwNrzPkjT1554q4hVptGB1jA=
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:6a::19)
 by YT2PR01MB5120.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:3b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Wed, 5 Jan
 2022 22:52:21 +0000
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::d1f6:d9e4:7cc7:af76]) by YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::d1f6:d9e4:7cc7:af76%5]) with mapi id 15.20.4844.016; Wed, 5 Jan 2022
 22:52:20 +0000
From: Robert Hancock <robert.hancock@calian.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/5] ASoC: xilinx: xlnx_i2s.c: Handle sysclk setting
Date: Wed,  5 Jan 2022 16:51:44 -0600
Message-Id: <20220105225146.3517039-4-robert.hancock@calian.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220105225146.3517039-1-robert.hancock@calian.com>
References: <20220105225146.3517039-1-robert.hancock@calian.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH0PR04CA0059.namprd04.prod.outlook.com
 (2603:10b6:610:77::34) To YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:6a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5366ff3c-e45f-4971-c2c5-08d9d09e080c
X-MS-TrafficTypeDiagnostic: YT2PR01MB5120:EE_
X-Microsoft-Antispam-PRVS: <YT2PR01MB5120A9D8EB226888596E5A66EC4B9@YT2PR01MB5120.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:595;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yzw21WhS2RL2EKl+t9OwbByE40sEROty1dqIX9frMoQ1OpznZDsCOXDpAHB1RrLXXECamCW+jwzATtMIAvhl0JV3+IIV+dQaybjhtWOcoPi5F4JrZzwEZInjCI4ljuGpvFEBLkeHNXIpjfenhyf7OC2ucXxk4O4AJY7m2x4ONx802zk+Bza11Z/BIanVu2t6pnkeHiHxBcVXY+XyG9GL7fGn0qDMFMohZngk+niyEx9CPN0lDfwLQD9PLfHSAg+2+wfAF+tXTN3RrR9RSiquyuSP0A0kWfsRBxwy7exjUjkcBqateAWZwD9G+XofF+IQjCYllzfVgbvKPt5sJDL/BIE+URUnCtNeeE1QcwFK3X86SuBrRbWTjtsyMn2uHBxi8ExlTlBq6Kc5OrM2W9mOvAWubb7gPGIDf47V0cPf7k2RXv4VPp/6vvQDBg6SscDLrblneILh2tHFzCCOyc7AxF6b4KUoFuPWvIThGvjuKzHzZfPAwmkXN+jkI9IMmR/4kVQj8cjhqwTgU5kQ8RJOuIViwqdslmDR/ex0ucFGTQ1esaVDiWZVSYP2ppbZ7Rg0jf4j1m2qbkino/Nfur+VkObAmBpHeMzLxhb16oo4vUSFr8GRG3FMV7lVMQ8bB1OYD0U32VswaCMkDagaGJKXjGTR2kxJ1uKeU0ir2WsVIXX19/zWMIWnyFh9qOHpFEG2pKxGfTU/xdDM0xdLlTKs3q9sYL4gL4nNRUpjmfuS8OQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(107886003)(4326008)(508600001)(6916009)(2616005)(5660300002)(52116002)(1076003)(36756003)(83380400001)(86362001)(66946007)(66556008)(66476007)(6486002)(6512007)(44832011)(38100700002)(38350700002)(6506007)(6666004)(186003)(26005)(316002)(8936002)(8676002)(2906002)(70780200001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BCy/J2xajRF0wg0sEOb1Mo/5/BEkhBf8fSO5Qqef6JfzY4B0Rpfv1YThCv1p?=
 =?us-ascii?Q?HtgCbEtKGZOHH4HVEEpyw5t7mFqk8bFjIa0upPYEC1unQfRPafOcAnan3P24?=
 =?us-ascii?Q?HHtcpNWCXLBl0E9JXAohYLtNzhPBZ2zgEXKIRUzDgAk8ql1t4zd8othcVG49?=
 =?us-ascii?Q?VF0V1c5JroTsUdExEACekKHqxA6V2SLoLfkBXnT5Z4jgOr6AQgQKpTAtDorU?=
 =?us-ascii?Q?PNIsLqB+GMn/Egqy7c4TQm/4t2CZVGhK29g7POcp7TnW7HgICnqtEulMPWP6?=
 =?us-ascii?Q?7TR+5UViNNRnD2z6v1nIp4zEXmmt7qEnTHhI4HzkxfYF4sJg2JC/2oMI43qj?=
 =?us-ascii?Q?ST/OQ69ZgSmgdbV5mRfWVHATMPKuJLK/e/CljLmwkhAbR8mvc2h9OKc+9uEP?=
 =?us-ascii?Q?N9RiZRff70Vh+FSDmB8EKsr8tql3QJvGcLD23heGNqVdma/zRMDWxZQFgECb?=
 =?us-ascii?Q?DFExx5vpFTI+nI1HcCxm2XcjBE1ZmnkBPZu2CNtnwV5KVcuO/fBN5RzCwoZ1?=
 =?us-ascii?Q?7aCAJbHRzEQP4EsXUaovvF995gcowSBsY+C8bkRMkLbmVInisSQKMdL+eD+s?=
 =?us-ascii?Q?Jx3dTq6t5vzlVwlVq2kP2Y6i0eWn69waJgtLPT3dRWFX2gkz9UcwxfXo+3pe?=
 =?us-ascii?Q?4LozgQvQBf8a+Z1xN7LsYHd7Zz2i/ayarAPfU1Aqvn+/ck4oMaZQu3cw+Lss?=
 =?us-ascii?Q?bnACSWstb7YT/ttkYcbj6yaa0HHCWChJqvJHUCuBMRDgf1TkjUXARENzDIAV?=
 =?us-ascii?Q?VbSArs7i1T+YAhkE6mf8h9ktFzK0F46gxubkBkeZk3In153ifBg22lSuhx0c?=
 =?us-ascii?Q?NImBD9msNcfDZ48r3CyE3SQxFonym1GUhcSjpecZdLfOmggLxVPSd98O89il?=
 =?us-ascii?Q?23FltTsayintfCxXo74TfzynIEr62pdTEO+o8e3k4zSlwkS56yPRc5+xYonu?=
 =?us-ascii?Q?PElTIEJyn72qID6y9QdCsg/Ui+UXtVsNMCO/SJnQH44u0ddPam56jNoAkTUz?=
 =?us-ascii?Q?Acx1qK7lU7FFdft3UaLrwBwL5ZwuvMkFTSrsXkLqknQtAxc+uy9BEsqPT3N6?=
 =?us-ascii?Q?j9wd2HgZE4FtAcp0TU4PDtk0Un1V/tfM0NLm0y1oGZjL1h8UBtqUZdVO8pSo?=
 =?us-ascii?Q?wQsU/onjPA8gxbqoJ2qbXysDJ99ZgJX11wU/YF0F71ojes+aDQQT8KHu1sw4?=
 =?us-ascii?Q?o+aAYZDkCuVcAWmCjvVBOHBhcZ1xffHHVATD2DC6v9HK8C2yyWtjCOYzdE2L?=
 =?us-ascii?Q?eoVnw6/30xP55vPdjkPdPbpOtgones7pXrm2+2i8Yrr1AUAnQhtxZjNcmu/W?=
 =?us-ascii?Q?nXifeaUsUv448Prt+6IH7shdt1Sl9Rh64zukriEcH9HOuf2E2FnxiY7N1Ptp?=
 =?us-ascii?Q?+W+TZAAnMFT9gE7cnquFycw2FTJNjnHrbmt9Q5TKOab3zd5cp+0ONjqoi3qS?=
 =?us-ascii?Q?nN4QzxjCRSWxNFg8Rx/Xyp2yukW/enLwPn1hXKbAtE8Bk2OBpEKu83rM1aBU?=
 =?us-ascii?Q?ztAvpmwQgVSCgsLwK0OeJ/nCUnVWq8YJPzTaAV6JJ5uCRSJFs6gfTb0pe77Y?=
 =?us-ascii?Q?0tj9T+A0iXNAd/wxpUcbCdZZgdhZQ9Ynfk2nqVFjaYRT4/KqUxZpNDIQaGXR?=
 =?us-ascii?Q?uG5tGiRO/WjbQ1XSQA/CiJj41E//avtBnXsRLP1mjS9D75op82jwKgpke7aU?=
 =?us-ascii?Q?wTyWUS3vc0yi/VEsFFGUNau5dWw=3D?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5366ff3c-e45f-4971-c2c5-08d9d09e080c
X-MS-Exchange-CrossTenant-AuthSource: YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2022 22:52:20.9505 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BT+gWQKATQkMSFAOB8fcYXWEiQ2apeoF8f5Pg3/MXxefM9cgV+9MUvzsxvYNKz6NlCCrP4cMYG01UpyRGgQR9JEzM5yEVTb+Q7JLYl+zkzg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT2PR01MB5120
X-Proofpoint-GUID: WtqR2Xy-rY8XJzkdfYte743eZyTby50L
X-Proofpoint-ORIG-GUID: WtqR2Xy-rY8XJzkdfYte743eZyTby50L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-05_08,2022-01-04_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 spamscore=0 mlxlogscore=605 phishscore=0 mlxscore=0 adultscore=0
 suspectscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2201050144
Cc: kuninori.morimoto.gx@renesas.com, michal.simek@xilinx.com,
 maruthi.srinivas.bayyavarapu@xilinx.com, tiwai@suse.com,
 Robert Hancock <robert.hancock@calian.com>, broonie@kernel.org
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

This driver previously only handled the set_clkdiv divider callback when
setting the SCLK Out Divider field in the I2S Timing Control register.
However, when using the simple-audio-card driver, the set_sysclk function
is called but not set_clkdiv. This caused the divider not to be set,
leaving it at an invalid value of 0 and resulting in a very low SCLK
output rate.

Handle set_clkdiv and store the sysclk (MCLK) value for later use in
hw_params to set the SCLK Out Divider such that:
MCLK/SCLK = divider * 2

Fixes: 112a8900d4b0 ("ASoC: xlnx: Add i2s driver")
Signed-off-by: Robert Hancock <robert.hancock@calian.com>
---
 sound/soc/xilinx/xlnx_i2s.c | 104 ++++++++++++++++++++++++------------
 1 file changed, 70 insertions(+), 34 deletions(-)

diff --git a/sound/soc/xilinx/xlnx_i2s.c b/sound/soc/xilinx/xlnx_i2s.c
index cc641e582c82..1abe28821916 100644
--- a/sound/soc/xilinx/xlnx_i2s.c
+++ b/sound/soc/xilinx/xlnx_i2s.c
@@ -18,20 +18,39 @@
 #define DRV_NAME "xlnx_i2s"
 
 #define I2S_CORE_CTRL_OFFSET		0x08
+#define I2S_CORE_CTRL_32BIT_LRCLK	BIT(3)
+#define I2S_CORE_CTRL_ENABLE		BIT(0)
 #define I2S_I2STIM_OFFSET		0x20
 #define I2S_CH0_OFFSET			0x30
 #define I2S_I2STIM_VALID_MASK		GENMASK(7, 0)
 
+struct xlnx_i2s_drv_data {
+	struct snd_soc_dai_driver dai_drv;
+	void __iomem *base;
+	unsigned int last_sysclk;
+	u32 data_width;
+	bool is_32bit_lrclk;
+};
+
 static int xlnx_i2s_set_sclkout_div(struct snd_soc_dai *cpu_dai,
 				    int div_id, int div)
 {
-	void __iomem *base = snd_soc_dai_get_drvdata(cpu_dai);
+	struct xlnx_i2s_drv_data *drv_data = snd_soc_dai_get_drvdata(cpu_dai);
 
 	if (!div || (div & ~I2S_I2STIM_VALID_MASK))
 		return -EINVAL;
 
-	writel(div, base + I2S_I2STIM_OFFSET);
+	writel(div, drv_data->base + I2S_I2STIM_OFFSET);
+
+	return 0;
+}
+
+static int xlnx_i2s_set_sysclk(struct snd_soc_dai *dai,
+			       int clk_id, unsigned int freq, int dir)
+{
+	struct xlnx_i2s_drv_data *drv_data = snd_soc_dai_get_drvdata(dai);
 
+	drv_data->last_sysclk = freq;
 	return 0;
 }
 
@@ -40,13 +59,28 @@ static int xlnx_i2s_hw_params(struct snd_pcm_substream *substream,
 			      struct snd_soc_dai *i2s_dai)
 {
 	u32 reg_off, chan_id;
-	void __iomem *base = snd_soc_dai_get_drvdata(i2s_dai);
+	struct xlnx_i2s_drv_data *drv_data = snd_soc_dai_get_drvdata(i2s_dai);
+
+	if (drv_data->last_sysclk) {
+		unsigned int bits_per_sample = drv_data->is_32bit_lrclk ?
+					       32 : drv_data->data_width;
+		unsigned int sclk = params_rate(params) * bits_per_sample *
+				    params_channels(params);
+		unsigned int sclk_div = DIV_ROUND_CLOSEST(drv_data->last_sysclk, sclk) / 2;
+
+		if (!sclk_div || (sclk_div & ~I2S_I2STIM_VALID_MASK)) {
+			dev_warn(i2s_dai->dev, "invalid SCLK divisor for sysclk %u and sclk %u\n",
+				 drv_data->last_sysclk, sclk);
+			return -EINVAL;
+		}
+		writel(sclk_div, drv_data->base + I2S_I2STIM_OFFSET);
+	}
 
 	chan_id = params_channels(params) / 2;
 
 	while (chan_id > 0) {
 		reg_off = I2S_CH0_OFFSET + ((chan_id - 1) * 4);
-		writel(chan_id, base + reg_off);
+		writel(chan_id, drv_data->base + reg_off);
 		chan_id--;
 	}
 
@@ -56,18 +90,18 @@ static int xlnx_i2s_hw_params(struct snd_pcm_substream *substream,
 static int xlnx_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 			    struct snd_soc_dai *i2s_dai)
 {
-	void __iomem *base = snd_soc_dai_get_drvdata(i2s_dai);
+	struct xlnx_i2s_drv_data *drv_data = snd_soc_dai_get_drvdata(i2s_dai);
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		writel(1, base + I2S_CORE_CTRL_OFFSET);
+		writel(I2S_CORE_CTRL_ENABLE, drv_data->base + I2S_CORE_CTRL_OFFSET);
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		writel(0, base + I2S_CORE_CTRL_OFFSET);
+		writel(0, drv_data->base + I2S_CORE_CTRL_OFFSET);
 		break;
 	default:
 		return -EINVAL;
@@ -78,6 +112,7 @@ static int xlnx_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 
 static const struct snd_soc_dai_ops xlnx_i2s_dai_ops = {
 	.trigger = xlnx_i2s_trigger,
+	.set_sysclk = xlnx_i2s_set_sysclk,
 	.set_clkdiv = xlnx_i2s_set_sclkout_div,
 	.hw_params = xlnx_i2s_hw_params
 };
@@ -95,20 +130,19 @@ MODULE_DEVICE_TABLE(of, xlnx_i2s_of_match);
 
 static int xlnx_i2s_probe(struct platform_device *pdev)
 {
-	void __iomem *base;
-	struct snd_soc_dai_driver *dai_drv;
+	struct xlnx_i2s_drv_data *drv_data;
 	int ret;
-	u32 ch, format, data_width;
+	u32 ch, format;
 	struct device *dev = &pdev->dev;
 	struct device_node *node = dev->of_node;
 
-	dai_drv = devm_kzalloc(&pdev->dev, sizeof(*dai_drv), GFP_KERNEL);
-	if (!dai_drv)
+	drv_data = devm_kzalloc(&pdev->dev, sizeof(*drv_data), GFP_KERNEL);
+	if (!drv_data)
 		return -ENOMEM;
 
-	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
+	drv_data->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(drv_data->base))
+		return PTR_ERR(drv_data->base);
 
 	ret = of_property_read_u32(node, "xlnx,num-channels", &ch);
 	if (ret < 0) {
@@ -117,12 +151,12 @@ static int xlnx_i2s_probe(struct platform_device *pdev)
 	}
 	ch = ch * 2;
 
-	ret = of_property_read_u32(node, "xlnx,dwidth", &data_width);
+	ret = of_property_read_u32(node, "xlnx,dwidth", &drv_data->data_width);
 	if (ret < 0) {
 		dev_err(dev, "cannot get data width\n");
 		return ret;
 	}
-	switch (data_width) {
+	switch (drv_data->data_width) {
 	case 16:
 		format = SNDRV_PCM_FMTBIT_S16_LE;
 		break;
@@ -134,35 +168,37 @@ static int xlnx_i2s_probe(struct platform_device *pdev)
 	}
 
 	if (of_device_is_compatible(node, "xlnx,i2s-transmitter-1.0")) {
-		dai_drv->name = "xlnx_i2s_playback";
-		dai_drv->playback.stream_name = "Playback";
-		dai_drv->playback.formats = format;
-		dai_drv->playback.channels_min = ch;
-		dai_drv->playback.channels_max = ch;
-		dai_drv->playback.rates	= SNDRV_PCM_RATE_8000_192000;
-		dai_drv->ops = &xlnx_i2s_dai_ops;
+		drv_data->dai_drv.name = "xlnx_i2s_playback";
+		drv_data->dai_drv.playback.stream_name = "Playback";
+		drv_data->dai_drv.playback.formats = format;
+		drv_data->dai_drv.playback.channels_min = ch;
+		drv_data->dai_drv.playback.channels_max = ch;
+		drv_data->dai_drv.playback.rates	= SNDRV_PCM_RATE_8000_192000;
+		drv_data->dai_drv.ops = &xlnx_i2s_dai_ops;
 	} else if (of_device_is_compatible(node, "xlnx,i2s-receiver-1.0")) {
-		dai_drv->name = "xlnx_i2s_capture";
-		dai_drv->capture.stream_name = "Capture";
-		dai_drv->capture.formats = format;
-		dai_drv->capture.channels_min = ch;
-		dai_drv->capture.channels_max = ch;
-		dai_drv->capture.rates = SNDRV_PCM_RATE_8000_192000;
-		dai_drv->ops = &xlnx_i2s_dai_ops;
+		drv_data->dai_drv.name = "xlnx_i2s_capture";
+		drv_data->dai_drv.capture.stream_name = "Capture";
+		drv_data->dai_drv.capture.formats = format;
+		drv_data->dai_drv.capture.channels_min = ch;
+		drv_data->dai_drv.capture.channels_max = ch;
+		drv_data->dai_drv.capture.rates = SNDRV_PCM_RATE_8000_192000;
+		drv_data->dai_drv.ops = &xlnx_i2s_dai_ops;
 	} else {
 		return -ENODEV;
 	}
+	drv_data->is_32bit_lrclk = readl(drv_data->base + I2S_CORE_CTRL_OFFSET) &
+				   I2S_CORE_CTRL_32BIT_LRCLK;
 
-	dev_set_drvdata(&pdev->dev, base);
+	dev_set_drvdata(&pdev->dev, drv_data);
 
 	ret = devm_snd_soc_register_component(&pdev->dev, &xlnx_i2s_component,
-					      dai_drv, 1);
+					      &drv_data->dai_drv, 1);
 	if (ret) {
 		dev_err(&pdev->dev, "i2s component registration failed\n");
 		return ret;
 	}
 
-	dev_info(&pdev->dev, "%s DAI registered\n", dai_drv->name);
+	dev_info(&pdev->dev, "%s DAI registered\n", drv_data->dai_drv.name);
 
 	return ret;
 }
-- 
2.31.1

