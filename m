Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C03434C3468
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Feb 2022 19:15:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E91818E6;
	Thu, 24 Feb 2022 19:15:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E91818E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645726554;
	bh=0tnbQuuR1loseTOVkHNgK1i4o0rJpGHkKLedHU7WA3Y=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YAvMsvbZmOxmQksVcU/mq2xlvzgFRBu64Sd+qMFGkpWsDBa/+xeDiovrhvGfupo1B
	 8w0GDWmk1tP+G4m8GHhOZ6AuhqpVCF5szkpBUM6qBzBbyDK1sZdz3KnOSUkwiQ4Tc4
	 SwSgjmaLj2Y4NsB/ptubHEtPKMRigIclxOFbC5v4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9349F80310;
	Thu, 24 Feb 2022 19:14:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A88FCF8030F; Thu, 24 Feb 2022 19:14:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63AAAF80118;
 Thu, 24 Feb 2022 19:14:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63AAAF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="O6+zhvkg"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4F10F60B0E;
 Thu, 24 Feb 2022 18:14:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A536EC340E9;
 Thu, 24 Feb 2022 18:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645726479;
 bh=0tnbQuuR1loseTOVkHNgK1i4o0rJpGHkKLedHU7WA3Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O6+zhvkgE5SOGjZqosBUShYmmK30Kv6oXuH+8frrX8X8SvMchdAWwel+ZJEOfQ6lc
 4m7g+jj+9gYoGKlZXTCNqUPpks/kYKqgaMSVzQLkptK0mxifR8qRFJk5jJNwElBSmS
 KDUswDo8SYFm+etrVflVgBDCgavsDlBO10GkTkCLVfK1l8zJ6QUhCsQ44oUUDne2Y7
 s3Mf548/EFjLhJl72LEWzsQx8Y7pdB0/Tq1AzLAIAlGntQZailpzkDPcKvc70Iv3Me
 QvCJhh3xebooqo+2anPzZfcZFRzYDwZPduXv6jgWqLJJZsEPsRCBlORJWwl6+oaMRo
 F+I9sZzzF4niw==
Date: Thu, 24 Feb 2022 18:14:33 +0000
From: Mark Brown <broonie@kernel.org>
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>
Subject: Re: [PATCH v2] ASoC: SOF: Intel: Fix NULL ptr dereference when ENOMEM
Message-ID: <YhfLCWm0Ms3E+j4z@sirena.org.uk>
References: <20220224145124.15985-1-ammarfaizi2@gnuweeb.org>
 <cfe9e583-e20a-f1d6-2a81-2538ca3ca054@linux.intel.com>
 <Yhe/3rELNfFOdU4L@sirena.org.uk>
 <04e79b9c-ccb1-119a-c2e2-34c8ca336215@linux.intel.com>
 <20220224180850.34592-1-ammarfaizi2@gnuweeb.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="zl5egPN1PrqPYZ2+"
Content-Disposition: inline
In-Reply-To: <20220224180850.34592-1-ammarfaizi2@gnuweeb.org>
X-Cookie: I smell a wumpus.
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Keyon Jie <yang.jie@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 stable@vger.kernel.org, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, linux-kernel@vger.kernel.org,
 sound-open-firmware@alsa-project.org
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


--zl5egPN1PrqPYZ2+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 25, 2022 at 01:08:50AM +0700, Ammar Faizi wrote:

> The dmesg says:
>=20
>   [ T1387] sof-audio-pci-intel-tgl 0000:00:1f.3: error: memory alloc fail=
ed: -12
>   [ T1387] BUG: kernel NULL pointer dereference, address: 0000000000000000
>   [ T1387] #PF: supervisor read access in kernel mode
>   [ T1387] #PF: error_code(0x0000) - not-present page
>   [ T1387] PGD 0 P4D 0
>   [ T1387] Oops: 0000 [#1] PREEMPT SMP NOPTI

This is still an enormous and not super useful section of backtrace, at
a glance the backtrace is longer than the rest of the commit :(

--zl5egPN1PrqPYZ2+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIXywgACgkQJNaLcl1U
h9D27QgAg7b99eY8qB9SbE2FGqEhJaR6N+rx0g1pg3KcyvVd85xyV0mqBabwfvvS
9qNMyjpcHMpMlUWKNPtSAL7PcAmQcM2GJGD8TJRYgM9LcQHwEDcNABIu1nJIa2oD
zls9hFti82GjNEaZZ5OTWLLfSAUvSCKHWtvtsQSAwAuZszqoYt5fgrKQvQDneWiG
ybi3FB4/bp4msSyaqvoWtxVEaeiChIAerim9/umCqpP5xgfRbm5hjrVdBoHDVgTl
ZK5SiLFxNEB3XZK4pqiHXqeHoryeLadPEZdabsdCmSjWLXPYQ08mtcUtctyF7q7d
fPJlv7rZ+PWPWlibnrkfBRbK0bMDGQ==
=Q3Zo
-----END PGP SIGNATURE-----

--zl5egPN1PrqPYZ2+--
