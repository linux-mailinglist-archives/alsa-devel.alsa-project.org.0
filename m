Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE308D6275
	for <lists+alsa-devel@lfdr.de>; Fri, 31 May 2024 15:10:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1AA1846;
	Fri, 31 May 2024 15:10:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1AA1846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717161051;
	bh=nn3ZIl3mTwy4jDOPZZMcgjHeEDzdP9fz+mt30ZhzMQ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fWMBgHsaslqpcRMi4e2+H+jVMSlxJWuIDBIcU2tnUh3DyzZN0B0h8w+v3mcYg6ZvA
	 KOzeAGO/LYKHiguSDu+iuWSHF4oqzcvVGqVmgJpKbfYWFoH95KIAebo36kSPvaJcWD
	 ZiM0io1+NqTy0hIQgy48G2TstHR7XHRUuhjYhG+s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1248F805A8; Fri, 31 May 2024 15:10:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 15004F80525;
	Fri, 31 May 2024 15:10:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9C6B8F8026D; Fri, 31 May 2024 15:10:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 19105F8003A
	for <alsa-devel@alsa-project.org>; Fri, 31 May 2024 15:10:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19105F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=gzfFWJED
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 850A4CE1C6B;
	Fri, 31 May 2024 13:10:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADB9EC116B1;
	Fri, 31 May 2024 13:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717161000;
	bh=nn3ZIl3mTwy4jDOPZZMcgjHeEDzdP9fz+mt30ZhzMQ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gzfFWJEDxUXGkknghVKqiGcy2480IcnsHTVRkYB0ohkhRD7cASEX3Tcv9GYdWYCiI
	 9bEsAgKevrJeIr/v8T789I9g5/XXPhV7lXMg1A39QZ60Hf4oEaOGy6aUEonrQKH9mc
	 qlGcvYt7kdlnY9JbOZrEz27B6GSoMnD30N21H6dnowFNC3mZRsrNEMWuE92OZ5qlMP
	 K9CdtW9TLbjlxtT1Kt3SGR5u/8i4ykECKJotxlymyi6qbZ+ne0rskSMTCY1KZmqlO6
	 hUSV1CGsNIAb3E5gswMGoZk6dPDVKg6vCfYR9B+5BN34K3JjsfuC3Fud4PBwhqC/KX
	 UJ/BUTYHkdJbg==
Date: Fri, 31 May 2024 14:09:53 +0100
From: Mark Brown <broonie@kernel.org>
To: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	shengjiu wang <shengjiu.wang@gmail.com>,
	Xiubo Lee <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound <linux-sound@vger.kernel.org>,
	devicetree <devicetree@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	alsa-devel <alsa-devel@alsa-project.org>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCHv4 8/9] ASoC: fsl-asoc-card: add DT property
 "cpu-system-clock-direction-out"
Message-ID: <cbf66aed-2bc7-43f7-adbd-d39774c255ab@sirena.org.uk>
References: <20240515135411.343333-1-elinor.montmasson@savoirfairelinux.com>
 <20240515135411.343333-9-elinor.montmasson@savoirfairelinux.com>
 <20d8eb96-6346-4341-95ee-74729001c01a@sirena.org.uk>
 <1607626951.349332.1715936738428.JavaMail.zimbra@savoirfairelinux.com>
 <aa212906-6579-4884-82b5-6d0eb8b0b7a0@sirena.org.uk>
 <477405270.701257.1717159642136.JavaMail.zimbra@savoirfairelinux.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NswN//hqd8Z1peYF"
Content-Disposition: inline
In-Reply-To: 
 <477405270.701257.1717159642136.JavaMail.zimbra@savoirfairelinux.com>
X-Cookie: Serving suggestion.
Message-ID-Hash: T5MBKWRLSTZ5TGT5KHCJJBZVVNWCYU62
X-Message-ID-Hash: T5MBKWRLSTZ5TGT5KHCJJBZVVNWCYU62
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T5MBKWRLSTZ5TGT5KHCJJBZVVNWCYU62/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--NswN//hqd8Z1peYF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 31, 2024 at 08:47:22AM -0400, Elinor Montmasson wrote:

> > When I said "this should use the clock bindings" I meant that we should
> > use the clock bindings for configuration here.

> As far I as know, it's not possible to set the direction with
> the clock bindings, but maybe there is and I missed something ?

If a given clock has an input configured then it can't function as an
output and vice versa.

--NswN//hqd8Z1peYF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZZzCEACgkQJNaLcl1U
h9CKqwf+LcvhKkLjySDBCo2AIl/+WWEqokt2mSyrKfa1HNgIC2P5ZIxpVrviALhb
AFpK4I2D1Kh+ltGruh1zwOo32CaHr2GpvJ46CLzz1NmH8Jd5pers680nusk7V2XK
j99GiZHitgxOITrP3z0+3f0DerpwZEzR3xXUjxuIDTyDQRdZKIYbvKzRKMkVOKB2
dN8PV6CpvHZdWD219ACPaLasi774vOA4/7CHonsfuaUWUel4Bqhd7nG2ofKhjFWF
f7WtxfSfqe2o8S2JcySsIR1XVRMplDYbz0PByFJYbE6U8XY0QpLZlEEDRLXhd7V+
bMtoDrc/OUMO9pGT7silCtwMMzIkYQ==
=C2Hr
-----END PGP SIGNATURE-----

--NswN//hqd8Z1peYF--
