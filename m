Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9617510B551
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Nov 2019 19:11:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2680E16F5;
	Wed, 27 Nov 2019 19:11:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2680E16F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574878318;
	bh=txYs2ZMcaABh31LTZURZPnOqS0LlJBdP1kBbQzKPtxs=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H//FIYfsgwxKF8+tpdlXKzTZIKl5EONO6ktjNGqMJCDexFkotiiuVoKvw/0TCYKQY
	 YMsEY5Cci++oUw3tdaRhCqx+JdOyUwr1zSZcuNGBj1cuHE9iedJD8/ktoti48PAj6v
	 XH1qgIsOKdzxioFvRt2NB39BeStcbb4xTL494aLk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89054F8013B;
	Wed, 27 Nov 2019 19:10:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D880CF8014D; Wed, 27 Nov 2019 19:10:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09D19F800CE
 for <alsa-devel@alsa-project.org>; Wed, 27 Nov 2019 19:10:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09D19F800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=dialogsemiconductor.onmicrosoft.com
 header.i=@dialogsemiconductor.onmicrosoft.com header.b="B2cF+7m7"
Received: from [46.226.52.104] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-7.bemta.az-a.eu-west-1.aws.symcld.net id 78/A3-22091-EFBBEDD5;
 Wed, 27 Nov 2019 18:10:06 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMJsWRWlGSWpSXmKPExsWSoc9mpvt3971
 Yg+9LbSyuXDzEZDH14RM2i83nelgtvl3pYLK4vGsOm0Xnrn5Wi7uv/Sw2fF/L6MDhseFzE5vH
 jrtLGD12zrrL7rFpVSebx763y9g81m+5yuLxeZNcAHsUa2ZeUn5FAmvG5EeHmApaeCuWHzrF3
 MB4jKuLkYuDUWAps8SaC0dYIJxjLBKXjtxnhXA2M0r87v3JBuKwCJxglri0/idYRkhgGpPE4Z
 1/2CCch4wSx5d/Yexi5ORgE7CQmHziARuILSIQIdFx7zJYEbNAE7PE+1VLwYqEBZwlZve3MUM
 UuUgc2twEVMQBZNdL7N5fARJmEVCVOLZnPwuIzSuQKNF44ww7xLJLrBIvD68Gm8MpYCTx/OQ1
 dhCbUUBW4kvjarCZzALiEreezGcCsSUEBCSW7DnPDGGLSrx8/I8Voj5V4mTTDUaIuI7E2etPo
 GwliXlzj0DZshKX5ndD2b4Scx5dZgS5E6R+5i8hiLCFxJLuVhaIsIrEv0OVEOECiesz/0FdoC
 Zx400H1AUyEu1fO5lBXpEQmM0q8br1OMsERv1ZSK6GsHUkFuz+xAZha0ssW/iaeRY4KAQlTs5
 8wrKAkWUVo0VSUWZ6RkluYmaOrqGBga6hoZGuoaUxEFvoJVbpJuqlluqWpxaX6BrqJZYX6xVX
 5ibnpOjlpZZsYgSmt5SCg8d2MB75+lbvEKMkB5OSKK+f171YIb6k/JTKjMTijPii0pzU4kOMM
 hwcShK813YB5QSLUtNTK9Iyc4CpFiYtwcGjJMJ7CSTNW1yQmFucmQ6ROsWoyzHh5dxFzEIsef
 l5qVLivM0gRQIgRRmleXAjYGn/EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3gsgU3gy80r
 gNr0COoIJ6Ih9fWBHlCQipKQamG6Ivbw4b2Uf39UY5XdvVte0NWg23To7QXr1oampVYvLXt9m
 P7f4l97+6jtX/hl+8dF/zOCxP+T2jTXZC2LKLI3eVi1nM9JmPHv+xr9LC35O35EuJrt9z/Uor
 a1ZZxzPzFxudPXUJqFp/w+qqHLdj/8Qvv5r3cLyn65cr6xfFCUXWwTV3uLIY4pN/7ut/ltg4q
 9KS+OJS5oLc456S27kOZe8aavN0rxnhc/lFglZxpo5HNv2Y1qQzFvpn+Z5XB1PNoQqXfi5qMR
 Wu8H8xp27kpLfA4y/SW3807xjil5QqVfrifglL6PLRQryv4oKBLHHLz6R8kCPv+2Jy3+35tC/
 JZNiMu+Z9DTO/mD0Ud5lz38lluKMREMt5qLiRACZpScXdgQAAA==
