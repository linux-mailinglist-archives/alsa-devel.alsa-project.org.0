Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E2151D88E
	for <lists+alsa-devel@lfdr.de>; Fri,  6 May 2022 15:13:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D426517E0;
	Fri,  6 May 2022 15:12:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D426517E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651842821;
	bh=Z4VQ1ErZuEWJoaRAFl/6I2PdBArhJPm8vMKue0pYS2U=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dgRWtERsEnn34TzNMcCx/ARGUtm7BcYDYcSXBmozx3emh3PtQzB6iswyzlX91ek6u
	 v8rBS5GM+D4VWgV7sYbV2lY7G9xMdqo6Vhrkjvb1FUiucvUbK0ndJZKJCo1VoZGGc3
	 hQD47JYgDTlaTuI0euy9dzhH78NDBSRLcJQq55Rw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 544B8F80171;
	Fri,  6 May 2022 15:12:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83014F8014B; Fri,  6 May 2022 15:12:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64890F800E3
 for <alsa-devel@alsa-project.org>; Fri,  6 May 2022 15:12:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64890F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lK35KQpH"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 02E2061F38;
 Fri,  6 May 2022 13:12:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2837C385A9;
 Fri,  6 May 2022 13:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651842755;
 bh=Z4VQ1ErZuEWJoaRAFl/6I2PdBArhJPm8vMKue0pYS2U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lK35KQpHmGG14FWep0OCLcKvpqOigIseXbWFXPDOVDVR3jHuqdtCULlkslvUwVt0k
 lQR5BiEDwtvJXc6Gjhy9o9FJWgbON62YF6QCI7ugfRqQ6WrDYBIrxo66rOicGqlGlu
 Y7+BXBgPWSG3f/Skfq+oKUzVt90vAK3av7bDPoyQm+VJW3qJqmLthFxUjDGNmRqoIU
 woEB2wxDQN1q3XmjKfk0YzNj/2d/G1ec3f7EpVKarSwFEvdfoa/YaTOpEOpPsQryth
 /bChJ1AkWohQJoMArbGxsgs7twTB4GVRwImZZazKPFaaZQBgVs0jxkkmiJdX9Tpgwv
 QKlAkjTqfXfwA==
Date: Fri, 6 May 2022 14:12:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 02/14] ASoC: codecs: Add HD-Audio codec driver
Message-ID: <YnUev8Rs42xLLE6Z@sirena.org.uk>
References: <20220427081902.3525183-1-cezary.rojewski@intel.com>
 <20220427081902.3525183-3-cezary.rojewski@intel.com>
 <7bc3a92e-8bd1-c1d0-5610-af40dbb8fb7a@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ZSV2pc7In/uUfPMj"
Content-Disposition: inline
In-Reply-To: <7bc3a92e-8bd1-c1d0-5610-af40dbb8fb7a@linux.intel.com>
X-Cookie: <Culus-> libc6 is not essential :|
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, rad@semihalf.com,
 upstream@semihalf.com, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 harshapriya.n@intel.com, tiwai@suse.com, alsa-devel@alsa-project.org,
 hdegoede@redhat.com, amadeuszx.slawinski@linux.intel.com,
 cujomalainey@chromium.org, lma@semihalf.com
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


--ZSV2pc7In/uUfPMj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 27, 2022 at 10:47:12AM -0500, Pierre-Louis Bossart wrote:
> On 4/27/22 03:18, Cezary Rojewski wrote:

> > Add generic ASoC equivalent of ALSA HD-Audio codec. This codec is
> > designed to follow HDA_DEV_LEGACY convention. Driver wrapps existing
> > hda_codec.c handlers to prevent code duplication within the newly added

> I am surprised the explanations don't even mention the existence of hdac_hda.c

> I thought the series was about adding machine drivers, but this
> also adds code on the sound/soc/codecs/ side which I didn't see
> coming.

> I am not qualified to review this part of the code, I just
> wonder about duplication of functionality.

> At the very least an explanation on why you decided to NOT use
> hdac_hda.c would be useful to reviewers and maintainers.

Right, why the duplication here?  Can't we fix or extend the
existing code to do whatever it's not currently doing which
compels reimplementation?

--ZSV2pc7In/uUfPMj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJ1Hr4ACgkQJNaLcl1U
h9A2gAf/UjhT15dfZI5vIAveeggqy0vhUIKDQaHfDBr2+rmS0hJFfJxLBq/LWhYo
8KU+BFsD+xdG6xBqe8oTY1gcx/8fqNelUdBoaAyCHwkNguWYOdfsKtkqQ27up3Kc
Y562uqJoKdLLlp5myKukSJdOKrbpVrnVyZhbEH8fFRZ+XQwTJXVQoAXQWMz0UMZV
wnnS0f0hi3c7NxSGMa6a7sUyVAm8TmFOE6GFBLSfdPSPVhnfp0wVoDejWfu6cGV+
AbUipCMybpfj2KJw3eQv1XN0Rh3YbPCnmvnsPfnRCWxwwTFRW6FTN9aElWHGJvA4
EVcbjdwjNdMOSJfCuBQqmrsZGBC58Q==
=tgND
-----END PGP SIGNATURE-----

--ZSV2pc7In/uUfPMj--
