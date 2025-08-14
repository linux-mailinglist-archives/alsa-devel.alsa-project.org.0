Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE219B25CCA
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Aug 2025 09:12:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C9E76027C;
	Thu, 14 Aug 2025 09:12:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C9E76027C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1755155550;
	bh=mW15UHDn6wnzhPqCoXDGZKCsA6Pf/u7eGY8nwJzI24o=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KaD3yiHTSv82V1SFM7EbqU8Zggv9m+KG8euyPcmbunWIckZ7BrtT9rfqMGWYUHbKN
	 GEbKMwvjWp0FOZ+xSrPQAuzS5ENAsxAFKWbV4x9RrVGKAPdQ/YqEurxsTflFyW8N7T
	 r/v2/UW79fXsfwLvQjhok5U/YrHsBrJCquEJKAHQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73A1BF80632; Thu, 14 Aug 2025 09:11:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F67FF80624;
	Thu, 14 Aug 2025 09:11:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96096F804CF; Thu, 14 Aug 2025 04:29:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5ECD5F800F3
	for <alsa-devel@alsa-project.org>; Thu, 14 Aug 2025 04:29:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5ECD5F800F3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=ri3Lmuz+
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57E2TBSM2283045;
	Wed, 13 Aug 2025 21:29:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755138551;
	bh=itwmlhg4+q60oicA+ZGoF7Spdlc+N8ObdJ05D9SACGU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=ri3Lmuz+7XBAB7VgGiZO2yQfCs/56dEcXVLUFNkUgaD6IbvKeb0TXggumdmRucdgg
	 ULYM3YK+6ZoPE6WWJJXsiljkA5kCGLx6cK4a/rTls2nqYtz0mFZf3LbxvB0+yhwUnx
	 JD3jWeNmf5yGBM8aLyUlfugq38wmOSLrFgvVpNlE=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57E2TAT91399281
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 21:29:10 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 21:29:10 -0500
Received: from DLEE100.ent.ti.com ([fe80::ad4d:c227:3f85:880d]) by
 DLEE100.ent.ti.com ([fe80::ad4d:c227:3f85:880d%17]) with mapi id
 15.01.2507.055; Wed, 13 Aug 2025 21:29:10 -0500
From: "Xu, Baojun" <baojun.xu@ti.com>
To: Takashi Iwai <tiwai@suse.de>
CC: "broonie@kernel.org" <broonie@kernel.org>,
        "andriy.shevchenko@linux.intel.com"
 <andriy.shevchenko@linux.intel.com>,
        "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        "Ding, Shenghao"
	<shenghao-ding@ti.com>,
        "13916275206@139.com" <13916275206@139.com>,
        "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [EXTERNAL] Re: [PATCH v1] ALSA: hda/tas2781: Normalize the volume
 kcontrol name
Thread-Topic: [EXTERNAL] Re: [PATCH v1] ALSA: hda/tas2781: Normalize the
 volume kcontrol name
Thread-Index: AQHcDDpRRAd6Fte3skKvVBN7u6KS07RhDa0AgABcAOg=
Date: Thu, 14 Aug 2025 02:29:10 +0000
Message-ID: <417f8e1c8a314ae4a77070f313d8af2c@ti.com>
References: 
 <20250813100842.12224-1-baojun.xu@ti.com>,<87ectfw7j5.wl-tiwai@suse.de>
In-Reply-To: <87ectfw7j5.wl-tiwai@suse.de>
Accept-Language: en-GB, zh-CN, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.165.138]
x-c2processedorg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MailFrom: baojun.xu@ti.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: XBVH7PPBVBZXHTMDNQGCFICOID7D6CXW
X-Message-ID-Hash: XBVH7PPBVBZXHTMDNQGCFICOID7D6CXW
X-Mailman-Approved-At: Thu, 14 Aug 2025 07:11:27 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XBVH7PPBVBZXHTMDNQGCFICOID7D6CXW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

Answer in line.

> ________________________________________
> From: Takashi Iwai <tiwai@suse.de>
> Sent: 13 August 2025 23:44
> To: Xu, Baojun
> Cc: broonie@kernel.org; andriy.shevchenko@linux.intel.com; alsa-devel@als=
a-project.org; Ding, Shenghao; 13916275206@139.com; linux-sound@vger.kernel=
.org; linux-kernel@vger.kernel.org
> Subject: [EXTERNAL] Re: [PATCH v1] ALSA: hda/tas2781: Normalize the volum=
e kcontrol name
>=20
> On Wed, 13 Aug 2025 12:08:42 +0200,
> Baojun Xu wrote:
> >
> > Change the name of the kcontrol from "Gain" to "Volume".
>=20
> Could you describe "why this change is needed"?
>=20
This name is in kcontrol, which is open to users.
Volume is more normalized and common.
Gain is a more professional term in smart amplifiers.

>=20
> thanks,
>=20
> Takashi
>=20
> >
> > Signed-off-by: Baojun Xu <baojun.xu@ti.com>
> > ---
>>  sound/hda/codecs/side-codecs/tas2781_hda_i2c.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c b/sound/hda=
/codecs/side-codecs/tas2781_hda_i2c.c
> > index 92aae19cfc8f..e4bc3bc756b0 100644
> > --- a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
> > +++ b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
> > @@ -256,7 +256,7 @@ static const struct snd_kcontrol_new tas2770_snd_co=
ntrols[] =3D {
> >  };
> >
> >  static const struct snd_kcontrol_new tas2781_snd_controls[] =3D {
> > -     ACARD_SINGLE_RANGE_EXT_TLV("Speaker Analog Gain", TAS2781_AMP_LEV=
EL,
> > +     ACARD_SINGLE_RANGE_EXT_TLV("Speaker Analog Volume", TAS2781_AMP_L=
EVEL,
> >               1, 0, 20, 0, tas2781_amp_getvol,
>>               tas2781_amp_putvol, amp_vol_tlv),
> >       ACARD_SINGLE_BOOL_EXT("Speaker Force Firmware Load", 0,
> > --
> > 2.43.0
> >
>=20
>=20

Best Regards
Jim=
