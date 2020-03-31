Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A9E198CFB
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Mar 2020 09:33:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27C5C166E;
	Tue, 31 Mar 2020 09:32:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27C5C166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585640029;
	bh=PS+z9T1fXuOIKHlQsbxQV+/BfKzNVqyOLaBSJ99qaqc=;
	h=From:To:In-Reply-To:Subject:Date:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M9sfMFfs7dUzuDIKQYzwQCpRs+zpsV3SlGhl4CC3XU1n0WiFSZEwKCY7OnZjhedVz
	 3SXTL2LLNObFisZ0y7ff6XGbcyQGWaMeJdrXOLvb4kTm8oGnhdvHKq7QtsG3MmlFoN
	 /aF4uwNXdO0O0YPaGXvlarWTXNEK626Zp661Cs70=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3EFE7F80140;
	Tue, 31 Mar 2020 09:32:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB71AF80146; Tue, 31 Mar 2020 09:32:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F934F8010D
 for <alsa-devel@alsa-project.org>; Tue, 31 Mar 2020 09:31:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F934F8010D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="EA3LHtcX"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20200331073152epoutp03cf29fab935e3c67e27857855fd04baf4~BUxlc-IdZ1461214612epoutp03e
 for <alsa-devel@alsa-project.org>; Tue, 31 Mar 2020 07:31:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20200331073152epoutp03cf29fab935e3c67e27857855fd04baf4~BUxlc-IdZ1461214612epoutp03e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1585639912;
 bh=PS+z9T1fXuOIKHlQsbxQV+/BfKzNVqyOLaBSJ99qaqc=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=EA3LHtcX+wOPYuoruNi96gSTETibBLf9GaxTODhQALbZblZuvBTFerPAv9y47OmAa
 0uU98531/oOLNUJy8vWY41o13IKQP3y7tlo2FcJXOuuW31uSaDClKU/0gnNj4Vz2CT
 nGrGaJMqLAk/2ITct6EjwV258V/auRGzfzT5euS0=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas2p3.samsung.com (KnoxPortal) with ESMTP id
 20200331073151epcas2p326741d59ca415b6d11294e7f0d81f929~BUxk8YNPI1801018010epcas2p3q;
 Tue, 31 Mar 2020 07:31:51 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.40.189]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 48s1H95n2QzMqYkn; Tue, 31 Mar
 2020 07:31:49 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
 epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 61.32.04024.4E1F28E5; Tue, 31 Mar 2020 16:31:48 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
 20200331073147epcas2p4a6c84e59c1c2666a3fe06aa60952116d~BUxhQoSx20273802738epcas2p4b;
 Tue, 31 Mar 2020 07:31:47 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200331073147epsmtrp1aaf92b54ba9280db7017ebcc5bb0e5bc~BUxhPnPlO0652406524epsmtrp17;
 Tue, 31 Mar 2020 07:31:47 +0000 (GMT)
