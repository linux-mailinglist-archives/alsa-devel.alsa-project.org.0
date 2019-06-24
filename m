Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C7050980
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jun 2019 13:12:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A2401657;
	Mon, 24 Jun 2019 13:11:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A2401657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561374737;
	bh=e9eTeFcQs9vjrTmzNmT2IdGBAc0HiHyL+lYVuttzikA=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bkBZs4pd24G0yWBqJRB52jfwEZPl9QyLNCN2o4sBRt1dyae1i/6Q/wDJVSiKYuyP+
	 0/1R/a79a/NHnBaOKGpZBUMJbeoa8MaHFiHRA5o+TW7fYrVeASD5QmlI7TmiW4r/ZH
	 oWU2iY/ZmVxsGt6IrrDNVlVxL2XX8c5TorczDXgE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44A61F8071F;
	Mon, 24 Jun 2019 13:10:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BBF13F896B6; Mon, 24 Jun 2019 13:10:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130099.outbound.protection.outlook.com [40.107.13.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CCAC6F8065B
 for <alsa-devel@alsa-project.org>; Mon, 24 Jun 2019 13:10:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCAC6F8065B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=toradex.com header.i=@toradex.com
 header.b="JIau2vH9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P51FPziiyHaBfce1MdqBmvEnx+Q/UHK7sx73UwWEQls=;
 b=JIau2vH957J/shtCoZAmM6NMSGJ0aykYvSRuM+/J6vhvcvlU1mCDxLhLLa3mcJUG4dIgeh/SCWc6nguivBQvQF6pvNDzkcwqX7MAdHSeWKHDwg1K+QymJuycJNPoOqYq+45osFAR9XJZwerP/89K9BXqqOb+PDabs69ix0FXkWA=
Received: from VI1PR0502MB3648.eurprd05.prod.outlook.com (52.134.7.143) by
 VI1PR0502MB3950.eurprd05.prod.outlook.com (52.134.17.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.15; Mon, 24 Jun 2019 11:10:23 +0000
Received: from VI1PR0502MB3648.eurprd05.prod.outlook.com
 ([fe80::878:9343:183f:9e91]) by VI1PR0502MB3648.eurprd05.prod.outlook.com
 ([fe80::878:9343:183f:9e91%5]) with mapi id 15.20.1987.014; Mon, 24 Jun 2019
 11:10:23 +0000
From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
To: "festevam@gmail.com" <festevam@gmail.com>, Oleksandr Suvorov
 <oleksandr.suvorov@toradex.com>
Thread-Topic: [PATCH v1 1/6] ASoC: sgtl5000: Fix definition of VAG Ramp Control
Thread-Index: AQHVD9h2Jvq9SRrSGEWyDMAz3sEU8KaZboEAgAl9dQCAB+8tAA==
Date: Mon, 24 Jun 2019 11:10:23 +0000
Message-ID: <67279bb061304ae8a5e97225dfea4be5c079e121.camel@toradex.com>
References: <20190521103619.4707-1-oleksandr.suvorov@toradex.com>
 <20190521103619.4707-2-oleksandr.suvorov@toradex.com>
 ,<79fa1a0855bfcc1abad348aa047e7a69fffb8225.camel@toradex.com>
 <AM6PR05MB65351FF540C6CD22167A6F90F9E50@AM6PR05MB6535.eurprd05.prod.outlook.com>
In-Reply-To: <AM6PR05MB65351FF540C6CD22167A6F90F9E50@AM6PR05MB6535.eurprd05.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=marcel.ziswiler@toradex.com; 
x-originating-ip: [46.140.72.82]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9478c6e9-bd1a-43b9-f2e1-08d6f8948db5
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:VI1PR0502MB3950; 
x-ms-traffictypediagnostic: VI1PR0502MB3950:
x-microsoft-antispam-prvs: <VI1PR0502MB395037FB0189733A5F86FDC4FBE00@VI1PR0502MB3950.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 007814487B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(39840400004)(396003)(136003)(366004)(346002)(189003)(199004)(44832011)(86362001)(54906003)(4326008)(66556008)(68736007)(2906002)(25786009)(76176011)(2616005)(476003)(6512007)(53936002)(6436002)(229853002)(6246003)(186003)(446003)(66066001)(316002)(11346002)(486006)(66946007)(305945005)(91956017)(73956011)(36756003)(53546011)(66446008)(118296001)(26005)(6486002)(99286004)(102836004)(76116006)(5660300002)(66476007)(2501003)(81166006)(14444005)(14454004)(71200400001)(8676002)(81156014)(8936002)(6636002)(256004)(6116002)(3846002)(7736002)(478600001)(6506007)(71190400001)(64756008)(110136005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0502MB3950;
 H:VI1PR0502MB3648.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: toradex.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: NcDpdsYCEF1bB57L4RDjdY6773SkNwRh5eSKgtqgzb9E0lWodw46AFfPnfAFnhCG+/n+NK24D+41gLtHjXh8iXxHBxvD65Yz38nP98YcjewNv7rHXqFmXe572lWzVko2JCofhW+bWy9dnhCoLhf1zpNnTFM3AXg4BSkCthxjLKQoiqYIYSqF9jvqm7FEx7addrLhK93JJx/5yZSsA7F3WgcDDJjQ3bN/84MYf55ImKmf93PgFl0fZDr3enJGIWLSziIiFqMEcSK0zUf4mZf21WCEuQzat4AS+rzhZJ7DgluvSH7czSl/1spEZBgNsZMv7ygluAhtLgmGU63i4xPyPtHGFgzhMdv2E3dCrJ7F9Bk3WB2wgakVyFVayPIyQtWZDwhHQz8ZFd08xviowNefFNj5vAAIJjhZjXEBv92ZYDQ=
Content-ID: <A18CCEB3238F3B41A90027D07E5756F3@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9478c6e9-bd1a-43b9-f2e1-08d6f8948db5
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2019 11:10:23.3754 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: marcel.ziswiler@toradex.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0502MB3950
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

On Wed, 2019-06-19 at 10:00 +0000, Oleksandr Suvorov wrote:
> > ________________________________________
> > From: Marcel Ziswiler
> > Sent: Thursday, June 13, 2019 12:05
> > To: festevam@gmail.com; Oleksandr Suvorov
> > Cc: Igor Opaniuk; linux-kernel@vger.kernel.org; 
> > alsa-devel@alsa-project.org
> > Subject: Re: [PATCH v1 1/6] ASoC: sgtl5000: Fix definition of VAG
> > Ramp Control
> > 
> > On Tue, 2019-05-21 at 13:36 +0300, Oleksandr Suvorov wrote:
> > > SGTL5000_SMALL_POP is a bit mask, not a value. Usage of
> > > correct definition makes device probing code more clear.
> > > 
> > > Signed-off-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
> > 
> > Reviewed-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> > 
> > > ---
> > > 
> > >  sound/soc/codecs/sgtl5000.c | 2 +-
> > >  sound/soc/codecs/sgtl5000.h | 2 +-
> > >  2 files changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git sound/soc/codecs/sgtl5000.c
> > > sound/soc/codecs/sgtl5000.c
> > 
> > I'm not sure how exactly you generated this patch set but usually
> > git
> > format-patch inserts an additional folder level called a/b which is
> > what git am accepts by default e.g.
> 
> I just used patman to generate this set of patches. But my .gitconfig
> included diff option "noprefix".
> Thanks for pointing me! Fixed. Should I resent regenerated patchset
> with the prefix?

I guess but more importantly also make sure to actually send valid
emails concerning SPF/DKIM configuration.

> > diff --git a/sound/soc/codecs/sgtl5000.c
> > b/sound/soc/codecs/sgtl5000.c
> > 
> > > index a6a4748c97f9..5e49523ee0b6 100644
> > > --- sound/soc/codecs/sgtl5000.c
> > > +++ sound/soc/codecs/sgtl5000.c
> > 
> > Of course, the same a/b stuff applies here:
> > 
> > --- a/sound/soc/codecs/sgtl5000.c
> > +++ b/sound/soc/codecs/sgtl5000.c
> > 
> > > @@ -1296,7 +1296,7 @@ static int sgtl5000_probe(struct
> > > snd_soc_component *component)
> > > 
> > >       /* enable small pop, introduce 400ms delay in turning off
> > > */
> > >       snd_soc_component_update_bits(component,
> > > SGTL5000_CHIP_REF_CTRL,
> > > -                             SGTL5000_SMALL_POP, 1);
> > > +                             SGTL5000_SMALL_POP,
> > > SGTL5000_SMALL_POP);
> > > 
> > >       /* disable short cut detector */
> > >       snd_soc_component_write(component,
> > > SGTL5000_CHIP_SHORT_CTRL,
> > > 0);
> > > diff --git sound/soc/codecs/sgtl5000.h
> > > sound/soc/codecs/sgtl5000.h
> > > index 18cae08bbd3a..a4bf4bca95bf 100644
> > > --- sound/soc/codecs/sgtl5000.h
> > > +++ sound/soc/codecs/sgtl5000.h
> > > @@ -273,7 +273,7 @@
> > >  #define SGTL5000_BIAS_CTRL_MASK                      0x000e
> > >  #define SGTL5000_BIAS_CTRL_SHIFT             1
> > >  #define SGTL5000_BIAS_CTRL_WIDTH             3
> > > -#define SGTL5000_SMALL_POP                   1
> > > +#define SGTL5000_SMALL_POP                   0x0001
> > > 
> > >  /*
> > >   * SGTL5000_CHIP_MIC_CTRL
> > > --
> > > 2.20.1
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
