Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9604B742B6A
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jun 2023 19:39:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 747317F4;
	Thu, 29 Jun 2023 19:38:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 747317F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688060386;
	bh=6sXzGhC7vIMzYyxfx+TpK69VIpMiNe5l+HsKkIs0gCs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=j2N0C/03b88HQCLRJvguXZfBKIxwVFfwUiI5N2gE2/2Pu+3nCQHd+D6q0FI+ktmox
	 Z1DwLblbF+T8TIwFQRABvL7NbKFjUxG9myipRopkUxv+zJn+9tEVGYOLGFy5ot+OUM
	 S8KNl5TW8cUPxIARrfDKBw5oA+BBnw9NE9+VrTWs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8685F80212; Thu, 29 Jun 2023 19:38:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F1D4F80212;
	Thu, 29 Jun 2023 19:38:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F52FF80246; Thu, 29 Jun 2023 19:38:52 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 412AFF80169
	for <alsa-devel@alsa-project.org>; Thu, 29 Jun 2023 19:38:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 412AFF80169
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=cM2+mp45
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E21CA615BB;
	Thu, 29 Jun 2023 17:38:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9529BC433C0;
	Thu, 29 Jun 2023 17:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688060324;
	bh=6sXzGhC7vIMzYyxfx+TpK69VIpMiNe5l+HsKkIs0gCs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cM2+mp45AR6aLokpbM9NA93Ddoj8EACrDPwr0dt5EHPVKl9+mwOSPLUVsqxuRQGHB
	 FKc3YZhyXlxUggE4WwhxHCRoAstKkiHANYoE/fUoeg+Qh0rmaXMawT2JjuIV3fqR3Z
	 H9jXHec2IpBiQ05+8K0uQuNZ71gDfJZ/AwYTyWWCSQsFQZUurj39QYgojaNOUcGoad
	 GrqEyPmWzMNkq1IWZ3N8vD6KJl3IsYKzIgiXaxmou8XrYVFICHOwYa5HW2evtzWxkD
	 HUat2RWeaZpycw5GDw0ZnHCUNqmWO1g1ILHuF3ZrbY1f1r4cYhHmLN0ksatk/Ivqgk
	 pzDUHr/mwd/Jw==
Date: Thu, 29 Jun 2023 18:38:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	johan+linaro@kernel.org, perex@perex.cz, tiwai@suse.com,
	lgirdwood@gmail.com, ckeepax@opensource.cirrus.com,
	kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
	Stable@vger.kernel.org
Subject: Re: [PATCH] ASoC: qdsp6: q6apm: use dai link pcm id as pcm device
 number
Message-ID: <1c1dd19e-cbc4-41fe-9e97-a07cfebdaa4b@sirena.org.uk>
References: <20230628092404.13927-1-srinivas.kandagatla@linaro.org>
 <c22fcc94-aa41-4ffd-bfe8-f0b9f15a76c0@sirena.org.uk>
 <2023062940-snore-brick-419b@gregkh>
 <9699a960-74b0-4064-b264-6cde06cd16fc@sirena.org.uk>
 <2023062958-thumping-ambulance-7a2f@gregkh>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kJyOuHiyyBo6gZpK"
Content-Disposition: inline
In-Reply-To: <2023062958-thumping-ambulance-7a2f@gregkh>
X-Cookie: Surprise due today.  Also the rent.
Message-ID-Hash: TQLV2ZV54I2OB3MNXQVYNT4QRY4TN6LE
X-Message-ID-Hash: TQLV2ZV54I2OB3MNXQVYNT4QRY4TN6LE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TQLV2ZV54I2OB3MNXQVYNT4QRY4TN6LE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--kJyOuHiyyBo6gZpK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 29, 2023 at 07:22:51PM +0200, Greg KH wrote:

> It shouldn't matter for stable or not, if the change is acceptable in
> Linus's tree, with the userspace visable change, then it should be
> acceptable in any active stable branch as well.  There is no difference
> here for userspace api/abi rules.

As discussed before your tolerance for risk in stable is *far* higher
than mine, if there's any value in doing this at all it's probably
within what would get taken but that doesn't mean that it's something
that it's sensible to highlight as an important fix like tagging for
stable does.  It's extremely unclear that it fits the severity criteria
that are supposed to be being applied to stable, though obviously the
documentation doesn't fit the actual practice these days.

--kJyOuHiyyBo6gZpK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSdwZ0ACgkQJNaLcl1U
h9Ay1wf/V8UaFH7JxyAo2RN57WH5Ye9RCQpALdXWBo8riXGMcrU+5V3j2BOtv6j8
n7nOp3QM2HGoTbgFuSiUK+oNFilaNjNOzwB8I9VAG5Z3td0S9n4IEIsDPQkLFsm9
zt7I8TELzcKnbq0iQ/ob8Ubw3icGzVrPXCaWbkBcBCzyxsu3e9bkI33rhnymTyNE
ZN+BevBytonv53kKAoOekPt/Q48mRMSm/9yFDDerJTHC5+Ofj2eLmCepvkrCs0t6
vGfLDa07uKyZOmPblvStwNoPHh6swDc0264D2VzB4Vn8TnNiPtbMS59Bw2oK+9d2
VHUck3TXRnm57K1nTZSoTmP3WwaY+w==
=C4my
-----END PGP SIGNATURE-----

--kJyOuHiyyBo6gZpK--
