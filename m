Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9758073616C
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Jun 2023 04:16:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4B95846;
	Tue, 20 Jun 2023 04:15:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4B95846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687227368;
	bh=WRfM+EaUAJ/GF0wh5yn9rMJh3mLALDw2vTTZLQ9MrqY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vRp3kepG9c+0PbQKqm3bt4vxbvReYG1IGY9Eap/M5ZVx27wDZRFC2x33moUocyMGn
	 Sj60tlIVD84doih49a8OgRJac/Liq7519mLnetD9dcjIgAFZTW6ZYztqrANv/sYsPA
	 ex4vsanAJn1pv8g7EHJpdY2ZOW4NTROLD2IBIFJg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D6268F8055A; Tue, 20 Jun 2023 04:14:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 733C2F80549;
	Tue, 20 Jun 2023 04:14:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4985F80169; Tue, 20 Jun 2023 04:14:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2070f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::70f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CE713F80132
	for <alsa-devel@alsa-project.org>; Tue, 20 Jun 2023 04:14:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE713F80132
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Aj30K4o9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SyM7LXrVRfFVNXZxRKDdOZ6Oma2MR8j7hSPYpS+kxgVtYdl6bRDjZfvjItjUwKUGLep/wocG3xlfzXFOqR3n9WtW39Oo7zZuMjzSBZhiHMNaq3QsJX3k3kGCLEzzGU93gnvxDNNZJHz7AsAw8xMJ8ZeUk8TSzVeVkvGyzKupYBmJ0svXCBvjFh5+EebwYwI37bwq6kUvF4/iC03I4574DJgnpWpQebTElPLM4gMZQRChpTNfi+Tv4DzBuZ8ljR+wZzndIuImgDJ/lXYcjxbs1onWqeZpM5r4haWCwPAv3faC+omvCcW/ncFBG+0CdytcggJ2oR+Lq6dgY5M1o4iw3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yj2ECRFYujO/ykjsLUAf4b2eXmEpGyJUMxJ5FDpRgDA=;
 b=Wx9fwoIMwE30iBTiDgrnIqYar76mANycC7ny5NJxHn8rBX9ITyui8JTbho5XVpuyRRRl5n4pH44iewieAd5+bYFOO/nTz1umVKbgzUyhC0fby0K59LDLn7W1wrXOG0Ga0pUn0hu3n68GIWNFz5fVhYcZ2nUCnhjU5ycFtux9izGUWzh250GyGfM2EKyPyy8XYMTKWv3KUXBNL2sFIlorSAi+nNEYUWEzy/KYxPP/JilK/hUz/W6aJUGqtNduhn1cXZiGcEF+J+klm/nut+zHyhsOsfNqi3bswI3kkUrTGJSo25UuIGMtrTZc0nZEhRA2cklqNpeVTxxPKMiMTXZuZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yj2ECRFYujO/ykjsLUAf4b2eXmEpGyJUMxJ5FDpRgDA=;
 b=Aj30K4o9AhuJnS2hpXRlx9QPmGx6c3TKZVtb+q5ELD2Trr+U6ff9Vbhxsu0+prrwQikgGasSYRBNUMTSP4jzBnORhO3oduotOzlvp3AN5YmxAJ3gBIFffjoRPwDx5dV/C7WrxM1Z05LttIQfjFtp8UcBg3/pKWJI+SDJ2J3uVIQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS0PR01MB5665.jpnprd01.prod.outlook.com (2603:1096:604:b3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 02:14:06 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26%6]) with mapi id 15.20.6500.029; Tue, 20 Jun 2023
 02:14:06 +0000
