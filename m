Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A538C1222
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2024 17:42:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFBBEB6A;
	Thu,  9 May 2024 17:42:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFBBEB6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715269376;
	bh=cj+UuLyJg+4fjqSa7LRBBoNbGDbzwmi9iNtluuOY+ss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=a90VdH0W1ikUuUseDEDzP5NEMvnR6MHiObGg3LJvf+9xKAmVpkToIcTYYDT4GTO7c
	 dce7p5HKekDDVoJHNS4iGj/3s3YsrfyEFgGRdAJvOkKww9DDTkqHOurwxEKENiQqJo
	 lpHeNBE1/b6wuKvpRbE6NOZsAMZMbGGPZh0v2SME=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28680F800E2; Thu,  9 May 2024 17:42:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D6B01F80564;
	Thu,  9 May 2024 17:42:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C28FF8049C; Thu,  9 May 2024 17:42:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D9A07F8024C
	for <alsa-devel@alsa-project.org>; Thu,  9 May 2024 17:42:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9A07F8024C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Ylm6giDe
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CD4F9CE1B99;
	Thu,  9 May 2024 15:42:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93BE4C116B1;
	Thu,  9 May 2024 15:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715269320;
	bh=cj+UuLyJg+4fjqSa7LRBBoNbGDbzwmi9iNtluuOY+ss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ylm6giDeWl+e7cPrxU0Q0y9dRQcJweGtL64hS6KhNs2WrdsMZ0uWdcV5S23/0eUeY
	 LF5huoN9l0c9PQ56fqq/PICw3eN4G85CJw4DitEVrfSf03/Ld1FvkQV2Y2XCwB1B2z
	 nleSexUrzkBBT2LNn7yiiuFZ7L4tSUi7A5zXxJ8rUZos21/4Nzn6cFcv5miorHMCeZ
	 3x5OicfjB1mPuU+4ckh3VGPHbyQZvY9rFbGc3R/go+q10CQFt5uGJB47SYMGc2qQkW
	 ObKQcV2XcSVQsQAWFh/9V7qAstT8Rkhr3Xseu97Nmct8xdXfgFL/8AIYpP9deUlpTc
	 CT8uKZHRT2lDA==
Date: Thu, 9 May 2024 17:41:56 +0200
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
	rafael@kernel.org
Subject: Re: [PATCH 1/2] ALSA: hda: intel-dsp-config: Switch to ACPI NHLT
Message-ID: <ZjzuxCqME77ei91Z@finisterre.sirena.org.uk>
References: <20240419084307.2718881-1-cezary.rojewski@intel.com>
 <20240419084307.2718881-2-cezary.rojewski@intel.com>
 <892ad456-cfe5-4ff1-ab67-7709677608cd@intel.com>
 <87zfsz9n8d.wl-tiwai@suse.de>
 <87v83n9lpv.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bfvyHP1lSyfGBaeh"
Content-Disposition: inline
In-Reply-To: <87v83n9lpv.wl-tiwai@suse.de>
X-Cookie: Sorry.  Nice try.
Message-ID-Hash: G5KIXLZL65BIAUBSRLDEDVR4N6FPEVZ2
X-Message-ID-Hash: G5KIXLZL65BIAUBSRLDEDVR4N6FPEVZ2
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G5KIXLZL65BIAUBSRLDEDVR4N6FPEVZ2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--bfvyHP1lSyfGBaeh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 09, 2024 at 03:08:28PM +0200, Takashi Iwai wrote:

> I don't know how Mark applied the ASoC patch, but if that actually
> worked, it's better to take from his tree.  Or, in such a case, at
> best to be merged through the tree where the new API got introduced
> (i.e. ACPI tree).

The cover letter mentioned a branch that's a dependency - TBH I'd been
expecting you to apply the core ALSA patch to your tree, but I can apply
to mine if you prefer?

--bfvyHP1lSyfGBaeh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmY87sQACgkQJNaLcl1U
h9B7/Qf9FhK/Wahz9enaI+mAPButkYyX4o74s3NIcIKA3SIT8/r4d9tUXKvHumlF
cdsglJ74uhkNt9c61zzyC/Vthnj0yNgRf+Y2AxEw0SDA51YU9UmOCujARkHKh7T2
QBC7/6NT4++TbI++f46WKtn+kj+bXZeypYbT+pFs+Eaa17B3jxPDe7sHrY6wUvNF
PSPTAJpmssMS9u88lpMy9b3PwwW6ycPyZLh9MUo0SeKGG8K+hCUcFiFK9xAlgNwH
HiInRnU3QNLu/G4DT+UU4i1rX8qtDmIbt9txlAjO382SJ93IzOG3VUmV1Nl2O9UE
CQpI1M6SyjTL7ZJWfl9qhsM802cgUg==
=vLGJ
-----END PGP SIGNATURE-----

--bfvyHP1lSyfGBaeh--
