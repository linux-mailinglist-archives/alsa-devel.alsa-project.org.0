Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A288755BB30
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jun 2022 18:53:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23AB71685;
	Mon, 27 Jun 2022 18:52:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23AB71685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656348805;
	bh=clNEQXHL0xWI5qCH+FEN3Ejvj1k2uNmPq6xDkFntvjA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=biiincP9Y+lxxzUyE3NXP1h0eVhrYGUxmqIRzvHpWjNYPErYWtXPPJKHheC0gevMx
	 vr4baPKflvN4MKs3zf9BkDNCU7JDfluPLLT7XdEvR5LluOHQgxN9uRD+AdlpBPU9gh
	 Fd1L2gOVrSWUQd4cwsQ39rrFAfs7PKzmf22oqt/0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82F90F800E9;
	Mon, 27 Jun 2022 18:52:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A925AF80107; Mon, 27 Jun 2022 18:52:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5051DF80107
 for <alsa-devel@alsa-project.org>; Mon, 27 Jun 2022 18:52:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5051DF80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bi4yDZa8"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 71EEB60E9A;
 Mon, 27 Jun 2022 16:52:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A5EEC341CB;
 Mon, 27 Jun 2022 16:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656348738;
 bh=clNEQXHL0xWI5qCH+FEN3Ejvj1k2uNmPq6xDkFntvjA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bi4yDZa8kUH/Sc8IvDqj0zbZCtsgWsoFYdzM7VCES7f6CXsVo7mrqm4DI0oVcSdN8
 uC0krC18iREn4a3ux+uKV2w14UgNycfa1WPwatLTI3qU76lYZ/SY6tSPqIQPbi0lFE
 fKwGsW3GfQyWtGoxZjGC57pcDGouQgamxjYly7Xr19I7S17gd/h/4/lOTJincrcNvg
 7Lg2ytXjkQZ7kAzL4Ui4U0d3AFq/uBVeB2r+LjQEjapyOJ9xUnf/ZmjABXEAbj9QUG
 YXZgpynk0TOnbDczgx7/qa3kFNE15cOFSO7vGSlf/fGD080JwN1qz7gy0coVgFEPIA
 x3mrlRTDnZXwA==
Date: Mon, 27 Jun 2022 17:52:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: Sound not working after commit
 bbf7d3b1c4f40eb02dd1dffb500ba00b0bff0303 on Amlogic A311D device
Message-ID: <YrngPdWIqxlRm4mf@sirena.org.uk>
References: <CADs9LoPZH_D+eJ9qjTxSLE5jGyhKsjMN7g2NighZ16biVxsyKw@mail.gmail.com>
 <15259e38-eccf-d294-a330-a48b5bbbdedf@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="iCWEXegB00IRjxh9"
Content-Disposition: inline
In-Reply-To: <15259e38-eccf-d294-a330-a48b5bbbdedf@linux.intel.com>
X-Cookie: Your supervisor is thinking about you.
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Alex Natalsson <harmoniesworlds@gmail.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Takashi Iwai <tiwai@suse.de>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 linux-sound@vger.kernel.org, Bard Liao <yung-chuan.liao@linux.intel.com>
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


--iCWEXegB00IRjxh9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 27, 2022 at 10:12:37AM -0500, Pierre-Louis Bossart wrote:
> On 6/26/22 04:29, Alex Natalsson wrote:
> > Hello friends.

> > The log after alsamixer launch:
> > [  103.786358] Internal error: Oops: 96000004 [#1] SMP
> > [  103.786509] Modules linked in: snd_seq_dummy snd_hrtimer snd_seq

> Any chance you could try with an updated kernel? It's not clear to me if
> this is a real issue or just a warning that's been fixed since by commit.

That's an oops, and the userspace applications are hanging...

--iCWEXegB00IRjxh9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmK54D0ACgkQJNaLcl1U
h9AgTAf9F9YhMFMh9cpDNSKY0sdfPXft9AwZSujKrtwHe+eu7BPuyXlJkTO4iE2t
2Ons/0jrkx15WElROLZac5ulsKE4iYORATeNhiFUCrmE7giG/GMPCRKOVhYDoP+F
O/0rKksU/Gu3zyEEMROTh+vJbcFEq43RDXq2DDHLIrQgSdudNwiaaRP6jy0V2bRy
OCArvQWe/8doB22q27JgwQ9tDEB25MFzd1tJ5AVZjWzZcMFiRN3foRpMhNejgF0W
GvI6KjvZ4eBu1H9YEbn7doyZKNKwApOjqWmXO2Rm8bRrcnnNfEbEdjgEzunFBOoF
NZVhl8uYkT3BFv7zAy7nl73RvtPy4g==
=ER5V
-----END PGP SIGNATURE-----

--iCWEXegB00IRjxh9--
