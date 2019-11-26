Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B65A10A377
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Nov 2019 18:41:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1230C175E;
	Tue, 26 Nov 2019 18:40:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1230C175E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574790099;
	bh=ZL5OcjwyN3SmVrTKX1wpqGUt8LR2K46N9xtRUysX++4=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f7fiFSJ+8O/z3uw4DtGZk3JyvYYcA95434cbdNxUuEEa4AQ8MnyOkFBOKB5OjWtzj
	 OFlXI8uQozUnF7N2lMV5+b7hkL7iJz7jZDJpOwg7OYnkfOvjxXVIxWyIJQ7Gjm9qOA
	 qf5OiYiEjOkxf/eq44jQq+5j5VUJeE2Yx4dTmDc0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5561FF801F2;
	Tue, 26 Nov 2019 18:39:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7008FF80159; Tue, 26 Nov 2019 18:39:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8FA35F80109
 for <alsa-devel@alsa-project.org>; Tue, 26 Nov 2019 18:39:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FA35F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=dialogsemiconductor.onmicrosoft.com
 header.i=@dialogsemiconductor.onmicrosoft.com header.b="VhU5uCtV"
Received: from [46.226.52.104] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-4.bemta.az-a.eu-west-1.aws.symcld.net id 06/61-19913-3636DDD5;
 Tue, 26 Nov 2019 17:39:47 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA1WSfUxTZxTGee9tby+MmkvB9V2FxXVfkdlCYUs
 vidkYCGtMsM4s+5C4cYEL7VJKd1uUusRghwiCkcRB1jpADAXBsRFAUxCUdoTZGVflc1O7UOmW
 AZYJbCOg6db2Frf99f7OeZ73nJOTg6MCLybC6XIDzWgpjRiL4qiSMLmkoMB9MPne0jZy8rYDI
 Rs8Xozs+6GOS/41WY2QE4NfYmTN4Gku6V7cS/asdYN0XNGzasIUNncbUAxY3DxFb1cNprjqa8
 cU3/RPcRSrvc/u4x3gqrX5peV5XFX/xAWgs24pv+XfABXgylMnQRQOCCsKT/imuGwwxoG9v9g
 RNugD8NGpdSwYcIjrKJzx14ZsAqIBgX1LrQgbeAD03u/mnASROEaQ8Mz1WSzIccT7sPrnidB3
 lDCh8PcuKwgKsUQmPHu6CmVNu6GjzxT+kA3nP9sIFMID/V6Ej805wTSfoOCl0TGMbeZC4NUbA
 0hQiCRSoL2+kxdkQCTAP45dDNVECSG8420JeSBBwLYhF8ryVjg/5+eyfho6TT8CNr8T3pzxhl
 kMm5tGw5wAx1tqw5wDG+56sU3/pUVPOE/CttrjoZkh8QL0O4xsWgeXb2xwWX4ZVi43hzkeLth
 docVB4hYXblRX8OpBkuU/Y7O8E567soKx/Apsb11ELaFdxECn2cs5BzhdgMxn1MUqQwml1khk
 yckSmSxFIkt7NfC+JqWOSCgpXSY5TOsNEpmUOqyX6o0lBZpCqZY29ILAwRXqHHobePCnT+oAz
 +CIeCv/bZ77oGBLfmmhUUXpVR8xZRpa7wDxOC6GfCUV0GIYupguL1JrAme7KUM8WhzHz8wPyH
 y9jirRq4tZ6Xsgwevnm86jAo62VEuLhPyhYA0iaFKVaZ+U2Dz+cZAgiuWDiIgIQbSOZkrUhv/
 rC0CIA3Esnwy2ilZrDU86LQSGQAJDIOY7wSEM1L+SqAKpgtbIjuy89DH/xc5GG3f9nY9Hdnme
 p7tnanxkk20ux/Pt3eKoQzFVjXmi1K+e/hyfLH79UdaAUnpg6IvmpNt71oXbZi3NzFqcdWmPM
 pcZlrzbcvS5lJGXEkHW3oGzbz0YbWocvqb8ejbVL9/PpNk6Hz6sW5H/Wj0tsZui782aWu//5D
 zDFPWvFsVZE9WGyz3Lv03JNY5D06qj+ZVrOfaWDytK0vDtZZ+oXA1/79+R8caivOZx+0qGLH1
 83fddrqWmo+ODC9Y686DzzYlrWXZX7vbL8ca+yuMJI9mJpoHh3XPC1KXpYyd2fbq2o+29m8bM
 DLPrVLbTknZEaffmMnOzznoxR6+iZIkoo6f+AccICBR3BAAA
