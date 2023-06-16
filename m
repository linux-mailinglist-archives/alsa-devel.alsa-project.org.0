Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDFC733086
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jun 2023 13:57:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D1C982A;
	Fri, 16 Jun 2023 13:56:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D1C982A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686916625;
	bh=Cefq0nhQ5+KvwZkN7+opbg79I2XubmqBgE72Y6hj+rY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GlH4AN7qEBXb7bWnOS7aLM71ocAo79wKbY7VIk9caLNHjwP2zryLp4JVM1XJnQbV5
	 i7Nkrgs5x095aEXy8p1vIIAbrAQaPyuuHBni3y15faf3RpuUfqZB/bCoDtCKojeSHh
	 xhvhVlvz225Y0afSHU7wneE/NsHxu7sdepbYhR2o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 589C3F80533; Fri, 16 Jun 2023 13:56:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0932BF80149;
	Fri, 16 Jun 2023 13:56:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92463F80155; Fri, 16 Jun 2023 13:56:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2AC84F80093
	for <alsa-devel@alsa-project.org>; Fri, 16 Jun 2023 13:56:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2AC84F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=a0Oq79zw
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5CF9261F81;
	Fri, 16 Jun 2023 11:56:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67CA3C433C8;
	Fri, 16 Jun 2023 11:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686916565;
	bh=Cefq0nhQ5+KvwZkN7+opbg79I2XubmqBgE72Y6hj+rY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a0Oq79zw6rjdIS59w8GBa8hCRA6XQ22iHGti0I4SUc8HJE67VHiY+6RqYZZVx3JWP
	 qqg4CFTHRtfRci/CeIlsuXGUwNetOJZ6HdlntcvnBqbBlz71poBAr7MxIISHB76wbZ
	 DjTEpml4uo09DSJRX7HzUZpoBZ3IY0kQxnoGg6/jryDz1ePpLJfdIoKIU4jRpEtk4B
	 LwSVT5EbqMiGPRGvlo3ykAnBWJa0a0Fm8ImLAmd5eP22N3x8z8dA9M4kv+TQ1XY3T0
	 V7D5UBo56g3KqZGCBZO9i6n2TIaWIrI0obUA5ybqu4pve9gq6oMYxA3w1qFjOefKeu
	 dAgPAWGAYBZrg==
Date: Fri, 16 Jun 2023 12:56:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Rander Wang <rander.wang@intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	=?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	ALSA Development Mailing List <alsa-devel@alsa-project.org>
Subject: Re: sound/soc/soc-pcm.c:2089:5: warning: stack frame size (2064)
 exceeds limit (2048) in 'dpcm_be_dai_trigger'
Message-ID: <caea391c-f10a-4979-92c3-75964ed7497a@sirena.org.uk>
References: <202306160240.ahGjvPqw-lkp@intel.com>
 <c5ce23fc-db87-6f11-0708-85cc4ba2a46c@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HCxw+tlxQuwCrK6z"
Content-Disposition: inline
In-Reply-To: <c5ce23fc-db87-6f11-0708-85cc4ba2a46c@linux.intel.com>
X-Cookie: P-K4
Message-ID-Hash: V6R3C4L4FYN5KO5FM5DNZOAVVWNKIMLP
X-Message-ID-Hash: V6R3C4L4FYN5KO5FM5DNZOAVVWNKIMLP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V6R3C4L4FYN5KO5FM5DNZOAVVWNKIMLP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--HCxw+tlxQuwCrK6z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 16, 2023 at 12:21:13PM +0200, Pierre-Louis Bossart wrote:
> On 6/15/23 20:34, kernel test robot wrote:

> >>> sound/soc/soc-pcm.c:2089:5: warning: stack frame size (2064) exceeds limit (2048) in 'dpcm_be_dai_trigger' [-Wframe-larger-than]
> >    int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,

> Not sure what causes this warning to show up, the code hasn't changed in
> 1.2 years, nor what to do about it....

One of the sanitisers is doing things which explodes the stack size.  I
wouldn't worry about it, one of the toolchain people will probably get
to it at some point if they didn't already (sometimes these things are
done by tuning the compiler flags).

--HCxw+tlxQuwCrK6z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSMTc8ACgkQJNaLcl1U
h9A7OAf6AgtQcEPXuFb0M6xmtaQTE76Xb+GZtm13l3OadG+W1Dt9iWZ7TkgsRJsn
9SNNxVV4MNvTBDnMdaIub6laD2Z9ZVrJGl8LdzaKB9+knR8P728hF+w4XY1F20lc
WqHIRocELOJocfPAta9UrJfzPlpKjtFysCsaEzwSkDz5pYuSwqvJ2bGgVy2cVaze
Sn6jchA2BXu3D1n1+FPVvUrOFD7aLyCVJjh8eLT9rsAQDB02Ok9k3AXtfPj2BXw7
+6V25NqO/UGYYfwAFxPUNFiEkaqXh++eRwJs6rFkHTNej3GyxifySHfFGwojCXaH
JJcS9oKg3P9+3CPmYoPQtExmpmujBQ==
=9AO/
-----END PGP SIGNATURE-----

--HCxw+tlxQuwCrK6z--
