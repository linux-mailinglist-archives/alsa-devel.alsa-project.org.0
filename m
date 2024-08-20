Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A0B957C86
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2024 06:46:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5AA39210;
	Tue, 20 Aug 2024 06:46:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5AA39210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724129204;
	bh=E6RA2VLMwYa/hqZwfRMs5aBTRNjucjcCCGj/5lya6QM=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MKUfYey5bEu3faUFQ3woKtlVw4CmLNOD3X9C+tY2l5PssOmEwodqbLuNXyUOjT7R8
	 O/MY6BcnkBINmIZeX0TkDzDn/7Ni6XKhfpr2KJ3OySdJ9VQNXAZx0Tf7+rhrk4aJlR
	 7COdb6kUBx2hlXcPasAV+EZaJxyAv46UkVonLZfE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83CE4F805A8; Tue, 20 Aug 2024 06:46:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C43BF805AD;
	Tue, 20 Aug 2024 06:46:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C9E5F80107; Tue, 20 Aug 2024 06:39:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,TIME_LIMIT_EXCEEDED,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable version=3.4.6
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5D0ADF80107
	for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2024 06:34:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D0ADF80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=TnES/Jj8
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 47K4Y1Yc009626;
	Mon, 19 Aug 2024 23:34:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1724128441;
	bh=kwuz4qOqqHseaWVy+3dqN7fB1KqUTBhzPcnNfG3cDF0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=TnES/Jj8zZtfnlgC+al7DB3hc8smiGQc7PPfH+z6Er055IyLrQ5zyqY3bibd3f2kV
	 msNfFr0utzQUHGV3P+9Y4wwzWVFqSwdAP5y5oadAQG5sYcSKAwgGGRwtoU4y3ClReL
	 S+Rk5cbPAXC4pMWAsZuKDObG8Ti208Y5fV+ebk/g=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 47K4Y15k121851
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 19 Aug 2024 23:34:01 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 19
 Aug 2024 23:34:00 -0500
Received: from DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c]) by
 DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c%18]) with mapi id
 15.01.2507.023; Mon, 19 Aug 2024 23:34:00 -0500
From: "Ding, Shenghao" <shenghao-ding@ti.com>
To: Mark Brown <broonie@kernel.org>
CC: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "perex@perex.cz"
	<perex@perex.cz>,
        "pierre-louis.bossart@linux.intel.com"
	<pierre-louis.bossart@linux.intel.com>,
        "13916275206@139.com"
	<13916275206@139.com>,
        "zhourui@huaqin.com" <zhourui@huaqin.com>,
        "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        "Salazar, Ivan"
	<i-salazar@ti.com>,
        "liam.r.girdwood@intel.com" <liam.r.girdwood@intel.com>,
        "Yue, Jaden" <jaden-yue@ti.com>,
        "yung-chuan.liao@linux.intel.com"
	<yung-chuan.liao@linux.intel.com>,
        "Rao, Dipa" <dipa@ti.com>, "yuhsuan@google.com" <yuhsuan@google.com>,
        "Lo, Henry" <henry.lo@ti.com>, "tiwai@suse.de" <tiwai@suse.de>,
        "Xu, Baojun" <baojun.xu@ti.com>,
        "Baojun.Xu@fpt.com" <Baojun.Xu@fpt.com>,
        "Chadha, Jasjot Singh"
	<j-chadha@ti.com>,
        "judyhsiao@google.com" <judyhsiao@google.com>,
        "Navada
 Kanyana, Mukund" <navada@ti.com>,
        "cujomalainey@google.com"
	<cujomalainey@google.com>,
        "Kutty, Aanya" <aanya@ti.com>,
        "Mahmud, Nayeem"
	<nayeem.mahmud@ti.com>,
        "savyasanchi.shukla@netradyne.com"
	<savyasanchi.shukla@netradyne.com>,
        "flaviopr@microsoft.com"
	<flaviopr@microsoft.com>,
        "Ji, Jesse" <jesse-ji@ti.com>,
        "darren.ye@mediatek.com" <darren.ye@mediatek.com>,
        "antheas.dk@gmail.com"
	<antheas.dk@gmail.com>,
        "Jerry2.Huang@lcfuturecenter.com"
	<Jerry2.Huang@lcfuturecenter.com>,
        "jim.shil@goertek.com"
	<jim.shil@goertek.com>
