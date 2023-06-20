Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DE873606B
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Jun 2023 02:07:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8DB1DE5;
	Tue, 20 Jun 2023 02:06:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8DB1DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687219660;
	bh=9BKBGulGCbOYGXJkWSrEg+iBVboURmSwiobyw+YvO24=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gw2F+l4KKnelTj5OnHJo+l/iPafDhmC+m2oN+u/2fabx+YMWOQXqqybFD/ZU5A8OM
	 usS2uCb4tu2uobK7h5tt0nxcvh3ywCAFh7Jt5r8sWwnUSjWe8wlHrUVAJtqnov1daK
	 t2/z7c71g0t5Eu7NiLKDaRDbCx944+xYtbM2EgoY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CBBBAF8055B; Tue, 20 Jun 2023 02:06:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B38BDF80557;
	Tue, 20 Jun 2023 02:06:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BDCD0F80588; Tue, 20 Jun 2023 02:06:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20714.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::714])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C0312F80557
	for <alsa-devel@alsa-project.org>; Tue, 20 Jun 2023 02:05:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0312F80557
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=oq7BMqGb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cTudu/RX8Yp3sfp8UBAWewzrC0N53RAgpuwgQsZmbVQGflrnZm0gLHpt96LMd7di8mK0S34dDEetRJh5C984Oj7n1jEVjKwafnX1FxJ5tToRzVa7rZ7/IwlbKvbXtrk5a5Vn9Awuhdfhc+b0uMoAYfS6Pi5z+Sy/ls8VPJJZMCzHJ4vmVHpFMRJB1Az7gjGiV5ETUNJ1kl3j+KCdyFBaI0tnGyA9U6FGHvdQYZrXGGV4N9rorwEDK2eJ/Cw14d078lQzsmi/SUhk9Aud28hagkgiM51juGWLooBhor30GKEG+2j8uNQdxo5WAtQZalqWPjMjKq1qzC4InDex4XZYBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MnLyVEW3ooA8MXrJUDwj5IFHjcFfz63prbt5eTdwE10=;
 b=BjBJ99TpIO9XUNV6wvLX/jJ2bP86RXfxOPu/Ex1nhb1lj5lni1qCp7wEv7vqt6OzjQT1kgYEy6dbXJooOkfpm6hnULuNvJvPNkQIW5x3NXTDqr2N9Om2hFZ+1SXq2LAm+dHLnhv1HYxJ6naGzaYPjIuwJOOpl96nf2iACwH80zQN1ICRgb/gCsSnT300tHp/ZLNo01N/4Y5HkazjQc9CkflD6+PFbSUnt8r54g5qg0kVWXu25/yXUh9mV/tBNJJE8q0IfBHihwjWnd6zqFO2PnkiMNXGo5yl3TWhlNgg6kiWlTekA4H2mkOfSouXZSdBzQb8ybzthpCeoXPf1at9sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MnLyVEW3ooA8MXrJUDwj5IFHjcFfz63prbt5eTdwE10=;
 b=oq7BMqGbAmkMdNZxiVWeQx3WreoERm3mB7JrUOwI/ztRCIciqTRLiXZT7XyZujFkfPSlFQd8ccuTgdxLTg2CBGAFSRjEIVUcSWrfDeFn5Wl/V9iX1QA0hYu9w4zjq8rRzIVbSL7Y24pxMzZxjN+5UVy573Bfhj2R0v/urR0wFaQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB10176.jpnprd01.prod.outlook.com (2603:1096:400:1e4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 00:05:56 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26%6]) with mapi id 15.20.6500.029; Tue, 20 Jun 2023
 00:05:56 +0000
