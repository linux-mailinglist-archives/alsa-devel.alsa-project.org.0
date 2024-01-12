Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF95982BB25
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jan 2024 07:11:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97768DFA;
	Fri, 12 Jan 2024 07:10:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97768DFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705039868;
	bh=AtYRpCC00AdPTPkq91oVfRgDq0MPHpFD0vT4QwUjD7Y=;
	h=From:Subject:To:Cc:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=JnM3W8uCe4lyijn1LZ4vG02BE7UH8gPQZwfwEvHschCjz2TcCTcCxOcLUOhGxC5z9
	 yl1BRxRIqm542apIAqjhp4dJ7IDvsdvftImQ+RtIQFRMlIAGreRSLEgzhdBdrer7bI
	 ExcCrvWoQ5dsxnTIu7IXBYlE8OSkzpvDATTmP4bY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E225FF80589; Fri, 12 Jan 2024 07:10:37 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B382F80520;
	Fri, 12 Jan 2024 07:10:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 86325F80254; Fri, 12 Jan 2024 07:10:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-4.2 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20701.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 512FDF80086
	for <alsa-devel@alsa-project.org>; Fri, 12 Jan 2024 07:10:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 512FDF80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=DdfetJUV
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SNt8tAm4z+YNZyuPI39e9QTEqWj6al3NM282o/0Wfcx0qMy7Gc97QhUFYZU7kZR+nZXjOlF4f1XBI18DpdSKNF96xZ163fkvDtNkUD/eP6hHIIjz5/RZfuO6aSYzvM64LXwldwiFQ/EDRI1Kf3hMMATW7yeAGq9i6gIiqNSPXg/2aNNQP9txmO9XCoqTVXNmPLfgIZtMcqk4zKkV9eWX6XQhEo+qxpSSWHsdd5sN0tpqOLG1E4Pj2eIpC7rQVFEJIYlE+EguGzxKVrBsgTjIbLYI+XDKCAFxWiYgbbZpjHAiSGrnQqvLi176919OamM6LOeCjIL1t/NvjxIO8/QLRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2JRkvSpuHqHfk2ctgArC0ItIoU1/YSSuPxiCH7kDVdQ=;
 b=HUOLJ6i04gZJaFMRNetZ6Jl0Sg5uGrcgIcnh3myZlN8DcjPhUXZGZqkbPFYeP4hrdloeR7NCAJWblwlUorUWRVZfS9YsM5HQGBgUXdcSM4IGNqYFL9Edm948QnwBjSvZH8exhSJLMiW+Ml+rv/VYu/twvSThWe+/ujYcwbLjbOYE95dYw/UltCa+gqIRYZ45ksKZcJq6928gOw72WoVcNx5z1LgGiHkyDu2y3gCq6y7Dd7VLMUDk2DD0Q9n8NlJ8KvtIwKbdTYflw3sJMSLcU+XSU2SfVUS+qQlR7O8jDxo+wCUG/OW7lIc1I5wEwusmcehnV9MdYnktMQQbJpW3aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2JRkvSpuHqHfk2ctgArC0ItIoU1/YSSuPxiCH7kDVdQ=;
 b=DdfetJUV/brHlxKRQnON2pwC1DtxJOvKxfsmkw0HbnvekMpeZERLMWfQB6qRld2F2qanUhMpaqOJWBfwB5g2rTdBH6kXg7FPddUHUxi88TLNgxOx1wkY1GSsWAHytIwv01ar41fuYMN4n6eNpqaWQu1hCdlkAP/muoP0dYUpWpg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS7PR01MB11442.jpnprd01.prod.outlook.com
 (2603:1096:604:243::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.14; Fri, 12 Jan
 2024 06:10:15 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::91d:1bfa:edc4:1c5b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::91d:1bfa:edc4:1c5b%7]) with mapi id 15.20.7202.014; Fri, 12 Jan 2024
 06:10:15 +0000
Message-ID: <87o7drdqux.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: audio-graph-card2: fix index check on
 graph_parse_node_multi_nm()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Sameer Pujar <spujar@nvidia.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 12 Jan 2024 06:10:15 +0000
