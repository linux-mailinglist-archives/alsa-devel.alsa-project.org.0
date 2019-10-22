Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25213E0C1A
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Oct 2019 21:00:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76C69166B;
	Tue, 22 Oct 2019 21:00:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76C69166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571770857;
	bh=1y00gpWxYwr2WHPNm3EUg4MqJIAcO36OoN0iC7v/pRc=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pPi5ppc0tIfgQ0RR3gBU/Ch1OkTqMQQ9uSauxIn4dZ0KhTmDKpKcUIJ5LEOPlv8Kf
	 iR0ht8sipunHqOHyvndrY9Y0wINrw/vHamfKs+KfJW2dLrtPmW7euYWcLVx7qUhHwn
	 cDZXAKss/FSDMtdTFxtRyGM/dq5lKZeRg2EGhJKI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6C25F80377;
	Tue, 22 Oct 2019 20:59:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA36BF8031A; Tue, 22 Oct 2019 20:59:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5CDB2F8026A
 for <alsa-devel@alsa-project.org>; Tue, 22 Oct 2019 20:59:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CDB2F8026A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="ARKzlJx+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=q4yoqeUwewR1NXQ+etB/oE+Gawmpe6CMHr95Egm6UR4=; b=ARKzlJx+WyLYpYiuKrhXpDAnr
 Je3VHuYrbvddTnAFITZuais90IYvZvQ7iAiVbqm49blJBhXNMu0Nl0aDWdeknxYlzIcAADCptN05p
 uYZwJzHm6zgqdUdpl9zZBhavMe90nzrsFOrD7f4voncIJkB4d+hx5Es5y+81qKJ4c5Fyg=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iMzN5-0007Hc-Uu; Tue, 22 Oct 2019 18:59:08 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 1A1AC2743259; Tue, 22 Oct 2019 19:59:07 +0100 (BST)
Date: Tue, 22 Oct 2019 19:59:06 +0100
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org
Message-ID: <20191022185906.GZ5554@sirena.co.uk>
References: <20191009181356.GO2036@sirena.org.uk>
MIME-Version: 1.0
In-Reply-To: <20191009181356.GO2036@sirena.org.uk>
X-Cookie: Whip it, whip it good!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Takashi Iwai <tiwai@suse.de>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Daniel Baluta <daniel.baluta@gmail.com>,
 Curtis Malainey <cujomalainey@google.com>
Subject: [alsa-devel] [ANNOUNCE] 2019 Linux Audio miniconference
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
Content-Type: multipart/mixed; boundary="===============4926291718087186948=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============4926291718087186948==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZuvoxmZMh0nHqhEq"
Content-Disposition: inline


--ZuvoxmZMh0nHqhEq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

As in previous years we're going to have an audio miniconference so we can
get together and talk through issues, especially design decisions, face to
face.  This year's event will be held on October 31st in Lyon, France,
the day after ELC-E.  This will be held at the Lyon Convention Center (the
ELC-E venue) and will be free of charge to attend, generously
sponsored by Intel.

Thus far for the agenda we have is:

 - Use case management enhancements (Curtis)
 - DSP framework integration (Liam)
  - SOF integration with ACPI and DT (Daniel)
  - SOF support for non-modular drivers (Daniel)
 - Soundwire status (Liam?)
  - Multi-CPU support
  - Mixing with HDA/I2S in a single system
 - Virtualization (Liam)
 - Componentisation status/plans (Me)

As with previous years let's pull together an agenda through a mailing
list discussion - if people could reply to this mail with any topics
they'd like to discuss we can take it from there.  Of course if we can
sort things out more quickly via the mailing list that's even better!

If you're planning to attend please fill out the form here:

    https://docs.google.com/forms/d/e/1FAIpQLSd6FV-tWYZ1fHlCmyzQhG98OtYH9W9GX-1dQ88mnLxVRGyPww/viewform?usp=sf_link

This event will be covered by the same code of conduct as ELC-E.

Thanks again to Intel for supporting this event.

Thanks,
Mark

--ZuvoxmZMh0nHqhEq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2vUXoACgkQJNaLcl1U
h9Adfwf/aqLlEG0r4WPLSsg36NL9JE4eI4JEv30RveQBySZpgaJ/rAv+lzOUO7nE
X4InVXspjk4MyYuRWBrXZ14Q/6WFexOoN9bec2oLkP60JRxj9wdz5ci2AqMG/T+K
zXzIYpFBCerVjXQYPjBtWMaVFnp1paixB/PjEext/07wDWxEMFFupkmikhdViqR8
XNlu5u+N88cQbjurXv8j0H+8749uJpIbMwPJz3BnIHEL93p4pJJezcAOZKedF80p
r1INgwHLKC+b6Soeku+jV8AswcNbVB9OVbfRqiZMpzlLLDx+l5bV4BaE/Dxpwupi
ydXhzDQQ8gylR+JD9dN3IrprHv86dw==
=G1mI
-----END PGP SIGNATURE-----

--ZuvoxmZMh0nHqhEq--

--===============4926291718087186948==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============4926291718087186948==--
