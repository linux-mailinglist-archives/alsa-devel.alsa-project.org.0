Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C195B671B
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Sep 2022 07:03:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44FA0172B;
	Tue, 13 Sep 2022 07:03:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44FA0172B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663045437;
	bh=QpF3jypO2GpwbSmyfWad5a5ToXoN4boKFKHHRqxkd5c=;
	h=From:To:Subject:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QXqUjKJvuno/JGB0uqK7FGmWuWn30fcjfdpNuGxiUdExW/YV8e2hf2n60dWjtInpv
	 FJb8ognEYIO1NqSIYmZZ18XHoZ4vUFJ/ffWYfxLB45yXQaGVRzeJ7xMu5UUT/+eP8t
	 0odJWMqSEKyO6YlWFfS0tMoNSTwXBiIEPwLZhwVc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9A84F8025D;
	Tue, 13 Sep 2022 07:02:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 950ABF80154; Tue, 13 Sep 2022 07:02:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2138.outbound.protection.outlook.com [40.107.113.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8207BF80154
 for <alsa-devel@alsa-project.org>; Tue, 13 Sep 2022 07:02:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8207BF80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="l0AGjWnA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WlOXYRz6fODEcVqIS9fBcq/1U7IEi+eNM5ilBAK7sym4+oZuNqwvnNrjbcXQejftJOUmgLlEBikqtzB0JspljKqrypFJa3g7j2yCLbFN9hrqp3FNFPm27wahfCFvZF/oGcLwnJmuLS8eECARCe4UuG2ZFCerJfFZKxkFq5V2CbM/zWvxuwZxYeQkWzJo77DcnPevd/QlFiol+d34F/oHeGvK4GlY1PiDTVo2abYLT+NJnTILob9rnpRSbH1h3evKP3LqsqsBqn+3Xk22aX/YcgoQDGJkz6cX0OBQEYs0M6cui/YJbaE0KrRMXFJedfXFgttOdQZSDbDu7qC8Iht0Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+mCx3QPJRKnXWD0C3X52dvSdGkOdldz3H9OTNaGusNo=;
 b=gpr3xun8k5Iioh9IeEy/RAFt28cR6U2MWFGCaMgrOgTPccwgCgeWSuzIkKCkuDcBdicIgSky0l3bldx907c+KUdeQTz3klA87wI0uNZRSEuMtA7UVMMLwrNaVN1Y+BTGknfCWyM+Ctpn8Nd5ahd9LcpVs7w+g6y2r3OEuTpbkj0wChpcyHzjPklujXAy2R3CfN1DU3I6IxLEMDUDrSUgXocf7H5KMgpqWdLENBVo4jYg5o4N8tf9M0Zuc0nwQ9hN/ye94za+U+fBnFQR1/SWB6rdJlQiduOiAdlrdohiUWApRq9AqO9MDImLCBEn1Xq02TcpMdL9rx2mJ7AjW2pD1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+mCx3QPJRKnXWD0C3X52dvSdGkOdldz3H9OTNaGusNo=;
 b=l0AGjWnAD6V7uKWylaEJQY1gSLA724oo0rfcvGg8qYT6TPa4xR1KZLBHipYSmgw0G1pmq+T4setc12JqGBEnYDULjRcYEGFdwospcEDjDnYD6jsmRvsW9SRuPRV66C+ud9nFUacHlVxmvbRgniTmxnnH1ctVBtJIemoXodYnM5U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB10590.jpnprd01.prod.outlook.com (2603:1096:400:302::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Tue, 13 Sep
 2022 05:02:41 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::1891:867b:6039:55d3]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::1891:867b:6039:55d3%6]) with mapi id 15.20.5612.022; Tue, 13 Sep 2022
 05:02:41 +0000
