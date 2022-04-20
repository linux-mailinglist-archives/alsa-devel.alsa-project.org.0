Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C3C5088AD
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Apr 2022 15:01:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EADB01A74;
	Wed, 20 Apr 2022 15:00:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EADB01A74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650459697;
	bh=GgFN/NG7MZ+CMRVLpa6/uG+FQSLb79x6dY9Ok/gLJm4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X6vLiTWSYT3spbmlqYe2eTLGHrrWKku8FMCPls76EMykZ5jItOd7eBaErvRvnwpq5
	 lNxVNcFNvzd52yEJD2L6/92T+SZiecajVm/nsEWGfSjN22YUK0A1qGk9H39GUS7lSN
	 r4omrlviHEgp9bId04lZ07EyIFDKPri+nIiRsDIQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5538FF80116;
	Wed, 20 Apr 2022 15:00:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A345F80125; Wed, 20 Apr 2022 15:00:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E040F800C1
 for <alsa-devel@alsa-project.org>; Wed, 20 Apr 2022 15:00:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E040F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qDqR1lgY"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F375C61A05;
 Wed, 20 Apr 2022 13:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB68DC385A1;
 Wed, 20 Apr 2022 13:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650459629;
 bh=GgFN/NG7MZ+CMRVLpa6/uG+FQSLb79x6dY9Ok/gLJm4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qDqR1lgYVZDVjAXFl780znRq+EzCZQtAuBgWRXdWCJ7Bt5zV6QFyJ2NG0pkhDpG8B
 bNSbR3XnDAZK+jYXEc7zQl9PFxkDbITb2BsAmp40ALkiUU2tbWu3YbbCEPWBEcgehD
 e1Y4AM575lwbs6h7I8cVT0E+FPqZA8WPD/h9puvOwtU/3wTDp1nEVs9KjH/ifeZS9g
 6anzzGmEqB7iSeCo9MUEvPoOFCasBEkvfz4F6EXUF/jNA05CgsVj9znVEp3JcHD0sw
 xBbBjLqWeT48cOXw2HnflRuZqIi/ySnN4gMHeLRep2MFiziRWusSFPVsXRirIB1din
 yhMrE2DCoqX1g==
Date: Wed, 20 Apr 2022 14:00:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Miaoqian Lin <linmq006@gmail.com>
Subject: Re: [PATCH v2] ASoC: fsl: Fix error handling in pcm030_fabric_probe
Message-ID: <YmAD6MIuKdjgm7Yu@sirena.org.uk>
References: <Yh90u+E3RTuGEDWU@sirena.org.uk>
 <20220420021855.8224-1-linmq006@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="efKG2CWXr2Wpj9k0"
Content-Disposition: inline
In-Reply-To: <20220420021855.8224-1-linmq006@gmail.com>
X-Cookie: Will it improve my CASH FLOW?
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>
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


--efKG2CWXr2Wpj9k0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 20, 2022 at 02:18:52AM +0000, Miaoqian Lin wrote:
> This will call twice platform_device_put()
> if both platform_device_add() and snd_soc_register_card() fails.
> return early on error  to avoid duplicating the error code logic.
>=20
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
> changes in v2:
> - use return statement to return early when fails
> - rebase on top of commit 559089e0a93d ("vmalloc: replace VM_NO_HUGE_VMAP=
 with VM_ALLOW_HUGE_VMAP")

Why rebase on top of that seemingly random commit?  Is there some sort
of dependency here?

--efKG2CWXr2Wpj9k0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJgA+cACgkQJNaLcl1U
h9DFwAf9GF3I/YlhSyVTcxq76mzScrKVify5IYug75y6034V/V8EfvQpAl74iFSA
j/ojJnAVUN/zwIlJArD+ODRonrsps1Ie9t44AgGOZPvRkniOTvgCjZAJAzTF5gzI
lKevcKZKOTCu30CRsLDQIpozLNGaZHqg108ppkn3pbc+tqL08oBJt4fdGTI7EVhV
eyMPbXa5DGuSSed5CY8zWiHRB7Kr31I20izJje8j92n4UkEvUMnvaUStFXHPVZWo
4z7amWIBtXixq7Kyh6APPmp6cb5jKJv3RFblBzFdbz62n5qFD1erZtzKGja70WT5
j4tg4q5ZVOWv5BVFAnI1ZpCtSSB8/A==
=wBgb
-----END PGP SIGNATURE-----

--efKG2CWXr2Wpj9k0--
