Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DFAAEB8D3
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jun 2025 15:25:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46FFC602B2;
	Fri, 27 Jun 2025 15:25:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46FFC602B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1751030739;
	bh=owMUQRT6gjs95f8EialHnYsTUvvktkD21PyIy9uSBtg=;
	h=From:To:Cc:Subject:Date:References:Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=pH9ebC+OiN3I4nDETe751HqtROAgCFf9ENwkG37iMkhKiMoIgY5Ds6P0FOZwiSZWm
	 KrgpoGNE0yQ/CeizwDb1BlIzzf0lm+c8lPI9B2ZT2dR6LYFDeGGxsId6uqo/ZmAsuR
	 QxCehtS2B7GYgS3Q0RBBLsVmgyLwrV1HmMx+t5CE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4193DF805EE; Fri, 27 Jun 2025 15:23:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A22AF805F0;
	Fri, 27 Jun 2025 15:23:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB968F80424; Mon, 23 Jun 2025 03:43:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_PASS,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 81F9BF80087
	for <alsa-devel@alsa-project.org>; Mon, 23 Jun 2025 03:43:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81F9BF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256
 header.s=mail20170921 header.b=fVakX4iL
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20250623014341epoutp0343e1e6fe3fd8cd5fb8335f448ef9fe6e~LiI2IdEdO0640906409epoutp034
	for <alsa-devel@alsa-project.org>; Mon, 23 Jun 2025 01:43:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20250623014341epoutp0343e1e6fe3fd8cd5fb8335f448ef9fe6e~LiI2IdEdO0640906409epoutp034
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1750643021;
	bh=owMUQRT6gjs95f8EialHnYsTUvvktkD21PyIy9uSBtg=;
	h=Reply-To:From:To:Cc:Subject:Date:References:From;
	b=fVakX4iLADCHcMnc8hV427HSXP8T0i/2CfG3+6HvOLte5d3a1YPHoAnVp3GddcIc/
	 8OtdQnPmYBLKsp6Bs9U/2WZeo2FgxevmQBM7qRWI7ooPgJCf/PTc9CnaZDgViYRYiG
	 rW0xJBWI8p88vh2UrMCB+KQnanlkfwFK/IUC7Boo=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20250623014341epcas2p39a07a9107b14431cde04223400ffef56~LiI1zJ17S2527925279epcas2p3J;
	Mon, 23 Jun 2025 01:43:41 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.36.68]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4bQW7w3XkVz6B9m9; Mon, 23 Jun
	2025 01:43:40 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20250623014339epcas2p2c081aaeabc556a45faac59d2ffbba46e~LiI0El25o2191721917epcas2p2F;
	Mon, 23 Jun 2025 01:43:39 +0000 (GMT)
