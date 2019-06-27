Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1994F581D8
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2019 13:49:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D198172B;
	Thu, 27 Jun 2019 13:48:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D198172B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561636153;
	bh=l+r3CPKTrKtoY7QBOzPVALrac8lt0uNpFPJsXbWBCqY=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QZubMghDNSM0j2CM3S3E3/uMZ6uLRugpnAXMuYqt/6225/h0ZMmSud00rPsiE4I4Y
	 c9t5gEQEiLZzW+XHHpI80f/kCrjhs9I86oqA79GkQVmSHFXSRQObNoDHd5Ew+SZdIH
	 wYRp9BsDYE5OYN5DzB6kXBoCm5bWZ82jAw/IMFJA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC7D6F896FC;
	Thu, 27 Jun 2019 13:47:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82EFDF806F0; Thu, 27 Jun 2019 13:47:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80045.outbound.protection.outlook.com [40.107.8.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F5B3F806F0
 for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2019 13:47:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F5B3F806F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="Uj1dz7aE"
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=AztyHgDU7uJsgznjbTC1DcUvjeoGOX3+V8jBCxNPEu1oLVoIXv5oT/MUauqIom02Ozi4twrrkyGWg/mWmaPD5icTJEjdCfeweqoP71d0vDCdZKbFDxSjB9fCDZKSUAAfJ2mBUX0dxOgV2dCSY6q84n1Q5CxlC1m+ILj7j3P3h+M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yzoEhepFtitjOqjaaCI/hxFQa3J6h/bj8SrrEDrODgI=;
 b=GdJeXq8LxF8xoUIsrBePBKRxfA5O2e2n+hkT0TITChH2hwG4rFNBcI6yd260/vAkRlrVPLjJBlXapthXlcz/M8W37iiqqPK2ugGsuvAq8Xuje+8pvSl9U2YfCaA2IKl4HJiABnXjTgdcxJxRwuiOMfoCv4BA0h1wWgj+GsYJf30=
ARC-Authentication-Results: i=1; test.office365.com
 1;spf=none;dmarc=none;dkim=none;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yzoEhepFtitjOqjaaCI/hxFQa3J6h/bj8SrrEDrODgI=;
 b=Uj1dz7aEQM2W0vlqXZLQcNpoNZKlLO/jeC/bOB5eWJHod3h3ym56+8/3Ot2xb7t98NVvZj+PaQre1wzEJQWF8rtXGZy2dBJMnZ3Qf5BKlnpNzIQKCMsArQ55MksG//TWRgSAbJhtMhCCUkFbri7IvgAlE40jnF+IbyL2P1EpAl0=
Received: from AM6PR04MB5207.eurprd04.prod.outlook.com (20.177.35.159) by
 AM6PR04MB6758.eurprd04.prod.outlook.com (20.179.247.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.13; Thu, 27 Jun 2019 11:47:20 +0000
Received: from AM6PR04MB5207.eurprd04.prod.outlook.com
 ([fe80::9c87:7753:43b9:6d4a]) by AM6PR04MB5207.eurprd04.prod.outlook.com
 ([fe80::9c87:7753:43b9:6d4a%4]) with mapi id 15.20.2008.014; Thu, 27 Jun 2019
 11:47:20 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>, "kuninori.morimoto.gx@renesas.com"
 <kuninori.morimoto.gx@renesas.com>, "daniel.baluta@gmail.com"
 <daniel.baluta@gmail.com>
Thread-Topic: [alsa-devel] [PATCH v2 116/146] ASoC: sof: use modern dai_link
 style
Thread-Index: AQHVHCh+Hmkb5GuoOEimfMVsRvfthaat/t+AgACMk4CAAPhigA==
Date: Thu, 27 Jun 2019 11:47:20 +0000
Message-ID: <817b8d146a2a4444b5061e9eac3f01d58f8e5aa4.camel@nxp.com>
References: <87h893mkvi.wl-kuninori.morimoto.gx@renesas.com>
 <87sgsnfjge.wl-kuninori.morimoto.gx@renesas.com>
 <CAEnQRZBnvfuZDbnvbmqAavh9DAbA_EeRc6OuH6OOiR1WB4zUrg@mail.gmail.com>
 <8761d853-2b3f-7b26-0073-05d0c3ce1362@linux.intel.com>
In-Reply-To: <8761d853-2b3f-7b26-0073-05d0c3ce1362@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=daniel.baluta@nxp.com; 
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ae7b3792-0523-4907-4c2e-08d6faf5365b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM6PR04MB6758; 
x-ms-traffictypediagnostic: AM6PR04MB6758:
x-microsoft-antispam-prvs: <AM6PR04MB675813D32F4FBBBECD521678F9FD0@AM6PR04MB6758.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 008184426E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(376002)(346002)(366004)(136003)(39860400002)(189003)(199004)(6116002)(91956017)(81166006)(256004)(2906002)(36756003)(76176011)(44832011)(6436002)(186003)(2201001)(68736007)(86362001)(6512007)(305945005)(5660300002)(73956011)(66556008)(7736002)(8936002)(50226002)(14454004)(26005)(64756008)(476003)(66446008)(76116006)(81156014)(486006)(8676002)(66476007)(99286004)(66946007)(71190400001)(6506007)(2616005)(478600001)(118296001)(3846002)(6246003)(229853002)(71200400001)(25786009)(66066001)(6486002)(316002)(110136005)(54906003)(53936002)(11346002)(102836004)(446003)(2501003)(4326008)(99106002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR04MB6758;
 H:AM6PR04MB5207.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Zta93XVFwlB0Fa7j/6v5uasNNLnMDKiO3OvRjtyNbXTE+iMRf4qL/F0mie8FflxLQYTMBQfNQZpLsdpUOkIkct5+lLcljojWpOUsimAI8gXS1tYR77jrajHTqpCPqhuyC6T1ROymnxBKlRYMbvnvFs58oU3MzoO8SI+hZPaep+CMqqQuTGaw2EabvAucMobmAz+uyoZqFSK74jdf0N+6kClrYl29XKIE9dvWRtVHxiLSbRndIVnbqT3YnId73DKdUPjDu/bnWKRzb10eZA+KkuxxthvzUS6H5cLCYLbUK3ne/VRmfZwK/Nas7j4cr/RDi9c2rOvwPHOuNbq28dVC7GxuSeR4O+s/mIuA1KMm6kQ4hnl3UTStJaVUNeF/Id/AoszFwTAoJXDg6SHwdZZe6DmZo/f1p3H6EYwJb6yN77M=
Content-ID: <E7A7534DACCE524D97A111F4E4991A55@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae7b3792-0523-4907-4c2e-08d6faf5365b
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2019 11:47:20.3849 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: daniel.baluta@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6758
Cc: Paul Olaru <paul.olaru@nxp.com>, "broonie@kernel.org" <broonie@kernel.org>,
 "ranjani.sridharan@intel.com" <ranjani.sridharan@intel.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH v2 116/146] ASoC: sof: use modern dai_link
 style
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

On Wed, 2019-06-26 at 22:58 +0200, Pierre-Louis Bossart wrote:
> > diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
> > index f485f7f751a1..ee73318135fc 100644
> > --- a/sound/soc/soc-topology.c
> > +++ b/sound/soc/soc-topology.c
> > @@ -1883,7 +1883,7 @@ static int soc_tplg_fe_link_create(struct
> > soc_tplg *tplg,
> >          int ret;
> > 
> >          /* link + cpu + codec */
> > -       link = kzalloc(sizeof(*link) + (2 * sizeof(*dlc)),
> > GFP_KERNEL);
> > +       link = kzalloc(sizeof(*link) + (3 * sizeof(*dlc)),
> > GFP_KERNEL);
> >          if (link == NULL)
> >                  return -ENOMEM;
> > 
> > @@ -1891,9 +1891,11 @@ static int soc_tplg_fe_link_create(struct
> > soc_tplg *tplg,
> > 
> >          link->cpus      = &dlc[0];
> >          link->codecs    = &dlc[1];
> > +       link->platforms = &dlc[2];
> > 
> >          link->num_cpus   = 1;
> >          link->num_codecs = 1;
> > +       link->num_platforms = 1;
> > 
> > Can you please help me figure this out?
> 
> Isn't this fixed by my patch "ASoC: soc-topology: fix modern dai
> link 
> style" applied on 6/13? Looks like the same issue to me.

Yes, this is the same thing. My tree with all NXP i.MX8QXP patches
is a little bit older and did not contain your patch.

Sorry for the noise, everything is looking good now! :)


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
