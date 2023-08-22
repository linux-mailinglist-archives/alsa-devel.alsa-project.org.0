Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 210EB784D79
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Aug 2023 01:52:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F350827;
	Wed, 23 Aug 2023 01:51:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F350827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692748332;
	bh=7kdspPP9/QwSk7aekaGYx5lUbb3XojVSI/hU6RbQr0k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DVPCTI3CmqkwsWJSODfyNXX47a/WWcCePAynWOfhDpUG5Fj6IZQd58f4YSYH0xPqV
	 GH9NtW5TQv8NdUc6iPfB1UH1uHm+9jAc4ON709eBLJz6U0KBNbaiZ3onQnCjb4r9id
	 XjhOQYW/5xHRVHhO/1lw/1AD1vVACeyCCp98mlvA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9D5EF80553; Wed, 23 Aug 2023 01:50:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 711ABF80549;
	Wed, 23 Aug 2023 01:50:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CDD17F80551; Wed, 23 Aug 2023 01:50:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20711.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::711])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A9377F800BF
	for <alsa-devel@alsa-project.org>; Wed, 23 Aug 2023 01:50:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9377F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Pabo9c+D
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=INB6KAp20zoKVQlUbuVMpBu7LfxOrQEr384T0cDy7H96KununmblceeKlC+q/AtFkiLFGE0sZDaKTosAxviPve1Jz4VLvtKipwzQf+1Ca/HZtjfCozGzqLoEjZvNVtMc1meBnLPn1drb6K3SHduKtO5jEeX4aVGLB7bdYLmef5McEpddf9LL3FwhOLIbE5O5YyjQWbSsbkbGcay/W6M7UY5yvzW8zAuJp09PN2ud3aICZpxP0hKLPi/H8F9Oa+mRqfiWV2Ar4w+ZOvhyXaN1sqphfCzrV9BG5RuezjBORzK3KpQ0N3WK58Oy49Zl3qrRPwmhcgNTLMf1swjOAbw+Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T+m0o6pKo4jNPa88i70MWOKPZikB6Imb2Ux3ehty+U8=;
 b=JYRM1O2IGTX7A8l7G1EhtyhTHtfIpiuf2ilbVfKgl4HuxuCNFv6BtcCnbjhDItv8cud/GuUCGLmBo+t2EX9j7E0DcY0GdRarw1rBeLy80THhcMMAe7wkPIcB2kC97eVYeStdp3ytCJ4NjhYIG0Tg5XXUrmGAzAkhlonWBR2RSqpCVfzSWDSrzbxrUPSl8DRa/o5T5veztnAuasC9adGUSbCToPs5RLOEIXkurSXhKMPo9bIbEpX1szzceFu+ZLhSaOVD9D6MSV5UbLfjQfSI8L4mPRzTuLkUK95v4LTpKuhjKjFwKxGMcxYywDb8STSFV7zdL8hSn3tEgtp6D6BSAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T+m0o6pKo4jNPa88i70MWOKPZikB6Imb2Ux3ehty+U8=;
 b=Pabo9c+Dzh9qpJnNbzctyoftRduhQFg+NXPquBNEwdkOqaWTEtHSYdX3/8VuM+mnj6b+9QPGPcTCJ9LLBZRBM6qwWBqN6Nq17WHP0wRdsHh8y8vmesOI3N+Ak0dId+q5WbLj/pdsnDZZV/5sseUTWAAUVxE/e1XOQSIw6QON2yU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com (2603:1096:400:15d::5)
 by TY3PR01MB11948.jpnprd01.prod.outlook.com (2603:1096:400:405::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 23:50:31 +0000
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::7b2c:6f3a:1aa:79d3]) by TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::7b2c:6f3a:1aa:79d3%4]) with mapi id 15.20.6699.025; Tue, 22 Aug 2023
 23:50:31 +0000
Message-ID: <87msyizlfd.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/5] ASoC: rsnd: enable clk_i approximate rate usage
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Adnan Ali <adnan.ali@bp.renesas.com>,
 Vincenzo De Michele <vincenzo.michele@davinci.de>,
 Patrick Keil <patrick.keil@conti-engineering.com>
