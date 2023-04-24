Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7246EC3AC
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Apr 2023 04:38:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1775FE8A;
	Mon, 24 Apr 2023 04:37:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1775FE8A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682303901;
	bh=B6pMiZIuiWj4gHxFk9ROuez4bPCBeko7cVhaNMuDFSs=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QnDdm2ElKGDTCbF+e4AP+f3FoWzBD7p2jsztgYQzTyL7THi97r2fUDLvoUlTrv18p
	 cLeiF1/+2WDVPJVj04Sh6z3c5jkRDPp1cSxT3yXvmffkLnvvi4PAgXJP80ueY85OWI
	 RCIqioo2h6Vov6FEfu9da/WheMR3tw7Fw3JEChYU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 01D4EF8055A;
	Mon, 24 Apr 2023 04:36:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD22DF80567; Mon, 24 Apr 2023 04:36:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2072d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::72d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C1138F8055A
	for <alsa-devel@alsa-project.org>; Mon, 24 Apr 2023 04:36:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1138F8055A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=aKS7icMt
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b295Q4Qr94WArrtJKhAJ2XVkScasVxD06KZ70WgLkZkrCO83hfgUQbYCiec2/zXWyZTfMniMcCQgFsFT2ury8kKX4JbgBWpiFLNl0611xYyEXzid+1OA07BDtQDyQm0lADeUclOTPrXbiwZeMj1RyCaj0nhgZHy7qr6++pQKAI+ss4MY21sxpXHH3WriqmbipfTtdrt1lGUAnhdLZ38aBPYeTKTb08xRVs56Z2kLgIzD6VL0/t0We1nOeTYqRmvamAL3fF7s1T+sVtzWYdM+9CdkssXfN4Ao/utX2i1/KtJE241LvYOzZ25sLfVrx4CQD4PUS1zZDTQv417T5jtEUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DG7k8UGtCHvZZMsM3BMgjlksc9muxPdsnEU2Bx8IXzg=;
 b=HNvsVQvpkJl0pUjJExz2Pb0y752hMVd4vfF0nFb91+9m/RBW0PxWYVYLSiqC1ERn6IGhCvYPfjJMmaLjEPXpktAIxpm9XIVLC+1h2v/2rk+wEsMqFFqCX/kAAxP0V/hCp2IQfsvlW7D4w31BFNwhW95WOxk1Lq/oKtmjX/jcetKZVaAVyUccNFGrvenLKsR11/XCLqpRTdhQErcevrjBAPRmHx+z+YnLR67T8wUkNYHqeR7bCZnD7QjQXFn6MsguKZAwF1lRKMyPKEzb7RfBug7rVC+7jjjJif9EiDrKCvsH6/5cr/V5lOnLK846GJi0yDcliB1RpV1fBqzDKVLwKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DG7k8UGtCHvZZMsM3BMgjlksc9muxPdsnEU2Bx8IXzg=;
 b=aKS7icMtZIcJ7sxWw1J7F+jMcUxQ7nPfPlGMlKBsLqO4R6CHW5sSngVEHR1eXsRog5474sFS0MlE86KZ+6GWl9T+s99E8EFB30vS8OwuLE9gLgm/l1zvwF4xNMWA7ezADPoxf1T5XuNG6FPhZdvkjCpkcoyD5fmEwvUDUdCV4fE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB11070.jpnprd01.prod.outlook.com (2603:1096:400:3a7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 02:36:45 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%5]) with mapi id 15.20.6319.022; Mon, 24 Apr 2023
 02:36:44 +0000
