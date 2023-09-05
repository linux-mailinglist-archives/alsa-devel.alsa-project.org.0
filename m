Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6202792095
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Sep 2023 08:44:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24D34846;
	Tue,  5 Sep 2023 08:43:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24D34846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693896286;
	bh=Sc9etQQLXc2fcMNr/yiJfIKtG2+7vJQPFsC3i4uqfr0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RUJiG6TvpYeXIaB/1FET0KQKLzsIiIGwiAm+oOzid4hLC6JQ8bax+VwfsVTz6WxC0
	 d6qUHHcyuaZ2rO2MfbCCT1K76Hxos0CmJEfDiuDs5Cl+CHZndslEfaq5iKP9Ow/Pg2
	 4SF27riEFpjx3O8pAX59LtAcLZpGeddYr71GgTlA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2CA0F80431; Tue,  5 Sep 2023 08:43:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8EDF2F80431;
	Tue,  5 Sep 2023 08:43:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 434D5F8047D; Tue,  5 Sep 2023 08:43:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C5643F80141
	for <alsa-devel@alsa-project.org>; Tue,  5 Sep 2023 08:43:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5643F80141
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=VzhKRirT
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3856hgi2117711;
	Tue, 5 Sep 2023 01:43:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1693896222;
	bh=frzrN0CD1iImhD1/yO7v2deO9gKKaT5EqWyptPo+Amg=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=VzhKRirT4isjpNwNXDcL7Opjy6ROrIxYcu4+nOfOJ76W+UDBCQp0YhUa3dWJZLP/I
	 qe0JrH9WaSEG9l4P/QvuR2R0stSL30DQQSPZ6spff7+YNvkfzmqGy8zfMMKkw0bndA
	 OpO+DZao+Pg4dD1MvLoG8MaFgsVfEaaGt3COz/c8=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3856hg0p019793
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 5 Sep 2023 01:43:42 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 5
 Sep 2023 01:43:41 -0500
Received: from DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c]) by
 DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c%18]) with mapi id
 15.01.2507.023; Tue, 5 Sep 2023 01:43:42 -0500
From: "Ding, Shenghao" <shenghao-ding@ti.com>
To: Takashi Iwai <tiwai@suse.de>
CC: "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "andriy.shevchenko@linux.intel.com"
 <andriy.shevchenko@linux.intel.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "perex@perex.cz"
	<perex@perex.cz>,
        "pierre-louis.bossart@linux.intel.com"
	<pierre-louis.bossart@linux.intel.com>,
        "Lu, Kevin" <kevin-lu@ti.com>,
        "13916275206@139.com" <13916275206@139.com>,
        "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "liam.r.girdwood@intel.com"
	<liam.r.girdwood@intel.com>,
        "mengdong.lin@intel.com"
	<mengdong.lin@intel.com>,
        "Xu, Baojun" <baojun.xu@ti.com>,
        "thomas.gfeller@q-drop.com" <thomas.gfeller@q-drop.com>,
        "Gupta, Peeyush"
	<peeyush@ti.com>,
        "Navada Kanyana, Mukund" <navada@ti.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "gentuser@gmail.com"
	<gentuser@gmail.com>
Subject: RE: [EXTERNAL] Re: [PATCH v3] ALSA: hda/tas2781: Revert structure
 name back to cs35l41_dev_name
Thread-Topic: [EXTERNAL] Re: [PATCH v3] ALSA: hda/tas2781: Revert structure
 name back to cs35l41_dev_name
Thread-Index: AQHZ369a0Lxd4JnC40S+w7BdRCnwrLAMHHWA//+slhA=
Date: Tue, 5 Sep 2023 06:43:42 +0000
Message-ID: <d5fe78ce5cce4a9d830afdaaeb782a3e@ti.com>
References: <20230905041331.834-1-shenghao-ding@ti.com>
 <875y4pi0kk.wl-tiwai@suse.de>
In-Reply-To: <875y4pi0kk.wl-tiwai@suse.de>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.85.8.120]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Message-ID-Hash: B2ZTUHJ7O3X6OAKTOCHZE2EXO7RC362I
X-Message-ID-Hash: B2ZTUHJ7O3X6OAKTOCHZE2EXO7RC362I
X-MailFrom: shenghao-ding@ti.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B2ZTUHJ7O3X6OAKTOCHZE2EXO7RC362I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



