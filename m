Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE60585185
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Jul 2022 16:25:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 008EB15C3;
	Fri, 29 Jul 2022 16:25:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 008EB15C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659104754;
	bh=4sa/AklKOgBm/cF7QLYh146fBhMA1Du5BqU7m49UU+A=;
	h=From:To:References:In-Reply-To:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QFVCiPaHLVpI9eiEgTUQjywYrQZQbULVT3Odeb3VNwGnPCkTr33FaRRyV/2mLU7ha
	 Qa2gvEoBsV20fQtbEbDXb3UQthRZ7j+pFJTymzUbHXofL9QPV9chxBPiaE1Ct2IsY/
	 vxoxgZukFbmaxyYRgQMMYQBkLC+Vpk6XPPQ/Zpe8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 406D0F804B1;
	Fri, 29 Jul 2022 16:24:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33563F8049C; Fri, 29 Jul 2022 16:24:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E5F4F800BD
 for <alsa-devel@alsa-project.org>; Fri, 29 Jul 2022 16:24:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E5F4F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="ipfhot+E"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26TBvJkh009269;
 Fri, 29 Jul 2022 09:24:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 references : in-reply-to : subject : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=hKCkz5vC7H4oaj3WOgNktGC6w/6bpup/y8bypzeNl/w=;
 b=ipfhot+EiJE1rBF1BsY5/GxXpAndNRvv5oggGNp3yQ9P2KtzrW37Cjss0g40wYBrvLUn
 9bEB9qgi2At9Co9cVPYPGG3Hkfs0lzSDYWweL4lxJL9haYPrO9mfHZLZ0q4CQZ1kcKkO
 AJfj+qxQiUpqgQhqfDVwulBUvlVmdpl0VhKaCEm0EjckolfI+QDZJPKTJn1vxwRNukrK
 g+Tj6Kd4fFBOVvWkCSmXDrotqWUsN7z+RmZlpvp/ON6jGh5fvzv1A4q3HENLTQ49Ilh8
 GiTvGPJ0g3PaH0eZZ9s5K/WnAgGmogglyuYowmgVDSMZpAdcPO+zpP3LqK5BAF1mjJ4t 1Q== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3hgddp868j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Jul 2022 09:24:43 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.9; Fri, 29 Jul
 2022 09:24:42 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.9 via Frontend
 Transport; Fri, 29 Jul 2022 09:24:42 -0500
Received: from LONN2DGDQ73 (unknown [198.90.238.229])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 196552D4;
 Fri, 29 Jul 2022 14:24:42 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: 'Pierre-Louis Bossart' <pierre-louis.bossart@linux.intel.com>, "'Mark
 Brown'" <broonie@kernel.org>, 'Liam Girdwood' <lgirdwood@gmail.com>,
 "'Brent Lu'" <brent.lu@intel.com>, 'xliu' <xiang.liu@cirrus.com>
References: <20220727160051.3373125-1-sbinding@opensource.cirrus.com>
 <69713155-39b0-5492-4966-73dfdacd1fc1@linux.intel.com>
In-Reply-To: <69713155-39b0-5492-4966-73dfdacd1fc1@linux.intel.com>
Subject: RE: [PATCH v2] ASoC: Intel: cirrus-common: Use UID to map correct amp
 to prefix
Date: Fri, 29 Jul 2022 15:24:42 +0100
Message-ID: <001c01d8a356$f1b4e9f0$d51ebdd0$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIu+zYjutHUxuurajS4bthg+gYcqQJYYBCXrNXz4SA=
X-Proofpoint-GUID: nQKP2W_n00lxkvd5lKGmylmeBuz7MNqn
X-Proofpoint-ORIG-GUID: nQKP2W_n00lxkvd5lKGmylmeBuz7MNqn
X-Proofpoint-Spam-Reason: safe
Cc: 'Vitaly Rodionov' <vitalyr@opensource.cirrus.com>,
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

> -----Original Message-----
> From: Alsa-devel <alsa-devel-bounces@alsa-project.org> On Behalf Of
> Pierre-Louis Bossart
> Sent: 27 July 2022 17:37
> To: Stefan Binding <sbinding@opensource.cirrus.com>; Mark Brown
> <broonie@kernel.org>; Liam Girdwood <lgirdwood@gmail.com>;
> Brent Lu <brent.lu@intel.com>; xliu <xiang.liu@cirrus.com>
> Cc: Vitaly Rodionov <vitalyr@opensource.cirrus.com>;
> patches@opensource.cirrus.com; alsa-devel@alsa-project.org; linux-
> kernel@vger.kernel.org
> Subject: Re: [PATCH v2] ASoC: Intel: cirrus-common: Use UID to map
> correct amp to prefix
>=20
>=20
>=20
>=20
> > +/*
> > + * Expected UIDs are integers (stored as strings).
> > + * UID Mapping is fixed:
> > + * UID 0x0 -> WL
> > + * UID 0x1 -> WR
> > + * UID 0x2 -> TL
> > + * UID 0x3 -> TR
> > + * Note: If there are less than 4 Amps, UIDs still map to
> WL/WR/TL/TR. Dynamic code will only create
> > + * dai links for UIDs which exist, and ignore non-existant ones.
>=20
> is this intentional to support all variations of 1,2,3 and 4 =
amplifiers
> being present?
>=20
> Or is the intent to really support 2 or 4?

The intent was to support 2 or 4, rather than any number of amps, in
case something was released with 2 amps.

>=20
> > + * Return number of codecs found.
> > + */
> > +static int cs35l41_compute_codec_conf(void)
> > +{
> > +	const char * const uid_strings[] =3D { "0", "1", "2", "3" };
> > +	unsigned int uid, sz =3D 0;
> > +	struct acpi_device *adev;
> > +	struct device *physdev;
> > +
> > +	for (uid =3D 0; uid < CS35L41_MAX_AMPS; uid++) {
> > +		adev =3D acpi_dev_get_first_match_dev(CS35L41_HID,
> uid_strings[uid], -1);
> > +		if (!adev) {
> > +			pr_warn("Cannot find match for HID %s UID
> %u (%s)\n", CS35L41_HID, uid,
> > +				cs35l41_name_prefixes[uid]);
>=20
> A warning is a bit strong if some valid configurations don't expose =
all
> 4 codecs.

I'll change this to a debug message, but also add an error if there is =
not
2 or 4 amps found.

>=20
> > +			continue;
> > +		}
> > +		physdev =3D
> get_device(acpi_get_first_physical_node(adev));
> > +		cs35l41_components[sz].name =3D dev_name(physdev);
> > +		cs35l41_components[sz].dai_name =3D
> CS35L41_CODEC_DAI;
> > +		cs35l41_codec_conf[sz].dlc.name =3D
> dev_name(physdev);
> > +		cs35l41_codec_conf[sz].name_prefix =3D
> cs35l41_name_prefixes[uid];
> > +		acpi_dev_put(adev);
> > +		sz++;
> > +	}
> > +	return sz;

Thanks,
Stefan

