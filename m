Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B02A95096AE
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Apr 2022 07:24:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AE4D1E77;
	Thu, 21 Apr 2022 07:23:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AE4D1E77
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650518641;
	bh=2LGDZvaviPLp3CmRtk9GH9Icx7MslL5upLJNG2b05bs=;
	h=From:Subject:To:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=t37v8OAf8/363vYOgaznn2vxO/s+7CiHU0BvazbvDBhlmXkkcjnBpTDH3J5GMxnTs
	 X+/OdzG6XIsp3hYms0IGGY6FFOYwTKoyvYUJgBQcbwqgsMmHBREEFMneY2nDb7Ao1v
	 n49804vBjTp0KSD3BfFb/PLuPw567cuwlUpby+I8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0786DF80511;
	Thu, 21 Apr 2022 04:56:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F281F8050F; Thu, 21 Apr 2022 04:56:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.9 required=5.0 tests=AC_FROM_MANY_DOTS, DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20722.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::722])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C28EF80507
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 04:56:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C28EF80507
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="pd1HMSc8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PzSXEBg5GHLVc0ICpCUV77y9z1AujcB4iqohWB44EfJD6272Xm9UDEpIGwcR4wKzXnX7u3VW/RNjSpf3Dha768FNnIueZslGfxJsTTJOz3PfyigW+czpvPZVjKDQD5Z59L5GKkDRgra6J4S4CfWf/+ky/Aw2koIArNiK+FLrhYq65alF1YmzYZOI8eCxaYKFH2/omfeLj1NsDCbC0YCfAx2GGQRIGKPh7uivlbjDNjRvntv9nLBXdZiF7DcVUkjb6TGA3spIFL3YUdAxBarODa2DgXg2s/RNOE6ElrqaEAVxNLANr+YbLl5hHrXiVsPi0lVyHB0/QQZ0x2O9H5/42A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bq2YOyJuCMQK2YvnL3ZpieBYN6kpQAEs4I0zbaILhGM=;
 b=OUuo+83P349yYPejoK/CBuFDwPpEPRs0jZCplGkirqjlE2+HH1ovuyZfGtbRWs42CDgg/oBW85/kNxLNhKQkDFjkpgvw5qM1XxDLhpu+TQmsC0bHsJgo6KF1Q/SWUBIojOOWGWX9JyAu2Y2YLRSs+c7fvkqaFPknfjyrXbLNv2LH8a2IIFMYeQBTKLcbj53YTjp4u0VU7nqmLbbF5AJuWqT8h3MBZIzFE3HX8uSnEA5dkUdeTHKTe2YpLXmDLC9SfmPSEx11H623CP9KTrI+L51uGuLVz7YV8CXAZ9jLKf+OvtvjUu2VHHovfzjMRc7IPgmx50gQF8VpCVs/mEtOxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bq2YOyJuCMQK2YvnL3ZpieBYN6kpQAEs4I0zbaILhGM=;
 b=pd1HMSc8g+xwIbJoQmNWvmo8wfBkq+tYfw6N5Z3p7aPkil4BCFYSbAQErh7hDOIdR+mk/4tauIrqVOJgh0SIA3My0Ys3Px22n2BcrvEJkfcW046MOAYCLm0L8U5EwpBAElqg+sEN7Ai7OpFcme5Zff2dwmWEKWShhkeCiIpHJoI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY2PR01MB2314.jpnprd01.prod.outlook.com (2603:1096:404:10::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.25; Thu, 21 Apr
 2022 02:55:59 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::697c:9b30:7de5:706f]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::697c:9b30:7de5:706f%5]) with mapi id 15.20.5186.014; Thu, 21 Apr 2022
 02:55:59 +0000
Message-ID: <87pmlbgn5t.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: rsnd: care return value from rsnd_node_fixed_index()
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 21 Apr 2022 02:55:58 +0000
X-ClientProxiedBy: TY2PR0101CA0023.apcprd01.prod.exchangelabs.com
 (2603:1096:404:92::35) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 055fa7c0-36d2-4502-e830-08da23427688
