Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DC4827FE9
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jan 2024 08:59:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 804F9207;
	Tue,  9 Jan 2024 08:58:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 804F9207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704787149;
	bh=CfK3t0Lco9TnfqF+aCYmh5d8bmYGP8WJzIvcj/zKc2E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BvelecaEVNuTOenA51XhN6NEHYfaLtLjtSOJwq1WK7rQ78esK+8JhOKJqdUJWsz1k
	 Q10++MvYEvBeM7a+1loogAFCaHE+2CeAwNpctLjSh71ab4a1qR0su0lhNH/wRke3Qm
	 63+0gB4PSzp63Zb2moB5yGi+CYE/DyVKXyTrTBq4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C8512F805BA; Tue,  9 Jan 2024 08:58:27 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 21F71F805C5;
	Tue,  9 Jan 2024 08:58:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3FF1F80254; Tue,  9 Jan 2024 08:56:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	T_SCC_BODY_TEXT_LINE,T_SPF_PERMERROR,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:260d::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6AD84F80246
	for <alsa-devel@alsa-project.org>; Tue,  9 Jan 2024 08:56:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AD84F80246
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=li22upWh
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UuwBaa9vzTQ29HoUQYm/rFlEQ+FLNv+LRE7Ws+nFlhTXQkwAcHqBCtrgyJ9XRwBHM8ifK50bT+KzbUHuvvUkz0LQn/yFgSrOs/TMr6oo+SQv3awjgpJ7dtfPQOs/8TTLjb5I0blhjkCgYAMN4xUAa+PvPdUbZPsDaYbpgn3m1L4wORnQs7dbYgXAQrKAPXbjHbNICIcdambFVwC7GAOWE54scez3uxoHG+lNt1i19aYiPSYoiI1dIFfQSmXLshkhopA7deoPYcVahR1ipXpzKBCLCd/FSJMIYV3W/AwlTJz538RgkHv0VuqnmqpYvZwAbVh6wqJWUu2+7fbrcssJvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6+T+hz0PdoXtVGZXAFC9nLgis8xTLsgmz91WpxRkCcw=;
 b=eGDlJNmMXZwcpH1DQUpZNndUinzjNlnqwT7vWdgmWP/dELVMyLvFm5Vhs9kNIrTs5F8X1ydmc243nQCjewgAxhx7LyWc3qduO+11PbeBrEucoimnSD17W6PNiu+zcCFx3qQWjp3xdyAC/FpKMQHNeviYwnziJHArXXfZhxZWsF44Je4Tq7YZrKBag7duzr1gfgnJ2Xd53KS60mGCyGtE1zurXYmfAD1qYdpxDwJY0Li3/nw6rWawpQyUiZWW733XHhPlEZSDtLSuiCAXmEIjhuS/ZazUO3rakXh7rKlDHgNdu4pFBA3BW8/8UpCUDw4CaOgVuhFiYbVWuMprwei/5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6+T+hz0PdoXtVGZXAFC9nLgis8xTLsgmz91WpxRkCcw=;
 b=li22upWh6lmfo/MqtdxLQet2Ek24cH3a+F0pb89fEFsr65tA40wBMZtjbWYboxtnvVuvA5vSPPws5d4co4digCWA1w4+3bV6PCX2tETX3osrSu0oRNnvo7fmK3F9sHfQ0HEdcSCI52Lqaa5Hhh5DPFO5e1ruwpudMgKx1ab50tg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by GVXPR04MB9994.eurprd04.prod.outlook.com (2603:10a6:150:11a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21; Tue, 9 Jan
 2024 07:56:54 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::2a3c:9a90:b09f:293c]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::2a3c:9a90:b09f:293c%3]) with mapi id 15.20.7159.020; Tue, 9 Jan 2024
 07:56:54 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Cc: Chancel Liu <chancel.liu@nxp.com>
Subject: [PATCH 1/3] ASoC: dt-bindings: fsl,sai: Add compatible string for
 i.MX95 platform
Date: Tue,  9 Jan 2024 16:55:49 +0900
Message-ID: <20240109075551.870001-2-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240109075551.870001-1-chancel.liu@nxp.com>
References: <20240109075551.870001-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0184.apcprd06.prod.outlook.com (2603:1096:4:1::16)
 To DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9498:EE_|GVXPR04MB9994:EE_