X-Env-Sender: Adam.Thomson.Opensource@diasemi.com
X-Msg-Ref: server-18.tower-268.messagelabs.com!1574789986!387033!1
X-Originating-IP: [104.47.6.55]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.22; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16955 invoked from network); 26 Nov 2019 17:39:47 -0000
Received: from mail-ve1eur02lp2055.outbound.protection.outlook.com (HELO
 EUR02-VE1-obe.outbound.protection.outlook.com) (104.47.6.55)
 by server-18.tower-268.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 26 Nov 2019 17:39:47 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T7fz9q0VUPaH2uAZERUfjXk63DkLsYbrLrpo6iYbvLNvqhozLEwIy3NXUhitH10st6G4YHVIlGmo1lnAXhE0jCm8Bz/h1p0PXTFoDugWj7MFO9zA/3yrwvqxq6EWS1qli2GuFnTts+uk+M3CpZnB4H7lqmUN82IXgv2n3B4sGNCb35/Oa7BNH1g9/4yO6+eJdeTzeV4kfVYRQ2jbZTG6zVhMjwyC+m8fe2hQa2xtXJ2nzwe9HTv8zefliU7mJaDdX18P8OAM0iqsHTnC8ezT9eIDgFm3y9qTBCWqTsNpf+/NEPN71uX76tbF5vGDkTppdTDj7xdRLqiOT3Pf9n/k7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w/a6EAN20ksNwuzLUdubZclv69WuwHzWBaITlwDxLgc=;
 b=XsAJG24QDJwq4ct37yT7Xsjyw9ulqvzUcmZIdSdcOanddU/F7NK/qss4Al8wgmAYhx+N1ibJnSWsl3RWgleI93JMl50DME61vmJdiBWzsihnnnD8T8XY7qg426QejCqLFt8tnOwpr7yi89d7mTUIWB1fo8qDUgzDxOAUCbfhcySl46KZYKjknw/LnBSlJHrQQcGGjbUDJKgA17c+/xNtAnihfqw+0p+nf4LMuy6dbQHwHw0al49E3XB0n+Np/c60Hw7t4brQgl/rNVd+aSNUjXBMj0nA+Treb0M1oV/b+YMfOHJyA4oQCTAQdtz0hjYVLZQD7Vw5I9tZJHweCqOkWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w/a6EAN20ksNwuzLUdubZclv69WuwHzWBaITlwDxLgc=;
 b=VhU5uCtVCO6HgoUdD2aeAbGtgML8frB1FPN5BbbHgvqW+8CAwvOALg9M9zn/yRWgnXpevchoOXFwlFVlnK+12x7iC33HDCbkZJCZo9ZgbR4BXqSJ/tKzUFRcf2IWsHH7ZkhTcmYIDhB6/McSCgJ9MGfYlUQ7t/jwMCZ0Lpd//O8=
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM (10.169.154.136) by
 AM5PR1001MB1153.EURPRD10.PROD.OUTLOOK.COM (10.169.155.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.19; Tue, 26 Nov 2019 17:39:46 +0000
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5525:87da:ca4:e8df]) by AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5525:87da:ca4:e8df%7]) with mapi id 15.20.2474.023; Tue, 26 Nov 2019
 17:39:46 +0000
From: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To: Mark Brown <broonie@kernel.org>, Adam Thomson
 <Adam.Thomson.Opensource@diasemi.com>
Thread-Topic: [PATCHv2 6/6] ASoC: da7213: Add default clock handling
Thread-Index: AQHVn7aXMyQuMXvm70+jyJLut64noaeWIihwgAeSgICAAAQ4gIAACJ3w
Date: Tue, 26 Nov 2019 17:39:45 +0000
Message-ID: <AM5PR1001MB09949D557742E8817545637F80450@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
References: <20191120152406.2744-1-sebastian.reichel@collabora.com>
 <20191120152406.2744-7-sebastian.reichel@collabora.com>
 <AM5PR1001MB0994720A0D615339A978E35C804E0@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <AM5PR1001MB0994E628439F021F97B872D480450@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20191126170841.GC4205@sirena.org.uk>