Message-ID: <87edwf6f4f.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: "S.J. Wang" <shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: ak4458.c: move ak4458_reset() under CONFIG_PM
In-Reply-To: <DB9PR04MB9355019BE33DB9A2A0D2557FE3479@DB9PR04MB9355.eurprd04.prod.outlook.com>
References: <DB9PR04MB9355019BE33DB9A2A0D2557FE3479@DB9PR04MB9355.eurprd04.prod.outlook.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 13 Sep 2022 05:02:40 +0000
X-ClientProxiedBy: TYWP286CA0032.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::16) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB10590:EE_
X-MS-Office365-Filtering-Correlation-Id: 48970a87-2dc6-41ac-7d64-08da95452f92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xdyl+fDOAaRpYaXLV6Gq4OpKrqQy5hi7QwLj+wRHuhUTZr5868+4TKdiysJn0cmbqjLbm8niwk6/9+zVfKB4zW9MzOu7k2ATchdfFqR64FN8nJaQyb3Bsw98deMH/fUb17M8ucHrbKbSl/ndClBPaoKc0NK68WpuTkudco3TFkafbpuVXrQFzzEvUL9w+cvRQpbH7CMUeoNSMzDUGJ6HueOmY8X0CxJAttRAFTeVGaThTrgns2YMY0VzzTH8MMqs0opmozCy67jQdCrrbSZyKUZWCO9rsC0jJT91kMP1hPpkR7t3MN2xaxm2T2nqs5WaHIJIiajvD82XVsdF/5MuaZuSj1Vdah+jvBXuYM21eWBjAC9yUYfhTce4hWyAtE9LBr28Bll0h++yDNkdywjgac50l5uphMTXr/sZLIE7kxCi5ZKdSTugwlENFcCjg1Lp4jr6ew9uGckBTFm6xgKph4UVmak8ohjipZ8eRa/EMTzSNXVSJwBpyC5FG0noL9GZgdRBzCr1AOsube9w7K+MkzdF+42zTpPWmOMvk2atwbJ7mJxfwj45qaQ60dV9Up3ml4W0SwfYxn2qgujNRuvAP6taicLAkbAhBjae68wrBDsrwMoYnuWCFNumSdZHvH0fjgjKWrYIRVYUT8HOnJ4p6MQVTNqvkpTYlj2tpqTIbyZsV2BYlscnZ+m/Qi70blgInJXXtirnG8+UYtQ5kXUO7n7l9r7qoUNNY49fwHDf4raUw731PyyXem0gRN9E4eBYD2VizYRQa8Du80krD+wETA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(396003)(39860400002)(136003)(366004)(376002)(451199015)(6486002)(478600001)(2616005)(38100700002)(38350700002)(86362001)(52116002)(186003)(6506007)(54906003)(66556008)(41300700001)(66946007)(4326008)(8676002)(66476007)(36756003)(2906002)(6512007)(26005)(316002)(8936002)(6916009)(5660300002)(4744005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wkdVEjobsYxAWqsIO5YrIKj+t52qbq6FXsLXdJzPBOYaemKj9FdpbBemDVBK?=
 =?us-ascii?Q?VU2/Gyp/d1Sviuv/SjkFnj2dq4bV/3ucVdUdShz8oV9+qhz7eQyiS3xGH8M7?=
 =?us-ascii?Q?sSu1DgQbgEfgltXKlafzLL+yUOFT0wcW4nKJ4cVjlUhweDc/zjRgFoQvEZfe?=
 =?us-ascii?Q?P9x1IjdvNxrkqMZ+SkYTM63gH9yDrns7WClRdgRQBjRhJU0PIGeTdCavgXR1?=
 =?us-ascii?Q?bCq0Z7T0K3sQwstgJ8iDEN/EKWToucJQjnUJErWTyXq9Wvr0Rrj6nfAhUXdi?=
 =?us-ascii?Q?U9iTrYC7H7jll4FEsDczX0L2rOGW1VNtMwKa5wXZWcO/ASs7EEA3jybHwuQg?=
 =?us-ascii?Q?/3RCoW73DU1FWpsUkktsqVI3ZDWOPEVrQdYzc7mvwr4MQ6gL50c0vajp7hsH?=
 =?us-ascii?Q?rDbN1kxKlZSWo0IBOclsfbkgalXOBwww8kImSdquDhsS9R5MqY8wWtKe1dci?=
 =?us-ascii?Q?1QS/AyZ0tkKJocRgdg7oKVA71pyutAAZFF0NCR7Mf1VavnGtanzy9Hxvzhs+?=
 =?us-ascii?Q?3TQw0HHsCF69b8LtDc962RNZggc7KUKlG5EOd0U/9z/smXttF32GPzBUBJ4u?=
 =?us-ascii?Q?m8B11yUexHMlEhImLtrWTqo7hvHFTT3M7Uy87WkfQwBNs2OTNjzQRamQD4P5?=
 =?us-ascii?Q?vuYalC/VILyDWsW9G/GrAs7q5dSgHf23hQAsdrpwvmtu62mVwDqxltI0SBNQ?=
 =?us-ascii?Q?xIcZFGCEGHDa5ek3I+PMvVa71psv/qa+XQVwyuH1fL6f9UJ0kYbdE5dwT/Gn?=
 =?us-ascii?Q?yLmT9b6RdECUvcIn46LAMABE2QXdOszAazxstmx8Fenwjpb2quqHBXG5y7Jb?=
 =?us-ascii?Q?mwwEwcwHSjR3HwAQYu2gtudSqfAC9G1Bi8PFMs/fMADEH8U9bfKUIQD2tVq7?=
 =?us-ascii?Q?K2mXS49d+Xu3381uzZnXHHyQgkHSz9508yWNQnv7TkdDzdzyr/I8n0ihcB34?=
 =?us-ascii?Q?cTHUpy/jKlw5rH2TOMY7f19sHHX2di+s5v57gF+Mq7tU62yokeSomVR2ZCOW?=
 =?us-ascii?Q?t/3mM/fJhWpdHD7Xa+8pRdUMgY5UAzfLUt8xLjxf3z1hHp+xtPsbUTEtzBMW?=
 =?us-ascii?Q?K2+KYRXUDhuvYrFkvvOUOb5q6QtLJ7tQM7UelkMWWGU9I7ae14rCxWuBbHDJ?=
 =?us-ascii?Q?4L9HCWeE5e9pT7yTxo01bT26ULSrbdDym4Mcgx84WEGOVVw13x0eFhlM7jvG?=
 =?us-ascii?Q?EEMJIhuedE79cJ98nAQyI5QLGEzKJbRBWWcuesglIV6AA4NF/SaKLan3+Lg3?=
 =?us-ascii?Q?5u3S525UXbgoQRSJwN20EZgeQZPPP7UJ+KrrKt+zHWVe2K2CuJ0lHjwXRVKo?=
 =?us-ascii?Q?tcxK0bHrpEe2NtfLRpavVf2g1ZdKzVMfGE6uNalpPp/1+avsq86UjAoO3bp3?=
 =?us-ascii?Q?GzymzLIYxXDo4bWp0rW6Pt0zdl9Xfr2Az0Vr75jXhfu1RabDkjcu2F5o7jfz?=
 =?us-ascii?Q?+TNuquf4nAn6WurzXWz+dBi6vSAybnXvbjn8jKD4k2dZMZ4/IW0N1ikdeEyA?=
 =?us-ascii?Q?kt7h+l4Ek6vkZEmmOGgir76QrXpdOEKSlyCf6uoND6He2D0X5obz/4xFAf27?=
 =?us-ascii?Q?x+vqs+qcq5OieEt4/XXqRLHhRLsSGqp/+Oqo5VyoUizm3Lv8Iyj1o+NLcHLz?=
 =?us-ascii?Q?JKI03XCe9Fd/URXDV4t8dLc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48970a87-2dc6-41ac-7d64-08da95452f92
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2022 05:02:41.1476 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fla2ShRdhkOyNvjVPSxjVkIZBKUqluHqFwSS+E7p6v/Yn1NJit/nBvP2V3VK4+yUNRvLms5CRDjUX9BTm/51njN2zMcKGhX9QmjnV1Ujuh7u6wspQ2bJOdNnxVVANKhL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10590
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


Hi Mark

> > Hmm... I'm not familiar with ak4458.c.
> > Is your opinion for original patch ? or this patch ?
> > This patch is just trying to fix the compile issue.
> > 
> > Thank you for your help !!
> > 
> 
> Thanks for catching this issue.
> Without or with _reset() in probe() and remove(), the driver can work in both
> case.

OK, but I'm not familiar with this driver,
could you please create the patch for it ?
I'm happy if you add below

Reported-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thank you for your help !!

Best regards
---
Kuninori Morimoto
