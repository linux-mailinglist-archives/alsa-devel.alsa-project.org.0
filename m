Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1C78D13A5
	for <lists+alsa-devel@lfdr.de>; Tue, 28 May 2024 07:07:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57BF2B60;
	Tue, 28 May 2024 07:07:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57BF2B60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716872838;
	bh=mRGFQ92bWDw7BtQxOhSHlq8t02y6W0x5JTs0P3qpmpw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qQL7nZDTbKK81e4CB5dEem9SO/GXcI6IrD6JGYOVGTmxNZr6E2MKb9r+YGdK3TuE/
	 b6bFDby5CZCeu+hvIy/8iUeWEVPxFyCbc16bPqSrtYY6d85nRQPb9lyldaDhWABetY
	 bQd1KEpmnJa3ZAiGvkzVqWLjBqqk/pkisPWwhrRk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BE783F8067B; Tue, 28 May 2024 07:05:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FF8CF8063D;
	Tue, 28 May 2024 07:05:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C899F8061F; Tue, 28 May 2024 07:05:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8F18FF800E9
	for <alsa-devel@alsa-project.org>; Tue, 28 May 2024 07:05:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F18FF800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=oDfnk2MU
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N2jD6PWi2Nc9CIfJUunR4KcLKjwc0GARAC+gWsPRTsUjEpH2do/0v6UNdtA6/Ct0chZqbrgk4o9xt1wd8EuDftyJSCjd75sZ5vTSLZodlPoQqU48U0ccZQDq/r0qFvDPxY4vA3qgF53AYD2uORiya8vad2eYIVpi024a0N9sGjRiEoOtWCOsG/DDTbidoFH6B11AuYwd2xRCG3HaqBgvOutLTtULYNMhIS/AIoyvMdKNudGG/V5ZOZ3M/6/X4F+L/ymVBSgl2mFYEte82clGKqcmF01d2zAElS7ftTsQN8FA4nngXtdG+tmadhOfzWRA+1YkFux1ndH+JrGHQTbq0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nb4T1OEllQlGDr+vfIfANlHStClk/qhMX5dhsmUgjoY=;
 b=hfhdxbBjvktQVD1O40c/g4IXXtZ8uOoFFIHTpl7hxz6ky1KMaY0w1zndY8rLCpxx77bDJzquP7MAt9wQuEEN1UCPoVs6b2ETKbWN5U4rS5p+EiHrw/FcZjUwy1tbn+uAwIH8cGFava8+8EZfI7IgfbPvXn5JMbNP+wdhCTIQLWkQBdqKEqxH8WRz6xkoXX4djc2HUaSj9ynNjbipcJuTWmwcvbgnmdfmQn5O7BCFL53Qc/UQ6spTIAvwdcqbac1kf8ilmWf9xCVXPXfbiaLr5r3kmUgxaxqWBI45WMM9XDlnTOJU0EEnSEQb14Cb4Yct53iYixcnKj2rF/T/JEa/DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nb4T1OEllQlGDr+vfIfANlHStClk/qhMX5dhsmUgjoY=;
 b=oDfnk2MUmkHJm2AdN6ubFmBJDd/ze7eD4aVMQEfLWPxjzy8XNhH2nobe2f36Owg15i6TETDBslJ7a3Tn0+6hKbdBjznYqrjkh/ujmRAolttELJ13+FVl4PfcY0dgZmQwELmiy0HLWlh3NxB86Vy0p/Ol6Ki53iq/9oRrY3kV0WU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB7090.jpnprd01.prod.outlook.com
 (2603:1096:400:c1::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Tue, 28 May
 2024 05:05:32 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7611.030; Tue, 28 May 2024
 05:05:32 +0000
Message-ID: <874jaih6g3.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 05/11] ASoC: audio-graph-card2: merge graph_parse_mclk_fs()
 into graph_link_init()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87bk4qh6h8.wl-kuninori.morimoto.gx@renesas.com>