In-Reply-To: <87o7iyzlfy.wl-kuninori.morimoto.gx@renesas.com>
References: <87o7iyzlfy.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 22 Aug 2023 23:50:31 +0000
X-ClientProxiedBy: TYCPR01CA0160.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::13) To TYCPR01MB8440.jpnprd01.prod.outlook.com
 (2603:1096:400:15d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB8440:EE_|TY3PR01MB11948:EE_
X-MS-Office365-Filtering-Correlation-Id: 27f3d3d8-bf38-4e42-c477-08dba36a91c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Fgg5y/b0ZVzKOUtk+UPcwq8B8u+G3TYvpBVGK1N866FOdUc3DoAG2/1hB/boY+lqKBDQUcMQM74ovCwmStJGTbcEVhNqatVk9Ho5XJX+KrHstRwlB84JI5ZMlmUszmO7m0IOyd3mNeOfaOGIi8JK/qQVNGP0jLo9rokLFP2naGlsp3ZjTgfShdJ5XMGE5AA5Tv4i1Fx+Ruy1LK5GUmf22sCV78VzFFCfQrsCpiDUOT2mdtwovmTB5Bak0GDls/1Vpm/GfrH4dC7FMFLQU2sT3QjH7yG5d3AsiAriFKkpwoi2r1c6SBZJ0S1sdR1Tiz6t7M1icbZyWy66jJ8q6mn4SXRSlbA7gvHXHs+CLnI3dsF+DKxnvU0BRitmurv0ylOEOvvr94iW6b8UbFV38YZyuraoQlrzwPDqy/w4EmxYpVt9wyD1mQ8L+oCmEU8hRasYcHW5HUFA2YPwRU1tiTGfvMXUZLjNZwBlLIJnmjgIoWF/qHAQiA0f78yNLfp8ARglHcGiaYyg4tBr+YIpdctj3TzruyYu3JuQMngfgBcp84xwln/K/fjC9okLQfi9NdJan97zsdFTbEzDlUpwIp2RS5QqbEXAnuKiYGR+tPm32CDBu3l9zoBxG1LzkSsrtwd2
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB8440.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(346002)(366004)(396003)(376002)(1800799009)(451199024)(186009)(41300700001)(66946007)(52116002)(54906003)(6506007)(66476007)(6916009)(316002)(66556008)(6486002)(4326008)(38350700002)(38100700002)(2906002)(26005)(8936002)(8676002)(2616005)(6512007)(5660300002)(83380400001)(86362001)(36756003)(478600001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hmZuiJ4CZR4DdDI5DnkOt46CfqpAkExQbEc/KetbPABvCcgbRob2P4k8c3Vi?=
 =?us-ascii?Q?g1fTj0ixoo9pntXk4ICsd0hsOPxa9HXr0m5d1j7Zz/uxppyX09FyXp8w+j6B?=
 =?us-ascii?Q?A5EiG0+vvaU7noFxrr/oetN1tKCovjnMBB0GBWNZwSRjzQH0ELmR2jhGN09r?=
 =?us-ascii?Q?Tdx9P52syHJ/bV15OUa4npMp/YHmE+x/1IXK0KlKjM3BpB+89neZj9Hs5nl/?=
 =?us-ascii?Q?drDCPN5e0r/AJSQqu/q37ujGz/4lr9rBA7aqdtYbf6GVb7Cj3qI/VVcne7Vf?=
 =?us-ascii?Q?hb04bms00vVR8kPPk63jpKuFo5LjKrAdMJ9it2sNrWFkk6MSVnRilmRa9KgN?=
 =?us-ascii?Q?4eHhhcUmjGrqIXuE6N86j4KLuMhGgSjSGED1svZRfJLPU20TNlOvoW9K3AEp?=
 =?us-ascii?Q?tGF/sYF8LgYwrR/DgQWUfB2YaZaFMVlyslMNUSzuhgGH4zYvABcM4mH74N1J?=
 =?us-ascii?Q?z4oKhYtlfs39bFzw7YcLn19CXEtMDjfqtUWERd5jbQsMqMDzto9Y7akDhqaC?=
 =?us-ascii?Q?6oVlX2NPaN+OkUuZDqYXx84rm1QVFuXBuet4IRWzAxiq0dhLN/mOgl8aWQ/F?=
 =?us-ascii?Q?o6tXP0S3eVoDqxx9Q9V1KKQASg5xLXVNdMr/opK0y7F6rHveg6nqz/EcZNXZ?=
 =?us-ascii?Q?HSOMVg231Kan7nJhns+BoGApLo3iNrsSDYOeFIQ3SkT6NXwg8vbfPzOp8Fl8?=
 =?us-ascii?Q?V4pCvfktVtqG2RO0spWSqiNLHMStUIpx1PN3x3+SK+utka//5ZdDQnaAyz4m?=
 =?us-ascii?Q?kRe7qjUOh7G3QJn6FhnPnAm73+Da2sJMOxhyZbV7clpZRrp91Rh9zRxaI4Uh?=
 =?us-ascii?Q?P/XPxU/TL+VtShg8vSK8GtKQS0PV7Y/sFfNVKlasQGLjbvD7BVvyGWmAwkfj?=
 =?us-ascii?Q?ju4J2g3bVJFLpouSElF5J8gCrChP/2XwEtgh1O6XLspBft5u7lyNufm1VtU6?=
 =?us-ascii?Q?+xgJUY0UOog9gWRIkOmZ/87b1QhbSJiy/YrqBlDzMOUXQIVzNM7Y7rnxdfFq?=
 =?us-ascii?Q?s1sCDCC7zjHAGY7Bzz2I87sP7VeDp/7dKbMQdp0DHDwpkDRb1C3QtW8uKK7+?=
 =?us-ascii?Q?ss9ouh2xEgT9M86WnWq0zcxWHgwqHVZ9252XMoI7xJHbwpUWFN3W92X8V4Yq?=
 =?us-ascii?Q?VL1aNVJXz913ffUAxb2byKCh5q2XmiEuupM8sHtPqYO0LtCgxb2BDsBOG5QL?=
 =?us-ascii?Q?6zcATWVtZml9EZF+NrOtlMh2yWuc3o3gKPi7jPSpRw9La4DPkhcO6tQsTj8C?=
 =?us-ascii?Q?uBxPCXcBv9zVgw5hGzAQW7qy/03vjSfFLVPcrluscu1TYQkqwGg6Ry7PXWPe?=
 =?us-ascii?Q?ttIbFBNOYWTJngYD3B2f1ILsG4M/ewu165+6yyjv5rbud7ypRG6MrAVMKIYU?=
 =?us-ascii?Q?IGhU+W7uEvFVEihQoGQ+SBSMODBJquYmHWCi4j+XvjMpCFrKpPQ8liYu+gcB?=
 =?us-ascii?Q?V4mOk8bOIvFitSdoP+HVsOgDSHQaJT6fq2czRxKaemwlxp/BMZjNfC6M/ZBk?=
 =?us-ascii?Q?XxrA3lhtgzkzR+tfzv+5x3AYkncysVoszpX20Z+VWNtImNP/Zh9PkKg2R0Nd?=
 =?us-ascii?Q?ETgOjapqEP3LB4PZ3+3HnrngNd4sylGMWZjYD67UyaW1bpdfylqO3c6FiBAr?=
 =?us-ascii?Q?H+IDm0fNh0YbWBBY9iGEAO8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 27f3d3d8-bf38-4e42-c477-08dba36a91c3
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8440.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 23:50:31.1506
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 aSG/hyKXLC0EHYt8LtCiqhHjF5K5vS6R7ZX4A/D83tcVpmOmTtO1Cv/TjN8p6cKtgZZjSGBhlff0ZnpZnzGpiFoaKPSKWzDl+2NiBiy3+q3tjz1ry06ooJXPloZ3AuSg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11948
Message-ID-Hash: 5E2UJVV6ND4U6IKUAV7YVYSJQVY2MSS5
X-Message-ID-Hash: 5E2UJVV6ND4U6IKUAV7YVYSJQVY2MSS5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5E2UJVV6ND4U6IKUAV7YVYSJQVY2MSS5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Basically Renesas sound ADG is assuming that it has accurately
divisible input clock. But sometimes / some board might not have it.
The clk_i from CPG is used for such case. It can't calculate accurate
division, but can be used as approximate rate.
This patch enable clk_i for such case.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Acked-by: Adnan Ali <adnan.ali@bp.renesas.com>
Tested-by: Vincenzo De Michele <vincenzo.michele@davinci.de>
Tested-by: Patrick Keil <patrick.keil@conti-engineering.com>
---
 sound/soc/sh/rcar/adg.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/sound/soc/sh/rcar/adg.c b/sound/soc/sh/rcar/adg.c
index 1479d8d77dc7..55a51ea12144 100644
--- a/sound/soc/sh/rcar/adg.c
+++ b/sound/soc/sh/rcar/adg.c
@@ -492,6 +492,7 @@ static int rsnd_adg_get_clkout(struct rsnd_priv *priv)
 	unsigned long req_Hz[ADG_HZ_SIZE];
 	int clkout_size;
 	int i, req_size;
+	int approximate = 0;
 	const char *parent_clk_name = NULL;
 	const char * const *clkout_name;
 	int brg_table[] = {
@@ -538,6 +539,26 @@ static int rsnd_adg_get_clkout(struct rsnd_priv *priv)
 	 *	rsnd_adg_ssi_clk_try_start()
 	 *	rsnd_ssi_master_clk_start()
 	 */
+
+	/*
+	 * [APPROXIMATE]
+	 *
+	 * clk_i (internal clock) can't create accurate rate, it will be approximate rate.
+	 *
+	 * <Note>
+	 *
+	 * clk_i needs x2 of required maximum rate.
+	 * see
+	 *	- Minimum division of BRRA/BRRB
+	 *	- rsnd_ssi_clk_query()
+	 *
+	 * Sample Settings for TDM 8ch, 32bit width
+	 *
+	 *	8(ch) x 32(bit) x 44100(Hz) x 2<Note> = 22579200
+	 *	8(ch) x 32(bit) x 48000(Hz) x 2<Note> = 24576000
+	 *
+	 *	clock-frequency = <22579200 24576000>;
+	 */
 	for_each_rsnd_clkin(clk, adg, i) {
 		rate = clk_get_rate(clk);
 
@@ -545,6 +566,10 @@ static int rsnd_adg_get_clkout(struct rsnd_priv *priv)
 			continue;
 
 		/* BRGA */
+
+		if (i == CLKI)
+			/* see [APPROXIMATE] */
+			rate = (clk_get_rate(clk) / req_Hz[ADG_HZ_441]) * req_Hz[ADG_HZ_441];
 		if (!adg->brg_rate[ADG_HZ_441] && (0 == rate % 44100)) {
 			div = 6;
 			if (req_Hz[ADG_HZ_441])
@@ -556,10 +581,16 @@ static int rsnd_adg_get_clkout(struct rsnd_priv *priv)
 				ckr |= brg_table[i] << 20;
 				if (req_Hz[ADG_HZ_441])
 					parent_clk_name = __clk_get_name(clk);
+				if (i == CLKI)
+					approximate = 1;
 			}
 		}
 
 		/* BRGB */
+
+		if (i == CLKI)
+			/* see [APPROXIMATE] */
+			rate = (clk_get_rate(clk) / req_Hz[ADG_HZ_48]) * req_Hz[ADG_HZ_48];
 		if (!adg->brg_rate[ADG_HZ_48] && (0 == rate % 48000)) {
 			div = 6;
 			if (req_Hz[ADG_HZ_48])
@@ -571,10 +602,15 @@ static int rsnd_adg_get_clkout(struct rsnd_priv *priv)
 				ckr |= brg_table[i] << 16;
 				if (req_Hz[ADG_HZ_48])
 					parent_clk_name = __clk_get_name(clk);
+				if (i == CLKI)
+					approximate = 1;
 			}
 		}
 	}
 
+	if (approximate)
+		dev_info(dev, "It uses CLK_I as approximate rate");
+
 	clkout_name = clkout_name_gen2;
 	clkout_size = ARRAY_SIZE(clkout_name_gen2);
 	if (rsnd_is_gen4(priv))
-- 
2.25.1

