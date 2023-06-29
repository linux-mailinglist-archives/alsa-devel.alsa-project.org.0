Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA225743140
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Jun 2023 01:53:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0944A20C;
	Fri, 30 Jun 2023 01:52:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0944A20C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688082812;
	bh=UPHx5mqKDlY4biMakFHqpuF4wwJhHMjSymDrhN7djBc=;
	h=From:Subject:To:Cc:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=EKTq5hNM3osIcpo/PSOvYX/k7AMr8FMIm3Z2KWkolWoPNzvpwJcJsuEyT4LQ1LX7m
	 DJlyECgGKgmZELwnxmqM0mmpduRBNr4m+UpZfz3dwISeB68RLIKB6tREOjFkP3AI4L
	 42eWBlq+r1Y1vhSvhi+F7njX2blcui6DZTVZ99tw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 702BEF8053B; Fri, 30 Jun 2023 01:52:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CE39EF80212;
	Fri, 30 Jun 2023 01:52:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 992B5F80246; Fri, 30 Jun 2023 01:52:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-2.6 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2072e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::72e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 68DBCF80169
	for <alsa-devel@alsa-project.org>; Fri, 30 Jun 2023 01:52:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68DBCF80169
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=c2SzTsCi
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RUKkkhJo0TaDGcSqX2NGPbRVjcIHbgOHiD1jPNimKdAQO9eL72zIexeXvy4Gwm2c48wkHr2RLbP0hRWpyZ6ZZZ5S5IcfD2qGGdbEUNpRED/bNHz2wrwm+1v3K7JujiJpJF37J37X5oTnfdfF053q/BIAJzxkCJSWfK8hpcfMUHGeJnNjRLjnsUaYdUAvsU232R4IcxvK9Z06QAB/QUg2OxfxZhPGP8Nw63QZdrwwILfc4tccJpFFYZjPtt6IbjKmfcQmYY03B3H2BNmz7EaeFzUWKM3cWu3vKaguisSX1ae5kflzPXU0aBMc18hYBfBQ2emi6ECVFci/oTdUtD0O+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uCiI4XokiIlqhCk/lMVvvDZGFmaVsSP4Rxa8lHK06OQ=;
 b=i5ytXPmXy1kBEB34tltp/kPZc2hxPRdPbVwVsBnXK8Y6yGcsEAtfsHZO82pjeOacPba6hcuoEp4XQ97RXKSmb8KFeidlEClXsurYtLWpvvWtM+7mXwykN/ZizXs4zlJ29EbJvPy0kpIq7VJUbFjf+ovZU2nE+NmshHAYHRo6gHJPX6dFF4zmw0ngLUe0WAck91OQ+mxU9f5dUcWiYBR+KDjyLDHXShYHIt7f+Kl2qs21et5MHj8j6lyBtzCotbKcsfraB0ADKobGuqknCUkSoSpdzBs8nC85oYrt+R/DPCeg4oJ7wujufSqVDyPd3QBzLfl0ZwPbxSeamjKUI4AdCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uCiI4XokiIlqhCk/lMVvvDZGFmaVsSP4Rxa8lHK06OQ=;
 b=c2SzTsCilATONYaWZPRusQF0CeRgFkSk+6NhnmbqLIscHj8C2vMgzQ6lD7GoHFoHW3zLu17mgsFzhF+n2idVjbia6P7nfBpp9qOcd1ePtw9stXSvtzAAEEYvKKeRtenWDGm5XKXVBW2TXMbwQnxiyg394AR81mSV+ORw94aybbY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB11751.jpnprd01.prod.outlook.com (2603:1096:400:403::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.19; Thu, 29 Jun
 2023 23:52:20 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26%6]) with mapi id 15.20.6544.019; Thu, 29 Jun 2023
 23:52:20 +0000
Message-ID: <878rc1kerv.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: soc-core: protect dlc->of_node under mutex
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 29 Jun 2023 23:52:20 +0000
X-ClientProxiedBy: TYCPR01CA0112.jpnprd01.prod.outlook.com
 (2603:1096:405:4::28) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB11751:EE_