Message-ID: <87r0q6dgnm.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v3 1/9] ASoC: soc-core.c: add snd_soc_{of_}get_dlc()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87sfamdgo1.wl-kuninori.morimoto.gx@renesas.com>
References: <87sfamdgo1.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 20 Jun 2023 02:14:06 +0000
X-ClientProxiedBy: TYAPR01CA0161.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::29) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS0PR01MB5665:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cfb3167-1b08-4198-fd2e-08db7134068f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gB+pUm6J1ExpHQwMR55ZL2yfg5cTB3i6yxdYy1IzqJ4RIH6vwa6B9B7NovY6qtTKMKqfkXfaLCTRD8VxSMi9BbJRZZGGSCGAfGkIcx6gNWEbcu5iheD5/TSCv1KWCjmI0NDeTds2WSddCLduJJvfi2S8ilBkXD8cmkg9vnTUF5DlhZJ5oYcbLG4NFArITprjUpqfLsitVrlX+bbk8pA4JWdMcrO5g6/Vp9LZN8lZGQXzabLiS2/gl64evSjpNp0d95Gq2pDXwZITJScbhkE/0LssT91bWkjQZSE17R5GfSIkUJ9k/1STydKxzGGCy+AqgKvdM8hkK0DPk6vr40eCKjQWwjtbcPBSm4V16PWKGgyoRMlHYlJsS6btVhZqdjrEpvZ5XNP1FqzUs4wXBzCX8pq/Up+XzWUxyb6mSyCGWgOPlJFasgPqtj5dpu3cU5guNKBOnzW1Ly0E5PeKmsZ18mNO/E0Y9+7jDS3dAtvVU5OrPODxDlX+fc3VHt2zw5Zy63tcp+y60ZjlLhXT/gYrFw5P/y7ldYYOuqapCZCx3VVZCcLYums05gdZAmxszJyf6ZEgcP07qlpg48RZkqJWBi/EiL+RAB0C2I6QSpLzpaolD1mgMNKbbQgt+rgazGCb
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(376002)(346002)(366004)(396003)(451199021)(2906002)(5660300002)(8936002)(8676002)(36756003)(41300700001)(86362001)(478600001)(26005)(6506007)(6512007)(186003)(110136005)(52116002)(6486002)(66946007)(66556008)(66476007)(4326008)(316002)(38100700002)(38350700002)(2616005)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XFvBv074Wh8OBOBdHH5ldgVtrShJYNsXfvcFU1H+LiXFS5itxIA0xRHowrQY?=
 =?us-ascii?Q?XB+GhamL9fzd5qbLPZ7nsWcXbaScMynWnJZnL+dnVKXFgKT3mLS384BFCAdR?=
 =?us-ascii?Q?5IWaXRfJQdT9lmPDJRdxAv4KrvqiW+bixs7/nP4zxMzhKTo2fZ1007jmNJO+?=
 =?us-ascii?Q?MmMW3A/DXzTIZYs9JrAXAASTme4UGU5oBzPxgsHdulB89rxkPvopp0WpJoyZ?=
 =?us-ascii?Q?7AGYs0YMcR3MvtAS9qf7g37qEwfj4bflsOTEpb1/JO2TCHzXf4c7NKx+mFr4?=
 =?us-ascii?Q?rJqaekxnxXX+oZQSzojz8p4fgRfwh/u/jMi2BkMu+KmTm67RbutlwrIAO14T?=
 =?us-ascii?Q?EWmcadu595gGEt1kDb3bil9GocPHXec6dv91tcG7TZrE6S7ECs1punQZ4ONF?=
 =?us-ascii?Q?P5CBWx/FNn564zVLkdNUTtrUiLDx615wEsRXKN+v9kLX7QdQLeDlyBYs6aNB?=
 =?us-ascii?Q?0eOLariY/B6kxXj0NbHH9udVY2q+qGgUF/Vk87CI5q2Hr8flJncj8TrbbyTS?=
 =?us-ascii?Q?2Bw1jNe+LtNZmMuMgPx+x4SeTTt+PfhdwF3EyHHgPJYx1XTfogvuZBtRdIZl?=
 =?us-ascii?Q?WgOzerc8Cek7oCcXmYam9OAmJvEZcRZjGlpRrSIo7eZHabekUUxaksDpb+0i?=
 =?us-ascii?Q?ztviwZHZMnfGC2yWMkZ7rERnBs39I5c2JKSAHw2EY9zmoFfOtLLl5JEB7ylR?=
 =?us-ascii?Q?y7kTGFGJGHRzRVB/wyGNxGV28oi/2EZQReK6pJexYsoygj70Wh+YurSlU9df?=
 =?us-ascii?Q?B6ovBSK3Q5wO+dEEc0RAswvDRj0MEOMFLWVqIj85oW8dYTZcSNhPz7Y7sjVm?=
 =?us-ascii?Q?j6b7yyKgePTfXHzz0ykwD3sCTUdYW0k9wwVl9xnFAiRxX2ZVW5tjsAyB/Ih7?=
 =?us-ascii?Q?Fshf1OknAcW6Ec0O5BAjIU9kiigWxeL80Azt8bGkxgvFjXwfyK1RCQn4lHjV?=
 =?us-ascii?Q?dRENAGWrI4KIk9LrIcwi9+rXtmRcyPtl7QUvNQFUcP7ukUP6h0YRSWsE4IvC?=
 =?us-ascii?Q?FTuZSxcu92G+eDMdNO27WE73fkx+Vjvagj4LWyLiowEJHsEkV8lnCOQ9nI43?=
 =?us-ascii?Q?nl2i/hWAcMIGT/owtgiybx3kOPOoL/LsnjJHulDF3CKltDrTt6JhpMt0kLSx?=
 =?us-ascii?Q?5RbxJwfQHcmcbHyA3HaIdFfDh+T8M9EV69d1VGN/jT9OGNQ1vCwwJVImPSUf?=
 =?us-ascii?Q?52d0f0XpaKjHm+Qbb+mBk1S0DBqQISsheNdPeNGp2ABeYwpkhDceKJHXg3os?=
 =?us-ascii?Q?gUizSPjbEqNXWkA0EMhT8RfJ4GqgO0l5p5i7oiBF/bioEH/qnX498gLaxJyR?=
 =?us-ascii?Q?naAaznIU7k3thcpunGdfbp+yjOSPn1gVzD+bysxwabhalH2M/7Elhe2BcoyK?=
 =?us-ascii?Q?BwM80AheH/y8H3vjwqgK2DFpuYLhk2/sXKAPdL0ERFNSQUKA6RxYkGGZaWHH?=
 =?us-ascii?Q?wmBT8+Oe5x78Kn8H6FgvZtliMYw9e2dKa/bSTV1fR3u/3d9HyRnaZkDb7ZIz?=
 =?us-ascii?Q?81edJZdUbFqoplnQhOHvGcYbazHgpCLjqb48ldtBL2EVLWNxI0KpPGTKtiEx?=
 =?us-ascii?Q?SmVCdS9EOe+7NtvEt4IP1bEPUb+x7+D6eKC3J+UWAtRgoWd9CaSkM/7ecn12?=
 =?us-ascii?Q?Ddlqy1saPr4mtQTljGGvrso=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7cfb3167-1b08-4198-fd2e-08db7134068f
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 02:14:06.6555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 afR+N7C8k3ayjrVKatnqZRbuNZI8C4/28UtkF5vsR5p5ze8VE+RIG4thVenqVG4h1GuLqcOWzjF3asJ/uhOhqQAhgaZItGW8l7S9lt3K12rUnMeGrS01EfuWdibUx7Ku
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5665
Message-ID-Hash: H23F3FWVD77Y3ZAX4UNN4VA7RUDG6HWL
X-Message-ID-Hash: H23F3FWVD77Y3ZAX4UNN4VA7RUDG6HWL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H23F3FWVD77Y3ZAX4UNN4VA7RUDG6HWL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Current soc-core.c has snd_soc_{of_}get_dai_name() to get DAI name
for dlc (snd_soc_dai_link_component). It gets .dai_name, but we need
.of_node too. Therefor user need to arrange.

