Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3218B12D52E
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Dec 2019 01:18:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98D2516E4;
	Tue, 31 Dec 2019 01:17:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98D2516E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577751485;
	bh=lolormZKMpk3JxQZYNR7p4Tb6QkYGZDgTTSYiBrwcxE=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AukGmzKR+ArcbNzQBsEQVQo8omZYCe4CR+wvImh2Di0SJyVUaXM9ftLdtA+mnsfLI
	 bsqhAnBRjI+FPmHckomyPc+hTfDFKADJMtJ3m6Fag63M2O9MnVAZLpnZvqptEse+9N
	 liP1vuXxhzpfCKdKGPOOrvGP5z9LEXMc8qXlbtbA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F605F8015C;
	Tue, 31 Dec 2019 01:16:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55008F8015D; Tue, 31 Dec 2019 01:16:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BCA3AF8011E
 for <alsa-devel@alsa-project.org>; Tue, 31 Dec 2019 01:16:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BCA3AF8011E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="U3SliZOY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=F+7D0G5AkG2H3rdkZS91IJR6qjuefG3telZ4iGsKL9k=; b=U3SliZOYI518r44IctD9/2Oc+
 1Q8C+YEAjZfpX22tKKQkxWrLPDfK6SMGf0zApwm03Bv6M+oi3x+9rBBsZd5UBqk0XKaurrpZkkox5
 57XMEqEH53W4HW+zxLr+O9MMCY2ApckiPm31dvjplas1hFSYfQPUWTrQ/UEQldR9UYg6U=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1im5Cq-0002ie-Kj; Tue, 31 Dec 2019 00:16:16 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 9CB92D01A22; Tue, 31 Dec 2019 00:16:15 +0000 (GMT)
Date: Tue, 31 Dec 2019 00:16:15 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20191231001615.GB3897@sirena.org.uk>
References: <20191204151454.21643-1-tiwai@suse.de>
 <s5h8smz79o8.wl-tiwai@suse.de>
 <20191227000818.GF27497@sirena.org.uk>
 <s5hlfqy5it6.wl-tiwai@suse.de>
 <20191227224133.GL27497@sirena.org.uk>
 <s5h36d46emp.wl-tiwai@suse.de>
MIME-Version: 1.0
In-Reply-To: <s5h36d46emp.wl-tiwai@suse.de>
X-Cookie: Programming is an unnatural act.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH] ASoC: core: Fix access to uninitialized
	list heads
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
Content-Type: multipart/mixed; boundary="===============1470226847532767588=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============1470226847532767588==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LyciRD1jyfeSSjG0"
Content-Disposition: inline


--LyciRD1jyfeSSjG0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Dec 28, 2019 at 09:25:18AM +0100, Takashi Iwai wrote:
> Mark Brown wrote:

> > There's two bits there - one is that it's adding to the mail
> > volume when people chase up, the other is that if things have
> > been lost then almost always the answer is that I don't have the
> > patch any more (or it'll be error prone to find) and it'll need a
> > resend so it's better to chase up by resending the patch since
> > that can be acted on directly.

> Well, I see a few points to be revised in this policy:

> - If it were actually your oversight, then resending the patch makes
>   sense.  But if it's not merged by other reasons?  Silently resending
>   a patch can be worse.

>   For example, suppose the submitter either overlooked or didn't
>   receive a reply or a followup in the thread.  You didn't apply the
>   patch because of the reply/followup pointing some problem.  Now, the
>   submitter tries to resend the original patch again without asking
>   the situation, just because you suggested so in the past.  You'll
>   get the problematic patch again, and there is a risk that the patch
>   gets merged mistakenly at this time.

The thing there is that if I don't remember the state of the
patch I'm likely to just say "send it again" and if I do remember
I'll remember either way (the form does say stuff about
addressing feedback, though obviously people can ignore that too).

> - The mail archive (lore.kernel.org) nowadays catches all posted mails
>   in a proper manner, and it's pretty easy to fetch.  And, resending
>   the whole patch would be even higher volume than replying,
>   disconnecting the discussions in the previous thread.

That requires me to be on the internet and fire up my web
browser!  I do actually work offline routinely, when I'm
travelling or somewhere like a coffee shop with poor internet
access so that's not always a thing I can do.  I do postpone
things but that's usually for longer periods (waiting for other
reviewers and so on) which tends to mean people don't get an
answer for their ping promptly which doesn't help either, I
haven't managed to come up with a workflow for that which is
effective.

> So, I find it's OK to give this kind of warning for educational
> purposes to the people who don't know the common practice and send the
> patches too frequently.  But for other cases, such a warning doesn't
> fit.

I deliberately try to be consistent in sending this stuff out
because I don't want to be unfair.  Which has it's own downsides
as you say.

--LyciRD1jyfeSSjG0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4Kk0wACgkQJNaLcl1U
h9AQqQf/bT927gx0poN0d/dZ4sQmtiHq8CP/2S26Yq2HsEHEuuoT8IeAqj3rXvZ/
3C/xHlNTOfUIxeBxUr1PdvDxyIR1/guwEaBagdJXs5K1dXl9G7xxPxmMOaPhsP+w
ZoyxCTcuZzshpnOzV0AlbR1XAM/4gInmxOCHouovXj8E2yYw4+s1Ev6vfKvPNVMa
IBGXTiD8WAM6OpCihlalA0n2DkjxAQzfAhpBd7SALfxKm771ZcwLvO4JihGGoCEk
iMe2wkE0TC6JG3VFerY72n+GQmIXzbultx00funzP+Ps9sTPohEE1kw0g8/f2wZ0
XqFLeSaBEaDpelYvbcZtKHzyfxTx3Q==
=SVKw
-----END PGP SIGNATURE-----

--LyciRD1jyfeSSjG0--

--===============1470226847532767588==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============1470226847532767588==--
