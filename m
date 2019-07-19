Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5516E175
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jul 2019 09:10:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 316161698;
	Fri, 19 Jul 2019 09:10:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 316161698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563520258;
	bh=vFuGQ7fIrJC1bvodW293U9UOoqxo1V4gmImEXstiUyc=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=skq2wPkx0Jxi/reIzpHIyV4ngYuS9i+WsKncNM1aoLnk12fd5hvMFu+g4EFkyflu+
	 mDUgwhRDnyVjuFFcJZnWcn/nGOVhnWLrlAt2GvpY8QrHBH3y3YtH/Ei3wCIZWZ9Ekv
	 wjxBmizczF9gQYXC8l0nfDM1ZsHKkSgmEkdjG/+k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A915F80272;
	Fri, 19 Jul 2019 09:09:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD7D2F80228; Fri, 19 Jul 2019 09:09:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150124.outbound.protection.outlook.com [40.107.15.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D75E6F800C4
 for <alsa-devel@alsa-project.org>; Fri, 19 Jul 2019 09:09:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D75E6F800C4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=toradex.com header.i=@toradex.com
 header.b="Q2Lzk71T"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rjre/OBF18nIXHUgge/gkokJPJ7zYr7aKPrQ3XmfhIJBsKTRqzozUQz4FeWB+X+IkDivIxwL7dCge4Br2kHNmhx6AAmaH6GBNr+ID2uq17oA/EE029ZbAKHCGBq05xHSaxKv2iBhFb78WnvxYqIes8/UZajOLfFRMzssogDLJYmVv7iUFYS7AoWAubUkyR33lU8hh/zcPfDs+CeLUlkApm0WrPGdN1WBjNpzRYgnVyZfcaDjJkyB+RYEHMlhpaicarTJ0Y7rZ/NNwBFef9kbLJ4ZPoBwVwhgfSMdcBlifS+08nb8h1xKZI2u4DIu01SAOmaz67uWYnQj2GZzoyRmMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X1guX6cjXsAxBOVvZlpwtEU7aGBqJzBE0QewJhfogPo=;
 b=eFNTXqIxhVJ7GCvMyGX3ip6VzBXCwr4v1ngOXaH1BrkWymzB6rvBt2BaHuJHFLx2YyPDD99pdjY88ywqeR2rJajI4RTFWWhXhQb3Z6a/W4Jv088ShH9g8KZWJi/3nmQlri+MP9mb1Z+zZJztP2jqOZaGBQ8eYxkQzIiJsmEJPCXL2jLmXCVD7J4CsLoO/01fZQXOLR5gGS7MCnMA/PxoUHMoluqRmVN0yWg8A3S4/sF490rrLlsHgTRxOwTQHTf00aEi6tPsyPvOz1vQuU0ubW6FRkqFVGxH5nihGIFS3553eoNoxMflN28FZ2llUwuzJhUDrmuZw2Y1++afnAaAuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=toradex.com;dmarc=pass action=none
 header.from=toradex.com;dkim=pass header.d=toradex.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X1guX6cjXsAxBOVvZlpwtEU7aGBqJzBE0QewJhfogPo=;
 b=Q2Lzk71Tfo0rpgdl1DLa/vEkhWtGtPzMan7E+MxsBZPTEW7mkGeKhStsQu7jT9H3VL3Rj10M6jjNIOgODYzmqBHQn4ymHOHqiee4j69B+ZNxf3qYsQ65GB+liPKKoLYW/9/XihI7FIXvhGrN5+CT8qHbrofQgK5ckqkaYT68PPg=
Received: from AM6PR05MB6535.eurprd05.prod.outlook.com (20.179.18.16) by
 AM6PR05MB4808.eurprd05.prod.outlook.com (20.177.34.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.14; Fri, 19 Jul 2019 07:09:05 +0000
Received: from AM6PR05MB6535.eurprd05.prod.outlook.com
 ([fe80::c860:b386:22a:8ec9]) by AM6PR05MB6535.eurprd05.prod.outlook.com
 ([fe80::c860:b386:22a:8ec9%6]) with mapi id 15.20.2094.011; Fri, 19 Jul 2019
 07:09:05 +0000
From: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Thread-Topic: [PATCH v5 2/6] ASoC: sgtl5000: Improve VAG power and mute control
Thread-Index: AQHVPUeRRPlk8qJu2UinCpynQ1zx8KbQtnQAgAAB14CAAM1VAA==
Date: Fri, 19 Jul 2019 07:09:05 +0000
Message-ID: <CAGgjyvGboMPx5wKJ_1DaeYZazSHmQUGwDZHoCBt5vhpVq3Q_bA@mail.gmail.com>
References: <20190718090240.18432-1-oleksandr.suvorov@toradex.com>
 <20190718090240.18432-3-oleksandr.suvorov@toradex.com>
 <9c9ee47c-48bd-7109-9870-8f73be1f1cfa@intel.com>
 <a86e4d6b-ed2c-d2f2-2974-6f00dc6ef68a@intel.com>
In-Reply-To: <a86e4d6b-ed2c-d2f2-2974-6f00dc6ef68a@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR0102CA0017.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:14::30) To AM6PR05MB6535.eurprd05.prod.outlook.com
 (2603:10a6:20b:71::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=oleksandr.suvorov@toradex.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-gm-message-state: APjAAAXSJ1kPs0zIqYzS2F3oitkizRFy2bjqZyNv2tjg1M1c79X5NU9x
 4yLDOHqpnC3cdA8VGQ6g/o7xzy5txYNCHNJYvYE=
x-google-smtp-source: APXvYqwxlu70UaBmtIYl4bgUxABiaCwYArCOh/rud9gqTcTyk0lW2rm2jf4Sc8cMpvXrgsjOAdJGpveQPBdb1l/HjWw=
x-received: by 2002:a17:906:1e04:: with SMTP id
 g4mr39852082ejj.48.1563519831549; Fri, 19 Jul 2019 00:03:51 -0700 (PDT)
x-gmail-original-message-id: <CAGgjyvGboMPx5wKJ_1DaeYZazSHmQUGwDZHoCBt5vhpVq3Q_bA@mail.gmail.com>
x-originating-ip: [209.85.208.42]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5646c8ab-b446-4164-b6b3-08d70c17fc10
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM6PR05MB4808; 
x-ms-traffictypediagnostic: AM6PR05MB4808:
x-microsoft-antispam-prvs: <AM6PR05MB4808E41F5B3C5804D02946C0F9CB0@AM6PR05MB4808.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(346002)(376002)(366004)(396003)(39850400004)(199004)(189003)(61266001)(5660300002)(446003)(11346002)(66066001)(478600001)(476003)(305945005)(7736002)(54906003)(99286004)(86362001)(68736007)(95326003)(81166006)(81156014)(8936002)(8676002)(316002)(25786009)(102836004)(53546011)(6506007)(386003)(76176011)(26005)(186003)(55446002)(229853002)(6436002)(498394004)(6486002)(486006)(61726006)(6116002)(3846002)(44832011)(6512007)(52116002)(256004)(53936002)(6246003)(9686003)(6862004)(2906002)(14454004)(4326008)(66476007)(64756008)(66556008)(71190400001)(66946007)(71200400001)(107886003)(66446008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR05MB4808;
 H:AM6PR05MB6535.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: toradex.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 7n7/uwG5Z4wcBvFwK2bQNc/L7iQ3fwt0GpwuZYJYljdERhJzqnbeiuhL1Noz6j/O0lJBKP5uGTMBc7DOt9G5jTaMF0T1701OS+sklGmMt25gx8Y6bbMRI9VYRAODKeL+5P+5by+UTQwfITW11LYO6HgmwaTwCoh9yTSwxkghzmZ2KcWgawUXB4C+vIV9AnUxCQv8iGWC1mVDiq+ciHRwGeDqitSkGF9riQuCsJA4TCVv8febeeDT8v3kJNNYd/YRpojY91l4mp57gCUi8jJadY10V+f4QXgA2l6+aInIPIK+znUpUr/3AevJFTTw/W3c2E07EEhY+xK22unwwAvLydQKBYF5erQphP/4Vg0hx7Ch+8WnJafPLg/HitC3+ECmbDYBNaOdWHNj/hPLhFkAQ2+I6GxCPNWFVquRvNB/xCg=
Content-ID: <D2C95FF970471A43BB53DA5374C0C35A@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5646c8ab-b446-4164-b6b3-08d70c17fc10
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 07:09:05.0338 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oleksandr.suvorov@toradex.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR05MB4808
Cc: Sasha Levin <sashal@kernel.org>, Igor Opaniuk <igor.opaniuk@toradex.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>, Takashi Iwai <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
 Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>
Subject: Re: [alsa-devel] [PATCH v5 2/6] ASoC: sgtl5000: Improve VAG power
	and mute control
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

On Thu, 18 Jul 2019 at 21:49, Cezary Rojewski <cezary.rojewski@intel.com> wrote:
>
> On 2019-07-18 20:42, Cezary Rojewski wrote:
> > On 2019-07-18 11:02, Oleksandr Suvorov wrote:
> >> +enum {
> >> +    HP_POWER_EVENT,
> >> +    DAC_POWER_EVENT,
> >> +    ADC_POWER_EVENT,
> >> +    LAST_POWER_EVENT
> >> +};
> >> +
> >> +static u16 mute_mask[] = {
> >> +    SGTL5000_HP_MUTE,
> >> +    SGTL5000_OUTPUTS_MUTE,
> >> +    SGTL5000_OUTPUTS_MUTE
> >> +};
> >
> > If mute_mask[] is only used within common handler, you may consider
> > declaring const array within said handler instead (did not check that
> > myself).
> > Otherwise, simple comment for the second _OUTPUTS_MUTE should suffice -
> > its not self explanatory why you doubled that mask.

Ok, I'll add a comment to explain doubled mask.

> >
> >> +
> >>   /* sgtl5000 private structure in codec */
> >>   struct sgtl5000_priv {
> >>       int sysclk;    /* sysclk rate */
> >> @@ -137,8 +157,109 @@ struct sgtl5000_priv {
> >>       u8 micbias_voltage;
> >>       u8 lrclk_strength;
> >>       u8 sclk_strength;
> >> +    u16 mute_state[LAST_POWER_EVENT];
> >>   };
> >
> > When I spoke of LAST enum constant, I did not really had this specific
> > usage in mind.
> >
> >  From design perspective, _LAST_ does not exist and should never be
> > referred to as "the next option" i.e.: new enum constant.

By its nature, LAST_POWER_EVENT is actually a size of the array, but I
couldn't come up with a better name.

> > That is way preferred usage is:
> > u16 mute_state[ADC_POWER_EVENT+1;
> > -or-
> > u16 mute_state[LAST_POWER_EVENT+1];
> >
> > Maybe I'm just being radical here :)

Maybe :)  I don't like first variant (ADC_POWER_EVENT+1): somewhen in
future, someone can add a new event to this enum and we've got a
possible situation with "out of array indexing".

> >
> > Czarek
>
> Forgive me for double posting. Comment above is targeted towards:
>
>  >> +enum {
>  >> +    HP_POWER_EVENT,
>  >> +    DAC_POWER_EVENT,
>  >> +    ADC_POWER_EVENT,
>  >> +    LAST_POWER_EVENT
>  >> +};
>
> as LAST_POWER_EVENT is not assigned explicitly to ADC_POWER_EVENT and
> thus generates implicit "new option" of value 3.

So will you be happy with the following variant?
...
    ADC_POWER_EVENT,
    LAST_POWER_EVENT =  ADC_POWER_EVENT,
...
   u16 mute_state[LAST_POWER_EVENT+1];
...

-- 
Best regards
Oleksandr Suvorov

Toradex AG
Altsagenstrasse 5 | 6048 Horw/Luzern | Switzerland | T: +41 41 500
4800 (main line)
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
