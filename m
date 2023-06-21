Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B012973790B
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jun 2023 04:22:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1357D823;
	Wed, 21 Jun 2023 04:21:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1357D823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687314127;
	bh=hoKZ/llP316Y21IB5X5r9D8C+bbSPriwhHi3HzChWrs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uAgpJqkumfvt4oxwutsvsAI2mKurImfK0ocH5EzTIU0oYp17W4HrJpntlaNXd4Vtg
	 D787xcag8IUTAdGgAEDOsiy8Sit6VgsOR64DBsKlwuduhN0VBr1tSk+9ajagZiPqw2
	 ozlOOrv9TC5lG9ud4Jo1HsqTgaXQdNj/0CCwGlOM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02838F80552; Wed, 21 Jun 2023 04:19:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D9D6F805C9;
	Wed, 21 Jun 2023 04:19:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2DC8FF805C5; Wed, 21 Jun 2023 04:19:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20712.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::712])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D9F54F8057A
	for <alsa-devel@alsa-project.org>; Wed, 21 Jun 2023 04:18:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9F54F8057A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=fWIV18Yi
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QqgAOhHNBZpklIGLD3K4ubNN73NcH09z87M9FgV68qx5YG1gaMtOZIMeFYr/Z0y9Km2/tMddp2IVAeGdEZznjffT89N+9HoeVvwZ1Ge+FSd1vbJQg1CugaIiAD6A7afl3BV48/8kriht4w87NxjC/oYNSM0q6TFAu16gSBeK+5BtBJIQifftvwj2gJa/YfQctRD5a7Q/0L62bAzsqYEf+utu/grU61TG4OLnVANfidGd/fUBtYt69xAg75wrluf0qYYnEv/JeYXMJ7PvNsvG8jIEL6gfL7XWut8LVlg94y6RHPBMiYIW0A2fjdb/e/hf5ZbiXPVhYDLNBTef4GdSmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IXuPSbgD4AV5CBKMf3RtZkl/GtuISZ6d1SIYnzulRy8=;
 b=M4Eu11OWvAhUrNVeVABKnpCgzn6Xgu0zZX1/GaPkUGOHr9BM0DX1Y72RzmQBvhQUJl/1t4YCT8MOIujudtEBppuI4ZtaM7PIvBWZOwXAySRleqA2wQkc5XdwM5B7MLxWGv92N3N0y9KqCkfuSFJKMXOfVqI3aWLnQJRqYbkTwEi0B/kKTqOQkMj62Z0QhgVQT8Dgj0w7Hi8aNQhqCsRGFv9qPM5DVacQNDXZx257k+53gyMub2zuoOw5egB6vdgqn/ZPUdB3KFiZ6a3MeMKKlFhl57OHoOl9bPzDaNfKJr8f+DZ7TomrL3NRAUTOev5PK9KK4avLIlYSGxXW2Y4WKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IXuPSbgD4AV5CBKMf3RtZkl/GtuISZ6d1SIYnzulRy8=;
 b=fWIV18YiP7dxS/aCLK6MPyetqRfflWScpk+RSHna37IEohfDm1HO/YooCh05xHpIoKzCw6MWzL6wW0luyH23QaImbwapkTHSCGFBnnVUFSoQd3soV/pGRwGFZZYiJEz+4/8lse5w2KlDrvgg1Z5uhFkksvgp1FNNigC/NP1xmsc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB8528.jpnprd01.prod.outlook.com (2603:1096:400:13f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Wed, 21 Jun
 2023 02:18:44 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26%6]) with mapi id 15.20.6521.023; Wed, 21 Jun 2023
 02:18:44 +0000
