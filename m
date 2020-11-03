Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CAAA2A4DC6
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Nov 2020 19:01:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7E6B1671;
	Tue,  3 Nov 2020 19:00:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7E6B1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604426499;
	bh=myiQSetuaOVY2s00Fw/HJY7NZtbPqFtWMR2GOqq7LaI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c5W63Gra1SIaYHp8RLB/kAviiT04yDwREY5LEQuS1/O2A0ycVJM0RJ/NVsH/woWyK
	 YD166KFv09fi1HiGyE979FDZ37IHCcjUaj5an8Il+9swDFWUkiRpcB9+tRqajDgXZY
	 PPXjxE+4tYv+QxbkT9EJmhXO92bY4voNzrKAxVcg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12942F80083;
	Tue,  3 Nov 2020 19:00:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1BBAF80171; Tue,  3 Nov 2020 19:00:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E806F80083
 for <alsa-devel@alsa-project.org>; Tue,  3 Nov 2020 18:59:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E806F80083
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qn8i76ft"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9A0F42072D;
 Tue,  3 Nov 2020 17:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604426398;
 bh=myiQSetuaOVY2s00Fw/HJY7NZtbPqFtWMR2GOqq7LaI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qn8i76ftYKltphxPFhL0h2ueDmWQjCB5rcjfkGmf4Hhkm05JYR4/MDmKXGFRtL19i
 aAE56pxgcBMBelLc4jTt8qmjRFWUv2vl4JdklTbY5+6/OpLPfh+Z6XCnPyJt/c37r/
 yEPlke3ifo1+5OU7XlvqY90kzlZXu0RAkM9co3Is=
Date: Tue, 3 Nov 2020 17:59:48 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: rt715:add Mic Mute LED control support
Message-ID: <20201103175948.GF5545@sirena.org.uk>
References: <20201103125859.8759-1-Perry_Yuan@Dell.com>
 <20201103131253.GA5545@sirena.org.uk>
 <5f2c1282-4401-276a-8dad-127fa1f449fd@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="z0eOaCaDLjvTGF2l"
Content-Disposition: inline
In-Reply-To: <5f2c1282-4401-276a-8dad-127fa1f449fd@linux.intel.com>
X-Cookie: I don't get no respect.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: oder_chiou@realtek.com, alsa-devel@alsa-project.org,
 Limonciello Mario <Mario.Limonciello@dell.com>,
 Perry Yuan <Perry.Yuan@dell.com>, tiwai@suse.com, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com
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


--z0eOaCaDLjvTGF2l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 03, 2020 at 10:13:03AM -0600, Pierre-Louis Bossart wrote:
> Somehow this patch was filtered by alsa-devel servers?

It'll be a post by a non-subscriber I guess, in which case it will
appear later.

> Actually thinking more about it, having two controls for 'mute LED' and
> 'capture switch' could lead to inconsistent states where the LED is on
> without mute being activated.  we should really bolt the LED activation to
> the capture switch, that way the mute and LED states are aligned.

Yeah, it's just asking for trouble and seems to defeat the point of
having the LED in the first place - aside from the general issues with
it being software controlled it'll require specific userspace support to
set it.  Users won't be able to trust that the LED state accurately
reflects if they're muted or not.  Your proposal is more what I'd expect
here, I'm not sure we can do much better with something software
controllable.

--z0eOaCaDLjvTGF2l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+hmpMACgkQJNaLcl1U
h9BVjgf8C+njK++aKY8qtGeUcVwFtnGUeFxLFhVMNutmVvWC2xEtIe1hUP04ocd2
PVluV1HkQ9jWqMrlzRZHMI7Lc+4SuEYVEwWfya6u1s8ne6nLCOJ8vRD9mnYg9GIu
ad2RaisvjaxMca3wt+i1sQgr9ueXrE6t0M6mZbWUWDQLSepxRa0P8gY7JkSpH8nP
D/qm9xT72CS5wKVZ1fvNMLmtPdS937lkN0U71cvh5/1Dwmk9F9kLyTgwrgFh4UK7
ZchgT2sXjrQvItBF662cJS5dfYbOPFzfwnfpjg25+NxWt4sVrU1gWRlVQ+3rVWOg
JGrr9f+rbcbGze2XHLx359CgILZEow==
=rkbx
-----END PGP SIGNATURE-----

--z0eOaCaDLjvTGF2l--
