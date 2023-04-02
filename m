Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0B36D3ADD
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Apr 2023 00:57:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 291D21FB;
	Mon,  3 Apr 2023 00:57:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 291D21FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680476271;
	bh=UxjY8x1VQkyB2j1UhIYp8Uzt8E5PSd09pYpIMizstso=;
	h=From:Subject:To:In-Reply-To:References:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BMyCLXk9X63gbbSddBu5duvHKohI1ba+5BHfw3CUghrsGBQ9cFnR2OS4NWItEIW2q
	 0tCNn+ZxoyteRO0N5SjbGaPTubxo9HVF0afES0ybdHQoWQnDyjbmJ60gdnaFdK8zBZ
	 mM5SpTX6WXTnzsmcGUIuNMEjkiSQt6ELAEIcRi7E=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F371DF801C0;
	Mon,  3 Apr 2023 00:56:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69CFAF80423; Mon,  3 Apr 2023 00:45:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20709.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::709])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8969DF8026D
	for <alsa-devel@alsa-project.org>; Mon,  3 Apr 2023 00:41:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8969DF8026D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=MhfdNYcm
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IxjXzHZnVPKThUK+fE0wpU3j8PteUy4sBmom3rW9AIOqMfirJK1GTFTLya1XCYXXyGgXSpV4lnBqhr0Wf9UQm5h55mWlBSxu3/dliMHHsWvRCrnZaK+RV2W9VLBG3w5d+EPGJZfoK0uiHGNqnn+uThQIQ5KU9ZLmhbUS5X6tDXpmJhoFyP+KMFte7DsGgxKksR2JHuhSBR1BcbtBsRvdVzeXevQ5U4r2XukMI3addclB2JqdlCsiEecPqWQG+KGvQpAdKom3jqJ+TWtJSUYBllyp26BOtLV7mPgfS/PAKn3BUFUbx4WcA36J2uwL4zbKmPuGmjGkPQ9LzTBfpW1r7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kn1ZUuw5kuLdSEvuEhdy1io1AmGNL1peCympUMtKXOA=;
 b=CMbheDGDqqLPs1/nUTRQeczZmKHrCcRMig64rD2xDcq2Z9cHY27K8P3TrFp+kftbr3JxCeGICLFkjK+jX0HPLp8vkR4qj0oAkgdbE8tfg/awVRYGNv85CtgvsgmXdD50AkFFnkh3JiFx7GkcbnCMSS94o3tIz4JqC/sDPCXeyVMvRfgGqho7sZJypDdv+1dxLld3mrX1cRmLh9NSXudzulp9K+LMdVftdY6+ZN0uGJM1C3iNh5nNMfTMKInXqW0wxZmeMLyStlzmkYGB0dkf/QXz6sDDrhvVy/VbrdFNLy9PJAi+1hYt52d6kCmhMHkqb31Ap5HcYx76UDWudgfUMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kn1ZUuw5kuLdSEvuEhdy1io1AmGNL1peCympUMtKXOA=;
 b=MhfdNYcmhbDx84ZBcchI25MQ+NfEeiBPvFQkNa/SkVSco5QsW3H4zhI+dvOyweVU+A/mMx7Xrr39neMqD5ZKLya+WSadrWVmJ30nQxPEYknW5BLiJTXrXum3nFwtlzLEsao6/t/D7X559vu2L7+cN3wb0wLVsDvDEJ6+nNpC5sg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB11431.jpnprd01.prod.outlook.com (2603:1096:400:377::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Sun, 2 Apr
 2023 22:41:54 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1%4]) with mapi id 15.20.6254.033; Sun, 2 Apr 2023
 22:41:54 +0000