Subject: RE: [EXTERNAL] Re: [PATCH v1] ASoc: tas2781: fixed the issue that the
 chip do not shutdown immediatly after aplay stopped
Thread-Topic: [EXTERNAL] Re: [PATCH v1] ASoc: tas2781: fixed the issue that
 the chip do not shutdown immediatly after aplay stopped
Thread-Index: AQHa8kGOtRTlQDXzQESRAjzcG5OhSbIvEwQAgAB8O8A=
Date: Tue, 20 Aug 2024 04:34:00 +0000
Message-ID: <03a3979be8af486f9911277172725d8b@ti.com>
References: <20240819141017.502-1-shenghao-ding@ti.com>
 <06667a01-32ee-403b-8c59-1ee37d2ef192@sirena.org.uk>
In-Reply-To: <06667a01-32ee-403b-8c59-1ee37d2ef192@sirena.org.uk>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.85.14.152]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Message-ID-Hash: QUEZBFG57HS5KVPL72PCNHQUUQMQWIL7
X-Message-ID-Hash: QUEZBFG57HS5KVPL72PCNHQUUQMQWIL7
X-MailFrom: shenghao-ding@ti.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QUEZBFG57HS5KVPL72PCNHQUUQMQWIL7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Broonie

> -----Original Message-----
> From: Mark Brown <broonie@kernel.org>
> Sent: Tuesday, August 20, 2024 12:07 AM
> To: Ding, Shenghao <shenghao-ding@ti.com>
> Cc: andriy.shevchenko@linux.intel.com; lgirdwood@gmail.com;
> perex@perex.cz; pierre-louis.bossart@linux.intel.com;
> 13916275206@139.com; zhourui@huaqin.com; alsa-devel@alsa-project.org;
> Salazar, Ivan <i-salazar@ti.com>; liam.r.girdwood@intel.com; Yue, Jaden
> <jaden-yue@ti.com>; yung-chuan.liao@linux.intel.com; Rao, Dipa
> <dipa@ti.com>; yuhsuan@google.com; Lo, Henry <henry.lo@ti.com>;
> tiwai@suse.de; Xu, Baojun <baojun.xu@ti.com>; Baojun.Xu@fpt.com; Chadha,
> Jasjot Singh <j-chadha@ti.com>; judyhsiao@google.com; Navada Kanyana,
> Mukund <navada@ti.com>; cujomalainey@google.com; Kutty, Aanya
> <aanya@ti.com>; Mahmud, Nayeem <nayeem.mahmud@ti.com>;
> savyasanchi.shukla@netradyne.com; flaviopr@microsoft.com; Ji, Jesse <jess=
e-
> ji@ti.com>; darren.ye@mediatek.com; antheas.dk@gmail.com;
> Jerry2.Huang@lcfuturecenter.com; jim.shil@goertek.com
> Subject: [EXTERNAL] Re: [PATCH v1] ASoc: tas2781: fixed the issue that th=
e
> chip do not shutdown immediatly after aplay stopped
>=20
> On Mon, Aug 19, 2024 at 10:10:12PM +0800, Shenghao Ding wrote:
> > Issue reported from customer that the chip do not shutdown after aplay
> > stopped until 6 mins later. Drop tasdevice_dapm_event and implement
> > .stream_mute in the tasdevice_dai_ops.
>=20
> Six minutes sounds like a usersrpace issue with userspace sitting playing=
 silence
> for a long time rather than a driver issue.  By default DAPM does defer
> powerdown, but only by seconds not minutes.
>=20
> > -	/* Codec Lock Release*/
> > -	mutex_unlock(&tas_priv->codec_lock);
> > +	/* Codec Lock/UnLock */
> > +	guard(mutex)(&tas_priv->codec_lock);
> > +	tasdevice_tuning_switch(tas_priv, mute);
>=20
> This is a much heavier weight operation than we're expecting for a mute, =
it
> should usually just be literally muting - one or two register writes, not=
 a power
> up/down sequence
Can the power on is still kept in DAMP, and move the power off(Only set the=
 register 0x2 to 0xe)=20
into the .mute_stream?