References: <87bk4qh6h8.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 28 May 2024 05:05:32 +0000
X-ClientProxiedBy: TYAPR01CA0073.jpnprd01.prod.outlook.com
 (2603:1096:404:2c::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB7090:EE_
X-MS-Office365-Filtering-Correlation-Id: ca06f90b-a0e6-485f-863e-08dc7ed3cd23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|376005|1800799015|52116005|366007|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?rUBHiCE5QzLeiSZW2WTYWUF7Dah0amD2ymRZc+5cRNF52jqtqBJfp+9zSQ/Q?=
 =?us-ascii?Q?IsygfQfH5cxngRS2xakjGbDSFdgWOnQlrER+cRp7IY8/Q6NQ6c0mB9aNLlri?=
 =?us-ascii?Q?BRm6/Ry26T+O7S224+XfdiUxEu29rIRC2mMa4c1tw3DkV6RDtyZHDbbZI1mI?=
 =?us-ascii?Q?Cbn0U64Nlm9pmUJM2M2dEg38kfpQtKA9f8BFADFvtOnTUltmZzckFCN4ocaN?=
 =?us-ascii?Q?cvcP38WaW9ikxFvXB1EJaQEvn5RcR3mVjAgAbBVrJnx7ar0FMKe6yyDxuGXV?=
 =?us-ascii?Q?uHuzefdrPLbYVlw+29Ux7w2Kh7tGQrapa6DXeMXBfqrk3jtfYQrcPwxUx3Yn?=
 =?us-ascii?Q?oSqYsJXhOG8+KueXwGd+kSfIyQLX1DOX24iU9bh593w0VwqPSdckokyQFkzr?=
 =?us-ascii?Q?jbbV3jCkx1cYj8Hy4AGEc/KdjqcXEPzP/7Epi3JLjRo+u/ElKtSr/oMYzo+Y?=
 =?us-ascii?Q?vA4NpOYnM8kEfPumUrK9sLxk1EAHb85537BpOnSNgFyw5ywU9KsZNk7KUiHI?=
 =?us-ascii?Q?81ERlCHOtfgeQpyqSblel+D5Ri4vbLuUKE/vm2SS2YMbl9GYlEBYlX8noU9F?=
 =?us-ascii?Q?JN1KGVSItXNMgAWb8BPrf5ObuLty6OJeZ2LDRW8cNZOoWyWNBoHTaK1fGtXS?=
 =?us-ascii?Q?4MW/1MAF/W9LWKfYdRP8VanwcgnoVV1j+HgCrR6HSZEMwU9p3ft8rkzL6+fn?=
 =?us-ascii?Q?QoxmdZ4NfLYOeZb47+l4O8uWYhqR65wwxvSM7O6WbxqW2cCTx4stQ0fa5YoT?=
 =?us-ascii?Q?WMjn/qr4Fk+0ydtfzGAlvDfDdJsMXZd+Ade8F3pJRtKAVTHAtJfQm67NJ5yw?=
 =?us-ascii?Q?7c8G3OzrMPrBWENuoZMj3vghdYCy4Ebz7Y/LiGbUMzDn+pegsEAhl6VU0h2Q?=
 =?us-ascii?Q?tzhLToZHbtCDtbhyn19uYNofEUTuZUFfUIA8bSoEkL1nbWgcEMiINEtCQCSf?=
 =?us-ascii?Q?XacSm1b/R6Ag/6S/657zEDN7l/2BEGmYLVo9wTR4K7Ga0Hku63k1LNQUGT8C?=
 =?us-ascii?Q?t+34MF+mA/E3mmzupiUuluO5TqRZ/I+PnqlMoyRTFps45kAlDI3f+d3qHNXz?=
 =?us-ascii?Q?VuqHz6AyWPLyKT8BSbXYOy9karx5ChT0AEX4kgtfz93fyCxeCFMXF8EvRFCm?=
 =?us-ascii?Q?F5iSx04fOS6PPpKffHUZ6dAHTvOI+dzFsvC+wIk4KcxmBoXr2AcRV5K4FF1c?=
 =?us-ascii?Q?MDZd3iwAWGDLFzqmRRhF2J5AgDl44Um5Ul5/j1jLz0mwvkTsC3YbNApn40sv?=
 =?us-ascii?Q?BXruTO/akLVD3fuFiC8zANHppWw+KQ1dmDrA7WnxN1VD3btzhrglkzGGbsfQ?=
 =?us-ascii?Q?uXk5Cnj0iyspQ1uO0Ql6oeMm2c2ModD5dF9QijH80HrPUQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(52116005)(366007)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ZzwjKx55FBCNejpSPYUggM49nArsGVSGF1c6ftrjuwz3ABnyS4uh5chnJpDV?=
 =?us-ascii?Q?BcmtuuLF24LZpX7toLwgKB1g3NE7DC/CwAoLdYBtdqLi+tkYrgaukwe7NdNc?=
 =?us-ascii?Q?qXvXjHJepWXo4k5DYJ64eax7834JmPLTV4Hhg3DPHpcvgbJc4qYJEoDQkOxk?=
 =?us-ascii?Q?0o8CyQ8bo7Ta7b39zcjqTr/BMa7Pg+b9mAMBOEWm35wJp+RxnW9XMIa17zqc?=
 =?us-ascii?Q?skKTtrfKunEB29IgUGttptOFHimFydsdLIp8ZhxOKlFbUnhd2dTc8HhYK7cI?=
 =?us-ascii?Q?IzjYP+8HPPAPrQ57ijftMPrnUMoNmHaQPAtzawlWojGNuJ2ggBLZZmeS0Cks?=
 =?us-ascii?Q?gUS8SBHYMBzWCAfR59V4qVMQeUzMrG6H1CEl82LlmWOlsfNpsLlfmN2IGzup?=
 =?us-ascii?Q?9dYTPs+1Zxr1MTN9A4rU74EWgCnhsljvRpjlnP5H+3g00C+ftr6V5PdDsipk?=
 =?us-ascii?Q?y7K2bSIsdbpLX7pT/StSInYA1Pa7UlkN3xy1J8jSoHEwzMqMBbZxH7RNY/cf?=
 =?us-ascii?Q?Fqp3B9hCq7zCgtjZ2UvGvUZdoas0tNwEt9vxMXVWadLMirUrmR+VXK8iyQH2?=
 =?us-ascii?Q?R7QD0ymug6vioRiFTAYJsJ5sS/AHHSW6fHI1q/tUEf7CEtKcSQcxOy79T73m?=
 =?us-ascii?Q?4UD7rwqJ7Q7+3PENwON1731kvsA+v0ce9w15Sb9YJuN7mG50VlD5OUnKbnUI?=
 =?us-ascii?Q?hHzI/4VZKG+hXZ0iXpVEZLz4uMl6syttPIgatv1bHnVLn2aZMA42WSbi29qq?=
 =?us-ascii?Q?56kCXM3jqqv/2noeEfhKk9q+SiT5A1rxr2sy0manAADYoDOUkEBRZjHKfdkE?=
 =?us-ascii?Q?NrfBOMOgxrbnDrdNzi4h7sZOH87QdiiZrhZcJBJLWoypIKAUXi0DZDf1CAtb?=
 =?us-ascii?Q?zATVQBGqB0iI+2/tF9DOjqAnow7DSB6c6vDw322Kqx3V0qrrLw3Smul9OdxF?=
 =?us-ascii?Q?FQ8yCT6N7ipid0qC9GAK8bA40MA4JJCM2ZLSr5pYun2EN0BOZ1av1kL15ATn?=
 =?us-ascii?Q?pItfSIqOHCSebHe6Nyk7N3PN8/y4F0WXPYjuCjWWEJIE8EhITI7IhM2MmkQX?=
 =?us-ascii?Q?TYo2F4wq9JmHFadVUnN0RTQAJogcZ6iPME+iNMOVtf47In2yZcI14TFyZTrJ?=
 =?us-ascii?Q?Lhrw7n08iagAQ8YyCZM7WdVmXNW8YH5YZJDtQAe5XAdMJmDWX9ct2162TPXW?=
 =?us-ascii?Q?CVk9z/1+b+/7vkEahPp8rvK8Urmgy1d0c3H6xSbby/9WFISKdcALcSdmvslN?=
 =?us-ascii?Q?hESM2HI1x5ISQZ6YX0rHrO6J3zHS6kOUuhszHGVK9+Ss95C/aj85u4om8jd+?=
 =?us-ascii?Q?0C1zqJRVAuX0yPm+JQt6V6oI0yWYKpLndRwdBZG7/2WX/nB9KO91EuEmWdjC?=
 =?us-ascii?Q?Cu6I0YX+nHbL8d7II2aaUl4zL2nI0Of0vCQx/A9MAFwlBdTlvhA49eKHeWAD?=
 =?us-ascii?Q?riJAeN+OSeadDzRKCmq+ljE5BbKIkne3tC6l82e/k/W2EMB7mNnJ6XSCq8C6?=
 =?us-ascii?Q?wjxdoKCbYGUhgvL8YrxhV2m76SZqLKPy01r6sjrt4a2tOg6LN0a/6aGZ53s0?=
 =?us-ascii?Q?e6bDLdRyuZrn97ZX2AqufDxkzu3d71uFeaYucR0Z0gj6yWpSALwIHIJ0ojz9?=
 =?us-ascii?Q?gF3J2QCDwQjwPbppV0C88ww=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ca06f90b-a0e6-485f-863e-08dc7ed3cd23
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 05:05:32.5417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 gHjkt6Ie/xCgxHVyRaUOi31ICPrRtAm6qlNTzdNJZ3WtGEUnBfiAKpe1FaBWaALk/jBloWLDtlETF8cl169+IiSZLRl9UlCckIRKZXjw4YUNldq3xZ7KisCPF7eJn609
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7090
Message-ID-Hash: HAEVT5U7HT7SRYZYLUXVPI2ZYVG46X2P
X-Message-ID-Hash: HAEVT5U7HT7SRYZYLUXVPI2ZYVG46X2P
X-MailFrom: kuninori.morimoto.gx@renesas.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HAEVT5U7HT7SRYZYLUXVPI2ZYVG46X2P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Now graph_link_init() is parsing dai_link related property.
Let's handle mclk_fs on it, too.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/audio-graph-card2.c | 25 +++++++++----------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index bd714a6f74e61..8eea818887580 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -389,20 +389,6 @@ static void graph_parse_convert(struct device_node *ep,
 	of_node_put(ports);
 }
 
