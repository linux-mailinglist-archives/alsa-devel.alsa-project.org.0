Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC9C8FFA63
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2024 06:21:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97289847;
	Fri,  7 Jun 2024 06:20:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97289847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717734063;
	bh=pK5e2honpodLkOcYZhrvlZ+Yw0jcYwuTA+gs285Vy64=;
	h=To:Cc:In-Reply-To:References:From:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uhAh+qJiz5xdv7+x5fJ49wNTrmABOd2+j78cEwrfB53kaA3Yr71Wsjj5cguP3ylLV
	 J3QjdoAB9xJ3dA1EC4zlp6X8DKLKy7EgxzwOIIyoAEB0g/T3IAWzntSVYbuVb3j4oe
	 sSMYUiLV+fNleZwqI7OqZnVXoQ1DoyyiFAfSC3+w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8452F8058C; Fri,  7 Jun 2024 06:20:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E08EF805AB;
	Fri,  7 Jun 2024 06:20:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E3D3F80171; Fri,  7 Jun 2024 06:16:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2060e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::60e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A9E0CF804D6
	for <alsa-devel@alsa-project.org>; Fri,  7 Jun 2024 06:15:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9E0CF804D6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Q25f5Jif
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZQ+WPlEiwWupbLycrkzAYXghdl9+dqPn0fiM3CIIAP0ytHdgkk9mtO4AQSR2O1blgP/c+EvybSt8tVUX3t5sNe/mt8SZXn7Oo5LQkUrqvFYX6cTipYxVQC9KMq69A+nIfwJLZnJxy2nCFDjeUyHmu+QgAsVffBGYTf26XflSjPlBL+X6Hg0j2rghWmNPk6W9G8bQVv6r87WAP2MGAFFEvBV4aFCAR+MFShuh6gF7al/zFoXe9czfro1KOm5VOgkxn+oONZE105KN2hbXVpZ8YuJ+/GxXy1eyRkZWzSC2tEgJULC0g7a1Q9r2Qfz48I2D/YhK/hmq52a+iujjzcyu/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Ghxl4FQQlA0M7odY6cDxw9s0H2+Aloz5BBJ+3hM8bU=;
 b=l42YeaScvPc34ozUOpWQwwVbvnp7tSk8/Dl0zIYkaeZqYDN1C1yaECdS5AFjzGRjrcp/Frg2kI/IP47DK+8GXeZGiJW8eNHAinhsMq0vsskGlvJuGV3DggtblAayr0KXxG7CKWmcUizQ76MYV3KMqVoBsc1qlWm+P/XAUwiUxaUlQRVVuSN7BYp8uJJBycqmp5qvVFPhG3XTdS4/z/R43hibKYJypetxL4G+40INnY+Nd1BR7gpl3ob/tzzhdTpSpAtxLjZAl17hKnO0wZLVGE4zgyLSIiWYiXTZcDfvr+frAgryVoMSxtDyr16UKQPRoNw5C7jLEYju3YIXKrPFbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Ghxl4FQQlA0M7odY6cDxw9s0H2+Aloz5BBJ+3hM8bU=;
 b=Q25f5Jifp1N2rIKl/OWZbzyAp4vPhjJkY83S9AD4uWDIOQ6ls+m0mhWEE8oC43GSsN5VlgMNeIdbTP6MPyTn8LQo+XmDGyRUWFNfPBTi384CZCeHb403ZvRuJvkW1/5gceKkDC7dj7Q08NYQxNTJAIZj6zuwt6gMT5Cvx4OZBh4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB8206.jpnprd01.prod.outlook.com
 (2603:1096:400:103::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.34; Fri, 7 Jun
 2024 04:15:21 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7633.033; Fri, 7 Jun 2024
 04:15:21 +0000
Message-ID: <87plsts813.wl-kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
	devicetree@vger.kernel.org,
	Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <87v82ls82e.wl-kuninori.morimoto.gx@renesas.com>
References: <87v82ls82e.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 4/5] ASoC: audio-graph-card: add link-trigger-order support
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 7 Jun 2024 04:15:20 +0000
X-ClientProxiedBy: TY2PR0101CA0038.apcprd01.prod.exchangelabs.com
 (2603:1096:404:8000::24) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB8206:EE_
