Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75419B5762
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Sep 2019 23:11:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EAF631670;
	Tue, 17 Sep 2019 23:10:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EAF631670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568754702;
	bh=5uK6eZupt93dgVGzBDWzdYS0w18H4EDD5C+sZOHyBZU=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TiWM3WU0qzCs5dap4b3knfcH0r05yXAuy0u5TOtStL04E4qQF7x8RgJxzbsevVFaY
	 G66V+xwgtN8SihaKiXiZ36xKL6LK8PLPnPswzCoQ7fe9zjnI1tc9CZPjOaABDQda4U
	 pkBvhTtMzOeO8Q1Og4Xu9EW9OtUaae29mChKPrWo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D33DF801DA;
	Tue, 17 Sep 2019 23:09:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E899F80361; Tue, 17 Sep 2019 23:09:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C363F801DA
 for <alsa-devel@alsa-project.org>; Tue, 17 Sep 2019 23:09:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C363F801DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="fhiHAmaf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jld0yZEw55In5jpVaa4Qk/ndcF02e5s6HUv7kus85n8=; b=fhiHAmafa4gs1hMGjvNTl3Jjb
 X7WJ3w6LGRTu/PXz2TpOPC2rW/rcTGW1PTs/THqbV1d6DFVwdT4p1ZNlX8A7i0OrICr3q+JxaCwxl
 1IFIqq3wSO/4N+32vg9LMVAfSuTd73JHduxq1rLyvt7Dz3QVK6Ke4q8Z/3vvogw9I3/3k=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iAKjL-0000eM-5a; Tue, 17 Sep 2019 21:09:47 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 1DD1A27428EA; Tue, 17 Sep 2019 22:09:46 +0100 (BST)
Date: Tue, 17 Sep 2019 22:09:45 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20190917210945.GB47411@sirena.co.uk>
References: <20190917103858.GA3524@sirena.co.uk>
 <a71b94b7-7692-2f12-8568-488bf845742c@linux.intel.com>
 <s5h5zlqtz5c.wl-tiwai@suse.de>
MIME-Version: 1.0
In-Reply-To: <s5h5zlqtz5c.wl-tiwai@suse.de>
X-Cookie: Have you locked your file cabinet?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Linus Torvalds <torvalds@linuxfoundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mac Chiang <mac.chiang@intel.com>, linux-next@vger.kernel.org
Subject: Re: [alsa-devel] Build failure after merge of the sound-current
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
Content-Type: multipart/mixed; boundary="===============7333483286499117944=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============7333483286499117944==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5vNYLRcllDrimb99"
Content-Disposition: inline


--5vNYLRcllDrimb99
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 17, 2019 at 11:02:07PM +0200, Takashi Iwai wrote:
> Pierre-Louis Bossart wrote:

> > Seems like a conflict with
> >=20
> > af239c44e3f97 ('x86/intel: Aggregate big core mobile naming')

> > maybe we can have a temporary fix in the ASoC tree along the lines of

> Ah thanks, that's the piece I've missed.  The conflict appears *after*
> the merge with tip.  I have tested only the merge result with Linus
> tree, so it didn't appear in my build tests.

> Putting Linus to Cc, so that he can see the possible conflicts
> beforehand.

FWIW -next has been carrying the patch below (it was added against the
tip tree so I didn't notice it when it blew up today after takashi moved
the merge window stuff so the new code appears earlier in the merge
process), sorry about that.  I should start carrying it again tomorrow.

=46rom 7e613e2a042c3cd7e3b69c11f52e046257ba5cbd Mon Sep 17 00:00:00 2001
=46rom: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 29 Aug 2019 16:08:49 +1000
Subject: [PATCH] ASoC: Intel: boards: merge fix for INTEL_FAM6_KABYLAKE_MOB=
ILE
 -> INTEL_FAM6_KABYLAKE_L change

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Mark Brown <broonie@kerenl.org>
---
 sound/soc/intel/common/soc-intel-quirks.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/common/soc-intel-quirks.h b/sound/soc/intel/co=
mmon/soc-intel-quirks.h
index e6357d306cb8..863a477d3405 100644
--- a/sound/soc/intel/common/soc-intel-quirks.h
+++ b/sound/soc/intel/common/soc-intel-quirks.h
@@ -36,7 +36,7 @@ SOC_INTEL_IS_CPU(byt, INTEL_FAM6_ATOM_SILVERMONT);
 SOC_INTEL_IS_CPU(cht, INTEL_FAM6_ATOM_AIRMONT);
 SOC_INTEL_IS_CPU(apl, INTEL_FAM6_ATOM_GOLDMONT);
 SOC_INTEL_IS_CPU(glk, INTEL_FAM6_ATOM_GOLDMONT_PLUS);
-SOC_INTEL_IS_CPU(cml, INTEL_FAM6_KABYLAKE_MOBILE);
+SOC_INTEL_IS_CPU(cml, INTEL_FAM6_KABYLAKE_L);
=20
 static inline bool soc_intel_is_byt_cr(struct platform_device *pdev)
 {
--=20
2.20.1

--5vNYLRcllDrimb99
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2BS5kACgkQJNaLcl1U
h9BLQAf+Jvohm9aZOiHdmqqke2SZ3GYKgp7w9R2z/D8bdo2QKl0y1/ykQQhmYST2
38GkWVhHAFpWSSKGp9gf/gAh/wVqTHL7BndBen872AXuQPkVgX2iPuuIz9Rvf0tD
1CxZ53oxo0KjgoWt+iecfvxjp85XSLOklL47c4E89sm/iuOyV0t/YcKx87ahnLH4
uFYk+p5TsXgve1NeTXsO1Khcp3cZUPepjngXhrjPJB5iHrnv+1gQlM5hsRXcJ5A2
qiJSkxF/SOaR2hMcQGqXm+tkfbsnLg2lmEXhEFSgw9bWlaeWnW6bYvMHe4jhSZBA
3EVNQWnCA9mhY8yWtNwLRQbdGXH7gQ==
=8oAQ
-----END PGP SIGNATURE-----

--5vNYLRcllDrimb99--

--===============7333483286499117944==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============7333483286499117944==--
