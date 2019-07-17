Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8B36BFB6
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jul 2019 18:37:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2258616A5;
	Wed, 17 Jul 2019 18:36:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2258616A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563381443;
	bh=iwTQGWs5sSW5YsbNT6sBwfKY/4speFFdSh7J7c1HVPU=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eR8Mds0y+S28VZpUfSRgqY74qYy8J8WEnXfijmPT/xYNT/4Ogxtgc7cR2uaiEjaBD
	 2HEzvWGFIyIALRFC1qc3lzTZ1UOToEGv1ULd3Q6jTPPbhe6Krdok3/LblFzyihRtJs
	 5PjsPqXS/eMzj2eD7kDY11pDoJqeW+lAYGG7vGu8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CDDBF80368;
	Wed, 17 Jul 2019 18:34:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE669F800C2; Wed, 17 Jul 2019 18:34:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80130.outbound.protection.outlook.com [40.107.8.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3BE3EF800C2
 for <alsa-devel@alsa-project.org>; Wed, 17 Jul 2019 18:34:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BE3EF800C2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=toradex.com header.i=@toradex.com
 header.b="CLr9FFrm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TY8eI7G9088GTqNwTC3zsYzOey1AtNrFLl4dJ8hThLU5jcbd6Ig+5DrqG8ytcT7aJUBU4HLwDidOzI2aU6NYkbWEh9siLq4CJPfLxQUqUFNoSvt56mjqi7s/WR0COC2omeA7yJHEuYcyKnnqP4SkrA/lwUB7I/ptqESvWmaRWwGg8j+nXf3oA5TgStZKEk5zbFuvhZ48Tg1/4YaP/eQI2q0AXEy+p4hZfiGJtEzwG0MJhVPVLumgo0ItOQUjGMWKbbeb7MoPJ+iqr8pvgNYdypl3Gh5KkvC2UfOCU/Olhg2dcjQDTb4pktkV4qCQfK5iB3JdEiGbSb6xVigJxQ4Yqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1HPaioCU5g0v0CP21C4IyFRIIZC3dnl0YpvRLHxllok=;
 b=OAfxn1dcPqQDcH5YWZnefaupM54xsQsa21TXcoqdUG1mxNt41pdSf4BiHRIAX4dl+pi8GV/4NI92EwanovZ10TK8y74ULCQa4I4VtUwhAusxzYqkjXlbISe+khQHHczv7I3VtUEkdfuiV7H7AZccXDyQHHzT4JSQptTBKOdele1fKrDJijtmqwXWEzb25CIdP3lD3QNw8L5RIh4MDWlWoVz9lnqrYFZ13jGlVt7evQbxXAH61Clf9YRkDRWu6tPnBsbgDbS8gxMf1WC4ZE0JmK26vOxpGTclwp+hopYAZwIBQzEwsAEXO2JmRxO9p4aIid9MCzpZyIbnH2SLj5nl2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=toradex.com;dmarc=pass action=none
 header.from=toradex.com;dkim=pass header.d=toradex.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1HPaioCU5g0v0CP21C4IyFRIIZC3dnl0YpvRLHxllok=;
 b=CLr9FFrmn3DHPJY1+ifLPTh+A1L+hZB0o2ltM7Vz/LJnSWAXMyR0C8YIaWz9I5mV/vwg2tJDdp3oNYiSW/NkHUvx8SfRWFbzoSE2GbqlQyUFU4keedci+Q41ZCIz8r8tK4Ai1/CrUUqHXFBBfQWjDAgDwRszpmrysmuxX9yIZsI=
Received: from AM6PR05MB6535.eurprd05.prod.outlook.com (20.179.18.16) by
 AM6PR05MB5523.eurprd05.prod.outlook.com (20.177.189.80) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Wed, 17 Jul 2019 16:34:09 +0000
Received: from AM6PR05MB6535.eurprd05.prod.outlook.com
 ([fe80::c860:b386:22a:8ec9]) by AM6PR05MB6535.eurprd05.prod.outlook.com
 ([fe80::c860:b386:22a:8ec9%6]) with mapi id 15.20.2094.011; Wed, 17 Jul 2019
 16:34:09 +0000
From: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
To: Fabio Estevam <festevam@gmail.com>
Thread-Topic: [PATCH v3 0/6] VAG power control improvement for sgtl5000 codec
Thread-Index: AQHVOMHqURHnTs/AN0OjdnZhj0q7OabMD26AgAL5beU=
Date: Wed, 17 Jul 2019 16:34:09 +0000
Message-ID: <AM6PR05MB6535DC29316E859AFF3699C4F9C90@AM6PR05MB6535.eurprd05.prod.outlook.com>
References: <20190712145550.27500-1-oleksandr.suvorov@toradex.com>,
 <CAOMZO5B00XRb5GqtYhyg==sVek_uWhLRDQeSStN1AzfKRnV+Dw@mail.gmail.com>
In-Reply-To: <CAOMZO5B00XRb5GqtYhyg==sVek_uWhLRDQeSStN1AzfKRnV+Dw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=oleksandr.suvorov@toradex.com; 
x-originating-ip: [194.105.145.90]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7c52cd09-7591-4386-ef6f-08d70ad497f1
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM6PR05MB5523; 
x-ms-traffictypediagnostic: AM6PR05MB5523:
x-microsoft-antispam-prvs: <AM6PR05MB55230011A52CFB471B52440AF9C90@AM6PR05MB5523.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2512;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39850400004)(366004)(396003)(346002)(136003)(376002)(189003)(199004)(102836004)(14454004)(33656002)(25786009)(81156014)(229853002)(4326008)(68736007)(5660300002)(486006)(478600001)(81166006)(2906002)(71190400001)(44832011)(99286004)(74316002)(26005)(6916009)(8936002)(66066001)(3846002)(6116002)(6246003)(316002)(53936002)(7696005)(7736002)(55016002)(76176011)(54906003)(1411001)(9686003)(66476007)(64756008)(186003)(305945005)(66446008)(8676002)(66556008)(6506007)(53546011)(6436002)(71200400001)(476003)(66946007)(76116006)(52536014)(11346002)(256004)(446003)(86362001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR05MB5523;
 H:AM6PR05MB6535.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: toradex.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: wfM5fp119eBGe3TqRRGuAvYwz8rBh7Qd+9DcbzdbFlIqNx/OFoETEjnqfyo66PT48EZxVKsymkgUAgHzRvDVQtoOiojLHq497IEXHs9mUR+hUbaL2konEXTH5WA/jY0mPFtJ4tkZ2xw9dDEvE262L4KbgHT7n9AoUohm9uy+qYn2kbsWI0W8qvlZ83w/gdo29ySbrVllWgOfSBb1FEFtpdGjj/7FnpBI2KLTTR7bBhz5RYT7bTDwh932kS0gFGA4fIjQ3uw4xYZ0jWe57nHXIcK3Y5yaEfcKMD0z3HGudLNVsRNQFUD5cEl3RIjKakAwyAzniI9Z+JsKZVEfJlmk0AOWoBScpp7PbUpRorVoUaCZaWPVoqO6/nV/CNDlHvoK8LesThGc7GMtMlmbVnbKLQO7LwRJwigfRHaYOskyRhs=
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c52cd09-7591-4386-ef6f-08d70ad497f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 16:34:09.3814 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oleksandr.suvorov@toradex.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR05MB5523
Cc: Igor Opaniuk <igor.opaniuk@toradex.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>, Takashi Iwai <tiwai@suse.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH v3 0/6] VAG power control improvement for
	sgtl5000 codec
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