X-MS-Office365-Filtering-Correlation-Id: 53e86419-4fb1-45ff-801a-08db78fbe0d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	RtSsfdomsyD/GdG5QRLkPd2d59cyVDGmSvXBPnEGHXMecp9en0pT6gnm3+iJfpw0mNmKMffRfIFI9rHFjwotvt3dW2MpZKR09NLN4tUGjHj934Lx4wUd5lBI3uBJqPWO02xN8tP+0Nqoplwnz2bzM6LZauPF+55RTaIwQKvKR3llriDgMT9MneexsHXy1HpPqO5HxUOpTct+8JJf6Vkf/EmftzNjBgONF/RcXArv3ag5/28zKz2zuk4f0tdbDAfulE0IEpBVwlqdHnf8KB/GcGe5kWnrT/UqqarjDuQrjnTYmX8KLgbOnt7HZsHeUnWN1R7SNimLjIw4VlMCK3LkExDbcNIwGuFD3QvhE0pR7khtpV+DkfSWYoQnMYx42rAf33BheZ5j1TQFzbcMSELUTcw5OrsLWciktzx4ETF5H3h7Cb4PrJBb4Y5HvK6qUHf0uNAr9PUIxmQoOIkh6hDDcmrWH1PsVAoy5Qp2mdqtO3WdiQIL+NNiXgr+CqEqx7iR+bIdCkDqHdV9I0HWy5XbN1s5SFCBKW5ZCjzE5wLcMXbi2gcfeCCKMD6Xu72mNerEl1GGd/iutXACyuTlwBqoLhf5MpnrEkXbuK9yieULGk+nMTRjloKdvIE2pEeRIpDd
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(366004)(396003)(136003)(376002)(451199021)(66946007)(36756003)(66556008)(66476007)(4326008)(6916009)(478600001)(316002)(5660300002)(8676002)(8936002)(2906002)(4744005)(41300700001)(86362001)(52116002)(6486002)(6512007)(6506007)(26005)(186003)(38100700002)(38350700002)(83380400001)(2616005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jjLA78krwh6o9OaxKmlyaczOIUnunuo5W3HRdqfoS6LAWnLWWx5JTZbH5YfR?=
 =?us-ascii?Q?TbrBKUdA9qjaVTfkDKA4NdQ+dFfPAOSEroU0IivhNJ52mOG81JHfb68OMh3b?=
 =?us-ascii?Q?vmZgaJaGcsJ7zZY3DwSKfLgGRv1hIi1oG8UPBJZVDyzdeZlGOpVvFVDPBT6R?=
 =?us-ascii?Q?OYFk11Kz3MuTJ5TAHWVVmWx39ispg2UzS/SwvZmlLZRxbWGmdMiA90hisFt8?=
 =?us-ascii?Q?GZG9vzQ68+dBT+z3g38wHxXARGdejDQaHHPnOAvOXkfLlJtP8iQ7vrIY+ZXq?=
 =?us-ascii?Q?GE4SxQvEx6pI90j1tbcWuOgcLDHq5b0/stwGlooU7/4gLMFiUVqRvB5RiE65?=
 =?us-ascii?Q?IqVmo14s4q3RzIupvFnLaEHgSx2d/+AQ67UW4nyQjWxrWjiN2NM8lfUlnfKL?=
 =?us-ascii?Q?Edyptjh2VJHtN7Q5Cpbta79pkDZw1yDVmO6rod8ufiT0F7FRU1l67ZG6BQ39?=
 =?us-ascii?Q?9ODTgbWcOP0VkNIk58jrbBaKn8feBGdmd7xcC3JGWzJuK4Ju5RQtlzvJtTYI?=
 =?us-ascii?Q?xR8xmjjGQ6KuoI602ydfrlPlDmyVoaLAga2MazTRa+rqSboDR+UBq71XzMvr?=
 =?us-ascii?Q?/LKLu3X3FUYR4QBhAco2SUoIXx2F0wL/vABC4YPowxKcNDayHOIm1iLEaMu4?=
 =?us-ascii?Q?crSEODA1QNkuOUuD7JTYLd4WeW6OneGvKa4APDTaLYfBCYpp4+BO/ulLUc72?=
 =?us-ascii?Q?qb/b5hJVwBuZ1zhQWQAB8VBgJqEOIgoM+Hu9OB/xQ+KxgbrrnkwvX0jo3ZVS?=
 =?us-ascii?Q?mW+q2oCHI/WN+fR9MsSLGs2J0It8zG+IAN6fwbicKzuQpJipEPxNVDU/E9M2?=
 =?us-ascii?Q?yTQCiTNzZvZw1QSpRfXwA1jSqk42CWl0D3F3gJPmiuiY2ff52TW9jtrhwDdM?=
 =?us-ascii?Q?+ATDSbePrwZeCiuGP2g3B6nIJb980OXqHJcgFw4XtZy4Nyq034TlONOb+M2O?=
 =?us-ascii?Q?0B7iM8m+MQxkqLIBEiFqdStUyuJX95r/xYj6p7niVeHXfwQM30thXbsXGbDP?=
 =?us-ascii?Q?s/LeDQozd/Ng3qwsO2gS6fjLKhIfbCY7Vkt/ALGLSlHdFyGIZugYU82BFlod?=
 =?us-ascii?Q?3EXDQGBjOGcHLwKI0vbWOHwQ21x3L9UsUML/UI6ww4XciqIrI/6zOIddgBND?=
 =?us-ascii?Q?PecIAZVLa9R3q8GPVFNz1IiQcVd1OnzSXPybrlzbnlsBQxKkweQKRceqWqKR?=
 =?us-ascii?Q?cRnzmC9WJROpitG25VLHFNI3Qlm8OJHcvlqp4y1xZ8EXK6o0SnFnpK72hxV8?=
 =?us-ascii?Q?2tFIcclQFiKbjNJC/34dQaj335wkjRIU1+piagoZTuB4T5kmNIUtryZlEUKX?=
 =?us-ascii?Q?v+C5YZ8XaLm3MBuhNoxEpjtdIMPtUOWTMwb+UrbpXR5mcdKZgzisIGhzMXsX?=
 =?us-ascii?Q?0DderKlEhWazQ6Sy1ZLacdfl24/FY1nlB6qnMy4y0xZuqGzkqsLmDOSEPwDy?=
 =?us-ascii?Q?LgNhd0UyLg4O41q8OoMa6+ShMxLpez0zYP4YzCo2wTcBVThO7fCjqmNwFnB4?=
 =?us-ascii?Q?86NCOHMikTJoRFR4hVklyeAEedyUkNEEjksVz3JWZHAROAhBFA4BxzUopUcm?=
 =?us-ascii?Q?6kLXbGhIM7l6xdFAnEwNUrHoZfewLP1VCtMMGWBhOTuI91DyK7xyKosDjFeG?=
 =?us-ascii?Q?qn3P9C0NjUra/0zP1N7dAnM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 53e86419-4fb1-45ff-801a-08db78fbe0d0
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2023 23:52:20.7852
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 KRshcyF9KtFkGiH0eQ8E++yFilclwwmIRaCA11XPJyOtjkPzioOu8VDmPhhihrG7YtJ+gBmy2Wu76ms9qBKzRS3cjfWKDl68deP/qOX+jEVoWXFrQm+rM1bKALcq+js+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11751
Message-ID-Hash: F4JQIQPN3XP5AC4AVX3ZU2V7JEWQDWBU
X-Message-ID-Hash: F4JQIQPN3XP5AC4AVX3ZU2V7JEWQDWBU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F4JQIQPN3XP5AC4AVX3ZU2V7JEWQDWBU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

dlc->of_node will be set on snd_soc_get_dlc(), but we want
1) protect it by mutex, 2) set only when successed.
This patch do it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 11bc5250ffd0..fcc798e0b8f0 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -3262,8 +3262,6 @@ int snd_soc_get_dlc(const struct of_phandle_args *args, struct snd_soc_dai_link_
 	struct snd_soc_component *pos;
 	int ret = -EPROBE_DEFER;
 
-	dlc->of_node = args->np;
-
 	mutex_lock(&client_mutex);
 	for_each_component(pos) {
 		struct device_node *component_of_node = soc_component_to_node(pos);
@@ -3317,6 +3315,10 @@ int snd_soc_get_dlc(const struct of_phandle_args *args, struct snd_soc_dai_link_
 
 		break;
 	}
+
+	if (ret == 0)
+		dlc->of_node = args->np;
+
 	mutex_unlock(&client_mutex);
 	return ret;
 }
-- 
2.25.1

