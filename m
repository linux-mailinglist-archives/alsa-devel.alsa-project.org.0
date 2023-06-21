Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E85737908
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jun 2023 04:21:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 628536C1;
	Wed, 21 Jun 2023 04:20:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 628536C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687314076;
	bh=aE17kMc+DojcwzR0AlZZ2PBxjYL82awsNrK3pLBEfXs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tUQwYI+J1bmojqYSe3LYtJFF/P/p9+JRA2miQW6cF612zgNmeCyIbdA3h9utHyyvo
	 MUkPohnria9eVvOGdln1cPd2zOnF/tmVKY9A9wU+XcrvjWptPU2JSXCYX77cAcX/zx
	 aiFBSr7xPmg/FHu5Wt/LTC9wlQSiaHac/MI58W9w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CEE50F801F5; Wed, 21 Jun 2023 04:19:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 57EE8F805B1;
	Wed, 21 Jun 2023 04:19:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 415C7F805AE; Wed, 21 Jun 2023 04:19:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20723.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::723])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A4923F805A1
	for <alsa-devel@alsa-project.org>; Wed, 21 Jun 2023 04:19:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4923F805A1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Mv1XM+7G
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FOllI4824GTxC2801ozHvWE22z4zvqhTNNi2J7KALmvyHqU5JVSU5Ts0EpGXOy6GQseHkacePdauQOsSj0F40f5jCb8NEHAwIezMIcZpEKNr/t5gEQuqKEadLt/qpbJzsR1QF+ef/0iajdWv5+p/AvMfcKqo8yBE9xtmDAlP00KCkj8IDey5t7wDHdAlKYYeF++ypzHEA7BAkC/zIAR68ylorjmfbGxxFGrIvAvSTmiQ7weTuYOmWRvHo5Ju6Z+FNpFV05Xo94qDijFFru7kOeomtp6Bo6uxUWyNzugExpYYVWCrS3/POttZrYpQYajaNoM818uvOPUnvCL03PCwhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hWpSxcIzRSlu3lVpeLJS88lL5s9HdEN6xEamDbffcZg=;
 b=KNhuutj+pzd2nKBftoM7uvr7/7k8e3UnEA8crYMki+S7D6mK/ldypX6EeOvvXJYwuJV5T3MSgBF+hHcV4pm/cD1DnEjT4pig4FyW2Hv1rP4S0f49bFijVHBi8RH11x4jtqh7AwTBYN/jKZjBN6d1CHOTSqnB/fjyV7g7AErpD3MPr245kGxIKgPID6l4Q760PJarMUYfSiPceFEz+j+lb76dHQFopZIGL4bfC52iB0Uon5xQ5XV/kbfydersGrx4u8nmoUVnkRQZMIZZ6lHa56hT1r4GT8OrIrAvext6cTm5sBAnJSypmh77ElgDht0LTsvYHJ5VnGUCvGGFpVO0Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hWpSxcIzRSlu3lVpeLJS88lL5s9HdEN6xEamDbffcZg=;
 b=Mv1XM+7Gy39GKTwCLiX889uuJYMGKlFwzTv9nJU21k8w5dCOmDUeIAR6nkQRJN7J9jBjM/GDjwFwxfWqXTI3CrkPWroZjWUCJ5pXMx0KSyMU0G4Fvm9paLaUytlKE3sQ49y7zp/+9SStzWYRnfDLC0TU9ZkoTdQKeDoepEdzj6k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB8528.jpnprd01.prod.outlook.com (2603:1096:400:13f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Wed, 21 Jun
 2023 02:18:59 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26%6]) with mapi id 15.20.6521.023; Wed, 21 Jun 2023
 02:18:59 +0000
