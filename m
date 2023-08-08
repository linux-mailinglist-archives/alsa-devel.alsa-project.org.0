Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5035C774EB6
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Aug 2023 00:55:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B7D8844;
	Wed,  9 Aug 2023 00:55:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B7D8844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691535357;
	bh=SNakYymuN4DdtR29CqOtH0Iu486Ro3vOVhA7lnmvzvE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DgwiLaehakKA8DLwID1Bi9ShfeWqwgsIwKjg/zZZr21H7WdW9xH6X2SlgrsOnNv90
	 nkvvji+ectgV9jDay8oZqDt9mIDK718pxdM40K9cgPvvH1KG+/RxVlJ627AXwoH2bZ
	 sK77Wp/ty0vH8CB4cEjXAjlgEdUueXBxHxFpCw8Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 72B9CF80553; Wed,  9 Aug 2023 00:55:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EE195F80134;
	Wed,  9 Aug 2023 00:55:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BDEB9F80134; Wed,  9 Aug 2023 00:55:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20703.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::703])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C6707F800FE
	for <alsa-devel@alsa-project.org>; Wed,  9 Aug 2023 00:54:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6707F800FE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=g3xQX1U2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BtXdy9RiuGto51tnWo6Mcom2npQzkJC//lwIFtHbzhqFSgoMU4PeAdxo4GtOqLrKGDNbi2JcltWWFCLcEnnElakPnwGw6ZlM0YhvUj0Qy3WxmIA8f62BujrTy+BTKUkprBoHSAT1l3nSp33Aasx8lFgX/W6lkaATVv9luheLpacNw7LtUhWKt+SUiKkQjOATERR/QlM1ZLU/x2bkruYt1Q3LtDLWHPyPiSrtexbhfs4AHTJCo8ZRcJmSe6b6QQtItZGTfYUDp5r1nb3cSlmDUM/SWssnnpmpK2PTIm+olyg3B1t4tLb4tykO4fCH9kWUV5207K+gPEAaw550a5+tmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zjlz7aganOewiybsIwTtVYbLt3D8p/SXFmfq1EhM7Hs=;
 b=Gcb2cnyJPcMXxFp/MrShbfxt7BiuxK8XZ7nchNQOLFUwA2hPgBQt7VsmlCUz6Ijaw7cLdzDCoI7sdu4Hf/m9HDmKen2oSwfiPeXa7sSex0+uS9s8SWLoqCWb31KyoDnuDpevaaIzqEU/2L0uyuFim/+wIpPH4AD4O0LQBeSSVZwf3yaeH9A9/yv4re4sPOhhvXoPg2Uq7PSN93o/B/9MKjgjm3rORT7sEwcMbR+cmdIFjPLwIYsVpNytBcNghf6ssN/VpzQEpGqaCbNTjhbvbEYJ5iD9E77po0v1YdSzSsgRb/7E7Wl4ynOj6Drmjc5inXzNX8sbVG93DSmDBT1Dhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zjlz7aganOewiybsIwTtVYbLt3D8p/SXFmfq1EhM7Hs=;
 b=g3xQX1U2byoQ6iEkfpnEOlTJKRswpnbl/E13JMLjy6rXJQivZKKFFDcVRnWBzxQ32GF4XpF/Q0YgVPkDODpNjxiAioZVBRwNNlKF2BBPNwPv2fCh8n2G3jRLV7dwx4kv33jtXdmf3SUGPUmVEla9xBx3WQLGU3DeflYTgYLYU8U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB9524.jpnprd01.prod.outlook.com (2603:1096:400:19b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Tue, 8 Aug
 2023 22:54:50 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6652.028; Tue, 8 Aug 2023
 22:54:50 +0000
Message-ID: <87v8dpb0w6.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 01/39] ASoC: soc-dai.h: merge DAI call back functions into
 ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
