Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C9B677362
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Jan 2023 00:03:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 302D841EF;
	Mon, 23 Jan 2023 00:02:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 302D841EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674428586;
	bh=BkGC7GRGmBdFgOSdtmKctzWN3Sqlfhm2dZIDg415ZL0=;
	h=From:To:Subject:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=TcftDMHv5oMLKM0r9gtlvy03ygvYk6SQJ7BmwuTcnqZMvERUh5mutKzPHpeC0NVL3
	 e+uX40zlfeC37d0J/MevEs0G8jA+hR9bpEDICH6R+lDvFzcGk+R2H1vpOZAwfAUs0d
	 mikt1YitaO18AdzhNx4jZgOt2wSfSNYehGa+24xM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35D67F80254;
	Mon, 23 Jan 2023 00:02:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE6DFF8027D; Mon, 23 Jan 2023 00:02:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2107.outbound.protection.outlook.com [40.107.114.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1092EF80254
 for <alsa-devel@alsa-project.org>; Mon, 23 Jan 2023 00:01:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1092EF80254
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=OOuLVLEa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TIwvjo4NzjEPmkjPbizVOu4daMIerK24mj8vemnTvF4gJY+PfO0Y8r2SQ2nIXrAB93sC1AhLdHEF9xUqITFn0BIodjFAw1bcj/RQq3PaYC8+44mURuN2TdEviWoOmXPTexas4HAY9KXNvgGSzdjiU4rAfdlisexAo4SGjq5/2AfuM63nUnjBq8ZMntZf8kOp894QpgJ9BeX7ZeyGFyLpx9e4TgM7qPFzz+Hh2626Tm+Q4uUIbRG0tiqQNiRl+hJ9YewzRXATU6TMT6ANA20YDcmUMAnYK3wRBbtIw57TnciYjhSyEbLvyxq6TFn7s8r/cPN25lxYnkFAWNEpd77OKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RkHP1DrZgcOO7Ukq5lxZ3VqGVooZYGd/R0l5XHO6kaA=;
 b=Dua0FFtpqHERQFkB6n13kS7F0XKZ4n1SW/ACqJpBVij2eslq7I4XRVw5grWZgZkn3Isl6vQyBta0D/j2iVafQOckktt6G5+nEsm5zh0Yj/4xBSI5WBjVG5RaVdhgfgiaq4DWefEhBn0On4DP0HdrWEcm9W4x2t+s94cTPoNE85aPBU+6GuGIEAY1AMA43Xe5PCLMzkSHOYpfvFoQLRUSqkB32gA5AE1thwFHQi6H4E34Mzgp2sW7DXL/lQjVSbjmaf4LjrV4/kprMPuHOg6ejZ2zk8u7tghjsQUkOs3zVuEEFQAFV6LpmC+7hAH2sD1EYstQ8XsM/r4H0SdSEfrQ3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RkHP1DrZgcOO7Ukq5lxZ3VqGVooZYGd/R0l5XHO6kaA=;
 b=OOuLVLEaiO7/MFxLLqy7/R91OkXmchM2V5Publ+Yod6j4SiNTe1vi/zrtOZHN2O7ka21hCF74+evAQlcPLLRyy5AUz3ckpBrwiZx5AE1J2D4kSY3LI0YrwJdYP4xssrfLTOjpLK9oJye8dTeqxT5kfLAzwwxgbkuUjHn0QKifIw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB6302.jpnprd01.prod.outlook.com (2603:1096:400:76::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Sun, 22 Jan
 2023 23:01:48 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%6]) with mapi id 15.20.6002.033; Sun, 22 Jan 2023
 23:01:48 +0000
Message-ID: <87wn5e6un8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH 22/25] ASoC: soc-dai.c: use helper function
In-Reply-To: <6f047ec5-4055-761d-c1ea-c2d0b606e53a@linux.intel.com>
References: <87a62dlmmn.wl-kuninori.morimoto.gx@renesas.com>
 <87edrpk7qb.wl-kuninori.morimoto.gx@renesas.com>
 <6f047ec5-4055-761d-c1ea-c2d0b606e53a@linux.intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Sun, 22 Jan 2023 23:01:48 +0000
