Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1357D29C3
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Oct 2023 07:49:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F15FB93A;
	Mon, 23 Oct 2023 07:48:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F15FB93A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698040144;
	bh=KvY+Ra7PhCfLJdZiuGWKPEDaQICxE5+EeSd1CDbAbrM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Du7vxPUBp3w6gLFNJ3swSaRK/6eV9pZjTXt5eOtoy2tO2wvjIL6bLedSU1Un41IOW
	 ds//zxNFT3IEQsklibnxlExJ1ZifEdhRwcmdZD39neyANg1eql72Kjap5nVY0/1wrU
	 f9huXqA4NTWoC34dh9whPEk9nPhJTPuz9yNKlClU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF1DEF8057C; Mon, 23 Oct 2023 07:47:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D3C3EF8055C;
	Mon, 23 Oct 2023 07:47:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9EB8FF80537; Mon, 23 Oct 2023 07:37:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D1C6AF8032D
	for <alsa-devel@alsa-project.org>; Mon, 23 Oct 2023 07:35:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1C6AF8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=JJKBKg84
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MAgWjeVsF9U1NAGaYuYF+4FxbkIXIYKGw24Nt3nFhOxu5oGdeotfe7/rP9W9AnJF5PjfivDTLjfQmzSHLwLAbzRu6oV2Cd0dh+ttuTJL8UckRy6hmaZXTAGqKo5OKL86lLaHiqDpW6rGBO935OatdaXIYmGH1Ihfm7nouedPTA58l1OxLrky3nby+0bGRKVMTOzMlbvV0NYN2tMR0HDcp2+LkZT3EFyM3XlRzPnJl6sFLN5wz784AazhPK1H254R50yiIz/7whZ0Zszuc0GtpEtSZ+ccprILWwKMH+UeusHnH+q3e3ibbBAUZILwzga3CrvlhsP6R11SY6ZtcqHtDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wNdyrb5/z883L9GmbevbxH3TILEOnEt7MpzuuvoQtnQ=;
 b=kZaTbZbfl6FxfFIqURI2h4OcNSM6QphYo9/3dM+5T0iMYKSTmZaDSXztCrKazvsFcuRfpLksLa6osIZy1Mm34DOYE/bl3Of0Qjg35i8wr+PIHbfI09C/+KvH415JHEjo6IXAd2KvrmTJuE62yLOLvnSfNrV18VPXRgbzlb8ajK6UmFhfkhbvnR7Ao3F7rz2NmEamI0ubbfE5aonxEzWu39738HmJGx8uEMWXwbrZTxrvUGR91m0Ewrf1YWSTWkZ5fYXm2yGDz6wW9sfQGz7tXup+fd+rXMenQwYVAp8GSswevNTlWFqApnWlDVkD97vCmcRRSEEeUULpMJ6VySI1/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wNdyrb5/z883L9GmbevbxH3TILEOnEt7MpzuuvoQtnQ=;
 b=JJKBKg84V9e04uVRGjuIkDdaQH6BBmk/srge/x+iqBkMI81ZZh9ZI5kPTN4xWMF4ThVe+7P2PqSSlKokQKKGtCbTNyviiwRnk0JbMzc5AbTJEyc/hSYp9yMTQwWZeK30XLK8EOFNu3MzAh5fQ67lvy4PQYTFGqX/ws3sfKDZfnI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB8242.jpnprd01.prod.outlook.com (2603:1096:604:174::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.24; Mon, 23 Oct
 2023 05:35:50 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::be8:b648:c989:8e7f]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::be8:b648:c989:8e7f%4]) with mapi id 15.20.6907.032; Mon, 23 Oct 2023
 05:35:50 +0000
