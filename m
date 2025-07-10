Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BB9AFFAB0
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Jul 2025 09:20:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46A8F601A6;
	Thu, 10 Jul 2025 09:19:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46A8F601A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1752132002;
	bh=fQ/7O283IcE91x4ax9YzyZoibaa9O259XjKYPfehJa4=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Z+hGnjADHUqU0apda4juZLQecsSOM16lodYjXS6AET4ewt8pMULHevH8VX1MXDKIV
	 pecy7KCTVvEcnPtHx38kxDzP2qsRzQwov0gT6JWSle6ah6mofbnQtw8eWZgPfxDheq
	 wk/lWT3tUTH8EpAjD6R98ko0Sk3LVI9cWtfLNWDA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3BFF1F805BB; Thu, 10 Jul 2025 09:19:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D26B7F805BB;
	Thu, 10 Jul 2025 09:19:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E9C9AF80526; Thu, 10 Jul 2025 09:19:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 961E7F800FA
	for <alsa-devel@alsa-project.org>; Thu, 10 Jul 2025 09:19:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 961E7F800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256
 header.s=mail20170921 header.b=iknwuKJm
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20250710071907epoutp0133980ba145c52be78462e5cbf40aee4a~Q0rkU7vqc0532305323epoutp01X
	for <alsa-devel@alsa-project.org>; Thu, 10 Jul 2025 07:19:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20250710071907epoutp0133980ba145c52be78462e5cbf40aee4a~Q0rkU7vqc0532305323epoutp01X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1752131947;
	bh=fQ/7O283IcE91x4ax9YzyZoibaa9O259XjKYPfehJa4=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=iknwuKJmDdKZhdHo/LH07+COg/KwN7Bgoj0BroPPok479JZ8HOKcztLVXe92stsGs
	 quS+43rz7s0PkjiztS+7SXHtfuCJW1FEOfm3zPHiRVmDAveiDC1jWEdBdPj3224W2k
	 Wpq6a6X3I1qkTJDZRnz9avetMxEKH7/YOSr+SEpE=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20250710071907epcas2p4ddeed5707d58eb009b43ed66fa3a33ac~Q0rkGWHFY0123201232epcas2p4F;
	Thu, 10 Jul 2025 07:19:07 +0000 (GMT)