X-ClientProxiedBy: TYAPR03CA0009.apcprd03.prod.outlook.com
 (2603:1096:404:14::21) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB6302:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a54bf13-c81c-4334-dc62-08dafccca42a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N0yPIFhPgPOQ9TNz9YvBbmdqq9K3oszmPLxHlV9YSmLkhbErtU9isB00H0wUQwLr4CGEuYD+4I+/GkdfNedij7BtlQrvGtvaqO59VnxahBnyxpfGT9Yjqaxca9699SpMJSNRzwL3rW9yTyni5NzgDkBjJpOw7nsSqGaZ4XCd6SuwEh1RCdYPTVxRHyuAgj+GS1QuS0OFYfiRGKxuXm1IeTOkiwNKkM82uYXgO25O03cpyNiPsuQYZlhGwXvb93cdvAgbOxq0Sbv5FCzIykbFYRVBhLIw29YfI0o8KRd+ZhEhM40/G2zq7jV/CCJYaVqWFL2dDYRiTQPj5GcAPskMo0Elhtn9iUqJB/XrT/g0Ud/0F3xHWITw1ODRU0VdDk4htXWg8g8/mWunp4Viw/Bcnkc6zpYWmnLJDXdHGTEbQbdWs8PCU6sJO3Addcyw21CEHpJCZqx7XPK4TD3/QaJ0MtWqyc/gJELuhjFIyThr2ffUFC2c762f9WrmVm2z2qF9ovjJ+bAPRm4NLpVleWztqlefO8J65S7xQ63A3iI1w+CYTHEwtcHcLLo/eD+hL0hFn4YIbQ+p2fcsuNWSb6NkEJARn8vC5JgO9PJa0Q51TRT0NCARq3HTbMXeDX2YJr9f4yHs1nKRl09t+QbQAp/A6Hcw6GmXVFz7vS5ynvZkI+MEwlsGGxRmSrEEwfTNsnETeD60nsJpJEcqJNLgFRX+AA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(366004)(376002)(346002)(136003)(39860400002)(451199015)(38100700002)(38350700002)(86362001)(2906002)(4744005)(41300700001)(4326008)(5660300002)(7416002)(8936002)(6916009)(8676002)(6506007)(186003)(26005)(6512007)(2616005)(316002)(54906003)(66946007)(66556008)(66476007)(6486002)(478600001)(52116002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oQwsjQS2T5Saf7/m7YAdi4uquXVlbDWMzOCsFTE1n4Ng71EoZZDyjnhrFrcn?=
 =?us-ascii?Q?UxtaAIEf9Oryt/MPRpFxVeFrw2zN++y6AZZKQdRzZYpO+6sYU7kLoC11OpEJ?=
 =?us-ascii?Q?+Lc3u7xLHV41Y5T1QX+T+KiHuf53WM5MTmteb8r1qdQ2+2hS78+O1p8scjrm?=
 =?us-ascii?Q?qvvZFx3gtTUH/jys14BOn6OjeSpR4tKRHTge0y0pvftHf+hMZDSN73IEjEER?=
 =?us-ascii?Q?z9/Wx4x1KvUYfLrQqxNvEUAdEyyRQymirgwh95eXTlLGXC9gOpU3tbLrt+xr?=
 =?us-ascii?Q?jzXbOHMMmINDvuUAWWdGyyrh0DnCH7Z0dU7X7RGuan/wHYH4oBqrXI0Ta4Yp?=
 =?us-ascii?Q?ADDk9B9x0RZRVmvoKxkYsyL2gaTJWXlSfLsM6qSVDTuf6uTtN9htwQqoTU94?=
 =?us-ascii?Q?VAPBRZNOjBm9/6/tFVpvd13ouBOcj4kxI17/OHHb3WDu43GEl2LFNo7visR9?=
 =?us-ascii?Q?97ttSe5JUE1YyrxH3trvSa/cgyuu0ASKiFgjqHDeoa7HCVCiWY2odhVDuzi3?=
 =?us-ascii?Q?2grD7uqFGLqwzfal9zUfhm4gCJ3Chv58V7+wNQLmxXPWMfdlQTGNjDvzuxNt?=
 =?us-ascii?Q?LBGdemQVJe2kiNNbUGBXGGXS/0l8JxYUK+OkmZW2APFAXHlfB4edsdmMPjgH?=
 =?us-ascii?Q?tfrKLdzN+zvgAu7fuwHbj0ZQ3kp38SnpXjDqoGUU65Un2LnFQOM+UiHc4X2o?=
 =?us-ascii?Q?YYNyt+rJtrHxvXsVw8KMeYjb0p6UfqZJnI/6YsIDOFus4ypD9OjfhKjjn4WR?=
 =?us-ascii?Q?QtS3ylaIUYHu8ZuPl+6pQEvvRYkd9oBXx1MQ5uVnwa/Yp07tXLRhLqHXJAFg?=
 =?us-ascii?Q?S+wd09EdxiXpmzY+Skyt96zwZm2Q9aBIHUZx6ugkdxCVjw227/BYnesVgjjs?=
 =?us-ascii?Q?nBtodVbiyNsiMb9CYMo1SJv7Nh9DK6dsseP4mhzLffxJ86uQBjHtWTQjNpvF?=
 =?us-ascii?Q?ZYjTO1Jo6aEKmybzY9phy5asOKEfhFgOkUJvfgfqNAnQ5ug0koalUm+RHD5M?=
 =?us-ascii?Q?Sf1LlXVmPaNiqUFKfsn+520RScF/zYpKniqA+myUGtO3zTF6puS6j4Hxx83g?=
 =?us-ascii?Q?u4mU/ngh/TIgtvD2ADr6m7Ry0NFutZTycL107P1pIUNfPsejpvL292glOusx?=
 =?us-ascii?Q?U8ZSL7DXdjX8GzgALKo54KjqU1lYweAWtB0yoVPL/Bq3yeHTIIUlu5lgVK2b?=
 =?us-ascii?Q?hwF0N6f/1zT7Wn/ypneYRgcceZs3rOT6ght41Db00j+45uWBeC4cKBv3NQF5?=
 =?us-ascii?Q?NOhrUakhcz4xNPWDXDWzTfTku6K/hUC6Tg/MP6r8hgpWDEyGDkQkGv2/35Cd?=
 =?us-ascii?Q?Fr0AN4R1ueT+kgXCthdklQV89wa6uAwCGLRgkcNAowqG11vtLgPUTMSBSINq?=
 =?us-ascii?Q?Xs4ZmOIYhor1K/uHw147UHuJ9bOdQ8s63v7D852lk1EctypSbWJA5Kjqzr3F?=
 =?us-ascii?Q?WpR9EerXmuF2KKPXaRC8/hQDYVNInp6EEYHNyQd/t6sgrNM/jAo1NSt0qn2+?=
 =?us-ascii?Q?/yVg8+qiqqxNlM/Fi3VUAiJLcTt//ix9BClIGHBYI181IGM2SKOKXQ4GBC1o?=
 =?us-ascii?Q?xUBbb+ZiQ7EJHO9bpDBo35foSkwhQg6NwQQ35+522lvr1gG2fes2HtSv8EI5?=
 =?us-ascii?Q?HkuOjUSgvogVFZS47bbIL14=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a54bf13-c81c-4334-dc62-08dafccca42a
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2023 23:01:48.5084 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Zd1IfcDXmwU13SYjDa3WSkNsjTnrtDx0HSHHZnYfinLNgSRBRRKKLOYhvOasC0s9Xj3LRqv7D5+PN+GuX/Y7nLMKkid01MlSMvD/s2lhjfb9cRTYMd6dED9DvtGrx8r
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6302
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Heiko Stuebner <heiko@sntech.de>, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Colin Ian King <colin.i.king@gmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


Hi

> > From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > 
> > Current ASoC has many helper function.
> > This patch use it.
> > 
> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > ---
(snip)
> Does this work? There are functions earlier which modify the values of 
> tx_mask/rx_mask and you copy their old values on tdm_mask[] init?

Oh, yes, indeed. Thank you for poining it.
I will fix it in v2.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
