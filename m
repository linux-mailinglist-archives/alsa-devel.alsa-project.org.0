Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83844737902
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jun 2023 04:20:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AA77836;
	Wed, 21 Jun 2023 04:19:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AA77836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687314002;
	bh=RuJA7kKwDkl0zfZ8MQE7GU0sQy3ajMYlLqZGCg08kiU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Cc91xQutaRqpO7l09BLl1uUemja8CtMDs3b1cOwMwrmuHsuTt8A27EIDbr6zSZsD6
	 AIh2eTH6vt7jmEYCikzm+1g3TgFa8rhgXWGArxlXrDWrVX7lwh3TuRIb7JGwjse0X/
	 WhmfRTbDl+fmCa6vHXC3P3j9ibIKjAqKHOyYPMQM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C728F80548; Wed, 21 Jun 2023 04:18:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FE4DF80548;
	Wed, 21 Jun 2023 04:18:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 34F83F80549; Wed, 21 Jun 2023 04:18:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2071e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::71e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B715BF80093
	for <alsa-devel@alsa-project.org>; Wed, 21 Jun 2023 04:18:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B715BF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=cHnU0GSd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QuHa3HBcEZM+T6nL4/u6UUqUVmHWOeuGk07EYBFHzbg5ypmSSy6keiRjuRP8sR36MRu8UqQH1sTTs7GWQSfJJeKuGH+48DKUP4UfourvUAmfKyMjd0z1s5RIvNCi8nojcsT2RgDG/dT1cRks72L9M0+65b9s4M5aBbmb7+Uo0z2VU3XmbwmY01zZNqfzUU9HiETONGHVIJTqIJ0Q1gXFEpZs1tQGjejxz0Er/9XqNHHE38ksey0AFgT3acwpUnZOsP2hxs3QSKz+flBNrxv3H+cNpmN1iGQ0ZW+xA+aJZekGn43XepPMjlhoRTT+iaTqgRZrctgcSHueywj1TxqY7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Exp5heEThK2Zo+i2NSQLXLOsl3PzDOYjWpqDjrhr1A=;
 b=iZrALVmc5thZC7cg1W9xWj2jqHm34TCaiaNjbA2rRNfatlPVFCaJonbN+ifKRUNx5wKQSwLZ4WKRs9ooSt/oaRQvJBe6PIf6qSamiE+cK6eD1bjk0YmmtD2Yn3GAgaOW4HQYH7wGPKWwuWASibQBBj9u0Hn/RbOM592EPig0rqpMDrWwfstTwtSLiDm7B9okTa6YFZQHIgOp4T3QWSjg+8Q0rZ6Vl1ruKvdsBt8niXSrVGWEuceCtlbS5x3DPa0o1qkpUcGfQxmxNcNUW66T7b537UzhDk9bFH2mcnt4PUzwh+9Cy6HuUK9Op0h9joqZ/Du72r+No6bWmfE59Srxmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Exp5heEThK2Zo+i2NSQLXLOsl3PzDOYjWpqDjrhr1A=;
 b=cHnU0GSdXNitmKvARe1uBfvE8QaUJ1H9H1uWuMUFzI5FP1ULXVynrKaCnmICN5Xves3SX9ZG+jMLIo6h/g63aHy1SaPilmaIeisj9e6f0/guBziHDogl/Z6hN5PWN8zccW635lBUihNMeNrI42rG/7iDWERrfAL7yVq0UUQG2Sk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB10367.jpnprd01.prod.outlook.com (2603:1096:400:243::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Wed, 21 Jun
 2023 02:18:11 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26%6]) with mapi id 15.20.6521.023; Wed, 21 Jun 2023
 02:18:11 +0000
Message-ID: <87pm5pblst.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 01/14] ASoC: soc-core.c: initialize dlc on
 snd_soc_get_dai_id()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87r0q5blta.wl-kuninori.morimoto.gx@renesas.com>
