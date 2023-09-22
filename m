Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 964B97AB3D2
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Sep 2023 16:39:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C226DF9;
	Fri, 22 Sep 2023 16:38:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C226DF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695393588;
	bh=nu2Nh17EGEHtjLlysjdCrl2hh2gT/i57l3ZdUM7YoCc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QVI9kTLFRWsjIwrCA+5XwXukqW2DvCYbxN7U7v2+pg9TolIsB4wegxcOfWVeoHN5d
	 T6rWJDINRrodKxRG4SRej+RNDWMDiXV5BKLdxbR08dVtcImcALNHXGCpSQBuZX2bOj
	 gD+QjjzQI0/3r6EFhr46Sdil0DCjhlCKHm4TiqQ4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC367F80552; Fri, 22 Sep 2023 16:38:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 527A7F80124;
	Fri, 22 Sep 2023 16:38:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 460DAF80125; Fri, 22 Sep 2023 16:38:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9D6D3F80005
	for <alsa-devel@alsa-project.org>; Fri, 22 Sep 2023 16:38:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D6D3F80005
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=dywcCfo2
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C2EDDCE2407;
	Fri, 22 Sep 2023 14:38:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79ACEC433C9;
	Fri, 22 Sep 2023 14:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695393513;
	bh=nu2Nh17EGEHtjLlysjdCrl2hh2gT/i57l3ZdUM7YoCc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dywcCfo2kUQ6KP/vdMFgOUlIqpACI1QlIkNzRLoVK8Wr0mUzcoqSuTX6mYbinFPxK
	 QUKdhdp4WAY0+aE0jX6CmPf9WVDDBE9bEsa8LUiShvx2POARoKKRGY8KFG9aNM8sUF
	 fcH4DbG7cY9IX3pFmUqk9l5oJRjpEijpBKXgEHUo3CUe4Jp+dDfZe8ffgvmjX/IvxH
	 n3yUskuqfAZ6y0qsVuur3a8eXr8VYjZnKugUBYIOCBgN92XrgT8Rda4nhF9GrdTKgZ
	 +U0YBVcsW/731OH7ZdvVTUHPySBF/FzPjLkTtrT8aV3GBGUX82LBl8ZEOTYkS+KoG2
	 u8MFGhRmcROnA==
Date: Fri, 22 Sep 2023 15:38:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Stefan Binding <sbinding@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH v1 0/2] ALSA: cs35l41: prevent old firmwares using
 unsupported commands
Message-ID: <8b5a22bf-73e3-45ca-b61b-38482c9caa39@sirena.org.uk>
References: <20230922142818.2021103-1-sbinding@opensource.cirrus.com>
 <87a5tecm2m.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RfXcTh4xSBI3kSn3"
Content-Disposition: inline
In-Reply-To: <87a5tecm2m.wl-tiwai@suse.de>
X-Cookie: A day without sunshine is like night.
Message-ID-Hash: 4IQKPDIE5SPJABZTPJR4J5NGBVKYJXAJ
X-Message-ID-Hash: 4IQKPDIE5SPJABZTPJR4J5NGBVKYJXAJ
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4IQKPDIE5SPJABZTPJR4J5NGBVKYJXAJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--RfXcTh4xSBI3kSn3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 22, 2023 at 04:35:45PM +0200, Takashi Iwai wrote:
> Stefan Binding wrote:

> > This chain is based on Mark's branch, since the api change was made to

The term is patch series.

> > the function in sound/soc/codecs/cs35l41-lib.c.

> I'd need a PR from Mark before applying those, then.

Or if they're 6.7 stuff I guess I could just carry them.

--RfXcTh4xSBI3kSn3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUNpuMACgkQJNaLcl1U
h9D7Twf/ZXKN0Y1+6CsKbyzCCUflbuc4f0xqnwrdlm5+qVb6CCFBFQfc82pLbjdw
1qzTJX7B7pUsFnsh/2YkED/3vvjN7ztFpi9gL4CZlVJcktHB1/ta3l29q5+4MiqW
VcHkIrq7O9dg8UF4+6nzyoUfn+zXg9i8fVziNF9rayHvuAgja9lUxWqXQhBucEkF
y16T9wUDf9UvpeJ7QyPIP8OY97n5kQ3+vfQxjGzk5PZjBmKTgPKvSrPU6seyc5Zw
j2A9vQMproks4qlvOcMuE5pdIM+Y2GhENZL0/++NuQDQ9jfSgyE9iwQ3Qm4aW9ST
ZD2u2VVxcWXww3XdjdwMBhJNA2O/bw==
=EMl+
-----END PGP SIGNATURE-----

--RfXcTh4xSBI3kSn3--
