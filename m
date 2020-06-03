Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E071ECE66
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jun 2020 13:32:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6DADB1661;
	Wed,  3 Jun 2020 13:31:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6DADB1661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591183920;
	bh=BX3pcBhEvjIQoIDNKTAPYzwPMgt04yhWEVMsMgyW9ZM=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SSiJ2mm6c2r0WTjiVZH6OJ+VpArtAxtJahZyHHT2aCA2Wh/BzaqzIRNhoYWoPV9Q6
	 5a5FUiHq9Qdi6BbIasou8pkfHGPrsdjnh1gmS9cG1mgel4d6WUd2P9xXli+4CoZyrl
	 m0lceK0eAd81ux887rg0ev7wP/yh8CSz5kQRm+1Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89D23F8013D;
	Wed,  3 Jun 2020 13:30:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D04D8F801ED; Wed,  3 Jun 2020 13:30:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2124.outbound.protection.outlook.com [40.107.236.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C305FF8013D
 for <alsa-devel@alsa-project.org>; Wed,  3 Jun 2020 13:30:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C305FF8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=maximintegrated.onmicrosoft.com
 header.i=@maximintegrated.onmicrosoft.com header.b="S0ktNZZw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iV7aQhbGpEpGzWIlD7btyK7f1ebXbWGpaDP+ym4aK2c8Gj5UU0bGY/bSdH8fDIHBnNAz0BS9pvvFS/P3kERljO7hLOkM/k/omuCndVRJPYqpBebFuu2XQprUn+xHgUsieKnBg/z0FdVZwIy5CKXekmPzDEPP8V6WDw78IrCm2rXIwSs3LVeQZ7fJrvW6DDG/9ayvoYWNjGuuurgCbrR6mCyP9da+ZiF0BlR5hL07IFUUaK4XPd2IUxDUR2IaCM5Ew9OIcy994dX1G66SPgRsnourFAFJxPrjmMNta7zQ6zDY2U98AwxrEcCTG4YXSZR7Zw+R9JPpHC8c9DKoSciSFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c6diLltNI7WqqFVBoZjTQGoYyjFGgxEBUrA0J0afqmY=;
 b=WRquCLcTfSjMjYgKYqZET52rH94HrfsURfTpGjOiIEqxkgv9qyJdtuvT9kMcdVvemoqKiWBP80aUZKQN0jxMPXDYusH0tpxe+YCfTme9uW29sfwWq7nDz24SwCyctoC09KaYsKRgKQPqtHtMhXbHQh8SjoJIUFGXZ+E3gla4ne+daOhcX9uYYZWVpM3R+PnIg/eF94HkmxPKW2bREOauX9TEsDtz0Lear5SoIxnB+w+9ZtHMA/w1MUIew61xaN2Uh0lNT1MBuLYOMl7I4z1+rfR5FG40SwjrlUvqMZK3RcvCHo+RPY7pfFRj+7a3OwpaKnySfXd6C4b2K+6umpwBLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=maximintegrated.com; dmarc=pass action=none
 header.from=maximintegrated.com; dkim=pass header.d=maximintegrated.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=maximintegrated.onmicrosoft.com;
 s=selector2-maximintegrated-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c6diLltNI7WqqFVBoZjTQGoYyjFGgxEBUrA0J0afqmY=;
 b=S0ktNZZwRdST1twkX88QOvvxgODvYemJ7BKBguBmjORLtb1dVJdxkvINIT8eF3ODlbYxizlVH7c89QvYX59nh/JnVBRNWaCoIFrEZ5gcO8sUrO/G66Y+on2SzL8WNJR6vGdjjbLGFecfoUyWWTEX6lOA9pZu1L+cCE9I6sIeKig=
Received: from MWHPR11MB2047.namprd11.prod.outlook.com (2603:10b6:300:2a::12)
 by MWHPR11MB1726.namprd11.prod.outlook.com (2603:10b6:300:23::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Wed, 3 Jun
 2020 11:30:02 +0000
Received: from MWHPR11MB2047.namprd11.prod.outlook.com
 ([fe80::994e:6a48:f660:f363]) by MWHPR11MB2047.namprd11.prod.outlook.com
 ([fe80::994e:6a48:f660:f363%5]) with mapi id 15.20.3066.018; Wed, 3 Jun 2020
 11:30:02 +0000
From: Steve Lee <SteveS.Lee@maximintegrated.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: RE: [PATCH] ASoC: max98390: Fix potential crash during param fw
 loading
Thread-Topic: [PATCH] ASoC: max98390: Fix potential crash during param fw
 loading
Thread-Index: AQHWOZjok5hm+3ydWEypvnQMZosX1ajGv8wAgAABMyA=
Date: Wed, 3 Jun 2020 11:30:02 +0000
Message-ID: <MWHPR11MB204724AEA2415929253525E492880@MWHPR11MB2047.namprd11.prod.outlook.com>
References: <20200603111819.5824-1-steves.lee@maximintegrated.com>
 <s5hzh9kcrzb.wl-tiwai@suse.de>
In-Reply-To: <s5hzh9kcrzb.wl-tiwai@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none
 header.from=maximintegrated.com;
x-originating-ip: [211.35.184.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: bbdef38d-8173-4df2-85a0-08d807b174cb
x-ms-traffictypediagnostic: MWHPR11MB1726:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB1726EBC751E1C804DD8B2D8D92880@MWHPR11MB1726.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1107;
x-forefront-prvs: 04238CD941
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VoavqXsLKpowzGNevrLDt5aeN2Gy1b7Z3dmKj+s+EoN56pCaz+eNDZHUxK1w9+R7ZqUDd0/cLLp92skR6MkGd2ztDn8ukQsELCKK03TCMmFecYfQyobu+flPCE9tk0VIlXuFZs3jzeedng1I/uQICrRs/7DeA1cG1IrLHGVIihGaaA6CCrJcj9XtXdCuYGesSi9sSIpAxV8f7xbf6LTxducYPSnB2gOo8FjIJmYOYm8Xfu+qwxNqu07+kpLMlEnNxxKWCnVoz9D91lw4uNMPX/oFuQDsx5hzIqMdCDc/8HQJBNhcCy7psE1OMvJeN+BG
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB2047.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(396003)(39860400002)(136003)(376002)(346002)(8936002)(316002)(7696005)(8676002)(53546011)(6506007)(6916009)(55016002)(66446008)(71200400001)(4326008)(64756008)(5660300002)(52536014)(76116006)(33656002)(66476007)(66556008)(66946007)(86362001)(26005)(7416002)(9686003)(2906002)(186003)(83380400001)(54906003)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: C8DBCaXblOBHEfUIwohOl0VWi1VLhsLGHOFP3T1JjAIxCZNf/KbU2fLA3nm8uiG53/+1xQaXgz40JoYQ05KbjMQ8Gtq5HBW12PzZtfwPTKD+I4ATtriWBHBUuMV1x2FT/tew1UUa4U+t2Mrh293Yh356PTghjrYOUTPy3GvsJ5J3yglEBxqoWhNazQiayxf2xoACvTlIcUQCRJJwGsWMt8QHzDcp9VwESpi1NDdGItKgNBgVmEbUtZLNOOIJKAJJkMPqNtzsGGmUpvhX3BXS0blf8gX1sUFORjGrVOc2w5eP6qkbIZVy24+KbGMea5r6uB/7MfASPrrPvZaUeiJIZa5X0QdHmC0p4E6Z9SqeD4si5Iedq2G0nJq0etvkRbVl8TbKEKIx+zbhaExBdgFJ08p2lBYEvcq0Fqe7M7NlSsB7Ao80F549wKCBjOw38FO5MLyovc5TLYdblhxnFVBzyXKoeQc4EjuFyVMsiKmPWQPWoIC032u0pZ9EOr3RGIP4
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: maximintegrated.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbdef38d-8173-4df2-85a0-08d807b174cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2020 11:30:02.0547 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd909df-ea69-4788-a554-f24b7854ad03
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z2APJKQKVhifXvDwe7ZDQ6sxWXc4MaZQlfnPeyokLx5OdX3L2G5yw75VB6buphIKnrktWrlTT5zCLNrb4mZcNWKKUkJHHJvPazy3h858yeM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1726
Cc: "jack.yu@realtek.com" <jack.yu@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "ryan.lee.maxim@gmail.com" <ryan.lee.maxim@gmail.com>,
 "ckeepax@opensource.cirrus.com" <ckeepax@opensource.cirrus.com>,
 Ryan Lee <RyanS.Lee@maximintegrated.com>,
 "steves.lee.maxim@gmail.com" <steves.lee.maxim@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "krzk@kernel.org" <krzk@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "nuno.sa@analog.com" <nuno.sa@analog.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "geert@linux-m68k.org" <geert@linux-m68k.org>,
 "dmurphy@ti.com" <dmurphy@ti.com>,
 "shumingf@realtek.com" <shumingf@realtek.com>,
 "srinivas.kandagatla@linaro.org" <srinivas.kandagatla@linaro.org>,
 "rf@opensource.wolfsonmicro.com" <rf@opensource.wolfsonmicro.com>
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

> -----Original Message-----
> From: Takashi Iwai <tiwai@suse.de>
> Sent: Wednesday, June 3, 2020 8:24 PM
> To: Steve Lee <SteveS.Lee@maximintegrated.com>
> Cc: lgirdwood@gmail.com; broonie@kernel.org; perex@perex.cz;
> tiwai@suse.com; ckeepax@opensource.cirrus.com; geert@linux-m68k.org;
> rf@opensource.wolfsonmicro.com; shumingf@realtek.com;
> srinivas.kandagatla@linaro.org; krzk@kernel.org; dmurphy@ti.com;
> jack.yu@realtek.com; nuno.sa@analog.com; linux-kernel@vger.kernel.org;
> alsa-devel@alsa-project.org; ryan.lee.maxim@gmail.com; Ryan Lee
> <RyanS.Lee@maximintegrated.com>; steves.lee.maxim@gmail.com
> Subject: Re: [PATCH] ASoC: max98390: Fix potential crash during param fw
> loading
>=20
> EXTERNAL EMAIL
>=20
>=20
>=20
> On Wed, 03 Jun 2020 13:18:19 +0200,
> Steve Lee wrote:
> >
> > @@ -847,7 +861,6 @@ static int max98390_probe(struct snd_soc_component
> *component)
> >
> >       /* Dsm Setting */
> >       regmap_write(max98390->regmap, DSM_VOL_CTRL, 0x94);
> > -     regmap_write(max98390->regmap, DSMIG_EN, 0x19);
>=20
> Is this change intentional?
> It wasn't mentioned in the patch description.

 It should be another change. I will re-send the patch.

>=20
>=20
> thanks,
>=20
> Takashi
