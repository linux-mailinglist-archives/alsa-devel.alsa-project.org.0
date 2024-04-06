Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABAE89AF30
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Apr 2024 09:26:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A0A42C13;
	Sun,  7 Apr 2024 09:25:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A0A42C13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712474769;
	bh=ag0L5s0NvNNpnK9VStcd/WfRuosPWnEvzhoE5NBpXEc=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pWhFiqqrj2pnKdF7X9sWqmuS54U29AmtC1lvgIFJKZllzd5idUN0eJao4QvnBWg9S
	 ng8H1DiSOrZ/ExhpDLtA4tqFTGEAylZRzv1/fdKjj2jxxLuMLuQK+kP8sB6Dc+XtGy
	 velnbhDKRBHUGuW+2u1AfwsyOP868ELBQ2Z97QGY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9411BF89826; Sun,  7 Apr 2024 09:18:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B2DBBF8981A;
	Sun,  7 Apr 2024 09:18:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99FF5F8020D; Sat,  6 Apr 2024 09:44:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 73A7FF80114
	for <alsa-devel@alsa-project.org>; Sat,  6 Apr 2024 09:43:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73A7FF80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=vKjWQ0fM
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4367hjiX079199;
	Sat, 6 Apr 2024 02:43:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1712389425;
	bh=JdMAmQ5cW5OCZ7m3+RZ4yQphAbO2Q/ZVztgpt0OA790=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=vKjWQ0fMJrsxak/iIrCmuuTc9Npo/S6tpRN2i51yTY+4gRLgadt8H3EZWW7s7fbvS
	 yv5aiR3LTlpq0ZNpyEdZaEYXHFmETAjuXIgBOHb8NX62A9npFyrD243aGg2FxF++iu
	 KWf4dSxJUrLygPEgw8LmKCbZwaavZcw1oFdNux3Y=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4367hj5t041997
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 6 Apr 2024 02:43:45 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 6
 Apr 2024 02:43:44 -0500
Received: from DLEE100.ent.ti.com ([fe80::ad4d:c227:3f85:880d]) by
 DLEE100.ent.ti.com ([fe80::ad4d:c227:3f85:880d%17]) with mapi id
 15.01.2507.023; Sat, 6 Apr 2024 02:43:44 -0500
From: "Xu, Baojun" <baojun.xu@ti.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        "tiwai@suse.de" <tiwai@suse.de>
CC: "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "andriy.shevchenko@linux.intel.com"
 <andriy.shevchenko@linux.intel.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "perex@perex.cz"
	<perex@perex.cz>, "Lu, Kevin" <kevin-lu@ti.com>,
        "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "liam.r.girdwood@intel.com" <liam.r.girdwood@intel.com>,
        "yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "soyer@irl.hu" <soyer@irl.hu>, "Ding, Shenghao" <shenghao-ding@ti.com>
Subject: Re: [EXTERNAL] Re: [PATCH v1 6/8] ALSA: hda/tas2781: Add tas2781
 SPI-based driver
Thread-Topic: [EXTERNAL] Re: [PATCH v1 6/8] ALSA: hda/tas2781: Add tas2781
 SPI-based driver
Thread-Index: AQHafxpNE61C8ldTPEOmQsI0OzAt0LFKc6YAgBB5YUk=
Date: Sat, 6 Apr 2024 07:43:44 +0000
Message-ID: <54579b5779bd4493bd4d9cb8d582896c@ti.com>
References: <20240326010905.2147-1-baojun.xu@ti.com>
 <20240326010905.2147-6-baojun.xu@ti.com>,<b4c5fb89-a43c-4c40-b729-a49a537f6179@linux.intel.com>
In-Reply-To: <b4c5fb89-a43c-4c40-b729-a49a537f6179@linux.intel.com>
Accept-Language: en-GB, zh-CN, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.64.41.93]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MailFrom: baojun.xu@ti.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 6NSCTNKCSZ6WH55XXTCL2LX7XTFC23XE
X-Message-ID-Hash: 6NSCTNKCSZ6WH55XXTCL2LX7XTFC23XE
X-Mailman-Approved-At: Sun, 07 Apr 2024 07:16:01 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6NSCTNKCSZ6WH55XXTCL2LX7XTFC23XE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Sent: 26 March 2024 23:05
> To: Xu, Baojun; tiwai@suse.de
> Cc: robh+dt@kernel.org; andriy.shevchenko@linux.intel.com; lgirdwood@gmai=
l.com; perex@perex.cz; Lu, Kevin; 13916275206@139.com; alsa-devel@alsa-proj=
ect.org; linux-kernel@vger.kernel.org; liam.r.girdwood@intel.com; yung-chua=
n.liao@linux.intel.com; broonie@kernel.org; soyer@irl.hu
> Subject: [EXTERNAL] Re: [PATCH v1 6/8] ALSA: hda/tas2781: Add tas2781 SPI=
-based driver
>=20
> > +enum device_catlog_id {
>=20
> catalog?
>=20
> > +     HP =3D 0,
> > +     OTHERS
> > +};
>=20
> Is there not a better way to identify solutions?
> You have ACPI IDs, no?

It support HP platform now only, will add other later.

Best Regards
Jim