References: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 8 Aug 2023 22:54:50 +0000
X-ClientProxiedBy: TYCPR01CA0106.jpnprd01.prod.outlook.com
 (2603:1096:405:4::22) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB9524:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c28602b-e4d6-42d1-5809-08db986278ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kxJZxbF57kL9/d+5naHfG2fnq8evdGOwC7joEeVWZbZhl/8KAY6AR196Scw1IeP1qY83kcRmoVzBovG0wkUkfTcoBKjoBMT4L0sm2REUtU2JlhApJJoE9OakHByBFSx92SppXdPna93io5M+uCQRYe0iOxT0mLnNSih5o6gh2C/7unMxZ22MecTg5GDAocImLp3Wf+TzHDoMvnvBJZ3S0DwnGzTTaI9Whkksdz5jUdwoSRxeZPtZuzTPzDyAyX3/SAX0qKUAIAt4KMfL3MgpbPbQhVBJdSyT2HpRNuSTfB2afJGdHLjpgLYNmpHhuQ0UK9uVWlw0SDrallG2mex/xEGt4kN3umBLvlZhxVjhFCzUV13mgUIMXTwFQx2WCHxthyzT7XxWF4Nvj0PyTQFQ8fdAIXiqVE1DlmRluUN6jq/T+l78ENauqll9vl8F3caTbuVNq42LT//mIC7d2ixFy4tS2lWj+90PKxA21EaxA4qU9RbLerh0w8KLjn7eMBPsatrZ0EMYjWTBy2prVzXtDWT053e0v9H2xTzo2Bwvfaf8mtanGfdpY79tB4grdJGhCdxWC3dOT21+2RRxdDhepxaUR7KoLqualfkRjtX3b7p43LMclYMEDCLZP/XGMKix
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(366004)(136003)(346002)(396003)(451199021)(1800799006)(186006)(316002)(66946007)(66556008)(66476007)(4326008)(8676002)(8936002)(41300700001)(2616005)(83380400001)(86362001)(38350700002)(38100700002)(36756003)(52116002)(6512007)(6486002)(6506007)(26005)(478600001)(110136005)(2906002)(5660300002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Dha4fXQoXqHFAN/1KHQtS/Q7hrUT6cEsqspEFAMobEMdobe/S5oG7wbItSHi?=
 =?us-ascii?Q?uNG72OFUWfjl/0WAsTdo6qYt0gJkf/3UHxYtY03wuaUXq/2/k08HkmeCDD+c?=
 =?us-ascii?Q?c0PChvq433HAgLAtLlLOZZ1NRfiZCH8fWMeq1YCKXjC92hsC9mddZh9ObR4h?=
 =?us-ascii?Q?X8Mutx/tXBPTuPJR2ym78TjV8vHaQ6i/Vu9OCbKE+hMUGvRgHykabQ5LqQej?=
 =?us-ascii?Q?u1eMICHdAcwY9BUJg6hdYowdynloZWgxkh5RNwJCzHQrs7GkvZa1nlbdD5h8?=
 =?us-ascii?Q?fvns5Z1A/jRBFydE+kdT7sku4c8tpKVd4AnTMbRm864+M+LHMYTOXwAqiTW7?=
 =?us-ascii?Q?NflhSiHnl/sPCRiTmXFujdNTkTPN+BGrDL0HC0echSW4hMJl0weasxF2tOTp?=
 =?us-ascii?Q?yCcg1HvFLA1TH0Ha9dKNT8kxH4DxW4DY960+oiRHUjlFZShxgaaekeA8ZpeD?=
 =?us-ascii?Q?4UoBy7N18LfgVO2bdidG/EWPLwbErhiz66SiiHJNFA0WtlnbsXQdMzskfmVH?=
 =?us-ascii?Q?b8GLqavPWv+kvUqmVnlMZlKMttPIIGPBDVkAgWqeQKQLIRktGg761kNuA0IL?=
 =?us-ascii?Q?YRmIBpzumFfN/Qhkc3Hdd6ZS3iyB7Ekvz9oB8HPLi/msDm+ovi/GlIjmu7l+?=
 =?us-ascii?Q?cDm7VFQSR58CZNbtGyRY/nP98hcmBFJ0UjIbHrEAQOih4+qDjen4Bb4bu0Ms?=
 =?us-ascii?Q?mW2B03SXq8vzheXsfbTSnEXNeNb4dgAHEoXLkmNIIG/g3jMbxNKJPK0hKp74?=
 =?us-ascii?Q?mvsF3B3BI0vpPP18G3PE1mvJISvU1dxSYh6IgdvRq9wZauPLX+s6VwPycLHi?=
 =?us-ascii?Q?ZEDJjApm6fkhYmxurJhxvj2bCZfAfMLyuvGnjR74g6ojG+KPZJNkrVrdbXBl?=
 =?us-ascii?Q?ioKRKVXO37+qfOICGuURKqZQZeeuwhSkPG2k1MUz/lea7NwlUgCV203xfGUs?=
 =?us-ascii?Q?7iGueFylHlJlwcbfva7WSM5a3mwaM6m6iYulyg71lAjVEiOb3pmYkEHC4POW?=
 =?us-ascii?Q?+T6KHYzTO27NhQ46cVkMO+0Zz0E1I+maZL8yj3Se/g24Lt+x54YmCD5+Ap3x?=
 =?us-ascii?Q?dxd9REv5/OecPvRVd0l+NzfhoEMWN+wvlzby5JHEyOY9HVQcvSAI+FeWa6xO?=
 =?us-ascii?Q?qegIcdtvqwaDr7boYNZYV7AsDCMEyEXoDWbdUCggYSjeZJAOT9tzTEBpt2ZN?=
 =?us-ascii?Q?GTLlKgikNBPR73/UBOC4FCNNY1L8hfv5le5wxBJcsyyVj2/0CkBuq49uwo/x?=
 =?us-ascii?Q?wQKJw1FEL5DB2vixb1w+l9/ho901WmqfGoChoPO/Qq/14y6apE0eY1ETuUpG?=
 =?us-ascii?Q?z5Oq1H6tXOQvbgcJky88dJNuXzud2nlu80WdRbPuvuRnqgnwNcPzdHQMf9Dx?=
 =?us-ascii?Q?0Kv+DKcd7zgplgM94ltc5BS0dACHRmGQr9vv+GB2DmwwAMbu77zA5z3Do/JZ?=
 =?us-ascii?Q?2W9fIbeSjF1i0RdzXuQsz45ilyCKnfpJNuWE5TCWGEeOZBTMXBbRqRms79Rm?=
 =?us-ascii?Q?N+8Uo8MzK0p4rpbkT6yWkzR6bYVeqJ0hZ77rifiu3pKxth1eIgwu6EVQbNQ3?=
 =?us-ascii?Q?Jgv3TI7K/jbsMD/a4PMvMe5JTFnKuaAUwxyAXM+rHJhYssIfBJ1jXo6ZCrC5?=
 =?us-ascii?Q?olSabnC0KEkG2prio+9mEac=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8c28602b-e4d6-42d1-5809-08db986278ac
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 22:54:50.3359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 VF0vSg8sJOs3pgwBR6c3rw75nSgZW8Zn/sE9/uteArHdA8QcxX92GLslyCgWbK7Byxt45b3AxJ1POd8pKR/oCATk2wtjkjaps2FbTLgn08+MlXTBODV/7dy4pAeD5Dg3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9524
Message-ID-Hash: BI46CMEMBALQX6HGDOJHW5ZSHMXJMEK4
X-Message-ID-Hash: BI46CMEMBALQX6HGDOJHW5ZSHMXJMEK4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BI46CMEMBALQX6HGDOJHW5ZSHMXJMEK4/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

snd_soc_dai_driver has .ops for call back functions (A), but it also
has other call back functions (B). It is duplicated and confusable.

	struct snd_soc_dai_driver {
		...
 ^		int (*probe)(...);
 |		int (*remove)(...);
(B)		int (*compress_new)(...);
 |		int (*pcm_new)(...);
 v		...
(A)		const struct snd_soc_dai_ops *ops;
		...
	}

This patch merges (B) into (A).

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dai.h              | 13 ++++++++
 sound/soc/generic/audio-graph-card.c |  2 +-
 sound/soc/soc-core.c                 | 25 ++++++++++++++++
 sound/soc/soc-dai.c                  | 44 ++++++++++++++++------------
 4 files changed, 64 insertions(+), 20 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index a33d803fe548..85f897fea21a 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -274,6 +274,15 @@ int snd_soc_dai_compr_get_metadata(struct snd_soc_dai *dai,
 const char *snd_soc_dai_name_get(struct snd_soc_dai *dai);
 
 struct snd_soc_dai_ops {
+	/* DAI driver callbacks */
+	int (*probe)(struct snd_soc_dai *dai);
+	int (*remove)(struct snd_soc_dai *dai);
+	/* compress dai */
+	int (*compress_new)(struct snd_soc_pcm_runtime *rtd, int num);
+	/* Optional Callback used at pcm creation*/
+	int (*pcm_new)(struct snd_soc_pcm_runtime *rtd,
+		       struct snd_soc_dai *dai);
+
 	/*
 	 * DAI clocking configuration, all optional.
 	 * Called by soc_card drivers, normally in their hw_params.
@@ -355,6 +364,10 @@ struct snd_soc_dai_ops {
 	u64 *auto_selectable_formats;
 	int num_auto_selectable_formats;
 
+	/* probe ordering - for components with runtime dependencies */
+	int probe_order;
+	int remove_order;
+
 	/* bit field */
 	unsigned int no_capture_mute:1;
 };
diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 0b8258b6bd8e..13693ef9c242 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -60,7 +60,7 @@ static bool soc_component_is_pcm(struct snd_soc_dai_link_component *dlc)
 	struct snd_soc_dai *dai = snd_soc_find_dai_with_mutex(dlc);
 
 	if (dai && (dai->component->driver->pcm_construct ||
-		    dai->driver->pcm_new))
+		    (dai->driver->ops && dai->driver->ops->pcm_new)))
 		return true;
 
 	return false;
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index a5b96c17633a..7dbf37e0ba2f 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2510,6 +2510,7 @@ struct snd_soc_dai *snd_soc_register_dai(struct snd_soc_component *component,
 {
 	struct device *dev = component->dev;
 	struct snd_soc_dai *dai;
+	struct snd_soc_dai_ops *ops; /* REMOVE ME */
 
 	lockdep_assert_held(&client_mutex);
 
@@ -2538,6 +2539,30 @@ struct snd_soc_dai *snd_soc_register_dai(struct snd_soc_component *component,
 	if (!dai->name)
 		return NULL;
 
+	/* REMOVE ME */
+	if (dai_drv->probe		||
+	    dai_drv->remove		||
+	    dai_drv->compress_new	||
+	    dai_drv->pcm_new		||
+	    dai_drv->probe_order	||
+	    dai_drv->remove_order) {
+
+		ops = devm_kzalloc(dev, sizeof(struct snd_soc_dai_ops), GFP_KERNEL);
+		if (!ops)
+			return NULL;
+		if (dai_drv->ops)
+			memcpy(ops, dai_drv->ops, sizeof(struct snd_soc_dai_ops));
+
+		ops->probe		= dai_drv->probe;
+		ops->remove		= dai_drv->remove;
+		ops->compress_new	= dai_drv->compress_new;
+		ops->pcm_new		= dai_drv->pcm_new;
+		ops->probe_order	= dai_drv->probe_order;
+		ops->remove_order	= dai_drv->remove_order;
+
+		dai_drv->ops = ops;
+	}
+
 	dai->component = component;
 	dai->dev = dev;
 	dai->driver = dai_drv;
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 73a97ac6ccb8..3f33f0630ad8 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -460,8 +460,9 @@ int snd_soc_dai_compress_new(struct snd_soc_dai *dai,
 			     struct snd_soc_pcm_runtime *rtd, int num)
 {
 	int ret = -ENOTSUPP;
-	if (dai->driver->compress_new)
-		ret = dai->driver->compress_new(rtd, num);
+	if (dai->driver->ops &&
+	    dai->driver->ops->compress_new)
+		ret = dai->driver->ops->compress_new(rtd, num);
 	return soc_dai_ret(dai, ret);
 }
 
@@ -545,19 +546,20 @@ int snd_soc_pcm_dai_probe(struct snd_soc_pcm_runtime *rtd, int order)
 	int i;
 
 	for_each_rtd_dais(rtd, i, dai) {
-		if (dai->driver->probe_order != order)
-			continue;
-
 		if (dai->probed)
 			continue;
 
-		if (dai->driver->probe) {
-			int ret = dai->driver->probe(dai);
+		if (dai->driver->ops) {
+			if (dai->driver->ops->probe_order != order)
+				continue;
 
-			if (ret < 0)
-				return soc_dai_ret(dai, ret);
-		}
+			if (dai->driver->ops->probe) {
+				int ret = dai->driver->ops->probe(dai);
 
+				if (ret < 0)
+					return soc_dai_ret(dai, ret);
+			}
+		}
 		dai->probed = 1;
 	}
 
@@ -570,16 +572,19 @@ int snd_soc_pcm_dai_remove(struct snd_soc_pcm_runtime *rtd, int order)
 	int i, r, ret = 0;
 
 	for_each_rtd_dais(rtd, i, dai) {
-		if (dai->driver->remove_order != order)
+		if (!dai->probed)
 			continue;
 
-		if (dai->probed &&
-		    dai->driver->remove) {
-			r = dai->driver->remove(dai);
-			if (r < 0)
-				ret = r; /* use last error */
-		}
+		if (dai->driver->ops) {
+			if (dai->driver->ops->remove_order != order)
+				continue;
 
+			if (dai->driver->ops->remove) {
+				r = dai->driver->ops->remove(dai);
+				if (r < 0)
+					ret = r; /* use last error */
+			}
+		}
 		dai->probed = 0;
 	}
 
@@ -592,8 +597,9 @@ int snd_soc_pcm_dai_new(struct snd_soc_pcm_runtime *rtd)
 	int i;
 
 	for_each_rtd_dais(rtd, i, dai) {
-		if (dai->driver->pcm_new) {
-			int ret = dai->driver->pcm_new(rtd, dai);
+		if (dai->driver->ops &&
+		    dai->driver->ops->pcm_new) {
+			int ret = dai->driver->ops->pcm_new(rtd, dai);
 			if (ret < 0)
 				return soc_dai_ret(dai, ret);
 		}
-- 
2.25.1