X-MS-TrafficTypeDiagnostic: TY2PR01MB2314:EE_
X-Microsoft-Antispam-PRVS: <TY2PR01MB23144157504C7835E1B73404D4F49@TY2PR01MB2314.jpnprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WJvIiJj16cRves3dReFnLZXa2KSTffgy39MP0jFSnPLVGJyVua7iqp/axf7PAftXWtKHF6OcBlgPOg43AOxHGKogsrmScGptCLVMQq2UypzS8meHlvacizMjQQFDh9zn9YfLsWilz1S7YAhsan+5TgujP+tVOxRYyrqsycv7iG0pgLbtvDCFFWiEO/h7hz8E66SxOAEabiFfKVEix/68YTNsgCH2af3GoXiZFIdk2SITcq1AVUkOJFKAE9n1CQ8OcsVeGhDPFa7pO1stW+147AbmV7Ev8x922PdDm/4IRcFY0QFkzGZIte6EgfNRxyb2hWYtnWkrXvpjPolFCGixQV4qE51oByQW1FbdXYhcVcsyFCSGHz8ER0Pb8XAvNco5awcbf+d3yKjPn11UkacRzvxnLgViiKVzosU+rPHr7s7aRKGHF36HlH8u7q/+gj8x0Af2RB//8NXD70AP2ciN1gh1mXwkWcnh5tVRzYGW/VOKr/gEltw2ldU77NkV92Y3ZWnqEjFXHiTwgYqKZWNqXd2Hs8lKyadQRGXzDiJcYcEKhni6iXVpw/E0goSB43nm/Mh6a+hxbduHfWEm/MftmlV5jo7H4iXpxr9eZ5Uw7VGd4JoAQNHdA8AuO1gY5+Gncw81qXS7eDVnuiWAHhMrpqFu9kvDrC8l5hvwN/P2JZOFeDExztKqSO9O6HbWpX85t9xuLutfQb2wUXxBBoR+Pg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(6512007)(508600001)(6486002)(4326008)(86362001)(52116002)(54906003)(38100700002)(38350700002)(6916009)(66556008)(316002)(66946007)(2616005)(8676002)(66476007)(26005)(83380400001)(36756003)(8936002)(2906002)(5660300002)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PlusyiQKcUqtl0Q8VE6c2BZGYKL54WL1kZRe7PKg8YRnMrdMZX3JHPX2vYEU?=
 =?us-ascii?Q?BdnW1MHdPF6PrB0iTr3HZOe6JOT7OVkWwWcHD5UAw/gkLAMVBIT9JDWXm8qB?=
 =?us-ascii?Q?LrOPEfz5y46oLxFcV/jWPEX97cA3vEjFUlGc0HWxHQAWDbIzgdWsSCv3uMo8?=
 =?us-ascii?Q?ymxFAYoj0sV/0LUmRcBp/pD4LTXRJB7MpwjhLMaDS3wZ0/UuzmiPCNlsw5lO?=
 =?us-ascii?Q?enJl6DC/b0pd4L+DMRI4pnutAFOzI1eY8DZ4Manp6YFpeWam8TE972v1etgk?=
 =?us-ascii?Q?MpGN4/LkzgXNKwdtBZFAkkWUJajebc9jAExl+QdTPMmX738TemwSHPeuF2rO?=
 =?us-ascii?Q?ExDiMbV85DQ0rA0+vMI+n9TrKw31azJz56nO+wRZf7xFLCsdL621gXFF3G63?=
 =?us-ascii?Q?0awBO4+Ne6vfwJxo8P8C95Tya6+B45XHSOsT3unGT2H2qlOjWDkiNR5C76PT?=
 =?us-ascii?Q?BNWcCkydciqi1SyKGODdP3rz19ddW1FyDFw7KUPhawBTPoqjU8d3vhFQ2Qxh?=
 =?us-ascii?Q?OdTSzL82hxLGgdtQ711AoAYfY8Axjns2gBu8UqU7VVR8/eAmuP/c0eysdYQJ?=
 =?us-ascii?Q?vWCGAuoTUO4UiARF0WfRFoW/gX4VAgMTh/fmYTUp04kwpozqelxnl+zXRYoH?=
 =?us-ascii?Q?LFzzcGYFpFOibO6SCZOPxIY42XsDNTx8sYQAL0zpCous3s9yocSp/vw4Vzhr?=
 =?us-ascii?Q?5l4rSfA4LrbmanevUX+0klsd4w+umR5ZE/+uxRUUoHWGHZhi9ijXev+45fOT?=
 =?us-ascii?Q?mH55CFe9vvP4K9W4dJNNMyMYLOwsaABLGJeqaYZOZtnu7WNbdBbUrvXkAQYR?=
 =?us-ascii?Q?+oE8UZ79QbEVd0ns7seYfSeT9Fcc4BVssLqC6dgRotgN12EWoSaKSBdhMxB+?=
 =?us-ascii?Q?ulB/+TBa6qD8NC+EVJXLGqYPtbt6gXPyNlGiOL7WepnS6wNzEOr9Kut0TuSW?=
 =?us-ascii?Q?q1d91tYhH7QupLSkXODgj3Iv+fnSAEzsoY8kcbTCvsvhLx59xIxmoV5239fP?=
 =?us-ascii?Q?GIc58QxRaleaq/XUW1/COXYz3jFRzMj/b6eb/SWXsZkRNj3Pu0L88OxcVD5d?=
 =?us-ascii?Q?gWHhlHvyqizAOGFEgoZVZEyaHDhmMu3c8penNu2u4E7s7CdqthyRpDs3Foeh?=
 =?us-ascii?Q?q1YU32l1Kn+qgbvSlpvsoImcdc9XVgE7wAB0XM05vHAYUtoQv0Mw0Lq4QSMS?=
 =?us-ascii?Q?BjGMSOg4tlcm5HyJdLn01MJDCj91h/iC+qh0gVg7q/XtymX6abgfo/QtU+av?=
 =?us-ascii?Q?4rdu1//vvCjE3crzNCAfsqKzzerU5b2dUr19DPWW7Ai4ylN9m+tONDCG46HZ?=
 =?us-ascii?Q?0u1TKl0nTAsdqW4NK5z8vdpHyx9xDOCE00XLkXR2/qHIvibkIqfWWk184XD8?=
 =?us-ascii?Q?Bkazd2vsanalYxp0TFZLMbTJ/kRB5UOkR5625xbOoARZr658tifAUwOfistM?=
 =?us-ascii?Q?5eZs2dLDaKSROBEPt+s2xVwIU1jLdbi0rEMCN8eJ+7+pM9G6gEG2KE+RZH6J?=
 =?us-ascii?Q?x9Ow8TUtrrng1t1SJTG03nDe5FThJcga45OJmHbV/X5MMEQCxbo96WQVaEXw?=
 =?us-ascii?Q?F//VKufVV4A3pjaUyzvH1pc2JzvlTplhepXR9p3tlTZY8VFs4aoAsqR8CgTB?=
 =?us-ascii?Q?1WsSOcbk6gj8W9eyM82CgTzCrsSi7aKJ/YrUZj6RlEcSmAo1ebqgvowiSOpA?=
 =?us-ascii?Q?Ky0K8Q/dS/5cP3KPkwORuy78Xwgkb4d1RFfDHYF66v5gyC3PhP5VTObtdJee?=
 =?us-ascii?Q?PMy4VMVWFnwBYGY8QLotOcJdggtsBOTsp4nqH0j7NmBP5xhK2eSi?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 055fa7c0-36d2-4502-e830-08da23427688
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 02:55:59.0937 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ncK4K2Dw1CUkZ+3xwjfdZSu1/X6iV4APiiI6O+/u6FwNeHInfplUrL59HKiOEe09uSxocb/OdC0ScnOWfx6xQkrupJCeZgWsptfFPYlxVplcoOqxMqHKp2m8Yz8Bfp44
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB2314
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Dan Carpenter <dan.carpenter@oracle.com>
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

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Renesas Sound is very complex, and thus it needs to use
rsnd_node_fixed_index() to know enabled pin index.

