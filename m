Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7F84BF92D
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Feb 2022 14:24:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84FCB188B;
	Tue, 22 Feb 2022 14:23:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84FCB188B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645536278;
	bh=g+t14pibxQf/5ROR31LO/lLThLE3hoCpEbAOc4iIALY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V/ZoasRWJsbwW7kTCNrh/snPoh188HIBfiYllyZzm0MshxLpOqTsiA/ovDMMkr3cc
	 PZ5UxWthCj9ElsS1u0G3sktLvBcPOlwbIL5eicAud2r0li4DSoDbwdtftjbM+ab2b1
	 ZsEwkP90Q5OEQlEVxqX8SJ6eGR9dtNCqX/U3ySBY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2E35F801F5;
	Tue, 22 Feb 2022 14:23:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8648F801EC; Tue, 22 Feb 2022 14:23:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55270F800D1
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 14:23:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55270F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cWLvKjDF"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 15DD1CE0DEC;
 Tue, 22 Feb 2022 13:23:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA8D8C340F1;
 Tue, 22 Feb 2022 13:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645536201;
 bh=g+t14pibxQf/5ROR31LO/lLThLE3hoCpEbAOc4iIALY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cWLvKjDF48m0Bq5YgC82C/6r9RdNx935qc/AoV+MIqf78SoPyENZdZTWvelZHlMKt
 lTkwZM3G5P5DxQdvEz0KSMCPlRASbK6FUPUVMawkw41YAdPCZKwHypnuSyx2pDvoPv
 Mai4CHrsBmQjBEG/a0zptay2I8ktFiRV/cvWR66uNwQgFBqkzoQqvDGpbsXJgVSnyG
 ewo9/MWFLAcwIms5EW2wtLqHZcHqDwsF1VWfsGwidQ6Dedr6V1rHOAKIpCfOXqGaUg
 ygT7gIW+xxzYu13OPFHvnzazxLFS0ecBcnGj2ZWEITukk4o4tVrrRz5j+qY0PWWdlK
 pHcjwQkX3zzaQ==
Date: Tue, 22 Feb 2022 13:23:17 +0000
From: Mark Brown <broonie@kernel.org>
To: Giacomo Guiduzzi <guiduzzi.giacomo@gmail.com>
Subject: Re: Asking for information about ALSA's kselftest
Message-ID: <YhTjxVqjcudcg5pw@sirena.org.uk>
References: <d261d1b3-66fd-19b0-219b-85dbe1df341d@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="isa2L2DtnWfNi0VE"
Content-Disposition: inline
In-Reply-To: <d261d1b3-66fd-19b0-219b-85dbe1df341d@gmail.com>
X-Cookie: I smell a wumpus.
Cc: alsa-devel@alsa-project.org
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


--isa2L2DtnWfNi0VE
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 22, 2022 at 01:44:27PM +0100, Giacomo Guiduzzi wrote:

> fails, and test 72. I have no previous knowledge of how ALSA works and I=
=E2=80=99m
> completely new to the kselftests and the kernel in general. Test 71 gives
> the following output:

> # Surround Playback Volume.0 expected 0 but read 1, is_volatile 0
> # Surround Playback Volume.1 expected 1 but read 0, is_volatile 0
> not ok 71 write_default.0.22

> I wanted to ask you if it is normal or not that this test fails on my
> hardware, and if not, what I could do to debug the problem and give you
> useful information to help understand what the issue is. I am currently
> testing on an Ubuntu Desktop VirtualBox VM on kernel 5.17.0-rc3. The audio
> hardware (as the output of the lshw command, multimedia section) is:

That shouldn't happen - it will be a driver specific issue of some kind,
either a bug in the driver itself or needing to work around some issue
with the hardware (emulated hardware in your case).  The core ALSA code
pretty much just passes these operations straight through to the drivers.

> From what I have seen until now it doesn=E2=80=99t look like a bug from t=
he test nor
> an issue from the kernel, so I=E2=80=99m not really sure where to look at=
: I have

As far as I can see it's a kernel or lower issue - userspace wrote a
value that's valid for the control but read back a different value (if I
had to guess I'd say the left and right channels are getting confused on
either the read or the write).

--isa2L2DtnWfNi0VE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIU48QACgkQJNaLcl1U
h9Cuhwf/YWA3K6BMi01+7SOIIigPcaSk4ocnubPb9sk+fTeZUavzWeBBg2LDcv6U
BkpjGiGubH0MddUyODmMeFrDHskuupF0GM1vNYGi84a35ArQPVlxOnEBSO5dVFyG
mo2z54B4LY8svN5cJJuLKK3xlmYLALEN5XxaQgoA5IA5OrcmEwUy0FS7PUZcoEIA
1egAtcMn3k+Ru9LrS5Amwdk+HzTU1uToP1od8hYZ57oMidSQG+HFyMoAknfBZYSK
1adEStFGdgmENvPr2TNx3SbzNcdQ56BEsY8yK8i06IDrbpKtA2Y7lzBeXSCYwoun
sFHSTCN3W1kTXxioex6vsgfM9u2Q4g==
=PD+5
-----END PGP SIGNATURE-----

--isa2L2DtnWfNi0VE--