Received: from epcas2p1.samsung.com (unknown [182.195.36.102]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4bd5n621n0z2SSKk; Thu, 10 Jul
	2025 07:19:06 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250710071905epcas2p4e54b1486fe34ea789a16f9363997be46~Q0ripV6872520325203epcas2p4Z;
	Thu, 10 Jul 2025 07:19:05 +0000 (GMT)
Received: from KORCO193562 (unknown [12.36.160.57]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250710071905epsmtip2f682a3ec73946da3e293824b1c532540~Q0rimar1n0321103211epsmtip2O;
	Thu, 10 Jul 2025 07:19:05 +0000 (GMT)
From: =?UTF-8?B?6rmA7J2A7Jqw?= <ew.kim@samsung.com>
To: "'Christophe JAILLET'" <christophe.jaillet@wanadoo.fr>,
	<s.nawrocki@samsung.com>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
	<perex@perex.cz>, <tiwai@suse.com>
Cc: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <05c107fa-ba4c-45e8-9007-bdf562b57053@wanadoo.fr>
Subject: RE: [PATCH] ASoC: samsung: Implement abox generic structure
Date: Thu, 10 Jul 2025 16:19:05 +0900
Message-ID: <01a501dbf16a$eb4f9410$c1eebc30$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGD3td0XDcdc/GKkWKGNfQw8ZJQZQD9NwnZATHPec60yZ6QgA==
Content-Language: ko
X-CMS-MailID: 20250710071905epcas2p4e54b1486fe34ea789a16f9363997be46
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250709002150epcas2p467416bdbc16754726599a0cacb1feecc
References: 
 <CGME20250709002150epcas2p467416bdbc16754726599a0cacb1feecc@epcas2p4.samsung.com>
	<20250709001002.378246-1-ew.kim@samsung.com>
	<05c107fa-ba4c-45e8-9007-bdf562b57053@wanadoo.fr>
Message-ID-Hash: JLZ2VCNY4ULKOTSEII6NHYIHQOPGFZGG
X-Message-ID-Hash: JLZ2VCNY4ULKOTSEII6NHYIHQOPGFZGG
X-MailFrom: ew.kim@samsung.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JLZ2VCNY4ULKOTSEII6NHYIHQOPGFZGG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Thank you for your review.

We will proceed to remove unnecessary initializations and defensive code as=
 suggested.
Additionally, we will take into account the other comments provided and rew=
ork the content accordingly before submitting it again for further review.

> -----Original Message-----
> From: Christophe JAILLET <christophe.jaillet=40wanadoo.fr>
> Sent: Thursday, July 10, 2025 3:10 AM
> To: ew.kim=40samsung.com; s.nawrocki=40samsung.com; lgirdwood=40gmail.com=
;
> broonie=40kernel.org; perex=40perex.cz; tiwai=40suse.com
> Cc: linux-sound=40vger.kernel.org; alsa-devel=40alsa-project.org; linux-
> kernel=40vger.kernel.org
> Subject: Re: =5BPATCH=5D ASoC: samsung: Implement abox generic structure
>=20
> Le 09/07/2025 =C3=A0=2002:10,=20ew.kim=40samsung.com=20a=20=C3=A9crit=20:=
=0D=0A>=20>=20From:=20ew=20kim=20<ew.kim=40samsung.com>=0D=0A>=20>=0D=0A>=
=20>=20Implemet=20basic=20abox=20generic=20drivers.=0D=0A>=20=0D=0A>=20Impl=
ement.=0D=0A>=20=0D=0A>=20>=20This=20driver=20is=20a=20management=20driver=
=20for=20the=20generic=20drivers=20used=20in=0D=0A>=20>=20Automotive=20Abox=
,=20connecting=20them=20to=20SOC=20drivers.=0D=0A>=20>=20It=20supports=20va=
rious=20Exynos=20Automotive=20SOCs.=0D=0A>=20>=0D=0A>=20=0D=0A>=20...=0D=0A=
>=20=0D=0A>=20>=20+int=20abox_generic_attach_soc_callback(struct=20device=
=20*soc_dev,=0D=0A>=20>=20+=09SOC_IOCTL=20soc_ioctl)=0D=0A>=20>=20+=7B=0D=
=0A>=20>=20+=09struct=20abox_generic_data=20*generic_data=20=3D=20ABOX_GENE=
RIC_DATA;=0D=0A>=20>=20+=0D=0A>=20>=20+=09dev_info(soc_dev,=20=22%s(%d)=20A=
ttach=20SoC=20IOCTL=5Cn=22,=20__func__,=20__LINE__);=0D=0A>=20=0D=0A>=20__L=
INE__=20is=20only=20used=20in=20this=20function.=20Maybe=20it=20is=20a=20bi=
t=20too=20much?=0D=0A>=20=0D=0A>=20>=20+=09if=20(=21generic_data)=20=7B=0D=
=0A>=20>=20+=09=09dev_err(soc_dev,=20=22%s=20Generic=20Drv=20is=20not=20rea=
dy=5Cn=22,=20__func__);=0D=0A>=20>=20+=09=09return=20-ENODATA;=0D=0A>=20>=
=20+=09=7D=0D=0A>=20>=20+=09generic_data->soc_dev=20=3D=20soc_dev;=0D=0A>=
=20>=20+=09generic_data->soc_ioctl=20=3D=20soc_ioctl;=0D=0A>=20>=20+=0D=0A>=
=20>=20+=09generic_data->num_of_rdma=20=3D=20generic_data->soc_ioctl(generi=
c_data-=0D=0A>=20>soc_dev,=0D=0A>=20>=20+=09=09ABOX_SOC_IOCTL_GET_NUM_OF_RD=
MA,=20NULL);=0D=0A>=20>=20+=09generic_data->num_of_wdma=20=3D=20generic_dat=
a->soc_ioctl(generic_data-=0D=0A>=20>soc_dev,=0D=0A>=20>=20+=09=09ABOX_SOC_=
IOCTL_GET_NUM_OF_WDMA,=20NULL);=0D=0A>=20>=20+=09generic_data->num_of_uaif=
=20=3D=20generic_data->soc_ioctl(generic_data-=0D=0A>=20>soc_dev,=0D=0A>=20=
>=20+=09=09ABOX_SOC_IOCTL_GET_NUM_OF_UAIF,=20NULL);=0D=0A>=20>=20+=09dev_in=
fo(soc_dev,=20=22%s(%d)=20num_of_rdma:%d=5Cn=22,=20__func__,=20__LINE__,=0D=
=0A>=20generic_data->num_of_rdma);=0D=0A>=20>=20+=09dev_info(soc_dev,=20=22=
%s(%d)=20num_of_wdma:%d=5Cn=22,=20__func__,=20__LINE__,=0D=0A>=20generic_da=
ta->num_of_wdma);=0D=0A>=20>=20+=09dev_info(soc_dev,=20=22%s(%d)=20num_of_u=
aif:%d=5Cn=22,=20__func__,=20__LINE__,=0D=0A>=20>=20+generic_data->num_of_u=
aif);=0D=0A>=20>=20+=0D=0A>=20>=20+=09return=200;=0D=0A>=20>=20+=7D=0D=0A>=
=20=0D=0A>=20...=0D=0A>=20=0D=0A>=20>=20+struct=20device=20*abox_generic_fi=
nd_fe_dev_from_rtd(struct=0D=0A>=20>=20+snd_soc_pcm_runtime=20*be)=20=7B=0D=
=0A>=20>=20+=09struct=20abox_generic_data=20*generic_data=20=3D=20ABOX_GENE=
RIC_DATA;=0D=0A>=20>=20+=09struct=20snd_soc_dpcm=20*dpcm=20=3D=20NULL;=0D=
=0A>=20>=20+=09struct=20snd_soc_pcm_runtime=20*fe=20=3D=20NULL;=0D=0A>=20>=
=20+=09int=20stream_type=20=3D=200;=0D=0A>=20=0D=0A>=20Unneeded=20and=20unu=
sual=20init=0D=0A>=20=0D=0A>=20>=20+=0D=0A>=20>=20+=09if=20(=21generic_data=
)=0D=0A>=20>=20+=09=09return=20NULL;=0D=0A>=20>=20+=0D=0A>=20>=20+=09for=20=
(stream_type=20=3D=200;=20stream_type=20<=3D=20SNDRV_PCM_STREAM_LAST;=0D=0A=
>=20stream_type++)=20=7B=0D=0A>=20>=20+=09=09int=20cmpnt_index=20=3D=200;=
=0D=0A>=20>=20+=09=09struct=20snd_soc_component=20*component=20=3D=20NULL;=
=0D=0A>=20>=20+=0D=0A>=20>=20+=09=09for_each_dpcm_fe(be,=20stream_type,=20d=
pcm)=20=7B=0D=0A>=20>=20+=09=09=09fe=20=3D=20dpcm->fe;=0D=0A>=20>=20+=09=09=
=09if=20(fe)=0D=0A>=20>=20+=09=09=09=09break;=0D=0A>=20>=20+=09=09=7D=0D=0A=
>=20>=20+=09=09if=20(=21fe)=0D=0A>=20>=20+=09=09=09continue;=0D=0A>=20>=20+=
=0D=0A>=20>=20+=09=09for_each_rtd_components(fe,=20cmpnt_index,=20component=
)=20=7B=0D=0A>=20>=20+=09=09=09struct=20platform_device=20**pdev=20=3D=20NU=
LL;=0D=0A>=20>=20+=09=09=09int=20num_of_pcm_dev=20=3D=200;=0D=0A>=20>=20+=
=09=09=09int=20i=20=3D=200;=0D=0A>=20=0D=0A>=20Unneeded=20and=20unusual=20i=
nit=0D=0A>=20=0D=0A>=20>=20+=0D=0A>=20>=20+=09=09=09if=20(stream_type=20=3D=
=3D=20SNDRV_PCM_STREAM_PLAYBACK)=20=7B=0D=0A>=20>=20+=09=09=09=09num_of_pcm=
_dev=20=3D=20generic_data-=0D=0A>=20>num_of_pcm_playback;=0D=0A>=20>=20+=09=
=09=09=09pdev=20=3D=20generic_data->pdev_pcm_playback;=0D=0A>=20>=20+=09=09=
=09=7D=20else=20=7B=0D=0A>=20>=20+=09=09=09=09num_of_pcm_dev=20=3D=20generi=
c_data-=0D=0A>=20>num_of_pcm_capture;=0D=0A>=20>=20+=09=09=09=09pdev=20=3D=
=20generic_data->pdev_pcm_capture;=0D=0A>=20>=20+=09=09=09=7D=0D=0A>=20>=20=
+=09=09=09for=20(i=20=3D=200;=20i=20<=20num_of_pcm_dev;=20i++)=0D=0A>=20>=
=20+=09=09=09=09if=20(pdev=5Bi=5D=20&&=20component->dev=20=3D=3D=20&pdev=5B=
i=5D->dev)=0D=0A>=20>=20+=09=09=09=09=09return=20component->dev;=0D=0A>=20>=
=20+=09=09=7D=0D=0A>=20>=20+=09=7D=0D=0A>=20>=20+=0D=0A>=20>=20+=09return=
=20NULL;=0D=0A>=20>=20+=7D=0D=0A>=20=0D=0A>=20...=0D=0A>=20=0D=0A>=20>=20+s=
tatic=20int=20abox_generic_resume(struct=20device=20*dev)=20=7B=0D=0A>=20>=
=20+=09struct=20abox_generic_data=20*data=20=3D=20dev_get_drvdata(dev);=0D=
=0A>=20>=20+=09int=20ret=20=3D=200;=0D=0A>=20>=20+=0D=0A>=20>=20+=09dev_inf=
o(dev,=20=22%s=20start=5Cn=22,=20__func__);=0D=0A>=20>=20+=09if=20(=21data)=
=20=7B=0D=0A>=20=0D=0A>=20I=20don't=20think=20this=20can=20happen.=20(same=
=20for=20the=20suspend=20function)=0D=0A>=20=0D=0A>=20>=20+=09=09dev_err(de=
v,=20=22%s:=20Invalid=20abox=20generic=20data=5Cn=22,=20__func__);=0D=0A>=
=20>=20+=09=09return=20-ENODATA;=0D=0A>=20>=20+=09=7D=0D=0A>=20>=20+=0D=0A>=
=20>=20+=09dev_info(dev,=20=22%s=20end=5Cn=22,=20__func__);=0D=0A>=20>=20+=
=09return=20ret;=0D=0A>=20=0D=0A>=20return=200;=20to=20be=20more=20explicit=
?=0D=0A>=20=0D=0A>=20>=20+=7D=0D=0A>=20=0D=0A>=20...=0D=0A>=20=0D=0A>=20>=
=20+static=20int=20abox_generic_read_property_from_dt(struct=20device=20*de=
v,=0D=0A>=20>=20+struct=20abox_generic_data=20*data)=20=7B=0D=0A>=20>=20+=
=09struct=20device_node=20*np=20=3D=20dev->of_node;=0D=0A>=20>=20+=09int=20=
ret=20=3D=200;=0D=0A>=20>=20+=0D=0A>=20>=20+=09ret=20=3D=20of_property_read=
_u32(np,=20=22samsung,num-of-pcm_playback=22,=0D=0A>=20&data->num_of_pcm_pl=
ayback);=0D=0A>=20>=20+=09if=20(ret=20<=200)=20=7B=0D=0A>=20>=20+=09=09dev_=
err(dev,=20=22%s=20property=20reading=20fail=5Cn=22,=20=22samsung,num-of-=
=0D=0A>=20pcm_playback=22);=0D=0A>=20>=20+=09=09return=20ret;=0D=0A>=20>=20=
+=09=7D=0D=0A>=20>=20+=09ret=20=3D=20of_property_read_u32(np,=20=22samsung,=
num-of-pcm_capture=22,=20&data-=0D=0A>=20>num_of_pcm_capture);=0D=0A>=20>=
=20+=09if=20(ret=20<=200)=20=7B=0D=0A>=20>=20+=09=09dev_err(dev,=20=22%s=20=
property=20reading=20fail=5Cn=22,=20=22samsung,num-of-=0D=0A>=20pcm_capture=
=22);=0D=0A>=20>=20+=09=09return=20ret;=0D=0A>=20>=20+=09=7D=0D=0A>=20>=20+=
=09ret=20=3D=20of_property_read_u32(np,=20=22samsung,num-of-i2s-dummy-backe=
nd=22,=0D=0A>=20&data->num_of_i2s_dummy);=0D=0A>=20>=20+=09if=20(ret=20<=20=
0)=20=7B=0D=0A>=20>=20+=09=09dev_err(dev,=20=22%s=20property=20reading=20fa=
il=5Cn=22,=20=22samsung,num-of-=0D=0A>=20i2s-dummy-backend=22);=0D=0A>=20>=
=20+=09=09return=20ret;=0D=0A>=20>=20+=09=7D=0D=0A>=20>=20+=0D=0A>=20>=20+=
=09return=20ret;=0D=0A>=20=0D=0A>=20return=200;=20to=20be=20more=20explicit=
?=0D=0A>=20=0D=0A>=20>=20+=7D=0D=0A>=20>=20+=0D=0A>=20>=20+/**=0D=0A>=20>=
=20+=20*=20=40cnotice=0D=0A>=20>=20+=20*=20=40prdcode=0D=0A>=20>=20+=20*=20=
=40Sub_SW_Component=7Babox=20generic=7D=0D=0A>=20>=20+=20*=20=40ALM_Link=20=
=7Bwork=20item=20url=7D=0D=0A>=20>=20+=20*=20=40purpose=20=22Allocate=20mem=
ory=20for=20abox=20generic=22=0D=0A>=20>=20+=20*=20=40logic=0D=0A>=20>=20+=
=20*=20=5Cimage=20html=0D=0A>=20>=20+=20*=20=40params=0D=0A>=20>=20+=20*=20=
=40param=7Bin,=20dev,=20struct::=20device=20*,=20=21NULL=7D=0D=0A>=20>=20+=
=20*=20=40param=7Bin,=20data,=20struct::=20abox_gneric_data,=20=21NULL=7D=
=0D=0A>=20>=20+=20*=20=40param=7Bout,=20data->pdev_pcm_playback,=20struct::=
=20platform_device,=0D=0A>=20>=20+=21NULL=7D=0D=0A>=20>=20+=20*=20=40param=
=7Bout,=20data->pdev_pcm_capture,=20struct::=20platform_device,=0D=0A>=20>=
=20+=21NULL=7D=0D=0A>=20>=20+=20*=20=40endparam=0D=0A>=20>=20+=20*=20=40ret=
val=7Bret,=20int,=200,=200,=20>=200=7D=0D=0A>=20>=20+=20*/=0D=0A>=20>=20+st=
atic=20int=20abox_generic_allocate_memory(struct=20device=20*dev,=20struct=
=0D=0A>=20>=20+abox_generic_data=20*data)=20=7B=0D=0A>=20>=20+=09int=20ret=
=20=3D=200;=0D=0A>=20=0D=0A>=20Unneeded=20(see=20below)=0D=0A>=20=0D=0A>=20=
>=20+=0D=0A>=20>=20+=09data->pdev_pcm_playback=20=3D=20devm_kzalloc(dev,=0D=
=0A>=20=0D=0A>=20devm_kcalloc()?=0D=0A>=20=0D=0A>=20>=20+=09=09sizeof(struc=
t=20platform_device=20*)=20*=20data->num_of_pcm_playback,=0D=0A>=20GFP_KERN=
EL);=0D=0A>=20>=20+=09if=20(=21data->pdev_pcm_playback)=20=7B=0D=0A>=20>=20=
+=09=09dev_err(dev,=20=22%s=20Can't=20allocate=20memory=20for=0D=0A>=20pdev=
_pcm_playback=5Cn=22,=20__func__);=0D=0A>=20>=20+=09=09ret=20=3D=20-ENOMEM;=
=0D=0A>=20>=20+=09=09return=20ret;=0D=0A>=20=0D=0A>=20Not=20need=20for=20re=
t.=20return=20-ENOMEM;=20is=20less=20verbose.=0D=0A>=20=0D=0A>=20>=20+=09=
=7D=0D=0A>=20>=20+=09data->pdev_pcm_capture=20=3D=20devm_kzalloc(dev,=0D=0A=
>=20=0D=0A>=20devm_kcalloc()?=0D=0A>=20=0D=0A>=20>=20+=09=09sizeof(struct=
=20platform_device=20*)=20*=20data->num_of_pcm_capture,=0D=0A>=20GFP_KERNEL=
);=0D=0A>=20>=20+=09if=20(=21data->pdev_pcm_capture)=20=7B=0D=0A>=20>=20+=
=09=09dev_err(dev,=20=22%s=20Can't=20allocate=20memory=20for=0D=0A>=20pdev_=
pcm_capture=5Cn=22,=20__func__);=0D=0A>=20>=20+=09=09ret=20=3D=20-ENOMEM;=
=0D=0A>=20>=20+=09=09return=20ret;=0D=0A>=20=0D=0A>=20Not=20need=20for=20re=
t.=20return=20-ENOMEM;=20is=20less=20verbose.=0D=0A>=20=0D=0A>=20>=20+=09=
=7D=0D=0A>=20>=20+=0D=0A>=20>=20+=09return=20ret;=0D=0A>=20=0D=0A>=20return=
=200;=20to=20be=20more=20explicit?=0D=0A>=20=0D=0A>=20>=20+=7D=0D=0A>=20>=
=20+=0D=0A>=20>=20+/**=0D=0A>=20>=20+=20*=20=40cnotice=0D=0A>=20>=20+=20*=
=20=40prdcode=0D=0A>=20>=20+=20*=20=40Sub_SW_Component=7Babox=20generic=7D=
=0D=0A>=20>=20+=20*=20=40ALM_Link=20=7Bwork=20item=20url=7D=0D=0A>=20>=20+=
=20*=20=40purpose=20=22Probing=20the=20abox=20generic=22=0D=0A>=20>=20+=20*=
=20=40logic=0D=0A>=20>=20+=20*=20=5Cimage=20html=0D=0A>=20>=20+=20*=20=40pa=
rams=0D=0A>=20>=20+=20*=20=40param=7Bin,=20pdev,=20struct=20platform_device=
=20*,=20=21NULL=7D=0D=0A>=20>=20+=20*=20=40param=7Bin,=20pdev->dev,=20struc=
t::=20device,=20=21NULL=7D=0D=0A>=20>=20+=20*=20=40endparam=0D=0A>=20>=20+=
=20*=20=40retval=7Bret,=20int,=200,=200,=20>=200=7D=0D=0A>=20>=20+=20*/=0D=
=0A>=20>=20+static=20int=20samsung_abox_generic_probe(struct=20platform_dev=
ice=20*pdev)=20=7B=0D=0A>=20>=20+=09struct=20device=20*dev=20=3D=20&pdev->d=
ev;=0D=0A>=20>=20+=09struct=20device_node=20*np=20=3D=20dev->of_node;=0D=0A=
>=20>=20+=09struct=20abox_generic_data=20*data;=0D=0A>=20>=20+=09int=20ret=
=20=3D=200;=0D=0A>=20>=20+=0D=0A>=20>=20+=09dev_info(dev,=20=22%s=5Cn=22,=
=20__func__);=0D=0A>=20>=20+=09data=20=3D=20devm_kzalloc(dev,=20sizeof(*dat=
a),=20GFP_KERNEL);=0D=0A>=20>=20+=09if=20(=21data)=20=7B=0D=0A>=20>=20+=09=
=09return=20-ENOMEM;=0D=0A>=20>=20+=09=7D=0D=0A>=20=0D=0A>=20Extra=20=7B=20=
=7D=20not=20needed.=0D=0A>=20checkpatch.pl=20or=20maybe=20checkpatch.pl=20-=
-strict=20should=20catech=20it.=0D=0A>=20=0D=0A>=20>=20+=0D=0A>=20>=20+=09d=
ata->pdev=20=3D=20pdev;=0D=0A>=20>=20+=09ret=20=3D=20abox_generic_read_prop=
erty_from_dt(dev,=20data);=0D=0A>=20>=20+=09if=20(ret=20<=200)=20=7B=0D=0A>=
=20>=20+=09=09dev_err(dev,=20=22%s=20Failed=20to=20read=20property.=20ret:%=
d=5Cn=22,=0D=0A>=20__func__,=0D=0A>=20>=20+ret);=0D=0A>=20=0D=0A>=20Using=
=20dev_err_probe()=20here=20and=20below=20would=20be=20less=20verbose.=0D=
=0A>=20=0D=0A>=20>=20+=09=09return=20ret;=0D=0A>=20>=20+=09=7D=0D=0A>=20>=
=20+=09ret=20=3D=20abox_generic_allocate_memory(dev,=20data);=0D=0A>=20>=20=
+=09if=20(ret=20<=200)=20=7B=0D=0A>=20>=20+=09=09dev_err(dev,=20=22%s=20Fai=
led=20to=20allocate=20memory.=20ret:%d=5Cn=22,=0D=0A>=20__func__,=0D=0A>=20=
>=20+ret);=0D=0A>=20=0D=0A>=20dev_err()=20is=20already=20called=20in=20abox=
_generic_allocate_memory().=0D=0A>=20=0D=0A>=20>=20+=09=09return=20ret;=0D=
=0A>=20>=20+=09=7D=0D=0A>=20>=20+=09g_abox_generic_data=20=3D=20data;=0D=0A=
>=20>=20+=09platform_set_drvdata(pdev,=20data);=0D=0A>=20>=20+=0D=0A>=20>=
=20+=09platform_register_drivers(abox_generic_sub_drivers,=0D=0A>=20ARRAY_S=
IZE(abox_generic_sub_drivers));=0D=0A>=20>=20+=09ret=20=3D=20of_platform_po=
pulate(np,=20NULL,=20NULL,=20dev);=0D=0A>=20>=20+=09if=20(ret=20<=200)=20=
=7B=0D=0A>=20>=20+=09=09dev_err(dev,=20=22Failed=20to=20populate=20sub-plat=
form_devices.=0D=0A>=20ret:%d=5Cn=22,=20ret);=0D=0A>=20>=20+=09=09return=20=
ret;=0D=0A>=20>=20+=09=7D=0D=0A>=20>=20+=0D=0A>=20>=20+=09return=20ret;=0D=
=0A>=20=0D=0A>=20return=200;=20to=20be=20more=20explicit?=0D=0A>=20=0D=0A>=
=20>=20+=7D=0D=0A>=20>=20+=0D=0A>=20>=20+/**=0D=0A>=20>=20+=20*=20=40cnotic=
e=0D=0A>=20>=20+=20*=20=40prdcode=0D=0A>=20>=20+=20*=20=40Sub_SW_Component=
=7Babox=20generic=7D=0D=0A>=20>=20+=20*=20=40ALM_Link=20=7Bwork=20item=20ur=
l=7D=0D=0A>=20>=20+=20*=20=40purpose=20=22Disbaling=20the=20abox=20generic=
=22=0D=0A>=20>=20+=20*=20=40logic=20=22Disbale=20the=20abox=20generic=22=0D=
=0A>=20>=20+=20*=20=5Cimage=20html=0D=0A>=20>=20+=20*=20=40params=0D=0A>=20=
>=20+=20*=20=40param=7Bin,=20pdev->dev,=20struct::device,=20=21NULL=7D=0D=
=0A>=20>=20+=20*=20=40endparam=0D=0A>=20>=20+=20*=20=40noret=0D=0A>=20>=20+=
=20*/=0D=0A>=20>=20+static=20void=20samsung_abox_generic_remove(struct=20pl=
atform_device=20*pdev)=0D=0A>=20>=20+=7B=0D=0A>=20>=20+=09struct=20device=
=20*dev=20=3D=20&pdev->dev;=0D=0A>=20>=20+=09struct=20abox_generic_data=20*=
data=20=3D=20dev_get_drvdata(dev);=0D=0A>=20>=20+=0D=0A>=20>=20+=09dev_info=
(dev,=20=22%s=5Cn=22,=20__func__);=0D=0A>=20>=20+=0D=0A>=20>=20+=09if=20(=
=21data)=20=7B=0D=0A>=20=0D=0A>=20This=20can=20not=20happen.=20data=20is=20=
set=20if=20the=20probe=20succeeds.=0D=0A>=20=0D=0A>=20>=20+=09=09dev_err(de=
v,=20=22%s:=20Invalid=20abox=20generic=20data=5Cn=22,=20__func__);=0D=0A>=
=20>=20+=09=09return;=0D=0A>=20>=20+=09=7D=0D=0A>=20>=20+=09return;=0D=0A>=
=20=0D=0A>=20Not=20needed.=0D=0A>=20=0D=0A>=20>=20+=7D=0D=0A>=20>=20+=0D=0A=
>=20>=20+/**=0D=0A>=20>=20+=20*=20=40cnotice=0D=0A>=20>=20+=20*=20=40prdcod=
e=0D=0A>=20>=20+=20*=20=40Sub_SW_Component=7Babox=20generic=7D=0D=0A>=20>=
=20+=20*=20=40ALM_Link=20=7Bwork=20item=20url=7D=0D=0A>=20>=20+=20*=20=40pu=
rpose=20=22shutdown=20of=20the=20abox=20generic=22=0D=0A>=20>=20+=20*=20=40=
logic=20=22Disbale=20the=20abox=20hardware=20by=20calling=20the=20following=
=0D=0A>=20>=20+function=0D=0A>=20>=20+=20*=20pm_runtime_disable(dev)=22=0D=
=0A>=20>=20+=20*=20=5Cimage=20html=0D=0A>=20>=20+=20*=20=40params=0D=0A>=20=
>=20+=20*=20=40param=7Bin,=20pdev->dev,=20struct::=20device,=20=21NULL=7D=
=0D=0A>=20>=20+=20*=20=40endparam=0D=0A>=20>=20+=20*=20=40noret=0D=0A>=20>=
=20+=20*/=0D=0A>=20>=20+static=20void=20samsung_abox_generic_shutdown(struc=
t=20platform_device=0D=0A>=20>=20+*pdev)=20=7B=0D=0A>=20>=20+=09struct=20de=
vice=20*dev=20=3D=20&pdev->dev;=0D=0A>=20>=20+=09struct=20abox_generic_data=
=20*data=20=3D=20dev_get_drvdata(dev);=0D=0A>=20>=20+=0D=0A>=20>=20+=09if=
=20(=21data)=20=7B=0D=0A>=20>=20+=09=09dev_err(dev,=20=22%s:=20Invalid=20ab=
ox=20generic=20data=5Cn=22,=20__func__);=0D=0A>=20>=20+=09=09return;=0D=0A>=
=20>=20+=09=7D=0D=0A>=20>=20+=09return;=0D=0A>=20=0D=0A>=20Not=20needed.=0D=
=0A>=20=0D=0A>=20>=20+=7D=0D=0A>=20>=20+=0D=0A>=20>=20+static=20const=20str=
uct=20of_device_id=20samsung_abox_generic_match=5B=5D=20=3D=20=7B=0D=0A>=20=
>=20+=09=7B=0D=0A>=20>=20+=09=09.compatible=20=3D=20=22samsung,abox_generic=
=22,=0D=0A>=20>=20+=09=7D,=0D=0A>=20>=20+=09=7B=7D,=0D=0A>=20=0D=0A>=20Trai=
ling=20comma=20can=20be=20removed=20after=20a=20terminator.=0D=0A>=20=0D=0A=
>=20>=20+=7D;=0D=0A>=20>=20+MODULE_DEVICE_TABLE(of,=20samsung_abox_generic_=
match);=0D=0A>=20>=20+=0D=0A>=20>=20+static=20const=20struct=20dev_pm_ops=
=20samsung_abox_generic_pm=20=3D=20=7B=0D=0A>=20>=20+=09SET_SYSTEM_SLEEP_PM=
_OPS(abox_generic_suspend,=20abox_generic_resume)=0D=0A>=20>=20+=7D;=0D=0A>=
=20=0D=0A>=20...=0D=0A>=20=0D=0A>=20CJ=0D=0A=0D=0A
