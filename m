Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D46E9231C3F
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jul 2020 11:41:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 511C91751;
	Wed, 29 Jul 2020 11:40:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 511C91751
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596015681;
	bh=Q/bPIK4oE9XYe1CAwYtajXqieS96RSPoCR4+Pdo5+Vw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I37hqpwT+j/obfFvDYQh2RoKin01n8Oxb9Gb9YBA+Jjjdvn8eAGyF/F6EhDcX09WA
	 3QEklTnkTe2E3lkm2tV8ytS7qDwmNpDqz6fVqFqYzfr0LLQv81KKHZSXudOFAJeV7H
	 Qjtv36LNu6sMocOPmCSwn+o90g7uV9M2MFw9f32Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76AEEF80171;
	Wed, 29 Jul 2020 11:39:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB838F801A3; Wed, 29 Jul 2020 11:39:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36F82F800DE
 for <alsa-devel@alsa-project.org>; Wed, 29 Jul 2020 11:39:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36F82F800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bkE06mJt"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 86F222075D;
 Wed, 29 Jul 2020 09:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596015564;
 bh=Q/bPIK4oE9XYe1CAwYtajXqieS96RSPoCR4+Pdo5+Vw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bkE06mJtJPSmOrtN640jmBAXYbTBczyrxK2TzpIreq6MPovwChwaZcWw6XajvZDi8
 2Rppd6aCl70tGBHWEm+TwCjRtOA8ebyy2/G2VwIjfLry9lwd46E+XP4gUyooQIxjuZ
 d1VipBnI2Bjpo8gIXQ3JVoDFxJCKJs2P4ty6SnKQ=
Date: Wed, 29 Jul 2020 10:39:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: hda: fix NULL pointer dereference during suspend
Message-ID: <20200729093905.GA5612@sirena.org.uk>
References: <20200728231011.1454066-1-ranjani.sridharan@linux.intel.com>
 <s5hzh7iep8n.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7AUc2qLy4jB3hD7Z"
Content-Disposition: inline
In-Reply-To: <s5hzh7iep8n.wl-tiwai@suse.de>
X-Cookie: May all your PUSHes be POPped.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, yong.zhi@intel.com,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, tiwai@suse.com
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


--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 29, 2020 at 09:48:08AM +0200, Takashi Iwai wrote:

> The code changes look OK to apply, but I still wonder how the runtime
> PM gets invoked even if the device is not instantiated properly?

The components are registered and active at the device model level even
if they never get incorporated into a card.

--7AUc2qLy4jB3hD7Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8hQ7UACgkQJNaLcl1U
h9D08Af/d+6qCsJx32Yi7QB3lMlPBEcx/Zi3vg6L6tXIhQFl3kGd6Wsw8x0+blGg
CwAmUduVFr8kKqOvyZME+ivbXFlUFLnUBKVoG9mrua4Ansvd9dSIWnQ8ujTY0ofs
IoKgRBfdb3+30JmShqhyOTJFtONGbZGBwKQLH6Qo5izUlVAoTBXqpk6Fp3/RnTjc
6aOZ3GoawgkBXBi2CAcS6lU8L7Gp4VICtQMafU9WSwjdWNPt8SYqU9DCZR8PL7IP
oTEnQ8B0yTHwOK3DPEPzQ9za9+VFby9MGerR0Az7SPmskUAIff6SYuve0HfgkPsE
nRhlUCJEET/xw3u01T0J0r62RHidTQ==
=tXGq
-----END PGP SIGNATURE-----

--7AUc2qLy4jB3hD7Z--
