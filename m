Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC948125A8
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Dec 2023 04:00:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2AF429F6;
	Thu, 14 Dec 2023 03:59:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2AF429F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702522799;
	bh=Kat+EPq7KUnx7IIYtY6tS5Ef1K8mqvCA9fGdf56Lug4=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=WTWeDlgOdmD5cp9jyUcDNuje7v9vG937s8Y/fbI5gv0YDT0Q32+f3ZexBYLOz+fMj
	 X7hDXn6X8RPAH7PTVWRZrY0rw3W5mMfwXqBNT4q0tkB8dPJOZ+FGECZoPvw7Q8KGXn
	 gF9bbVB67cpslcIdVJMBfgM6SX77RXtRuHXyJCY8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6598F8055B; Thu, 14 Dec 2023 03:59:23 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 499D4F80578;
	Thu, 14 Dec 2023 03:59:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 573A2F8016A; Thu, 14 Dec 2023 03:57:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,T_SCC_BODY_TEXT_LINE,T_SPF_PERMERROR,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe02::62c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6165BF8001F
	for <alsa-devel@alsa-project.org>; Thu, 14 Dec 2023 03:57:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6165BF8001F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=DOAnGD09
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K4P1Cagj+RPHCUF0ZI/bm+de2g2pC2qoVU43aMxpOOAurS5x68JldDGKsgECUFX1ZGTOg1ypjrZuFBk44hKEchWUDfaURLES/lL/JWk6zgpTYdplGVGdD+u4CYHo+h25tjqeLoZFpjS4MMuYRYEibIUhWouzRFs4hOCf54AihEUknVQXriR9mpl2Wg71292jOFIPmQ/lpShtH1pVl3tW5WFT/138o7a5exMuzb6S6TXnh7FAm5L3Z5vu4zrlmgLizVBMO3bAf4DydZO0TzGIiIrsp1CHn5KvZKB4+UgS3QCN8UoYsCidIBWjxyjkBUInMw8YMHfrTNotinbm7YH4SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U92VO5zwbDT/SCI7maFN5uvSQuqt14i9qxiWd/vqibE=;
 b=n5x8xSnC4fqhd7a1ixisFIF2VLY8ZTiQp31xcmh5x7f+7friklLSZYRJUJaowKa7ldiG9DM6EYAXICGRwvrmpX3pz2wnxbDq9Ri4kThOPBzqE2oOHM/0QCkkAZh0lJs3VothgpeCNEoMxrapZTaOl2S4T90wGFrqZACe7/U5zC1coQ1xN9XG/mOqTNeOcTz2hwi2tOUoX9pIl1tmhLCxShrvePso0D2uXPFK87Xl9ONOcrIVBKFzgaC2rLQ7sb62HMpvlgZBtypzzhslkJTC4wUQ3kXSI1S7o0eqk2j1vnapa+ToF5q1jgDy9mVEJBi8c3v+WlWhvBrpyR+N36kvQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U92VO5zwbDT/SCI7maFN5uvSQuqt14i9qxiWd/vqibE=;
 b=DOAnGD09awU2/Z+hs+DSdUcQu99iVYneeeUP3dZUDZjtJFZWWO5pMqd7NF1KS8haiV2l8jX7fYtZX0e16ybtI0TPO1x1mbXd02v4V5EegKO3Uyey0Okr8mvNNw2V4dpPNgBqoXxB5tbmBcHgcZIV1cUw+H4U+H4f9eTl5SS4FKk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by AM7PR04MB7190.eurprd04.prod.outlook.com (2603:10a6:20b:115::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Thu, 14 Dec
 2023 02:56:59 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::2a3c:9a90:b09f:293c]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::2a3c:9a90:b09f:293c%3]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 02:56:59 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Cc: Chancel Liu <chancel.liu@nxp.com>
Subject: [RESEND] ASoC: soc-pcm.c: Complete the active count for components
 without DAIs
