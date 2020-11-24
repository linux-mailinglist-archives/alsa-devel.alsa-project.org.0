Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F222C28EF
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Nov 2020 15:03:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1E8216AB;
	Tue, 24 Nov 2020 15:02:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1E8216AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606226611;
	bh=3XVmqXezRylLVvONJZOVKW6n3iizMVnTFozrfjn7H7E=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SatDQhp+/CDgTKohRy0EXSE9EGZ6WU8psblRaJxhA4UkV0lBHT+n/qdEMGGLhVufL
	 X+gcym33rKUIUo4DnB6JGCcvny2abeUbVr3iRS8LANLobWP324lHhE+cSxzH31OFPu
	 yqd6soUajIwlCIkxz+8K0HDC2WTxPy6PGXXiQ4kc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5DA6CF8015A;
	Tue, 24 Nov 2020 15:01:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1599F80165; Tue, 24 Nov 2020 15:01:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 867A9F8015A
 for <alsa-devel@alsa-project.org>; Tue, 24 Nov 2020 15:01:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 867A9F8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="YJdoed5B"
Received: from localhost (cpc102334-sgyl38-2-0-cust884.18-2.cable.virginm.net
 [92.233.91.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 28AF6206FB;
 Tue, 24 Nov 2020 14:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606226503;
 bh=3XVmqXezRylLVvONJZOVKW6n3iizMVnTFozrfjn7H7E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YJdoed5BGNuW1VANSptKZejazK5oQJBgVHsDx+nKkTMM1mB89IK7tsmLE+r/nJW79
 6lVwPzI3whvyTyJH9llsog8fnJyIyAWnwahA5Z63R1cmgqRbwA5u6zOjvNzTCCGWKb
 UEsuNfFTuORf1dpX6cNp6rXwXrxw8ErvPR3Tmd9Y=
Date: Tue, 24 Nov 2020 14:01:19 +0000
From: Mark Brown <broonie@kernel.org>
To: "Rojewski, Cezary" <cezary.rojewski@intel.com>
Subject: Re: [PATCH 00/14] ASoC: Intel/SOF: extend run-time driver selection
 to ACPI devices
Message-ID: <20201124140119.GC4933@sirena.org.uk>
References: <0badb36f-3089-dc34-f7b0-75a73b856f0d@linux.intel.com>
 <d57fa3716a974eb9ba585ddd85dbe14c@intel.com>
 <cd8e5c2f-e1c2-7fbb-bee1-cc76ec14a801@linux.intel.com>
 <d94ccf9a3c61460db88f256df1fa3240@intel.com>
 <20201120164841.GF6751@sirena.org.uk>
 <758af664b89545c5be83ca2bc81078fb@intel.com>
 <20201120180627.GI6751@sirena.org.uk>
 <c8cd5f98e7c941c1b87aaabb850ece4e@intel.com>
 <20201123173533.GL6322@sirena.org.uk>
 <41fbc38fa46f41f49b4ff846f9f7b5b2@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="bAmEntskrkuBymla"
Content-Disposition: inline
In-Reply-To: <41fbc38fa46f41f49b4ff846f9f7b5b2@intel.com>
X-Cookie: Who was that masked man?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Takashi Iwai <tiwai@suse.de>, Hans de Goede <hdegoede@redhat.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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


--bAmEntskrkuBymla
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 24, 2020 at 11:56:36AM +0000, Rojewski, Cezary wrote:

> What the patchset presents catpt vs SOF. /sof/ runs through SOF firmware
> so it cannot be account as old-implementation. It's a mix of not
> recommended fw + incorrect sw flow. As old /haswell/ is no more, there
> is no worrying about catpt deployment - it's your only option. As there
> is no userspace involved (lack of topology files), base firmware binary
> remains the same and amixer kcontrols behave 1:1 when compared to its
> predecessor, compatibility is left intact.

> That's exactly why we should be explicit in driver selection. Pretty
> sure hsw/bdw case is still mistakenly addressed to as if it was
> atom-based platform.

It's not just the userspace interface that worries people, it's also any
board specific quirks that might turn up.  A good chunk of the work with
x86 sound support is quirking around platform specifics - look at all
the patches Hans sends for example.  In an ideal world this would just
be people worrying too much but the general history with getting generic
code working well on a wide range of x86 hardware it's hard to blame
anyone for being conservative about substantial changes in the software
stack.

--bAmEntskrkuBymla
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+9Ei8ACgkQJNaLcl1U
h9DGjwf9GD3g7/dZi4d8qTW5J38BKaIkzN/b7ueu7b+CfE4AaprYQJkgO9IMjE2+
lxLwyFBpDX8Kl8WbXAlNK3BSuRe2kGFazkDuRbsvhaytlWuksp7TNA/uP8MW2lG0
X1VsebgwIDL5/Jsq1p/QgTEA5bsQ7tL/kgOJ9+HV9wYwyFJEx7Gka8owOMYLVOwa
TI0gBLGcZNInYvIMcee95k4sWeHYlLNM3D1Y7ZFjf7GNC6vUaw1FScL9MYXWbpFF
9oc+NkOENsmzu16jtdQQgaboa0S0J9txFrFlUIxeTb/PUhGHXuOlLwR5sh/tw0e7
Dxo9bUv01kjCOBbRc1awp98wJPJtVQ==
=PP2c
-----END PGP SIGNATURE-----

--bAmEntskrkuBymla--