Hello Fabio,

Thank you for your feedback! I've prepared and sent a fixed patchset v4.

--
R&D Engineer
Oleksandr Suvorov

Toradex AG

________________________________________
From: Fabio Estevam <festevam@gmail.com>
Sent: Monday, July 15, 2019 10:06:57 PM
To: Oleksandr Suvorov
Cc: linux-kernel@vger.kernel.org; alsa-devel@alsa-project.org; Marcel Ziswiler; Igor Opaniuk; Jaroslav Kysela; Mark Brown; Takashi Iwai; Liam Girdwood
Subject: Re: [PATCH v3 0/6] VAG power control improvement for sgtl5000 codec

Hi Oleksandr,

Your series looks good, thanks.

I only have one suggestion.

On Fri, Jul 12, 2019 at 11:56 AM Oleksandr Suvorov
<oleksandr.suvorov@toradex.com> wrote:
>
>
> VAG power control is improved to fit the manual [1]. This patchset fixes as
> minimum one bug: if customer muxes Headphone to Line-In right after boot,
> the VAG power remains off that leads to poor sound quality from line-in.
>
> I.e. after boot:
> - Connect sound source to Line-In jack;
> - Connect headphone to HP jack;
> - Run following commands:
> $ amixer set 'Headphone' 80%
> $ amixer set 'Headphone Mux' LINE_IN

Could you please make the bug fix patch to appear as the first one in
the series with a Fixes tag and Cc stable?

This way the bug fix can be applied to the linux stable tree.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
