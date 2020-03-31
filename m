Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9B4198C68
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Mar 2020 08:37:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E75191666;
	Tue, 31 Mar 2020 08:37:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E75191666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585636677;
	bh=jXAlmLOHvK6EMKgGa2rS40hgsYaQbO3xO7Z5Z15Nfo0=;
	h=From:To:In-Reply-To:Subject:Date:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zb/0Objd1dML9xcQN3OfCATNTerfeyS02LR1+LWCpSjWq+wbGSatnt6yFdTqVQjxa
	 T3PdfB9uL1hNtCaambGxlW7kavZnAb++LVClKzhO/ukzHjNroXZPL/hRW9C/NnThFc
	 E8Expog4hzNrsvkrvvFvJEbu8DGtOUiSZHlLv9qE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ECFCCF8010C;
	Tue, 31 Mar 2020 08:36:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4980AF8010C; Tue, 31 Mar 2020 08:36:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89A49F8010C
 for <alsa-devel@alsa-project.org>; Tue, 31 Mar 2020 08:36:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89A49F8010C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="CWObvILd"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20200331063601epoutp04320fe5859113b554ffb47f919b28eefb~BUA0g3fBH2453924539epoutp04u
 for <alsa-devel@alsa-project.org>; Tue, 31 Mar 2020 06:36:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20200331063601epoutp04320fe5859113b554ffb47f919b28eefb~BUA0g3fBH2453924539epoutp04u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1585636561;
 bh=jXAlmLOHvK6EMKgGa2rS40hgsYaQbO3xO7Z5Z15Nfo0=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=CWObvILdPcxJhfjM61wf3d7pvvFXtshMuQgTTe7fIaPcFwwCbdp3/YyXr/8MdY1s6
 n711jBgHhYrnCX6MDV0Euzt7WJMMdUyvi37k1Dw/J9bNySdSYXcNt+DF9Giocg2m+J
 cstpQU8tHxpfDxggmz9AuZHvi5XtKwYBPT+p9F3s=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas2p3.samsung.com (KnoxPortal) with ESMTP id
 20200331063600epcas2p3f8c636ba3f840e09d6a94bc2cf17e5de~BUA0HeiM72345723457epcas2p3P;
 Tue, 31 Mar 2020 06:36:00 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.40.187]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 48s02l2FX1zMqYkx; Tue, 31 Mar
 2020 06:35:59 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
 epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 52.35.04142.FC4E28E5; Tue, 31 Mar 2020 15:35:59 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
 20200331063558epcas2p4b4e462c69e2f92befe235e236c213d64~BUAx0t44I1499314993epcas2p4B;
 Tue, 31 Mar 2020 06:35:58 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200331063558epsmtrp1f4b98601c9f72968eb68588bbe8dd911~BUAxrBkrs0892608926epsmtrp12;
 Tue, 31 Mar 2020 06:35:58 +0000 (GMT)
