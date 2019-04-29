Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FADDF40
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Apr 2019 11:18:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5C00165F;
	Mon, 29 Apr 2019 11:17:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5C00165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556529496;
	bh=2JF5wdDzL2GBz3RJKuBxGqRKacznAu5Ai2stzwBALfE=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RQhs6A+sHzMgbuivlg/HTv2fCYzv/GYYjDaxVAqHunP9dboYPRGESveLRLCIPVgWq
	 bLvSz5Nex0QMuirZGR+E1+kMbeJUYHjtI6H+rYdqFEYvzUqnopmMZnd/VBkRhNWqxP
	 Z70NP3n4UKATkoVMusrEDvNHE2PdXGre1grbAZfc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FD77F89693;
	Mon, 29 Apr 2019 11:16:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C7E7F80CAB; Mon, 29 Apr 2019 11:16:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27DE6F806E7
 for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2019 11:16:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27DE6F806E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=dialogsemiconductor.onmicrosoft.com
 header.i=@dialogsemiconductor.onmicrosoft.com header.b="HhpYnFz8"
Received: from [46.226.52.200] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-2.bemta.az-b.eu-west-1.aws.symcld.net id 27/E1-23323-9E0C6CC5;
 Mon, 29 Apr 2019 09:16:25 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA1WSa0hTYRjHfc85OzsrT7zN0idLqUFB5lmui5w
 uH6QPMaggpChCqrN5coM5185ELYKSjbxkdmGk5S0rCyMUCbEU02nRBcvMLCtHq0G6CsIuRnTb
 2dEu3/7n+f+e//O8h4chtcN0PCPmu0SnXbDp6GmUZamG58a6bmWkVB7W8HfdHWp+8KGP4L2BI
 M1/GSwi+EfXq2i++Hq5im+euILS1Mbmj4W00TPwgzZeOz2iNrY0FtPGzvcNtLHp6mPK+LElcb
 N6h8pqN+Xk71ZZ3M2vaMc4k9/w3K06iL7TJUjDULiJhI7i3SVoGqPFXgK8hW2k8hFAcGmiTC1
 TNObh5O2XkY5ZeDsU+R/RMkTiXgL6a4eIEsQwMXgbdLYXTDGVdRWEolfDmdGzpDJtIUzcK4/g
 LBbAXbNKLmuxBTz+xsgoDV4O/ssnkKwRToBPhy5HWkkcB8+CtZFIwBjOdzwgFT0bxl7/VCm8C
 HcKnyKlngx9T4JIHgV4AZS9pJRyAgzUlk4im8DX2aJS9AsEI9/TplqPVxVN8jycL/VQSowDBu
 tXKuVF8PRd0eQG86DrSI9a/iGAL9JQ+OQFrTzLDB+q+9QKlAiNZQFKgfpJOFJepT6Gkk7/8zR
 FJ0Nd+zit6CXQcPYtKWsWz4Q7lUGqDlGNiDc5rVkWV7ZgtXGGlBTOYFjGGValcobU5XphH2fS
 i7lcnii5OINeyJP0UkG22Zapt4uuFhQ+s0xH77k2FLqY5UNzGEI3m73QejNDO8OUk1lgESTLL
 meuTZR8aB7D6ICde+NWhnamU8wS8/dYbeFbnbKBidbNYr92hm1WcgjZkjVLse4ijumqD1STWs
 qeYxfj49h1cgaWIUuu/U/E1MUPoIT4GBZFRUVpox2iM9vq+t8PoTgG6WLYGDkl2mp3/ZkUCi9
 BhJfYVRNZwiX8teIPor3VxhH25LedXzZ0bWk9tY1d3OpdP5GTtrHXU2Fmhg/PafP4F4SCDd70
 2KbxtRvelyQO7t9qqpmevsXZvX48drR0oMyfVJywJk9zNPbNAVX/SreuYqzn13z754Lke+lNQ
 6GhK4l9K4g3qd3sjL2B4VF30Ozr7mnv7l9qvu8J/pxfp6Mki2BIIp2S8Bs2A6rB7AMAAA==
X-Env-Sender: Adam.Thomson.Opensource@diasemi.com
X-Msg-Ref: server-3.tower-288.messagelabs.com!1556529384!8013547!1
X-Originating-IP: [104.47.9.56]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.31.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30202 invoked from network); 29 Apr 2019 09:16:25 -0000
Received: from mail-ve1eur03lp2056.outbound.protection.outlook.com (HELO
 EUR03-VE1-obe.outbound.protection.outlook.com) (104.47.9.56)
 by server-3.tower-288.messagelabs.com with AES256-SHA256 encrypted SMTP;
 29 Apr 2019 09:16:25 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com; s=selector1-diasemi-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bZfKhUE6GU5bTJIVhERVZ8WhN0wrcDd15Z8YGY06B6A=;
 b=HhpYnFz8BzjSTJiYlRJ1NUCjELAtdwS3rL88ykNM45yMtZPe9uQI5KSsq0qzwppDZdfscjwMj5UH/f8cMOdN/1KJvKRcRMjF05Je9rZVclXZaRzVzc7xrjI9Od19Gw/0A+4o5qLN0y3kFZYnzaR9DsoRq6acVOFnpCEmxdwZU1c=
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM (10.169.154.136) by
 AM5PR1001MB1124.EURPRD10.PROD.OUTLOOK.COM (10.169.155.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.12; Mon, 29 Apr 2019 09:16:08 +0000
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::45b2:d8a8:e1c:b971]) by AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::45b2:d8a8:e1c:b971%5]) with mapi id 15.20.1835.018; Mon, 29 Apr 2019
 09:16:08 +0000
