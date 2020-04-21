Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C59AC1B2EB9
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Apr 2020 20:05:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E4E016CC;
	Tue, 21 Apr 2020 20:04:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E4E016CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587492344;
	bh=6TEk0IK9j84dCLu5aA4ZkXNZLOiPbxAEAjYrlGISgiA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EKciS8nK9xLQgUB1xsJ7gtF2+0QrV+odiTcvKYzDX9ZkZFIdeNMeGK7In5+YxEY6r
	 qvERw8xns6yRhKHmlL5DDpmclL+QOpfbiAIRoDppoxIBPeNKzNotBW5z8cv9TPWAWd
	 L1l4n9q4QZ4zEMNCbLmeRHPTMNeqFaWsFJyMe+CM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78AEDF801ED;
	Tue, 21 Apr 2020 20:04:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33FAEF801EC; Tue, 21 Apr 2020 20:04:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE868F800E7
 for <alsa-devel@alsa-project.org>; Tue, 21 Apr 2020 20:03:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE868F800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="yN9vKhnV"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 684F9206D5;
 Tue, 21 Apr 2020 18:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587492234;
 bh=6TEk0IK9j84dCLu5aA4ZkXNZLOiPbxAEAjYrlGISgiA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=yN9vKhnVHDuq2OxKNAvoT/7eN2AERDPn2l/5TtGnd7HH0pt53Ti+F40rLYs+hsZb0
 BcN3uwxCzyv4M3cRM5hUvDfZo99FjH1r7eO6Nn9xhEmCNCz+5cEeUmqg+8yLYG9Dkg
 qFI4n5lcjUAHZNX/f7h8oBVZFd8QEfSHD/kGB+uk=
Date: Tue, 21 Apr 2020 19:03:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH v2] ASoC: intel/skl/hda - fix oops on systems without
 i915 audio codec
Message-ID: <20200421180350.GA36150@sirena.org.uk>
References: <20200420205431.13070-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="G4iJoqBmSsgzjUCe"
Content-Disposition: inline
In-Reply-To: <20200420205431.13070-1-kai.vehmanen@linux.intel.com>
X-Cookie: Do not write in this space.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: hui.wang@canonical.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 jaska.uimonen@linux.intel.com
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


--G4iJoqBmSsgzjUCe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 20, 2020 at 11:54:31PM +0300, Kai Vehmanen wrote:
> Recent fix for jack detection caused a regression on systems with HDA
> audio codec but no HDMI/DP audio via i915 graphics, leading to a kernel
> oops at device probe. On these systems, HDA bus instance lookup fails,
> as the first ASoC runtime of the card is connected to a dummy codec
> (as no HDMI codec is present).

This still doesn't apply against current code, please check and resend.

--G4iJoqBmSsgzjUCe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6fNYUACgkQJNaLcl1U
h9DV0Qf/QSjESgla5mtFZjh/3uViEp4YZXBzek+NfAcje7LmEkofAipMtc4v3YB/
HF43vk2RZJaHDSwv1nTM9h0aBIRjVFV2a65yH7J/DbwBm/Cont5dCm+ykY6ODq+l
+S2fhT91C+s/I0R+GGEN+efDK1/c8gwMdtnXRBHpxRd5Pmbqx7ptGa0VO7rKgthS
/YoDQjjyqYBZP/MyiPpZXa9giO/yOSQF7pEEHC0SpTlUmoi2HdBq5vahi+SYzujJ
QA8QcofTYLu2Q9NBcL1d5KTrotq1DZ6BlQ5OPRdkJxOsHzqBu4Wqh7FYV0PJynIr
4yV5Y80IURj4PbbC0zDLi5NCfRN7qw==
=Xjc5
-----END PGP SIGNATURE-----

--G4iJoqBmSsgzjUCe--