It will be more useful if it gets both .dai_name and .of_node.
This patch adds snd_soc_{of_}get_dlc() for it, and existing functions
uses it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h  |  6 +++++
 sound/soc/soc-core.c | 53 +++++++++++++++++++++++++++++++++-----------
 2 files changed, 46 insertions(+), 13 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index a7ae8b26737e..943f0a1b2d27 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1309,6 +1309,12 @@ unsigned int snd_soc_daifmt_parse_clock_provider_raw(struct device_node *np,
 		snd_soc_daifmt_parse_clock_provider_as_bitmap(np, prefix))
 
 int snd_soc_get_stream_cpu(struct snd_soc_dai_link *dai_link, int stream);
+int snd_soc_get_dlc(const struct of_phandle_args *args,
+		    struct snd_soc_dai_link_component *dlc);
+int snd_soc_of_get_dlc(struct device_node *of_node,
+		       struct of_phandle_args *args,
+		       struct snd_soc_dai_link_component *dlc,
+		       int index);
 int snd_soc_get_dai_id(struct device_node *ep);
 int snd_soc_get_dai_name(const struct of_phandle_args *args,
 			 const char **dai_name);
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index e8308926bd98..8dba5bb26ffe 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -3257,8 +3257,7 @@ int snd_soc_get_dai_id(struct device_node *ep)
 }
 EXPORT_SYMBOL_GPL(snd_soc_get_dai_id);
 