It returns error if strange pin was selected,
but some codes didn't check it.

This patch 1) indicates error message, 2) check return
value.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sh/rcar/core.c | 15 ++++++++++-----
 sound/soc/sh/rcar/dma.c  |  9 ++++++++-
 sound/soc/sh/rcar/rsnd.h |  2 +-
 sound/soc/sh/rcar/src.c  |  7 ++++++-
 sound/soc/sh/rcar/ssi.c  | 14 ++++++++++++--
 sound/soc/sh/rcar/ssiu.c |  7 ++++++-
 6 files changed, 43 insertions(+), 11 deletions(-)

diff --git a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
index 0c435bff3670..eb762ab94d3e 100644
--- a/sound/soc/sh/rcar/core.c
+++ b/sound/soc/sh/rcar/core.c
@@ -1159,6 +1159,7 @@ void rsnd_parse_connect_common(struct rsnd_dai *rdai, char *name,
 		struct device_node *capture)
 {
 	struct rsnd_priv *priv = rsnd_rdai_to_priv(rdai);
+	struct device *dev = rsnd_priv_to_dev(priv);
 	struct device_node *np;
 	int i;
 
@@ -1169,7 +1170,11 @@ void rsnd_parse_connect_common(struct rsnd_dai *rdai, char *name,
 	for_each_child_of_node(node, np) {
 		struct rsnd_mod *mod;
 
-		i = rsnd_node_fixed_index(np, name, i);
+		i = rsnd_node_fixed_index(dev, np, name, i);
+		if (i < 0) {
+			of_node_put(np);
+			break;
+		}
 
 		mod = mod_get(priv, i);
 
@@ -1183,7 +1188,7 @@ void rsnd_parse_connect_common(struct rsnd_dai *rdai, char *name,
 	of_node_put(node);
 }
 
-int rsnd_node_fixed_index(struct device_node *node, char *name, int idx)
+int rsnd_node_fixed_index(struct device *dev, struct device_node *node, char *name, int idx)
 {
 	char node_name[16];
 
@@ -1210,6 +1215,8 @@ int rsnd_node_fixed_index(struct device_node *node, char *name, int idx)
 			return idx;
 	}
 
+	dev_err(dev, "strange node numbering (%s)",
+		of_node_full_name(node));
 	return -EINVAL;
 }
 
@@ -1221,10 +1228,8 @@ int rsnd_node_count(struct rsnd_priv *priv, struct device_node *node, char *name
 
 	i = 0;
 	for_each_child_of_node(node, np) {
-		i = rsnd_node_fixed_index(np, name, i);
+		i = rsnd_node_fixed_index(dev, np, name, i);
 		if (i < 0) {
-			dev_err(dev, "strange node numbering (%s)",
-				of_node_full_name(node));
 			of_node_put(np);
 			return 0;
 		}
diff --git a/sound/soc/sh/rcar/dma.c b/sound/soc/sh/rcar/dma.c
index 03e0d4eca781..463ab237d7bd 100644
--- a/sound/soc/sh/rcar/dma.c
+++ b/sound/soc/sh/rcar/dma.c
@@ -240,12 +240,19 @@ static int rsnd_dmaen_start(struct rsnd_mod *mod,
 struct dma_chan *rsnd_dma_request_channel(struct device_node *of_node, char *name,
 					  struct rsnd_mod *mod, char *x)
 {
+	struct rsnd_priv *priv = rsnd_mod_to_priv(mod);
+	struct device *dev = rsnd_priv_to_dev(priv);
 	struct dma_chan *chan = NULL;
 	struct device_node *np;
 	int i = 0;
 
 	for_each_child_of_node(of_node, np) {
-		i = rsnd_node_fixed_index(np, name, i);
+		i = rsnd_node_fixed_index(dev, np, name, i);
+		if (i < 0) {
+			chan = NULL;
+			of_node_put(np);
+			break;
+		}
 
 		if (i == rsnd_mod_id_raw(mod) && (!chan))
 			chan = of_dma_request_slave_channel(np, x);
diff --git a/sound/soc/sh/rcar/rsnd.h b/sound/soc/sh/rcar/rsnd.h
index 6580bab0e229..d9cd190d7e19 100644
--- a/sound/soc/sh/rcar/rsnd.h
+++ b/sound/soc/sh/rcar/rsnd.h
@@ -460,7 +460,7 @@ void rsnd_parse_connect_common(struct rsnd_dai *rdai, char *name,
 		struct device_node *playback,
 		struct device_node *capture);
 int rsnd_node_count(struct rsnd_priv *priv, struct device_node *node, char *name);
-int rsnd_node_fixed_index(struct device_node *node, char *name, int idx);
+int rsnd_node_fixed_index(struct device *dev, struct device_node *node, char *name, int idx);
 
 int rsnd_channel_normalization(int chan);
 #define rsnd_runtime_channel_original(io) \
diff --git a/sound/soc/sh/rcar/src.c b/sound/soc/sh/rcar/src.c
index 42a100c6303d..0ea84ae57c6a 100644
--- a/sound/soc/sh/rcar/src.c
+++ b/sound/soc/sh/rcar/src.c
@@ -676,7 +676,12 @@ int rsnd_src_probe(struct rsnd_priv *priv)
 		if (!of_device_is_available(np))
 			goto skip;
 
-		i = rsnd_node_fixed_index(np, SRC_NAME, i);
+		i = rsnd_node_fixed_index(dev, np, SRC_NAME, i);
+		if (i < 0) {
+			ret = -EINVAL;
+			of_node_put(np);
+			goto rsnd_src_probe_done;
+		}
 
 		src = rsnd_src_get(priv, i);
 
diff --git a/sound/soc/sh/rcar/ssi.c b/sound/soc/sh/rcar/ssi.c
index 87e606f688d3..43c5e27dc5c8 100644
--- a/sound/soc/sh/rcar/ssi.c
+++ b/sound/soc/sh/rcar/ssi.c
@@ -1105,6 +1105,7 @@ void rsnd_parse_connect_ssi(struct rsnd_dai *rdai,
 			    struct device_node *capture)
 {
 	struct rsnd_priv *priv = rsnd_rdai_to_priv(rdai);
+	struct device *dev = rsnd_priv_to_dev(priv);
 	struct device_node *node;
 	struct device_node *np;
 	int i;
@@ -1117,7 +1118,11 @@ void rsnd_parse_connect_ssi(struct rsnd_dai *rdai,
 	for_each_child_of_node(node, np) {
 		struct rsnd_mod *mod;
 
-		i = rsnd_node_fixed_index(np, SSI_NAME, i);
+		i = rsnd_node_fixed_index(dev, np, SSI_NAME, i);
+		if (i < 0) {
+			of_node_put(np);
+			break;
+		}
 
 		mod = rsnd_ssi_mod_get(priv, i);
 
@@ -1182,7 +1187,12 @@ int rsnd_ssi_probe(struct rsnd_priv *priv)
 		if (!of_device_is_available(np))
 			goto skip;
 
-		i = rsnd_node_fixed_index(np, SSI_NAME, i);
+		i = rsnd_node_fixed_index(dev, np, SSI_NAME, i);
+		if (i < 0) {
+			ret = -EINVAL;
+			of_node_put(np);
+			goto rsnd_ssi_probe_done;
+		}
 
 		ssi = rsnd_ssi_get(priv, i);
 
diff --git a/sound/soc/sh/rcar/ssiu.c b/sound/soc/sh/rcar/ssiu.c
index 138f95dd9f4a..4b8a63e336c7 100644
--- a/sound/soc/sh/rcar/ssiu.c
+++ b/sound/soc/sh/rcar/ssiu.c
@@ -462,6 +462,7 @@ void rsnd_parse_connect_ssiu(struct rsnd_dai *rdai,
 			     struct device_node *capture)
 {
 	struct rsnd_priv *priv = rsnd_rdai_to_priv(rdai);
+	struct device *dev = rsnd_priv_to_dev(priv);
 	struct device_node *node = rsnd_ssiu_of_node(priv);
 	struct rsnd_dai_stream *io_p = &rdai->playback;
 	struct rsnd_dai_stream *io_c = &rdai->capture;
@@ -474,7 +475,11 @@ void rsnd_parse_connect_ssiu(struct rsnd_dai *rdai,
 		for_each_child_of_node(node, np) {
 			struct rsnd_mod *mod;
 
-			i = rsnd_node_fixed_index(np, SSIU_NAME, i);
+			i = rsnd_node_fixed_index(dev, np, SSIU_NAME, i);
+			if (i < 0) {
+				of_node_put(np);
+				break;
+			}
 
 			mod = rsnd_ssiu_mod_get(priv, i);
 
-- 
2.25.1

