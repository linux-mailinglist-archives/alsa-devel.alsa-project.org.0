Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F14E61A624
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Nov 2022 00:55:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6502E0E;
	Sat,  5 Nov 2022 00:55:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6502E0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667606153;
	bh=XIUH8jqh/FEs77eB9QDfyuNqtGlC5q1MaH9F6m9Nchk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wxc07365ZkVL3frjSe9Xlu2Qp8R7eBX0nxgz6oj5eDA+5Ju7Rs0AhMWQnanhoqUZt
	 9p2DZTgfsAjwy9gkLpvPGuxiKyLKAcqJjisSTeNUW9MzihSj2JWM8EGuOEg5KmX2V1
	 si5RDtC8wUJhyFEbgxXlGgNIoNvkInO53Euh+ESM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F3B7F8047D;
	Sat,  5 Nov 2022 00:54:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6050F80448; Sat,  5 Nov 2022 00:54:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_72,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14AA3F80149
 for <alsa-devel@alsa-project.org>; Sat,  5 Nov 2022 00:54:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14AA3F80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="X/dS/zdB"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2B2D761B77;
 Fri,  4 Nov 2022 23:54:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBAF0C433D7;
 Fri,  4 Nov 2022 23:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667606090;
 bh=XIUH8jqh/FEs77eB9QDfyuNqtGlC5q1MaH9F6m9Nchk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X/dS/zdBfv6XAxlDZoXIkxUDlhbysQoY0oDQN2dCW3Yx3vNcZJhY53XtsSFP/pa8t
 Bi+LNaAw8lyCQ4FumxT8cPJXJavwp2Fufihbzq3IAOmJNkuTsqLgrCTuYNs64bF6XJ
 nFvysD5LjSGPUzJIyf8UXOw38L+G1B4S6bxxkhRhLciRQqcbCZ/IG76dSc5x1YgkxY
 ShZyOw8C0tTJdev+B6hhyyQ+bnk8zBR8SRfZ8SVz7Y96x0gnR5m7NClR7otCUQ9ERx
 oiiBK8nBXVJ7CGr/u2jfbQ1a7kU7fqT2BzG6LnTFzMZaApUeFooCvfCnSe4Fys/fIw
 67OCMHXS7tErA==
Date: Fri, 4 Nov 2022 23:54:45 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 2/3] ASoC: core: Inline resume work back to resume function
Message-ID: <Y2WmRUBJ+7K5zBm7@sirena.org.uk>
References: <20221104131244.3920179-1-cezary.rojewski@intel.com>
 <20221104131244.3920179-3-cezary.rojewski@intel.com>
 <925c6405-f651-f68d-73f3-46cf85cb2fa5@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3BQNrsYgtztE0YRV"
Content-Disposition: inline
In-Reply-To: <925c6405-f651-f68d-73f3-46cf85cb2fa5@linux.intel.com>
X-Cookie: Quack!
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.com,
 alsa-devel@alsa-project.org, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
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


--3BQNrsYgtztE0YRV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 04, 2022 at 09:58:46AM -0400, Pierre-Louis Bossart wrote:
> On 11/4/22 09:12, Cezary Rojewski wrote:

> > Commit 6ed2597883b1 ("ALSA: ASoC: Don't block system resume") introduced
> > deferred_resume_work for ASoC subsystem. While this allows for potential
> > speed up during boot on some slow devices, it doesn't allow to properly
> > propagate return values in case something failed during system resume.

> Are you suggesting to remove this workqueue that's been there since
> 2008, which would impact negatively slow devices?

Indeed, and the definition of fast and slow is a bit of a moving target
- the faster the rest of the system can resume the less desirable it is
to block on for example an I2C register map resync even if the hundreds
of miliseconds of ramp time that were an issue originally.

> If I follow your logic, we should also remove the workqueue used for
> probes for HDaudio devices, on the grounds that probe errors are not
> propagated either.

> Any time we have deferred processing to avoid blocking the rest of the
> system, we incur the risk of not having errors propagated. It's a
> compromise between having a system that's usable and a system that's
> consistent.

The other question is what we'd constructively do about a resume failure
that we can't defer.  It feels like we should at least retain the
ability to defer for devices where this is an issue (older components
tend to be cheap and packaged in easier to assemble packaging and hence
get used with lower end applications even well after they're no longer
competitive at the high end), and if we are going to return some errors
in line it'd be good to understand the benefits and tradeoffs.  I do see
that it is a lot less useful for modern devices where we don't have to
have any delays in startup, though like I say register I/O on slower
buses like I2C could still be a concern.

I'm not keen on moving the support out of the core since there were
originally a bunch of devices trying to open code and it wasn't good,
both from a duplication/complexity point of view and from the point of
view of integrating well with userspace APIs.

--3BQNrsYgtztE0YRV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNlpkQACgkQJNaLcl1U
h9Ahjgf/fR9BpoPFE4+glZ9zuF1OoGxoEZAZ+cfW7D0jMc01ffybLTirV3IP86Jl
IptbFzMKLO4OGv95k9JoDSHpASN4EbfZYH23JYp4zXdrwUgZKAmb7sd4whkIhLKu
rVlFW6+l4tJVxrj9utyXZwX3+w2xMN9WdllE+c782WgKxSvI+6s9v1I99OlpfqaD
v/s5NPHywrxaxWhB/hUYJ1GcnHqyGX3Ms6HaLIKCsiJNgJHOq3xyXwPwPOdW74Mq
r1t9yhP5UrTUN/ZpTgqOhZ3SSQ1fAe1TXC6DXdr6ZJ4MSY68xw7KqWxigBCFJ/69
6b/d1HmBD5U9RI/CQShGtDadSSoDZQ==
=e6B+
-----END PGP SIGNATURE-----

--3BQNrsYgtztE0YRV--