-int snd_soc_get_dai_name(const struct of_phandle_args *args,
-				const char **dai_name)
+int snd_soc_get_dlc(const struct of_phandle_args *args, struct snd_soc_dai_link_component *dlc)
 {
 	struct snd_soc_component *pos;
 	int ret = -EPROBE_DEFER;
@@ -3270,7 +3269,7 @@ int snd_soc_get_dai_name(const struct of_phandle_args *args,
 		if (component_of_node != args->np || !pos->num_dai)
 			continue;
 
-		ret = snd_soc_component_of_xlate_dai_name(pos, args, dai_name);
+		ret = snd_soc_component_of_xlate_dai_name(pos, args, &dlc->dai_name);
 		if (ret == -ENOTSUPP) {
 			struct snd_soc_dai *dai;
 			int id = -1;
@@ -3301,9 +3300,10 @@ int snd_soc_get_dai_name(const struct of_phandle_args *args,
 				id--;
 			}
 
-			*dai_name = dai->driver->name;
-			if (!*dai_name)
-				*dai_name = pos->name;
+			dlc->of_node	= args->np;
+			dlc->dai_name	= dai->driver->name;
+			if (!dlc->dai_name)
+				dlc->dai_name = pos->name;
 		} else if (ret) {
 			/*
 			 * if another error than ENOTSUPP is returned go on and
@@ -3319,22 +3319,49 @@ int snd_soc_get_dai_name(const struct of_phandle_args *args,
 	mutex_unlock(&client_mutex);
 	return ret;
 }
-EXPORT_SYMBOL_GPL(snd_soc_get_dai_name);
+EXPORT_SYMBOL_GPL(snd_soc_get_dlc);
 
-int snd_soc_of_get_dai_name(struct device_node *of_node,
-			    const char **dai_name)
+int snd_soc_of_get_dlc(struct device_node *of_node,
+		       struct of_phandle_args *args,
+		       struct snd_soc_dai_link_component *dlc,
+		       int index)
 {
-	struct of_phandle_args args;
+	struct of_phandle_args __args;
 	int ret;
 
+	if (!args)
+		args = &__args;
+
 	ret = of_parse_phandle_with_args(of_node, "sound-dai",
-					 "#sound-dai-cells", 0, &args);
+					 "#sound-dai-cells", index, args);
 	if (ret)
 		return ret;
 
-	ret = snd_soc_get_dai_name(&args, dai_name);
+	return snd_soc_get_dlc(args, dlc);
+}
+EXPORT_SYMBOL_GPL(snd_soc_of_get_dlc);
+
+int snd_soc_get_dai_name(const struct of_phandle_args *args,
+			 const char **dai_name)
+{
+	struct snd_soc_dai_link_component dlc;
+	int ret = snd_soc_get_dlc(args, &dlc);
 
-	of_node_put(args.np);
+	if (ret == 0)
+		*dai_name = dlc.dai_name;
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(snd_soc_get_dai_name);
+
+int snd_soc_of_get_dai_name(struct device_node *of_node,
+			    const char **dai_name)
+{
+	struct snd_soc_dai_link_component dlc;
+	int ret = snd_soc_of_get_dlc(of_node, NULL, &dlc, 0);
+
+	if (ret == 0)
+		*dai_name = dlc.dai_name;
 
 	return ret;
 }
-- 
2.25.1

