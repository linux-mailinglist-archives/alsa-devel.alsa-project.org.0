Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF70D79A0D2
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Sep 2023 02:46:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 449957F4;
	Mon, 11 Sep 2023 02:45:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 449957F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694393174;
	bh=kEZH6K2MaqKA4uxAVWUbMreJoBqkiLGXRK0vYhs/upo=;
	h=From:Subject:To:Cc:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=cE5+BPGthIL1jLijrPEBwWgL6y5b8Egi1SWfggoJ+8UQjxnBt0zmgIENIo27F34Gc
	 MRI26WsQB2MS/NtO+kLrF1LGO0fFFheBAK1MGE//WMiXNFG1JCT10gFOzMKYNo+czO
	 nMdAEriNdHfdnX6W4i5EQYsGz3lr6shvZkAv5uP4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9BF13F80551; Mon, 11 Sep 2023 02:45:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 535D8F80246;
	Mon, 11 Sep 2023 02:45:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C7B7F80425; Mon, 11 Sep 2023 02:45:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-5.2 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2070b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::70b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1170AF801F5
	for <alsa-devel@alsa-project.org>; Mon, 11 Sep 2023 02:45:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1170AF801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=UEU1rE8j
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LIkwjOZFEVtTWwFyvCcScBJTOTvvf1/ncP2WVl//1l0pQOfn2e0huTeUGmhr9Rkn13mx0bv6RGpVJgr3rb7LiJMfWFy344rrus5k0DdwUxL77KWbZYoIUdb/L88db0DWtLqTYOCmZhvFM/saI663nCCsVQVSvK2BQ1/nYYIyc83v72YP5yPN1HCdCVGntvuIxn80tqgHHfQ/mnh48oU8YKXko/yfmxL48v6hTyt+JTSbKNcpUvhHcFt3g609Wrk2CdVMyexgU4LWXooGQmj1Sm+cNGevlghc96ub8ylXF0FE1GlvvYHjsDPkmtsiiOSykEoHu9NiPtfKrEB5KNoGXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Slc282OaVFoMpKOldAMESqQ5TENWflSYHq+YckfHn4E=;
 b=GBnjd/VQFaRxex6x7xEcfQ3fpO9ZOY9OE+U8LmzR2yqUc0NXC6miJ5dsWaV3guzAXQW9h3ErWGwXffaeh+cQTm7Z8Z9eYALqC0SXjTmjy1dpefdv8hrx4ktoQukYFCNv+y2HmSMBt4ruZgtrJdier92YGtOx25gnS41tOBOKMOU5y4ZOlNp0uLbXbH9bGfv01bI4OU7Khn6J4dt+/9rIy/bz56jSxcNt8Sz/nsnmPPVj8Y1STacvAPAY64DVtLp6XZwI8Wuz8X1zegH20plozofusN1SNj1qRbpt1WhlffYSZIAKATGdzFbt5XEqMhL/idH+lXD5o/G5pezX7MTzfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Slc282OaVFoMpKOldAMESqQ5TENWflSYHq+YckfHn4E=;
 b=UEU1rE8jCYdSP0FwoJobMV/3g22C50l3xnZ1gfiphrbwT/uVKMMhLdFEphfEOwylUYEJfEM1NroRqoQLa/CyEPnJBtSE9mupZJQsAiZ+aTOCkeFIh82xDGSYsHJQLVr0VZt88YNL6sD8MPy97qbwCGBA19n+bH1gtfTx3CAdB5g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS0PR01MB5634.jpnprd01.prod.outlook.com (2603:1096:604:b8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.34; Mon, 11 Sep
 2023 00:45:04 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 00:45:03 +0000
Message-ID: <8734zlilmd.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: rsnd: remove unneeded of_node_put()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Julia Lawall <julia.lawall@inria.fr>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 11 Sep 2023 00:45:03 +0000
X-ClientProxiedBy: TYBP286CA0025.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:10a::13) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS0PR01MB5634:EE_
X-MS-Office365-Filtering-Correlation-Id: ac783b84-c09f-4e24-acb4-08dbb2605646
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jhhwG6XC5aDgomhrws3/eTW9JqRVCjnW9QOpGPYAYrm20FdaN4b756gOcXKXgjPbNYJ+/STcjc7Ou53N+20OV8PRF9WkqzIHGKJ//ZcWQUgoHOiuCmcB2ahXxBsf3uMK5SHJ26jX+wvXzy8TSaEi70hF2FmPAYzHx83uoCITUBYLfTCH9eTYic2i/IZkoqxYfFi6wgFBMEbyZeRppL+QVDR7bQzSwi0/NOjK3Od/K4L3AQPjBzkdOR+OdRO8ScQXMxRVcy8g84GQsZv9cvgoaB9dkQt0rVOZ4klqfm5s3hnmVIUXUU6K6Ld42OTYBpYj6UTeiZ2tABWrVKAVpC435+bU2ekR0uzKyaCz13ICYr+DJS5BNNHXwBXkzjek0UeyJRHIkspiaDGuLkm4ADZuDvJLgGt5ktELhafj2WFwsaoCCGajymKjMIFd3iN4u/9TA7wWTMko5ZT6+wewJIgzX4blkZMrhT9IVfSwCjZHRnoNXyx2X/d6LuDaW0kmgRB4OBHON77rZ2wZ8Qm1j7Sl1pEl43yoRcX06bu2O995HcaNMCZoGeVAIaUI55btnNHrH/DtPl49n3VAZ4e6GE/iic3YOKkx4zcCDmsOL9xQE4Y=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(136003)(376002)(346002)(366004)(451199024)(1800799009)(186009)(6486002)(52116002)(6506007)(36756003)(86362001)(38350700002)(38100700002)(26005)(2616005)(4744005)(2906002)(6512007)(478600001)(83380400001)(41300700001)(4326008)(5660300002)(6916009)(316002)(8676002)(8936002)(54906003)(66476007)(66946007)(66556008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+oxDrOP1V/kEw32jImGk0t8HvByuTU2SIqkkdMPVnM5Smnonh3qg2DnGbiO4?=
 =?us-ascii?Q?T4tYK2Ruh1rzucaTOzeXnPSrP8gFmp+WutkB+Sefi+tK9Mpv6H7q+IA5GTKq?=
 =?us-ascii?Q?h2kZ/w69SJ0SytSnUJdFT/Azu+ORN8FeG8c3VPZIYhsCmzj3zZbOFQRTc6Ea?=
 =?us-ascii?Q?c0je7aNwCXrzPtJ6wNXR4uEnVR90b2kFS97a6x9BmeJTJfvvvOcQxh5yw5Ee?=
 =?us-ascii?Q?roargBY8Hyr10+pIqz2emSgu2JHkc8Nmk3BnH9CHREeoPMka6HL58LwIgnW0?=
 =?us-ascii?Q?rjkGYr+FxOzSNwJmZQIdf7dRjUrEo/TtY5Ui8kncYBQx4ihsVvv1JNrC6N6D?=
 =?us-ascii?Q?1MlKZmRsipCRePHJnyDXY1dsKIPMTLN0963BYOPaAgVKeaentG8zoIFsHnOz?=
 =?us-ascii?Q?vKT6hGCbOhEjZB5SW7ut0z6uy+XH5OUbuPLJ5VmfBemHtO+sWmDhLSgYINYk?=
 =?us-ascii?Q?+DCtWMVWVlJB4+VioaeoEWoR6/3TGZWoHzlZFZ7tR6Q0UWcDZtg1zudJoOoE?=
 =?us-ascii?Q?8gD1KYFg4MLfm9alID1QJzQDpv0RsthBfWCIqCNwrOuBX7RVNgEX6hiycvk0?=
 =?us-ascii?Q?s/Iq8NLlYoifvqjalnkQZ3rZ2mxY0Jsz2IPzaRDwcvAxVFNMh5Zbck+BHJbv?=
 =?us-ascii?Q?zcEnvo+zTfCyW4K/7nEgAf52Zqew9HWjcCLcmZm6fNJ9OKhStGjckZChEa5M?=
 =?us-ascii?Q?rEDYoXJI6OwhuyPv5JXgtQY07I9gomVhvntlWjpIlnC5IcLaFHqwVDjrh0HR?=
 =?us-ascii?Q?PgiKqmCaRlh5s52ey6NqR9g6eAjdaTcoFNizbDraj1T+xIQwwjoUhy6qeXQ4?=
 =?us-ascii?Q?V+kFljtYxoLc4ZwEujs3W/+I/Rn5h8jb/4rMfxQsAX0mH/0oIwbKWrrmsBAb?=
 =?us-ascii?Q?s2yerUbu1kX3AzLGixA77mfY1mwF3LJ1fu5NmvunrehfBge3lY5SnlOBUlzt?=
 =?us-ascii?Q?EEHrk0lawN7IZ0JtnCFbRFlaZlsDhNTaTg33/uzFwEDczPOzhcxyoqYqFdYe?=
 =?us-ascii?Q?eqSGGOU01HL0TdHRWiRGUh+ScWsCqqiKou0Qq+3Xk+5ndqoqR+l6yswASnw2?=
 =?us-ascii?Q?Bf5Ys89QgEFSz6stsJY7MIbrlHLpmYOGIUowqa55HNW0hESzBBKtbwMkAGau?=
 =?us-ascii?Q?bOj5CDuLBbxXySw9S65V0Fp4chuZtGozIF6H+f61D5TzK92Nqzk/dX074uvt?=
 =?us-ascii?Q?izhzSXtpNUddGF5e89tZdw8n9VgsBgl88tyCUAIklGzD0xHTqtYQrOVDZG0/?=
 =?us-ascii?Q?s5olTMRvdsLfzF0tCwSwKslICkVhj0ahZlR1P2f5Wq3UHvNh3XluwKEMIZkk?=
 =?us-ascii?Q?psHWZk1+Dsha9ZsGRKjLhctVoxIVsVrNNNAs74mqv0+9UWCs14X8P8DOi+6q?=
 =?us-ascii?Q?2f4aBYeHqOAknsT1Fhip9OAktdrPXQGMKEtq8bd8Bgm0O1yE98wIKw+5R7Bh?=
 =?us-ascii?Q?qqi5PN2ZlgoBChyv0qApdM7cOSVbFlwQPjzWzyOu4a/9Z0Xy7Bem2gFkCsvN?=
 =?us-ascii?Q?l/gVGA+2NDleBH+7wW9/K58xbES7ZUezM7x1+MbX8AJ3jWS8mrPGYQIvDDdU?=
 =?us-ascii?Q?SxLs37a11vLJLUEM76E+fCa9FYs99owouX1DzrZtozZIv2EOfIY+sDpo1jFy?=
 =?us-ascii?Q?wWCpy0zWOCcXzkynKSTsLn4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ac783b84-c09f-4e24-acb4-08dbb2605646
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 00:45:03.8923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 EgEsl821Jb1DuDztSHnPWnuGB6FLoa3crUINK8iyBsuIrJtxd5OYcJhAcvb/wjMaqRUuUGSNNAFALjU3aMeoJGsGYlKjm8Lvmg3jFZsbtG1W8yOk/FY8LnVGkrzP/TK3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5634
Message-ID-Hash: NNSDTGTNHT7AMDECSFVGMAV7HHFBY52A
X-Message-ID-Hash: NNSDTGTNHT7AMDECSFVGMAV7HHFBY52A
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NNSDTGTNHT7AMDECSFVGMAV7HHFBY52A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The loop is not using "node", of_node_put(node) is not needed.

Cc: Julia Lawall <julia.lawall@inria.fr>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sh/rcar/core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
index e29c2fee95219..7552fa0a2578d 100644
--- a/sound/soc/sh/rcar/core.c
+++ b/sound/soc/sh/rcar/core.c
@@ -1302,7 +1302,6 @@ static int rsnd_dai_of_node(struct rsnd_priv *priv, int *is_graph)
 		i++;
 		if (i >= RSND_MAX_COMPONENT) {
 			dev_info(dev, "reach to max component\n");
-			of_node_put(node);
 			break;
 		}
 	}
-- 
2.25.1

