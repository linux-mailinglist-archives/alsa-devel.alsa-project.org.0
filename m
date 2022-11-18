Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C69562F5A6
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Nov 2022 14:13:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6198916AB;
	Fri, 18 Nov 2022 14:12:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6198916AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668777227;
	bh=ogCgxgQsXdIGmtzz2eakVarh+eKQrYvaH2DjUn25Z/A=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HYSWCpzf6CFXicjBpmLLKXMe8dPVTbK0MqFW3a0L2XEvbt+hCeowyobi3sAUDeV6z
	 jwaZfwV5mWT+Xh/6KkqB8h0JJtHGwLxyke+wEDA6v/xDqzYDMVMrC032EIssBI4S1Y
	 Jaby1IEbnuCpW8lWZsAJUyouEDaUlyKCix95SfzM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01B95F8020D;
	Fri, 18 Nov 2022 14:12:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48815F801D8; Fri, 18 Nov 2022 14:12:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 79ECAF800B5
 for <alsa-devel@alsa-project.org>; Fri, 18 Nov 2022 14:12:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79ECAF800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="p8SrqPPD"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7585CB823B1;
 Fri, 18 Nov 2022 13:12:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDAC4C433D7;
 Fri, 18 Nov 2022 13:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668777165;
 bh=ogCgxgQsXdIGmtzz2eakVarh+eKQrYvaH2DjUn25Z/A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p8SrqPPD5ygSUo0n6kIaAMeUqsb5O4REBxus5UdXX2qFFXC+cWW+z4VkRgLywPcqS
 qRzPq/xwDumQq9BY7DLVRk68jIuGXySSSZSskagVh4kOK9VTvO8nkNSeaSYZUHvCio
 Sxm6DtGf8fKNUUi5GtQ3jzZH2ZFbd2HPA5s58vB4VOI1WDltLgfYkLSDegNoa1X2lh
 J8z5XoUSg+hw+SOY9pisaDvJqkXtshjhdc9Jlo7c8sB3KC6u67nFmg+WzQ+D4wUJwf
 a4g9CPqcB1kS9BAqkW69imxYNVyVsOPNpvK4ChC7RCzvZCFGzPRNu/mocdBblyvsow
 VhkHmJBqfh43g==
Date: Fri, 18 Nov 2022 13:12:41 +0000
From: Mark Brown <broonie@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH 01/11] ASoC: ak5386: switch to using gpiod API
Message-ID: <Y3eEyf9fv0A5obNR@sirena.org.uk>
References: <20221116053817.2929810-1-dmitry.torokhov@gmail.com>
 <Y3S9KzTE1/UQDmJl@sirena.org.uk> <Y3U1BJAPOJTLw/Zb@google.com>
 <Y3YcLulaebidYYsg@sirena.org.uk> <Y3cm1eeDN+n3tbpG@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="tU6ohxgfYVuZNc6t"
Content-Disposition: inline
In-Reply-To: <Y3cm1eeDN+n3tbpG@google.com>
X-Cookie: Ego sum ens omnipotens.
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
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


--tU6ohxgfYVuZNc6t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 17, 2022 at 10:31:49PM -0800, Dmitry Torokhov wrote:
> On Thu, Nov 17, 2022 at 11:34:06AM +0000, Mark Brown wrote:

> > That doesn't address the bit about checking that the device
> > describes the signal as active low in hardware - it's assuming
> > that the signal is described by the device as an active low
> > reset and not for example as a shutdown signal.

> Huh? If we add a quirk to gpiolib to treat the signal as active low
> (i.e. preserve current driver behavior - I am talking about this
> particular peripheral here, not treating everything as active low of
> course).

My comments were more generic ones about the whole series since
all the patches seemed to be doing the same thing with flipping
the polarity - some of the GPIOs were labelled as things like
reset which is active high if it's not nRESET or something even
though we want to pull it low while using the device.

> > TBH I'm not thrilled about just randomly breaking ABI
> > compatibility for neatness reasons, it's really not helping
> > people take device tree ABI compatibility seriously.

> Yes, I freely admit I do not take device tree ABI compatibility
> seriously. IMO, with the exception of a few peripherals, it is a
> solution in search of a problem, and we declared stability of it too
> early, before we came up with reasonable rules for how resources should
> be described. I strongly believe that in vast majority of cases devices
> with out-of-tree DTs will not be updated to upstream kernels as this
> requires significant engineering effort and vendors usually not
> interested in doing that.

There are practical systems which ship DTs as part of the
firmware, and frankly things like this do contribute to the
issue.  The systems that just ship their DTs are obviously a lot
less visible, but that's the whole goal here.  It's most common
with more server type systems using EDK2 for the firmware, ACPI
isn't always a good fit for them.

--tU6ohxgfYVuZNc6t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmN3hMYACgkQJNaLcl1U
h9B8Rgf+OPKm9HTN6TrD16yqb+6BPDK6pL+Nm+OBSQBKxddvlQMwMF8i+VBXCC7b
ORB4iUroRnGPbx3XYekpEdnjBwfpdNjUCc3Wm24cIwJp99BmKuCHnSCk5shn1s35
EJquFVQbgMz+qHLlIcnbySulM/wIpuhI5+4klYbqGEfway5sPJeZUKSjah1RNmK0
lwYYQM+Ut4FwZcL7s48JAnVpYd1x589K8mKMUMFCPofys0QUhFV5g97/GNLNmu5s
31XlfEkNtzp2thB4OYuXrupJ2+SMa3AcPqROnCO0ktCdAOrn+XeRTSXQjS+ZJ9cZ
PLXvQhwEi6bg7Pq8JEOFHMdxK5NybA==
=dgNV
-----END PGP SIGNATURE-----

--tU6ohxgfYVuZNc6t--
