Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E82E3BEB
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Oct 2019 21:16:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5BC5171D;
	Thu, 24 Oct 2019 21:15:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5BC5171D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571944563;
	bh=lqwXqXxdL9QsAw8J/LrV9RV0B18IN/1YuB2QQUyLAT0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RLRPndGJuQIcKHOzxhJ9DiIok8DAHw9rwVtT2m4S0SiEe/rrMAjGyjdtYt1HpwmoV
	 fpyaVUXfQXPVtLmvRC8ZCa+GIuEVM93tihDgVJ6tnEc/gikud40X6IJaoahRUXb7XR
	 LOmiawn7sjjXypUiUq/8lvmAcEJLNCYfATNwiIqI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1A87F80377;
	Thu, 24 Oct 2019 21:14:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77D85F8036B; Thu, 24 Oct 2019 21:14:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93AD8F80274
 for <alsa-devel@alsa-project.org>; Thu, 24 Oct 2019 21:14:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93AD8F80274
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="wUUgFJ63"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ihyvA/bUXDT4b8atHThWXsHlgNzLbkBEyHRzJeldpGc=; b=wUUgFJ63Qrf0fCiGIOc0whA2g
 7ZVWwP49N4v8yHuzqerZZB6LxDnKa/1fKVkDFuGxuWhuDcUp0mkqvOrJQOIflmp6uhWw5Vx84iySK
 c5QGiOkL78dz58bn7kM9EcgBVWy2qbuGm7MlsDNnFOD3/qBi0QTEMqFyO1TNv45EswyHw=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iNiYm-0003xj-1V; Thu, 24 Oct 2019 19:14:12 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 24F71274293C; Thu, 24 Oct 2019 20:14:11 +0100 (BST)
Date: Thu, 24 Oct 2019 20:14:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
Message-ID: <20191024191411.GH46373@sirena.co.uk>
References: <CA+Px+wUAzwf1kYD8eMogE9Y6Euw4_-itc5EPWU19c_Sg6+ypQA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+Px+wUAzwf1kYD8eMogE9Y6Euw4_-itc5EPWU19c_Sg6+ypQA@mail.gmail.com>
X-Cookie: Filmed before a live audience.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, jarkko.nikula@linux.intel.com,
 Benson Leung <bleung@google.com>, Dylan Reid <dgreid@google.com>,
 Hsin-yu Chao <hychao@google.com>
Subject: Re: [alsa-devel] Questions about max98090 codec driver
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
Content-Type: multipart/mixed; boundary="===============7473749243901534925=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============7473749243901534925==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Enx9fNJ0XV5HaWRu"
Content-Disposition: inline


--Enx9fNJ0XV5HaWRu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 25, 2019 at 02:23:18AM +0800, Tzung-Bi Shih wrote:

> The playback stream becomes silent and the console keeps printing "PLL
> unlocked".  But, if comment out the msleep(10) between the SHDN off
> and on, the issue fixed.  I am trying to find the reason but facing
> further more questions and may need your inputs.

Wow, that's a bit special.  I'm wondering if the PLL unlock error
handling isn't connected to the PLL configuration?

> I feel it is weird to sleep in max98090_pll_work().  Especially, at
> this line https://elixir.bootlin.com/linux/v5.4-rc2/source/sound/soc/codecs/max98090.c#L2125
> (it makes less sense to "wait" in another thread).  Note that, the
> threaded IRQF_ONESHOT handler and max98090_pll_work() are in 2
> different threads.

Sleeping after starting a PLL to give it time to lock is pretty normal.
Doing so after stopping is a bit more fun.

> I guess the original intention is:
> - disable ULK interrupt in IRQ handler
> (https://elixir.bootlin.com/linux/v5.4-rc2/source/sound/soc/codecs/max98090.c#L2260)
> - schedule max98090_pll_work() to workaround it
> - wait 10ms to give PLL chance to lock
> - enable ULK interrupt again
> If max98090 claims its PLL is unlocked again, repeat the above by
> receiving another ULK interrupt.

I think so.

> 2. According to the datasheet page 164 table 90
> (https://datasheets.maximintegrated.com/en/ds/MAX98090.pdf), there are
> some registers should only be adjusted when SHDN==0.  But I fail to
> find max98090.c tries to set SHDN to 0 and restore it afterwards when
> writing to these registers.  For example,
> https://elixir.bootlin.com/linux/v5.4-rc2/source/sound/soc/codecs/max98090.c#L1897.
> I am wondering if it would bring any side effects because the
> datasheet states "Changing these settings during normal operation
> (SHDN=1) can compromise device stability and performance
> specifications."

That does sound like it might be causing problems, yes - even if it's
not the problem you're seeing it's probably a good idea to try to follow
the datsheet recommendation in case it's causing some other problem.

> 3. By searching some history data, I found a previous version did not
> have the msleep(10) between the SHDN off and on
> (https://crrev.com/c/191740, click the file name in the middle of the
> window to see the diff.  Pardon me, I do not find another public
> repository for this).  I am curious if anyone of you still remember
> why the upstream version contains the msleep(10).  I am also curious
> if anyone of your environment works well with the upstream version
> max98090.c.

No idea from me on any of that.  Upstream the sleep between shutdown and
on was added in the original code to do the recovery from Jarkko,
b8a3ee820f7b0 (ASoC: max98090: Add recovery for PLL lock failure) - the
ChromeOS patch you linked to claims to be a backport but clearly isn't a
backport from upstream.  It's missing the first sleep, the second sleep
is shorter but it polls for success instead of just dead reckoning and
not reading back.  The "upstream" commit that the ChromeOS commit
references just doesn't exist upstream so no idea what they were
backporting from.

If the ChromeOS code is working for you we may as well get it upstream,
if we can start the PLL faster than the 10ms that's a win and the
confirmation that we got lock looks like a win too.

--Enx9fNJ0XV5HaWRu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2x+AIACgkQJNaLcl1U
h9DZpAf+LOgZ0+4nBjJlGFJmMPnwYiba/Kg0dOS2uld3mj16gqqESe9LmEmdsUw/
RzxodttZeJZn3wB/I5pmIj7U7GrEYnc5a1Qcp8duoFfq7DD04qWC7O7dXqT6MNsp
+xdrBC+wXNxI3or0oirjNxYFimHwVGlXQ4HUU6XKgtdJD7yZQPnZsFqwLWxD60FH
zrBw+zXn7kQ09zCGOS0TPLHAlihGnGTJJNfoLiCCLEWwC6YHFoQptNO1ONkhkfuD
MedDOoQVmRBQCrOrbVRlqdViDUHo3e7AmDjRLR62MLH0UwtQKJLglah0zw3ZIGb4
rGo3tup8zJ5F4xSB3tWIrIpOao7ugw==
=X3u0
-----END PGP SIGNATURE-----

--Enx9fNJ0XV5HaWRu--

--===============7473749243901534925==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============7473749243901534925==--