X-Env-Sender: Adam.Thomson.Opensource@diasemi.com
X-Msg-Ref: server-3.tower-268.messagelabs.com!1574878204!470562!1
X-Originating-IP: [104.47.6.54]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.22; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27357 invoked from network); 27 Nov 2019 18:10:05 -0000
Received: from mail-ve1eur02lp2054.outbound.protection.outlook.com (HELO
 EUR02-VE1-obe.outbound.protection.outlook.com) (104.47.6.54)
 by server-3.tower-268.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Nov 2019 18:10:05 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U8GVQY2FwQ6yQJn6W3Wx/6G76inXGOVYGnfT37dUNskDuhMC7l1mVbb28eAnKuj5iz4Uf4a26ylMQyBDZ6tlj5XKdSYqDa/IgH2NSx5H+y/X7csuaNFNee6jhiUSDTa5R7cYww9gCdDNO9sZ5JCMrD/+yDfsuDcvF7UsVyZhfF0PPHyBwrs6hm1Pce6pdjce19CJSoesaD4Esb7e38Sz5gKoE/Q1XSL4DFh3TFg9DOsApQPMmHbQFscj85/BXItiIkcDNvLrDyxNOAaBplPONkF9tqAXBy+9lhcyqPZUeLN3qaNwt5tIPtRxNPcB7dpqUUZxc6VXir9/oXdZUAJz5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m7p0SgyfOLFzbjLoO+Je/+jBuqL4X/3r28rlEoKLSP0=;
 b=Bx/U+Ixh2psMGdFQPqF3xRUlOeSmKGYEDK7sRB5IV0dXawL0bbgNZw6MljcMeomCuYMcbq8Fye9wJJ7AUPz3gVdanDn32D9+NnpIOG+lVq6e6IuzuSJ2JGnH2c1vjdQoU/F5asPDivrfD/d12CEqmdMBrYq3QNb9AMNqf4Gupm8/AYWWNksLSX6+V0W2TZ4IAAdx8fURP5Xdgn9zb/2RbRmcZTb8V65lhg5u7HL47LxL0CU2IFh1SSEDB46vFs9+aeib/t0hvoJgwuT7ZrZRuHiUCdHDeTIvZhfALQJFmj8uVI80oE1vjC/iHftP25iys0ZRegF7hQSGlnUTN9WnIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m7p0SgyfOLFzbjLoO+Je/+jBuqL4X/3r28rlEoKLSP0=;
 b=B2cF+7m7mVnGtTDHQQq1GL3Y8FFPUWM/UCSg/G6uY0JkatExrD5rn2WwZ2GFE9TGrm+firqNPAXxb1TljlCMhSMDTgoaQnLmSzN7GUdMgOcPeHibEbF+nwHAuK2LkBpLcup6mgzL9PR2WrmnGNJALCBsJio9rvYtyVhM0QJIHoI=
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM (10.169.154.136) by
 AM5PR1001MB1042.EURPRD10.PROD.OUTLOOK.COM (10.169.154.141) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.19; Wed, 27 Nov 2019 18:10:00 +0000
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5525:87da:ca4:e8df]) by AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5525:87da:ca4:e8df%7]) with mapi id 15.20.2474.023; Wed, 27 Nov 2019
 18:10:00 +0000
From: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To: Mark Brown <broonie@kernel.org>, Adam Thomson
 <Adam.Thomson.Opensource@diasemi.com>
Thread-Topic: [PATCHv2 6/6] ASoC: da7213: Add default clock handling
Thread-Index: AQHVn7aXMyQuMXvm70+jyJLut64noaeWIihwgAeSgICAAAQ4gIAACJ3wgAADHgCAARqUMIAAHxOAgAAPlwCAACS4AIAADJyggAAEXwCAAA2x8A==
Date: Wed, 27 Nov 2019 18:10:00 +0000
Message-ID: <AM5PR1001MB099446A50351CC49478893D780440@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
References: <AM5PR1001MB0994720A0D615339A978E35C804E0@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <AM5PR1001MB0994E628439F021F97B872D480450@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20191126170841.GC4205@sirena.org.uk>
 <AM5PR1001MB09949D557742E8817545637F80450@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20191126175040.GD4205@sirena.org.uk>
 <AM5PR1001MB09940CF764711F1F13A6B37E80440@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20191127123317.GA4879@sirena.org.uk>
 <AM5PR1001MB0994D842A2D7051F81A7765B80440@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20191127154030.GD4879@sirena.org.uk>
 <AM5PR1001MB099467ACADA4F7B6DDA5087480440@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20191127164116.GE4879@sirena.org.uk>
