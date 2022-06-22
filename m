Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B5555427F
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 07:55:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34E8D1F9C;
	Wed, 22 Jun 2022 07:54:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34E8D1F9C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655877338;
	bh=6Wtg2LRQ81DKVTTbII1d3up0hJJzMRKoZrOFLCl2NAc=;
	h=From:Subject:To:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EhcmdEstj5keA9RM71HJcwwq+pLVa2S6adk2vHWm2QlSixrQp0SjQehZ4ZCeRT0kN
	 y/PTLqU/4IIBunfT20kHgsNpc9CT3RJepR1xiPprYqCYxozVJsGnzM1vihQ/PLjLnp
	 X+IsB6cWhep3uAUKe/NASUw9eO9HpFX80mgW4Cao=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6D31F8053B;
	Wed, 22 Jun 2022 07:54:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5B22F8032D; Wed, 22 Jun 2022 07:54:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2106.outbound.protection.outlook.com [40.107.114.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5E7CF8032D
 for <alsa-devel@alsa-project.org>; Wed, 22 Jun 2022 07:54:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5E7CF8032D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="DsyOkHqY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UH5fRx3BOXMc3uo68e3zKUvcjBzvDIO3T1lKECo1WP8PzCcNW83aZipS9JrsXG7svgv6wH7p6ne4Ptl24fnZ8VrY4V3xv19yLy0bp1vnJiSV5TisKZUMSuzzy7FgZBsYdcs523VyQ+m/LZcqCRb2FV5Ld4uDduveeBh2QYmfPbXzvcyeXHHkX7la4AKS0ENSpirzEWP54vMvqG3cZZUHwK80nVXhhMczmrYMUQI4P/uzD7SUjOPPpGUnRvz/KU7szg+AXMkewiKcxAb39Osj7/3pykFYqYQpVPAxxhISZJiYZrOICweu29M/Ouf4p4+t6Ps6g5vsM0Cz6Wk8m/oEOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VeHLM2A1Xmp9aBcetBE7qKm5637yaHpzH5/6L8fiH3s=;
 b=ldP8X/KBhwBBynjID76fTdTP9UElY0cel1EXmVz4PmNpQxnvyt7lRb3TK10QI91NBAc29vTUQ/BlwcXRasB8a2mt4BwSduAx+Pgj0MORt+YK4Ht/z/EzQPghYn5nQtSihszvaA6l0hpnsRQLkQ66PhuhSMt/oUpivzirSabKiQrUHjfyNP6281xrszdX+Chco7ke1JSVNyxUnkLMBwdQHNP0iZ9Si1w3R07TjB0jPoaBV0ayKBiKZrI1IVU+R2tdulZV164uIamNF6iQz2eXZvbyUMeyCL+qhto8xBYVHP0IWzP9KBqWz++vdq5/+GRzD4bTs0nE8RUsgzBVaASs1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VeHLM2A1Xmp9aBcetBE7qKm5637yaHpzH5/6L8fiH3s=;
 b=DsyOkHqYEt5ViljQeN5iiUXHO/pRIcCabpIfDrut2gRu7LOfhG0qxGT56TAUps1RhoVIAkBPsrasMY7++APDwm2gi6IcHNnXKx/p+EApc8beZFqu7xYH4zEkPeU5qKudrLH/T3AB5sbYcuFcIYsCmsscVE70J38eVHdpOZ0qv+c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB8838.jpnprd01.prod.outlook.com (2603:1096:400:17c::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Wed, 22 Jun
 2022 05:54:14 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d5d9:3646:37df:867c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d5d9:3646:37df:867c%8]) with mapi id 15.20.5373.015; Wed, 22 Jun 2022
 05:54:14 +0000
