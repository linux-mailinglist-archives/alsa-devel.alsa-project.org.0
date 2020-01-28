Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9272614B2A2
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jan 2020 11:33:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3A681670;
	Tue, 28 Jan 2020 11:32:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3A681670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580207589;
	bh=tM7NxxlLMq6edujYpx9oVkHmfBfyRD8ZTKjpRxQWUIQ=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=a5t/fXtsDXUhFH8ROdG0eTDzjw6h3DV/FWUVZVkkSZQLkijpY/wkhaDrKlRrrH82U
	 eAAKv5ndHnGMz2kP2Sk3czQjKU8aT1QizbQ3sVhtbO58VUZfg14YQVVQDay4nzRPUo
	 l3X0saKomGAEvLY9KqPZvzW9CBFbVFuDvLgy+WC8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2EB8F80123;
	Tue, 28 Jan 2020 11:31:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95BD2F80150; Tue, 28 Jan 2020 11:31:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,MSGID_FROM_MTA_HEADER,SPF_HELO_PASS,SPF_NONE,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690040.outbound.protection.outlook.com [40.107.69.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BCD45F80123
 for <alsa-devel@alsa-project.org>; Tue, 28 Jan 2020 11:31:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BCD45F80123
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="aBSnkLmb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QYjnNRaACK1L3M1fmNqDiIEogVv402YS9ZlzSOduFoBN/Db32vyRndQNbE3XhIGZZepPV7aJmiiaVxWu0GYbHWLP0XeKIazR6bfpcbbaC/0BPQB07yDteyQXfwts/NItX3FQ6KOG2Psh24Yk+TCtL5kVhymjrfhjEy0VCzpO6WE7+Ir+cMP2MepCwAjrlSvMsqag5BO648SJtsepXMACDVmC467Jg7Cc3UnQnMWUYVkucVcNp8Xovva9O5vSnI7ed02Rm2SFoSFUkV/Toi0RNcl9j8ORZef5bLNyyftsAiiIthB2uwM3Yww3SS0t12Z5ctRaykWXyACEa/jCo+9rVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wes4GstEkN4BG89qDquJ3sSTKuepb7JkrL7xd9wU9QY=;
 b=jeeze0TCpwYdLJrzg1JR7ezifwQY0AvkHsFTimu5CT/h/I0JfHDYjbCCq0EyCQ2W0ZJYZtCvRxVnSKkEklv4zCIygDmah1G9bZa2lK4npvnMbecOE1N+wS2XspxxCjeDOAcgbR5iFwYo7JGKbnA6nQo3eomI6Fm/cz5NakBGH+cUmfFo6ppuveaaiO5nHWRrU8YZ8Mi6K5an76kOlohDFvFifWmn7eMbQmExBIL0CTKvK0nc2vAFb9su1i425TibtXT994URyAXhL0lb6Wou5wGQBJxXLCHdmvAAyxK+bedIEMBmpCtY1xmgT2Gsr6nZLiPpESFNTC0E4Z8T2h5HZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wes4GstEkN4BG89qDquJ3sSTKuepb7JkrL7xd9wU9QY=;
 b=aBSnkLmbB7Vban1JaIBd4REHYcBZ5RiYUwyJ3Pu09I1Szlut+O8p41q86mDfLx8yC039pR27jCS0kR/FAYXZ+ktWbYlKpsQM/t/azJelR7db6nzri1LZRhmtbd9nVIL+ACGeyR03vZcW7LzPc39toTxJmiar8pJhETICVYnS8NA=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Akshu.Agrawal@amd.com; 
Received: from MN2PR12MB2878.namprd12.prod.outlook.com (20.179.80.143) by
 MN2PR12MB3280.namprd12.prod.outlook.com (20.179.81.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.24; Tue, 28 Jan 2020 10:31:16 +0000
Received: from MN2PR12MB2878.namprd12.prod.outlook.com
 ([fe80::11fb:70af:b3dd:203d]) by MN2PR12MB2878.namprd12.prod.outlook.com
 ([fe80::11fb:70af:b3dd:203d%6]) with mapi id 15.20.2665.026; Tue, 28 Jan 2020
 10:31:16 +0000
From: Akshu Agrawal <akshu.agrawal@amd.com>
To: 
Date: Tue, 28 Jan 2020 16:00:22 +0530
Message-Id: <20200128103029.128841-1-akshu.agrawal@amd.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: MA1PR01CA0156.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::26) To MN2PR12MB2878.namprd12.prod.outlook.com
 (2603:10b6:208:aa::15)
MIME-Version: 1.0
Received: from ETHANOL2.amd.com (165.204.156.251) by
 MA1PR01CA0156.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:71::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.20 via Frontend Transport; Tue, 28 Jan 2020 10:31:13 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [165.204.156.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6d4eb267-18eb-4240-07c8-08d7a3dd34ca
X-MS-TrafficTypeDiagnostic: MN2PR12MB3280:|MN2PR12MB3280:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB32807AD0D5F05BBF95E6C23CF80A0@MN2PR12MB3280.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:204;
X-Forefront-PRVS: 029651C7A1
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(136003)(396003)(346002)(376002)(189003)(199004)(2616005)(956004)(86362001)(52116002)(8936002)(81156014)(81166006)(8676002)(109986005)(36756003)(66476007)(66556008)(2906002)(5660300002)(16526019)(44832011)(66946007)(478600001)(1076003)(6486002)(7696005)(54906003)(26005)(316002)(6666004)(186003)(4326008)(266003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3280;
 H:MN2PR12MB2878.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oZLOglkzMHBgfH9bAjaBVMy2z+6gWf91cpZyV0IIIJg+9T7Vidz2EDEyNfXYLR9zy5si9+lB5j8eGn/Bh5+2qsR2WxDwSB7BNk5aKZsqeDAg3mT59QogdGCN6DFBY4XcAeLqpKJorwb4bBIL+J2rYLNp/SgPU5DgBxmGkFSwjkvpTqe18oGqa5q8P1GUH2GSvxi7lXlF7lnt88LwVnHE0NxZdBOchvCdtVuYZ/TcEzfL11+xu19wz+RDRaJ5abXWP2gkunEemK5l1kUojFTutmLcceyy+Hx4kDDbU6LWMszof7cKsX8x9SAnEHDes4ebZZC04L/ojwl1GPJ3KsoYDIE8YmWPF9/WSJhBIxjFkTitmIxyLaKLCgXl5dO6Ggm0a/FYswlxF5X748nEPKXlqrl5IZqq+4FsIjUfuiiwIEwnkwjjgdV0q81J/pUiPrSRaBlupY7TgpqRHsihVs78kyzPlpdeSs0OAaOvtaO0q+w=
X-MS-Exchange-AntiSpam-MessageData: AtZ6/GP7fmc/zo7HPp9aAzchgMolh+mM9fn2+YS5hETLiyJHyLPe56jENdO9+C7N0U8x5uBgASVEVUJMzc1dRP8L4bH6+jHGsS5Xu280Fi0ESkQdJ4vJJW5tU9WKcnpHCSqbdSS+LV3nZFMc4c/vXA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d4eb267-18eb-4240-07c8-08d7a3dd34ca
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2020 10:31:16.6419 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qB9vfZKK3KJv7Bl3Qdmsf56xAb8zizhJkbxIo5AyHrIAD04zaYo5wRy8icWHrNOkFOoN4rsINdLAKQkof21FnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3280
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>, Wei Yongjun <weiyongjun1@huawei.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 akshu.agrawal@amd.com
Subject: [alsa-devel] [PATCH] ASoC: amd: Fix simultaneous playback and
	capture
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

Stopping of one stream is killing the other stream when they
are running simultaneously. This is because, IER register is
cleared which disables I2S and overrides any other block enables.

Clearing IER register only when all streams on a channel are disabled,
fixes the issue.

Signed-off-by: Akshu Agrawal <akshu.agrawal@amd.com>
---
 sound/soc/amd/raven/acp3x-i2s.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/sound/soc/amd/raven/acp3x-i2s.c b/sound/soc/amd/raven/acp3x-i2s.c
index 8619ed5f08ef..c40422fe0001 100644
--- a/sound/soc/amd/raven/acp3x-i2s.c
+++ b/sound/soc/amd/raven/acp3x-i2s.c
@@ -234,30 +234,32 @@ static int acp3x_i2s_trigger(struct snd_pcm_substream *substream,
 			switch (rtd->i2s_instance) {
 			case I2S_BT_INSTANCE:
 				reg_val = mmACP_BTTDM_ITER;
-				ier_val = mmACP_BTTDM_IER;
 				break;
 			case I2S_SP_INSTANCE:
 			default:
 				reg_val = mmACP_I2STDM_ITER;
-				ier_val = mmACP_I2STDM_IER;
 			}
 
 		} else {
 			switch (rtd->i2s_instance) {
 			case I2S_BT_INSTANCE:
 				reg_val = mmACP_BTTDM_IRER;
-				ier_val = mmACP_BTTDM_IER;
 				break;
 			case I2S_SP_INSTANCE:
 			default:
 				reg_val = mmACP_I2STDM_IRER;
-				ier_val = mmACP_I2STDM_IER;
 			}
 		}
 		val = rv_readl(rtd->acp3x_base + reg_val);
 		val = val & ~BIT(0);
 		rv_writel(val, rtd->acp3x_base + reg_val);
-		rv_writel(0, rtd->acp3x_base + ier_val);
+
+		if (!(rv_readl(rtd->acp3x_base + mmACP_BTTDM_ITER) & BIT(0)) &&
+		     !(rv_readl(rtd->acp3x_base + mmACP_BTTDM_IRER) & BIT(0)))
+			rv_writel(0, rtd->acp3x_base + mmACP_BTTDM_IER);
+		if (!(rv_readl(rtd->acp3x_base + mmACP_I2STDM_ITER) & BIT(0)) &&
+		     !(rv_readl(rtd->acp3x_base + mmACP_I2STDM_IRER) & BIT(0)))
+			rv_writel(0, rtd->acp3x_base + mmACP_I2STDM_IER);
 		ret = 0;
 		break;
 	default:
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
