Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CD24B5CA
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jun 2019 12:02:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 338FB1697;
	Wed, 19 Jun 2019 12:01:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 338FB1697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560938530;
	bh=/IN40An0eAX8EHxPONSyoBhmfLhuqp8OqQoImoymUl0=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b1ocC7AQdoz0XemiFtp4U+WPh9k4Pg8Vc2dOW8PO0/zIiFFnNfkJJriZzFbxqZXDt
	 PFyPd/Ez6enntaPpy7gXv8UiAMnwGwMGpRTyHELfRXQ7vEXiCczCPE6uY8xLJeYtLH
	 YTfATjUGZRd4YOTTPSq2z211PYHBp+9ogVIyfZx4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C21ADF896DF;
	Wed, 19 Jun 2019 12:00:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE3E4F896C7; Wed, 19 Jun 2019 12:00:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03on071f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe09::71f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B348BF80CC4
 for <alsa-devel@alsa-project.org>; Wed, 19 Jun 2019 12:00:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B348BF80CC4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=toradex.com header.i=@toradex.com
 header.b="NDuLEA8C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qr6g1cm7ng129IYm1V5p86lHZWyWhhQWJmuI0SaSofM=;
 b=NDuLEA8C9AHGHTduW81jcH2VjmIA55/33qP+lFuePToq/neYUx9ikFJeA55wJkzikwDlP7oHycCoB3/NNeZMg/lmhUEESrs8sePRIVxirsRMJnjSqUfhQ4kSjgyOj58unCtTznTP5hInFZiZov/RWAxXvETl5i07GAt7sTB2a1s=