Message-ID: <87y1xpp7ju.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/2] ASoC: soc-core.c: share code for
 snd_soc_of_get_dai_link_cpus/codecs()
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <871qvhqm56.wl-kuninori.morimoto.gx@renesas.com>
References: <871qvhqm56.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 22 Jun 2022 05:54:13 +0000
X-ClientProxiedBy: TYCP286CA0008.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::15) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab5165f1-477a-43ea-4e21-08da5413a2db
X-MS-TrafficTypeDiagnostic: TYWPR01MB8838:EE_
X-Microsoft-Antispam-PRVS: <TYWPR01MB8838616495C197C4B7E5CBD7D4B29@TYWPR01MB8838.jpnprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ur4gtsxL37HxcgXEN/9rhonSHRK2yu8silMT/I7Y0rmjIAyEUXqMg4AUHzBD+j6VKykgBy3jJhEc0f8BZJhr814NYHvM+mxU3rbXobksikYocb7QxStwf4W+5/fnntLjePn08UvSdqRiF7FiHKdEmtLEL9/ky4yvlJQ/dGHf4GNxYdxvKsZ998mMqA/EAoc+TXCVBSoCY/LVylscdP9Fs0WCvtZTfN4E6v4axfArd3H5QmLfJfn8Az64d4Wlb0Vbd8UMyNLHBIPpCeM0j5FFgdQoLGLfpcwennKOVBn884TYTNHTk73MHarvNWN8UHvGRjGgq1uArKvXNgmbbO0DBPul3RoiozC2YKAyw29U8GeLsuSy9AfvoMB9Y5PoXs38B66ZBJ66uu6/ftT09E7W3Jke7oqPMkIiVApLc4j3AYCm9/FxU60VUuqKw3hpYSExvOqeNtuh3uRmnOf0rta8gnwLNM8hh3LkdwvFOu2y/+qcwNwuiKs9ms80P8VOmxmgej4R74hP6RHW+cbixdFJxPBfIEF34FA401cjf8SSz7wjz19/VIldA6x7kthxUIiOA+8bsdDDodY2AewvHOkByUM05ZnnU3zwDi52TfcRvNCSvRU/ly2gl3tKruBjKz9rkd7I8ZJHGyvFP+sP3MfyqDtM8jMGf/KXIU7I1ypSD3v5khkFKeUG4BTM0yr73rF6+furSwhxkExG1TVJkKICO61zQhl/XYfBgvxoRuROM1B3lJ5h+iz5SndoAU1Db8X64bN3Pxl6q1N8x2b80cIatW3pPX+7iq6VESvbdzj9/vM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(396003)(376002)(136003)(346002)(366004)(8936002)(6506007)(52116002)(26005)(5660300002)(6512007)(478600001)(6486002)(83380400001)(41300700001)(2906002)(6916009)(2616005)(54906003)(38100700002)(86362001)(316002)(186003)(4326008)(36756003)(66556008)(38350700002)(66476007)(66946007)(8676002)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?K5Vtjg1QAVSOMT8V+f5RXeIb7DnL7HirHEExEzbMmHCbR7iIQAFrmHIb9+4I?=
 =?us-ascii?Q?JTsHbsXFyTNaSaBwp0cILDOjdRdExUGjBaZIqq/47zc/3QiGexWQ/HdKhnCi?=
 =?us-ascii?Q?3W40chwu9wxrEMtde7EeTfrHIvlk5lPDk8DX677cUsUzc0OFaa7+5SjUSe0D?=
 =?us-ascii?Q?FKHd6sjrPnm0nPEns6Kxha2/LWZygdO1i/jaKBC7CO00KsDr/OsaIniPhTq/?=
 =?us-ascii?Q?idN5WjBrcqGXvtDkjNhUR+tSF3CxpbdMHsiIRlHoEn/hDHYsGJP167OACt/E?=
 =?us-ascii?Q?OHPAwUPYsfbnqwGHLCpWnXPGh7sCgDsf7RrWJanoaPox9RhojpNjQYA3jAIW?=
 =?us-ascii?Q?9imw5+OSYXvoRPC8wwNMfusMSSBGCjAaB25BSnja5Vi+zHVN/vbDWLunvymG?=
 =?us-ascii?Q?qo8VRkJEIe4dUr/azgaTxdCMSkOrKHo79GsX+7S4xK57Qy3xoElfGImAtB9V?=
 =?us-ascii?Q?OCLf748ryiro5qkImVAOvi8DnFKX41PyaFea/h50og8FgynNG6mQvzV01u20?=
 =?us-ascii?Q?r7SnUnSMCIiPH+lEMEF0RJwmF/FrB7aAucNpgld0PgZ2ESM7hYtRr7zvNtuA?=
 =?us-ascii?Q?O6gI0ahrCUyvng+3lL7kGbRh8s1iqCkj45EZdDqnCR5xxSvAK+n34ix4xF4Z?=
 =?us-ascii?Q?93ZnuLfmVhap6F04bMKZGQY5suBy10g5EdwMmHvvtLRhaTuH3uazJbc8to9v?=
 =?us-ascii?Q?ibzwwy2+KJpNQIid++5iD1Z6RfBy2zXHIr+rjAoYZNbr/7mQky+J9ODRCuF9?=
 =?us-ascii?Q?9aU3yScYukvX8S20zBNxS4MqrdD7d59qSE4KKBGpnMGr5dph0AA2+HKMcwFh?=
 =?us-ascii?Q?jtASPj6r1DkxfTYWTYONNBZlY06JyuLOJJzsVl4U/CEGtL3CbZJTfnOg0nN1?=
 =?us-ascii?Q?qoRR3ZeXkcXoBxxhddvuib7cgUBj/tWkU0+lFMLKNpZM78IrIy0rt+5rElg7?=
 =?us-ascii?Q?OfecNiuoizLOwZ3hNR4erCySRWzuUWrgHPXCGu/WmCioMZ6Lu/ByB/+VW9hY?=
 =?us-ascii?Q?m4rZSF8twztQTVF6H0KpHuVdtG649fteZrVTqhCL3lyrNu1VYsSA4MTG8Oyi?=
 =?us-ascii?Q?xq5PrDsaUkIC6RnKyxhb3mEzdHauoK4JY62NcS/h8kt6AIcLuhV1RQ6U+WQh?=
 =?us-ascii?Q?gDPDLFwtusNDnbeUJspPWVqK2HE/dWv87mb1OJnr+FEAs5+EbG0We1nLOKhg?=
 =?us-ascii?Q?bL3lbTMF4l+SJLFvQ4vk/AFFuoY4Izzs9aJiavvQqNK+Fvn5fgu3imm6ErRo?=
 =?us-ascii?Q?YDjz35nK7fRzEEnz/GgrHQMEyntNqh/LZSNWfxuCIkXRSb4oUy8/xKRWP5ei?=
 =?us-ascii?Q?4JdaBTLjpWNmGKaoQQZs2JnfH7wOXg9fRulYBDWdVXmBNq/OQ9CHjH/VwRbk?=
 =?us-ascii?Q?GQlMCRcY32kjRcy3Ptq0CF1I5HWFps1ClqMw+tSu1MFH6wJo+/z4YftaGbcN?=
 =?us-ascii?Q?cJRVS8zrE3UgJcZdCefywrV4W/c0aAmtblh13s+lpt8R4lKgg6jevyRxwan8?=
 =?us-ascii?Q?HstyoPzn3Df4QMC/0AefvUKqrfAdW20sPd/khjzt0HcPnB2Tqz9qB2pKN3pm?=
 =?us-ascii?Q?uza6xyRwJoz+TnAFUGFKxxQ2MANw0SBZwOCohBY641n2Tigr5CAgHOrvbJQp?=
 =?us-ascii?Q?dSi30qaSnFL91FX/BU5esQpNR5aMyHax4/xxdgP2Jeypz8Q00iextZb7gl24?=
 =?us-ascii?Q?AWCNMnvhIQHPmnKAv5dmcZF/WiHtvdMotpckU22ShtzxFQ3EWa+JhOpC+v1M?=
 =?us-ascii?Q?Z60FGhG/dDZlR72b3WHsaV+JU700xJOLtO2bAFXPND0NG3qZrCxp?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab5165f1-477a-43ea-4e21-08da5413a2db
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 05:54:14.1145 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uubh/Kck09cU/u1jnM1YiOZYdSl0x+CONR5fy1vxdZHRB1Y15C3qqYN5Wwc7pr4qjnArWl6VrBFG301lZWc56dfc2F89y2oarPJBP+QJxznLosq1Rs8RkCyummzOC8pN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8838
Cc: Martin =?ISO-8859-2?Q?Povi?= =?ISO-8859-2?Q?=B9er?=
 <povik+lin@cutebit.org>, Linux-ALSA <alsa-devel@alsa-project.org>
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

