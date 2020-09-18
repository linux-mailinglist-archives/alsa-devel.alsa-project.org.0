Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CBA2700BC
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Sep 2020 17:16:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F306216C8;
	Fri, 18 Sep 2020 17:15:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F306216C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600442205;
	bh=GTnoDvRhosB6M9n5DeI9RwSSY6SLlfLNaP1xWTamya8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fS9GHy+WghuEMTlulT5S4WLInLBhXUaJ2rcSRRIHmMbTCI14akJRuBofY0MjZL/2V
	 1TOG4Lw53tUVcihiJqoxorW5TjFRkgkYXoJWai+qFRVRn8fkD1F1o0CfpFBv3ovWPh
	 Qy1L4zLgf9yqe2dyqY1n6yuAv6LqNukh3ngP4AH0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11758F8015C;
	Fri, 18 Sep 2020 17:15:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5EFF6F8015A; Fri, 18 Sep 2020 17:15:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69F99F8012D
 for <alsa-devel@alsa-project.org>; Fri, 18 Sep 2020 17:14:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69F99F8012D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ypvTmK/o"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 695E923888;
 Fri, 18 Sep 2020 15:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600442092;
 bh=GTnoDvRhosB6M9n5DeI9RwSSY6SLlfLNaP1xWTamya8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ypvTmK/o6q0B/i64U0gB3eUytNeMfNb4a+P4glHntN7VGXTapb/Cf7anZM7ocI75W
 HKIrOw4gGdSG3YAOjXt0BJXYVeYOGCcGromtT2RX/Q2HvwwI4PPkwSLvHdIVvRrVTh
 eyMg6Z8G8heb+KycsCRBZdqf1F0MvbSxTp0xCxTQ=
Date: Fri, 18 Sep 2020 16:14:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 3/7] ASoC: SOF: intel: hda: support also devices with 1
 and 3 dmics
Message-ID: <20200918151402.GI5703@sirena.org.uk>
References: <20200825235040.1586478-1-ranjani.sridharan@linux.intel.com>
 <20200825235040.1586478-4-ranjani.sridharan@linux.intel.com>
 <b799ec66-356d-865e-a30b-ca28d5046326@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="rCb8EA+9TsBVtA92"
Content-Disposition: inline
In-Reply-To: <b799ec66-356d-865e-a30b-ca28d5046326@linux.intel.com>
X-Cookie: Beware of geeks bearing graft.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Stable <stable@vger.kernel.org>, Jaska Uimonen <jaska.uimonen@linux.intel.com>
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


--rCb8EA+9TsBVtA92
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 18, 2020 at 10:10:24AM -0500, Pierre-Louis Bossart wrote:

> This patch should be applied to -stable versions all the way to 5.6. It
> would be desirable for 5.5 and 5.4 as well but it will not apply cleanly.
> It's be trivial to provide a modified patch for these earlier kernel
> versions but I don't know what the process might be here?

Send a backport to Greg & stable with a note explaining what's going on.

--rCb8EA+9TsBVtA92
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9kzrkACgkQJNaLcl1U
h9BVwgf/cd3uXGMTdtaCbmsdnMIANhBu/Kq1gtff3zbzw9xziVWX4YF8BJ7C04bP
UeByQZhatukiEHMz9Kxw6KMtMBA53m50LrcWWqvyxAYe3iEcpqgegkaldq/14JL9
Hw/Vy6qOhRTUKyZEeSif0qrne5b734HZHs5bXIo6eIywtu+gEUNNXMoswsP8Kb5u
yPqvaW2rYRKcu2T+VPaehE1K7cBqy9Y5fFINBVtXPmeXxn8VIHN7JTriRY2gqtEh
Yeg25FIi+c3QKZ4jXrv2RnxicekgQq/ekregaQZogrqM5EHg5iS789nIiRcbguuM
RgQO6Imcpd0Jw6uEiLK4XcFBywpbFw==
=IvC1
-----END PGP SIGNATURE-----

--rCb8EA+9TsBVtA92--