References: <87r0q5blta.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 21 Jun 2023 02:18:10 +0000
X-ClientProxiedBy: TYCP286CA0238.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::11) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB10367:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c659177-f656-46da-6b37-08db71fdc2a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZKYuSeBPiIe/GcTbiCjsp/PqZRbirgHpVxMM/Tht0LvLdjuGd/zr/wTpsV+PWS+RJYdatav+SH9Rvf6W1O4KijfyW6fYfTQkh9ppwJPwr2DCr7L6ggjcvGVsBnaaKDMszkZZ1ETz9wCYKEdD4b9zEyy+dx5Fpm4NCctj+oHk9GbjSz3zcITBDgsIi8AQJrkF/unaK3/1HIy5J/EjX/PtLp3D13b0BaiYQ2xBo+dTsqN8ftXg9beXZCtq4wtd2584HIUfpSl+GOznyv52Dw83de/rV6zfK8BtTE15F5roZYGS1hJgh3p4HAuMbHM+85mPWa3kKoX2+22fsa7iJBQRB9EIbumX06mE+YmQaUjuAZurmFTqyGjN/zQsSv56NjcTDESxaDbKSClh6luIK5p8/N0R0enhuD4xR9yNY38ymCFjuS1gmerHJ1TSXpLAN25aBFyVcKHgw2yCBFjWpgQhXuAfgk/nH0UIzDv83d06p3UZ/vJoiPRU3ddrna7fjQcRo5ica/Nom6rSbvCkwHObL1eGfC0C89kS23GStJSk7AhUI5kTvk4vp4vS9lCYcdRUadcKMptZi0rx1OisX6D21TeH/V2T4NVlOVVKuTadvSZsXqfLkDUokurBMGwhebHv
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(396003)(346002)(136003)(366004)(451199021)(66946007)(66476007)(66556008)(4326008)(6916009)(186003)(2616005)(38100700002)(38350700002)(86362001)(6506007)(26005)(6512007)(83380400001)(36756003)(478600001)(6486002)(52116002)(8936002)(8676002)(5660300002)(2906002)(316002)(41300700001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WFmnyBuQ/Tdx8L9gskcuEE+e0HV7tOKvB89/GQPGYpeVuXOVTLYuIiNjb8fE?=
 =?us-ascii?Q?4wtx/6CMitk0/6iarU7BxyHDeeBvPIqdTU1kunJESwyEop/c/9CkR1m4vRRY?=
 =?us-ascii?Q?buiTG/E6RZS+ToOVnaI3JUP704o56gGhvvS8W3pBpLi0e/6nkmwcENo9F+EZ?=
 =?us-ascii?Q?THlDkGCCw1ZdZT755xt3hcplqCbMctCNK4QTerJHQMLe9RtkSAnSWPARxHzD?=
 =?us-ascii?Q?Qq0oBqeSIvjuvmCsKfbPp5G1bfnl1fglymtDz3StO9Q7P1ixfBrTkzbErOzu?=
 =?us-ascii?Q?D5N6HN3XW+1k2erwKO4ex2udVad4wqdvNOpe8BWFFhPRDfgEUOBodjRnVqdm?=
 =?us-ascii?Q?p3nn2xuz5AL8CTCLNtzqATDC8wBZH+YXmlJ5lfo+6Vy8Z8F3kLYCTAMv6PCH?=
 =?us-ascii?Q?/qScCkbCvTusTFmmOqQMstj0bBKJdPuw+/wSIVjZybAkWoBhlaOgCe5RI3m+?=
 =?us-ascii?Q?CZ0+1pQMR52ySNiL+SOLvcLpNNP+qlW7sMtTRtZ1c26a7EBZ/kS7muXg4lFq?=
 =?us-ascii?Q?5rYPFdFJmBAgjiZ7ocIbeJfIDxt0vtHNdBDewY2C9GIHz4zzWpCk0sANKj0r?=
 =?us-ascii?Q?mmrPhtpTXEGew9FQdgFK9qq1q92+8p+c7RCx5FMA7lcpBGcuntyJ4ql6THWO?=
 =?us-ascii?Q?FCWn00h+leQaOFTOAYGB4/SQUrcRWJ5S38gverDamyWdgTiGz1+/kShlZ3HT?=
 =?us-ascii?Q?M0ROPjPPEpKpGui5DLRp7ebxeanQ3jRnNLhfY/KxSz+8VC2lNQjaG1K8tcaA?=
 =?us-ascii?Q?zfVobzFtmCjQi9qRnsf2zVY8HM3PMjP7/ggxvGmR8J2QQple4cjEgKle4SPT?=
 =?us-ascii?Q?kKEyyAJ7EramwpcbcJQuB4q0+aRyaDh4zAVuWb3os20LOqmhecLdNa8MfUAr?=
 =?us-ascii?Q?HI5vp1NYRljqW0vTuv3Cjr5euB0E2RS3PNuChDbhOY/KCpPFtGad/AlAhboa?=
 =?us-ascii?Q?5kWfVoGOjxkqCf0hp2E486HAtrTF1Yc51Z+fQm13PYTRL0+aYx8uhAxnQLUM?=
 =?us-ascii?Q?eMLQfMUmw2MSkXgUVrki3dYmMShlb5OsK7EqoNdhWXSh04Q5O3iZ7mVVbpkN?=
 =?us-ascii?Q?cEZdAVYzANmOlar8DmCUlKw6zlyvcR1ra8weGr3NEXbKj5EnrEbwdvdahG4r?=
 =?us-ascii?Q?B8laGS8o3E8D7MKhjE0WCpsrdTmcos46Q/Uxgh6qG2PX3+G9H5j53cjT8x9Q?=
 =?us-ascii?Q?4a/xi2F6MYtlAh9lJia1h3UIZX8+jjnS0P8KhTycjplgBHG8Thsh08b2qwBZ?=
 =?us-ascii?Q?28xRp1ds1VREJGUgDc+P1l2Oix4KUGkRm01/2DwSbtEFQQ7DojskL05S3+mS?=
 =?us-ascii?Q?DFFLix1xiFM1Qt370/tpm+zM4ZFuSYJU8XKenQb12UagEkxBLavkrniVUTXm?=
 =?us-ascii?Q?iqbYiEfSS+u/2UWm8iWgJI9vBMoJPrBO1eW1NN+fNwj+x+4+yhRX12vRUvdO?=
 =?us-ascii?Q?P4l1086fLyxro/YTT9OeiM2UEHILP4V56i63ftTEWUcgM52BR2tJiHu+GgWw?=
 =?us-ascii?Q?rvMV7xN1CQsrucieg1uvP37p5Icdv39XCQn2Pa/e61Yv2d7jFqZSVn4G6sXc?=
 =?us-ascii?Q?/O3PrdYj6z6vsbraLz1Q6K/DSZDWhKv/uj1lbqx2zgbkNLCcgUxb7lb+7eEC?=
 =?us-ascii?Q?zfGb3mvVuceH1/csVqnoPQA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8c659177-f656-46da-6b37-08db71fdc2a1
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 02:18:11.0636
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ySUuuSOyBwUtDVwgNfzWhBuPpAlVSjZhPg8v98HJs4vO45DSM8K7vQcvY7cz387/42NwmbFoww7UTmndqqfoPC5kxKMZp48wwVayydag5Qo9vLZNFk6X1JRXmylEDCAb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10367
Message-ID-Hash: RSAHPRCTFKR3ZAVKAWPQYOBZBN7P5UKQ
X-Message-ID-Hash: RSAHPRCTFKR3ZAVKAWPQYOBZBN7P5UKQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RSAHPRCTFKR3ZAVKAWPQYOBZBN7P5UKQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Current snd_soc_get_dai_id() is initializing dlc *manually*,
but it will might be a problem if dlc had new extra parameter.
This patch uses default initialization, otherwise, non initialized
part will be strange value.
This is prepare for multi Component support.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-core.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index f06a20773a34..b25c26deef63 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -3233,11 +3233,12 @@ EXPORT_SYMBOL_GPL(snd_soc_get_stream_cpu);
 int snd_soc_get_dai_id(struct device_node *ep)
 {
 	struct snd_soc_component *component;
-	struct snd_soc_dai_link_component dlc;
+	struct snd_soc_dai_link_component dlc = {
+		.of_node = of_graph_get_port_parent(ep),
+	};
 	int ret;
 
-	dlc.of_node	= of_graph_get_port_parent(ep);
-	dlc.name	= NULL;
+
 	/*
 	 * For example HDMI case, HDMI has video/sound port,
 	 * but ALSA SoC needs sound port number only.
-- 
2.25.1