> -----Original Message-----
> From: Takashi Iwai <tiwai@suse.de>
> Sent: Tuesday, September 5, 2023 2:42 PM
> To: Ding, Shenghao <shenghao-ding@ti.com>
> Cc: robh+dt@kernel.org; andriy.shevchenko@linux.intel.com;
> lgirdwood@gmail.com; perex@perex.cz; pierre-louis.bossart@linux.intel.com=
;
> Lu, Kevin <kevin-lu@ti.com>; 13916275206@139.com; alsa-devel@alsa-
> project.org; linux-kernel@vger.kernel.org; liam.r.girdwood@intel.com;
> mengdong.lin@intel.com; Xu, Baojun <baojun.xu@ti.com>; thomas.gfeller@q-
> drop.com; Gupta, Peeyush <peeyush@ti.com>; Navada Kanyana, Mukund
> <navada@ti.com>; broonie@kernel.org; gentuser@gmail.com
> Subject: [EXTERNAL] Re: [PATCH v3] ALSA: hda/tas2781: Revert structure na=
me
> back to cs35l41_dev_name
>=20
> On Tue, 05 Sep 2023 06:13:30 +0200,
> Shenghao Ding wrote:
> >
> > Revert structure name back to cs35l41_dev_name, this structure won't
> > be used any more in tas25781 driver code, the "bus" name can be passed
> > by tas2781_generic_fixup, hid is actually "TIAS2781", can be hardcode
> > and become an unneeded argument passed from tas2781_generic_fixup, as
> > to "index", it is a redundant member in tas2781 driver, and have never
> > been used in tas2781 hda driver before. And redefine tas2781_generic_fi=
xup.
>=20
> OK, now it's clearer.
>=20
> So the purpose of this patch is rather to simplify the code.  The revert =
of struct
> name is merely a side-effect.
>=20
> That said, you can split even more, two logical changes: one is to just s=
implify
> the code by the fixed name string, and another is the rename back to stru=
ct
> cs35l41_dev_name.
>=20
> But honestly speaking, I don't see the need for rename again; the struct =
may be
> used by other codecs, and it's fine to keep a generic struct name like th=
e
> current one.  Leaving the struct name as is will make the patch only as a
> cleanup (and you should correct the patch subject accordingly).
>=20
> And, I believe a more sensible improvement would be the use of the standa=
rd
> acpi_*_match*() API as Andy already suggested.  It can be folded into thi=
s
> cleanup or create a new patch on top of the cleanup.
>=20
>=20
> thanks,
>=20
> Takashi
>=20
>=20
OK
> >
> > Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>
> >
> > ---
> > Changes in v3:
> >  - Redefine tas2781_generic_fixup, remove hid argument, and do not use
> >    structure scodec_dev_name any more in tas2781_generic_fixup.
> >  - remove cs35l41_dev_name from comp_match_tas2781_dev_name, which
> is
> >    useless in tas2781 driver. bus name is passed by tas2781_generic_fix=
up,
> >    hid is actually "TIAS2781", can be hardcode and unneeded argument
> >    passed from tas2781_generic_fixup. Index is a redundant member, and
> >    never used in tas2781 hda driver.
> >  - revert from scodec_dev_name back to cs35l41_dev_name, tas2781 pass
> only
> >    bus name instead of cs35l41_dev_name, so it seemed unnecessary for
> >    tas2781.
> >  - revert from scodec_dev_name back to cs35l41_dev_name in
> >    cs35l41_generic_fixup
> > ---
> >  sound/pci/hda/patch_realtek.c | 27 ++++++++++-----------------
> >  1 file changed, 10 insertions(+), 17 deletions(-)
> >
> > diff --git a/sound/pci/hda/patch_realtek.c
> > b/sound/pci/hda/patch_realtek.c index a07df6f929..c3e410152b 100644
> > --- a/sound/pci/hda/patch_realtek.c
> > +++ b/sound/pci/hda/patch_realtek.c
> > @@ -6745,7 +6745,7 @@ static void comp_generic_playback_hook(struct
> hda_pcm_stream *hinfo, struct hda_
> >  	}
> >  }
> >
> > -struct scodec_dev_name {
> > +struct cs35l41_dev_name {
> >  	const char *bus;
> >  	const char *hid;
> >  	int index;
> > @@ -6754,7 +6754,7 @@ struct scodec_dev_name {
> >  /* match the device name in a slightly relaxed manner */  static int
> > comp_match_cs35l41_dev_name(struct device *dev, void *data)  {
> > -	struct scodec_dev_name *p =3D data;
> > +	struct cs35l41_dev_name *p =3D data;
> >  	const char *d =3D dev_name(dev);
> >  	int n =3D strlen(p->bus);
> >  	char tmp[32];
> > @@ -6773,19 +6773,19 @@ static int
> comp_match_cs35l41_dev_name(struct
> > device *dev, void *data)  static int comp_match_tas2781_dev_name(struct
> device *dev,
> >  	void *data)
> >  {
> > -	struct scodec_dev_name *p =3D data;
> > +	const char *bus =3D data;
> >  	const char *d =3D dev_name(dev);
> > -	int n =3D strlen(p->bus);
> > +	int n =3D strlen(bus);
> >  	char tmp[32];
> >
> >  	/* check the bus name */
> > -	if (strncmp(d, p->bus, n))
> > +	if (strncmp(d, bus, n))
> >  		return 0;
> >  	/* skip the bus number */
> >  	if (isdigit(d[n]))
> >  		n++;
> >  	/* the rest must be exact matching */
> > -	snprintf(tmp, sizeof(tmp), "-%s:00", p->hid);
> > +	snprintf(tmp, sizeof(tmp), "-%s:00", "TIAS2781");
> >
> >  	return !strcmp(d + n, tmp);
> >  }
> > @@ -6795,7 +6795,7 @@ static void cs35l41_generic_fixup(struct
> > hda_codec *cdc, int action, const char  {
> >  	struct device *dev =3D hda_codec_dev(cdc);
> >  	struct alc_spec *spec =3D cdc->spec;
> > -	struct scodec_dev_name *rec;
> > +	struct cs35l41_dev_name *rec;
> >  	int ret, i;
> >
> >  	switch (action) {
> > @@ -6824,24 +6824,17 @@ static void cs35l41_generic_fixup(struct
> > hda_codec *cdc, int action, const char  }
> >
> >  static void tas2781_generic_fixup(struct hda_codec *cdc, int action,
> > -	const char *bus, const char *hid)
> > +	const char *bus)
> >  {
> >  	struct device *dev =3D hda_codec_dev(cdc);
> >  	struct alc_spec *spec =3D cdc->spec;
> > -	struct scodec_dev_name *rec;
> >  	int ret;
> >
> >  	switch (action) {
> >  	case HDA_FIXUP_ACT_PRE_PROBE:
> > -		rec =3D devm_kmalloc(dev, sizeof(*rec), GFP_KERNEL);
> > -		if (!rec)
> > -			return;
> > -		rec->bus =3D bus;
> > -		rec->hid =3D hid;
> > -		rec->index =3D 0;
> >  		spec->comps[0].codec =3D cdc;
> >  		component_match_add(dev, &spec->match,
> > -			comp_match_tas2781_dev_name, rec);
> > +			comp_match_tas2781_dev_name, (void *)bus);
> >  		ret =3D component_master_add_with_match(dev,
> &comp_master_ops,
> >  			spec->match);
> >  		if (ret)
> > @@ -6888,7 +6881,7 @@ static void
> > alc287_fixup_legion_16ithg6_speakers(struct hda_codec *cdc, const st  s=
tatic
> void tas2781_fixup_i2c(struct hda_codec *cdc,
> >  	const struct hda_fixup *fix, int action)  {
> > -	 tas2781_generic_fixup(cdc, action, "i2c", "TIAS2781");
> > +	 tas2781_generic_fixup(cdc, action, "i2c");
> >  }
> >
> >  /* for alc295_fixup_hp_top_speakers */
> > --
> > 2.34.1
> >
