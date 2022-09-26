Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 751E65EAEF6
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Sep 2022 20:02:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE47E828;
	Mon, 26 Sep 2022 20:01:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE47E828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664215336;
	bh=lwNmNeyM60GxVqrqSHyOzlOccMqPqWIvoP2NFo3qrJk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MzRzQSu0OCCvOF9YsJJyRjhA1Pj+IXjRRf+4UVKgVjKZpGK0EBhAAAUiX9c0NP2o6
	 usyrpWa1iqgwsFjMb0eSUcxPfPoaSBefHVX0UNxw6ZAPYfvNmh4PRtifHUVa3nS0Zl
	 JQh5/wrnkGlCU2VwTfYaCatWiCnnM5e6Cy1yujIw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E826F802BE;
	Mon, 26 Sep 2022 20:01:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EBCAEF804D2; Mon, 26 Sep 2022 20:01:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 314F6F802BE
 for <alsa-devel@alsa-project.org>; Mon, 26 Sep 2022 20:01:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 314F6F802BE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="K1azSrdA"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2E25E61132;
 Mon, 26 Sep 2022 18:01:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E083CC433C1;
 Mon, 26 Sep 2022 18:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664215271;
 bh=lwNmNeyM60GxVqrqSHyOzlOccMqPqWIvoP2NFo3qrJk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K1azSrdAnV0qh30TC3R5EgTcoOmieL4rSYhfW4dBmjqG9A+gKjdUPP/710x7J/Afp
 zPAqSX5PbWSzKCBU4tLj98MyX0w6bCTezjuHnjis37BQ1fyBOILqrqrms+tLfKhxLm
 OSbyRY4819dln/8gnWmbL0+j78g5XW8GeDC/Awdi5LljFO8rISqf/y+GfVxiuykqc0
 jAaNeTBJW2TjAcePaLiMnsKMjupDz1v1A0wXf4sgAP7YhQd7c0rIZs/r+TGcsfhyCK
 0/nB0vc0zMBLMXF7k7hAuLp06kRELiKUf+6hAOHyONFkE2qLA0j7oxLZU6WWnxzZxX
 UeDg/vDTShh2A==
Date: Mon, 26 Sep 2022 19:01:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 10/11] ASoC: sh: Replace runtime->status->state reference
 to runtime->state
Message-ID: <YzHo45XFxUe5AmsB@sirena.org.uk>
References: <20220926135558.26580-1-tiwai@suse.de>
 <20220926135558.26580-11-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="n8Zv8fx1nKsck57k"
Content-Disposition: inline
In-Reply-To: <20220926135558.26580-11-tiwai@suse.de>
X-Cookie: You may be recognized soon.  Hide.
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


--n8Zv8fx1nKsck57k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 26, 2022 at 03:55:57PM +0200, Takashi Iwai wrote:
> The recent change in ALSA core allows drivers to get the current PCM
> state directly from runtime object.  Replace the calls accordingly.

Acked-by: Mark Brown <broonie@kernel.org>

--n8Zv8fx1nKsck57k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMx6OMACgkQJNaLcl1U
h9A6vAf/XzJi/4eqSwRyL8n0UigfcC57gM8TszeisfTVcQlM+SIIrNnCIiAu6Lz3
NH8QWcQCXhxn8OJIPGPs3iotYCDevbgxgbC0mCr5hz9ywwyeDmIQLgYPam+NWxUT
P7XErU5UjeNfKtpUFWpC/CLNXbbOtXKxKUtQQXZ9Z6prKzU3yWQpaIzTTgemtK6f
mQ2Y48HrLyeMvof7SCFOpSOEz3PyV/DHnIul+qgnZ6R98LAlvh8gPHGLuUsFVsPM
XbQ7CYWw1UbM8P1YcgifJman7DfleNR3AnQgecRrRpeNMj8m/qKVOWm5Y5zmNyGz
tzAl+hb/VznbDt0AlHCfyGw0US+wfw==
=wW9S
-----END PGP SIGNATURE-----

--n8Zv8fx1nKsck57k--