Message-ID: <87zg4vc80r.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 9/9] ASoC: simple-card.c: use snd_soc_{of_}get_dlc()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87cz1rdmp0.wl-kuninori.morimoto.gx@renesas.com>
References: <87cz1rdmp0.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 20 Jun 2023 00:05:56 +0000
X-ClientProxiedBy: TYCP286CA0108.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::14) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB10176:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cfda9f6-43c7-4a05-b338-08db71221ef6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VWi8PyYFwJo84zyq+xDMPyt/Nb/gI5ipgytEyLBbWKEeOBgxxJUOAJ/lAvECCjvLeTKWz4TfIXrnLY3Gz2TAk3bTA6H5tybzICS5zvWIsCqD7StnLHw4tEXokxXUYDO9YXri8oC07ep4LkrbN8UIYGUhW+OWLfNtCDwMEqDsfHSaGLH+Bza8j9PA7T6zQ3xhMKhmIdL/ANfcwGufQVg81vN6AdKnpE1uNAg6yR1Z8iVgbS4h0LAeiX+35IXzE6KxwWpAu8ChblRWI3/QTrk8QTXvl3RJ3yIxItMjGNUHy9MzrPmrWfERKjUvQ517Nesdp6NjOFNemawazayIcX8BkLFfuImFGUH3094C3xC2BLxGtCQPsfXPXML6ZygtZ8BPlwn+5Gu1mDtI7gncogeKeAoVhAFZTAr87RRSbHssQPjnnDL2tnY2PABdiYqMpndIu85ChCaRZCDBEGpk8s2fLUNmveFxHa/hQYpLnR++6c9hcAMs9dpOQ7xmmuYlcc6f6/YW+bMZp0E0/sUF+jKOyunAQlf8G8UhR4C7EvAaAF/YrjBbjF0iFYSNJtR3Q9mu+3uBwaYloubeKuf9LQbVHIPYbpfzsCTrAZfgZU9Eko+D3cuzb37/KeZCjL7ZZD5V
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(376002)(366004)(136003)(396003)(451199021)(2906002)(52116002)(6486002)(38100700002)(38350700002)(2616005)(83380400001)(26005)(6506007)(6512007)(186003)(41300700001)(110136005)(86362001)(478600001)(316002)(36756003)(4326008)(66476007)(66556008)(66946007)(5660300002)(8676002)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QYSTNcHifdmmTPwKHCvsumXG3AuY2AejUbHab84UA2/tlWWSnNl7xk+zRMfm?=
 =?us-ascii?Q?DOJmIOmRbVx+LoTo61AwDvEp5cLuUnsJUMiAlDCYN7BGszIYbJCQGutsMq9v?=
 =?us-ascii?Q?TCj/tThtSWgbSo/808JhRJSK4W9STAB+eXa3UYdJP7tz9vsMMoALOpRX4cOh?=
 =?us-ascii?Q?rSgS2XLgCeS6bNf+UNpoIn7LMr9SwZdIIkKvHZTHAU1F2q1up/CcKln8dKRK?=
 =?us-ascii?Q?wkW1kg0xxitye0lmuQkZqh+YElQxVRKwlYN5Yb7qCkWwwooMOa9sQJuouBfV?=
 =?us-ascii?Q?eWYHmh19rm5RcSutHete46jfaQW7Ancf/tiZ49K8W0sh1fBX0YLYD0Wd7VLI?=
 =?us-ascii?Q?xUPH+Kde+TVZHHAov0GAJyREV+cNGzBGs6tixP17Ete1ABoQbpbK4hB4W4Bo?=
 =?us-ascii?Q?MV0g2YREHoUYmPIytY4rLkukoARsgBuQzITQ6V4uKNDB+YwdVLTlGFkQPiq9?=
 =?us-ascii?Q?mjDeCqHDStLf4KXiyRNH9LNdZozrJTU18LQMMxosZ/cLBH1XuXYthnpi+Lub?=
 =?us-ascii?Q?H8FVprZ4jcR8o3TWtwVC1Tsr76zzY10/gJgx/ndgpa+czacrsdd+zUxHtXW1?=
 =?us-ascii?Q?B6LcDBZeNSDe3Ni+fW0MyKIkDV8EqR0IuEUEzGhsSgikge+uS+qa2ifXmUm2?=
 =?us-ascii?Q?Yv7YUJlRGufweLGVCD+842EE5uVBgXYzWTeNWn0e/JzWZxJTNHQing41ISxX?=
 =?us-ascii?Q?EB/nhs08sI+mRLulYYDL4kWQjQiixycQQ/hwrLWX6j8/yqI4aQy0VDhebPMI?=
 =?us-ascii?Q?KCqo36C+w2VHi69kToj4xCHyp3PNY5XQoIqEhcIFSGShanP0LpwgQIlL0YgX?=
 =?us-ascii?Q?NajVw7XmpJabnCgATQhAbY0jginI1CNqkU0XAKwCIex5IgJDcdkP5OTxf8zT?=
 =?us-ascii?Q?VjV2P1pkL3S0FwHwrug6/UinV8OpIUdaWk/77gEbthLW5iWC4mSRdoXEba57?=
 =?us-ascii?Q?visEaKQOifxhGe9o944hwtB+lID2nFEz4Tingz5ABiFY7PRwluWDZlhyARYC?=
 =?us-ascii?Q?0ZsvyinAA+QtwqO7kjCtER3FwYyTl+7b0/jNdOgZxrdaegEqrwXJ6j1gVBvL?=
 =?us-ascii?Q?oWgsDQddzn+MYToi4fxo3EvsKf18zlLIcC3lkfqQXxby1krUo0rG9fJFz6qo?=
 =?us-ascii?Q?k2BrGnn/qsoFN3Pks7m5FBeU3mogsG2EgIFMykl62R41OVrGqsDNvxobUZuu?=
 =?us-ascii?Q?06rXTI7X/1AHxu6joWzO7d8e7r/oNCojycKWr0UGPUE0YJKxn5cUfv4dEVA/?=
 =?us-ascii?Q?o3dmsluxi0AgFxrPxAOs6j2R2P5bsGzYws2yCEKnGpyJ2TLFjGg3kzyMJqxX?=
 =?us-ascii?Q?sz63/h0G+R9A6pevT3pZQ4VwaQ5S3unStWttuyEFciJ6Gdt1LWp5DucNMrii?=
 =?us-ascii?Q?MXGeQpTKTVs4BOLhV/qU/waQdVXN78+KpPXKOZpsjB84LOa5BEmVi05B55VL?=
 =?us-ascii?Q?UZyaGkCSNNPyh76wtQyoJwts5RQa6vFLrE4iicBO8DoJRYTg6ZdLnXR7Pl8d?=
 =?us-ascii?Q?04o/S9t7BtyBMfcl3cuzywLIHsRDVOk/3Glq13YHKCP5A6MTLapDkJuHxNdy?=
 =?us-ascii?Q?wfHzRKI0VR4Fj1737l0cRbPoZgTp4SGuT6m8dq1YMtalzGH7Tx1F/4RzbVgd?=
 =?us-ascii?Q?MlHcgQ8/1wk9LNZARwL5nPw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4cfda9f6-43c7-4a05-b338-08db71221ef6
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 00:05:56.7021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 MMEpfL7rhML2ErzrW5AxlcE0WuTq3q+jw9bEBl71i2eFaKU0YwYU14fVLUuXni74hxV8x9S4EEwAVbTDtNC4rTC8riJa0VV/m2TPZV2Kz7Rrm1elMht6LdvuMzUbmhTT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10176
Message-ID-Hash: TRFVQVOPBIVVBZVARV26XJE6UKIZHJVZ
X-Message-ID-Hash: TRFVQVOPBIVVBZVARV26XJE6UKIZHJVZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TRFVQVOPBIVVBZVARV26XJE6UKIZHJVZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Current ASoC has snd_soc_{of_}get_dai_name() to get DAI name
for dlc (snd_soc_dai_link_component).
But we now can use snd_soc_{of_}get_dlc() for it. Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/simple-card-utils.c | 4 +---
 sound/soc/generic/simple-card.c       | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index 3af056026fa2..3019626b0592 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -1103,14 +1103,12 @@ int asoc_graph_parse_dai(struct device_node *ep,
 	 * 2) user need to rebind Sound Card everytime
 	 *    if he unbinded CPU or Codec.
 	 */
-	ret = snd_soc_get_dai_name(&args, &dlc->dai_name);
+	ret = snd_soc_get_dlc(&args, dlc);
 	if (ret < 0) {
 		of_node_put(node);
 		return ret;
 	}
 
-	dlc->of_node = node;
-
 	if (is_single_link)
 		*is_single_link = of_graph_get_endpoint_count(node) == 1;
 
diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 5b59198a0384..0745bf6a09aa 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -89,12 +89,10 @@ static int asoc_simple_parse_dai(struct device_node *node,
 	 * 2) user need to rebind Sound Card everytime
 	 *    if he unbinded CPU or Codec.
 	 */
-	ret = snd_soc_of_get_dai_name(node, &dlc->dai_name, 0);
+	ret = snd_soc_get_dlc(&args, dlc);
 	if (ret < 0)
 		return ret;
 
-	dlc->of_node = args.np;
-
 	if (is_single_link)
 		*is_single_link = !args.args_count;
 
-- 
2.25.1

