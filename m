Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FEE70F36C
	for <lists+alsa-devel@lfdr.de>; Wed, 24 May 2023 11:50:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0EAC3E7;
	Wed, 24 May 2023 11:49:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0EAC3E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684921806;
	bh=XOfwDSgrY2BQhVwfm4T7jxksI5sC8k9yj6vj9mTkvlM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FGQ9veiNDI8HCTCAo8bEOJUAO2A/tk5E1Bi5y/3MzCTUli3flm5jIGTT+qPfjPpro
	 qOW/WM1amc0LoZLZvHKYEO9OUENLY7VgPJR+BFhpJnxhkJnSBiGNyL78URZsxtY4bm
	 iQ894u/VUS+l0IFw7UOWK5nsXF3A0sBISxFMJ8Vk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD09BF80053; Wed, 24 May 2023 11:48:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 06719F80249;
	Wed, 24 May 2023 11:48:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6AFE5F8026A; Wed, 24 May 2023 11:48:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2BCA5F80053
	for <alsa-devel@alsa-project.org>; Wed, 24 May 2023 11:48:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2BCA5F80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=q8FQMMbu
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E32BB6006F;
	Wed, 24 May 2023 09:48:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 624AAC433D2;
	Wed, 24 May 2023 09:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684921725;
	bh=XOfwDSgrY2BQhVwfm4T7jxksI5sC8k9yj6vj9mTkvlM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q8FQMMbuxu8++UlKgK+2WH+jnW7nU7KvYQ3d72jMUrVBi152HGqALC7FI6cPr629p
	 kGMe23Nbzdmlh+o4Setd5gKGS5XLGdYS7LM8VIZVLpm6j6JJPKCPHTYwbNAdU0ICPk
	 kn0InzG/zSzzW9zgywbBWuEM/pkS4Un9Xo+sXGx3H8CPEmnX2IczUe7IGDAoLyBfG/
	 RgeNMN1LCSjHVRnV8PxIgeitELI17VBcIFc/eeZnqV/WNumZAQubxM6rTezEZvrjSI
	 mvlXB9tdOPbZwOnMJcCXppkuaoFkErHSEqeQnY23fvNBoQD8XoG1NxtG4r3YnCO0u3
	 r28sUd9i/COFg==
Date: Wed, 24 May 2023 10:48:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
	ckeepax@opensource.cirrus.com, kuninori.morimoto.gx@renesas.com,
	linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH 1/2] ASoC: codecs: wsa883x: do not set can_multi_write
 flag
Message-ID: <c24b2f1c-3b08-492f-954c-c4f10ae5ad81@sirena.org.uk>
References: <20230523154605.4284-1-srinivas.kandagatla@linaro.org>
 <00283665-e44f-457b-b2c9-1acf59d1cbd8@sirena.org.uk>
 <c37b88ae-7f54-3c07-666f-010a5fd84bd1@linaro.org>
 <d94e734c-e816-4b3f-9fb3-a6589063c05a@sirena.org.uk>
 <af7b7d4f-d7ab-b5ef-e639-9a8b13de54ee@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Z25BQUiQltUZUpg7"
Content-Disposition: inline
In-Reply-To: <af7b7d4f-d7ab-b5ef-e639-9a8b13de54ee@linaro.org>
X-Cookie: You will be divorced within a year.
Message-ID-Hash: JXRMNLJCAA7NHSWKODVL7PPA6DRUUTJC
X-Message-ID-Hash: JXRMNLJCAA7NHSWKODVL7PPA6DRUUTJC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JXRMNLJCAA7NHSWKODVL7PPA6DRUUTJC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--Z25BQUiQltUZUpg7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 24, 2023 at 10:42:21AM +0100, Srinivas Kandagatla wrote:
> On 24/05/2023 09:57, Mark Brown wrote:

> > I'm unclear, is this a limitation of the hardware or of the current
> > Soundwire code?

> Its both.

> Codec itself does not have any private write callback to support this and
> AFAIU Qualcomm Soundwire controller does not have any such hw facility to
> program multi-registers for device at one shot.

How about the *CODEC* hardware?

> Is write callback used for both Bulk writes and multi-writes?

Only multi-write at this point but we probably should consider redoing
bulk writes to use it as well.

> Is multi-write feature of regmap bus or device?

Well, I don't think any buses that understand registers have implemented
it yet but there's nothing fundamental that means that a bus couldn't
usefully do something with multi-write.  The current users all use raw
buses that don't know anything about registers or values.

--Z25BQUiQltUZUpg7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRt3XcACgkQJNaLcl1U
h9CdRgf+Nhy3duqWiV/9INno44wrOWxhqUR8tBBmnKtwdQwe1czT+kEXwFf8iJ4k
Yi6z8w3tWfDOXyW7cxhrgWqraV9oE7XMyhNK0NNx9qWR4gDWItAmxzriB67iIJnd
3wyVoz61coztitpVVkdEgI8mFqqeKluRkDxtYrWDPRSHguQtt3e+Pw+bTY8QvtvW
GDbPdrLrUSIl7ZUn/J6Rfbs6C3iuQ+6Mh8udyNIq8angXzBVT0Dyn9pKb5hjPusf
RN7PlaPjYDG00J8cg9QPhkfY9RWJs1S3JlaxBJ9lkTQx5gffEe4rPhBNkqXpAOVH
/40RVfp952NEWhOjy/LlgCwEZW68hA==
=9Wc1
-----END PGP SIGNATURE-----

--Z25BQUiQltUZUpg7--