Received: from AM6PR05MB6535.eurprd05.prod.outlook.com (20.179.18.16) by
 AM6PR05MB6120.eurprd05.prod.outlook.com (20.179.3.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.10; Wed, 19 Jun 2019 10:00:30 +0000
Received: from AM6PR05MB6535.eurprd05.prod.outlook.com
 ([fe80::2c23:fdba:9ce4:7397]) by AM6PR05MB6535.eurprd05.prod.outlook.com
 ([fe80::2c23:fdba:9ce4:7397%7]) with mapi id 15.20.1987.014; Wed, 19 Jun 2019
 10:00:30 +0000
From: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
To: Marcel Ziswiler <marcel.ziswiler@toradex.com>, "festevam@gmail.com"
 <festevam@gmail.com>
Thread-Topic: [PATCH v1 1/6] ASoC: sgtl5000: Fix definition of VAG Ramp Control
Thread-Index: AQHVD9BbLTSN4sMG+UK9nZhF2PRISKaZbpKAgAl3jbA=
Date: Wed, 19 Jun 2019 10:00:30 +0000
Message-ID: <AM6PR05MB65351FF540C6CD22167A6F90F9E50@AM6PR05MB6535.eurprd05.prod.outlook.com>
References: <20190521103619.4707-1-oleksandr.suvorov@toradex.com>
 <20190521103619.4707-2-oleksandr.suvorov@toradex.com>,
 <79fa1a0855bfcc1abad348aa047e7a69fffb8225.camel@toradex.com>
In-Reply-To: <79fa1a0855bfcc1abad348aa047e7a69fffb8225.camel@toradex.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=oleksandr.suvorov@toradex.com; 
x-originating-ip: [194.105.145.90]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6b0ffbc8-b4b5-4fe2-9ead-08d6f49cf66c
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM6PR05MB6120; 
x-ms-traffictypediagnostic: AM6PR05MB6120:
x-microsoft-antispam-prvs: <AM6PR05MB612012650CD52848148D1F00F9E50@AM6PR05MB6120.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0073BFEF03
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(136003)(396003)(39850400004)(346002)(366004)(189003)(199004)(6506007)(305945005)(110136005)(316002)(86362001)(74316002)(76176011)(53546011)(26005)(6246003)(66476007)(64756008)(71200400001)(66446008)(486006)(73956011)(66946007)(3846002)(7696005)(478600001)(6116002)(99286004)(66556008)(102836004)(44832011)(76116006)(4326008)(71190400001)(33656002)(81166006)(446003)(8936002)(68736007)(14444005)(54906003)(25786009)(5660300002)(256004)(8676002)(7736002)(66066001)(11346002)(186003)(476003)(229853002)(2906002)(81156014)(9686003)(52536014)(53936002)(6436002)(55016002)(14454004)(2501003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR05MB6120;
 H:AM6PR05MB6535.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: toradex.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: woUE+ynWcg3JxzWku8Gwy4huTEeW0kF8K+u69tv4kYgOMjfXPmtxwj7TX00L4ls0+AjuJjpmCBd9HZDKCBtejflZdZ9t7JpL0HurcRXm7UkNHmLfKJkzbmr7aM8xyPBLKPDayY+i6Z1eBXaQaObCkqPn+H7+gbvwBvB4eWQd0hNMr5RrYxBEOLSqswsZFzjSoY/uuVOpDCQHm7qTeR/szX+NZQ9ZGauUz/AvyHO+fqg53GDnDEIBVeCQONF32zAEUrL9sE6MQA7xORJS7Q4XW6o9cytZ1dWmEls/QsS3ro+p69wuiiUHVjK4wOscQBw8XYkCqIMTGtBKavjTJhyxm2muUtfVL45XivRfwrCuEfJKGfPyYdpYb+/e3xVC0wBrP/RZCdtbjWK17urASSkvMKeXDfPJYObYaQ5IG9yRpBg=
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b0ffbc8-b4b5-4fe2-9ead-08d6f49cf66c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2019 10:00:30.3894 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oleksandr.suvorov@toradex.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR05MB6120
Cc: Igor Opaniuk <igor.opaniuk@toradex.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH v1 1/6] ASoC: sgtl5000: Fix definition of
	VAG Ramp Control
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

> ________________________________________
> From: Marcel Ziswiler
> Sent: Thursday, June 13, 2019 12:05
> To: festevam@gmail.com; Oleksandr Suvorov
> Cc: Igor Opaniuk; linux-kernel@vger.kernel.org; alsa-devel@alsa-project.org
> Subject: Re: [PATCH v1 1/6] ASoC: sgtl5000: Fix definition of VAG Ramp Control
> 
> On Tue, 2019-05-21 at 13:36 +0300, Oleksandr Suvorov wrote:
> > SGTL5000_SMALL_POP is a bit mask, not a value. Usage of
> > correct definition makes device probing code more clear.
> >
> > Signed-off-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
> 
> Reviewed-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> 
> > ---
> >
> >  sound/soc/codecs/sgtl5000.c | 2 +-
> >  sound/soc/codecs/sgtl5000.h | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git sound/soc/codecs/sgtl5000.c sound/soc/codecs/sgtl5000.c
> 
> I'm not sure how exactly you generated this patch set but usually git
> format-patch inserts an additional folder level called a/b which is
> what git am accepts by default e.g.

I just used patman to generate this set of patches. But my .gitconfig included diff option "noprefix".
Thanks for pointing me! Fixed. Should I resent regenerated patchset with the prefix?
 
> diff --git a/sound/soc/codecs/sgtl5000.c b/sound/soc/codecs/sgtl5000.c
> 
> > index a6a4748c97f9..5e49523ee0b6 100644
> > --- sound/soc/codecs/sgtl5000.c
> > +++ sound/soc/codecs/sgtl5000.c
> 
> Of course, the same a/b stuff applies here:
> 
> --- a/sound/soc/codecs/sgtl5000.c
> +++ b/sound/soc/codecs/sgtl5000.c
> 
> > @@ -1296,7 +1296,7 @@ static int sgtl5000_probe(struct
> > snd_soc_component *component)
> >
> >       /* enable small pop, introduce 400ms delay in turning off */
> >       snd_soc_component_update_bits(component,
> > SGTL5000_CHIP_REF_CTRL,
> > -                             SGTL5000_SMALL_POP, 1);
> > +                             SGTL5000_SMALL_POP,
> > SGTL5000_SMALL_POP);
> >
> >       /* disable short cut detector */
> >       snd_soc_component_write(component, SGTL5000_CHIP_SHORT_CTRL,
> > 0);
> > diff --git sound/soc/codecs/sgtl5000.h sound/soc/codecs/sgtl5000.h
> > index 18cae08bbd3a..a4bf4bca95bf 100644
> > --- sound/soc/codecs/sgtl5000.h
> > +++ sound/soc/codecs/sgtl5000.h
> > @@ -273,7 +273,7 @@
> >  #define SGTL5000_BIAS_CTRL_MASK                      0x000e
> >  #define SGTL5000_BIAS_CTRL_SHIFT             1
> >  #define SGTL5000_BIAS_CTRL_WIDTH             3
> > -#define SGTL5000_SMALL_POP                   1
> > +#define SGTL5000_SMALL_POP                   0x0001
> >
> >  /*
> >   * SGTL5000_CHIP_MIC_CTRL
> > --
> > 2.20.1
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