-static void graph_parse_mclk_fs(struct device_node *ep,
-				struct simple_dai_props *props)
-{
-	struct device_node *port	= ep_to_port(ep);
-	struct device_node *ports	= port_to_ports(port);
-
-	of_property_read_u32(ports,	"mclk-fs", &props->mclk_fs);
-	of_property_read_u32(port,	"mclk-fs", &props->mclk_fs);
-	of_property_read_u32(ep,	"mclk-fs", &props->mclk_fs);
-
-	of_node_put(port);
-	of_node_put(ports);
-}
-
 static int __graph_parse_node(struct simple_util_priv *priv,
 			      enum graph_type gtype,
 			      struct device_node *ep,
@@ -424,8 +410,6 @@ static int __graph_parse_node(struct simple_util_priv *priv,
 		dai = simple_props_to_dai_codec(dai_props, idx);
 	}
 
-	graph_parse_mclk_fs(ep, dai_props);
-
 	ret = graph_util_parse_dai(dev, ep, dlc, &is_single_links);
 	if (ret < 0)
 		return ret;
@@ -770,6 +754,7 @@ static void graph_link_init(struct simple_util_priv *priv,
 			    int is_cpu_node)
 {
 	struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
+	struct simple_dai_props *dai_props = simple_priv_to_props(priv, li->link);
 	struct device_node *ep_cpu, *ep_codec;
 	struct device_node *ports_cpu, *ports_codec;
 	unsigned int daifmt = 0, daiclk = 0;
@@ -813,6 +798,14 @@ static void graph_link_init(struct simple_util_priv *priv,
 	graph_util_parse_link_direction(ep_cpu,		&playback_only, &capture_only);
 	graph_util_parse_link_direction(ep_codec,	&playback_only, &capture_only);
 
+	of_property_read_u32(lnk,		"mclk-fs", &dai_props->mclk_fs);
+	of_property_read_u32(ports_cpu,		"mclk-fs", &dai_props->mclk_fs);
+	of_property_read_u32(ports_codec,	"mclk-fs", &dai_props->mclk_fs);
+	of_property_read_u32(port_cpu,		"mclk-fs", &dai_props->mclk_fs);
+	of_property_read_u32(port_codec,	"mclk-fs", &dai_props->mclk_fs);
+	of_property_read_u32(ep_cpu,		"mclk-fs", &dai_props->mclk_fs);
+	of_property_read_u32(ep_codec,		"mclk-fs", &dai_props->mclk_fs);
+
 	/*
 	 * convert bit_frame
 	 * We need to flip clock_provider if it was CPU node,
-- 
2.43.0

