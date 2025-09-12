Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E2570C47486
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Nov 2025 15:43:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6302C60222;
	Mon, 10 Nov 2025 15:43:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6302C60222
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1762785820;
	bh=FnpuK3dx9xrRthH3rxPyUPMIEelJfbDZD2xw508+LpI=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=iyoNufCIY151sBtjdZM0J/pmua/NvYhjWoarDjdtjbMPxpMk3kMK83POX1NLnH4s4
	 jGkLIQIJXEix+Sg1eJCWHxV2WN9I7UJ96M5rbMMrDflgRYUI0WskAjkP+91pcwkXFt
	 5fkmEY8vJYXgOH1u1nI42CWGA+MwGmB9UkXreB8k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11AD7F807DE; Mon, 10 Nov 2025 15:40:30 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9EC93F80808;
	Mon, 10 Nov 2025 15:40:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8BEBF80254; Fri, 12 Sep 2025 10:36:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 19348F800E3
	for <alsa-devel@alsa-project.org>; Fri, 12 Sep 2025 10:35:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19348F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=aM0WU+4r
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58C8ZrCv481885;
	Fri, 12 Sep 2025 03:35:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757666153;
	bh=vnvE9Tmy+8RZpuEpasCHWpNmyOCrn64qxskEM9TbF1A=;
	h=From:To:CC:Subject:Date;
	b=aM0WU+4rOhOUJpBTaBPkR+mKOu6BdTvsmQ/6QWZign0lAmOjOXFfMPvdgeobbkUQS
	 l7FIgPLTT3AbEnozUPdz/qMOb0JAbfL+5AZ5MFtMDvsxVMwKptMsgf2+I6PLq2G1Bw
	 nAfecr0LGpkqO1uHLZ+W0bKhEnmUf140sU8mbQoo=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58C8Zr9d2638887
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 12 Sep 2025 03:35:53 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 12
 Sep 2025 03:35:52 -0500
Received: from DLEE107.ent.ti.com ([fe80::1c91:43d:d71:d7b6]) by
 DLEE107.ent.ti.com ([fe80::1c91:43d:d71:d7b6%17]) with mapi id
 15.01.2507.055; Fri, 12 Sep 2025 03:35:52 -0500
From: "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>
To: Mark Brown <broonie@kernel.org>
CC: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "perex@perex.cz"
	<perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
        "yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>,
        "cezary.rojewski@intel.com" <cezary.rojewski@intel.com>,
        "peter.ujfalusi@linux.intel.com" <peter.ujfalusi@linux.intel.com>,
        "ranjani.sridharan@linux.intel.com"
 <ranjani.sridharan@linux.intel.com>,
        "kai.vehmanen@linux.intel.com" <kai.vehmanen@linux.intel.com>,
        "pierre-louis.bossart@linux.dev" <pierre-louis.bossart@linux.dev>,
        "Navada
 Kanyana, Mukund" <navada@ti.com>,
        "Ding, Shenghao" <shenghao-ding@ti.com>,
        "Hampiholi, Vallabha" <v-hampiholi@ti.com>,
        "Xu, Baojun" <baojun.xu@ti.com>
Subject: Re: [PATCH v4 2/6] ASoC: ops: add snd_soc_get_volsw_clamped
Thread-Topic: [PATCH v4 2/6] ASoC: ops: add snd_soc_get_volsw_clamped
Thread-Index: AdwjvjTZ0GpSGTcuTVKLGIWH//vGnw==
Date: Fri, 12 Sep 2025 08:35:52 +0000
Message-ID: <a4b19a5b780a4cf2a5b6cddf01f7a1ad@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.82.30.14]
x-c2processedorg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MailFrom: niranjan.hy@ti.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: XNM6EOAYAV2LTDDZ3QWUILZPVKY74ULB
X-Message-ID-Hash: XNM6EOAYAV2LTDDZ3QWUILZPVKY74ULB
X-Mailman-Approved-At: Mon, 10 Nov 2025 14:39:35 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XNM6EOAYAV2LTDDZ3QWUILZPVKY74ULB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

> From: Mark Brown <broonie@kernel.org>
> Sent: Friday, September 12, 2025 12:02 AM
> Subject: Re: [EXTERNAL] Re: [PATCH v4 2/6] ASoC: ops: add
> snd_soc_get_volsw_clamped
>=20
> On Thu, Sep 11, 2025 at 05:21:14PM +0000, Holalu Yogendra, Niranjan wrote=
:
> > > From: Mark Brown <broonie@kernel.org>
>=20
> >   Since few of the drivers as still using the original API, and was not=
 sure if
> > everyone wanted to clamp the register value, did not want to disturb th=
e
> > original API snd_soc_get_volsw. Per my analysis, if register read fails=
 due to
> In what situation would anything want to report an invalid value?
I am not sure if I fully follow. But in my case, for one of the cases,
valid amp volume is 0x0 to 0x14 with mask 0x1f - so if the register value r=
ead is
0x15 to 0x1f, it is invalid. But in the next patch, I will add the logic to=
 clamp the value.

> > Are you thinking that this patch could be dropped and clamp the value t=
o max in =20
> > 'soc_get_volsw' (as in 1st patch) and use the same API ? Please suggest=
.
> Yes, everything should report valid values.  I/O errors should be
> propagated as errors.
I will update the next patch accordingly.=20

Thanks=20
Niranjan H Y
