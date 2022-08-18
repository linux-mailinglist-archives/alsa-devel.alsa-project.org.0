Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4455980C8
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Aug 2022 11:27:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0FFB163B;
	Thu, 18 Aug 2022 11:26:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0FFB163B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660814822;
	bh=n/YmpnnI3jusujPQQ0H9VdujOiT8un6Nr19J1PBA+/o=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PRbkCHQLo7D79vQg1p2MVMKYg0zQZXOglYVgEjzv7+CkzWs6J3WLOgVdAYuAx1U7q
	 B5P4Oql0T7+5D2TAOHFCrgEg0zg10Bf/aDVTp/1f6MHslzsVm0MdJwIj+8zhA4OD52
	 XFwlz2PKUz4Tgxf6bFR++I4xBAiA3Q/NHasxTXVc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2AF09F80495;
	Thu, 18 Aug 2022 11:26:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4FF9EF80430; Thu, 18 Aug 2022 11:26:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from sender4-op-o18.zoho.com (sender4-op-o18.zoho.com
 [136.143.188.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF344F800E9
 for <alsa-devel@alsa-project.org>; Thu, 18 Aug 2022 11:25:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF344F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=icenowy.me header.i=uwu@icenowy.me
 header.b="YtYiL2JD"
ARC-Seal: i=1; a=rsa-sha256; t=1660814717; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=ecp+b6q9LKlC+2Tp45CO/kCN49M5kVOiRygPDX41MpmcwikQX6nAIfw2WcTqDsosaCBFMqyKvlJ1CzpE+qzRYNAhtXJKr5uXrQNAhfVFq3SFLi6rh/Cu7dTRRvh2LFuc62G4ltcyh16IIhZH8oUxlTOcIAVo20bTCZgs0DlRejE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1660814717;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=n/YmpnnI3jusujPQQ0H9VdujOiT8un6Nr19J1PBA+/o=; 
 b=XnnInuT+ymHQpZb+cpb3rXDGpnLIQ3VfOZrgawaSHRFCxXc3u/etCa6YlZhy6WivsCbVmCuM3o39IoJN6eg1BRt46+HZc5rSOgdUmzppHjg+/HU9pVX1RqvRJrdjJwRCovSzwzMyW/YXDlxweR1RIyFOq74KpdL8ral2uiH3T8Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1660814717; 
 s=zmail; d=icenowy.me; i=uwu@icenowy.me;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=n/YmpnnI3jusujPQQ0H9VdujOiT8un6Nr19J1PBA+/o=;
 b=YtYiL2JDifjW/6x7jRqIpLsGi9447JDxwCN1PQJ0W2nO9e0fNfCxHEswjoaSZe76
 tOCdfSNG9rddc6Zw7OuU8b08OSWW2wVXpVIaltQTHj1qyPe5DtUE78g0tXd63Gog7MM
 SZN3pLWNeHbzoKfiPBKidsVXFEZsdI6A/oe/AbEE=
Received: from edelgard.icenowy.me (112.94.101.156 [112.94.101.156]) by
 mx.zohomail.com with SMTPS id 1660814714900671.9352722842973;
 Thu, 18 Aug 2022 02:25:14 -0700 (PDT)
Message-ID: <24882ec3fed5c9772e1b04088cecece1b2477b23.camel@icenowy.me>
Subject: Re: [PATCH 2/2] ASoC: Intel: Skylake: try to get NHLT blob with PCM
 params as fallback
From: Icenowy Zheng <uwu@icenowy.me>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Date: Thu, 18 Aug 2022 17:25:09 +0800
In-Reply-To: <c3386d45-b643-b4aa-c868-5c113cd2955f@intel.com>
References: <20220725111002.143765-1-uwu@icenowy.me>
 <20220725111002.143765-2-uwu@icenowy.me>
 <4208aece-0aea-ba86-9a00-9e217546e1dd@intel.com>
 <3346b62c3cd7e07766457c9140849a31d6d8775c.camel@icenowy.me>
 <85648922-27df-051d-8ae8-d0e4e810198a@intel.com>
 <1891bc72834cb6e25d479c3968c04bcef94c3ad5.camel@icenowy.me>
 <c3386d45-b643-b4aa-c868-5c113cd2955f@intel.com>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

=E5=9C=A8 2022-08-17=E6=98=9F=E6=9C=9F=E4=B8=89=E7=9A=84 15:19 +0200=EF=BC=
=8CCezary Rojewski=E5=86=99=E9=81=93=EF=BC=9A
> On 2022-08-17 2:48 PM, Icenowy Zheng wrote:
> > =E5=9C=A8 2022-08-16=E6=98=9F=E6=9C=9F=E4=BA=8C=E7=9A=84 21:08 +0200=EF=
=BC=8CCezary Rojewski=E5=86=99=E9=81=93=EF=BC=9A
>=20
> ...
>=20
> >=20
> > Yes, it's Chell.
> >=20
> > BTW do you need other ACPI tables?
>=20
> At this point, no. Thanks for confirming the platform's name.
>=20
> > >=20
> > > ..and at this point I probably know more than enough. We have
> > > tested
> > > basically all of the KBL and AML configurations when fixing
> > > regressions
> > > during recent skylake-driver up-revs. But Chell (and Lars for
> > > that
> > > matter) families were not among them as these are based on SKL.
> > > I'll
> > > follow up on this with our partners and come back here. I'm
> > > almost
> > > certain topology files for the two families mentioned were not
> > > updated
> > > along the way.
> >=20
> > Could this be an issue of Coreboot, which generates the NHLT table?
>=20
> NHLT was left alone across all the updates. Updating it is one way of
> fixing problems but I don't believe it's necessary in your case.=20
> Topology update is more desirable approach.

BTW how could I fix the topology?

I now use topology files from GalliumOS (which, I assume, is extracted
from ChromeOS).

>=20
> > BTW I think Google pinned the official OS of this hardware to a
> > much
> > lower kernel version (but I don't want to use the official OS
> > because
> > of limited storage of Chell and lack of VM ability of the OS on
> > Chell).
>=20
> That clarifies things out. Guess the kernel version used there is
> v4.4=20
> (plus a ton of un-upstreamed patches). Again, will propagate the=20
> information up the chain. Perhaps one of the solutions for end-users=20
> would be providing working UCM files to alsa-topology-conf repo so
> users=20
> are not powerless in situations such as this one.
>=20
>=20
> Regards,
> Czarek


