Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3181190CDE
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Mar 2020 12:56:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FC391657;
	Tue, 24 Mar 2020 12:55:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FC391657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585050995;
	bh=YmyV/Igqo63PYjhcIBSAOmR7woPpIBn5MWK6zaYtWYA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TnbXbgk5MucwgMw56BJ0b45gYZu/ncYtZJc7skNq6jA0nJzEAA1hf2MIHekKX0YDV
	 C/4oVeYis0GPICTRJuAfpTYuWQ1MTYVTLFgC8wkX7h31VLeL0GqKypJMJc0nAI6ezj
	 LW41knq7HLTmxtr3uyEJbRcmRGuDponKgjoEcANI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 860C8F80095;
	Tue, 24 Mar 2020 12:54:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB075F801F9; Tue, 24 Mar 2020 12:54:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 PRX_BODY_65, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 07DFCF800FE
 for <alsa-devel@alsa-project.org>; Tue, 24 Mar 2020 12:54:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07DFCF800FE
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E05611FB;
 Tue, 24 Mar 2020 04:54:44 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 620713F792;
 Tue, 24 Mar 2020 04:54:44 -0700 (PDT)
Date: Tue, 24 Mar 2020 11:54:42 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ALSA: core: sysfs: show components string
Message-ID: <20200324115442.GA7039@sirena.org.uk>
References: <20200323193623.3587-1-pierre-louis.bossart@linux.intel.com>
 <20200324015331.GA3679@workstation>
 <d31659cc-d528-345f-1e56-b0cfae36be5c@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="yrj/dFKFPuw6o+aM"
Content-Disposition: inline
In-Reply-To: <d31659cc-d528-345f-1e56-b0cfae36be5c@linux.intel.com>
X-Cookie: I feel ... JUGULAR ...
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org
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


--yrj/dFKFPuw6o+aM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 23, 2020 at 10:34:23PM -0500, Pierre-Louis Bossart wrote:

> In case you missed it, the components are used by machine drivers to report
> e.g. number of speakers, mics, etc, so that UCM can find the right
> configuration. For a given family of products, the syntax will be fixed,
> e.g. hs stands for headset codec, etc.

If that's what you're looking for it sounds like a richer sysfs ABI
which has these things in it more directly would be a more idiomatic fit
(or like Sakamoto-san says adding controls, though that is a barrier to
things like udev and so on like you say).

--yrj/dFKFPuw6o+aM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl559P8ACgkQJNaLcl1U
h9COBgf/RDquC1gHDUh9L4XZMRRccpS7snxs/f+QEhXmM16Rw6K26rq3+lwBJtYU
ocVpTG+zpsgxegdk/W7OAX1xLN+VG1IgHf5uhs5D//32aqqD0N6sdaex7g+HWynR
BqoLXBQi3RZI3ot6fADkP8etyL/lpUmdVbHmLmavMmFLftvqrKBifrGpv5NYw/Kl
qNn5LG0E8pYuXo+4y98HoS34hRWGHwqPIpT5n1POxDxm6CaXyFmWL4ihK1iDJW8e
1+jd5K8Z33p2Y+TJr0H8+zCkOXTfCMPC5a8xkQmsNsTnecARpsFOlvXfmh1NdyEg
WDavvfZpM8AgK40uq5ZcsEi/BsNx/w==
=xoig
-----END PGP SIGNATURE-----

--yrj/dFKFPuw6o+aM--
