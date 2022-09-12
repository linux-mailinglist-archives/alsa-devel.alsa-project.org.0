Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D67515B63F6
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Sep 2022 01:18:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DA4C16C2;
	Tue, 13 Sep 2022 01:17:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DA4C16C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663024714;
	bh=X73THlnDhls7t6sUHwSncBqho5Q9DVfGvz9m7kDv4HI=;
	h=From:To:Subject:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DydmG/omhx+hqjcuKDBVT8vkbvbK09fy+/JwYM8iWn+A67QTPmNd4foe4m3xnvCIG
	 0hN2lyEuGB+F0CXYOs5GfO/SLihjAV5j7upQrvzYBxOUPe5Q3vSgqRFzvNgZcy5Li1
	 31vrvNqaofbZcmWObYMQPpTvdvfQLkhcv1W2arPU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC516F8030F;
	Tue, 13 Sep 2022 01:17:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA898F8027B; Tue, 13 Sep 2022 01:17:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2102.outbound.protection.outlook.com [40.107.114.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CBA1DF80095
 for <alsa-devel@alsa-project.org>; Tue, 13 Sep 2022 01:17:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBA1DF80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="iX/n2YRF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NfJZ8vun65M8ljz9KKJ65kej+hRL772n9xFdEvXaDA5PagEQBJxzaf4V9EAy8PXGEbunO2FEEDyoPoIkV0jqfQDwjoA6ygoTq/uvJWXFpZ/SYKuRIePtF2hRMYry9GAJnI8AvG/XnHZo2PG7mDbLRPWF+KR4oSug6U/vi07a6drHaPZa4BG7zcJSE00cofCAktNAkvWMkbvCJBliGNu6C36ckZPGSq95S1FFlH198MEIyox5vcZNQU/WnXjVS5kDzj4h8VpONqQUHoLaszjp2QBIKfcWjGCU2fBFA4v0SCY6Sp41fPJc6LVcE18Ub39hXKTN2uOqh6wrup+nJP9BlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EN9GhEiwFrmE7NQJVSCH0qHEb8eYoqQm3Foxcpgsotg=;
 b=QQ3Gt2m9cZL7qfCd2pkrcHZYht35oI5DcU2KRcE76vCggsL0WbH4j4NTu8kUVr9rFCGGQJejosKdUHWvsyg5ULg42WkkQ7kOq5OrVKtrkPytMxqDBZJvmZE1iy8LC84QuWXvnsCz+nvrjit/P7wNW1WdaXzjArLr8WJaOooduPR1XRQ9xChu4N0mV12YvJSd3DqZ41n6gAm0bpxq2Gzo+x6prVVdAKoMsrKz6WJX7MjRk3/e5aje4qGLtDBLc203w7OdwO9XCqEUh03SDpxj/1WbvBcwoaftbMGX0N7nBrcwpcnKiGHZ9Zi44z/Sv9XdXzMLr40crp/j4w8Pb4HNmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EN9GhEiwFrmE7NQJVSCH0qHEb8eYoqQm3Foxcpgsotg=;
 b=iX/n2YRFZovyV00cZXbUwxOuhENy5EN6p7z7DgiKuLHc3O5wmt6xh9WrOb5EIX7ZmoFkC6GsuGF0oh92OYDDpsG5G9wnyc2Oipfy04YdcLAFbMJ60jEhuOdfm21nHAH1wYuSG6Q3kXhwNNUk7MQifQJLcILsxooLY08EWYqD7/g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS0PR01MB5812.jpnprd01.prod.outlook.com (2603:1096:604:b8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Mon, 12 Sep
 2022 23:17:22 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::1891:867b:6039:55d3]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::1891:867b:6039:55d3%6]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 23:17:22 +0000
Message-ID: <87v8ps5gji.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: meson: aiu-fifo.c: use devm_kzalloc(),
 and remove .remove function
In-Reply-To: <YxtpyvC/f6of8scT@sirena.org.uk>
References: <8735d1mjf3.wl-kuninori.morimoto.gx@renesas.com>
 <1jillxc5en.fsf@starbuckisacylon.baylibre.com>
 <YxtpyvC/f6of8scT@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 12 Sep 2022 23:17:21 +0000