Date: Thu, 14 Dec 2023 10:34:25 +0800
Message-Id: <20231214023425.10572-1-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: PA7P264CA0275.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:373::11) To DB9PR04MB9498.eurprd04.prod.outlook.com
 (2603:10a6:10:360::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9498:EE_|AM7PR04MB7190:EE_
X-MS-Office365-Filtering-Correlation-Id: ec7ee500-2a75-4c84-de77-08dbfc5056f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pgtkC1CwFconKcE6Q1oR4ZymB4RoU3ApythgVnvjMbP+qcYf//cEFXU+GwxgJmKpXCSWojBF5cDTV7OXru+U5h/DDo/KsYR7gXmN1kw7yLt0iL4ScbXUUBFQ3taIJQEpCU1x2aDdzdjk/uagT1K2wL0pC8W0U3bjgIRhIK+PEE06p2SCitARXddHzFiQFPnqp5Lc70dY4HBXGVSZXYTEGkEAsf9tvPA81/c2TmWhtXvqVJpmaqVqSnMZ6nynok4qXf7mooMH6p5l+fNP+/vWA2qCgilS/Bmk1ZLRbGRUIpiYZlVaY+jXdPxFeU7QsVtnR9Q+4WDGxxk34yvq/yGxyBvbRwFVc8GTpbKYofB8VNj6gG0Jq4H9EArTEUQ0ZGeVF5gYX0+ih9fxpEANt0z+g29QiG0zXal02877Z13rEeQAsXt6Otf2P0qW/Y8LeE14mLbaVyWl9bJvkInDMgz+oOcDFWczm0Aecu7Z7faa0uuvz/j3vekIeczfLu9PfGkFBCPEVYywFe6bjFo3V1tUVeLs3S5pOwZEDp+96+rT/XHQ7T9su6JicfnNjOQOj4qXwPjlMjA1SWMqF3VRrbPzm6eoeMDth5nYPvhG6LETBX2qivSD0N9hD9sg/ddxHUC1
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(376002)(346002)(136003)(396003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(8676002)(4326008)(8936002)(44832011)(2906002)(5660300002)(6486002)(6506007)(478600001)(6512007)(6666004)(52116002)(66476007)(66946007)(66556008)(316002)(41300700001)(38100700002)(86362001)(36756003)(38350700005)(83380400001)(2616005)(1076003)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xaXA4Iyej5Dx2gRFJiSATxRo1Mx+I70mjFrpg5IENW5lDH2LfSwKEwEdsXDV?=
 =?us-ascii?Q?B/DEztLKJqm4fgdXnJkqOQ8syXe7Idvr8gj05FQeIQsDdhL+JwTHzihwzFlQ?=
 =?us-ascii?Q?RMq/3HM13r/jeTqQBsOBWrGFriyb9YKikfoLLJZoIMRJnu0Fi+MMMabb7H+9?=
 =?us-ascii?Q?TaxlVEfc6mboWU1NtBeTxDa/XPnNioMlmbT4rQpmcgU6pIxjq3zcX5JfFMOD?=
 =?us-ascii?Q?9gwA4o4dl1yiCyxSPTzl2udgQwgY12yA95+xzYlChpKz0cnY8iyaXYU78Eyw?=
 =?us-ascii?Q?dJBu4jSxaDnAFGY7R2AvoWHEVO8hkZs+1BQxHL4D+GVGHna6TREOYd/peS+q?=
 =?us-ascii?Q?Z4oK28vgkV1ieLZ0iCSGVw8SZ+Qya0aPZyJ1QGxRZhtkcRwi28/rbyifkcu/?=
 =?us-ascii?Q?Dp6CE975trnxMBW2bRZguAzl4TZqYbHJC6C44+rh+/U2d85aKF7VVw5U7Nzu?=
 =?us-ascii?Q?AM+XedVD9cxi/wDK0WAX+PKXIZBm1pRRYBSXqqJW9xrIN9hG0Sm8YbkX92GN?=
 =?us-ascii?Q?Wp7KEbH2DAzsl5r6QTGZYw1Q9dQG+ugnXXVVnaLW3hAs3+yg9pXENZoBH8pC?=
 =?us-ascii?Q?10fZdY9veQcn3No0P/3vf9wTF/4aPfF65Z4hzmWwXpjhmKxpIfSKPaxkdcd4?=
 =?us-ascii?Q?3uNJd6Y8PSWcJkKfjbkRYpDkJAKTRx+eBwDCBh21FoNQHWx+5bImY+VAz9M4?=
 =?us-ascii?Q?kKqc3AtYZQAnY8oKIImCMXzh2r2yObSMGGgqro7Qw/WPrKepuxPxGbV2OMnU?=
 =?us-ascii?Q?0XJQFqr+rEWm91CVgFcDYbLQra4SUAPbsNwpwsWaJCE+jGDuYu2AQQkoYZiE?=
 =?us-ascii?Q?RnZNtgS1jbLNdFrrg6Sii0B6ERB/o0A3M43pZ1LEWzzW8xs8OPLq5QuxVClK?=
 =?us-ascii?Q?a1Q+GXXZW99UEdjLJHTi6sUbmRLJt2dFdZ4jEXsY56ldicnvzmhZR8Z8mMdX?=
 =?us-ascii?Q?SXRhNZly7UlVp4lW1OuUFDMqmogKdZVn3dnqFEjqOx6zRAr39swZbU8OGqMJ?=
 =?us-ascii?Q?msqhmkyE9q0q1JfzHFB6kfVTkYFKhv8XAhDAeSlh9QCD6wivHigdB9lFELoq?=
 =?us-ascii?Q?ksIJmdIsyYeXIH++5FkTkCxv+DYBm+jJ3ib3IC94bdghjSLsrHXDTh11Swci?=
 =?us-ascii?Q?Be+7ENuWI9UskMZmsAixv6r5f3Ts1R+AH/EEKEhbs/pCPI1XUiafTzv/y7C9?=
 =?us-ascii?Q?VpyTJtHJz2hl/2CULxdOWExVQVR3GE1C9OzSKM3DLKuw9sjvhIfOKi0X/jg5?=
 =?us-ascii?Q?lJUzde9YZeXhFjtWBR03u8276Ze119H7eckkP/rBe1VboWgJx08EH0f8uEOG?=
 =?us-ascii?Q?+LGrB2YC0O6AWg+JRweZxZZHpfaCqK3NwNHRZEC93Not2opFTmwkmixiRfhW?=
 =?us-ascii?Q?OD5OMZhBHFgsOgoFsOhZH+rAeBqlen1KT+hMQsVvlcv2QWJvHWrHLT5Dl+hM?=
 =?us-ascii?Q?rhpc4ygL7hcC94ceKOOBufrSIAPhy5S13+tJV+TkWVO3PBeGjUjTcIWf6nzQ?=
 =?us-ascii?Q?qzXLd9HCHbuS33+TXn0Y720g3RKQ6rYmUBHaQApLhRqPsi7G9jTvtNTfSHXb?=
 =?us-ascii?Q?4MY9H7lA8ZWXnvBF0vxmT6tsnHRcT5L803Pg8TqP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ec7ee500-2a75-4c84-de77-08dbfc5056f7
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2023 02:56:59.3196
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Ed8NnnBtmy+uIORwiEVOSjUjv6VjmiF+Ci9o7S0+bNJGXDzQvB7/ESpX4RXGuBjGN4MWFdAtZUejI6J9kr+ofA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7190
Message-ID-Hash: 6Z5DCAIFU4CUVSRDHHG5PTUPC4ZIJBSE
X-Message-ID-Hash: 6Z5DCAIFU4CUVSRDHHG5PTUPC4ZIJBSE
X-MailFrom: chancel.liu@nxp.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6Z5DCAIFU4CUVSRDHHG5PTUPC4ZIJBSE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Some components like platforms don't have DAIs. If the active count of
these components is ignored pinctrl may be wrongly selected between
default and sleep state. So need to increment or decrement the active
count for components without DAIs to avoid it.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
Add alsa-devel@alsa-project.org in RESEND. No other changes.

 sound/soc/soc-pcm.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index efde4203bbf7..7dd4d41f680a 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -292,6 +292,7 @@ static void dpcm_set_be_update_state(struct snd_soc_pcm_runtime *be,
 void snd_soc_runtime_action(struct snd_soc_pcm_runtime *rtd,
 			    int stream, int action)
 {
+	struct snd_soc_component *component;
 	struct snd_soc_dai *dai;
 	int i;

@@ -299,6 +300,13 @@ void snd_soc_runtime_action(struct snd_soc_pcm_runtime *rtd,

 	for_each_rtd_dais(rtd, i, dai)
 		snd_soc_dai_action(dai, stream, action);
+
+	/* Increments/Decrements the active count for components without DAIs */
+	for_each_rtd_components(rtd, i, component) {
+		if (component->num_dai)
+			continue;
+		component->active += action;
+	}
 }
 EXPORT_SYMBOL_GPL(snd_soc_runtime_action);

--
2.42.0

