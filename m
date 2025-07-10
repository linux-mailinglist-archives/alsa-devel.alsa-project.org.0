Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 790EEAFFA98
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Jul 2025 09:14:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09FF06018C;
	Thu, 10 Jul 2025 09:14:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09FF06018C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1752131693;
	bh=knkp7wMKbsABbkeqQGYzCKn8oUpavpWUPxjTLnM5OpQ=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=czXPCj3lgFj5mj+eGHPh9PmbJLINHBL7jMTFOPR6kjMkLaRiphYpWl6T7ZxlhAgDO
	 qrzR+YHOhQOQ81+HXIsw5BxMGVQcS1E9elvcktIOVs2yA0q7oBQZ2ZuK/qhAjjeNOT
	 1bCkgDmYRsET922xPnV88FLmgMb5jwyIibX+9YhU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8345F805BF; Thu, 10 Jul 2025 09:14:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 398EFF805C5;
	Thu, 10 Jul 2025 09:14:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C9ECF80526; Thu, 10 Jul 2025 09:14:10 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 87AC0F800FA
	for <alsa-devel@alsa-project.org>; Thu, 10 Jul 2025 09:14:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87AC0F800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256
 header.s=mail20170921 header.b=bnY1v6Nn
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20250710071359epoutp0191910a6fd443777ea5e21c16fde46f0d~Q0nF6IDYf0036700367epoutp01S
	for <alsa-devel@alsa-project.org>; Thu, 10 Jul 2025 07:13:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20250710071359epoutp0191910a6fd443777ea5e21c16fde46f0d~Q0nF6IDYf0036700367epoutp01S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1752131639;
	bh=db3k/JVyQIT3D+uIpPvlN0puBLX9tVayW0NaKXlwODE=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=bnY1v6NntowXy68ixRhpJzT0tTSTItYocpf/08pcqzXgd9v9Hro8DLNxP/s5WAwmC
	 imsg25/oY/XIOd6nHghuPI0A6Kha1vlQW95ofVr51CYMMLOCMGD06zhr1ujJGEL8ZN
	 Bvwu+x9AUhz45vDowzlLrypiTFQ/USzxF2LJQpvg=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20250710071359epcas2p40556834430e3072773cb6a064010719d~Q0nFnmFFV0398403984epcas2p4X;
	Thu, 10 Jul 2025 07:13:59 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.36.90]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4bd5gB4sz7z6B9mG; Thu, 10 Jul
	2025 07:13:58 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20250710071358epcas2p3ea3c58a4f178a8a61d79b9442d71d29e~Q0nEMgXPa1715817158epcas2p3y;
	Thu, 10 Jul 2025 07:13:58 +0000 (GMT)