ASoC has snd_soc_of_get_dai_link_cpus/codecs(), and these are almost same
code. The main difference are below.

	for_each_link_cpus()	dai_link->cpus		dai_link->num_cpus
	for_each_link_codecs()	dai_link->codecs	dai_link->num_codecs

Because we need to use these parameters, we can't share full-code for now,
but can share some codes.
This patch adds __snd_soc_of_get/put_xxx() functions, and share the code.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-core.c | 140 ++++++++++++++++++++++---------------------
 1 file changed, 72 insertions(+), 68 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 669e4164d167..5d5805e43240 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -3305,6 +3305,61 @@ int snd_soc_of_get_dai_name(struct device_node *of_node,
 }
 EXPORT_SYMBOL_GPL(snd_soc_of_get_dai_name);
 
+static void __snd_soc_of_put_component(struct snd_soc_dai_link_component *component)
+{
+	if (component->of_node) {
+		of_node_put(component->of_node);
+		component->of_node = NULL;
+	}
+}
+
+static int __snd_soc_of_get_dai_link_component_alloc(
+	struct device *dev, struct device_node *of_node,
+	struct snd_soc_dai_link_component **ret_component,
+	int *ret_num)
+{
+	struct snd_soc_dai_link_component *component;
+	int num;
+
+	/* Count the number of CPUs/CODECs */
+	num = of_count_phandle_with_args(of_node, "sound-dai", "#sound-dai-cells");
+	if (num <= 0) {
+		if (num == -ENOENT)
+			dev_err(dev, "No 'sound-dai' property\n");
+		else
+			dev_err(dev, "Bad phandle in 'sound-dai'\n");
+		return num;
+	}
+	component = devm_kcalloc(dev, num, sizeof(*component), GFP_KERNEL);
+	if (!component)
+		return -ENOMEM;
+
+	*ret_component	= component;
+	*ret_num	= num;
+
+	return 0;
+}
+
+static int __snd_soc_of_get_dai_link_component_parse(
+	struct device_node *of_node,
+	struct snd_soc_dai_link_component *component, int index)
+{
+	struct of_phandle_args args;
+	int ret;
+
+	ret = of_parse_phandle_with_args(of_node, "sound-dai", "#sound-dai-cells",
+					 index, &args);
+	if (ret)
+		return ret;
+
+	ret = snd_soc_get_dai_name(&args, &component->dai_name);
+	if (ret < 0)
+		return ret;
+
+	component->of_node = args.np;
+	return 0;
+}
+
 /*
  * snd_soc_of_put_dai_link_codecs - Dereference device nodes in the codecs array
  * @dai_link: DAI link
@@ -3316,12 +3371,8 @@ void snd_soc_of_put_dai_link_codecs(struct snd_soc_dai_link *dai_link)
 	struct snd_soc_dai_link_component *component;
 	int index;
 
-	for_each_link_codecs(dai_link, index, component) {
-		if (!component->of_node)
-			break;
-		of_node_put(component->of_node);
-		component->of_node = NULL;
-	}
+	for_each_link_codecs(dai_link, index, component)
+		__snd_soc_of_put_component(component);
 }
 EXPORT_SYMBOL_GPL(snd_soc_of_put_dai_link_codecs);
 
@@ -3343,41 +3394,19 @@ int snd_soc_of_get_dai_link_codecs(struct device *dev,
 				   struct device_node *of_node,
 				   struct snd_soc_dai_link *dai_link)
 {
-	struct of_phandle_args args;
 	struct snd_soc_dai_link_component *component;
-	char *name;
-	int index, num_codecs, ret;
-
-	/* Count the number of CODECs */
-	name = "sound-dai";
-	num_codecs = of_count_phandle_with_args(of_node, name,
-						"#sound-dai-cells");
-	if (num_codecs <= 0) {
-		if (num_codecs == -ENOENT)
-			dev_err(dev, "No 'sound-dai' property\n");
-		else
-			dev_err(dev, "Bad phandle in 'sound-dai'\n");
-		return num_codecs;
-	}
-	component = devm_kcalloc(dev,
-				 num_codecs, sizeof(*component),
-				 GFP_KERNEL);
-	if (!component)
-		return -ENOMEM;
-	dai_link->codecs = component;
-	dai_link->num_codecs = num_codecs;
+	int index, ret;
+
+	ret = __snd_soc_of_get_dai_link_component_alloc(dev, of_node,
+					 &dai_link->codecs, &dai_link->num_codecs);
+	if (ret < 0)
+		return ret;
 
 	/* Parse the list */
 	for_each_link_codecs(dai_link, index, component) {
-		ret = of_parse_phandle_with_args(of_node, name,
-						 "#sound-dai-cells",
-						 index, &args);
+		ret = __snd_soc_of_get_dai_link_component_parse(of_node, component, index);
 		if (ret)
 			goto err;
-		component->of_node = args.np;
-		ret = snd_soc_get_dai_name(&args, &component->dai_name);
-		if (ret < 0)
-			goto err;
 	}
 	return 0;
 err:
@@ -3399,12 +3428,8 @@ void snd_soc_of_put_dai_link_cpus(struct snd_soc_dai_link *dai_link)
 	struct snd_soc_dai_link_component *component;
 	int index;
 
-	for_each_link_cpus(dai_link, index, component) {
-		if (!component->of_node)
-			break;
-		of_node_put(component->of_node);
-		component->of_node = NULL;
-	}
+	for_each_link_cpus(dai_link, index, component)
+		__snd_soc_of_put_component(component);
 }
 EXPORT_SYMBOL_GPL(snd_soc_of_put_dai_link_cpus);
 
@@ -3423,41 +3448,20 @@ int snd_soc_of_get_dai_link_cpus(struct device *dev,
 				 struct device_node *of_node,
 				 struct snd_soc_dai_link *dai_link)
 {
-	struct of_phandle_args args;
 	struct snd_soc_dai_link_component *component;
-	char *name;
-	int index, num_cpus, ret;
+	int index, ret;
 
 	/* Count the number of CPUs */
-	name = "sound-dai";
-	num_cpus = of_count_phandle_with_args(of_node, name,
-						"#sound-dai-cells");
-	if (num_cpus <= 0) {
-		if (num_cpus == -ENOENT)
-			dev_err(dev, "No 'sound-dai' property\n");
-		else
-			dev_err(dev, "Bad phandle in 'sound-dai'\n");
-		return num_cpus;
-	}
-	component = devm_kcalloc(dev,
-				 num_cpus, sizeof(*component),
-				 GFP_KERNEL);
-	if (!component)
-		return -ENOMEM;
-	dai_link->cpus = component;
-	dai_link->num_cpus = num_cpus;
+	ret = __snd_soc_of_get_dai_link_component_alloc(dev, of_node,
+					 &dai_link->cpus, &dai_link->num_cpus);
+	if (ret < 0)
+		return ret;
 
 	/* Parse the list */
 	for_each_link_cpus(dai_link, index, component) {
-		ret = of_parse_phandle_with_args(of_node, name,
-						 "#sound-dai-cells",
-						 index, &args);
+		ret = __snd_soc_of_get_dai_link_component_parse(of_node, component, index);
 		if (ret)
 			goto err;
-		component->of_node = args.np;
-		ret = snd_soc_get_dai_name(&args, &component->dai_name);
-		if (ret < 0)
-			goto err;
 	}
 	return 0;
 err:
-- 
2.25.1