Message-ID: <87h6r1blrh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 07/14] ASoC: soc-core.c: add snd_soc_copy_dai_args()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87r0q5blta.wl-kuninori.morimoto.gx@renesas.com>
References: <87r0q5blta.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 21 Jun 2023 02:18:58 +0000
X-ClientProxiedBy: TYCP286CA0077.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::9) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB8528:EE_
X-MS-Office365-Filtering-Correlation-Id: f74aef4e-4f80-4e58-0730-08db71fddf0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2MJ6l0+XL6cmvGDFKPt70d/CTNvZT4dZgvWY33NObnW6NAgCpnGXSNuf2E8/ZrOXSYiqVjZmaji0XEW7Uf8N7sqaCto7w6TGw4N4GA2KUvnLnFl50YOLN7KJVDvVD81vINYVh5We9WDQOrp070VdJ6eCJScPPFu4DNEPtZx81v0DV2IAVOZK8J9fER+LMdfc/AUJLn+6wrkw/to1/Jln5OB8SbA2Wzsf9VrrSeSs/gWaJONWfkTD3OnffRx+X33jlbzS9ntVKtVFAhQPYmwcz3CKcfwNxmjvkgjJOH/WRaEYw0x3sn5cRz+ogGxfAr8SIF+EDJKndQvAo3Zz/PzXN90RkhuTMPcTc2uXMA3r+lbXeavxkNUiiVaIorXxH76XwVVguauBDGb+oWnVUO30MgnjDo50EA2yc3UDd9xz2cU05VXHoStDy7t8FlZbwMj1I1YEJbuUpNkPSGp1iPp0jCBKVCZ544S5IbGoBD+b5SsoLf6HLZon8lkat2OcWbTKpMQvTzQLXQBL/WDiiNf3mwztdKuapXhea3myBtAPWOOt7IK1gdrL3MvNfhL49S3QoTSCb1vuLX9KXbaRUgU1AwwY0554VZ2Z0AbciGGDh0EiYFApn0l3MvbC45XfqcYS
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(39860400002)(366004)(346002)(376002)(451199021)(86362001)(66556008)(66476007)(6916009)(6486002)(66946007)(4326008)(186003)(5660300002)(2906002)(6512007)(36756003)(26005)(2616005)(316002)(38350700002)(38100700002)(41300700001)(6506007)(52116002)(8676002)(478600001)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sGPM9TJNzoNFs5B5dg1utrVmsJNw+Ovx3XYmiEeUM0829daygubymYgIein5?=
 =?us-ascii?Q?aVoRluP4WxVtkTYvGnlGRMvJeMsR25T30pQjNl9JJjoCiphzDq42HrNzTq+u?=
 =?us-ascii?Q?2FF7+K/uIq1L1qrOl2MjZfDbtiJprR0vBds4r6hyvMf2uiYAYeQQHUXVKCCn?=
 =?us-ascii?Q?vABP5c/nh4jPU/H2o/5m3oe/UV53iDAQ2u06Yp/NFNrP8bl9bu4VQL3Ja9ld?=
 =?us-ascii?Q?QYyxrXLGOevgw9aW68T/Lqk1jaaUfLClOzxMyEfxHvq5zMVhoAjkfCYUZyUf?=
 =?us-ascii?Q?kSh8LQdgCoQHwSPnrrBTz2IbUdiUmNd5duj0SMJY0vukvjS3QDPbcgAc1UUu?=
 =?us-ascii?Q?Rsh5fOUR+sOHPhPUqRFDf6uwFoG1KPgz3cfrJxv9JtxqJdfH9Nseh1QjuFR5?=
 =?us-ascii?Q?gV/vOoHygwEAIy5ka+2pop4t0ECdr5/JKG0eLFU4CF5Hbr4KG0pE35TLl6sW?=
 =?us-ascii?Q?FGKTUmS9va3S1NlIJEiza0w/OgN1uTWqpCaFtZ3OjwVOCojiwj7T0hOl0qY0?=
 =?us-ascii?Q?6e48B9moaJ4ykiys2k+u9lil4QgiIhv3QIe8baMe2i4DHUl57nfWUPiP+Zf/?=
 =?us-ascii?Q?LxJuATdnBxnv8ltuSWd1ypAng14Av+pChyTdKMBPLiu7qXB9ZJ8dUPPyE+Uk?=
 =?us-ascii?Q?RNc5IdUYCpuTB1ugbN+5hJvEyj9u9bo8JRrV25cat19hqPnX8ClwHL5tl/38?=
 =?us-ascii?Q?1AF+qo+oPuLCtLuIgAsHTRIo1iAfWFt/FCrVpWabHyQI9SQIQi6LskpmJHdd?=
 =?us-ascii?Q?pixs3OsWRxXrRZLhBVqQzHoNslfHPJwKyOK76JU9YkfpwWguiHarVDZ3J/fp?=
 =?us-ascii?Q?OUoGTeJI1nHKFcJO0vDgmhsUJb43ylsp7RO7vKchHNXoiZWl6A2yQDhXvUEi?=
 =?us-ascii?Q?2rUajaTU8uGgEuh2bA5Qgz6gDvN1+zJQTZkdcMCLCZiWDzkIsEi6f8wbDx25?=
 =?us-ascii?Q?+buiJ9b1fyWYbOb/gx29rfVu5I42zNEbZaW1VItPumoHO7/P871SvyMl3Yzo?=
 =?us-ascii?Q?u7ecPO5qrqDeEglpM/Vqxnfv76LuH4toPGGoI9JTt7qKBJ9IUCbHvyMQjr1+?=
 =?us-ascii?Q?h486TaNKOSHozLKBjs4d8llTDBtwHHdIofPVEHrZNc56vSY6PIlJAHupVsBw?=
 =?us-ascii?Q?exy4w0+7cryU1Y3lr9x81kkV558EOs0tC33rD4IPfaHHB9MhWDDrXw2thHuv?=
 =?us-ascii?Q?iJY80xpZJOw9wh44j2RTOfVe3iBhfFTijNjQxvA3zStrpyHqEEfcF46nb2aR?=
 =?us-ascii?Q?LffQiHPq0jQWoJ6M/0cBR6cWx4JzOSYc8q7eUsYMIesjaebwIKMsx7823NpJ?=
 =?us-ascii?Q?5o26/Z8wffbj2HL3W+JgZP4LAvnS6ZksfFMo8JGtWMvS+s8riDjHBfuFY/cU?=
 =?us-ascii?Q?ju+kaGhTzuCdZPuzEvjOSp8TAXoRujTSzPIjC390zG29nLlsytrdN2+IE8KB?=
 =?us-ascii?Q?XHNcJS1Bzo9irwecVh59hmd9vM+ODbG0LlTr4tpM9KDgz/aWlb0CvCq1Aef+?=
 =?us-ascii?Q?iWqYqa95wWKtKQMrCwU0tBcwyylYVOhYTocCqolvo9G2yUT2CR0pEOphPSmX?=
 =?us-ascii?Q?Is98N6OSuV/2Iw7puIt/hytaoj5eMe5GWcn5fqXfQD4oP1vyYKGQuL4Debbp?=
 =?us-ascii?Q?0VnFax3nA3OZl4uDAOVHvwM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f74aef4e-4f80-4e58-0730-08db71fddf0f
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 02:18:59.1961
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Xe7+tjKn70zIUv5ifI4XIXx9yAo9FaqtyamI8gZESsRRtNATNUB+amd9bouW5HrgrjA811zwL6pAHWinxleHOrsA2A30kwWFZox8UDRQ603CnOJxaTuMvGdV8cwyqN1c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8528
Message-ID-Hash: SIS5MFL4WJQ5T36TYOUOBEEQ3P6P7LOV
X-Message-ID-Hash: SIS5MFL4WJQ5T36TYOUOBEEQ3P6P7LOV
X-MailFrom: kuninori.morimoto.gx@renesas.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SIS5MFL4WJQ5T36TYOUOBEEQ3P6P7LOV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

