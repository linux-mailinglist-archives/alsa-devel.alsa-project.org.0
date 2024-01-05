Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A080D825565
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Jan 2024 15:34:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1CCCE75;
	Fri,  5 Jan 2024 15:34:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1CCCE75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704465261;
	bh=PgXaKGN8DqZgvzqxm7EM/leplkV3k/W5tK0CswY8nxw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vjad61gHVh8DRtXOFtxefFbC/oH4XSprpSQZ2x6y/PuG8iAdthoBMqpbgHTUPjU44
	 Pnjj22OQR4AmpoEN/gRV0Nl1U6sUqMlJiDBhoMKtSt93GbnS/flXK7+EVNAEG6kCX5
	 2frEcpPgkgQGljSswgHmYxLaN27G4hYJTKr19MnY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CFC0EF805A0; Fri,  5 Jan 2024 15:33:50 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 04213F80563;
	Fri,  5 Jan 2024 15:33:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63391F804CC; Fri,  5 Jan 2024 15:33:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=unavailable
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AB58FF80496
	for <alsa-devel@alsa-project.org>; Fri,  5 Jan 2024 15:33:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB58FF80496
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=eutmiK8m
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7F34161B2D;
	Fri,  5 Jan 2024 14:33:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 435F0C433C8;
	Fri,  5 Jan 2024 14:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704465208;
	bh=PgXaKGN8DqZgvzqxm7EM/leplkV3k/W5tK0CswY8nxw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eutmiK8mS7otKfg6XPGuMelGNRsbSuK9AVVvVKyRcSMEKSCGJCcM3oI0VFgUuBExW
	 3lSEarA0liHmqyg1YBMLz6mDQJ1U8t1uKiVqFSPhB0unRzFwwAfoRw4EPEMSxkYEU+
	 Z/0d0A6E6W4PNk+kVaGpZ2/FT4ZNrWs5bTR0be8EpZA8PZIdmN//fPUZffx/IZlvWR
	 qSpmzpE6JcSmia1EWxAXjf9BVhKkp2AjRsMOPpi4f6a+Asuw14u2q+2uA+lgvK4gtu
	 9rry/bIyj+eKO2dpcVWYjXm0tNIheQvePJQeGGrGWb9aOgJ1+bhVpNKFwgsRweBLb2
	 iA8pe9otNIa3w==
Date: Fri, 5 Jan 2024 14:33:21 +0000
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Sean Anderson <sean.anderson@seco.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH 2/4] reset: add GPIO-based reset controller
Message-ID: <758c4fe3-1ea1-4a8c-bb6f-3a3df588da75@sirena.org.uk>
References: <20231222150133.732662-1-krzysztof.kozlowski@linaro.org>
 <20231222150133.732662-3-krzysztof.kozlowski@linaro.org>
 <530e3473-eb3b-477c-8599-e7aa12779640@seco.com>
 <88bd6668-7e67-42c7-97b6-d7029f371349@linaro.org>
 <075990bb-5fdb-4d30-9484-9df6b978e805@seco.com>
 <fcbae47b-3b28-42f0-b93f-f83932025dc1@linaro.org>
 <2be19fbf-4c73-4594-be42-31587dc7b747@seco.com>
 <d2d17b94-6f29-423d-a7e0-e24513a8e59f@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vImSMy+icUlzjZXl"
Content-Disposition: inline
In-Reply-To: <d2d17b94-6f29-423d-a7e0-e24513a8e59f@linaro.org>
X-Cookie: Your step will soil many countries.
Message-ID-Hash: 7TVKABBVTHHTZLDZKNAXBGR6LFY76YG6
X-Message-ID-Hash: 7TVKABBVTHHTZLDZKNAXBGR6LFY76YG6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7TVKABBVTHHTZLDZKNAXBGR6LFY76YG6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--vImSMy+icUlzjZXl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 04, 2024 at 08:08:50PM +0100, Krzysztof Kozlowski wrote:
> On 04/01/2024 17:30, Sean Anderson wrote:

> > device post-assert delay post-deassert delay
> > ====== ================= ===================
> > A                  500us                 1ms
> > B                    1ms               300us

...

> Now, if we are back to realistic cases - use just the longest reset time.

Isn't the main concern here that when one device probes we don't yet
know the times for the other devices?

> > If we leave things up to the drivers, then whoever probes first will get
> > to decide the reset sequence.

> In current design yes, but it's not a problem to change it. Where is the
> limitation? Just read other values and update the reset time.

We might have already done a reset by that time and earlier devices
might prevent later devices from resetting again.  It shouldn't be such
an issue for the post delay, but might be one for the pre delay.

--vImSMy+icUlzjZXl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmWYEzAACgkQJNaLcl1U
h9AUFQf8DiBunWd33PprmdlKCI899IHnZ7UxbOoI6wrUZN2Sv3Eo8tBt+XXsK2ZV
h61S9/tKulQcEi1z6NLrCKslrceGCewQP3dzTMmas5F14hBDSXE4WEfCrHpcLgtZ
r6eqUUCKIQSDhBDodrHOPSHFxvizmJqcGoFNlj+UUF6U0Mqxo1S3DY3Q4/6edGqj
p35k9Tud8KLEQJ4By0206b90rthRaUicLXQXuEqRYrrkLWQsKLIjjnZSZmrOogEb
OmGTeyk5lY67DXPrhGxYnHI0R+XiaDK4SJm07EfQmJoBfD0ShMgMicPBXod/kkG1
UUYU+vv8YIrLd/0AWrfdWORkiyteAA==
=xDYl
-----END PGP SIGNATURE-----

--vImSMy+icUlzjZXl--
