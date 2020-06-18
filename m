Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D20D1FFDBE
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jun 2020 00:09:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1AC411678;
	Fri, 19 Jun 2020 00:08:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1AC411678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592518185;
	bh=yB9Xqfs2NtUIoPHYzirr0HAU3GJ34qechRWtbsffhvk=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ko+UeGBIc5bvFVeOgIk15dc6jSzUTs/fjQW3PX3wCeSvG874KtgKJzryhj61DH+tx
	 ap91/4VgkXoQRsxkML6sJT+5ohjdkPXU7rS1NF7It02K2RELZ9AU16IhH+ZQ3RPhF+
	 V+Yrj4WN4SmCEWy7e0xsQUwIhVpBQEPtG8yDOgHU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40B3FF800D1;
	Fri, 19 Jun 2020 00:08:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E9DAF80171; Fri, 19 Jun 2020 00:08:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2108.outbound.protection.outlook.com [40.107.243.108])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43EBFF800D1
 for <alsa-devel@alsa-project.org>; Fri, 19 Jun 2020 00:07:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43EBFF800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=maximintegrated.onmicrosoft.com
 header.i=@maximintegrated.onmicrosoft.com header.b="WwFkR3Ck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bKNcyRFc81yIG1x1kt6mQ0UkcifH/6BceKTI56JHTwCoJhxBRVosDmxwxBeL7TN/dq36PpP3jrCrettb8hz1Cdkn7dv2kpVuMJDSk3xKQGpeewWlDzidaHhy2IhejjGZoZyjFIBYkGMSBlyK/xdw1g/6iA/oDv9FztTNNeTUnG8rjBZNrat18pDvs6dbzzZqpMKooHUNcrRAlnhOjA0MyaCwSKLz/NdbmoZYlK3Ryqb5vcO/kPs2vTha0P37CyODHRg8qA7Hv2y5QAHLg95g9+dce2mZ/2Ci2tuXVSbLYrjMaUQ1yrgpHnxi8EgbkqOR0fSuGaV5jWSArJa9tyDmew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YkbxZseRvQ7k/GpPXfsJRa6+mmxAbMaM78B0bZExxKk=;
 b=cilm7rFNva6zK+SxPVob7JI+Fup4zxDumBFA/keJkSGao7grhEp2bc3+PjWafE+gjdA/NhRFkWMl4PERrYRYwusqsUFNjm6XHy7UYp0Wpxmmm9CaYnomodzh3DjEiJmvsbNkmDgXLinQQGXAVNBs6ek73GYjRQNSQ0nzQaz00X41eir8oe/VeZG8dmu2xlO0sLwlRORUSJLzpTxU/47KJ6gv1mp0x7FSq1N6PwjxGeNYcr+jxGdk88O+7G82pauXoQGbmOH3WWJABSwEZpDRA/siVza/rtCw8kQ+iywQZEALl1up9Kd+ZGcuaMldsWdYyArPW18bQI3bDiKlsim0Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=maximintegrated.com; dmarc=pass action=none
 header.from=maximintegrated.com; dkim=pass header.d=maximintegrated.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=maximintegrated.onmicrosoft.com;
 s=selector2-maximintegrated-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YkbxZseRvQ7k/GpPXfsJRa6+mmxAbMaM78B0bZExxKk=;
 b=WwFkR3CkqWCkV0baATGodhFoXicmSSySqf41VpKCbKl/wRSkT+owJTR9dg04/9uzScdpeTEMS4KjsS4Tmjdn1YzsoqgyYtkGaddThXTR8sjcmcBs9gSZjVGV+3VLis/0Nlk2VedGVcRzQDgO23kSVMuKWNmkDDV2psk7cuzJOBs=