Message-ID: <87v8idc3f1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH resend 3/5] ASoC: meson: switch to use c2c_params instead of
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87zg7pc3fr.wl-kuninori.morimoto.gx@renesas.com>
References: <87zg7pc3fr.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Sun, 2 Apr 2023 22:41:54 +0000
X-ClientProxiedBy: TYCP286CA0263.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::11) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB11431:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f3f46c2-af33-4da4-baf0-08db33cb7587
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3yNjcjrOXOV8Lf+kHxze5SpZXtN9yxX51AxaNDeye1qEMV/CZcnLb/VQqJt9UPAIzBlLY7u4xZejT+Bg6s/HaWAjJ8qZwPu//MyjqsZyvZJrH5NC36fIOzAx4q6buldbCfvovQ3XUVMlnc1TgOouzXB2iamdQDIjTL9RuaU3FP10b/PWW9F5uWQ8mE3jBfcekNI/bjApretr4mZcGOe9vHihIrXqSSXiOFF3ANX72xub1kUj0SkX64/pPjvgEQCZWJWQt28yC+XVvPtUW/Z8WRpUjS5SID/wA79gHhTz6v79Y3I941g3ON+9px6aKowbpbPC6jbTgw0YpqkY0VPjUMArzyuqqvcGvjkVlVfWcwZWJg46qhfSL4YKtEI6jdQlrIKpkYsaqfLOa4z5ngn9zGLoHuFYR05aseXZokXxqSdwn+LBeNGanERCgwh7TmYBy/1KVrpuEKi6emsX3Fi48KuUOrR3x/AWuCjqtwxQgFwu2C6L64zfYdq2VU9hFlORJhIqsE969kaGb4JtdkqjVti54uvtNwFz4ZTzR5HbWtCmsG7U+UeEpW8y9t1PiGjc497eCu5kL+r2rgDQlVccoktvXyhO0CLUW4XrXw3pZoEWHsETYo2eVXbD977XK+kO
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(366004)(39860400002)(376002)(346002)(451199021)(4326008)(6916009)(8676002)(66556008)(66476007)(66946007)(478600001)(316002)(8936002)(5660300002)(41300700001)(38100700002)(38350700002)(186003)(83380400001)(2616005)(52116002)(6486002)(6512007)(6506007)(26005)(86362001)(36756003)(2906002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?I+5WxmtJwUWUjN9S8wlkFF4IfZjxxUDTBSV06z5uLsgd7bbwmy2BgOysBLM8?=
 =?us-ascii?Q?v42INPn20+ybGc3F6Y6lpE6MVPaLQbhGjXKwWVgQNGsLrP70P4KdNTfzPzO0?=
 =?us-ascii?Q?Xfj72uu+/9LZo1WCuk3UQQfnAjiMQFk96VTWfdXGKqBvU18xD7zlFFVQ+/nO?=
 =?us-ascii?Q?3edbJK3gglwYwcqzleGE/Vm/GB+cS6s0N7hYXrtt+1cMWQggo9s920tXYzkS?=
 =?us-ascii?Q?XBypdU/qi995i5mWkxFPr51EK3xO5JSR/mwwdpWVgebJbwokp0CuE+gkIYCR?=
 =?us-ascii?Q?iHnF9zth8cPWE5iwY65mnoliBLz5GSKca5fZ8B0dgjGKAUzn0MNDANvApNnV?=
 =?us-ascii?Q?q6K3DZc5yq3ig4JWHlXiN0Q2LMGP4LHB/eICdETlmDyfXrWo/Ul8K+FPo0Sj?=
 =?us-ascii?Q?AgyI04qQxReKBnK0XjkI/I0zI0f4Mb75IfVgHLeJWEeusOyQhy1cH2JNoBac?=
 =?us-ascii?Q?FFQUrG1ePW6qFkAOX9BY0pTnoNFkUvfz+z94nkmv9NIazsuNSA3Fr1IgW11x?=
 =?us-ascii?Q?xGWQ0O+2Rg5+ait+CS6HAY11SBYXD7DzuJbG2zQxh8TP0E9/VszVzRgqaZEt?=
 =?us-ascii?Q?MRKdQEPC/2pYRbEvDVEsix7PZJSUooCi11oRlub1nbc9phC5CApwoikTiOa/?=
 =?us-ascii?Q?WBwQmtN0em/NaJAyV8Q+pSXNh4nwY7KG1ixsOXw21XQWRntQbtQReRQEGlVS?=
 =?us-ascii?Q?h37t7phHwW2xF0cUoLwnmAvsn6U83o6E2ggxSm2dwSJxq1UOs+PV71WnXAVL?=
 =?us-ascii?Q?yWxBzADeMVCgmdprdXs/vXILuXRY+spG/TsoHxwsBszS4Kaid7CzzSZ0nKBu?=
 =?us-ascii?Q?yD9Nl9dwA1FheZrcMApR1kfHEbRirVBwspN9Py48Ef0wkbBLL+ehXILiWYzy?=
 =?us-ascii?Q?YkhwCihDO0Gf4MGooXmg25na5owOkkacmiSrGiVm+iRF+YAOlwIHD/9Kd1Gu?=
 =?us-ascii?Q?WOb6MES4SJ7GD4eLllBaIuUMkZiSDGPjvUwOL2G+MBBkbGRA1/T9L3dlTB2h?=
 =?us-ascii?Q?rYLQpdXyaBaWWlXKzfUyL0nZ9lv9d6jnKG6GZwqj12EkDUOvj9HFdfr/WL3j?=
 =?us-ascii?Q?IcvO2lLyeyTwMOlof3mMihriJ54aTu9YS9ge60x+b0einfge4BiTH2tKdIU4?=
 =?us-ascii?Q?QQWY6qVGkx6/zcW9WeR2HkEp0mrT+Pr3ACajskU1iXm1RmeqN9fYAXMh1+Ea?=
 =?us-ascii?Q?IL0pa5onD4cl+D9xKH+JVXhzwk4uow7ejLJ97OKMYFy65DfeJHLsFlgQ1O7/?=
 =?us-ascii?Q?ij7SozWCN/pqHmZcO1cuiPThl15U9o7l45hUbleVfc7Q3d8E503x7oDc4Bxe?=
 =?us-ascii?Q?AFGiY3Y9uRdLzT3HGCTUt4gu74UqntYZ8LimwzMcfL75iOJKWiS7oBjLF/p3?=
 =?us-ascii?Q?g4zHYy6dL7t129Gml6t9n0hhTrJ0NvCtQ++Xuo9w8fiI2Y5tySmfxzN3m4Jh?=
 =?us-ascii?Q?fIOQlkrCR583Za+GSDSf7JiSoNu6CzoVkvfnqGb4ohlYiir29iK514rf/zM7?=
 =?us-ascii?Q?+vbcEKF6iMy1znAINe5PHgVEsY0LiyNW8TcZ3TQmk3bcS1V/mLeMkCGjHb46?=
 =?us-ascii?Q?xdi+VXHR3TJ7aGVyrCtUnZzjasX4RjDyHwG3z0+E4riljAwPKXftIgSOh4q9?=
 =?us-ascii?Q?e/ucQNF0OKfxI0A4Njga2t0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2f3f46c2-af33-4da4-baf0-08db33cb7587
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2023 22:41:54.7088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 rft5tQCZTRFWeFqK91wPsEssKVZ9uTpAy3gMWuMmM9BRII37WgJx93rSEa4qGWqV7OXFECcP6EPm5kY3kF9VlOcans4ls1BYVrFfinHC4QurE/bSHsv8qCdD+7hyL3aw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11431
Message-ID-Hash: OMLQL4G2VOA7SCMTOWKYQPO2FEOMKQXN
X-Message-ID-Hash: OMLQL4G2VOA7SCMTOWKYQPO2FEOMKQXN
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-ALSA <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OMLQL4G2VOA7SCMTOWKYQPO2FEOMKQXN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
 params

ASoC is now using c2c_params instead of params. This patch replace it.
num_c2c_params (was num_params) was not mandatory before,
but let's set it by this patch.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/meson/axg-card.c         | 3 ++-
 sound/soc/meson/gx-card.c          | 3 ++-
 sound/soc/meson/meson-codec-glue.c | 5 +++--
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
index 2b77010c2c5c..a25c397c66c5 100644
--- a/sound/soc/meson/axg-card.c
+++ b/sound/soc/meson/axg-card.c
@@ -337,7 +337,8 @@ static int axg_card_add_link(struct snd_soc_card *card, struct device_node *np,
 		return ret;
 
 	if (axg_card_cpu_is_codec(dai_link->cpus->of_node)) {
-		dai_link->params = &codec_params;
+		dai_link->c2c_params = &codec_params;
+		dai_link->num_c2c_params = 1;
 	} else {
 		dai_link->no_pcm = 1;
 		snd_soc_dai_link_set_capabilities(dai_link);
diff --git a/sound/soc/meson/gx-card.c b/sound/soc/meson/gx-card.c
index 5119434a81c4..58c411d3c489 100644
--- a/sound/soc/meson/gx-card.c
+++ b/sound/soc/meson/gx-card.c
@@ -104,7 +104,8 @@ static int gx_card_add_link(struct snd_soc_card *card, struct device_node *np,
 
 	/* Or apply codec to codec params if necessary */
 	if (gx_card_cpu_identify(dai_link->cpus, "CODEC CTRL")) {
-		dai_link->params = &codec_params;
+		dai_link->c2c_params = &codec_params;
+		dai_link->num_c2c_params = 1;
 	} else {
 		dai_link->no_pcm = 1;
 		snd_soc_dai_link_set_capabilities(dai_link);
diff --git a/sound/soc/meson/meson-codec-glue.c b/sound/soc/meson/meson-codec-glue.c
index 5913486c43ab..e702d408ee96 100644
--- a/sound/soc/meson/meson-codec-glue.c
+++ b/sound/soc/meson/meson-codec-glue.c
@@ -105,13 +105,14 @@ int meson_codec_glue_output_startup(struct snd_pcm_substream *substream,
 	if (!in_data)
 		return -ENODEV;
 
-	if (WARN_ON(!rtd->dai_link->params)) {
+	if (WARN_ON(!rtd->dai_link->c2c_params)) {
 		dev_warn(dai->dev, "codec2codec link expected\n");
 		return -EINVAL;
 	}
 
 	/* Replace link params with the input params */
-	rtd->dai_link->params = &in_data->params;
+	rtd->dai_link->c2c_params = &in_data->params;
+	rtd->dai_link->num_c2c_params = 1;
 
 	return snd_soc_runtime_set_dai_fmt(rtd, in_data->fmt);
 }
-- 
2.25.1