In-Reply-To: <20191126170841.GC4205@sirena.org.uk>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.228]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fec089db-98c8-4941-7ba3-08d77297a0e8
x-ms-traffictypediagnostic: AM5PR1001MB1153:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR1001MB11533E17911AA0BDB29282B5A7450@AM5PR1001MB1153.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0233768B38
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(366004)(39850400004)(396003)(136003)(376002)(189003)(199004)(81156014)(186003)(76176011)(7696005)(8676002)(9686003)(81166006)(6506007)(53546011)(26005)(446003)(55016002)(102836004)(14454004)(55236004)(305945005)(11346002)(8936002)(5660300002)(478600001)(25786009)(52536014)(4326008)(6246003)(86362001)(229853002)(3846002)(64756008)(66556008)(74316002)(6436002)(76116006)(6116002)(33656002)(54906003)(110136005)(316002)(66476007)(66446008)(99286004)(66066001)(66946007)(71200400001)(71190400001)(256004)(7736002)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR1001MB1153;
 H:AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7vQNWjiK7yy1vwcn2gd6HScABD5R14/0tjIOf3K3u8NCGsA2CFsk+NeK2utdQEdoQYBFdR7B2Vl5CT74uwuNXAdXYHkXTvhM7yIdTtLxnAjWfWRApeUUXEiR8Zv5pccXIAZ95KRSpqHNyNhzALUziItT7/ZdZ9HlAQLudw6bf62CSpvniWghtPT9GIkNG5OY+NLrz5QlP0mEka82Lcv2qQwDE2Sh5AOemSxm31oXrii+zyqco6VABGINCrFWD0G7HROVGbjNz5UfFssKLOqjQomCbcL5wF93DKiUc+acp97sHGwrhYVoh+nk/yy4J5C9uLgPNKQEQvLEnJ2NdTU8JKiSJvCO/oIujzFzphXb3x5EBTOAr013PPVNqqk//L60Ic5ozdIoyTRPvoSwjv80lB2UjPXMdtjHwxcFafSmWM3Co76sn7Qca0sPkTcoBvdF
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fec089db-98c8-4941-7ba3-08d77297a0e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2019 17:39:45.9614 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fP85i0pgIR8YX+f6ISZcNNgZ2jGj6ByW60gHHakc3vk0B3Fwz6lBO/RUC6/Co6Jdtd8w+3zy0jRIVQreFYAMgIrFVfQa8CfoKj28rpB+n64=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR1001MB1153
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "kernel@collabora.com" <kernel@collabora.com>,
 Support Opensource <Support.Opensource@diasemi.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [alsa-devel] [PATCHv2 6/6] ASoC: da7213: Add default clock
	handling
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

On 26 November 2019 17:09, Mark Brown wrote:

> On Tue, Nov 26, 2019 at 04:55:39PM +0000, Adam Thomson wrote:
> > On 21 November 2019 21:49, Adam Thomson wrote:
> > > On 20 November 2019 15:24, Sebastian Reichel wrote:
> 
> > > I've thought more about this and for the scenario where a machine driver
> > > controls the PLL through a DAPM widget associated with this codec (like some
> > > Intel boards do), then the PLL will be configured once here and then again
> > > when the relevant widget is called. I don't think that will matter but I will
> > > take a further look just in case this might cause some oddities.
> 
> > So I don't see any issues per say with the PLL function being called twice in
> > the example I mentioned. However it still feels a bit clunky; You either live
> > with it or you have something in the machine driver to call the codec's PLL
> > function early doors to prevent the bias_level() code of the codec controlling
> > the PLL automatically. Am wondering though if there would be some use in
> having
> > an indicator that simple-card is being used so we can avoid this? I guess we
> 
> If we're special casing simple-card we're doing it wrong - there's
> nothing stopping any other machine driver behaving in the same way.

Ok, what's being proposed here is for the codec to automatically control the PLL
rather than leaving it to the machine driver as is the case right now. In the
possible scenario where this is done using a card level widget to enable/disable
the PLL we will conflict with that using the current suggested approach for the
da7213 driver, albeit with no real consequence other than configuring the PLL
twice the first time a stream is started. It's a case of how to determine who's
in control of the PLL here; machine driver or codec?
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