In-Reply-To: <20191127164116.GE4879@sirena.org.uk>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.228]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ed15d1f2-f80c-4182-b934-08d7736504e3
x-ms-traffictypediagnostic: AM5PR1001MB1042:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR1001MB1042D500A75AFB174A4EB57EA7440@AM5PR1001MB1042.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 023495660C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(189003)(199004)(66066001)(8936002)(76176011)(7696005)(64756008)(66476007)(53546011)(102836004)(66556008)(7736002)(14454004)(256004)(446003)(11346002)(86362001)(66446008)(305945005)(55016002)(66946007)(4326008)(99286004)(9686003)(81166006)(71200400001)(71190400001)(52536014)(76116006)(6506007)(2906002)(33656002)(74316002)(55236004)(498600001)(110136005)(6116002)(26005)(25786009)(6246003)(5660300002)(81156014)(3846002)(186003)(6436002)(54906003)(229853002)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR1001MB1042;
 H:AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6SkZ1LSBhSQEsjInjN/6v3hO15KD3xx3q57eOz2aYJ5bM24KpaCajtK4Uv9QWZ5IjIZNgqXNVkDudbvZ+sNMOh+X5q+AOTR19wOdISiwqek/RfB9CLOk3+GBWTjZWdsmMMEXHYKBZTtMv1LwoqKMUXA6skpvTPbHgj0SsNgd5YQChx58gT8Z24whs9FBBO1tSqolOTI1xfjvKl2rRTq8II0kf0o+42RUNhW+wBeArJ3t93TE9HsfLgVeqBgpnDLh0L+P+qXeropgm882hgtOLn+sMHOF6aR5awW+5LnHkVwVnM5lDF0k/veYDHj5tSosBx0+AzaN2mNOk4xRdmTmWdZ61Ardw5HmwfLWFyYhsSwCq2PvaxkoTpjthKo0hDFunmuv/asMNULdxh8HKfTWkBupLY0j8WuSreGNQapMvTuanRVwaYqPRpmRN07P91M6
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed15d1f2-f80c-4182-b934-08d7736504e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2019 18:10:00.5999 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EU7oW8aFw1LGyvj0ky3j5mYC4x6P1NIjsN+57gCa9h9yYOsYxXeoyRdxfuJJdr4o7q4/MP8K0+PzxPR15mTYY2aXLxXbNghfiJTVW7WwJeY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR1001MB1042
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

On 27 November 2019 16:41, Mark Brown wrote:

> > The PLL in the codec relies on MCLK. The MCLK rate can be specified/configured
> > by a machine driver using the relevant codec sysclk function, as is done in a
> > number of drivers. Surely that has to happen first before we configure the PLL
> > as the PLL functions needs to know what rate is coming in so the correct
> > dividers can be applied for the required internal clocking to match up with the
> > desired sample rates. I guess I'm still missing something regarding your
> > discussion around SYSCLK?
>
> The PLL configuration specifies both input and output clock rates (as
> well as an input clock source) so if it's got to configure the MCLK I'd
> expect the driver to figure that out without needing the caller to
> separately set the MCLK rate.

Yes it does but the name of the function implies it's setting the codec's PLL,
not the system clock, whereas the other function implies setting the system
clock and not the PLL. Also generally you're only setting the sysclk once
whereas you may want to configure and enable/disable the PLL more dynamically,
at least for devices which do have a built-in PLL. Of course that could still be
handled through the single PLL function call.

Just as an informational, what's the future for these two functions if
essentially one is only really required and the other deemed redundant? I would
just like to be clear so I'm not falling over things like this in the future,
and wasting your time as well. Seems that the PLL call isn't part of simple
generic card code so would the be deemed surplus to requirements some point down
the line?
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
