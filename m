Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B3D1ECE8D
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jun 2020 13:39:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 769801664;
	Wed,  3 Jun 2020 13:38:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 769801664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591184380;
	bh=F3wT3h5cR6epYb48yIRsl2puVGFJpsDvDbK0WyKTEl8=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DQVqpqz6Y7DymCAlSwZr/sPyIG2CMyKbNuSOBtcpZqrcQmHzYLPnk6RqnI002dfKN
	 fpWYy4xTT6vfkUkBMe4r2OX6RaG+9oWWja0cXkNHjWmwgs/e2nNWdBwFTANdHO4sxE
	 0FfSHDMRYQ1sMsfA/gv1q4YQV0p7s/Lq5XvJJRvk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0C37F801F5;
	Wed,  3 Jun 2020 13:37:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E031FF801ED; Wed,  3 Jun 2020 13:37:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680110.outbound.protection.outlook.com [40.107.68.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2594AF800BC
 for <alsa-devel@alsa-project.org>; Wed,  3 Jun 2020 13:37:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2594AF800BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=maximintegrated.onmicrosoft.com
 header.i=@maximintegrated.onmicrosoft.com header.b="bCB/P1BV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bM6LScYA03zgCrDFDjDg7yQeIDUMpl0yGWIeKHFS2uyUqZ221xo90rwb0196qSpk5j0gwfPY3rHGoRy4jhbHGYHRMgzySG7RxywQn03uqOEHn+lSA+b89khiU729PcgNMHK8s3egkoTuyZr6GBXhnPX3tFpKTq2OfdtLAa10kcfam5zaH60cg7PwKdqWNhftVOiEQbtruHwHnA9uoBg+Vv5nn97ggWTl5PcfSnqbaHv/hwmPX/+9L/ccwHVKL+FX/pDwVL6zgYkv2BphR1oABaB18bkRwD8MOsWQLlNpJRoGd8mqjc3qxf14TbBtPneeFtAfshnnI0WIGVgi7j5ifw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w5ix0Af7wIF4fJ31qvEaMntMH1NmpvD+udCa978Lx7M=;
 b=JDQvxVRv+EvVCNHI2+XPuieIOTojkSXW3GFFwxk2LvqA6p/qSJZsuAt+wdZ7kZ/RGneDcQTdE4finYw4XFiKVuNsIzilB2ENMoxGQVUCfR/lgDsc1JnMtoqf6n9pTNaHqK/aDrnAYos2R57B4uWBFAMGHWjqcUMxxvJS8u0DDRy1rjTALbVpXmQpTnkwoCfXBxetSbJ2w/8/6bvD8PtdeVV2NpNNe/qmT8nH45DswCBJDVkWI3sfcD38naWnPKLzA1c+O7wEWQoyxLcmhvCV92SGB3GnhMz2D7KphKFHkWT8L4wdMxUlbfe2EC+WlQuqzssXBteY3ghFKURg6lswPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=maximintegrated.com; dmarc=pass action=none
 header.from=maximintegrated.com; dkim=pass header.d=maximintegrated.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=maximintegrated.onmicrosoft.com;
 s=selector2-maximintegrated-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w5ix0Af7wIF4fJ31qvEaMntMH1NmpvD+udCa978Lx7M=;
 b=bCB/P1BV2iGAWaGs7u9uleMFRHpWDkXVxKB4tmFApbyLjkrtV0xSRx0/40NOC7bSxzp838s6qTEdorRkf6bk+4yZVOqVC8iYZP60Lj5AklgQ6jUr8+Bos2q3RKjLZiLq+JQ385u0/vSI2S6nDZEvI55aWCWnlzv9/dXtDX0bHLg=
Received: from MWHPR11MB2047.namprd11.prod.outlook.com (2603:10b6:300:2a::12)
 by MWHPR11MB1485.namprd11.prod.outlook.com (2603:10b6:301:d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19; Wed, 3 Jun
 2020 11:37:45 +0000
Received: from MWHPR11MB2047.namprd11.prod.outlook.com
 ([fe80::994e:6a48:f660:f363]) by MWHPR11MB2047.namprd11.prod.outlook.com
 ([fe80::994e:6a48:f660:f363%5]) with mapi id 15.20.3066.018; Wed, 3 Jun 2020
 11:37:45 +0000
From: Steve Lee <SteveS.Lee@maximintegrated.com>
To: Mark Brown <broonie@kernel.org>
Subject: RE: [PATCH] ASoC: max98390: Fix potential crash during param fw
 loading
Thread-Topic: [PATCH] ASoC: max98390: Fix potential crash during param fw
 loading
Thread-Index: AQHWOZjok5hm+3ydWEypvnQMZosX1ajGwe2AgAABq6A=
Date: Wed, 3 Jun 2020 11:37:44 +0000
Message-ID: <MWHPR11MB2047B58F4B5E395CB76CCB2392880@MWHPR11MB2047.namprd11.prod.outlook.com>
References: <20200603111819.5824-1-steves.lee@maximintegrated.com>
 <20200603113145.GC5327@sirena.org.uk>
In-Reply-To: <20200603113145.GC5327@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none
 header.from=maximintegrated.com;
x-originating-ip: [211.35.184.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2d87ae0c-7d11-47f9-4f9f-08d807b288b3
x-ms-traffictypediagnostic: MWHPR11MB1485:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB1485859259DCE08049E35E5892880@MWHPR11MB1485.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 04238CD941
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ysbT71dBRbPOejGim9u/87pBS3dqlvGu7oseAImp1Go2LyVfLJBha1+1Cphtwy2ubHldBIcHvq2AKVLERvQnK0K7HcK07fPkpycQnosuQTTvePCV9/c4OgZhz4dpdE1QuEMlaLr7LGWuN54uqDAMY+ocqB3lLfYWNrLm1MvU7JxsMcPKvXRD/ZpOih+qLWFybLsJtgaZVJzWRWyaMiFJTmJB4VbsTdicB9BV7jHkHXjDFyH7EBmgvIbwAQFpZN3K7QL8JslG1+6LfyXU4EI/gAneDZw009748K8yjrxJy6kY7PptVX8hsbzJU+X447QU4H50PO4c30sjD12cpU0TkQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB2047.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(136003)(346002)(376002)(39860400002)(366004)(8936002)(6916009)(4326008)(7416002)(8676002)(33656002)(316002)(54906003)(71200400001)(86362001)(52536014)(5660300002)(76116006)(64756008)(26005)(9686003)(186003)(2906002)(66946007)(66476007)(478600001)(55016002)(66446008)(6506007)(53546011)(7696005)(83380400001)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: FXAaoZA7k4D2M9InBCzjLx3zotHGWLe4oMcwRhD6VpNqQAmfY3rvYiNMZ7e4rJ0qiBkMYwmz7Xp1kuyqiCvUPQg4InTDghdpZIYZsv/Ujd35+q3FYP8XGG1K1F8Z6WkC3OO9xNrqHLtCbZgOYxtURrEelj+mnC4dxXINQc+9T3wMo396e3D+NIkTGSkAm9GROTJ+ZbJkqX7ehnc6U1XWPcGdK1XEq4sCT9rrjgMklvm4FfiQMF18/VwA6I8aUlA8+ltgmeQ7KpBfoOm5YWtRmTflizPGihMN54gJXO4EU8uHkjuqC9tjSGddJtjx5i6sSnEhfO0bNEKX6DNHypnaAkdHS7FNm809oSkilqZuewHY3BlnuDRWwov4f+OZPxl8QpMnSSrsFhVnW+dAPoxDc0/UFgJOggqyxDA004H481v7GO1ANwOlvk/foZ0D1ae9ghwh2APwtJfCJGkWf8D+gOoshj0heBZxR60SdA2Yc+LZLQfayDcHvuP/ojGEmOpF
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: maximintegrated.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d87ae0c-7d11-47f9-4f9f-08d807b288b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2020 11:37:45.0071 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd909df-ea69-4788-a554-f24b7854ad03
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TDh7p4GiZolNM/3QkQr3VeFLcFDKht3BHZx/ReypQVMPjeyDg4tmhPg75atrT64UjKmdLC7fKSCFvmhuTr2IEYk4HJvTgrPFz9Hq5wfeQ4k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1485
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
> From: Mark Brown <broonie@kernel.org>
> Sent: Wednesday, June 3, 2020 8:32 PM
> To: Steve Lee <SteveS.Lee@maximintegrated.com>
> Cc: lgirdwood@gmail.com; perex@perex.cz; tiwai@suse.com;
> ckeepax@opensource.cirrus.com; geert@linux-m68k.org;
> rf@opensource.wolfsonmicro.com; shumingf@realtek.com;
> srinivas.kandagatla@linaro.org; krzk@kernel.org; dmurphy@ti.com;
> jack.yu@realtek.com; nuno.sa@analog.com; linux-kernel@vger.kernel.org;
> alsa-devel@alsa-project.org; ryan.lee.maxim@gmail.com; Ryan Lee
> <RyanS.Lee@maximintegrated.com>; steves.lee.maxim@gmail.com
> Subject: Re: [PATCH] ASoC: max98390: Fix potential crash during param fw
> loading
>=20
> On Wed, Jun 03, 2020 at 08:18:19PM +0900, Steve Lee wrote:
>=20
> > +	param_start_addr =3D (dsm_param[0] & 0xff) | (dsm_param[1] & 0xff) <<
> 8;
> > +	param_size =3D (dsm_param[2] & 0xff) | (dsm_param[3] & 0xff) << 8;
> > +	if (param_size > MAX98390_DSM_PARAM_MAX_SIZE ||
> > +		param_start_addr < DSM_STBASS_HPF_B0_BYTE0) {
> > +		dev_err(component->dev,
> > +			"param fw is invalid.\n");
> > +		goto err_alloc;
> > +	}
>=20
> This is now reading the size out of the header of the file which is good =
but it
> should also validate that the file is big enough to have this much data i=
n it,
> otherwise it's possible to read beyond the end of the firmware file (eg, =
if it got
> truncated somehow).  Previously the code used the size of the file read f=
rom disk
> so that wasn't an issue.

 Thanks for quick comment. Can this case cover by below line?
+	if (fw->size < MAX98390_DSM_PARAM_MIN_SIZE) {
+		dev_err(component->dev,
+			"param fw is invalid.\n");
+		goto err_alloc;
+	}
=20