Received: from KORCO117793 (unknown [12.36.188.221]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250623014339epsmtip1dc29b56b85c8e9734b16e02d30c53f4e~LiI0A5c3J2551425514epsmtip1Q;
	Mon, 23 Jun 2025 01:43:39 +0000 (GMT)
From: =?utf-8?B?7J207Iq567mI?= <seungbin.lee@samsung.com>
To: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
	<gregkh@linuxfoundation.org>, <pierre-louis.bossart@linux.intel.com>,
	<perex@perex.cz>, <tiwai@suse.de>
Cc: <pilsun.jang@samsung.com>, <s47.kang@samsung.com>,
	<donghee.moon@samsung.com>
Subject: RE: [PATCH] ASoC: soc-compress: Fix race condition in
 soc_compr_open_fe
Date: Mon, 23 Jun 2025 10:43:39 +0900
Message-ID: <001d01dbe3e0$3e3c4bc0$bab4e340$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: Advj3mr08xRpmMsJSo27IdBrP6wTfwAAVTPQ
Content-Language: ko
X-CMS-MailID: 20250623014339epcas2p2c081aaeabc556a45faac59d2ffbba46e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250623014339epcas2p2c081aaeabc556a45faac59d2ffbba46e
References: 
 <CGME20250623014339epcas2p2c081aaeabc556a45faac59d2ffbba46e@epcas2p2.samsung.com>
X-MailFrom: seungbin.lee@samsung.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: PXIBACAK3WLIK7SZJIO2APYK47Y56O43
X-Message-ID-Hash: PXIBACAK3WLIK7SZJIO2APYK47Y56O43
X-Mailman-Approved-At: Fri, 27 Jun 2025 13:23:47 +0000
X-Mailman-Version: 3.3.9
Precedence: list
Reply-To: =?utf-8?B?7J207Iq567mI?= <seungbin.lee@samsung.com>
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PXIBACAK3WLIK7SZJIO2APYK47Y56O43/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

I am sending it again after changing it to plain text mail.

Thanks

From: =EC=9D=B4=EC=8A=B9=EB=B9=88=20<seungbin.lee=40samsung.com>=20=0D=0ASe=
nt:=20Monday,=20June=2023,=202025=2010:31=20AM=0D=0ATo:=20'alsa-devel=40als=
a-project.org'=20<alsa-devel=40alsa-project.org>;=20'linux-sound=40vger.ker=
nel.org'=20<linux-sound=40vger.kernel.org>;=20'gregkh=40linuxfoundation.org=
'=20<gregkh=40linuxfoundation.org>;=20'pierre-louis.bossart=40linux.intel.c=
om'=20<pierre-louis.bossart=40linux.intel.com>;=20'perex=40perex.cz'=20<per=
ex=40perex.cz>;=20'tiwai=40suse.de'=20<tiwai=40suse.de>=0D=0ACc:=20'pilsun.=
jang=40samsung.com'=20<pilsun.jang=40samsung.com>;=20's47.kang=40samsung.co=
m'=20<s47.kang=40samsung.com>;=20'donghee.moon=40samsung.com'=20<donghee.mo=
on=40samsung.com>=0D=0ASubject:=20FW:=20=5BPATCH=5D=20ASoC:=20soc-compress:=
=20Fix=20race=20condition=20in=20soc_compr_open_fe=0D=0A=0D=0AAdd=20recipie=
nt=20addition=20and=20modification=20patch=20to=20the=20body=20of=20the=20t=
ransmission.=0D=0A=0D=0AFrom:=20=EC=9D=B4=EC=8A=B9=EB=B9=88=20<mailto:seung=
bin.lee=40samsung.com>=20=0D=0ASent:=20Thursday,=20June=2019,=202025=2010:2=
5=20AM=0D=0ATo:=20'tiwai=40suse.de'=20<mailto:tiwai=40suse.de>=0D=0ASubject=
:=20=5BPATCH=5D=20ASoC:=20soc-compress:=20Fix=20race=20condition=20in=20soc=
_compr_open_fe=0D=0A=0D=0AHi=0D=0A=0D=0AI=20am=20sending=20this=20email=20t=
o=20report=20an=20issue=20found=20in=20sound/soc/soc-compress.c.=0D=0A=0D=
=0AScenario:=20Playing=20a=20mix=20of=20MP3=20and=20WAV=20files=20repeatedl=
y=20from=20YouTube=20Music=20by=20pressing=20=22next=22.=0D=0A=0D=0AIssue=
=20occurs=20when=20snd_soc_dpcm_runtime_update=20is=20called=20and=20soc_co=
mpr_trigger_fe=20is=20invoked,=20causing=20the=20value=20of=20=E2=80=9Cfe->=
dpcm=5Bstream=5D.runtime_update=E2=80=9D=20to=20change=20mid-process.=20Thi=
s=20results=20in=20a=20problem=20where,=20during=20the=20closing=20of=20the=
=20BE=20connected=20to=20the=20FE=20in=20snd_soc_dpcm_runtime_update,=20onl=
y=20the=20entry=20is=20removed=20from=20the=20list=20without=20actually=20b=
eing=20closed.=0D=0A=0D=0AThe=20attached=20patch=20resolves=20this=20issue=
=20as=20confirmed=20through=20testing.=0D=0A=0D=0AAdditionally,=20while=20p=
erforming=20DPCM=20related=20operations=20in=20soc-compress.c,=20snd_soc_dp=
cm_mutex_lock=20is=20used;=20however,=20soc_compr_trigger_fe=20does=20not=
=20have=20this=20lock.=20Please=20review=20the=20attached=20patch=20regardi=
ng=20this=20matter.=0D=0A=0D=0AThank=20you.=0D=0A=0D=0AFrom=2072a0340bf7dcc=
c6f53dc2d02e04bb3f894d796e3=20Mon=20Sep=2017=2000:00:00=202001=0D=0AFrom:=
=20Seungbin=20Lee=20<mailto:seungbin.lee=40samsung.com>=0D=0ADate:=20Wed,=
=2018=20Jun=202025=2013:33:02=20+0900=0D=0ASubject:=20=5BPATCH=5D=20ASoC:=
=20soc-compress:=20Fix=20race=20condition=20in=20soc_compr_open_fe=0D=0A=0D=
=0AIf=20the=20soc_compr_trigger_fe=20function=20is=20called=20during=20snd_=
soc_dpcm_runtime_update=20execution,=0D=0Athe=20FE's=20DPCM=20runtime=20upd=
ate=20variable=20may=20be=20changed.=0D=0AThen=20the=20BE=20list=20connecte=
d=20to=20the=20FE=20flies=20away,=20and=20the=20BE=20cannot=20be=20closed.=
=0D=0A=0D=0AThis=20needs=20to=20be=20protected=20by=20the=20snd_soc_dpcm_mu=
tex_lock.=0D=0A=0D=0AChange-Id:=20Ibfd1712e6baf41a30afa357a91ada83d205f968b=
=0D=0ASigned-off-by:=20Seungbin=20Lee=20<mailto:seungbin.lee=40samsung.com>=
=0D=0A---=0D=0Asound/soc/soc-compress.c=20=7C=204=20++++=0D=0A1=20file=20ch=
anged,=204=20insertions(+)=0D=0A=0D=0Adiff=20--git=20a/sound/soc/soc-compre=
ss.c=20b/sound/soc/soc-compress.c=0D=0Aindex=20fc8db54352541..1a2a3fe6a2340=
=20100644=0D=0A---=20a/sound/soc/soc-compress.c=0D=0A+++=20b/sound/soc/soc-=
compress.c=0D=0A=40=40=20-286,6=20+286,8=20=40=40=20static=20int=20soc_comp=
r_trigger_fe(struct=20snd_compr_stream=20*cstream,=20int=20cmd)=0D=0A=0D=0A=
=20=20=20=20=20=20=20=20=20=20=20snd_soc_card_mutex_lock(fe->card);=0D=0A=
=0D=0A+=20=20=20=20=20=20=20=20=20snd_soc_dpcm_mutex_lock(fe);=0D=0A+=0D=0A=
=20=20=20=20=20=20=20=20=20=20ret=20=3D=20snd_soc_dai_compr_trigger(cpu_dai=
,=20cstream,=20cmd);=0D=0A=20=20=20=20=20=20=20=20=20=20if=20(ret=20<=200)=
=0D=0A=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20goto=20ou=
t;=0D=0A=40=40=20-315,6=20+317,8=20=40=40=20static=20int=20soc_compr_trigge=
r_fe(struct=20snd_compr_stream=20*cstream,=20int=20cmd)=0D=0A=0D=0A=20out:=
=0D=0A=20=20=20=20=20=20=20=20=20=20fe->dpcm=5Bstream=5D.runtime_update=20=
=3D=20SND_SOC_DPCM_UPDATE_NO;=0D=0A+=20=20=20=20=20=20=20=20=20snd_soc_dpcm=
_mutex_unlock(fe);=0D=0A+=0D=0A=20=20=20=20=20=20=20=20=20=20snd_soc_card_m=
utex_unlock(fe->card);=0D=0A=20=20=20=20=20=20=20=20=20=20return=20ret;=0D=
=0A=7D=0D=0A--=20=0D=0A2.34.1=0D=0A=0D=0A=0D=0A
