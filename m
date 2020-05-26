Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1621E2681
	for <lists+alsa-devel@lfdr.de>; Tue, 26 May 2020 18:07:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F9621759;
	Tue, 26 May 2020 18:07:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F9621759
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590509277;
	bh=xI+PVp/LpKRT4FzzU9cQkQrWVpPGqdjJetfOZSyHJOQ=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RA+Wz4Pn4UkXsT0dnc1Lt8skD1tX28fLR4D1x7S7/WLuZo3xyCYf5rjg73xMf9hGc
	 UgFxxdhzLXzUgv0FDADVfIh/9CDXZ+XCl6v4aV/xevqQn4gy4NrtbhQn5+6Xb8+76X
	 WBgTvSCd4MlzftpsZn23qxXuDaMjP96r33pGDJoM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5636F8015C;
	Tue, 26 May 2020 18:06:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 452B0F80150; Tue, 26 May 2020 18:06:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2137.outbound.protection.outlook.com [40.107.220.137])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C205F80131
 for <alsa-devel@alsa-project.org>; Tue, 26 May 2020 18:06:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C205F80131
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=northeastern.edu header.i=@northeastern.edu
 header.b="c1OVKVrC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z/iYPvxMdeGd9qui/5pxDQMZPEYcN4EUNCJ0rBiVUkSMz6uunI3PFRWrAinAGrXnaYTDpaov3amQI8TYiUyO4YmAR5mBUwRVZk58DNOj2pR3qRuOP92Rl7fheeimVoVg4ksPkxt/8DSjNqQ+6FmRmxE2bBP7ypvpivj4GEarDMlu5i+3Pin8WtO3TvnHPTW8o4bfxzXy5t+m/3tNO85O6vWa0yr1hrYE0oh3KXA7oITjcaAHi7NZhWVDi2E1zzjvrU1yF4XN2gk7+S1cwQWrPgEw6+x5vtwBqtGKiu6wndigfrrsikUHb0B15AhE9cCtkg8X8lBGb/RvqtmF6J1bOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ng5g/gSdRtVGN9s89ut8hzRp3qbI+CGG9FAcNiZJmX8=;
 b=OJVmTmyJXC1uY9LgMgvzJ9oh17qrzzaVjzEYEfqjsCX8tLVFajY8XrH8kp8C5uGtJNeMVD3RgRlLbOJr7s7IjIlriW6qpYBDWYSRNf9BfLTfBMegs+9Jum5z3dmfiZrSaTz2chJLgAPS4UEta4TLuOmbeqnosq7kJfwdko3CXilZNMwcRaM7UZN67D6CvOan5LoT9dY+BAdqwrxYC+UDhSAhzNbJKs7ROiBO8+LeRpAD2YBHr9h3r6Z4I3lVTXw0TxZ1GbnSOChOgQE62tOLFKJTFakFnA+SBEg6BNfXLjr/WY6u3I1drytDUUpCvYbGHvIHkZZ7cJ1Gfk6bL7TTng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=northeastern.edu; dmarc=pass action=none
 header.from=northeastern.edu; dkim=pass header.d=northeastern.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=northeastern.edu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ng5g/gSdRtVGN9s89ut8hzRp3qbI+CGG9FAcNiZJmX8=;
 b=c1OVKVrCsQ856b5vu2kZFRVYiaEzaXAK0FtlmCRit87B56hfAWMddFzW/grvMsjfAq/EhCd9hR/R3LAVIA2KYy+6e2QeG0PPcAj6dNaeRZ8wn8I9vEuFViepl5TGDgbT8PZoddHQoy35geWqmKce2q4LZvmQwCt2I4Zi2oaLD/4=
