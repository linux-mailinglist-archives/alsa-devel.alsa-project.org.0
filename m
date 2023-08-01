Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C8476C148
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 01:57:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A67FB1E7;
	Wed,  2 Aug 2023 01:56:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A67FB1E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690934255;
	bh=8Oh6jH6sDjtbZ5VcilDgMV9A0TPYXtxnmhKtemY3KRU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tWaNKdBMWKmq3/3/+vfCDuSisvwuVwTFtj0OU7A0MQUmrjfibdzeindXgOCOs22cq
	 58yRluG3s5CHzujLaW9317ZXpCySIIe9oa7H8szpoubqI5oEfjax5sOJYLE6eXUAzU
	 C5D6wkplQGTs4WJg6Pd2WxvjgSHhnjIDYavD/qUM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77366F80087; Wed,  2 Aug 2023 01:56:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 34D9EF8016D;
	Wed,  2 Aug 2023 01:56:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B191F801D5; Wed,  2 Aug 2023 01:56:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2072e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::72e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 84F3BF80087
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 01:56:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84F3BF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Gjgo2Bo2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hRD+DXaSeyJKYKTdRlWvK9fVenR00+bFkqRRVjs9u2awgkpDVWQ6tBJPrhY73aFFKl0/R2s3M+4BZ+lmHgSLt4hvKVuaDaXxzdZ67VTHOjEX+Ky6fwduIyX6ZMNCTNuxar5djwj2SEd9aIrMOzHqpQuC0co1VvY0pqOxH1lUUfgpvtdSy87ufg8M2REdrdjNmq2Zv4P86DN3QSSO7sEi5yHZRqUjAU5383d3sZvmWp9FIumS+AtCWCrovwEHH0Cmu5KKbazffqzoTQynVdaGdg8ERsBoAKOuYLgwVEssSyRoZnRZG0SCkClUTqHPDE9OOR8rxYn5Zo+nedEJ6B7ACw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q+Tq4NuAx2R6Eyv/2V/pRTlgl9mZIl5itOykXMVQ5Kc=;
 b=KWV5WdfFYRVOGP/XzQBv9EKrp7sK71yDizHI7NEyV5MnrawDIZpAEhxWT4sDbRWqAkg35+dNaHQe0F6ahxfPXSu6KCfNJje9DpvJVWxOvW5fsHp56sBsTO+7M30b+DAr1ThMQ2Qq6dbgDpKVkHa1aBLTl/0Y518nN/SNppVp/YbBOKQXF0AF1dA/zZ4KNrRJOlrG9B8dmCd+CgmfMr0ZixFYuJbTlrBedQIj9KuwXVM4J3GuJC+Enn+u3sq1nFMrWH16LCvybXeZGnDMofY2xHethv0brmWkTvTtgMqQ4jPRgu0cqeF6g6EAyEO6+573vAqj3rPzbHf6tETT3l/hWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q+Tq4NuAx2R6Eyv/2V/pRTlgl9mZIl5itOykXMVQ5Kc=;
 b=Gjgo2Bo2qVQKnqoy8nbuqX79DDT8KrzkvKixSUUGNsxEghq9J3pA9b0YVEjkXbHskDg+H7XJCfwJYZbvtra8zae2AfP3tpWrVux83kF3eWGTESlaoi3hGTIA1jar1dQnvqT/ypJVc7QAnWIzR4RhbkLQyVtJyBCSHZDTnwn5znY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS7PR01MB12115.jpnprd01.prod.outlook.com (2603:1096:604:262::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Tue, 1 Aug
 2023 23:56:04 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6631.045; Tue, 1 Aug 2023
 23:56:04 +0000
Message-ID: <87bkfquxkc.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Jaroslav Kysela
 <perex@perex.cz>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: intel: use devm_snd_soc_register_dai()
In-Reply-To: <5d8f3ae1-7f9f-8076-f5ff-36f9fe666ceb@linux.intel.com>
References: <87v8dzpsvm.wl-kuninori.morimoto.gx@renesas.com>
	<5d8f3ae1-7f9f-8076-f5ff-36f9fe666ceb@linux.intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 1 Aug 2023 23:56:03 +0000
X-ClientProxiedBy: TYBP286CA0003.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:ce::15) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS7PR01MB12115:EE_
X-MS-Office365-Filtering-Correlation-Id: 67169e06-54f2-42e9-0046-08db92eadd73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4U73dbceJFpgjh829elM4d9iTvXOhLNIe1hgBuHk4Nm/6g3uXjRVaezQlFgni/yQMtDk5xBFpb/basROWSTW9Xu8CMxqJrVLwARF3OVUVKJRYiagAKeuHD2fBdHOsVur6g1pEE0hfj07kYHRkhgWpMfWylF4T87G0p6H3yOs0BYQiUSGDrHy2Gg3T7qeR+XLhcMUk19sXTzoHJTyRxeV1OP+KRBiuWiFiJnuxjpclgH1WJM9CuZLWpXqXo71RAATNZJJX1K8CHRulTJODvCM2JAa++Fks8GBdSPlugg3r307yXg/mGlzKVMnsOwBHhkQ91DTvJPGjzH0wFQu7OOK1ilUUtuKV8wAHDMKBLcfEcpzxMZrmWd1x/9Xxk/lKJPFonU3i45XAqXa3VehH66c3FZQqtz0jVJVFeaB8Pz00tcOLiQRoWpUXpXpMHpOAits4NaDN0JbD3MkdoY1th739vxXPKIO82aqHnNEsK3EdheaKb983fKe4GMvGD5gbYMg2JRrHx1o0ttwlJy/vzvQUHXA1sk04OD8Mo9I5rWN3yEEMfIOgg2JbAkprKQmQ9q8n7EmPmrAhGo8S443If3qJhsqmuNrCNO4sLKhVnJtMwYhwy/lmJsifQzvhgY0410gBT680C0QDaWqfeb2GLNIlA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(39860400002)(136003)(366004)(346002)(451199021)(478600001)(2616005)(54906003)(83380400001)(2906002)(7416002)(38350700002)(38100700002)(186003)(6486002)(41300700001)(26005)(52116002)(36756003)(316002)(6506007)(86362001)(8936002)(8676002)(6916009)(6512007)(4326008)(66476007)(66556008)(66946007)(5660300002)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?t2yJ25v/2NPFt1T7i4eHXFM2wMa07udGaokD0tDVuDRJ2U0gwgSLTzN12NQV?=
 =?us-ascii?Q?NUvf8q7DaFSB5UrvbVXUoGkvF4uXRJgcAN2AF3dOo4PyVfKPtMBCaR59kuUr?=
 =?us-ascii?Q?JV+EqGb/mdYhYA1Ydw6WZN6Yr3h/n/Ap4ynohTsvZpBSiNcy0geXmU/t0huZ?=
 =?us-ascii?Q?2+E5PTcvlzRWB/NpusQNK6oXHsYIGxcyKOFzgc5JUhphhW6LapMdxli5vOMk?=
 =?us-ascii?Q?9YZ7N3I5J5yhC1SY4L9ZjK7GPT1cHVEZcXigYkvFGVw+FPoMyPRFyOV7ipHu?=
 =?us-ascii?Q?x/kodbWvvkhnqHBn69JMvH2ymv75lxCC1E9ITNyq7maBcsX+8h7HGDcojcrT?=
 =?us-ascii?Q?7FKzGWeTZ55XlWM4iU/gekVcztiNB8roczXJMF+tEzw1kSF5kXrFB/wBxlCQ?=
 =?us-ascii?Q?Md9zWKbsNKqkjR0aW2pCO3YF7aN2/jV0BcfiB20O3XBMOAtkr9128wM6VIx8?=
 =?us-ascii?Q?95I9kY2VTjWdsjLs2quwYhKgf93s0MFaTWZHFZj2azpl5moBqYNfF2Fz66U8?=
 =?us-ascii?Q?gKIbL/H8YTl905xPbcXLuDzoHwpjrvfUd1EWeFSKH0tm81dOgXaSBFNzeX/4?=
 =?us-ascii?Q?2x0Khp6NyoupTeunUhLo6e9BKWGBqbPws1p4kqDgH55Ku2kudhb/h8WG5/dg?=
 =?us-ascii?Q?QsdA9cxCppZoCFMSpJ5DDdimiwBtttLUQq3/+9X/VGKh6bM/mmdTrHDplMLC?=
 =?us-ascii?Q?g2FqVpzLOUF8KPzmB545aSFIvIezpT+1zCt2fS4BaTRzHlVEiIND3MCYwoFV?=
 =?us-ascii?Q?qJMQ+CQPTGSIG+ki8oOrSAmjSvjfbq/hLspdsKzbItalD0btPscH8Tvj9qXJ?=
 =?us-ascii?Q?HgA/EWfFIi5GOc0jxRKbznjksA68xnFaAL+j0K4/8jTJJ7xgFk7PEweoH6gS?=
 =?us-ascii?Q?FP8oGHKP2SugfZnEDyWhA16nYdWJZFODCkPRXoanzFXfkGk1wSDRdF1ZFuU2?=
 =?us-ascii?Q?Dop2zU2D4r7mKOTmLgIzUfPtJBf4YzfAF7x2s6Ap7Y9U0BSbLuYHTrX3u/jQ?=
 =?us-ascii?Q?sSAPsIrzsFcjAbu1jkVyzsRPT/YnaYOv3wppc7gKubi55R++JZooGr2eNr6E?=
 =?us-ascii?Q?ed0Y7LUQLa9/ePE2ZNdAqenQ0qxP7BrXaG4P3wR6JH0gR/RFfiqxH8VTThPr?=
 =?us-ascii?Q?+PbfoZy+gyIgqf4ZhX+nCegNEdJ2XSHebDSpYIHgaGrx+OjZxtfZVobzJR9O?=
 =?us-ascii?Q?c/8jQQnu8gfqgoVg55vMAJWGyv2gV2e2aq3k0JlFVSq9xQ6WwM90GIxS5t+T?=
 =?us-ascii?Q?tF8JZnCNT3NM21WzoNFFEY2Yy7tGEg/3QaeyFzFEIxv4V6TZLgZ/8CFwkDwH?=
 =?us-ascii?Q?dzcTxntlYWbAFb7JTx9TFQ5EBLcmkbHcCrLpCArxRj/n26RrhKyU40wNlr89?=
 =?us-ascii?Q?yn8iuUGgVlSEvCZqI0JHnSX11vwvtLoBbJW09RT5cu+uTBXYz8Q7BjNieeO0?=
 =?us-ascii?Q?vxytjX9eliXrDgDTxye9JdUo44UVq2EAETglut0mYEbPe29ohUpMmLGFTs1+?=
 =?us-ascii?Q?ctZvYprewOuEmzohhYEgbhU+W4suSa4g7wUoO9r9nAg8GZ8NwQ5eTcPEhXvt?=
 =?us-ascii?Q?CnhFBtgJCrxUGHpOzMwjchNpLgnJ+hc27B6o9o9Wn5wXBDMcAIEA5vpPzX0m?=
 =?us-ascii?Q?UtV7wfStpOIgUV399JsU32Q=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 67169e06-54f2-42e9-0046-08db92eadd73
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2023 23:56:03.9522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 5CZz+WEBVYOOPcHuQOv6w2l5yQPoNaz6ybzWlHDg8gzix2s/SIqKwUcP5fp7pFOLzELqyk0KG7F12Q0Kinuni28VNvc/DXrKAD35uaITXEdlvS538n/c8r8SZqB602QK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB12115
Message-ID-Hash: LKZBEKIGIZ6I7J5IYOIEKQL6L4MXFEFO
X-Message-ID-Hash: LKZBEKIGIZ6I7J5IYOIEKQL6L4MXFEFO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LKZBEKIGIZ6I7J5IYOIEKQL6L4MXFEFO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Amadeusz, Mark

> > It is still using snd_soc_{un}register_dai() manually.
> > Let's use devm_snd_soc_register_dai().
> > 
> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > ---
(snip)
> And while I like the series, after applying all three patches I get 
> failures in module reload tests.
> 
> If I remember correctly the reason we did explicit flow of register_ and 
> free_, instead of using devm_register_ is that the lifetime may be 
> correlated to existence of other device and we need to unregister at 
> correct moment. Maybe something to revisit, but I would prefer to keep 
> tests green for now.

I have sent patch-set to use devm_xxx as much as possible before,
but there are still some drivers which doesn't use it.
It is because of lifetime, like this time.

I don't remember detail and/or which driver was,
and no comment about it on code.
But this 3 patches might be it.

Let's keep all tests green.
Please drop this patch-set > Mark
Sorry for my noise

Thank you for your help !!

Best regards
---
Kuninori Morimoto
