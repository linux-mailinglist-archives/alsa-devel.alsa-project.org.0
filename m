Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 653B42816F0
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Oct 2020 17:44:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A6761F1C;
	Fri,  2 Oct 2020 17:43:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A6761F1C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601653441;
	bh=v5iehWcOX0VLo1AP99P9bUun2tqq3LWKlFh9oC0pM6A=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iZZt34u6P5Sz442FEUTvw4Bx2+9jENyLQFaiL+mDGSpqr1eVm5zU+OW1u6HWdt7K0
	 JNVGWS7NWmh3TUb9PpePAkmscNcAReyMW3QVvwo9LtgZdbYC31oy+8gzvYRGczbR97
	 nQ1wA2HhQ7eIhf1UKKwlCGWp7uDBAW907pNP+OKc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6AB40F80228;
	Fri,  2 Oct 2020 17:42:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9AD7F801F9; Fri,  2 Oct 2020 17:42:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9589F800AB
 for <alsa-devel@alsa-project.org>; Fri,  2 Oct 2020 17:42:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9589F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="vlFOtcqO"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E3CF02074B;
 Fri,  2 Oct 2020 15:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601653327;
 bh=v5iehWcOX0VLo1AP99P9bUun2tqq3LWKlFh9oC0pM6A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vlFOtcqOxfyc22WCafJBSQo1lA+ZbQIvpliVp5g+LacQS99cqT50bn3+vFDF+rpbf
 9O0c5qNtP/fwlvgZ9oVP7lGlhLbedjAsUNUFgwBzyndZI4MgINYQI4itJqbXsFbSBC
 77+q/QTtoD8VTqtvt7RQsUcbtA/ANEIvZN+tL8ic=
Date: Fri, 2 Oct 2020 16:41:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Olivier Moysan <olivier.moysan@st.com>
Subject: Re: [PATCH 1/1] ASoC: cs42l51: add soft dependency declaration
Message-ID: <20201002154107.GC5527@sirena.org.uk>
References: <20201002152904.16448-1-olivier.moysan@st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="MnLPg7ZWsaic7Fhd"
Content-Disposition: inline
In-Reply-To: <20201002152904.16448-1-olivier.moysan@st.com>
X-Cookie: Words must be weighed, not counted.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, alexandre.torgue@st.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 arnaud.patard@rtp-net.org
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


--MnLPg7ZWsaic7Fhd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 02, 2020 at 05:29:04PM +0200, Olivier Moysan wrote:
> When configured as module, CS42L51 codec driver uses two modules
> snd-soc-cs42l51 and snd-soc-cs42l51-i2c.
> Add soft dependency on snd-soc-cs42l51-i2c in snd-soc-cs42l51,
> to allow smart module dependency solving.

Doesn't the userspace tooling usually manage to figure this out from
symbol usage?

--MnLPg7ZWsaic7Fhd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl93ShIACgkQJNaLcl1U
h9AfMgf/bO5iRl+FHKAa69Dt5NyALR5rJ9EhOt2FrK6Ql/DPOjT4GJE2wWdt/fKD
H9c2EU6rY0lAp4X7M5PNZJrq4gOcyWdGaHfIOfXBf2qiEzN3L6AvX6iA5oBi1s3O
eECGQmaRqcwv/nSuoOnzpkoKyywBq9+o9lkHWu1jBg7uhYU1kjp4kJmifrl1aeFU
QrxFCjLwGSjmNFfm7v3N/33M/aNRwvhyrG9ct+19u1GabgzXBQpLqVj/7Qf1R4Ab
4Wx8zbP9UI9kW+NLwFewr2wDMP4+WC86biyvT8yU2RYGfxzU3l5U6GtawF+TDhpR
yBPJ2eIvTmHz66uX7dvMIHlzF2V+GA==
=ioD8
-----END PGP SIGNATURE-----

--MnLPg7ZWsaic7Fhd--