X-MS-Office365-Filtering-Correlation-Id: 25b1171a-4d43-4e5e-7c53-08dc86a87255
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|366007|52116005|1800799015|376005|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?EEos2EhYOpM8M+rc89lTLEDQNJGeOXurGyQf3fU6DtFKh67YvIUpzdxCTz5T?=
 =?us-ascii?Q?MbUgNqmCMvWl28Z9sboLNZBzDACIXIeYr4IzUXSKw7xkDTb56757tWpSjXTV?=
 =?us-ascii?Q?Pr/0dR6K/8fsCpsGyPPdKW+y3Tl8yi/cLEWeNwXKLcOcO44ScnTrObAEhOX+?=
 =?us-ascii?Q?OEiobnYgfiiDT45EqfpY3nFX/CoCom0MFXW6R3mP8H9txvVE3RvTghIPwPB5?=
 =?us-ascii?Q?7JAAwCfMNbtlppQMKpcqdzyu6EWsDPKt9vIxk7b+wFffma+R/Dprrepuc88k?=
 =?us-ascii?Q?L8K7+bGdXh5TG7YWqzkNRbx+/aMQJ9HS5/gyG2tGs5MmUJ+3H4aQLtbBbwWx?=
 =?us-ascii?Q?g3St1qwjKmVPLAd0wM9CsNF7KUGyl9gBwm7YSRcwDksd7433VUqq/MTfDQtU?=
 =?us-ascii?Q?GdPiiBl5H8Prl3lZlcRZRRembGt1my1zDsALNIlUNoIKrhUB7r83DQyyml6H?=
 =?us-ascii?Q?x4Umsgy0u0ZyznTAUW8w0QvwMlw0P7kLb580kKrRtqpx8uRzZABQQzcvmgx3?=
 =?us-ascii?Q?ZuqGtsv+jVfwBe8jmIc7cRevfGHtHEY9U2XXe5wLbqF/OUf0YcdynRAmlqD4?=
 =?us-ascii?Q?8BXe9xsTzW0/dWgWNMcmH+ftmpO91/J4HqEs1ZU7c5JXb2p3H9K1Tou+QoT7?=
 =?us-ascii?Q?dYNiN+NRX8TdLw8LbIj2QgnDfK2z6IwQkxUL+7PQfrv3kwYoyHpLv1+y9MZA?=
 =?us-ascii?Q?C7+q/EQ3sjXjbJBbK+7rVFMhto8eIUx+04wmukNDrF+22ymEdMolY2x8B5R2?=
 =?us-ascii?Q?gIoHtMdWOJ5oTgc4x67I4ap12AJ2B0OfCzECwu+6QqJwt76yT2rQ+yC/Ogpr?=
 =?us-ascii?Q?cwWyCOUODbBpYyoNX0u8iObF/IRvoe//8pHfsfxeteBFlT6kCl8NdaeBm9+f?=
 =?us-ascii?Q?vKqsA2+Oyvo+u3C5MyRUX867AorQvd9Ygh8XpsA6Dthn/ucPXE8IQQOIqDdb?=
 =?us-ascii?Q?XcpJh1gauDc8SzOVpILwqBZIJG2oH5PDtYbOcJxOGgSNovdfEVb5QH3eY/IO?=
 =?us-ascii?Q?S6+zJzKqkC8F5Rjb66B5acPcbhgjNtxF3q9MRBu69ybWQpR+gNq0w5w7N7dB?=
 =?us-ascii?Q?/KNZUA9hqxJfl9sT/myTk33C2fbwcpAqZv3aPu6liKa3sn0HxPfmHV4Tb0LB?=
 =?us-ascii?Q?eeU/6GeSsVSXRkiCW4zMJvL+CZNQq7KbzXnzsaEXRc9QnAI6/4OCU2Jb7RoC?=
 =?us-ascii?Q?aWGF6OPhwGC1SVgpeG2SQek4yNOeKc9Ahsqd7gPi4RTK1Biot7xZ2W2ljk58?=
 =?us-ascii?Q?orj3pbRo8xSfLPYQ5t1YdR1sfvCf7DbVXXUbWvPm9cFN0ouSYjcqVeYJJyaN?=
 =?us-ascii?Q?k+cPmohv4DoEbVap55Yr8HK9tgH86FZx6FafqbZSS9G/VNkurl86wjswRfOG?=
 =?us-ascii?Q?zSOrbBo=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(52116005)(1800799015)(376005)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wH3lyoJvwi/EQDjdVfzWdT1tm6pOu2Uo2i2Jp3zg6HdGlMdlu1pk9L15up6t?=
 =?us-ascii?Q?S5fATBsDlhp+3s36YKpq+7/w8ZKDM26EsBUCkMkfTBSjGVGvifdUtHgL6Wba?=
 =?us-ascii?Q?Pfeb6ReVYG7QR34/gos/vnXPwfHpWrIjn/Bp4lb3o6CUbbjWOH9fhMxOnht/?=
 =?us-ascii?Q?68UbsZi3Aht0IPPqoqt45jmrr7hvd26cB1rW9QUCQQ4KSbKMkYWghI+ixU+I?=
 =?us-ascii?Q?zNfafQO49Fku2kIK9ZlyW1T0r/a+xURP2O6P7khfYTATbyn42YjzET82EWRE?=
 =?us-ascii?Q?YQQyTDaBUTAw+YxctiWKJwbZ/C0V5T6avyF3aLMj21te1pYfGgFguimr+Siz?=
 =?us-ascii?Q?G2D6ZS34f5oPExPI9n7POGhYzIk2cgWaCdwKwO7nGgkk7/Yh+w92xh5wXyis?=
 =?us-ascii?Q?ThtD08yKd1fALvzkh1M1IZSP34oYeV69ybjesfznrFGktK5SgQ6Xw6GKXEjm?=
 =?us-ascii?Q?aktORfASt0Tkpwmi92CHn/5KXgon4A6mW+zao0HVR6gkleS6G+oybYquWBOS?=
 =?us-ascii?Q?3C8QZ2PFy4A02Plt9RJrzSfXlAqN6TOdbdEXqnBK1TwD7bId3TJbu3W0Gw9O?=
 =?us-ascii?Q?u+8I5RY+0Qh56NDjNVUuFH0zz9phUhT9zuKB/H/+sCdBmstnNX29lZ7ztVer?=
 =?us-ascii?Q?OcKdYClfd+rz7aePQjaJpVawKrMdyqsVQ3DeMU7l+ac/z3R+hTy+lwkijetH?=
 =?us-ascii?Q?/vtDYKCq9oqZDKt8K+PzoOlQTw43MLxEB26+6APyPcVXcS6nvK2Lzc1KeNbo?=
 =?us-ascii?Q?RTaPNcyir6oL5NyDu4A9BjZDighTYx0DgVzg+PPl7Hl5hD1ahjEe8bbRBqEL?=
 =?us-ascii?Q?Ca6aMrGYlsr6tOAQVDZnIGGfooqKj3i1p+fqwJaA7vnHlymqmVc/ROSQ1Zqz?=
 =?us-ascii?Q?Qo5EBZYMYPqV9C291xLbEGDsUL1ei6mnd2JXoBXCCrQ6gpkMK3Uo60ZJoMM/?=
 =?us-ascii?Q?D3SLZ8sfWtuQIkdHCDUt/aRM2bXuOWr0npdBRgWImRCqHJW50YVusUkfyb7x?=
 =?us-ascii?Q?ZhLNV/Byo30FgHfwQ6UKv4Ka/i/rF84/MFqsb4LiY85hkSlagIEmDiZEGUw7?=
 =?us-ascii?Q?UR+A+6vjFkzbH2Bt9wZT3k7j+pRfFJN+XSsqPW5dVjTOc295ICohxFO6eS+b?=
 =?us-ascii?Q?PeSNdlD6jqiJUr1w84kQ29uEaGpQ+UlK4cDT3N0pSq7G4OC3k8gQimUhqUXj?=
 =?us-ascii?Q?QmpgN+8Ds0AoNeX2gY14U+W0wt17/Vp7Bl/fSa3QFWjU5gqzlgvgPa0e0CeL?=
 =?us-ascii?Q?VCku5KfJnymhcI0wjrhxoxnq3jDozjmyMoDfCkBpbLw1BZq5No3TRKIj3g5S?=
 =?us-ascii?Q?v8jrt0T9LtInaoEMmsGKpEkLSr881+5Fwf7knMjRUAyEnDKgoCpoJ527h4t1?=
 =?us-ascii?Q?UmXuMtyjA1LmeIfGq2hLBuAR8ZhPjgIEX0eKolHKR/SxfBfA2t40rXcS+Ldr?=
 =?us-ascii?Q?qsX84zqpsmb6inxnAKV84DcviGkqywXyrbuQ0uH+evM3tlTF1DNZfsg+LvLl?=
 =?us-ascii?Q?34cFTb1T5mfF/2s693/UG7VkAt7SZkQPMALNZwdp4S1hD3NZXpicGETM61l5?=
 =?us-ascii?Q?IE83Dh/KxFcBLwPstMYV6CCbbFn2JOsE/L53c3EFUG1Q/9WpwYzwXWGMJgNb?=
 =?us-ascii?Q?KjC6FAGhI0MFHJvpTqJxbCg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 25b1171a-4d43-4e5e-7c53-08dc86a87255
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 04:15:21.1191
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 whLDE1hY6bvq3dv86JeN9aGPC5EroLM1PNQUz+KRtHSOcaZGhppdMk3FJ6+dzkAJhu3jo5kNa87vOouJTimhmWtLufZN0tdZ5ucSU3fEtIhmqLLDz6pQTJnxJUnb0Ngr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8206
Message-ID-Hash: LVJPOJPT4CCXVFWP4D4QA3WDJATEAR25
X-Message-ID-Hash: LVJPOJPT4CCXVFWP4D4QA3WDJATEAR25
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LVJPOJPT4CCXVFWP4D4QA3WDJATEAR25/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Some Sound Card might need special trigger ordering which is based on
CPU/Codec connection. It is already supported on ASoC, but Audio Graph
Card still not yet support it. Let's support it.

