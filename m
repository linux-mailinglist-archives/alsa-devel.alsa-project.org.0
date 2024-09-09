Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98648970ADC
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Sep 2024 02:56:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DC191EC;
	Mon,  9 Sep 2024 02:56:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DC191EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725843403;
	bh=vN2YEO5vGQdyV4WnLds9of+oadbrrznAb2JGgunDiAM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ipEWQkHQRKqwB/UWyhFf4E3eLZX9RZhKIA6QOsqp4dLic/b49dMRVe5m9tEZ0WncF
	 vU21hOR/Iq2bVFwP/MlzKs7BL0x/y2AFJLHPFYDRzcPD0uILYprJKgChUA+qw3n6Yr
	 C56QMloumqLeeDMZ+jhx38MfKGjrDFzIe9VsaWlo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D319F805AD; Mon,  9 Sep 2024 02:56:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B7170F8058C;
	Mon,  9 Sep 2024 02:56:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 95EA5F801F5; Mon,  9 Sep 2024 02:56:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c406::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CDDB0F800E9
	for <alsa-devel@alsa-project.org>; Mon,  9 Sep 2024 02:56:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDDB0F800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=J9zn8/C9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wVyrWPj25/JMACPwtratLrYsZuJ7u3ou0PNXHBWjVePHvzutmzzC4dKert6PLcuwJafX4s9hBnS69BQvpnDO1IMd94soQEpewDEqRmgbZWTir3WFJsxWGr2M2DS87ZIVsmVvDem8Ix0Xsstpr+oir/KJO5V/vMSrvPY/ytQM2lr8jdEvZ3k56G18cdxzjH7E6y3fGhATzBY2ZWTA4G+14wqlY9xuyU2WxT1UY3PsCu6ZPU4fGweROhm18kugBK7m0lm72IA0sOXssWW/c4nX3QmzhTB2tAh8DHIZVLnTqjkPggVW7BeuJi6yWfOb7fN6Rk3qTCneGRsdgjqc6XZCgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V2CvQfyst+budBWNu5iw59yDMWtrBJo8+DlFMj7/CIE=;
 b=bOv71wgCnypJLPJHLFSfL3Ixj1mF1BaX4zUaUopdljEsQNVbysN+DqLykaZDW2TsJ6OBOXldXrnJc50e7NkXGahV2EUl7YpmsKTos/hokJjB1nrdtU1pOxSXLQNdDDbNsrxqVgaqUTJmK4Oo/mwfXiCYfzStWVdUQ4d3qYpkeZQYR7tJONxFmlVqhUqPc2PYsvoYz7oGyNOT0EcCfFDSpKYGbttS/4acebMIFOu9dH95GajfdMdQAR2qzJHls7BCu0JrGclmAVRF1sdZ3mxGXP0Nx0eWglhSnQpBtLDOJMnWZ9rnAIcbGddaqvHX73LuGhLBFQkYM0u3nPRcqqDcpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V2CvQfyst+budBWNu5iw59yDMWtrBJo8+DlFMj7/CIE=;
 b=J9zn8/C90pU5fpdha7gZyg+8p/l6VS/6HNF5Zl8cmxA/UpA4TgVTzp6BGpL5aFTNL2PGx/5gK08EaQo6gOKdrInmVJNtN/Cmn7Mz5/WwAJqBejrljpAsJ3TFvPlXn914ysSyGYs48tUN7p2alApycDjAtGgZx5sk6Xzj3MPs2Uc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9781.jpnprd01.prod.outlook.com
 (2603:1096:400:20b::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.23; Mon, 9 Sep
 2024 00:55:52 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7939.017; Mon, 9 Sep 2024
 00:55:51 +0000
Message-ID: <87frq9sl0o.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: How to handle complex Codec2Codec
In-Reply-To: <ZtsEZmOAsgaPnlti@finisterre.sirena.org.uk>
References: <8734moq6ca.wl-kuninori.morimoto.gx@renesas.com>
	<31fb2975-4a27-43e5-b9cb-37db3206f5f3@sirena.org.uk>
	<87ed62ogvp.wl-kuninori.morimoto.gx@renesas.com>
	<fe428f02-3eca-4dce-9eef-675cf3e56831@sirena.org.uk>
	<87plpikfgv.wl-kuninori.morimoto.gx@renesas.com>
	<aeb9d0e9-ac50-40c4-88dd-30cfa164d7c8@sirena.org.uk>
	<87seudr89e.wl-kuninori.morimoto.gx@renesas.com>
	<ZtsEZmOAsgaPnlti@finisterre.sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 9 Sep 2024 00:55:51 +0000
X-ClientProxiedBy: TYCP286CA0232.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9781:EE_
X-MS-Office365-Filtering-Correlation-Id: c49dcb4b-31ed-4022-aae1-08dcd06a26e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/KIgEX9z8QTgNSWwoW+QPvy6/toFLU4Gj/8vzvN1t8K4Kmp+bOaClAlztmDP?=
 =?us-ascii?Q?JCg/SO9ilzbYG/xCe/ZJjNkO1/K/fgKWZs1thPsc5Q34UJdadSSNmrXxzm1c?=
 =?us-ascii?Q?2UDucNOJpsdc0a5/q7KxirzidFpzZv0DlUjJPvHb8W7QpWwrLqaw4xyC/wS/?=
 =?us-ascii?Q?iuhy+L5gWJzUsQYois9Peir7N8sVdk892kWmf4cGwCZZgIGgNVmVzfTLwWV/?=
 =?us-ascii?Q?47APRpRABOLr85X+ciVbz3mSOc7Nx2waClEU/UrFh37Khq+ak5towB1Qt58l?=
 =?us-ascii?Q?MJ837fWGMu7UFaI8OyVxjtLM84VISPAO9NPPvMgHe5GdWjgdVm5Gd4hD2iUF?=
 =?us-ascii?Q?SHoVDfpmh019vxqpooUzSVlYxm7/pNKRriHmXnfDTjCvZrBxwIPkJmhUBneT?=
 =?us-ascii?Q?6+H1aq7Rff+t6f+q7B0GPe75bao17RspwqDiU2gHasXWXv7WO8SUD3tzbMTX?=
 =?us-ascii?Q?jbLilfz/FjxYiP4aK6RNJwVT9OzVbUM5ZSswWUfRvC5sM+GeLCUWLE0tJ3W6?=
 =?us-ascii?Q?esQ3Z1+fpAj3wHs4ELrrYBtoubHVS+1QDkdUN51cRL33xX9uZWfGw1a1UHcD?=
 =?us-ascii?Q?fp2Rz9n8AxhIzxGGKwEq0Ef/xk9PAfuz7yaGtW4BedE/f79T4yUM+qCEFeDX?=
 =?us-ascii?Q?O8q+tKWtvnNPUuLrBfuElLrtsNbwMAiQFhDQBw3dWz7Y+Mlhb8Ohzv/iVUB8?=
 =?us-ascii?Q?A28wD7qOGoksWYvOJtOENcCgl6ZDIXC7gD/evY+jT0ZTDnMWfOp8yQvXL5m/?=
 =?us-ascii?Q?D7PDCEZnMnV4VTMmkC0kIiYESQEbAQLtz1zGs7nCB/lyXWSox1qhby3QlySf?=
 =?us-ascii?Q?uFIrXWbZ0vuGE0Lz7zVBy1YAWu+z5r+Z+5vqw1EkGdAGBLAA8uPOLCDt6K5R?=
 =?us-ascii?Q?AJaYcSltpm0u0ImHITQFN+0TdxsiCVnrUlSAGLgnaxHaqK9tH5906Gluutus?=
 =?us-ascii?Q?iu9HktSETjOLkFpRfXW+JVyOrejPgfNa10JyvHQZXAiYoTR1H1qo0Gpdvgk8?=
 =?us-ascii?Q?O1+aFRYhu9RBKirOgrKFj64MUr1FufJ+5F4kPC0pTVwAm5UWCB/R6IHNwty7?=
 =?us-ascii?Q?q/bKvPrNiLuWThiOGMMce4MaaYyMojO5yViGAIo3XWtF4lzLaVfDTROxa/7o?=
 =?us-ascii?Q?/CvF1oXGKEU9o0LEJ59L0HIpFSNxdcxvqQIMm8GL99zcEArrHYW+GKM8hzQk?=
 =?us-ascii?Q?6VgfCXlB9QlqEYZIciYfCOvTkaA03nNhCe3Nfg8atmSiiu84ctPYJ+7QaXo+?=
 =?us-ascii?Q?ruswXUUmX6uj0HdbcjqHLgXmmW1QSaLIhLzeNuVRLwzVjx8RbHxd8t/1vVxd?=
 =?us-ascii?Q?pBKKxMRoz1tY1CbCGHjbTkkvabLyscp5qpFg82GLWGceBkeoKf6bYO1l/elU?=
 =?us-ascii?Q?nke9iF5bPzmCUuTlecYjTd31jPpEx1OZkaGFiC5VDnWEo4/Z7g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+8N/81iCCLq9UB3QT4YJi3kSBcn+uoRj4QoCsuQvgYOJ3qFBBQ9S3k/JYwRR?=
 =?us-ascii?Q?+LQ5EuDuwkp0KuI/1DI+m/K/wuZ7HZimvNU1hLj02JPSTm4jY854zQFHyeyL?=
 =?us-ascii?Q?j0pRe73sJ0RwfMCcv6PfE2XpElU/N/99b/Bew4M1mbdIP3XUTzpVChjk+7rT?=
 =?us-ascii?Q?C3GbKSBMRdcdX+NmOFC5L6IG+iAe9cc8re7McLlE+7DltIaUTNUEKzpVVR43?=
 =?us-ascii?Q?g2rkx4qvGrGnff7NbKTSzw5xOUetrYQi5yPU1FymGoECrSV8bWcAEkBPrp0A?=
 =?us-ascii?Q?5Hu8g/inS6ZwCFH8bIURtLGPAIYaNVpYoSLl6nmJLsjS/yaXGnALa5ihuCNA?=
 =?us-ascii?Q?pvW/OFPSYu9pDJGfZEHu775AJccp/sLYPTFs9VD/X7DPGwDYYhEZAjG2lhsB?=
 =?us-ascii?Q?xjio0hrDDYiBQsgwMEN1hlbd6A1+UzyMAP5Z1wAgp8U6CJkTptJLCjw8poke?=
 =?us-ascii?Q?/upNrIH307HlhPURFAyfbyiNmwFjGBzgQd4NrKLyqwt8E+o0+Pbemf3WLEb9?=
 =?us-ascii?Q?FLCoq6hKXWAg2CsbxfaqN+5wzCecugN4L3pmMjvQa04kqLj+ZMCmS2Gxi2oA?=
 =?us-ascii?Q?aZln/G4uzqe6HJMU8mJKAx4wYokAnbmIK1uQKJ815zhZcXFh9IxMUyyZ8suh?=
 =?us-ascii?Q?eIMtVOgssUwWogINLBFPHGrlbgB2LLWxA2YakUe8q+T/qvkZTsbZwd6/aaDZ?=
 =?us-ascii?Q?2yoiJMtFa9uev2QYJ2Xda4E8AMjy9fgLGyXaemxJUQAZWA9gZz6mvIZYUNgo?=
 =?us-ascii?Q?wk2ZhUEsd5EH6fNVI8h0sFeQPbqPqx5Tn3rWcl43RD3889vN8t7shJ9hJIev?=
 =?us-ascii?Q?D9lzwAT598vKbS4xxbRnV/KMeCXdkUEKfX7VQ3trGGFvsTpQXm64USWlkgtk?=
 =?us-ascii?Q?ioBchyV/BF/NM7ckoAkLRqriNmC9m1xenKM6QbMfo77FrxtarnD0PiDqNxUN?=
 =?us-ascii?Q?03cu3ZexBtYOJF5o16nxb8ObH8eT9qkZzW0rJviY3hBWoOwi1nqr4naKgXI7?=
 =?us-ascii?Q?X1Rk4dEyDpqNdzOP+ZA6x6xRZazVnuHy28+W5l2zUDongZBFtZZVKSs8wlzP?=
 =?us-ascii?Q?tA6QSRCnMDAY2wufPmB7dW0nb6UG+ph7Tx9tPHHtYweSAMGXPb/Ry/lZqjCF?=
 =?us-ascii?Q?L1LkLVPdh8hOseyuN2Kc2Eg92I9nauhwXwhX2aLiOOgruX509h1bZqe3R1fC?=
 =?us-ascii?Q?xqkZDz+C8kwlLw9kmwS2pIN6gD2HkHfihfdkCIeBomBXy3G+tdfAS/SSOswk?=
 =?us-ascii?Q?vZ6Z7htwWbLBuuvMTG89sLXmSUnMWT0u/inIEXJzyowLBs6KiWLkfuhrfcHZ?=
 =?us-ascii?Q?dxfSkGLxDMv2qmCD11jGtM6BzbWyTLO0SiGjq9omr1jfacRSo6fDvCqxluId?=
 =?us-ascii?Q?fDN49Hasawp9LDb+J9+k3DvOmnEYQPc0hqdu3bvGBO84cjs7H+Nihye7Vc5z?=
 =?us-ascii?Q?jw7Twa00+3a1FgxSip50WS70aM2DHicaQTkFFnfT/bYHTENov/hlJc8DsYer?=
 =?us-ascii?Q?KpLRXS53Jy+dwcsYbZ9NgEg+x+iQF/u4Ygg0lJHVhv1UEMPJqD16OfbLer2n?=
 =?us-ascii?Q?ThzydwlJdXmq8BXE3gHRClR2+1h0WnrmMf/6NxtlmzmDGojIirpLx+uIUnBU?=
 =?us-ascii?Q?1ZihU/Fbo4WtZfUEgiF1fus=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c49dcb4b-31ed-4022-aae1-08dcd06a26e1
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2024 00:55:51.8667
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 GRmD504yuw4/Q5Fg98LdNTJepwvwkeYEWx5glyXeiW971BLosbZHp1v4r30ZCCcG9doB+GQagCEFTmDCw0rAWgfFoCfHCSCtcfV/UiysnXrc0HMT4jB2Se75Ybg8LGUf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9781
Message-ID-Hash: FMPWKI5IEJSDVXX6K24APCZ7U5LJZR5N
X-Message-ID-Hash: FMPWKI5IEJSDVXX6K24APCZ7U5LJZR5N
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FMPWKI5IEJSDVXX6K24APCZ7U5LJZR5N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark

> > Very rough speaking, we don't want to break existing connections
> > (normal, DPCM, Codec2Codec, etc), and enable to use new style right ?
> > Let's name current style as PCMv1. I think we want to grouping related
> > things into one place, let's say soc-pcm.c, in roughly.
> 
> Well, long term we'd want to remove DPCM and CODEC 2 CODEC but kind of I
> think.

This is my opinion, but even though if we can have new PCMv2 connections,
I think we would like to keep existing DPCM / Codec2Codec as PCMv1 with no touch
as much as possible not to break existing working system.
Converting PCMv1 -> PCMv2 is maybe easy to break, especially non-normal connection.
See below.

> It's not clear to me if we'd need to specify things as an explicitly PCM
> link, or if we'd be able to just use a DPCM route to link things and
> then have be able to automatically configure the digital bits based on
> capabilities of the things being linked. We would need to provide a lot
> more information on the things being connected in order to do that, and
> some of them would need digital operations.  Ideally we'd be able to do
> things in such a way that we can transparently transition the
> implementation used for simpler existing boards without requring them to
> be rewriten if they're not using one of the more complex things like
> DPCM that we're trying to replace.

Current DPCM vs Normal connections are using different ops,
and Codec2Codec is using own style. Because of that, the code is very
complex, and difficult to understand IMO.

It is better to have an flexible and integrated system that assumes various
connection methods from begining.

In my understanding, for Normal connection, each driver is no need to update,
or maybe small update only for PCMv2. But need to use new Card driver to use
PCMv2 connection.
For complex connection, like DPCM/Codec2Codec on PCMv1, needs to use new style
on PCMv2, there is no compatible.

I think if we really start to create PCMv2 connection, I think we can use
test-component and new audio-graph-card3, and its sample.dtsi for test/try ?
We can try various connections without physical board on it.

This is also my opinion, but I don't think people will be happy if we adds
new PCMv2 by using "change everything by big 1 patch".
I think it's better to exchange ideas and opinions on ML, and make progress
step-by-step.

> > We can create PCMv3, v4, v5... in the future if existing connection
> > style was not good enough. ... well... this is almost "ideal" ;P
> 
> Doing things as described above means that there's much less information
> in the individual drivers, just descriptions of what's connected to what
> as much as possible.  To a certain extent the fact that that's not the
> case is kind of the problem we're trying to solve here.

Existing connection style has been created without considering to able to
switch connection style of course. But I think we want to create such
concept (= style version), and convert existing style into it (= PCMv1).
In my quick check, compress / sof are deeply based on DPCM style,
so I think using them need to use PCMv1 style. In other words,
using/converting it on PCMv2 is maybe very difficult. So we want to have
the concept which enable to use both PCMv1 and PCMv2 in the same time.
Maybe same things happen on PCMv3 or later in the future (?).

Above all are just my opinion, I'm not sure what is the good way.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
