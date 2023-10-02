Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BC77B50C8
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Oct 2023 13:01:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6687DEB;
	Mon,  2 Oct 2023 13:00:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6687DEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696244464;
	bh=lUBPNIWpDvjHX8I98WirEls2JkxV4/o074urcrO7lc4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UiA+o2kV7glfKgiLDo+DvCgcm+GGPTAEVfiximnbZbbopMpxbhoL7XNWOqo5CDFpq
	 LGFH+QRP30GMqsznddU4TWcogL/aIJ1inSgz5hsc/5AoAze6bBVhQkjkeIo7DSkf/T
	 Hk87zSfgrdOrlWzDw3iQKyIl7UkE+xiLMUi/SZys=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A794F80549; Mon,  2 Oct 2023 13:00:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F6CAF802E8;
	Mon,  2 Oct 2023 13:00:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3188FF80310; Mon,  2 Oct 2023 13:00:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 73137F80166;
	Mon,  2 Oct 2023 12:59:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73137F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=uFkgOuEt
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D93D4CE0E83;
	Mon,  2 Oct 2023 10:59:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06359C433C9;
	Mon,  2 Oct 2023 10:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696244394;
	bh=lUBPNIWpDvjHX8I98WirEls2JkxV4/o074urcrO7lc4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uFkgOuEtIDIjXaSSXt/PFQcRlOw/GbqlZHzhVadAKGoQmFEXk9IuDCnVku7/bEcOt
	 V8lW3oZ23trVQAcoS5oIS8hmtzQqrmJzT7SROtNsvHqFN1grInXjiA/TuYqXx+EqLT
	 nkUq89SORBvYg6mVUw/I8GYplVJNNGYmWP+PrwnFCzvNk8OViZCLMS6JsjaRgmL2uC
	 blJoFRJq1l+z9KVP9rEm8ZDiofm8lkggAPty8ezQPlbub2Bpg/Ypp5oyqbAc3kQWA8
	 AlcsUBM56q+yklqUJYlU/Jict4HTERCmkaCPvHCmrVz4d9xW+rG1Ji+hXgXKs6aXwK
	 OINs6zWiFd6qQ==
Date: Mon, 2 Oct 2023 11:59:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] ASoC: SOF: ipc4-topology: Use size_add() in call
 to struct_size()
Message-ID: <b5e0bfc8-88cc-4428-8554-66b4da9c9acf@sirena.org.uk>
References: <ZQSr15AYJpDpipg6@work>
 <169601489953.3012131.13922425518082792309.b4-ty@chromium.org>
 <ZRlJN9qVOv7CIu1N@finisterre.sirena.org.uk>
 <202310011335.28B55A3BE@keescook>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jHjeUkQ9vroTCASR"
Content-Disposition: inline
In-Reply-To: <202310011335.28B55A3BE@keescook>
X-Cookie: Postage will be paid by addressee.
Message-ID-Hash: A2F2FRQZ5RDXQMCFBQGAIN3ZGBQ4L562
X-Message-ID-Hash: A2F2FRQZ5RDXQMCFBQGAIN3ZGBQ4L562
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A2F2FRQZ5RDXQMCFBQGAIN3ZGBQ4L562/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--jHjeUkQ9vroTCASR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Oct 01, 2023 at 01:37:04PM -0700, Kees Cook wrote:
> On Sun, Oct 01, 2023 at 11:25:59AM +0100, Mark Brown wrote:

> > Why is this bypassing the ASoC tree?

> Hi! Sorry, I can drop it if you want to take it? I tend to collect trivial
> hardening changes with reviews that haven't been otherwise commented on
> for at least 2 weeks.

Yes, it's in my queue - 2 weeks is really rather fast between people not
being available and waiting for driver authors to review if they
normally look at things.

--jHjeUkQ9vroTCASR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUaoqMACgkQJNaLcl1U
h9Ba+Qf/dXs8T5y+jACKhiUt2Q8jXwBJIZcnab5H86E5MOnONXQyTG+rozhIbvdQ
5FibdLoYXrDu+EbviyhKagsSr0D4fDTPUvKubBR+DXOjVDWMcaKW+bVQTXHa428T
xzsMvPVvjVOlmA8vPux7nv26XtV0HLuJE+Ym2EzBlqFiQefjbb+6pwfw5/ZbOc/s
6DKIpT1kWL8cWb3zlhHsssQhnS5xVj+3qGb77NjiIme07oBr4Vl6PJW+6Nt+HrIy
GrWfE7kVfTHb5ph7OEesv68rG7bkEcsz/l7KP10XwjBMO/E6bCyqzKum3iIBxhWg
OSFTopV/X+x+PWLesMM5w7oenKni3A==
=qPZ5
-----END PGP SIGNATURE-----

--jHjeUkQ9vroTCASR--
