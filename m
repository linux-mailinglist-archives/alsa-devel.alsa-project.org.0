Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4301989AE
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Mar 2020 03:56:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4A7F166D;
	Tue, 31 Mar 2020 03:56:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4A7F166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585619813;
	bh=QPm0T/U/09L+W4RB5PhvwJNrS0JsBVDpYybSJ21sI14=;
	h=From:To:In-Reply-To:Subject:Date:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KrliTCLT2zE+GTmeRwiPoSLkUM2qyvHBU3jB2R74X2H3aonp898VNdIQelRqXrXux
	 G6aCyUesEkmGhSpdGRcH7TOaaPLBNZiK1oobY6moRpPmVJXecVrcO9YTrNAw7wODIl
	 wNLEkvbAGgr4Vf6XYL811sYT4eiwoW8TOGbzzfQk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DEA54F8014F;
	Tue, 31 Mar 2020 03:55:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81AA9F80146; Tue, 31 Mar 2020 03:55:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB90AF8010D
 for <alsa-devel@alsa-project.org>; Tue, 31 Mar 2020 03:55:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB90AF8010D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="NIZiSATo"
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20200331015457epoutp0319bdfd7ce71b7a2adc3d7a414df396f0~BQLav9Dq70322803228epoutp03V
 for <alsa-devel@alsa-project.org>; Tue, 31 Mar 2020 01:54:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20200331015457epoutp0319bdfd7ce71b7a2adc3d7a414df396f0~BQLav9Dq70322803228epoutp03V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1585619697;
 bh=DWfa1PXMxg50sEu843d9dpU6xaQtuy/M4A8TfzMOq+Y=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=NIZiSAToocDp5OXJPosbGJ/NXVsb8v66zEbKcAoQmndCxcQRW7ucf65NDonp62CYp
 O96/mOWGjj3qVEQGJqPAdSx6oj4qv43H3knz1V2ThXKj/88wfAjjDiAQLx8XT6whhe
 fIYsGj02Zg1zRrzuRU92H95nLcqR8hf1O/baH1D4=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTP id
 20200331015456epcas2p288bedb2954a34a1a3145bc92ea914eb6~BQLZ_ULa60939209392epcas2p26;
 Tue, 31 Mar 2020 01:54:56 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.40.184]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 48rspR092JzMqYkl; Tue, 31 Mar
 2020 01:54:55 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
 epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 F8.A6.04128.DE2A28E5; Tue, 31 Mar 2020 10:54:53 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
 20200331015453epcas2p11b35ccf676fc6197dbf9fbb6e7d956ac~BQLXC43N20959909599epcas2p1Y;
 Tue, 31 Mar 2020 01:54:53 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200331015453epsmtrp26739c3b693367b98d68100e0d608a518~BQLXAFouG1268412684epsmtrp2O;
 Tue, 31 Mar 2020 01:54:53 +0000 (GMT)