Message-ID: <87jzvxblrw.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 05/14] ASoC: soc-core.c: add snd_soc_get_dai_via_args()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87r0q5blta.wl-kuninori.morimoto.gx@renesas.com>
References: <87r0q5blta.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 21 Jun 2023 02:18:43 +0000
X-ClientProxiedBy: TYCP286CA0206.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::14) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB8528:EE_
X-MS-Office365-Filtering-Correlation-Id: 2aeb5f02-c082-4e2d-c343-08db71fdd644
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pWZbBQRJDgrPB/DNPsscoZS+Wdg+Xn1RWHo/NlOjjkOzVZoYbLVuKU0kqF7unAgH19z+N4KglZlQyiTJM7eIle6lIocnaDooTC9i80POt8T+ZkfzyCd/2xVZIUTe5QE7SE3hHbMehpU5BjqM/WJ9vW+ILgx0I9c4McAUVw4BK7Y6Q4T5cWrBiht1ojj53j2qgPEO8fLbAlUXVocKQLXQmu15qsqqKy2m/4qNXyczwbGNn+1laYb11XdGk1x5SUHwMByClnY4szygZjPh08dHVYTgYiqh30FmOVlcT/qGxMbOMk6t2LlweTsZu+jIUX2QUUxQQ+rQ1Jxms++CwvAhbjA9EVzT0ML0WmSBwW9WpmkEhJ0OWqdGxJ1jSGBqQuIU2X8iQ7CXGxcYrgfBtldW1GXh58G9FXTsZgSpwsnaDmTK+C8ABABhgU62/fQLvhzDPlYyH31GuC/6BEMql5E+c2XZYZ3bSwLIbCYhM/WzwWFolITQvtVqGi1vghafZ4en1tYWNveMQ0buipRSfgAit6JXbrknhQ+LHIdajHtbhtGpkm8PLM3sde/QpUS0Nsk6d2fDszmV1mhYwpDmgOMNK2y+oNV7Eukr+QhPZDXjvHX5kq6W+QVczVH/XyrXOpKL
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(39860400002)(366004)(346002)(376002)(451199021)(86362001)(66556008)(66476007)(6916009)(6486002)(66946007)(4326008)(186003)(5660300002)(2906002)(6512007)(36756003)(83380400001)(26005)(2616005)(316002)(38350700002)(38100700002)(41300700001)(6506007)(52116002)(8676002)(478600001)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ONbUdHWfzd9WT7mmBKF7QFV6wW1zZ13/HNwVfMqFLuNkUQdNDkJtybam45lT?=
 =?us-ascii?Q?L1ToyCt0iLoikkIjUDy6wIuT4pZAlOo+2tzXFBAW+aLvMRcyjCYumgZ7SzU/?=
 =?us-ascii?Q?ayRt3G2+Tl+5+ZSkYiUxRH20NLLCF82+KrtG+50QVJl2jMk7XSAbEFEEAhdA?=
 =?us-ascii?Q?Fc4ECn3XCNkjzQHSILNNbhU+UwBAzNN+wKyM7izMmniaANQS4TZgd7L4sUJJ?=
 =?us-ascii?Q?LB1ji0fOjWVtWwmimZTh76f+ZOjsO/7HrqZYNQsI4QK5DJGzGiMrFhx8qhhV?=
 =?us-ascii?Q?G39kO6/WxmJ402nKvvfa3jCAZMGNGUBn+4SW/J8xLKqGVF7SB/grtVe4fVYP?=
 =?us-ascii?Q?UgKdMw9H+slUJxHJuVtdaM4AQPk3qzPKNgMeJcPo75oMhEPZkhfJc4sECit0?=
 =?us-ascii?Q?rZagBoWjjCpULs5bZsHbhkjWrTjaGL/2m4a2Kx2+hyPu5yC2ncG9UGUdbU/p?=
 =?us-ascii?Q?MAFDDjLs2fzn0S+QO/lPqLS8hNwKdXi12Jms5+++z/6tYrn4978AGRxf036u?=
 =?us-ascii?Q?y+pUdN8zibuVZJFZxSRQ4Zil5dwzeZPGxjFNGBf7ei7O1lcmJhrLVDtCzITq?=
 =?us-ascii?Q?6KXl1htMVFDFoXxh0e8vD//0lYTkbV9pN+QaockEbuU4foFH4a1CLAj3NjWA?=
 =?us-ascii?Q?G9mt+9jRj9mUD/Nq8MrCRPVMx+MZSWazqtKadktnfClmmyYlhYrNln1ojOoZ?=
 =?us-ascii?Q?22XxTNW+4lV8HFvJZVJDJwykSAzb2MhvUlbkJyn6XRAXK/l/WY5PdHvOL3vN?=
 =?us-ascii?Q?GUKFxT2g+GRorzSg49Mao8J/EhYYsu/24KTb873wFBvddYZ8aWVSiNE+stpk?=
 =?us-ascii?Q?mnZXw3MvVuxjN7b7rDhxs2Rh/voxwWmuTaaXF2nmKV7nsDm/NKEvMSxlO+7p?=
 =?us-ascii?Q?ne3oxSA/zy8Jq8mIsALl9Q5hkl46qJFedjjDmpZj08qypta4KsNFekV3uW5X?=
 =?us-ascii?Q?4u8JBDTXMbroSOS7wpSBmSRsfbJeooLkE2f/cb5bf5ur6USP3+9bOO23TLsk?=
 =?us-ascii?Q?XjQdLw4Q18m3bck4r51XzJgIHKNkJNioZnIUddCn6iPDi2wJcAK5Asm4OIBf?=
 =?us-ascii?Q?wZmnmXAgySqV1QRjZ93XRVstQbeIZjwabXHKQdHs8RA961gaWeKsx3/SSag7?=
 =?us-ascii?Q?pXR1Mye8gfmoexiOxjKhKEtlLormPX8fx/1hrH/rTOri1coNszli/Pfv39Pm?=
 =?us-ascii?Q?RWCzZNSdFfk4buZTtc95YC8QXHozkAipCOGiMaVyxMzQewLZaiAFd1OOwskp?=
 =?us-ascii?Q?/TUfRnrYlx4l9y9afy5uBWs9Jew/nGRCY/XGAcZ5K1UvMWj14uwjVpFwMwa6?=
 =?us-ascii?Q?DsMQtNhkBV4fVT0QcQu8L6SvycNGZmuDHaTaX8N2CTNYBVnjX7pgxqSMTwy0?=
 =?us-ascii?Q?Cld8FW80X+SLsof0QqZMltGKWpsr4crMYZCr8wAspVgmMX/eaz5Imh+3wmFY?=
 =?us-ascii?Q?cUQctL2HFPu2kccYlxYBSSQvp3hfd4s5EW3df72rRkyww8NkkcLHBnEh8GkJ?=
 =?us-ascii?Q?wnkljmpnxMVzXYXc5Z/iTwo73dcueTcAYPseDt26dAVGp67K5rlcEdKwoWmQ?=
 =?us-ascii?Q?yzUnAMSYsg/xo/LdP0nNErwLy0Kt2BSjHNDDz54u9ns3pB+s7LB6OFpj3wnv?=
 =?us-ascii?Q?Yc0ksE6hRQ6dQuScFjmqR58=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2aeb5f02-c082-4e2d-c343-08db71fdd644
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 02:18:43.9899
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 8GN7Op35RXgKJiJACheKryAXhVLvQ7CQK9RMgd+fKWVuapZ6YiMNUcNUVEQhFzJHRN/O+prZ31eD00SVJ866XIyxdaigVkdwQiOEU7t5Y0x4mFroqWNDdbzUvNteCGmq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8528
Message-ID-Hash: O62TKRBOWT3A3P75YMTSYZLLACNKVJHK
X-Message-ID-Hash: O62TKRBOWT3A3P75YMTSYZLLACNKVJHK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O62TKRBOWT3A3P75YMTSYZLLACNKVJHK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