X-MS-Office365-Filtering-Correlation-Id: fb2f14c2-2231-406d-894a-08dc10e88bbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aj8wNxyky68cQ3QUmRJhXzqiMwg1Np9JAi7rPQsLEE/4bc3gqVBky/nemT8Go7U9tlF+xtDMdeUhCliY7QdeRJS1SZeBzjIv+5wyZIyiMn6G2To+AeWWgkhq3g9O98pdsTpyv2bhEz3Or4wd3MUeQh7wpNVApSGRqVtvp2tTwMls0JskHcCvZ1giWtWpHjRG1Mo6YIhUhPjUAwyL3+0eyrAzjVboFKWRt/AneUdoICzRVSYojVKkOP8y3bbxWZlx21IsFtJZPuCVdg11BTH41gAYf+m5laGaHjDrWZxwM4vqOA4oAcTXnFEJ11kIgK4mpoQxvoPjgKaLWChONm35Ty+tilwBgjCh1KKDXhYOuD/ErzIGPPpOsBiy0aMLsgOqDWTA3UTIuUo+u1I2XE3S+8/kBwcVxtME3iERoMfqFhqD+zzcLLd4yHRqsr9a/PBfEnotjdXrAFWvIGOvKPMSZWyuGftpTNTgQvti5mIx8XTAvG+Q1xZz8a1VBzwLWJ/4cwRFXrr1y3/YOdI7kIoFNVMBQmgAPTRc1XbrlK044kXIQqMhfmY4U/ZFlhiO6Jft0DJDwRI7DlO5+3mWWiDz3/0JNN8NGB2YzQ2zeGWQudh+nP9LlRVSo4ojZaq2bvxXQd8dug30t77YKOaEZXpXZQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(39860400002)(346002)(136003)(366004)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(1076003)(2616005)(26005)(52116002)(478600001)(6506007)(6666004)(6512007)(6486002)(38100700002)(921011)(36756003)(86362001)(38350700005)(4744005)(2906002)(7416002)(41300700001)(5660300002)(66556008)(4326008)(66946007)(316002)(44832011)(8936002)(8676002)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MtnXS2xPEWhViuEhNhOQrfgIsC6xMU3m4gPMMrq5/Hxi1h9FHNNgUF6hRMH9?=
 =?us-ascii?Q?LwNE/m58PookAVazNlNuc5QVc+eHM8pQ29S6jX/uxZkKZY6JvM5Hf+i0+uDR?=
 =?us-ascii?Q?GMjt+Qq2lu9CAYOATzaKhC9C1Ig30bWYth1hRM55TD8mobsLYl1Wph4rKWFE?=
 =?us-ascii?Q?kGSZexD/i6jx8gC4NwLu488myvYiIagsbfmkUv/KbBvBw+haO7FVcMGuJEie?=
 =?us-ascii?Q?vHtoyONY+MxFyvT0S1Kqq4lDA8JQv1nxD9NhWy4EqDWSOlUrED/MrX+1+s0w?=
 =?us-ascii?Q?/PmCXtpG1x8EwSUds/3ACnGKFUzUqL2xS/IZRbZchNROUIyGe+WCK2YkWcA6?=
 =?us-ascii?Q?Y5jh+ErucuczvsUVv9sK09U1RFDoOklE/BCfLrXjLfcmVWzmivCtuHqEYUzY?=
 =?us-ascii?Q?+OCW3sRUX+85xZlAWlcapN3YhUNqorVo7Wv1WnHRFHF6wngyHCsUq+oleSyV?=
 =?us-ascii?Q?FExS7JSEe1b6BbWTcZgnWXz5jqus5d5m85bLKuA9Ff+Pa+IZ+SjmHTsNk+Z0?=
 =?us-ascii?Q?paqaKIQOxtXw1JIg5yp2Dk6KVwq6pFD2I9iegaf/heDp96Rff9Fyvpg5qpWa?=
 =?us-ascii?Q?46l8J2iPb+uWXow972Ob3HHdVZsmVZdTu3dcRtsYkDwenn25ZO+YngBD8tQ5?=
 =?us-ascii?Q?Jb6T2Tns56q+eGVTYt/upUtYiGXu4dLGPSbqW5dToTj8c1vjqnWkUutRtX15?=
 =?us-ascii?Q?b3sKPKk6eJ9hEYrQ8CLiClOJQJAh6FcLYb8vP7m8wQhhQC4rq63wjbRa1R8l?=
 =?us-ascii?Q?n/ufGDCHQjR8nqS9Afv2eGwFKBWXR6Tza/w2gMSm5O9BShELIUJApMPHt2+f?=
 =?us-ascii?Q?oCMOcffRJqOfYosGApSwrlomvJrdqOkZoQzubqUKCRZhyw2m0Kt4suPPZxs6?=
 =?us-ascii?Q?wLMrS3cb6MK7xp05nhGpVXOBh2zqdRfe70mnHSfAaMX+HH67uQ50nwggi1z3?=
 =?us-ascii?Q?yx+67IVa+boGEV+t4LkUoZTAwqlM+5WnHOEOeh6J04O9Agh8xrTK/FZRkTjR?=
 =?us-ascii?Q?9ayYvf/mWvrP2+XdN1CYPbcdxrM1WLdf7u+nFouNjIN29cJ9ofqbHb1/YUZg?=
 =?us-ascii?Q?idL+Zcg2cnvsv8h1etIKM255AUEdbZzHwle9G+KEbQtoqPfiVaf1pbuInLMQ?=
 =?us-ascii?Q?MKfsLrF95Km813OHK2oZK+vzpiDGhM9gq1S+2Or1D2EGKMS0ujh6/sPbcUf/?=
 =?us-ascii?Q?FE/YiH1UhFEwsHk3q58iiLIUutSj5gO6bzP9nFH2O46ZQ13HdZPt8xiiuD+v?=
 =?us-ascii?Q?7gjGBJaTrHAyyDRV7gNXszpKZ+In7FBKbSlfGnhDD5d/wY1duKzi+KzkWaiV?=
 =?us-ascii?Q?GmIYPLAk5wn2U3s/br1LUOR541igm94a+uYytMyV62IcdgpT8T+in4LO8XSO?=
 =?us-ascii?Q?jhW1mVHZ5fedoDkCkNPesNYQXNl7tE9b91g24ym6gjgHcFb+o50SCz3TUzYt?=
 =?us-ascii?Q?BAf0wILlhzHzOCNJAM74HMz6FrOTik9RMkB6Mkp9AHuu2/mkT8uSdCjvUBKU?=
 =?us-ascii?Q?QSwoSpMYBfnAW7Dzuq4JzXFNfcWxAf+aTE7ZjKNWAF9J9uqVC3cFFdy6F57K?=
 =?us-ascii?Q?GhpieQOjSGbDBopn4AhumgO3Ew51YsBKJDKaAjyr?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fb2f14c2-2231-406d-894a-08dc10e88bbc
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2024 07:56:54.5671
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 kiIBLORXvbUqSs1ooj0dnFILg6zQ0FDGsLu+y1ENZRS/dbZsN4QBm9zOT9WGEHiDhFx6c8RMMq/NDgwWi/NmkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9994
Message-ID-Hash: KIUBSY2WG5JRPBKRU7EYBR4KVLQZZJRG
X-Message-ID-Hash: KIUBSY2WG5JRPBKRU7EYBR4KVLQZZJRG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KIUBSY2WG5JRPBKRU7EYBR4KVLQZZJRG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add compatible string "fsl,imx95-sai" for i.MX95 platform.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 Documentation/devicetree/bindings/sound/fsl,sai.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/fsl,sai.yaml b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
index 088c26b001cc..f3d910aa2dc6 100644
--- a/Documentation/devicetree/bindings/sound/fsl,sai.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
@@ -40,6 +40,7 @@ properties:
               - fsl,imx8ulp-sai
               - fsl,imx93-sai
               - fsl,vf610-sai
+              - fsl,imx95-sai
 
   reg:
     maxItems: 1
-- 
2.42.0

