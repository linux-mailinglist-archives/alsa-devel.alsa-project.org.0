Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D72F181ED8
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Mar 2020 18:12:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B843A166D;
	Wed, 11 Mar 2020 18:11:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B843A166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583946742;
	bh=oDDrUGwHTFBsE0ePcbTDf38M4SYbi1gP7AeUelw1qtk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VheNwiRn/hpr6e/jYiR1sIEkNMgiM9bntqfjoYy/PsdIcr/m/gusUVXaePRUThxKz
	 2KhcPVUMi07/urtUYeHyGtde5rsSidp/d0c7NDDecqe7RlRwaL7rpqdrGkTngipPJH
	 86tcck7CAf1kVliBomP/Q7K7imdlO9sTqdJSuDME=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3DF1F800B5;
	Wed, 11 Mar 2020 18:10:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 839B1F801EB; Wed, 11 Mar 2020 18:10:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id B6E91F800B5
 for <alsa-devel@alsa-project.org>; Wed, 11 Mar 2020 18:10:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6E91F800B5
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CFC9E1FB;
 Wed, 11 Mar 2020 10:10:35 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 528AE3F6CF;
 Wed, 11 Mar 2020 10:10:35 -0700 (PDT)
Date: Wed, 11 Mar 2020 17:10:33 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/7] ASoC: Merge CPU/Codec DAIs
Message-ID: <20200311171033.GI5411@sirena.org.uk>
References: <87y2s7vgxb.wl-kuninori.morimoto.gx@renesas.com>
 <03ac5f70-9aa3-b909-c693-caaa0afd09c9@linux.intel.com>
 <87k13rvd5g.wl-kuninori.morimoto.gx@renesas.com>
 <8e92f00a-6fb4-84e6-8e48-28b9913791c0@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="cVp8NMj01v+Em8Se"
Content-Disposition: inline
In-Reply-To: <8e92f00a-6fb4-84e6-8e48-28b9913791c0@linux.intel.com>
X-Cookie: I'm a Lisp variable -- bind me!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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


--cVp8NMj01v+Em8Se
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 11, 2020 at 09:36:17AM -0500, Pierre-Louis Bossart wrote:

> I would still like to make sure we have an broadbrush idea of what the 2nd
> step might be. It seems to me it's not possible to avoid having a notion of
> source/sink inside of a dailink (the wording is probably not right e.g. for
> full duplex, maybe domain1/domain2 component1/component2 are more accurate).
> The dais are exposed by different components and are really the hook by
> which the components can be configured with compatible settings.

We at least have the notion of clock master but that's something that
could potentially vary at runtime so not stable.  Like you say finding
appropriate language to talk about these things is tricky and I'm also
struggling to think of anything better than numbered components.

--cVp8NMj01v+Em8Se
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5pG4kACgkQJNaLcl1U
h9CkFgf/RL9HA2SbZ03JjCO0lZui4M7pwCNp2X6DEVJMnUKypgwRkqzRQypkJkV7
0bBRLqiyVOTOY35q0rKFaH9m7yw6sgzglfh9g+nzXyDYCRf3wSJpiU1cn6VFYRjz
u8iiptR3URJPElah+wX+f8zTsKdSr/vhjdwXPMX4lsHegyTbO6fvioAUP5qX5NCc
x+PMa0YkTNxp65sdyPqb59twovPcvH2efabdQEqp3WIbPs/DzqlPKcDfBtQqZT2y
ORefu7l4MA+UJJFmVGgY/N4tGwoperBkhYiWmS/YLHrEbMQh4FaNqr+fk9yO8PqA
6rFtHiUU+10Wjhv/1TXQDLQK4hbDEA==
=/iQW
-----END PGP SIGNATURE-----

--cVp8NMj01v+Em8Se--
