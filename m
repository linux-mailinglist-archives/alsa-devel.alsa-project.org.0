Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88965C4746E
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Nov 2025 15:43:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6AF106021D;
	Mon, 10 Nov 2025 15:42:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6AF106021D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1762785781;
	bh=Z/POSQ34BJcdZOO9lRYYkrnNZpiSJAy4D/+m7XhZtDc=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ml1QZ701OjBh7xu/sW4z/8H5UcYYQ6kM2AfV3DgqzYc+mQ7QIrGDPZGJ27mAWjrLW
	 gGBjnFK6QIi3hIH8H3pqhjSGJYtbtBcgt46XqOaJLEWw2Opc2yv29QrYpQtDS2WV8/
	 LKDvifgnrfY9A479Bz0FUoCHVYVQf4hmsCSTMjuc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C885F8074D; Mon, 10 Nov 2025 15:40:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D42AEF80753;
	Mon, 10 Nov 2025 15:40:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D09BFF80518; Thu, 11 Sep 2025 19:21:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9C544F802DB
	for <alsa-devel@alsa-project.org>; Thu, 11 Sep 2025 19:21:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C544F802DB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=faF4Myi2
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58BHLFgj424964;
	Thu, 11 Sep 2025 12:21:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757611275;
	bh=85WtoiBUzbETvBdljqZz7Y0G6XClXtq3Z2YMPlf/Ejo=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=faF4Myi2TNWM1xUGZasPOmIZiXWp2lVjt5igHK+1BSj3CCql7Yl9rIEiWkAj4aBVL
	 FDaQ3dr2JDl0Doj37+E6AS5bqFsVuz81fe7tTrBk5YVwvjKW04SA47vBKj9xbbbcnq
	 DiESAa3iyFjBil3JGsxrEE9HkYfoYabTENtDO//Y=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58BHLEGB1321249
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 11 Sep 2025 12:21:15 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 11
 Sep 2025 12:21:14 -0500
Received: from DLEE107.ent.ti.com ([fe80::1c91:43d:d71:d7b6]) by
 DLEE107.ent.ti.com ([fe80::1c91:43d:d71:d7b6%17]) with mapi id
 15.01.2507.055; Thu, 11 Sep 2025 12:21:14 -0500
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
Subject: RE: [EXTERNAL] Re: [PATCH v4 2/6] ASoC: ops: add
 snd_soc_get_volsw_clamped
Thread-Topic: [EXTERNAL] Re: [PATCH v4 2/6] ASoC: ops: add
 snd_soc_get_volsw_clamped
Thread-Index: AQHcIzTGtrot4u9snU+tU9Djxxbn0LSOeMqA//+3SrA=
Date: Thu, 11 Sep 2025 17:21:14 +0000
Message-ID: <41a87c2b7f21467d833b7eefde8e63a0@ti.com>
References: <20250911155704.2236-1-niranjan.hy@ti.com>
 <20250911155704.2236-2-niranjan.hy@ti.com>
 <652726cc-b286-4ba0-b49c-8b981d6d0244@sirena.org.uk>
In-Reply-To: <652726cc-b286-4ba0-b49c-8b981d6d0244@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.249.144.167]
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
Message-ID-Hash: VSXJDAE77CKVOLACXCLU4VGS2XOB5VLV
X-Message-ID-Hash: VSXJDAE77CKVOLACXCLU4VGS2XOB5VLV
X-Mailman-Approved-At: Mon, 10 Nov 2025 14:39:34 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VSXJDAE77CKVOLACXCLU4VGS2XOB5VLV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

> From: Mark Brown <broonie@kernel.org>
> Sent: Thursday, September 11, 2025 9:34 PM
> To: Holalu Yogendra, Niranjan <niranjan.hy@ti.com>
> Subject: Re: [PATCH v4 2/6] ASoC: ops: add
> snd_soc_get_volsw_clamped
>=20
> On Thu, Sep 11, 2025 at 09:26:59PM +0530, Niranjan H Y wrote:
> >   Add API snd_soc_get_volsw_clamped to read
> >   the volume from device. This similar to
> >   existing API snd_soc_get_volsw. But has
> >   additional step to clamp the value to max value
> >   if the register value is larger than max value.
>=20
> Why is this a separate API, what is the situation where we would want to
> report an invalid value from a control?  I was thinking of just adding
> this to the existing operations rather than adding separate ones that
> need to be explicitly set.
  Since few of the drivers as still using the original API, and was not sur=
e if
everyone wanted to clamp the register value, did not want to disturb the
original API snd_soc_get_volsw. Per my analysis, if register read fails due=
 to=20
some issue (like IO) and, for some reason if register value was modified
to have the value greater than mc->max value, the volume is report erroneou=
sly.
  Are you thinking that this patch could be dropped and clamp the value to =
max in =20
'soc_get_volsw' (as in 1st patch) and use the same API ? Please suggest.

Thanks,
Niranjan H Y


