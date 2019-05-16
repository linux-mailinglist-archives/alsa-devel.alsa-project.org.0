Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6171FEE3
	for <lists+alsa-devel@lfdr.de>; Thu, 16 May 2019 07:52:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08F5616AB;
	Thu, 16 May 2019 07:51:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08F5616AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557985937;
	bh=5ALH3Wf1uVSqm9JNKeaiP1gJAs9kw2z9JBKVB5EJSBQ=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Vw4dwK1fT+9yTIMpBnaFcvL7+/xGGL+uBGCjRqNi9PidxoYO+FScI6PSyEX1my8Zq
	 7yJWzIE1NuaMeenDOJg+tp5vVGHs35uNqbuMBmqrX7vmjbKbG8O5/9QOcVK9lU9bC0
	 Oxz1dWkHYDrVIDQPr7SeAVg5UXtiFtBPHQSmXLzQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A54FEF89693;
	Thu, 16 May 2019 07:50:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7C93F896B6; Thu, 16 May 2019 07:50:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130053.outbound.protection.outlook.com [40.107.13.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27B01F80C18
 for <alsa-devel@alsa-project.org>; Thu, 16 May 2019 07:50:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27B01F80C18
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="n5uXhLly"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ea7s7gV++ju0odhg74nZ2Is4HRr9jlcD4nSEDbl05YI=;
 b=n5uXhLlyY/esrbWTrMqsjbg/pQot7odyIsKdKqltbF6WhAf3OKVxxdscqX3JP+PoBsJf+hucZDDvxmD2cagmvvz9DLpVO0CAeIQzV0azPhORZJ7NFO0Lg4im0QFZMSzrjBQJQ6n1X3c/tlhzujRN0cajZBLHCAtL+SQvC9LbtKo=
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com (20.179.233.80) by
 VE1PR04MB6557.eurprd04.prod.outlook.com (20.179.234.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.16; Thu, 16 May 2019 05:50:22 +0000
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::a5b5:13f5:f89c:9a30]) by VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::a5b5:13f5:f89c:9a30%7]) with mapi id 15.20.1900.010; Thu, 16 May 2019
 05:50:22 +0000
From: "S.j. Wang" <shengjiu.wang@nxp.com>
To: Mark Brown <broonie@kernel.org>
Thread-Topic: [PATCH] ASoC: cs42xx8: Add reset gpio handling
Thread-Index: AdULqw8bAAGC7faUTbaffmppV3l1ug==
Date: Thu, 16 May 2019 05:50:22 +0000
Message-ID: <VE1PR04MB64791493BF55A587AD10B267E30A0@VE1PR04MB6479.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shengjiu.wang@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4fae456c-2a09-417e-8466-08d6d9c262b1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR04MB6557; 
x-ms-traffictypediagnostic: VE1PR04MB6557:
x-microsoft-antispam-prvs: <VE1PR04MB6557262E417B86038A9C027FE30A0@VE1PR04MB6557.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:125;
x-forefront-prvs: 0039C6E5C5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(136003)(346002)(376002)(366004)(396003)(199004)(189003)(6506007)(229853002)(9686003)(26005)(4326008)(55016002)(186003)(6116002)(68736007)(486006)(8676002)(316002)(2906002)(81166006)(33656002)(52536014)(3846002)(81156014)(256004)(102836004)(6916009)(14444005)(71190400001)(8936002)(71200400001)(66066001)(478600001)(99286004)(66946007)(76116006)(73956011)(5660300002)(7696005)(66556008)(53936002)(64756008)(66446008)(66476007)(476003)(54906003)(14454004)(6436002)(74316002)(4744005)(305945005)(6246003)(25786009)(86362001)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6557;
 H:VE1PR04MB6479.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: WpW20+S1PHDW7fbJeXsEb65ZddGH161kdOeA8mdOXLREYjBqtK6dkTZ6VxcCczAdOe2q1rar8bgaQrqqh+sfitQYPbmKMWPUKJyxFDeTONvUIXhJl759zOwfL1YnVxgCIxDfoOa1FQKebkB13UxA9OVIQ4T8Y4lhJ8G6FwUgs/ZctNkUTDwFqNCsoKMZvPxHJvknKtTArA0lnfEBJTs2zLZMbXsvl3SCLc02ji1fVYnTcq8WKyi4/mPVECq00CEum7549eaSWN5gU8E8Pb1SfmZ6JcmqRdAu7EH/4MyO+Bnlfk1yArZ5N50eWxZvPHZGkBYqVEtDTIch8kQIvufvf7HgR8QfNJMsTqlkGIXb1UoSPMw67N0AAfcM77eoK4U+QezqlLNoYdQaWmPUCr4sdVbegYHNWJ6HRmM1q7GZFyI=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fae456c-2a09-417e-8466-08d6d9c262b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2019 05:50:22.1298 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6557
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "brian.austin@cirrus.com" <brian.austin@cirrus.com>,
 "Paul.Handrigan@cirrus.com" <Paul.Handrigan@cirrus.com>,
 "tiwai@suse.com" <tiwai@suse.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: cs42xx8: Add reset gpio handling
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Mark

> 
> On Mon, Apr 29, 2019 at 10:46:03AM +0000, S.j. Wang wrote:
> 
> > +	cs42xx8->gpio_reset = of_get_named_gpio(dev->of_node, "gpio-
> reset", 0);
> > +	if (gpio_is_valid(cs42xx8->gpio_reset)) {
> > +		ret = devm_gpio_request_one(dev, cs42xx8->gpio_reset,
> > +				GPIOF_OUT_INIT_LOW, "cs42xx8 reset");
> 
> You should just be able to request the GPIO by name without going
> through of_get_named_gpio() using devm_gpio_get().
> 
Will send v2.

> > @@ -559,6 +577,7 @@ static int cs42xx8_runtime_resume(struct device
> > *dev)
> >
> >  	regcache_cache_only(cs42xx8->regmap, false);
> >
> > +	regcache_mark_dirty(cs42xx8->regmap);
> >  	ret = regcache_sync(cs42xx8->regmap);
> >  	if (ret) {
> >  		dev_err(dev, "failed to sync regmap: %d\n", ret);
> 
> This looks like an unrelated bugfix.

Will separate it to another patch.

Best regards
Wang shengjiu
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