Message-ID: <87354q0zwj.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Banajit Goswami <bgoswami@quicinc.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Stephan Gerhold <stephan@gerhold.net>, Takashi Iwai <tiwai@suse.com>
In-Reply-To: <87bkje0zzf.wl-kuninori.morimoto.gx@renesas.com>
References: <87bkje0zzf.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 06/13] ASoC: qcom: use asoc_dummy_dlc
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 24 Apr 2023 02:36:44 +0000
X-ClientProxiedBy: TYCP286CA0183.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::12) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB11070:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d3ac90e-fcc3-4959-25b2-08db446cbe9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	q/aEVxr/OAvnYa6gsyDRy83hhFyy65FfqGKQgyCUPsKUuNUzoEk5fNpbZMmQVJS/SjMLy24RNz8mqBhL4ruCC+JPPyzSF9/VUf63o2+I7ik3AxHbqnuDUGCGq2aiplgnbYj5L/ebVcAUTYxK5L5Tbdm4m7yALWkKNGTSI2FyZeoirE7KPXcwptjMv0SnWur99Xkf+a066BYu6FMnmad+slbJoSXWlGm2i0aLGrc4yirvfCi1nZTrHEBkU5L6rOiZkYGTAq67M4jb1pW8MvgI2pvH4aUfSdVC7YEgZFx+lN/YsCJC/fAjjrGSukmlUNyQMTtH8GlYj1ed4ZEkhscUAuVdrw67aP1sB/SsOQt8PAqWkzl57km/rI/ngA3rQgUxQeN5VIWLoLCsyqhn/fl04CwEOizX5kp2BSqjFODxTl76sqvXx5rcKN9ZFfu1tYdTAsE8TH6E/GWXopZZ9wN9iiwCvElnf7ZPnPekXkr6Czq04w9Ot0LvIykyT5Crpx+8A8oeQ69lt1AfN3S6JmIybEMNVT5WXCJYoxELH6wJYxTvzZPBUt7aOJ8Ais8ddc0wWmnL5kh8HmNyBPHvwwT5astLsjkpTZn/Iw814MK2Lsvkp1LK69PYnQpI1GxLHSXd
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(366004)(376002)(346002)(396003)(451199021)(4744005)(2906002)(66476007)(66556008)(66946007)(316002)(4326008)(8676002)(8936002)(5660300002)(41300700001)(36756003)(86362001)(6512007)(26005)(186003)(38100700002)(38350700002)(478600001)(52116002)(6486002)(83380400001)(2616005)(6506007)(110136005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rq5UccDWxOz5rc1esuVApbMnwiWuqX2Yqg2x38R+ppv5vYveRr+ZM89b+Gb4?=
 =?us-ascii?Q?APzj91pAhdYy2+t20SHFk1ygvCQ0fMv6hSrGvuVEDWpv5MYGjW6eiBfgiw2p?=
 =?us-ascii?Q?1/hqSlTsllkhWARo3zzHiBDCAqhr/AJTcGyxX3MLu/uboH7tCFtB2RCOz1R0?=
 =?us-ascii?Q?cQ1JsqReGONyZ+u/vXfPNqFdgi3ACQThlQW5IRocckJGOQuqOi9xoLXM7HcH?=
 =?us-ascii?Q?X08S4eqES/hDOPY2TQzuf5Fcb4hPqobM24N1IqQ96b9N1v/7ZEVJ4CnHb0RJ?=
 =?us-ascii?Q?REiu6lzz/FYwEJhx8CxK07zYPoSlnbI42cwBfT1KmxxgoFzncRkrTwD4Miq3?=
 =?us-ascii?Q?1VndBFEIpUWufhZKNEksijmJouU90cjoXE5cxOdoU+e6rr8eXAx1L/+b7xNs?=
 =?us-ascii?Q?IpvMrhYtMsxSy3kzPr2fN3bdD9ns8v6zx4bxQ4JAvSSwrC+oj2wMuwUW2Okk?=
 =?us-ascii?Q?BlpmZOozeFm/d8vaEVb1bPr3dyJn3GnLtmMmK1EtnNWLhZKw2Dq3l/HopHqa?=
 =?us-ascii?Q?7so8Z08Ezr4co6om0UXMuHp/syTwJ7O76RLPrUcK7A4mNnm4TfaYeS3prMUN?=
 =?us-ascii?Q?bsYR3idmzCrq6C/79D7IH12QuFocvruQCM8kuz4t3n/uHzF+2FybuiPDZ+dn?=
 =?us-ascii?Q?TdaqEE1NYnFeFvHQsWNH/VL/Wwh2/aS6M2Wh3eO80aAmq8Kic/MletW5BX2E?=
 =?us-ascii?Q?Fv/OHPHarbDAFZo66lmyd+XrDLcfUV9Vwds8DCHTWGeSI79ky4l0e6VJg8ou?=
 =?us-ascii?Q?faKaaEEALA60a9Sk9hFYJmkgHtkfva1zlVgphwAFBoY83WzcFUmM9rI+1jqc?=
 =?us-ascii?Q?x9T68Cbxh+u++HOJFlAAsCj9/PrpBcuRI/3jfKKGeikkZHRWalhkcU0edXMl?=
 =?us-ascii?Q?MRcuH4jVXzb5WRst/0yZPzouSSLA/V0Tkg6N1W3/VzJ7wl7+PpVzB4ku861q?=
 =?us-ascii?Q?6T/6newPjQ9o4wU2RuDOVjhBfFsVQUT67p2R9YqoPMaucDjy3gZjIjUXBxPZ?=
 =?us-ascii?Q?Z0PIwvq5yD/y1TEkhSlppI6+EpJhCMzlSBMD5NChFPW/lIaflt7JL6jMRn1l?=
 =?us-ascii?Q?pmbr/VFKCMdERINbdZ68ZKG01t/H0kh7/L0cFiuDgoF2f5O9GnSnT1bnzMyO?=
 =?us-ascii?Q?C8yOZFJ63nfc/8iww3iDe5bitvZEhGg/eAr+jYARYcKskVjd7mrzYNBN1YiS?=
 =?us-ascii?Q?mCXJhrVyKBRTaPb+7tQj9fvMJuQGeRpnLI8sXGDnFZobDGuQzI6p9h2j4Iry?=
 =?us-ascii?Q?7IVoehHLWLtEufJlTKARgIXWu5s6UwziWvaiDsTAgiwRnzTTh2dND9hhnQ95?=
 =?us-ascii?Q?xMXTMGD/3tDdkZ0C6/1ojUUR2/YVKWEB+5jwW3XL+ZDIej2IFsXysQ/UecjY?=
 =?us-ascii?Q?S9v5HJ0YSQciwqyhqEcnX6ZqoidtvxiPijnBtbBLy8epKilaoT13K4ZZ1ZLj?=
 =?us-ascii?Q?2wSSFH/2inwKVeZUKi+u1OhWXUfVz/sc4RTiD4CzFEsRkq61a8xAtjNSiovU?=
 =?us-ascii?Q?hxnt1iCI/EoBI3fgKw+xC47jaCOulj7EMWJveKLrT75T/EgZYOTFsJ+F/7Jv?=
 =?us-ascii?Q?dCryNz0WuhR1ZR2k+cqHTIeybRA45X9ub7G+y9KiyPtL6gmGFR4IeaTeNwzR?=
 =?us-ascii?Q?qdyKDkx7Y8ivEo2rkLfiKck=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1d3ac90e-fcc3-4959-25b2-08db446cbe9c
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 02:36:44.9475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Cxf4yjc29FgrLI7nkNlBqgG1UR4Na6WqJ7yvzgOH7wfMiztI/qjuouc1Mixxe/tD7CuRn3igTYQyLu/GidJZjIUMvqjTij2Ud8cSZglFVsj0bL+T8LJ1cQHvoJ7K3t9s
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11070
Message-ID-Hash: Z4QGIBXBOQXEYXURJZBDYOYASAKEFQZT
X-Message-ID-Hash: Z4QGIBXBOQXEYXURJZBDYOYASAKEFQZT
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z4QGIBXBOQXEYXURJZBDYOYASAKEFQZT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Now we can share asoc_dummy_dlc. This patch use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/qcom/common.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index c1f24af17506..cab5a7937a57 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -140,17 +140,8 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 			}
 		} else {
 			/* DPCM frontend */
-			dlc = devm_kzalloc(dev, sizeof(*dlc), GFP_KERNEL);
-			if (!dlc) {
-				ret = -ENOMEM;
-				goto err;
-			}
-
-			link->codecs	 = dlc;
+			link->codecs	 = &asoc_dummy_dlc;
 			link->num_codecs = 1;
-
-			link->codecs->dai_name = "snd-soc-dummy-dai";
-			link->codecs->name = "snd-soc-dummy";
 			link->dynamic = 1;
 		}
 
-- 
2.25.1