From: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To: Mark Brown <broonie@kernel.org>, Adam Thomson
 <Adam.Thomson.Opensource@diasemi.com>
Thread-Topic: [PATCH] ASoC: da7219: Use clk_round_rate to handle enabled
 bclk/wclk case
Thread-Index: AQHU/C/ieslj5Bfz40yQWTvSO33hHaZQQn2AgAKcQvA=
Date: Mon, 29 Apr 2019 09:16:08 +0000
Message-ID: <AM5PR1001MB0994EA351AEF82224D9AA6BF80390@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
References: <20190426125925.04F3F3FB4A@swsrvapps-01.diasemi.com>
 <20190427171955.GH14916@sirena.org.uk>
In-Reply-To: <20190427171955.GH14916@sirena.org.uk>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.50]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 26bb1539-bd11-4108-bd85-08d6cc8350d0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:AM5PR1001MB1124; 
x-ms-traffictypediagnostic: AM5PR1001MB1124:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-microsoft-antispam-prvs: <AM5PR1001MB1124C70FE6F8DFD45D290381A7390@AM5PR1001MB1124.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0022134A87
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(396003)(366004)(376002)(39860400002)(136003)(199004)(189003)(68736007)(478600001)(305945005)(66066001)(5660300002)(72206003)(102836004)(14454004)(76176011)(71200400001)(71190400001)(2906002)(81156014)(7696005)(81166006)(74316002)(99286004)(316002)(8676002)(25786009)(6246003)(97736004)(33656002)(55016002)(4326008)(52536014)(26005)(8936002)(7736002)(110136005)(9686003)(186003)(6436002)(55236004)(229853002)(66556008)(53936002)(486006)(86362001)(6116002)(3846002)(446003)(256004)(14444005)(107886003)(66946007)(73956011)(11346002)(54906003)(6506007)(476003)(66446008)(64756008)(76116006)(53546011)(66476007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR1001MB1124;
 H:AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: s0849gx6b9qET1bgAo5yxi1f3u6fQLe9pRMQAbKwT56Ehy1T0sc/k9T3YkayEJHHxclUUZBu6j33Sa3RHSVERjv3HhLDx38e6U0U9iiGRPWrQ/eHy2uJUeIyFMk5JKm9j1szPXfMmeUlZYHz1VFndTlQwr+YxYjOZ+qlxROOwdgHogJhCvlc+MhVYYdZ+ku6jyM/XKqTV3KnDu0BUL7aL5hQvzezpYThwLN6BLiYGVfw15V9tLHpbIf7MdWGGdgI2JYt9JlBS5tFJx+0aChhhu39ProtwDB4X5dTeHbcBpDqczjQ7fRK1b93CwL/pLUvI+kpLS9wmc93rhK1EFWtzhE9I5Mt/lZWFiXNr32RtGRhIdvAq6IE5UgpwikzCUZxiNhjJQAd8d3jX/Ov8jaYq6zJjkR7/41tP0hvs+fWDjI=
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26bb1539-bd11-4108-bd85-08d6cc8350d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2019 09:16:08.7052 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR1001MB1124
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Support Opensource <Support.Opensource@diasemi.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Akshu Agrawal <Akshu.Agrawal@amd.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: da7219: Use clk_round_rate to handle
 enabled bclk/wclk case
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

On 27 April 2019 18:20, Mark Brown wrote:

> On Fri, Apr 26, 2019 at 01:59:24PM +0100, Adam Thomson wrote:
> 
> > +		/*
> > +		 * Rounding the rate here avoids failure trying to set a new
> > +		 * rate on an already enabled wclk. In that instance this will
> > +		 * just set the same rate as is currently in use, and so should
> > +		 * continue without problem.
> > +		 */
> > +		sr = clk_round_rate(wclk, sr);
> >  		ret = clk_set_rate(wclk, sr);
> >  		if (ret) {
> >  			dev_err(component->dev,
> 
> Don't we need to validate that the rounded rate is actually viable for
> the parameters we're trying to set here?  If there's missing constraints
> causing something to try to do something unsupportable then we should
> return an error rather than silently accept.

Thanks for directing my gaze to this again. Actually I don't think the SR should
be rounded at all. If it doesn't match exactly it should fail so I'll remove the
rounding here. Not sure what my brain was doing there.

For the BCLK rate, I'll see what checking can be added there to make sure the
word length is compatible with the 'rounded' BCLK rate.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