Message-ID: <871qdllx3e.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v5 2/5] ASoC: audio-graph-card2: add CPU:Codec = N:M support
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	bard.liao@intel.com,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>
Cc: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org
In-Reply-To: <874jihlx44.wl-kuninori.morimoto.gx@renesas.com>
References: <874jihlx44.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 23 Oct 2023 05:35:49 +0000
X-ClientProxiedBy: TYCP286CA0287.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::9) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB8242:EE_
X-MS-Office365-Filtering-Correlation-Id: 86334d97-4eb7-4b17-b357-08dbd389ea6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3+1AoJ980fO8351Py/vpod1kIOGf5kwQLneNPkrwg5iljJJhFXJfHX8FCLYGODJfh1f3CSLX2sA0SRQ1pFfKLiUTNnOc1j+u93PeLwFMQ3iLTMq7hqP6vLc06xb92P++QuoD31t9s9/yCWGES/xx5uan9O7oEukVCFij4AWY1hJNTtS90ny73ZR+vN/jyJgWGmOLV1x/IB+O5n0NmP6y5G1pH53rfXrhle9XDJp1xorrHfGQaNF/9drs9cm3UsewkRI/Kq+6xk0FpJwCihQjI3BdsYonz3Q/BSItptcuspIGWQqSAE8IQoURq0ImmEhGN5oq4uNEBgOx6vyEE8JNcORdXFZSao2LETqGkx/EfWM2KtMSTUl/+Pb5Rd4s17ChUlbntZyy5PaelYvpKrubg/yqvR3aVjQuYbsvZ6mYyuk4QMcsZ49Ux9JRiikL2ms41n4fbYZH+j1F8GLDCBFjkV/sA4s32SMTHtf5hse6/oCip7OzFdezqs/20+8R0jsU+IPEA6tEi85ZtPsfYGln8vK+u25U4sf2vPGm0E/H70ztX3+5YUhxXihCjardyQooJgQH9SnxZLJ9n0ajtdR71xdkjLdg1MC8BpHc0Xo5YqNOrsneG8zkKzETGf+9i8CWcxXyA6uriF1uX48YNC7new==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(396003)(346002)(39860400002)(376002)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(38350700005)(36756003)(38100700002)(66476007)(66946007)(66556008)(2013699003)(110136005)(6512007)(86362001)(2616005)(26005)(52116002)(83380400001)(6506007)(2906002)(6486002)(7416002)(316002)(478600001)(8676002)(41300700001)(8936002)(4326008)(5660300002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cVS6WlmwXEMKKwAGqoyj7YT/isw5EfzWKEWAcwly4CDQy8nsuxrfhcCao5iE?=
 =?us-ascii?Q?48RZBpm1f8PJ6h7AnL91dLmS4w+6pCBIW34coVU9R9QC7oYY0PyktuCQ4eoF?=
 =?us-ascii?Q?fha4xBVMLxRKcA2CXOxvSRwm5gmywClLpPbmPcPwNZ8vZYsg0N90QstJcMku?=
 =?us-ascii?Q?EiuQU8iMB3bcx8tpwHCINQ7outmS1UyM5SzJSHCyiaMsCAk+r+pxykwmX+aR?=
 =?us-ascii?Q?AUB5hBj8Wk2uYMspGGlbjYS9+WpksFzdpT6EqlH14a4Z+wxonU/LjREe/7Ao?=
 =?us-ascii?Q?nvTVopRxZBtJXMAs9H2iWfROsW4iYbw+BoMsxS7Y0IlKKP3cagqLh1rRm96o?=
 =?us-ascii?Q?wEFNuheQC4snppEcM0W+sOOq8CsgIubk+SDM3/7TplCeMv5EltYR+njuK/Lu?=
 =?us-ascii?Q?zkeIXlwbJzJSiGM8TOgeeOwhYe/riqjUAqAOdB7P5RUv62ZGY8F5ZvTOG672?=
 =?us-ascii?Q?dDcSefYHRR9DNJHU0jKgnFreIVPc/1MEwTKvLnfH8eOeAA09HPVSrF1nzlhL?=
 =?us-ascii?Q?XLmly3WoZ3OS73i6EeCBQZJKRe/3wWjZV85zyR2bmIP+fiefPFoZkmycGqyU?=
 =?us-ascii?Q?MEbULmkk11Z7FNaxjcye1196JhdNo4TX3u+1r/bl6NbnXbnXXmo2TDffY7Ja?=
 =?us-ascii?Q?qdGyszN2LO0r4DhnMWHqMfl6HKb1bsGFNbwMCaFza1q12m+emmpBnKuTaG+b?=
 =?us-ascii?Q?+6lCKPs8nHdHCktl6b6XqMfU3/SSkk3QJmXzROX7Nbp64EQi6QDwVigTGE4x?=
 =?us-ascii?Q?I3svrnEs81/8D08HQ9eZPLHH5oZMXVD7fSRvuR4gX8+sws+hRlx5nHX5rwId?=
 =?us-ascii?Q?erFkYjtI2iXEM3aD6fp635yLjUjyJ5acllbIGNALSLQlex44e/jxLzW++Zao?=
 =?us-ascii?Q?4hUdRK8xLlAMm5/ndf9c7G4kfFKopSbPTBHqXOgU/xqear3Xn3ftEy/bUjfC?=
 =?us-ascii?Q?THR09AYuwuLvF464cesZJlSWgU/X7RpJmt/QO50iqsq2ra1YmcFyGzCbES+A?=
 =?us-ascii?Q?0cAtolHyr0dXq/Ch1ySkHO0Km41pXtak/rmw17MixrOYKp+m8La36Phfhra2?=
 =?us-ascii?Q?7qZk7ijeSzMw02MVV19U9db+Wsb/FHRc7GigvhpavPGBkjcDGLAYMU8R1YB0?=
 =?us-ascii?Q?TCCjQk4JOoQBLDfrVhYMiiD7YlvDYsCjf12TxRW0RvPBEN5Zdrdvdioh65zE?=
 =?us-ascii?Q?G5R3Kp1scq3uzeecIHtD4nKjBJkAX0/mAKf68tNOgv5Gg/ZGdrNXabHPxF0V?=
 =?us-ascii?Q?Epuxzt5WK0lLlomewi5DuYhNDfEJp4B4X1aiM4H9SddZ+sGlXGEWkRJ//OI4?=
 =?us-ascii?Q?4wmvgrrv5bswy4KA49a2ABj7zcv0arGzE1Ln64Ul4mJwjYcXpPX1dpvvJcPz?=
 =?us-ascii?Q?gfdJQics5E/DVaCivauvCpCpM4RlJtPzsnpMPwPOMmyKfiiwtU9Z7oFhxTM0?=
 =?us-ascii?Q?3S6yWGhMJohkQjYfdQW90+53sx4ILLzq31p89DfFmvMgl7XJ1MnQHPSCzF6J?=
 =?us-ascii?Q?5sWUH/jyUa6GmGb9KkbptqWKEAFPJUWl4QWeFyEXMKLOakxke+uLNQlvcxV+?=
 =?us-ascii?Q?u0NAOlM28p+NLKhL5fpWyXT78PiqyxQBAQxn+Lq+AS2xqbuYakdasSm8Fwgf?=
 =?us-ascii?Q?UIxj2lI4vtjnvmA3PjigIhk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 86334d97-4eb7-4b17-b357-08dbd389ea6c
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 05:35:50.1041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 MMYDqTOc4AZYApT7w2Rj9HIr+57N29Nmzy4yXE13NM49SlLeiI0F+Ot5bDlNHSixtOe63gH+K1MXuIEuCJ1pv6/lyjWIcNI3S9Utq/ZalT8SO3iFXi/YXfVoGlkxpnap
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8242
Message-ID-Hash: 3CSJ7HSAIEQF3N2X7HQP4XWBE4CPWGOR
X-Message-ID-Hash: 3CSJ7HSAIEQF3N2X7HQP4XWBE4CPWGOR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3CSJ7HSAIEQF3N2X7HQP4XWBE4CPWGOR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Now ASoC is supporting CPU:Codec = N:M support.
This patch enables it on Audio Graph Card2.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/audio-graph-card2.c | 49 +++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 5d856942bcae..bef7ef5e408c 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -506,6 +506,7 @@ static int __graph_parse_node(struct simple_util_priv *priv,
 	return 0;
 }
 
+#define MAX_PROP 7
 static int graph_parse_node(struct simple_util_priv *priv,
 			    enum graph_type gtype,
 			    struct device_node *port,
@@ -515,10 +516,31 @@ static int graph_parse_node(struct simple_util_priv *priv,
 	int ret = 0;
 
 	if (graph_lnk_is_multi(port)) {
+		struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
+		struct device_node *ports = of_get_parent(port);
+		struct device *dev = simple_priv_to_dev(priv);
 		int idx;
+		int num;
 
 		of_node_get(port);
 
+		/*
+		 * create ch_maps if CPU:Codec = N:M
+		 * DPCM is out of scope
+		 */
+		if (gtype != GRAPH_DPCM && !dai_link->ch_maps &&
+		    dai_link->num_cpus > 1 && dai_link->num_codecs > 1 &&
+		    dai_link->num_cpus != dai_link->num_codecs) {
+			num = max (dai_link->num_cpus, dai_link->num_codecs);
+
+			dai_link->ch_maps = devm_kcalloc(dev, num,
+						sizeof(struct snd_soc_dai_link_ch_map), GFP_KERNEL);
+			if (!dai_link->ch_maps) {
+				ret = -ENOMEM;
+				goto multi_end;
+			}
+		}
+
 		for (idx = 0;; idx++) {
 			ep = graph_get_next_multi_ep(&port);
 			if (!ep)
@@ -529,7 +551,34 @@ static int graph_parse_node(struct simple_util_priv *priv,
 			of_node_put(ep);
 			if (ret < 0)
 				break;
+
+			/* CPU:Codec = N:M */
+			if (dai_link->ch_maps) {
+				const char *props = "ch-map-idx";
+				u32 num_array[MAX_PROP];
+				int i;
+
+				num = of_property_count_elems_of_size(ep, props, sizeof(u32));
+				if (num > MAX_PROP) {
+					dev_err(dev, "need update MAX_PROP (%d)\n", num);
+					ret = -EINVAL;
+					goto multi_end;
+				}
+
+				ret = of_property_read_u32_array(ep, props, num_array, num);
+				if (ret < 0)
+					goto multi_end;
+
+				for (i = 0; i < num; i++) {
+					if (is_cpu)
+						dai_link->ch_maps[num_array[i]].cpu = idx;
+					else
+						dai_link->ch_maps[num_array[i]].codec = idx;
+				}
+			}
 		}
+multi_end:
+		of_node_put(ports);
 	} else {
 		/* Single CPU / Codec */
 		ep = port_to_endpoint(port);
-- 
2.25.1

