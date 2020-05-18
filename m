Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 884061D6FF1
	for <lists+alsa-devel@lfdr.de>; Mon, 18 May 2020 06:43:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3289316A9;
	Mon, 18 May 2020 06:42:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3289316A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589777008;
	bh=rh3aFlI9Fdag/aJr7IV/4Vm4TWdnTYG+lToOpOWqkl4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jOF6WDIkh5Bzkg6W3cFEo8DXD6GpYnx9lKrWBDPBDLBNhvkevX+8aDMV68i6P76LU
	 twpD/h5G5qsvZNpeV5MhBDNsWSCItQZ4p7fuIbBAfMzYBhgmlYhO7XD7NhTMCdTXkU
	 8o1LlmHmTlTYdeyaXxAC4fTrEDXZT8QXd0ORMsfQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED83AF8028E;
	Mon, 18 May 2020 06:40:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75DFEF801DA; Mon, 18 May 2020 06:40:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,MSGID_FROM_MTA_HEADER,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2050.outbound.protection.outlook.com [40.107.223.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6519EF8015C
 for <alsa-devel@alsa-project.org>; Mon, 18 May 2020 06:39:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6519EF8015C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="gPW7gR4V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YX9RVYim0/Elw+Ti+aZnUJ1VTmFIxQEAnG1dlCUk1pBxHsJCBDHkKhS3KjL1Zg0m1cpirG7uEXZvvLuuYRnH50yPXUgl15FVrlTLEMOPvi3Gb39EJ6pID/kXaXsDAov5UZ2Yl89vNHYHPOT46hAXTnJxvh6WCBJBq/LpPSXtrN14HiYvc4k46iJ2D3KOarTWGj/grFsXiUMTwvD5ZIjvA9VR7FTZuAtr3H0iRwK9fXqZvhVGwQBcKtaSoMMUzcYVWdnyIyY/qn1CnDLxtFOUYaKZ4Z64VDqHPJDVrvnVdnGZpbsI+lvqlbdt3sUcaDcr9Yeq6IMiorouabQwrhgo0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eg8GDeFfEbYSERAFDvY1JpG5UI5umKP9JtwNemG0RwQ=;
 b=Km37Lz6aEPzN6g5FQO1EQ9zr83LwFwuaHqxOTbkMNkEU3IKZQcGPDo8IMe1JeHJ5sIuqkcMNxJslYoX+Bh2I0dqpx/gWS5Z58XoL3yeuTPL80LVSSb29b51POxJepSd2l+S2/U8VNIA9MbQVPiq2v2gdM50iDGTkTEAvK64YocFh0Ho34w+wCI+6zTw/IDbDstkaqRnOsE/ZtdVf1UtoegRJXRZcuAPInhgyBOTlc6C867zKRvZEXgxP3ij2vBXldMI8utO2t7XQn4QdaEEmzaEzVnCAOcWScOt/9O1mvXBhQvPYrAySL32AAcEBtsbso8SnRGCa0Cy9gqianhEkzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eg8GDeFfEbYSERAFDvY1JpG5UI5umKP9JtwNemG0RwQ=;
 b=gPW7gR4VamNwIWoplZxnqbEn/5fom3qBdZwHNz5jN+oGDdQAenlbbGX6M1/GZu27TSryKQ8DpqBloQtBpNAdW6suKtjym3pVyBz8FkYfDcnS32APRD1cletJ9tnsZ0XSrKUBEzH9N2Hm2/YTd3I+hQI2+kw3Do0NTDERwVMMhpg=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR12MB1855.namprd12.prod.outlook.com (2603:10b6:300:10e::23)
 by MWHPR12MB1341.namprd12.prod.outlook.com (2603:10b6:300:11::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.24; Mon, 18 May
 2020 04:39:43 +0000
Received: from MWHPR12MB1855.namprd12.prod.outlook.com
 ([fe80::c455:6257:3c8a:7010]) by MWHPR12MB1855.namprd12.prod.outlook.com
 ([fe80::c455:6257:3c8a:7010%3]) with mapi id 15.20.3000.034; Mon, 18 May 2020
 04:39:43 +0000
From: Akshu Agrawal <akshu.agrawal@amd.com>
To: 
Subject: [PATCH] ASoC: amd: raven: Make the driver name consistent across files
Date: Mon, 18 May 2020 10:09:05 +0530
Message-Id: <20200518043913.40646-1-akshu.agrawal@amd.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: MAXPR01CA0096.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::14) To MWHPR12MB1855.namprd12.prod.outlook.com
 (2603:10b6:300:10e::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ETHANOL2.amd.com (165.204.156.251) by
 MAXPR01CA0096.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:5d::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.24 via Frontend Transport; Mon, 18 May 2020 04:39:40 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [165.204.156.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f2a9dc2a-1235-457f-eb0b-08d7fae57c12
X-MS-TrafficTypeDiagnostic: MWHPR12MB1341:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR12MB1341783DA3677436C5A02416F8B80@MWHPR12MB1341.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-Forefront-PRVS: 04073E895A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D3p3WkL2KP8+uQxhkb3vcM0Fpdzf1dNJbKeJ1bpkQBlnimUgesXMH+DAwhqlMojtCH8mcqsdoVoLhbyC0UDTsb49dDyLxVRql9TPEv/ipeHUxI+5hmDdCaRsya0apLJTUTWkaVdcsCCHNkMsMXuVmMjnBj5feVMY8UAy7L7DI52M9ojHpqCkxEJHnaYm5v4jRPAo5exJpzlztjuDzE6NVtosik0O7d3lrLl6EVb86l0KpOMsxnksP4XSlVGaxbM7vPfGgnp/2s7C//6wDaQp3Zea70941d9nDm+scYeNXsVLNnV26Fgz8PzMEkhB42LbM0GLWpj51H4FPuJjL2m8EQNOjxogsWGChGqMVicvxeSuV0Kn0LT+UHpFty3CkujaZbOtvMisj2p8pYXLNtG6kf2p5WrHEeC4Qvov6exSeCAChQFXAyBY0KIrGZmeY6fKOMGSvWle503zbkBCO5EP9HZxOMf8P59rJBhTqHgP48E1i06/Vj5LGoZcsccvwgfg1GLCO/ZBF6MeefEPQIZYgy3nvnwSbVg8CQvlPqfelWHH/HoWkt8u4dOQBpWxAi5x
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR12MB1855.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(376002)(396003)(39860400002)(366004)(346002)(52116002)(44832011)(7696005)(6486002)(54906003)(316002)(5660300002)(8676002)(4326008)(109986005)(6666004)(86362001)(478600001)(36756003)(966005)(8936002)(2906002)(1076003)(66946007)(66476007)(66556008)(956004)(2616005)(26005)(16526019)(186003)(266003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: avMxVCR7O0IAoENTeo7uvyKNWZhXYLZUk4t33/UyyyEB5DOKfY+1Qy52W8VtbOAfZy/VNiuTm87K4geNks+CB1fRrAzVIPSmxR5acq0L77IVV7TQvp/EQZs2u4osJX39hcVRYfiYZlUMYm+K8EY9s0hgvm9h15lyjpIuZRb9TmdeRO8Mt71tMUvMOS8vFTJ2AGGMhvygInwsTJHmQbjFKyABPJLma8HUN1qb23N4AmG9LUbaVT5snragqgmfixVzlhExXFlxJzv75qfrgdo8WInQEyCKRmHCOY9RPNkJWkKJEMO9S2+xfzCAHhWjxyu5zaO9oKqrnU6ap5fXe8UyFhY7WGmcg0ZEETaVZhSx6JgP++cx8hv4rmmwmLhcuSrLfvfuOw/9aPJIaIPA/uHj5oazb/+JyDvRTwH+TRpaqwBqh+Rbapr21Ax5UITOADtu0NLFxn9pzxUHii5HhCGYjcr1Yd22x78lUpky8HzApKArOwhiFvy9A9NxVLH2Hwd9
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2a9dc2a-1235-457f-eb0b-08d7fae57c12
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2020 04:39:43.4972 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 85Oz5VvsCFhiUOspm44npKSnk1KmOoRuS3QodXJuRW43nJlYk/fuGzRmk9rZYI9jfrwDh9aPsF4/nF7QIX2uvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1341
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Wei Yongjun <weiyongjun1@huawei.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Colin Ian King <colin.king@canonical.com>, akshu.agrawal@amd.com
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

This fixes the issue of driver not getting auto loaded with
MODULE_ALIAS.

With this patch:
$find /sys/devices -name modalias -print0 | xargs -0 grep -i acp3x
/sys/devices/pci0000:00/0000:00:08.1/0000:03:00.5/acp3x_i2s_playcap.2/
modalias:platform:acp3x_i2s_playcap
/sys/devices/pci0000:00/0000:00:08.1/0000:03:00.5/acp3x_i2s_playcap.0/
modalias:platform:acp3x_i2s_playcap
/sys/devices/pci0000:00/0000:00:08.1/0000:03:00.5/acp3x_rv_i2s_dma.0/
modalias:platform:acp3x_rv_i2s_dma
/sys/devices/pci0000:00/0000:00:08.1/0000:03:00.5/acp3x_i2s_playcap.1/
modalias:platform:acp3x_i2s_playcap

Signed-off-by: Akshu Agrawal <akshu.agrawal@amd.com>
---
Resending the patch https://patchwork.kernel.org/patch/11355713/

 sound/soc/amd/raven/acp3x-i2s.c     | 6 +++---
 sound/soc/amd/raven/acp3x-pcm-dma.c | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/amd/raven/acp3x-i2s.c b/sound/soc/amd/raven/acp3x-i2s.c
index f160d35a6832..a532e01a2622 100644
--- a/sound/soc/amd/raven/acp3x-i2s.c
+++ b/sound/soc/amd/raven/acp3x-i2s.c
@@ -15,7 +15,7 @@
 
 #include "acp3x.h"
 
-#define DRV_NAME "acp3x-i2s"
+#define DRV_NAME "acp3x_i2s_playcap"
 
 static int acp3x_i2s_set_fmt(struct snd_soc_dai *cpu_dai,
 					unsigned int fmt)
@@ -269,7 +269,7 @@ static struct snd_soc_dai_ops acp3x_i2s_dai_ops = {
 };
 
 static const struct snd_soc_component_driver acp3x_dai_component = {
-	.name           = "acp3x-i2s",
+	.name           = DRV_NAME,
 };
 
 static struct snd_soc_dai_driver acp3x_i2s_dai = {
@@ -348,4 +348,4 @@ module_platform_driver(acp3x_dai_driver);
 MODULE_AUTHOR("Vishnuvardhanrao.Ravulapati@amd.com");
 MODULE_DESCRIPTION("AMD ACP 3.x PCM Driver");
 MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("platform:" DRV_NAME);
+MODULE_ALIAS("platform:"DRV_NAME);
diff --git a/sound/soc/amd/raven/acp3x-pcm-dma.c b/sound/soc/amd/raven/acp3x-pcm-dma.c
index a36c5cb848cd..620b568bc414 100644
--- a/sound/soc/amd/raven/acp3x-pcm-dma.c
+++ b/sound/soc/amd/raven/acp3x-pcm-dma.c
@@ -15,7 +15,7 @@
 
 #include "acp3x.h"
 
-#define DRV_NAME "acp3x-i2s-audio"
+#define DRV_NAME "acp3x_rv_i2s_dma"
 
 static const struct snd_pcm_hardware acp3x_pcm_hardware_playback = {
 	.info = SNDRV_PCM_INFO_INTERLEAVED |
@@ -542,4 +542,4 @@ MODULE_AUTHOR("Maruthi.Bayyavarapu@amd.com");
 MODULE_AUTHOR("Vijendar.Mukunda@amd.com");
 MODULE_DESCRIPTION("AMD ACP 3.x PCM Driver");
 MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("platform:" DRV_NAME);
+MODULE_ALIAS("platform:"DRV_NAME);
-- 
2.17.1