Cc: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/audio-graph-card.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 7b981aa8690ac..acf7d92d21e60 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -143,6 +143,8 @@ static int graph_link_init(struct simple_util_priv *priv,
 	struct device_node *port_codec = ep_to_port(ep_codec);
 	struct device_node *ports_cpu = port_to_ports(port_cpu);
 	struct device_node *ports_codec = port_to_ports(port_codec);
+	enum snd_soc_trigger_order trigger_start = SND_SOC_TRIGGER_ORDER_DEFAULT;
+	enum snd_soc_trigger_order trigger_stop  = SND_SOC_TRIGGER_ORDER_DEFAULT;
 	bool playback_only = 0, capture_only = 0;
 	int ret;
 
@@ -165,9 +167,20 @@ static int graph_link_init(struct simple_util_priv *priv,
 	of_property_read_u32(ep_cpu,		"mclk-fs", &dai_props->mclk_fs);
 	of_property_read_u32(ep_codec,		"mclk-fs", &dai_props->mclk_fs);
 
+	graph_util_parse_trigger_order(priv, top,		&trigger_start, &trigger_stop);
+	graph_util_parse_trigger_order(priv, ports_cpu,		&trigger_start, &trigger_stop);
+	graph_util_parse_trigger_order(priv, ports_codec,	&trigger_start, &trigger_stop);
+	graph_util_parse_trigger_order(priv, port_cpu,		&trigger_start, &trigger_stop);
+	graph_util_parse_trigger_order(priv, port_cpu,		&trigger_start, &trigger_stop);
+	graph_util_parse_trigger_order(priv, ep_cpu,		&trigger_start, &trigger_stop);
+	graph_util_parse_trigger_order(priv, ep_codec,		&trigger_start, &trigger_stop);
+
 	dai_link->playback_only	= playback_only;
 	dai_link->capture_only	= capture_only;
 
+	dai_link->trigger_start	= trigger_start;
+	dai_link->trigger_stop	= trigger_stop;
+
 	dai_link->init		= simple_util_dai_init;
 	dai_link->ops		= &graph_ops;
 	if (priv->ops)
-- 
2.43.0