To use multi Component support, we need to check dai_args whether
Card could get DAI from args (CPU/Codec needs set dai_args on DAI driver).
If it could, we need to allocate dai_args for dlc.
This patch adds snd_soc_copy_dai_args() for it.

This is helper function for multi Component support.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h  |  2 ++
 sound/soc/soc-core.c | 13 +++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 94fca10f01ad..fa2337a3cf4c 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1338,6 +1338,8 @@ void snd_soc_remove_pcm_runtime(struct snd_soc_card *card,
 
 void snd_soc_dlc_use_cpu_as_platform(struct snd_soc_dai_link_component *platforms,
 				     struct snd_soc_dai_link_component *cpus);
+struct of_phandle_args *snd_soc_copy_dai_args(struct device *dev,
+					      struct of_phandle_args *args);
 struct snd_soc_dai *snd_soc_get_dai_via_args(struct of_phandle_args *dai_args);
 struct snd_soc_dai *snd_soc_register_dai(struct snd_soc_component *component,
 					 struct snd_soc_dai_driver *dai_drv,
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 6e61f500cc2a..d7713f550fe4 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -809,6 +809,19 @@ static struct device_node
 	return of_node;
 }
 
+struct of_phandle_args *snd_soc_copy_dai_args(struct device *dev, struct of_phandle_args *args)
+{
+	struct of_phandle_args *ret = devm_kzalloc(dev, sizeof(*ret), GFP_KERNEL);
+
+	if (!ret)
+		return NULL;
+
+	*ret = *args;
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(snd_soc_copy_dai_args);
+
 static int snd_soc_is_matching_component(
 	const struct snd_soc_dai_link_component *dlc,
 	struct snd_soc_component *component)
-- 
2.25.1