To enable multi Component, Card driver need to get DAI via dai_args
to identify it. This patch adds snd_soc_get_dai_via_args() for it.

This is helper function for multi Component support.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h  |  1 +
 sound/soc/soc-core.c | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index dda731795bd4..1b3c58fe14c4 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1336,6 +1336,7 @@ int snd_soc_add_pcm_runtimes(struct snd_soc_card *card,
 void snd_soc_remove_pcm_runtime(struct snd_soc_card *card,
 				struct snd_soc_pcm_runtime *rtd);
 
+struct snd_soc_dai *snd_soc_get_dai_via_args(struct of_phandle_args *dai_args);
 struct snd_soc_dai *snd_soc_register_dai(struct snd_soc_component *component,
 					 struct snd_soc_dai_driver *dai_drv,
 					 bool legacy_dai_naming);
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index fc6922ecc3fd..f22a09f74ee7 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -3441,6 +3441,24 @@ int snd_soc_of_get_dai_name(struct device_node *of_node,
 }
 EXPORT_SYMBOL_GPL(snd_soc_of_get_dai_name);
 
+struct snd_soc_dai *snd_soc_get_dai_via_args(struct of_phandle_args *dai_args)
+{
+	struct snd_soc_dai *dai;
+	struct snd_soc_component *component;
+
+	mutex_lock(&client_mutex);
+	for_each_component(component) {
+		for_each_component_dais(component, dai)
+			if (snd_soc_is_match_dai_args(dai->driver->dai_args, dai_args))
+				goto found;
+	}
+	dai = NULL;
+found:
+	mutex_unlock(&client_mutex);
+	return dai;
+}
+EXPORT_SYMBOL_GPL(snd_soc_get_dai_via_args);
+
 static void __snd_soc_of_put_component(struct snd_soc_dai_link_component *component)
 {
 	if (component->of_node) {
-- 
2.25.1