X-AuditID: b6c32a48-5c1ff70000000fb8-d3-5e82f1e4b58c
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 E8.7A.04158.3E1F28E5; Tue, 31 Mar 2020 16:31:47 +0900 (KST)
Received: from KORDO025540 (unknown [12.36.182.130]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20200331073147epsmtip2efce8ffe095355d7af779bc470be2465~BUxhDMlIr2641426414epsmtip2F;
 Tue, 31 Mar 2020 07:31:47 +0000 (GMT)
From: =?ks_c_5601-1987?B?wMyw5sXD?= <gt82.lee@samsung.com>
To: "'Lars-Peter Clausen'" <lars@metafoo.de>, <broonie@kernel.org>
In-Reply-To: <4e119221-9350-aa43-8f7e-9af664383003@metafoo.de>
Subject: RE: [PATCH 1/3] ASoC: dapm: connect virtual mux with default value
Date: Tue, 31 Mar 2020 16:31:47 +0900
Message-ID: <019a01d6072e$6f88ba90$4e9a2fb0$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: ko
Thread-Index: AQHT5UBTKtX+5pznRWgpVI/NXVAXlgFfQZWpAm/nJ0QBJMi3+wHeqml1AzW2+vWoFk5FQA==
X-Brightmail-Tracker: H4sIAAAAAAAAA01SWUwTURTN60yng1odK+qVD1PHaKKm2FYLgwFjELWKicTtwxjqhL60hG52
 WqP4IaAhZVERwWBFcEFicKFARQTXgqIkGjFogjsR474r7kvbqUn/Ts45971z7ns0oThBxdHZ
 Nhd22ngLSw0jWzunJaoGPxRkqm/6xnJ9vQEJVzkwSHFVrSUkV7e7VsoN9Xkk3OXewxLO9/UE
 4rryKyTzaL3vUwGlP+N9INM3NxRR+rrXAal+h78B6Rv9t8kMao0l2Yx5I3YqsS3Lbsy2mVLY
 9BWG+QZdglqj0iRxiazSxltxCpu2NEO1MNsSTMQqN/AWd5DK4AWBnTk32Wl3u7DSbBdcKSx2
 GC0OjcYRL/BWwW0zxWfZrXM0arVWF3Sus5iLO66TjvYJG6u/vCPy0F0oRjE0MLPhVOMRVIyG
 0QqmDcHncp80JCiYjwjubR8lCkMIrtyrlxQjOjzReyte5M8haHrfIhMHXiBo9JtDHoqZA6Ul
 bIiOZVKh9FlN+AKCKUdwKv85CgkxzFy4eulJ+MwxTDq8qbSGaJKZAjd+fgxnkDNJ4PP8iODR
 cG3vIBnCBKOFumO1EhHPgPqDrwixjBK+P62Xinws7CsqJMQMq6H9cTUVygDMTwr+DG4jxS5p
 cLwpV5wdAy+7/TIRx8GLnYUy0b8VwdvrvyJCBYKiEoWIZ4F/f09kJ5Oh624k20jwdP6WibQc
 PIURNwtNPX8iboAan6wMsd6oYt6oYt6oYt6oMgcQ2YDGYYdgNWFB65gd/dLNKPxVp+vb0MUb
 SwOIoRE7Qv74dn6mQspvEDZZAwhogo2VU8vyMhVyI78pFzvtBqfbgoUA0gUXv4uIG5tlD358
 m8ug0WkTEtRJOk6XoOXY8fLm4f1rFYyJd+EcjB3Y+X9OQsfE5aHz50ienHq6ptM9sKjj1cvD
 /b83l1bFXOkrWFDdVVZwlDGlpcKyvvT7LVO3rFxUJy3rGfLvScbrK1WlioPOxNblA3f2eU52
 jW5R/j2dPCX1Q3x5ToWqY5K+bWf9Er6qP61dLbfiPRNHda88aya6yVUXcr49KrGnGw4tHhqf
 u3vVQyNLCmZeM51wCvw/XdkU+MADAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRmVeSWpSXmKPExsWy7bCSvO7jj01xBms2K1tcuXiIyWLqwyds
 FjO2dbNYLJk8n9Xi25UOJoujFxczWWz4vpbR4kjjFCYHDo8Nn5vYPHbOusvusWlVJ5vHkjeH
 WD36tqxi9Fi/5SpLAFsUl01Kak5mWWqRvl0CV8aF05PZCk4JVuyZe4a1gfE3bxcjB4eEgInE
 xUt6XYycHEICuxklfv+wAbElBCQkPsw/ww5hC0vcbznCClHznFHi9gl1kFY2ASuJnm4lkLCI
 gIvE00lrwcqZBWYxSpxtketi5AIqP80kcax1PjNIglPATuLEwcdMIL3CAt4Sb6fmgoRZBFQl
 zv3+BDaeV8BSYkPHLyhbUOLkzCcsEDNNJBoPd0PZ2hLLFr5mhjhNQeLn02WsEHERidmdbcwQ
 94RJ7Howh20Co/AsJKNmIRk1C8moWUjaFzCyrGKUTC0ozk3PLTYsMMpLLdcrTswtLs1L10vO
 z93ECI4uLa0djCdOxB9iFOBgVOLhfXC1MU6INbGsuDL3EKMEB7OSCC+bf0OcEG9KYmVValF+
 fFFpTmrxIUZpDhYlcV75/GORQgLpiSWp2ampBalFMFkmDk6pBsawC0f2P+W13fhgJ7f65Yqu
 huQ78y8aO58OMNZ1Ynoi2Xt5Q2Fsof8zzV9rPn3cPk389OWOBlHfmUvqw33n/Cyr1l/uyOFe
 H9XREllRFVTp6MGlGnb3omzw/veL73Uyn3rklbPt4TupUI4G74vaE+qfCjhv3/avwfSUvvnk
 A87uk91Wf1eLZFRiKc5INNRiLipOBACN2FALqgIAAA==
X-CMS-MailID: 20200331073147epcas2p4a6c84e59c1c2666a3fe06aa60952116d
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
 <011701d60726$a309abc0$e91d0340$@samsung.com>
 <4e119221-9350-aa43-8f7e-9af664383003@metafoo.de>
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

On 3/31/20 9:10 AM, Lars-Peter Clausen wrote:
>On 3/31/20 8:35 AM, =C0=CC=B0=E6=C5=C3=20wrote:=0D=0A>>=20On=203/31/20=207=
:55=20AM,=20Lars-Peter=20Clausen=20wrote:=0D=0A>>>=20On=203/31/20=207:42=20=
AM,=20=C0=CC=B0=E6=C5=C3=20wrote:=0D=0A>>>>=20Since=20a=20virtual=20mixer=
=20has=20no=20backing=20registers=20to=20decide=20which=20path=20to=0D=0A>>=
>>=20connect,=20it=20will=20try=20to=20match=20with=20initial=20value=200.=
=0D=0A>>>>=20This=20is=20to=20ensure=20that=20the=20default=20mixer=20choic=
e=20will=20be=20correctly=0D=0A>>>>=20powered=20up=20during=20initializatio=
n.=0D=0A>>>>=0D=0A>>>>=20Signed-off-by:=20Gyeongtaek=20Lee=20<gt82.lee=40sa=
msung.com>=0D=0A>>>>=20---=0D=0A>>>>=20=20=20=20sound/soc/soc-dapm.c=20=7C=
=2011=20++++++++++-=0D=0A>>>>=20=20=20=201=20file=20changed,=2010=20inserti=
ons(+),=201=20deletion(-)=0D=0A>>>>=0D=0A>>>>=20diff=20--git=20a/sound/soc/=
soc-dapm.c=20b/sound/soc/soc-dapm.c=20index=0D=0A>>>>=209fb54e6fe254..fc55a=
0534252=20100644=0D=0A>>>>=20---=20a/sound/soc/soc-dapm.c=0D=0A>>>>=20+++=
=20b/sound/soc/soc-dapm.c=0D=0A>>>>=20=40=40=20-802,7=20+802,16=20=40=40=20=
static=20void=20dapm_set_mixer_path_status(struct=0D=0A>>>>=20snd_soc_dapm_=
path=20*p,=20int=20i,=0D=0A>>>>=20=20=20=20=09=09=09val=20=3D=20max=20-=20v=
al;=0D=0A>>>>=20=20=20=20=09=09p->connect=20=3D=20=21=21val;=0D=0A>>>>=20=
=20=20=20=09=7D=20else=20=7B=0D=0A>>>>=20-=09=09p->connect=20=3D=200;=0D=0A=
>>>>=20+=09=09/*=20since=20a=20virtual=20mixer=20has=20no=20backing=20regis=
ters=20to=0D=0A>>>>=20+=09=09=20*=20decide=20which=20path=20to=20connect,=
=20it=20will=20try=20to=20match=0D=0A>>>>=20+=09=09=20*=20with=20initial=20=
value=200.=20=20This=20is=20to=20ensure=0D=0A>>>>=20+=09=09=20*=20that=20th=
e=20default=20mixer=20choice=20will=20be=0D=0A>>>>=20+=09=09=20*=20correctl=
y=20powered=20up=20during=20initialization.=0D=0A>>>>=20+=09=09=20*/=0D=0A>=
>>>=20+=09=09val=20=3D=200;=0D=0A>>>>=20+=09=09if=20(invert)=0D=0A>>>>=20+=
=09=09=09val=20=3D=20max=20-=20val;=0D=0A>>>>=20+=09=09p->connect=20=3D=20=
=21=21val;=0D=0A>>>=20Do=20you=20have=20virtual=20mixers=20that=20have=20th=
e=20inverted=20flag=20set=20and=20if=20yes=20why?=20Cause=20otherwise=20thi=
s=20is=20exactly=20the=20same=20as=20before.=0D=0A>>=20Yes,=20I=20have=20vi=
rtual=20mixers=20with=20inverted=20flag.=0D=0A>>=20It=20is=20used=20to=20cr=
eate=20a=20switch=20which=20is=20connected=20by=20default=20and=20can=20be=
=20disconnected=20when=20user=20application=20needs=20it.=0D=0A>>=20Actuall=
y=20hardware=20can't=20be=20disconnected=20by=20virtual=20switch.=0D=0A>>=
=20So,=20connected=20was=20better=20for=20default=20value=20for=20virtual=
=20mixers=20in=20my=20experience.=0D=0A>=0D=0A>It=20would=20be=20good=20to=
=20mention=20this=20in=20the=20commit=20message,=20that=20the=20purpose=20=
=0D=0A>of=20the=20patch=20is=20to=20allow=20virtual=20mixers=20with=20a=20d=
efault=20state=20of=20on.=0D=0A>=0D=0A>I=20think=20you=20can=20also=20simpl=
ify=20the=20expression=20to=20just=20=60p->connect=20=3D=20invert;=60=0D=0A=
>=0D=0AOk.=20I'll=20resend=20this=20patch=20with=20the=20purpose=20in=20com=
mit=20message,=20and=20simplified=20code.=0D=0AThank=20you=20for=20your=20q=
uick=20response=21=0D=0A=0D=0A