Received: from KORCO193562 (unknown [12.36.160.57]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250710071357epsmtip2a55452f835a0527fa20e47a9ce589a7a~Q0nEJmIT63222932229epsmtip2G;
	Thu, 10 Jul 2025 07:13:57 +0000 (GMT)
From: =?UTF-8?B?6rmA7J2A7Jqw?= <ew.kim@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, <s.nawrocki@samsung.com>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
	<tiwai@suse.com>
Cc: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <7d2401d6-d897-49d7-a3be-50de0727b037@kernel.org>
Subject: RE: [PATCH] ASoC: samsung: Implement abox generic structure
Date: Thu, 10 Jul 2025 16:13:57 +0900
Message-ID: <01a401dbf16a$33fbd0d0$9bf37270$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGD3td0XDcdc/GKkWKGNfQw8ZJQZQD9NwnZAq8SWvi0vbM/0A==
Content-Language: ko
X-CMS-MailID: 20250710071358epcas2p3ea3c58a4f178a8a61d79b9442d71d29e
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
	<7d2401d6-d897-49d7-a3be-50de0727b037@kernel.org>
Message-ID-Hash: E7PRF6GQVI2CL45RJJ3HBGHUOUZ7NYCN
X-Message-ID-Hash: E7PRF6GQVI2CL45RJJ3HBGHUOUZ7NYCN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E7PRF6GQVI2CL45RJJ3HBGHUOUZ7NYCN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Thank you for your review.
We will proceed to remove unnecessary Doxygen comments and logs as suggeste=
d.

Based on the feedback provided, we will revise the work accordingly and res=
ubmit it for further review.

> -----Original Message-----
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: Wednesday, July 9, 2025 10:58 PM
> To: ew.kim=40samsung.com; s.nawrocki=40samsung.com; lgirdwood=40gmail.com=
;
> broonie=40kernel.org; perex=40perex.cz; tiwai=40suse.com
> Cc: linux-sound=40vger.kernel.org; alsa-devel=40alsa-project.org; linux-
> kernel=40vger.kernel.org
> Subject: Re: =5BPATCH=5D ASoC: samsung: Implement abox generic structure
>=20
> On 09/07/2025 02:10, ew.kim=40samsung.com wrote:
> > +/**
> > + * =40cnotice
> > + * =40prdcode
> > + * =40Sub_SW_Component=7Babox generic=7D
> > + * =40ALM_Link =7Bwork item url=7D
> > + * =40purpose =22Disbaling the abox generic=22
> > + * =40logic =22Disbale the abox generic=22
> > + * =5Cimage html
> > + * =40params
> > + * =40param=7Bin, pdev->dev, struct::device, =21NULL=7D
> > + * =40endparam
> > + * =40noret
> > + */
> > +static void samsung_abox_generic_remove(struct platform_device *pdev)
> > +=7B
> > +	struct device *dev =3D &pdev->dev;
> > +	struct abox_generic_data *data =3D dev_get_drvdata(dev);
> > +
> > +	dev_info(dev, =22%s=5Cn=22, __func__);
>=20
> This is just poor code. Clean it up from all such oddities popular in
> downstream. Look at upstream code. Do you see such code there? No.
>=20
> > +
> > +	if (=21data) =7B
> > +		dev_err(dev, =22%s: Invalid abox generic data=5Cn=22, __func__);
> > +		return;
> > +	=7D
> > +	return;
> > +=7D
> > +
> > +/**
> > + * =40cnotice
> > + * =40prdcode
> > + * =40Sub_SW_Component=7Babox generic=7D
> > + * =40ALM_Link =7Bwork item url=7D
> > + * =40purpose =22shutdown of the abox generic=22
> > + * =40logic =22Disbale the abox hardware by calling the following
> > +function
> > + * pm_runtime_disable(dev)=22
> > + * =5Cimage html
> > + * =40params
> > + * =40param=7Bin, pdev->dev, struct:: device, =21NULL=7D
> > + * =40endparam
> > + * =40noret
> > + */
> > +static void samsung_abox_generic_shutdown(struct platform_device
> > +*pdev) =7B
> > +	struct device *dev =3D &pdev->dev;
> > +	struct abox_generic_data *data =3D dev_get_drvdata(dev);
> > +
> > +	if (=21data) =7B
> > +		dev_err(dev, =22%s: Invalid abox generic data=5Cn=22, __func__);
> > +		return;
> > +	=7D
> > +	return;
> > +=7D
> > +
> > +static const struct of_device_id samsung_abox_generic_match=5B=5D =3D =
=7B
> > +	=7B
> > +		.compatible =3D =22samsung,abox_generic=22,
> > +	=7D,
> > +	=7B=7D,
> > +=7D;
> > +MODULE_DEVICE_TABLE(of, samsung_abox_generic_match);
> > +
> > +static const struct dev_pm_ops samsung_abox_generic_pm =3D =7B
> > +	SET_SYSTEM_SLEEP_PM_OPS(abox_generic_suspend, abox_generic_resume)
> > +=7D;
> > +
> > +struct platform_driver samsung_abox_generic_driver =3D =7B
> > +	.probe  =3D samsung_abox_generic_probe,
> > +	.remove =3D samsung_abox_generic_remove,
> > +	.shutdown =3D samsung_abox_generic_shutdown,
> > +	.driver =3D =7B
> > +		.name =3D =22samsung-abox-generic=22,
> > +		.owner =3D THIS_MODULE,
>=20
> So that's indeed 2013 code you upstream. We really want you to clean it u=
p
> before you post some ancient stuff like that.
>=20
>=20
> > +		.of_match_table =3D of_match_ptr(samsung_abox_generic_match),
> > +		.pm =3D &samsung_abox_generic_pm,
> > +	=7D,
> > +=7D;
> > +
> > +module_platform_driver(samsung_abox_generic_driver);
> > +/* Module information */
>=20
> Useless comment.
>=20
> > +MODULE_AUTHOR(=22Eunwoo Kim, <ew.kim=40samsung.com>=22);
> > +MODULE_DESCRIPTION(=22Samsung ASoC A-Box Generic Driver=22);
> > +MODULE_ALIAS(=22platform:samsung-abox-generic=22);
>=20
> No, drop. This was raised so many times already...
>=20
> > +MODULE_LICENSE(=22GPL v2=22);
> > +
> > diff --git
> > a/sound/soc/samsung/auto_abox/generic/include/abox_generic.h
> > b/sound/soc/samsung/auto_abox/generic/include/abox_generic.h
> > new file mode 100644
> > index 000000000000..1c954272e2b5
> > --- /dev/null
> > +++ b/sound/soc/samsung/auto_abox/generic/include/abox_generic.h
> > =40=40 -0,0 +1,87 =40=40
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * ALSA SoC - Samsung ABOX Share Function and Data structure
> > + * for Exynos specific extensions
> > + *
> > + * Copyright (C) 2013-2020 Samsung Electronics Co., Ltd.
> > + *
> > + * EXYNOS - sound/soc/samsung/abox/include/abox_generic.h
>=20
> Same with paths. Do you see them anywhere in the kernel?
>=20
> > + */
> > +
> > +=23ifndef __SND_SOC_ABOX_GENERIC_BASE_H =23define
> > +__SND_SOC_ABOX_GENERIC_BASE_H
> > +
> > +=23define ABOX_GENERIC_DATA
> 	abox_generic_get_abox_generic_data();
> > +
> > +struct snd_soc_pcm_runtime;
> > +
> > +enum abox_soc_ioctl_cmd =7B
> > +	ABOX_SOC_IOCTL_GET_NUM_OF_RDMA,
> > +	ABOX_SOC_IOCTL_GET_NUM_OF_WDMA,
> > +	ABOX_SOC_IOCTL_GET_NUM_OF_UAIF,
> > +	ABOX_SOC_IOCTL_GET_SOC_TIMER,
> > +	ABOX_SOC_IOCTL_SET_DMA_BUFFER,
> > +	ABOX_SOC_IOCTL_SET_PP_POINTER,
> > +	ABOX_SOC_IOCTL_SET_PERF_PERIOD,
> > +	ABOX_SOC_IOCTL_CHECK_TIME_MUTEX,
> > +	ABOX_SOC_IOCTL_CHECK_TIME_NO_MUTEX,
> > +	ABOX_SOC_IOCTL_PCM_DUMP_INTR,
> > +	ABOX_SOC_IOCTL_PCM_DUMP_CLOSE,
> > +	ABOX_SOC_IOCTL_PCM_DUMP_ADD_CONTROL,
> > +	ABOX_SOC_IOCTL_MAX
> > +=7D;
> > +
> > +typedef int (*SOC_IOCTL)(struct device *soc_dev, enum
> > +abox_soc_ioctl_cmd cmd, void *data);
>=20
> Follow coding style.
>=20
> > +
> > +struct abox_generic_data =7B
> > +	struct platform_device *pdev;
> > +	struct platform_device **pdev_pcm_playback;
> > +	struct platform_device **pdev_pcm_capture;
> > +	unsigned int num_of_pcm_playback;
> > +	unsigned int num_of_pcm_capture;
> > +	unsigned int num_of_i2s_dummy;
> > +	unsigned int num_of_rdma;
> > +	unsigned int num_of_wdma;
> > +	unsigned int num_of_uaif;
> > +	struct device *soc_dev;
> > +	SOC_IOCTL soc_ioctl;
> > +=7D;
> > +
> > +
> > +/************ Internal API ************/
>=20
> Then why do you expose it via header?
>=20
> > +
> > +struct abox_generic_data *abox_generic_get_abox_generic_data(void);
> > +
> > +int abox_generic_set_dma_buffer(struct device *pcm_dev);
> > +
> > +int abox_generic_request_soc_ioctl(struct device *generic_dev, enum
> abox_soc_ioctl_cmd cmd,
> > +	void *data);
> > +
> > +int abox_generic_set_pp_pointer(struct device *pcm_dev);
> > +
> > +
> > +
> > +
> > +/************ External API ************/
> > +
> > +extern struct device *abox_generic_find_fe_dev_from_rtd(struct
> > +snd_soc_pcm_runtime *be);
>=20
> You cannot have external API. All API is internal first.
>=20
> > +
> > +extern struct platform_device *abox_generic_get_pcm_platform_dev(int
> pcm_id,
> > +	int stream_type);
> > +
> Best regards,
> Krzysztof