Received: from BL0PR11MB3380.namprd11.prod.outlook.com (2603:10b6:208:69::12)
 by MN2PR11MB4208.namprd11.prod.outlook.com (2603:10b6:208:17a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.25; Thu, 18 Jun
 2020 22:07:47 +0000
Received: from BL0PR11MB3380.namprd11.prod.outlook.com
 ([fe80::71fd:6797:4389:da64]) by BL0PR11MB3380.namprd11.prod.outlook.com
 ([fe80::71fd:6797:4389:da64%2]) with mapi id 15.20.3109.021; Thu, 18 Jun 2020
 22:07:47 +0000
From: Ryan Lee <RyanS.Lee@maximintegrated.com>
To: Mark Brown <broonie@kernel.org>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>
Subject: RE: [PATCH] ASoC: codecs: Added MAX98373 Soundwire Driver
Thread-Topic: [PATCH] ASoC: codecs: Added MAX98373 Soundwire Driver
Thread-Index: AQHWRMSoFuqFjiJa20Kl2OKNSeuh2qjeODUAgAAaF4CAAClzAIAAdILA
Date: Thu, 18 Jun 2020 22:07:47 +0000
Message-ID: <BL0PR11MB338028B7DB856993FF570D88E79B0@BL0PR11MB3380.namprd11.prod.outlook.com>
References: <20200617163015.16809-1-pierre-louis.bossart@linux.intel.com>
 <20200618110902.GE5789@sirena.org.uk>
 <d3bb399f-3af9-666d-054d-e4a1dda1dfb4@linux.intel.com>
 <20200618151046.GK5789@sirena.org.uk>
In-Reply-To: <20200618151046.GK5789@sirena.org.uk>
Accept-Language: en-US, ko-KR
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none
 header.from=maximintegrated.com;
x-originating-ip: [73.189.52.211]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5cdc09d8-0079-472d-a053-08d813d408ed
x-ms-traffictypediagnostic: MN2PR11MB4208:
x-microsoft-antispam-prvs: <MN2PR11MB420866272587E994ED3A587DE79B0@MN2PR11MB4208.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0438F90F17
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XSwj3+vH3h6UvSDTLWRr+C63hRFHWK47tp6h/4UM3o033fbNLe2o7VDIRHebZrmmMjaCvUfrMjZMBRdZcETURi80G547BV/1V3vsOiixNyoD3SwTRsr7FNQIKMpoah5MO2pg/lU7ShmG0NnZ9wP8fIMtHuPwb4R2VS0+8u9hy9WhWg7KDfH5GY62hixbAtIuCFkoBKeB5+4v5fCNADhJgPLbxj5apKk6h9LrTT+kSn17L4hqm3xPZkAmyKYm6WxcjUcs36q8F0AggFuzCgqc2lBjrrsI4hcGuoQyZgBc8qUedGip6ZXCOTB5N3ZFxS6ZAf9x5RRBwzblwDsMxy7Szg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB3380.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(396003)(376002)(366004)(346002)(136003)(186003)(6506007)(8936002)(2906002)(71200400001)(52536014)(26005)(8676002)(478600001)(83380400001)(5660300002)(7416002)(9686003)(54906003)(33656002)(55016002)(110136005)(86362001)(64756008)(66446008)(66476007)(66946007)(7696005)(76116006)(316002)(4326008)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: PdKovLJMZM0VOKzL9m+9xk1oBQ7i+NS+I3YpVK5K6AE8M6cAgDHZon0p9Sa+TE7h2QoJzOS42kT34m2ZSmDDQc7rJ09zZUifPDLV373k1uac6nw+7U5runHKP63MWrKc0Gk7g9JH6WIohdGIp1zHvCh02bZZS8gJklDRUogF+WDSDqu+cZW/eRlRxC2Tzp2nrKt5HOZ9S9Zemx3HxxzdOjbag2eruvXuzsJgVqh+EkY88ZgG07Y/Nu0c5JRgnVhb5LXcImcD3F9EvyoFyprQvtVxQkwU1BFOcNHQRAOqsrOQ/+TXkUo2IwufhzA4vuEp6airk7v9W87bDU/hOW/X2YQPBgG1DiyAeSEIvbd1HXqtQ6zq/+5fMYBqHAOP0JPWCMlLfWEWePkOErzqOsGL4PZvHSfWT8v96LxGSA8Zu6LiHRsGG47W7r3TKQeJwvYaFw+nKl2JZc+5mWXdoG8KoddVmaiNoVHDP4MaKXYWGxk=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: maximintegrated.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cdc09d8-0079-472d-a053-08d813d408ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2020 22:07:47.5141 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd909df-ea69-4788-a554-f24b7854ad03
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lLbtLZEIV7HTicbzPQSsE1Yb7y5a0OHOoX9CPJFUWTcM2cqRbvg+g5L7Gp79vs93gs8Gpt0MvCJqonyDq4tgtENNAcHXoXTfwkSCm+L9saA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4208
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tiwai@suse.de" <tiwai@suse.de>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "vkoul@kernel.org" <vkoul@kernel.org>, Naveen Manohar <naveen.m@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

>-----Original Message-----
>From: Mark Brown <broonie@kernel.org>
>Sent: Thursday, June 18, 2020 8:11 AM
>To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>; alsa-
>devel@alsa-project.org; Ryan Lee <RyanS.Lee@maximintegrated.com>;
>tiwai@suse.de; gregkh@linuxfoundation.org; vkoul@kernel.org; Naveen
>Manohar <naveen.m@intel.com>; Bard liao <yung-
>chuan.liao@linux.intel.com>; Rander Wang <rander.wang@linux.intel.com>
>Subject: Re: [PATCH] ASoC: codecs: Added MAX98373 Soundwire Driver
>
>On Thu, Jun 18, 2020 at 07:42:25AM -0500, Pierre-Louis Bossart wrote:
>
>> > The DT bindings need updating to add SoundWire support.
>
>> Interesting. The properties are the same in I2C and SoundWire mode, so
>> would we need a completely different file that just specifies the
>> SoundWire DeviceID, e.g.
>
>> properties:
>>   compatible:
>>     const: sdw10217201000
>
>> What's the process for such dual-mode devices?
>
>I'd hope it could be added to the existing bindings document like for othe=
r
>dual bus devices.
>
>> > > +	regmap_write(max98373->regmap,
>> > > +		     MAX98373_R203D_AMP_DIG_VOL_CTRL,
>> > > +		     0x00);
>> > > +	regmap_write(max98373->regmap,
>> > > +		     MAX98373_R203E_AMP_PATH_GAIN,
>> > > +		     0x00);
>
>> > I'd expect these to be chip defaults, especially the volumes.
>
>> The same sequence is already used in the I2C probe. if this needs to
>> change, it's got to be applied for both cases.
>
>Yes, it should.

Agreed. Shall remove volume configuration.

>
>> We should probably cut the common parts out, as done for rt5682. Ryan,
>> can you look into this.
>
>Indeed.

OK. Shall re-use common parts and remove duplication.