X-ClientProxiedBy: TY2PR02CA0055.apcprd02.prod.outlook.com
 (2603:1096:404:e2::19) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS0PR01MB5812:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b788db0-cd6f-4c35-ea57-08da9514f228
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9on3rg2KmK3I+RgmmqFm5d9kW11MWKEX62BoU4YTiN5MZ/QXatfP4VBESYGVwI6ZE7bnoOu0e1qexIqxhmSFWCahEMNTDuJwbv1RZYt8VHFmjfQeelZTMuRQcE95SmF7765h1xyiGNlxJppErO13OeoLq5hJrnsVyyB3nFHxO/qzBk1AkoQQdUR3keNtqFimu6q1wgGtUWMg+neHaNquKu8mmKRRtnqcUHcF9CiCzPlhaeWFDW6CDmpq0PZCI7fnpzj1+MUAfcNeAPKIcPlKWHyo7TvAwC14Mf9v8/NqobxrgNn6iAJyaZLzTVxDamurpa5k3VgtAxEcc27/9fQhlPvrRLF7wZIxD8I4AfKBfOP/3YbD+8y0TrYayQPy8gtNMwo1smjrBdCxhzIuKCjoxIAif3hXyPMONIYBa/paR/+5UEiyM0y7DiWiXHmCMCuc4c/DZ5EUlBj06TWgbl0z/Kw8FxKUqjnAnsnEuWmVV6WIBBsL4tE4GfqOzZ4DLynosDPZi6Nu2TAlExk060gRJxuTijS4qgwMIj/Kn3NNNuJTAn8xYaZw/8agMG1gsS1rgofdhWT7IHfoxJUNQWlVKVX2EVlPIcFEr/WD3Jz/GeNeTZhAwYtp6DXo2zAzB+vyc5pGUv6LvQjH+ljqN65iiRlmlXkRMR+PSh2XuwrjfAFDiyuFD4/T4C3i01a30VdQOkreiniqbmhXI6Uyw1BpKRr5cvvr2K+RdxRXY0ndJmzY8B27/d5VqP7TwgBUYriAw6XqqUpG+KllKsn9jh6AYMdZfhrz6ang4abx5aiOnto=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(39860400002)(366004)(136003)(396003)(451199015)(478600001)(38100700002)(41300700001)(38350700002)(8936002)(6486002)(5660300002)(6512007)(2906002)(86362001)(2616005)(66476007)(66556008)(4744005)(4326008)(52116002)(6506007)(186003)(36756003)(8676002)(66946007)(6916009)(316002)(54906003)(26005)(142923001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zcsMC3CKH297RRuzuU5SFlfxQjpjbziS5wpfCn5u/X9rT1bFWcdlBh1vOSCR?=
 =?us-ascii?Q?SUDOBNR6YEPfaHvY+iy7GnFYOmg54UNliRJA+sfrn86udmmRjg1z0+Zhjc/H?=
 =?us-ascii?Q?W21QRbzcBbGvywVrU2C3b4lgWu94ii6VSbC4sUhQpRBfl1RtQabQXqrQDlZG?=
 =?us-ascii?Q?njzamiAFtOifHJg+N3QUDvqDtUr4TLsPIBLe1OtsMC+90/PWd32YzLSIvXHw?=
 =?us-ascii?Q?VWHH8yRywP3FdaL6lsPb211PWcWi8zrVarb8cJK+VOuj/IM/yNCH8Oux/kdy?=
 =?us-ascii?Q?EI/rhFuOFt9jVRwral4pnrBCf0j76M6zOgTFnifwfGiWS0LuyvDmhDLpQxhP?=
 =?us-ascii?Q?y+Ul24FaAsoiXsTqpuh6gDNJmpMLNofTowk/DU25nuX7vpty5LyRQAiVn6CM?=
 =?us-ascii?Q?nKLdW+dH5lHaspQMr04q0T6xweFeVO/SZRzT7UpNBFXvO40YZSpvVRMF17Ez?=
 =?us-ascii?Q?Q3EcCGZNCkICysvhivzky24wYI7qXtvbnDbbFNMt/TXfW7furGqN/iXc6/3o?=
 =?us-ascii?Q?u5tsA4rFac0EqZ6dDnVLgiDLL1nsvyakmE/af4EU/hsztkLYMwScR/jyzcjO?=
 =?us-ascii?Q?EFagloSn9YULThm/CAW7zX1JJqg6og7wpfRWMwzehdxE1SpItsgRcrno+hW/?=
 =?us-ascii?Q?gTvn/54KftZuR/Qx4kmM4gD3HSUwm4z/P7dUsVedlP2LDzrVsl9FhquH5PIG?=
 =?us-ascii?Q?dsfg0aV9Cg2tLNhFBipHTr5Y4CTkFPtXU4zywncG5QnMBRkYuICvd1EulqB1?=
 =?us-ascii?Q?aqFNVuSQZTwVX7/yT04IFh4ntL11EoByKjKsPM++R8WyOpCSyoQRBUTvqZ/N?=
 =?us-ascii?Q?A0KfZVm3Zn9AyUuzNBK0BEsunhuOCfhKK5QvnIczCdObdZzEJdERFhAtN/WS?=
 =?us-ascii?Q?TWJryt8ivkSP76XxboT0MAd7j9dvHgtBrzPQb10vvOBlGsQtqdcjCWVvQo2O?=
 =?us-ascii?Q?eml77OuJ8u/G+V7JLjqIGIBAQnHmw3qi3zB20Fzczvk2RDNGhorPvZQIzaKz?=
 =?us-ascii?Q?pCq5wvzfDbOrt323vlvvDRh65NDI1Xs7rI5mqPtXk68YmRmL6FzvA9bqn9L5?=
 =?us-ascii?Q?DMc8ofsOTLHe6SeQtrYFthSGGYAChqaDn9yj6XNT7bVPk5C8MaOmrIVFG+y2?=
 =?us-ascii?Q?vO8yHioZFLTWp6lkNEiwyvZBREad/wLvTpoarRGwzPi1UNUOxPmVODGX6+GB?=
 =?us-ascii?Q?P8kPYvfO2qWkuo09XmHld4IdVB/jzdhR+rAM3Ty4QgFGrIO2+5iiPEUTd3ZR?=
 =?us-ascii?Q?HT9xrVCE/GHpQs+TplFgB030e+nW/Wx+XilqEvbX4rO+H4PnZg0RWHIkJI7B?=
 =?us-ascii?Q?ZA9ROHxlAwjet8QN0cO4UWLYgQN+ArP/7z+6QZVta94WTaiIv95CZFSSKcRJ?=
 =?us-ascii?Q?DOUdxSmDf91sNFUYRBCCbK8z3vqVN/j61kslA37qhfzDa0DJlDf1ThVo2Q/I?=
 =?us-ascii?Q?dIHRiLnq/DIcmULZbqxV81vplKu4PKx1zloyFmsimW7tO+jbw4IODw93+WKK?=
 =?us-ascii?Q?unQK4ic15vF4BY5jHi2ui6aU+QoMKnEE0IlqU7cdSsfopTZrJPvBBvmRGqpq?=
 =?us-ascii?Q?pMrN28KsIjfTHlkTSxpd0AeoFQZCv5VSmArkkYxCeQ0zqSe7LX7yYwyDpZT3?=
 =?us-ascii?Q?3At6iEN8TYMv/IIVvCs3daA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b788db0-cd6f-4c35-ea57-08da9514f228
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2022 23:17:22.1936 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CaVdG5u9enYj9w0vueiBpiqHGT0ev8nBbWLvezuwEmdWDu/9KDGWrTlAwRgtHyrLfKvJUJ3v5T4Eej1N8LZGNSKtShDRfhxjBT5ALHAVEi25JSWIysc1lA4pnSzRvKDb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5812
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>
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


Hi Jerome, Mark

> > > Current aiu-fifo.c is using kzalloc()/kfree(), but we can replace
> > > it by devm_kzalloc(), and remove kfree().
> > > This patch do it.
> 
> > I'm not sure about this change Kuninori.
> 
> > This is the dai probe, not the device driver probe.
> > If I'm not mistaken it gets called when binding the card.
> 
> > The components and card drivers are different here.
> 
> > If the card probes several times for any reason, EPROBE_DEFER for
> > example, wouldn't this allocate the memory several times without
> > releasing it ?
> 
> Yes, indeed.  You'd need to move the allocation to the device level
> probe to convert to devm (which *would* be a good thing to do if
> possible).

Oh, yes, indeed.
I will fixup it in v2.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