X-AuditID: b6c32a46-3f9ff7000000102e-6c-5e82e4cf9c78
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 80.75.04158.DC4E28E5; Tue, 31 Mar 2020 15:35:58 +0900 (KST)
Received: from KORDO025540 (unknown [12.36.182.130]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20200331063557epsmtip1661c683709b77e559e800f0bd27fc4aa~BUAxhL8JK0518805188epsmtip12;
 Tue, 31 Mar 2020 06:35:57 +0000 (GMT)
From: =?ks_c_5601-1987?B?wMyw5sXD?= <gt82.lee@samsung.com>
To: "'Lars-Peter Clausen'" <lars@metafoo.de>, <broonie@kernel.org>
In-Reply-To: <b76d4955-94d3-5a75-d01f-5cb9ab47d6a7@metafoo.de>
Subject: RE: [PATCH 1/3] ASoC: dapm: connect virtual mux with default value
Date: Tue, 31 Mar 2020 15:35:57 +0900
Message-ID: <011701d60726$a309abc0$e91d0340$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: ko
Thread-Index: AQHT5UBTKtX+5pznRWgpVI/NXVAXlgFfQZWpAm/nJ0QBJMi3+6g+2KJg
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTYRjmO2eeHavFaVq96Y/GiX5UaDur2XE1ESsZKCQWBF20wzw4adtZ
 O1O6oybidGTlhZqXFa6bozRZYUX92OxmmVl2MZIu2MWyogtWVNLmWbB/z/e8zwPP834viSs7
 iASyyOrg7VbOTBNTZBeCC9ik/pHyPLX3MckODgQwtuHlCMEevlAjY711nhh2fLAKY68NtGFs
 548ziO0pq8fSSUPnt3LCcNE9LDd0tTsJg3csEGPY729Hhg7/Q1kOscG8wsRzBbxdxVuNQkGR
 tVBPZ63NX5mvTVEzSUwqu4xWWTkLr6dXZeckZRaZQ4loVQlnLg5ROZwo0ovTVtiFYgevMgmi
 Q0/ztgKzjWFsySJnEYuthclGwaJj1GqNNqTcYjb98YwjW0/c9tHGpaXop7IaxZJALYXa+21Y
 NZpCKqluBJf7T8ulx1cEX35VENJjHIH72w/sv6XhyWU8jJXUFQS3BxIl0SiCjufukJ0kCUoH
 rho6rImnMsD1thWFNTh1CMH5sncoPIil0uDN33E8rI+jsuBjgyVMy6j50HfyuSyMFVQqnAx+
 JSQ8A24dGZnkcUoDXp8Hk/AiOHHsAy5lU8Gv1ydiJD4empyVuJQhE24OX5msCdRvAmqv35FJ
 hlXQNHaVkHAcvL/hl0s4AUZrK+WSYR+CT31/IoN6BM6ayPKWgL+lFwsXAGoe9DyNhJsOVcG/
 colWQFVlRE3Dud6JiBqgtVN+ANHuqGbuqGbuqGbuqDZHkawdzeJtoqWQFzU2TfRfd6HJY12Y
 2Y28d7MDiCIRPU3x4mFZnjKGKxF3WAIISJyOVxBrSvOUigJux07eLuTbi828GEDa0OYP4gkz
 jULo9K2OfEarSUlRp2pZbYqGpWcruqYObVJShZyD38rzNt7+34eRsQmlKPh2T2/mYHXqdtf5
 6S2K9Dn6uWzFWNa674Krrs6YUb3oEmx8tavKJ1/u84tn9xofuJ7Nyhix3Qvyzvqpu5oX55rQ
 RsvyR3TAc1znYzaZkmYPHRI/f5/oNgQndrufNl/Kbby9bag8UXD2MVh5su6F8ZGgi+0fbO1b
 f2o1oy/ZTMtEE8csxO0i9w/gxkURwgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFIsWRmVeSWpSXmKPExsWy7bCSnO65J01xBgv2MlpcuXiIyWLqwyds
 FjO2dbNYLJk8n9Xi25UOJoujFxczWWz4vpbR4kjjFCYHDo8Nn5vYPHbOusvusWlVJ5vHkjeH
 WD36tqxi9Fi/5SpLAFsUl01Kak5mWWqRvl0CV8aDp//YCzbyVry81sPSwHiSq4uRk0NCwERi
 6o3dzF2MXBxCArsZJfZ96GCBSEhIfJh/hh3CFpa433KEFaLoOaPEjHlXgBIcHGwCVhI93Uog
 NSICLhJPJ60Fq2cWmMUocbZFDqL+NaNEz/MlbCAJTgE7iWd/vzGD9AoLeEu8nZoLEmYRUJU4
 u/w+2F5eAUuJ5Yc/sUHYghInZz5hgZhpItF4uBvK1pZYtvA1M8RtChI/ny5jhYiLSMzubGOG
 uMdN4sTdvUwTGIVnIRk1C8moWUhGzULSvoCRZRWjZGpBcW56brFhgVFearlecWJucWleul5y
 fu4mRnCMaWntYDxxIv4QowAHoxIP74OrjXFCrIllxZW5hxglOJiVRHjZ/BvihHhTEiurUovy
 44tKc1KLDzFKc7AoifPK5x+LFBJITyxJzU5NLUgtgskycXBKNTC2q1/7bpDN0h2z7/p9tivn
 VPUOv+VIWsnakbrsZKXXE/0rycePT162pIvhhYRt9ekl3zksOiUeBhgfc0yMvfpL+OK2Yjl3
 Xt3NDKdVfXd9iHuzjKfHMu2kVnrlwvkrbtb5hCmtz74peSi59Ziptoace4jAZTX5EMYDPwOd
 Nsat3r6LZ672sWglluKMREMt5qLiRACupdyyrQIAAA==
X-CMS-MailID: 20200331063558epcas2p4b4e462c69e2f92befe235e236c213d64
X-Msg-Generator: CA
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200330073548epcas2p3045be9d3c8b76115c76ce27679840b6f
References: <CGME20200330073548epcas2p3045be9d3c8b76115c76ce27679840b6f@epcas2p3.samsung.com>
 <000e01d60665$d48444b0$7d8cce10$@samsung.com>
 <010901d6071f$1f299dd0$5d7cd970$@samsung.com>
 <b76d4955-94d3-5a75-d01f-5cb9ab47d6a7@metafoo.de>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, tiwai@suse.com,
 hmseo@samsung.com, tkjung@samsung.com, pilsun.jang@samsung.com
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

On 3/31/20 7:55 AM, Lars-Peter Clausen wrote:
>On 3/31/20 7:42 AM, =C0=CC=B0=E6=C5=C3=20wrote:=0D=0A>>=20Since=20a=20virt=
ual=20mixer=20has=20no=20backing=20registers=20to=20decide=20which=20path=
=20to=20=0D=0A>>=20connect,=20it=20will=20try=20to=20match=20with=20initial=
=20value=200.=0D=0A>>=20This=20is=20to=20ensure=20that=20the=20default=20mi=
xer=20choice=20will=20be=20correctly=20=0D=0A>>=20powered=20up=20during=20i=
nitialization.=0D=0A>>=0D=0A>>=20Signed-off-by:=20Gyeongtaek=20Lee=20<gt82.=
lee=40samsung.com>=0D=0A>>=20---=0D=0A>>=20=20=20sound/soc/soc-dapm.c=20=7C=
=2011=20++++++++++-=0D=0A>>=20=20=201=20file=20changed,=2010=20insertions(+=
),=201=20deletion(-)=0D=0A>>=0D=0A>>=20diff=20--git=20a/sound/soc/soc-dapm.=
c=20b/sound/soc/soc-dapm.c=20index=0D=0A>>=209fb54e6fe254..fc55a0534252=201=
00644=0D=0A>>=20---=20a/sound/soc/soc-dapm.c=0D=0A>>=20+++=20b/sound/soc/so=
c-dapm.c=0D=0A>>=20=40=40=20-802,7=20+802,16=20=40=40=20static=20void=20dap=
m_set_mixer_path_status(struct=20=0D=0A>>=20snd_soc_dapm_path=20*p,=20int=
=20i,=0D=0A>>=20=20=20=09=09=09val=20=3D=20max=20-=20val;=0D=0A>>=20=20=20=
=09=09p->connect=20=3D=20=21=21val;=0D=0A>>=20=20=20=09=7D=20else=20=7B=0D=
=0A>>=20-=09=09p->connect=20=3D=200;=0D=0A>>=20+=09=09/*=20since=20a=20virt=
ual=20mixer=20has=20no=20backing=20registers=20to=0D=0A>>=20+=09=09=20*=20d=
ecide=20which=20path=20to=20connect,=20it=20will=20try=20to=20match=0D=0A>>=
=20+=09=09=20*=20with=20initial=20value=200.=20=20This=20is=20to=20ensure=
=0D=0A>>=20+=09=09=20*=20that=20the=20default=20mixer=20choice=20will=20be=
=0D=0A>>=20+=09=09=20*=20correctly=20powered=20up=20during=20initialization=
.=0D=0A>>=20+=09=09=20*/=0D=0A>>=20+=09=09val=20=3D=200;=0D=0A>>=20+=09=09i=
f=20(invert)=0D=0A>>=20+=09=09=09val=20=3D=20max=20-=20val;=0D=0A>>=20+=09=
=09p->connect=20=3D=20=21=21val;=0D=0A>Do=20you=20have=20virtual=20mixers=
=20that=20have=20the=20inverted=20flag=20set=20and=20if=20yes=20why?=20Caus=
e=20otherwise=20this=20is=20exactly=20the=20same=20as=20before.=0D=0AYes,=
=20I=20have=20virtual=20mixers=20with=20inverted=20flag.=0D=0AIt=20is=20use=
d=20to=20create=20a=20switch=20which=20is=20connected=20by=20default=20and=
=20can=20be=20disconnected=20when=20user=20application=20needs=20it.=0D=0AA=
ctually=20hardware=20can't=20be=20disconnected=20by=20virtual=20switch.=0D=
=0ASo,=20connected=20was=20better=20for=20default=20value=20for=20virtual=
=20mixers=20in=20my=20experience.=0D=0A=0D=0A=0D=0A