X-ClientProxiedBy: TYCP286CA0253.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS7PR01MB11442:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f1532ae-b666-4e33-4951-08dc133524c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0Ovz4SLQ9eZfDyOjUuusSpx/McP5y6ccvJy+0Ono/pd+/g/Fpp3Wo9DMfzKOMoUZopNUYgTIHqdGJ4v2ovH40SUo4zIBA+xQpFXFR+1bhPtXEmUtJR4hgN8mcsSg9ufID/x6mU34Y6LxBSM9nxYHTv+xiuBe6FkUuqfoo8m8ZRukHSHcTuKLUnppv33OsvQ7caOFFow4bfiNIs/M8/UZYuBqAa2QdAaS8tUk+f+KDH6QmydxNzCbbOfspGCad77q/Ah/u3+usdWQInOJ9dhkNKjfuInGbURPAtyl0JerBWr09sZtMB9hAEh2z/cKOIItD4tJQTRpX61OGr36/TZT5cAOAMnan+kTsH93+6DC02qCN5ahR2ldYT1JnvAOgdVLWUo9W+qqKyv6huab9cP7ESsOqKAWb+zFl+AGs+a2KVx2bKtcOPdaVKbtMSUdXVzhZRXJuAVUUppJJMyhwbNzG2qJuAV1iD4VJw4dB9wdhAUcWvLq8cC7U4+Sx1gwz6Dy+Gi1lyrr3jiPbLdB/zF9zzRmtDeasQMIfQZ4Zkiidar58CS0L+vygC7eNSPNKFXnu+qd4mowb8aKws8XHB9fmrHgCSo6EJ8kNWh9IzEgcprn7oIwqaSYVYwJaaz9c3doLfFcRGkxC2ZDptTIqMgGlg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(136003)(396003)(376002)(39860400002)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(5660300002)(8936002)(8676002)(4326008)(54906003)(6916009)(2906002)(316002)(66476007)(66946007)(66556008)(6506007)(6512007)(6486002)(478600001)(2013699003)(38350700005)(52116002)(36756003)(86362001)(2616005)(26005)(83380400001)(41300700001)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fDsZdJfomjojAVly8T1PXfL+JC/9PFrMYH8EvvtXEIKebOHWYHTVLg855lho?=
 =?us-ascii?Q?cdbXDBYyNOP126LtozGr3mROP7tRDAphhAAOKSam0phYZEdNFUQ4XwflVEMr?=
 =?us-ascii?Q?gExGHniSk/o4LhxMZOrXOgVRCMyi8gmvy/RHvKQmKJgJOoe8hlK/ZHmJ3kqX?=
 =?us-ascii?Q?hMfWZJrRsh82sQBZzYbK0iCIo+v/rtVmLKGMLDQDe2pk9dDB1gvaiFhHReXm?=
 =?us-ascii?Q?+7zZZ0Lh4GqxdnSRgiYrVOel5P1k9XvgCLceDuozIX2ltPr34wKDbVKlhFNP?=
 =?us-ascii?Q?FcdOVrgpl3FJ6i5gFEGEoAsQN7ewWiL+GQ57q8bFfxchI5RzqZohEfeeErCl?=
 =?us-ascii?Q?GFh7gXQWjWar4pvNtr4xw/dbXQsign4ZMM1UB3eidwwfITEaU8o+YMF09PPL?=
 =?us-ascii?Q?ypevAsLqvbib/s/3Y0maXtG/XQkSfsF9xnp6We4IRMeRecBXMPA6zg1/f6hl?=
 =?us-ascii?Q?1OiVIwa+7K/Zilp6wTY28L4PQ7qJysBW+EWIbVi3ooYKU86xnPSG8jZJxqda?=
 =?us-ascii?Q?6cX4BCDEknC6qXUvfW7XpkHv4H1rqj2jLMFCWr7SOr9B9/h7wsqc//3pvuuF?=
 =?us-ascii?Q?0sKz4eEWKQc+r6HtToys3rYqXEYPBxcNTYcZ2F2HJ8MZxZYRE7N6XtgTEjZv?=
 =?us-ascii?Q?5D87DP3dqX/1ij796uf8XrlnpSTYK0Rv57Cs/4KzG64sMfFvIsWw+xDLuMwO?=
 =?us-ascii?Q?uJlqpvi+WUdnwZaJFOwHfEDG637Ea5Ec93ThnlqRK1r0yVH5eUkZGQYKlKKr?=
 =?us-ascii?Q?93sdI8yXUZm4AbjOgUbNhbZoKBnPHaSUG+AHNOsp6YGKYfv5SnUUm8IZJQEl?=
 =?us-ascii?Q?ybeTkcYxD1X3WZP87YkTGvZ2TNHLmVgqOdETVqaAI+jfNfZ7yFWbHdR8D5lv?=
 =?us-ascii?Q?D3VvvuTfQ4uVCAoZpskZ59UEC4EpGlU4H+MNCPPPOmeXpb0QVLWtFLBmdYAc?=
 =?us-ascii?Q?IKOlsvMM2WL0vQaFmXhAUbQ8G17urJ21Mlu6Em5aKCiDto+DzM6FQW2gciqN?=
 =?us-ascii?Q?yLfJ/dASVLGlBWIzaTjg1tJ1JNyEUHgwDMLQic68e8tjcHDBwe09Vdn3WSb9?=
 =?us-ascii?Q?+xlZNYYbjZJuBF7RLAEbBxjPskIHG41SZMQ0g3q11HBr1kiW7+3E47RZexHQ?=
 =?us-ascii?Q?s4UG5NnH2RF6apqe1m7XdJPayP/z/NIWc6T5RSRIvRUFetb/JEl85MYJMql0?=
 =?us-ascii?Q?IE2vwfSC0Ii/P5Jkgtz11hMktRVBrk4j15JTcOVVz83Oi5Nbm2tn0pvbP2X+?=
 =?us-ascii?Q?vVxYxb1tdfB60P95dR9rloXkY0+H+pPSCV+bgryEyp1vlkmGVLTlwU3NwB2m?=
 =?us-ascii?Q?LjuLrwptz/s6OJrhwq+msJ+x49zSWR60vnzkErpfiCOMIqgbTwKXlDCSROyT?=
 =?us-ascii?Q?pRSMZf7wgwQppFNs9zNRs9YeQS8qJUj0alS0W6YjS1crfAB1xxooG3IJx9PC?=
 =?us-ascii?Q?2VceHAlV/cByqObVFNhARn/EmFIBpwcECjWlULWW+BM528nFW9ITXjU9Uco1?=
 =?us-ascii?Q?gf2c1exxa0ojKYie8AGgVa/ZDtedQdZ6aR8BXrWuWNUVZHltOgVkHxYlPFYn?=
 =?us-ascii?Q?zZsMXe0Gl04l2I+bz2iL4ZGG89A3dxrOiMgPgGsElNaJ657lT/2HCilvKKdv?=
 =?us-ascii?Q?+Ps+cuf+zvr5LSbeeaIggcQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2f1532ae-b666-4e33-4951-08dc133524c0
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 06:10:15.2132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 HkIpH9ewNW+Wv+/wOXFkpIRhcqwbI00baag3fwg6+tjSU1ZuMgxQONni3jqMPquvKegUrUCBoVjSnH7+2nzX6MVyzxEIEpcvmvcW+clG9tTrF/a4hVcQ86qIeatzrUZo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11442
Message-ID-Hash: VMOLRN7D6NH2GREVMKZZCIQIWOXXOKZS
X-Message-ID-Hash: VMOLRN7D6NH2GREVMKZZCIQIWOXXOKZS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VMOLRN7D6NH2GREVMKZZCIQIWOXXOKZS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

commit d685aea5e0a8 ("ASoC: audio-graph-card2: fix off by one in
graph_parse_node_multi_nm()") uses ">=" instead of ">" for index check,
but it was wrong. The nm_idx will be increment at end of loop,
thus, ">" is correct.

	while (1) {
		...
=>		if (*nm_idx > nm_max)
			break;
		...
		(*nm_idx)++;
	}

Without this patch, "Multi-Codec-1" sample on
${LINUX}/sound/soc/generic/audio-graph-card2-custom-sample.dtsi
will be error.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/audio-graph-card2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 9c94677f681a..62606e20be9a 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -556,7 +556,7 @@ static int graph_parse_node_multi_nm(struct snd_soc_dai_link *dai_link,
 		struct device_node *mcodec_port;
 		int codec_idx;
 
-		if (*nm_idx >= nm_max)
+		if (*nm_idx > nm_max)
 			break;
 
 		mcpu_ep_n = of_get_next_child(mcpu_port, mcpu_ep_n);
-- 
2.25.1