Received: from BL0PR06MB4548.namprd06.prod.outlook.com (2603:10b6:208:56::26)
 by BL0PR06MB4500.namprd06.prod.outlook.com (2603:10b6:208:52::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Tue, 26 May
 2020 16:06:02 +0000
Received: from BL0PR06MB4548.namprd06.prod.outlook.com
 ([fe80::fd87:3891:70a2:bc5d]) by BL0PR06MB4548.namprd06.prod.outlook.com
 ([fe80::fd87:3891:70a2:bc5d%3]) with mapi id 15.20.3021.029; Tue, 26 May 2020
 16:06:02 +0000
From: Changming Liu <liu.changm@northeastern.edu>
To: Takashi Iwai <tiwai@suse.de>
Subject: RE: [PATCH] ALSA: hwdep: fix a left shifting 1 by 31 UB bug
Thread-Topic: [PATCH] ALSA: hwdep: fix a left shifting 1 by 31 UB bug
Thread-Index: AdYy9F48QYRXqNjTTWulqJQ/P/wZiQAMZrcAABQkmzA=
Date: Tue, 26 May 2020 16:06:02 +0000
Message-ID: <BL0PR06MB4548B6B3A1109920AAC7422CE5B00@BL0PR06MB4548.namprd06.prod.outlook.com>
References: <BL0PR06MB4548170B842CB055C9AF695DE5B00@BL0PR06MB4548.namprd06.prod.outlook.com>
 <s5ha71vtdv7.wl-tiwai@suse.de>
In-Reply-To: <s5ha71vtdv7.wl-tiwai@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=northeastern.edu;
x-originating-ip: [128.227.216.118]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 613ac0ea-0d80-49e6-2fa9-08d8018eb00b
x-ms-traffictypediagnostic: BL0PR06MB4500:
x-microsoft-antispam-prvs: <BL0PR06MB4500FEF2B1FA42DD69EDF0BFE5B00@BL0PR06MB4500.namprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 041517DFAB
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CxAWoDzSHErcNe64FETgugIKYkUsfWccnuz1Rjf7jZ4aR7X/4DwN6FRNkh0cvvBMGD2C8X/75j0V2j379i6tfsL/raKLfli9N/E7tMW8FlrD43YmzAXBowORYUhQ+7UgqkcUxk/iuQkOsIltNydRKpLUsgfeTDtSYtH1E6HM8wLvJmMDvdoAGolvAgCNuREgTgDAYE/JXVZOv3LbO32FwpF8KIl8/7LA/Z0HlBdHjiWLkbgk1gUvEXBo5Af7IVSPonoLZ5BUTkuT0u9LpLAEGwUYW6iS2wdi4lO3L8dS0MIuECyCAsMgrpTvGtr7MlRDIcHyQ1XWk3LjpelX/c3l6Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR06MB4548.namprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(376002)(366004)(396003)(39860400002)(346002)(2906002)(8676002)(71200400001)(7696005)(8936002)(55016002)(9686003)(52536014)(4326008)(33656002)(186003)(5660300002)(26005)(316002)(786003)(54906003)(75432002)(66446008)(64756008)(66556008)(76116006)(478600001)(66476007)(66946007)(86362001)(6506007)(53546011)(6916009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: zfEcZIiKm44Dq+q0KzfTswr/0Iusb7hjIKTun4+9LfsR3s80RMCJPzPDSSq+MXhlsaG2qlOIYRsHzBeNSeEO9rG751AHDZeExKLPKuUlufHJ67pMa6biZzhJ4XkirOD+sJqPBg2l4QC3dQgqw47qQYeD+AWxC6UGJHg/SRJ/cET42ndKfhVs46h6/MEJMIUP3rO4t4+6U+bhsxYKwuEh9WAMCJ8McB0NXFXaqEW31ghfw21HpXe1A6XonObXC49GSG+bhmrRxJGjzND2opGjRhguEdMiShV0/EKfavZ3f3oeDuzBljXcf4SDFfM86dYxYGv+aS1A/1Y80JaYQ1cl3ReepyE615Q5aQRfcECVn6rDUVcx1tIymU5uW3jLmIe4VuplX13isV4dgyujLT3SoveW7XktXjHYZOXf+F1Ergw9nHAbCKUBZAbNIZtA+c/Tb3cGI28OKjCyw4HGmnURu/qn3Kuqb4FxKwI3fqwk/b50AuNbzDDHvX6rFcgue9bo
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: northeastern.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 613ac0ea-0d80-49e6-2fa9-08d8018eb00b
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2020 16:06:02.2942 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a8eec281-aaa3-4dae-ac9b-9a398b9215e7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jNmLAs5TdGcib5CEqUi5UQn5l/HUN/LSHjL6NY3NpU4wtEIyZWVdTo1tDDVUNv16qhSscNyNZAumIMo95qVAkqFGb6gU46LKzWXnVzTRHuw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR06MB4500
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
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

> From: Takashi Iwai <tiwai@suse.de>
> Sent: Tuesday, May 26, 2020 2:22 AM
> To: Changming Liu <liu.changm@northeastern.edu>
> Cc: perex@perex.cz; alsa-devel@alsa-project.org
> Subject: Re: [PATCH] ALSA: hwdep: fix a left shifting 1 by 31 UB bug
>=20
> On Tue, 26 May 2020 02:39:21 +0200,
> Changming Liu wrote:
> >
> > The "info.index" variable can be 31 in "1 << info.index".
> > This might trigger an undefined behavior since 1 is signed.
> >
> > Fix this by casting 1 to 1u just to be sure "1u << 31" is defined.
> >
> > Signed-off-by: Changming Liu <liu.changm@northeastern.edu>
>=20
> Thanks for the patch.
>=20
> Unfortunately it seems that your MUA modified in quoted-printable and
> inapplicable with git-am as is.  Since the changes are so small, I
> manually applied it now.
>
I see, thank you very much for pointing out this problem,=20
I'll never use my MUA to send patch again.
Also thank you for this manual modification.=20

> Please fix the setup of your MUA at the next time, or better to try
> git-send-email to submit directly.
>=20
Sorry that I cannot configure my university email to work on git-send-email=
,
I'll use my gmail to send patch via git next time.
=20
> > ---
> >  sound/core/hwdep.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/sound/core/hwdep.c b/sound/core/hwdep.c
> > index b412d3b3d5ff..21edb8ac95eb 100644
> > --- a/sound/core/hwdep.c
> > +++ b/sound/core/hwdep.c
> > @@ -216,12 +216,12 @@ static int snd_hwdep_dsp_load(struct snd_hwdep
> *hw,
> >         if (info.index >=3D 32)
> >                 return -EINVAL;
> >         /* check whether the dsp was already loaded */
> > -       if (hw->dsp_loaded & (1 << info.index))
> > +       if (hw->dsp_loaded & (1u << info.index))
> >                 return -EBUSY;
> >         err =3D hw->ops.dsp_load(hw, &info);
> >         if (err < 0)
> >                 return err;
> > -       hw->dsp_loaded |=3D (1 << info.index);
> > +       hw->dsp_loaded |=3D (1u << info.index);
> >         return 0;
> >  }
> >
> > --
> > 2.17.1
> >
