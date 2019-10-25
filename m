Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E1DE4F8C
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Oct 2019 16:51:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 877391855;
	Fri, 25 Oct 2019 16:50:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 877391855
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572015066;
	bh=S6SvH3MtvxEV+RXWZmnie6/gUFhlmTcW8jIud2u9zFo=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IHq20sBMoeLX6V6RNv7N1lIC5B8suVRUtmV5FZ3fvdTHKwEaolDvfWvTNt0dMyT/M
	 VgmpuM0J9rI0mTWm/Z3VOqo4OJXNRdCpGQx+7rZfV54G4xUFOQdXIqwHzveLVDWEYW
	 gKVCxqVSWS/xCtHuXbkooZr7RBLF1T403hTFOOGU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 026EDF803D7;
	Fri, 25 Oct 2019 16:49:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2767F803D7; Fri, 25 Oct 2019 16:49:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 87BA4F80112
 for <alsa-devel@alsa-project.org>; Fri, 25 Oct 2019 16:49:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87BA4F80112
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="itqpOatC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tG8UDzhUqNZ1pZMlQf7wholnXAxkucrMRQfr2IEHAFo=; b=itqpOatC52Ahj8T/B5my2EPre
 5OnOHVbkXcQfL11TAT1gJCY7wJ9zv3YLz85XgJYOg5jeSOnHbCxYKjon3M3mVnrjUQHGEkzIm4L5v
 0qbXVu+EjUEybYtG4UMWG7mQCCV6z+pruSU3a2KEm/ud/knyyU0f/nzq4uI78AbArGW3g=;
Received: from host86-174-61-171.range86-174.btcentralplus.com
 ([86.174.61.171] helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1iO0uX-00074h-4U; Fri, 25 Oct 2019 14:49:53 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 59296D020AD; Fri, 25 Oct 2019 15:49:52 +0100 (BST)
Date: Fri, 25 Oct 2019 15:49:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20191025144952.GF4568@sirena.org.uk>
References: <20191025123038.19728-1-perex@perex.cz>
 <s5hk18tuhio.wl-tiwai@suse.de>
 <bce57a56-99d0-62d7-1d53-099a75349341@perex.cz>
 <s5h36fgvs0m.wl-tiwai@suse.de>
 <9403a6a7-9b7e-c2a4-5acf-50d6cbaea7c7@perex.cz>
 <s5hwocsucfp.wl-tiwai@suse.de>
MIME-Version: 1.0
In-Reply-To: <s5hwocsucfp.wl-tiwai@suse.de>
X-Cookie: Keep out of the sunlight.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: change 'HDMI/DP, pcm=' to 'HDMI/DP,
 pcm=' Jack control names
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
Content-Type: multipart/mixed; boundary="===============8432224023795865618=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============8432224023795865618==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IU5/I01NYhRvwH70"
Content-Disposition: inline


--IU5/I01NYhRvwH70
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 25, 2019 at 04:28:26PM +0200, Takashi Iwai wrote:
> Jaroslav Kysela wrote:
> > Dne 25. 10. 19 v 16:06 Takashi Iwai napsal(a):

> > > Well, that's obviously against our dont-breaking-user-space rule.
> > > The UCM profiles have been widely used on Chromebooks, and they can't
> > > upgrade easily.

> > > So, I believe this is a case where we have to live with messes.

> > If we speak about Google's kernels, they can apply a revert (depends
> > on their upgrade/maintenance policy). If users use the standard Linux
> > distributions, then we are fine, don't we?

> No, we can't break the already existing user-space.  That's what Linus
> suggested repeatedly over years, too.

I agree.  There's some systems where we can get away with
incompatible changes as realistically the users are doing full
system upgrades and don't care but the Chromebooks definitely
aren't one of them, we've had issues reported with breakages on
them due to changes with the x86 DSP firmwares.  It's mainly
people sideloading a regular Linux userspace along with the
ChromeOS kernel AIUI.

--IU5/I01NYhRvwH70
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2zC48ACgkQJNaLcl1U
h9BArAgAhvXKnyq0vXR1K0u8AHcWiagbmmBGL4N1jFVMX2muswj9cxQ8mSiT77WS
nlWeONJhEx2aG0X06Nbwslu4yaxQwxB7ynTZMQNwdON1cEzOFmkVi4Kw25kHwrsV
3DscyJVHPHqJ8Acyx+zduh8uS1RF+h6jJ78OuOSj/llKmX//csSVX4vc+Ag5bITT
X/dD8ERCsfr9C6ifX+kOn7rNCMsNN5sQ0zKKtyR/b0g5WKVQ8eZPs2A6hLjb5HRH
BenSNccYYCyo0XbN/nIjEiOI6lcHNYqLDkDXpcZ+D+r8PWl3R1vDxhmQbaysthEb
GLdvRD44+A46QKDJ4e8+N4XzeIDMfw==
=/bbk
-----END PGP SIGNATURE-----

--IU5/I01NYhRvwH70--

--===============8432224023795865618==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============8432224023795865618==--
