Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3128D1B55EC
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Apr 2020 09:39:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF4FE16D7;
	Thu, 23 Apr 2020 09:39:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF4FE16D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587627594;
	bh=BHHvbz4zpO5DsdZ4vOmFS2v/7IAcMeRnaX3pfxYi4nk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JOs/6iTr3MUzJbg6GCJvecwFx9YkJmDI3pWdbrKqbpIKDVNL3AZGD78g0BAYaOvHS
	 V/eMHAGGL6yHPaPdW0AE6aLpI7Py4DcirY5V9Spzinco4XGclRpczQ0jvyF6INXjTS
	 3IZolR8XDSj277555R13xntve25m/Fm0eVzLGuAg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8031F801ED;
	Thu, 23 Apr 2020 09:38:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52993F801EC; Thu, 23 Apr 2020 09:38:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60054.outbound.protection.outlook.com [40.107.6.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43F4BF800F2
 for <alsa-devel@alsa-project.org>; Thu, 23 Apr 2020 09:38:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43F4BF800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="rel7F6qG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SRu7JTYFnogXoTNcW8GQSKi5s9VhLlu04zEhNkyZBgB0SK0jqyrrtee1frTW5XNjXpFyC5+WlS3JYeZYFQ+ncdtosjt5qcVaBPymosomSTxWc1ESET6s9pe5BCZSktV2LSlYmLeesm1oOV8IZ9ZlEt7l1GWU1mlB4A69KLeLxzHzI2xzp4vxrQbC6XLs+fSSnAcb+INeYQAW1Du/AaIae3tXmrWLipwiAhBnCnzhuY9oqGsno0+RwIFR92yAHO7XxTtu62qkRj5Gtgpsuwe3Rs9DHTiged6cDCYY65qmiwMX7XP6WLXNjuF99I8XMsp3iXSfzpPAuheLNJlDdeNcBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DyqK3YEtIl8Lv4Z1U8+JHGKKgMKXFexlIZSFylSMOWQ=;
 b=bloZ8j3c6ZAdMoZSlBE69Qlz3FqxkhZRLUGxQoFM+7S479kgufrULfsCeBBpFs8wKEifsTBTn9OAvul3GmOHu963F/rcla7Sno3ks+zPlFlyVnFfd634wNuEGb8ggZCGhjbycn5kI5FX25c/jdysyqMi+b+eStubWoTOm/tw0Vjre/pIEoxvilJ5HG4R1lmnikvEGIbZa0+GZ+bojafX8ecQEvdfZOZ3PmP8g59HQs82h/teEL++pC4teL4nnMZHDtKCsulMOvQe9P7eZ6HZDhVBGZB2EV4+P5qBEerXBrQoDcmAAi7GOa7K3tD0lHhlfNt+g+q5GSJewuZcsuEkZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DyqK3YEtIl8Lv4Z1U8+JHGKKgMKXFexlIZSFylSMOWQ=;
 b=rel7F6qGlcFPRVhXAB+EqcM/yt6nz22JHHiGKd4nxCZSZqxPBOB7pqYIlZqcf4VpLOKXCk7YeBFOmDFHWV6YsyCGzF50e2l+ywHYBHRa4cGgsZT74EqukadPRtxm9ytM1TWVuT1r4Uggw2qsOSHDOhTlV/x8hAlImQmV7OL1QMc=
Received: from VI1PR0402MB3342.eurprd04.prod.outlook.com
 (2603:10a6:803:11::14) by VI1PR0402MB3454.eurprd04.prod.outlook.com
 (2603:10a6:803:a::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13; Thu, 23 Apr
 2020 07:38:04 +0000
Received: from VI1PR0402MB3342.eurprd04.prod.outlook.com
 ([fe80::c0d8:b266:77f1:ed8c]) by VI1PR0402MB3342.eurprd04.prod.outlook.com
 ([fe80::c0d8:b266:77f1:ed8c%6]) with mapi id 15.20.2937.012; Thu, 23 Apr 2020
 07:38:04 +0000
From: "S.j. Wang" <shengjiu.wang@nxp.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: wm8962: restore the CLOCKING2 register in resume
Thread-Topic: [PATCH] ASoC: wm8962: restore the CLOCKING2 register in resume
Thread-Index: AdYZQfo76p2wS61GRuCd1txp3pItIQ==
Date: Thu, 23 Apr 2020 07:38:04 +0000
Message-ID: <VI1PR0402MB3342492AE94B24C7E92F1ABDE3D30@VI1PR0402MB3342.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shengjiu.wang@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f4a6c756-481b-46f9-223e-08d7e759425e
x-ms-traffictypediagnostic: VI1PR0402MB3454:
x-microsoft-antispam-prvs: <VI1PR0402MB3454002C7691594D8197394DE3D30@VI1PR0402MB3454.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 03827AF76E
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3342.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(136003)(346002)(366004)(396003)(376002)(2906002)(478600001)(7416002)(26005)(316002)(7696005)(6506007)(71200400001)(8936002)(6916009)(33656002)(81156014)(8676002)(52536014)(9686003)(86362001)(5660300002)(76116006)(54906003)(66476007)(66946007)(66556008)(4326008)(64756008)(55016002)(66446008)(186003);
 DIR:OUT; SFP:1101; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wWh5pKZVxPmzvo3xYq7Wgggn5XeqlFkrltx63MVHiweBNqDcuWlqx4mru4fzb1SeeY0dMz1ZNMdfPgowN5P1arhAe4x3kl/lMqFQaQsdt/8JQ8jz6ehn12Ifzd4QSOJvWKkGo9Cf0MyjLo1lCHKAPwLOw/ukn+HujvQhNcmSukZffxgp1N+WT2yrLqxQGRcCBA5ImP6Ix7PUcRbETcYNzRxEtn23qA75OySbM0EIQhycufz+O94zD/ZKh6vvL2PIF79jR67Q3GbuCfpfX7GtlNbKfgWLm85jrRsUSseiKRskWT16Dc2Y1moZrqnNxq+y4amkJt9o1A+rzEWG5bgaxWwSpuDpPuJEf8s/Vsv7VCqIQm5E8RXMuSPa5VL5yW+mmq6cYgexVffGvHOegMtbBmI2AeiYpTTvCkMMDTWzAhduu6W+NrYjM9+hRqgMq/xN
x-ms-exchange-antispam-messagedata: I6Wna6y8yCT/lnOadigxqod3dmhf3SJl7jqgGXWJbKFgX8+ONSRDVtsdj7n5D1MmTpwrhPcYNT945YfPmWV7s8qgFUy8YjSENT+2kixXna56aKpwjCBllwuL2TEG3ZhTVJxi2NZHBRJk50uh2OP4sHEoLzT7e9UAC9G3W1FlYUvaLTMnBlO7IfRMSv/pX2P58SAy+bhWyLOTnOlyOJgCDONUt04LOyUR7VAJnbt/7wOgYFWoWkhIEWE9mz7Pu7atNyo78lRKcGcph2R8Qsid/GJFdDE2aX4l8hUaESH9A7UfEm41QXKvbhchB1BVlZKOR2q4q4cWpv54uuwk6LI6qq0Oym9hwqbT52RrYUH1uzx5c0wTEf0RFED/jDXUkm8w3eNU2H0c+dgp6qt7IP8zJo6Nkuq2v7hNMok9i7NiqNFWSwLbFV8LyO+7w3rTH4+VLNwJANSn0DO/M9FYnq29AOnQviNzsP/eBsJZ1QIMWNlaVdl+BNto8MU6C1FuPCu/Rc7bezCMKtrsvhlObFHi+WEXDw7N14+bHmRJZpJpN0uzuSUQ5oqzLeTTKiO323KbEaQXe+Qj4EuTiBAF5HRoiriz9Ow5LVXn7PCDujMbZOpzFgbxCZGevthkRWZL+lLL97SswiceQTd50DPIOND8NxJzwN2x3Eo1aRmhtyRYRK/5QTJLmQARyxKwR8vJHcXaNkbjjg+5TdyE9A5lEOd1SNk8N503jSgJfj6y/SipPPH3neQLKO0R6x7Hac/PRD1pWOZ3pAWB/qdEA6c2sjANbyvBFw13Y21higzAv5IAOVc=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4a6c756-481b-46f9-223e-08d7e759425e
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2020 07:38:04.6138 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xlqCGUFYF15Tzuu261n1OAyd/XfM/grLP5FQTLGnOq4bxvMr99DSxhXmW8k4+tJkiFY0ff6sj7vwHJNQI41aCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3454
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>, "info@metux.net" <info@metux.net>,
 "allison@lohutok.net" <allison@lohutok.net>
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


>=20
> On Tue, Apr 21, 2020 at 08:02:15PM +0800, Shengjiu Wang wrote:
> > The CLOCKING2 is a volatile register, but some bits should be restored
> > when resume, for example SYSCLK_SRC. otherwise the output clock is
> > wrong
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  sound/soc/codecs/wm8962.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
> > index d9d59f45833f..6e96c0c5ad2a 100644
> > --- a/sound/soc/codecs/wm8962.c
> > +++ b/sound/soc/codecs/wm8962.c
> > @@ -82,6 +82,7 @@ struct wm8962_priv {  #endif
> >
> >       int irq;
> > +     u32 regcache_clocking2;
> >  };
> >
> >  /* We can't use the same notifier block for more than one supply and
> > @@ -3813,6 +3814,10 @@ static int wm8962_runtime_resume(struct
> device
> > *dev)
> >
> >       regcache_sync(wm8962->regmap);
> >
> > +     regmap_update_bits(wm8962->regmap, WM8962_CLOCKING2,
> > +                        WM8962_SYSCLK_SRC_MASK,
> > +                        wm8962->regcache_clocking2);
> > +
>=20
> I wonder if it might just be better to make the register non-volatile? Fr=
om
> looking through the datasheet I am guessing this is volatile for the
> CLASSD_CLK_DIV bits, which are controlled by the chip itself. But the
> datasheet claims these are read only and protected by the security key, a=
nd
> they are not read by the driver at all.
>=20
> Thanks,
> Charles
>=20
Use non-volatile also can fix the issue, I will send v2 for it

Best regards
Wang shengjiu