X-AuditID: b6c32a45-f9bff70000001020-39-5e82a2edb240
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 99.9D.04158.DE2A28E5; Tue, 31 Mar 2020 10:54:53 +0900 (KST)
Received: from KORDO025540 (unknown [12.36.182.130]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20200331015453epsmtip1bd75f2e9af7aaa1ee764fe07d7961b87~BQLW3MLod1158611586epsmtip1q;
 Tue, 31 Mar 2020 01:54:53 +0000 (GMT)
From: =?utf-8?B?7J206rK97YOd?= <gt82.lee@samsung.com>
To: "'Vinod Koul'" <vkoul@kernel.org>
In-Reply-To: <20200330114716.GA72691@vkoul-mobl>
Subject: RE: [PATCH 1/1] ASoC: soc-compress: lock pcm_mutex to resolve
 lockdep error
Date: Tue, 31 Mar 2020 10:54:51 +0900
Message-ID: <00a501d606ff$5ec4ef00$1c4ecd00$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: ko
Thread-Index: AQFwzVbedZouWCPbUsnJTjAf4rU5iQGklQ1ZAqRUqjapCTI3IA==
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfUgTcRzG+e1ut1u1uObKbytoXERamJt17gztxV4YaCT0QlQ4j+1QabuN
 3WZpFFY4nPZmFORCK4NVUmk1ewODplJKRZK9WGlvGlkmlKRZFm3eIv/73PN7nvs+37sfiamr
 CC2ZL7h5l8DZaGICfq0pnk34UrM3W1/ZN5ftaA/J2GNvewh2qKNUxra0n5Gx9cMXEXvz1T1s
 GWGqH9xLmG76uxSmK7U+wnQwWItMdcEneJZ8sy01j+esvEvHCxaHNV/ITaMz1plXmJlkvSHB
 kMIaaZ3A2fk0emVmVsLqfFu4Aq0r4GyesJTFiSKduCTV5fC4eV2eQ3Sn0bzTanMaDM4FImcX
 PULuAovDvtig1ycxYWeOLa/41HTnmZQdlZ0PiWLUYSxDShKoRTDQ0CYrQxNINXUDwa2nF3Dp
 4RuC+83PFBGXmhpC0FRi+Zeoen9dLpkaEezvfC+XTH0IDl6aHGGCYsB7vXtM11BzINjzhogw
 Ru2CX+de4RFWUnro7/4RHk2SMdRG+FqSE5HxsL3O+xGLsIpKgYstP6M8BVore3DpNfMhcPoz
 JvXRwUhvQC7pGjjh82LS2HQ40f9CEekJ1GsCqs/6ZFJgJfSOlEQ5Bj7dDSok1sLgQCMhBfYh
 GHgwGj04isBXrpZ4IQSr2sZKY1Q81N1KjCBQs6H5RbTbZCht+q2QZBWUeqNBGi63/ZFJMkB1
 veIwov3jFvOPW8w/bhn//1GnEF6LpvFO0Z7Li0lOw/gffQWNXc15q26g4w8zQ4giET1J9ebJ
 nmy1nCsQC+0hBCRGa1TE2uJstcrKFRbxLofZ5bHxYggx4e9egWmnWhzhiy64zQYmKTlZn8Kw
 THISS8eqrk7s3Kqmcjk3v43nnbzrX05GKrXFqCx+cLOzYbT8fGDuYNb6pcN2s1BlLbE0bqhY
 87J3bZzxSGGcYD2gbU9/163fsnxUBaaTGTEzttwuD/laU/FDPdmaHadnPVcyRGxD5m4LM/Os
 aHwU89j8/FtF6Yah9u3pXd6dRrKmCF9S4+nTt3ygphUdD8xWH46zWS59vxN4tonGxTzOMA9z
 idxfsPyyt7ADAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupjkeLIzCtJLcpLzFFi42LZdlhJTvftoqY4g79z2S2uXDzEZDH14RM2
 i29XOpgsjl5czGSx4ftaRoudd04wO7B5bPjcxOaxc9Zddo9NqzrZPPq2rGL0WL/lKksAaxSX
 TUpqTmZZapG+XQJXxsT3a1gKbqpX9LWeYmlgnKPQxcjJISFgIjH38XbWLkYuDiGB3YwSt95O
 ZYFISEh8mH+GHcIWlrjfcgSq6DmjxM1NfYwgCTYBU4m27fdYQWwRAVWJLU8esIEUMQs0M0qc
 WfUaqmM9o8Sn7TfAxnIKGEi8ufeDCcQWFgiR6F3zkw3EZgHqXt/2ghnE5hWwlFh79BeULShx
 cuYTsF5mAW2JpzefwtnLFr5mhjhPQeLn02WsEHERidmdbcwQFzlJzH5zi30Co/AsJKNmIRk1
 C8moWUjaFzCyrGKUTC0ozk3PLTYsMMpLLdcrTswtLs1L10vOz93ECI4lLa0djCdOxB9iFOBg
 VOLhfXC1MU6INbGsuDL3EKMEB7OSCC+bf0OcEG9KYmVValF+fFFpTmrxIUZpDhYlcV75/GOR
 QgLpiSWp2ampBalFMFkmDk6pBkaTxddmK2xJlLxfwmbLsnr1Zqk/sQet9v2975pflH65cXpH
 qPDG/rderkZ7xZ94Gt5R3lBa38Xqef31XVeV5OJzDYfXverbLNkurbktVCx0W0VCVKCV+zeR
 NPfNuSuZLzMfnN8slXsz032CqKFaSpb2XK2Fz6b+seDu8dnE8iLMdqaL+MrZTUosxRmJhlrM
 RcWJANgofRyhAgAA
X-CMS-MailID: 20200331015453epcas2p11b35ccf676fc6197dbf9fbb6e7d956ac
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200330110126epcas2p4525e5c6f61f7452df008696f9153770d
References: <CGME20200330110126epcas2p4525e5c6f61f7452df008696f9153770d@epcas2p4.samsung.com>
 <002101d60682$8ec21ed0$ac465c70$@samsung.com>
 <20200330114716.GA72691@vkoul-mobl>
Cc: pilsun.jang@samsung.com, alsa-devel@alsa-project.org, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com
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

Hi,

On 30-03-20, 17:17, Vinod Koul wrote:
>Hello,
>
>On 30-03-20, 20:01,  =CC=B0=20=20=20=20wrote:=0D=0A>>=20snd_soc_runtime_ac=
tivate()=20and=20snd_soc_runtime_deactivate()=20require=20=0D=0A>>=20locked=
=20pcm_mutex.=0D=0A>>=20=0D=0A>>=20Signed-off-by:=20Gyeongtaek=20Lee=20<gt8=
2.lee=40samsung.com>=0D=0A>>=20---=0D=0A>>=20=20sound/soc/soc-compress.c=20=
=7C=204=20++++=0D=0A>>=20=201=20file=20changed,=204=20insertions(+)=0D=0A>>=
=20=0D=0A>>=20diff=20--git=20a/sound/soc/soc-compress.c=20b/sound/soc/soc-c=
ompress.c=20index=20=0D=0A>>=20392a1c5b15d3..42d416ac7e9b=20100644=0D=0A>>=
=20---=20a/sound/soc/soc-compress.c=0D=0A>>=20+++=20b/sound/soc/soc-compres=
s.c=0D=0A>>=20=40=40=20-207,7=20+207,9=20=40=40=20static=20int=20soc_compr_=
open_fe(struct=20=0D=0A>>=20snd_compr_stream=0D=0A>>=20*cstream)=0D=0A>>=20=
=20=09fe->dpcm=5Bstream=5D.state=20=3D=20SND_SOC_DPCM_STATE_OPEN;=0D=0A>>=
=20=20=09fe->dpcm=5Bstream=5D.runtime_update=20=3D=20SND_SOC_DPCM_UPDATE_NO=
;=0D=0A>>=20=20=0D=0A>>=20+=09mutex_lock_nested(&fe->pcm_mutex,=20fe->pcm_s=
ubclass);=0D=0A>>=20=20=09snd_soc_runtime_activate(fe,=20stream);=0D=0A>>=
=20+=09mutex_unlock(&fe->pcm_mutex);=0D=0A>=0D=0A>Can=20you=20please=20expl=
ain=20why=20you=20need=20the=20lock=20here,=20as=0D=0A>>=20=20=0D=0A>>=20=
=20=09mutex_unlock(&fe->card->mutex);=0D=0A>=0D=0A>we=20already=20have=20a=
=20lock=20here..=0D=0A>=0D=0A>>=20=40=40=20-285,7=20+287,9=20=40=40=20stati=
c=20int=20soc_compr_free_fe(struct=20=0D=0A>>=20snd_compr_stream=0D=0A>>=20=
*cstream)=0D=0A>>=20=20=09else=0D=0A>>=20=20=09=09stream=20=3D=20SNDRV_PCM_=
STREAM_CAPTURE;=0D=0A>>=20=20=0D=0A>>=20+=09mutex_lock_nested(&fe->pcm_mute=
x,=20fe->pcm_subclass);=0D=0A>>=20=20=09snd_soc_runtime_deactivate(fe,=20st=
ream);=0D=0A>>=20+=09mutex_unlock(&fe->pcm_mutex);=0D=0A>=0D=0A>And=20this=
=20instance=20is=20also=20using=20fe->card->mutex..=20so=20I=20think=20doub=
le=20lock=20may=20not=20serve=20any=20purpose=20here..=0D=0A>=0D=0A>Can=20y=
ou=20explain=20why=20we=20need=20the=20extra=20lock?=0D=0AYou=20are=20right=
.=0D=0AThe=20mutex_lock=20with=20fe->pcm_mutex=20has=20no=20purpose.=0D=0AI=
t=20just=20removes=20lockdep=20warning=20like=20the=20below=0D=0A<4>=5B=201=
437.857354=5D=20=20=5B5:=20=20=20=20=20=20=20=20=20=20cplay:11547=5D=20----=
--------=5B=20cut=20here=20=5D------------=0D=0A<4>=5B=201437.857463=5D=20=
=20=5B5:=20=20=20=20=20=20=20=20=20=20cplay:11547=5D=20WARNING:=20CPU:=205=
=20PID:=2011547=20at=20sound/soc/soc-pcm.c:99=20snd_soc_runtime_deactivate+=
0x88/0x140=0D=0A<4>=5B=201437.857498=5D=20=20=5B5:=20=20=20=20=20=20=20=20=
=20=20cplay:11547=5D=20Modules=20linked=20in:=0D=0A<4>=5B=201437.857557=5D=
=20=20=5B5:=20=20=20=20=20=20=20=20=20=20cplay:11547=5D=20CPU:=205=20PID:=
=2011547=20Comm:=20cplay=20Tainted:=20G=20S=20=20=20=20=20=20W=20=20=20=20=
=20=20=20=20=204.19.65-00198-ge6c3a8b64f3d-dirty=20=23146=0D=0A<4>=5B=20143=
7.857590=5D=20=20=5B5:=20=20=20=20=20=20=20=20=20=20cplay:11547=5D=20Hardwa=
re=20name:=20Samsung=20xxx=20board=20based=20on=20xxx=20(DT)=0D=0A<4>=5B=20=
1437.857620=5D=20=20=5B5:=20=20=20=20=20=20=20=20=20=20cplay:11547=5D=20Cal=
l=20trace:=0D=0A<4>=5B=201437.857662=5D=20=20=5B5:=20=20=20=20=20=20=20=20=
=20=20cplay:11547=5D=20=5B<ffffff800808d598>=5D=20dump_backtrace+0x0/0x404=
=0D=0A<4>=5B=201437.857704=5D=20=20=5B5:=20=20=20=20=20=20=20=20=20=20cplay=
:11547=5D=20=5B<ffffff800808d9b0>=5D=20show_stack+0x14/0x1c=0D=0A<4>=5B=201=
437.857745=5D=20=20=5B5:=20=20=20=20=20=20=20=20=20=20cplay:11547=5D=20=5B<=
ffffff8008c5dc24>=5D=20dump_stack+0xa0/0xd8=0D=0A<4>=5B=201437.857784=5D=20=
=20=5B5:=20=20=20=20=20=20=20=20=20=20cplay:11547=5D=20=5B<ffffff80080a4b28=
>=5D=20__warn+0xcc/0x12c=0D=0A<4>=5B=201437.857821=5D=20=20=5B5:=20=20=20=
=20=20=20=20=20=20=20cplay:11547=5D=20=5B<ffffff8008c5cd78>=5D=20report_bug=
+0x78/0xcc=0D=0A<4>=5B=201437.857857=5D=20=20=5B5:=20=20=20=20=20=20=20=20=
=20=20cplay:11547=5D=20=5B<ffffff800808e5c0>=5D=20bug_handler+0x2c/0x88=0D=
=0A<4>=5B=201437.857895=5D=20=20=5B5:=20=20=20=20=20=20=20=20=20=20cplay:11=
547=5D=20=5B<ffffff8008085510>=5D=20brk_handler+0x88/0xc8=0D=0A<4>=5B=20143=
7.857930=5D=20=20=5B5:=20=20=20=20=20=20=20=20=20=20cplay:11547=5D=20=5B<ff=
ffff8008080f0c>=5D=20do_debug_exception+0x108/0x194=0D=0A<4>=5B=201437.8579=
68=5D=20=20=5B5:=20=20=20=20=20=20=20=20=20=20cplay:11547=5D=20Exception=20=
stack(0xffffff8028b0b960=20to=200xffffff8028b0baa0)=0D=0A<4>=5B=201437.8580=
02=5D=20=20=5B5:=20=20=20=20=20=20=20=20=20=20cplay:11547=5D=20b960:=200000=
000000000024=20ffffff8008e28a97=20ffffffc975bb40a0=20ffffff8028b0b748=0D=0A=
<4>=5B=201437.858035=5D=20=20=5B5:=20=20=20=20=20=20=20=20=20=20cplay:11547=
=5D=20b980:=200000000000000080=200000000000000000=20ffffff8008129638=200000=
000000000000=0D=0A<4>=5B=201437.858066=5D=20=20=5B5:=20=20=20=20=20=20=20=
=20=20=20cplay:11547=5D=20b9a0:=20e0b1dc92eba18f00=20e0b1dc92eba18f00=20000=
0000000000003=200000000000000000=0D=0A<4>=5B=201437.858098=5D=20=20=5B5:=20=
=20=20=20=20=20=20=20=20=20cplay:11547=5D=20b9c0:=200000000000240022=200000=
000000000004=20ffffff8009b2f420=2000000000fffffff5=0D=0A<4>=5B=201437.85813=
0=5D=20=20=5B5:=20=20=20=20=20=20=20=20=20=20cplay:11547=5D=20b9e0:=20fffff=
f8008c6baac=20000000000000002c=2000000000000000b0=20ffffffc9673c1e80=0D=0A<=
4>=5B=201437.858161=5D=20=20=5B5:=20=20=20=20=20=20=20=20=20=20cplay:11547=
=5D=20ba00:=200000000000000000=20ffffffc8190e6100=200000000000000000=20ffff=
ffc95c262e88=0D=0A<4>=5B=201437.858193=5D=20=20=5B5:=20=20=20=20=20=20=20=
=20=20=20cplay:11547=5D=20ba20:=200000000000000008=20ffffffc8ec3050d0=20fff=
fffc8fb81a4d0=200000000000000004=0D=0A<4>=5B=201437.858224=5D=20=20=5B5:=20=
=20=20=20=20=20=20=20=20=20cplay:11547=5D=20ba40:=200000000000000009=20ffff=
ff8028b0bac0=20ffffff8008a895c8=20ffffff8028b0baa0=0D=0A<4>=5B=201437.85825=
6=5D=20=20=5B5:=20=20=20=20=20=20=20=20=20=20cplay:11547=5D=20ba60:=20fffff=
f8008a895c8=200000000060400005=20ffffff8028b0ba48=20ffffff800811d7b4=0D=0A<=
4>=5B=201437.858287=5D=20=20=5B5:=20=20=20=20=20=20=20=20=20=20cplay:11547=
=5D=20ba80:=200000007fffffffff=20e0b1dc92eba18f00=20ffffff8028b0bac0=20ffff=
ff8008a895c8=0D=0A<4>=5B=201437.858318=5D=20=20=5B5:=20=20=20=20=20=20=20=
=20=20=20cplay:11547=5D=20=5B<ffffff8008082b18>=5D=20el1_dbg+0x18/0x78=0D=
=0A<4>=5B=201437.858355=5D=20=20=5B5:=20=20=20=20=20=20=20=20=20=20cplay:11=
547=5D=20=5B<ffffff8008a895c8>=5D=20snd_soc_runtime_deactivate+0x88/0x140=
=0D=0A=0D=0Afrom=20here=0D=0Avoid=20snd_soc_runtime_activate(struct=20snd_s=
oc_pcm_runtime=20*rtd,=20int=20stream)=0D=0A=7B=0D=0A=09struct=20snd_soc_da=
i=20*cpu_dai=20=3D=20rtd->cpu_dai;=0D=0A=09int=20i;=0D=0A=0D=0A=09lockdep_a=
ssert_held(&rtd->pcm_mutex);=0D=0A=0D=0Aand=20here.=0D=0Avoid=20snd_soc_run=
time_deactivate(struct=20snd_soc_pcm_runtime=20*rtd,=20int=20stream)=0D=0A=
=7B=0D=0A=09struct=20snd_soc_dai=20*cpu_dai=20=3D=20rtd->cpu_dai;=0D=0A=09i=
nt=20i;=0D=0A=0D=0A=09lockdep_assert_held(&rtd->pcm_mutex);=0D=0A=0D=0AAppr=
oach=20method=20of=20this=20patch=20is=20too=20simple=20but,=0D=0AI=20think=
=20that=20simple=20approach=20can=20be=20used=20until=20the=20nicer=20patch=
=20arrives.=0D=0A=0D=0AThank=20you=20for=20your=20fast=20review.=0D=0A>=0D=
=0A>Thanks=0D=0A>--=0D=0A>=7EVinod=0D=0A>=0D=0A=0D=0A
