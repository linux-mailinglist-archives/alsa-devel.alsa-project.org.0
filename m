Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5695EBFBA
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Sep 2022 12:28:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5ADF11E4;
	Tue, 27 Sep 2022 12:27:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5ADF11E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664274498;
	bh=sHy1niP5mWeKiI5hNQSfEcl+Pb8zcROHMZX9U2cp76M=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lBjjJGDYL/RibKEem9BHQKTRbw6QKPUj6IPfIP3Z6DcTYIhVHIaW2IqAhVw9tnLHA
	 zBkncIrwaXbzzHI4YfRq0CQ1p/Sf2ShXikIpb3FlvvPJrXJUGWq6NLfwnIJugEzoCs
	 O+6PHtU4jWGJOpdlI4MeS8uETbqy8Nkc9Cyz4CGE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DAE5F8011C;
	Tue, 27 Sep 2022 12:27:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9EDDAF8025E; Tue, 27 Sep 2022 12:27:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F6D4F80166
 for <alsa-devel@alsa-project.org>; Tue, 27 Sep 2022 12:27:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F6D4F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="R3zWl5Vf"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DB7C961651;
 Tue, 27 Sep 2022 10:27:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ADC0C433C1;
 Tue, 27 Sep 2022 10:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664274434;
 bh=sHy1niP5mWeKiI5hNQSfEcl+Pb8zcROHMZX9U2cp76M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R3zWl5Vfxe0vj+iHX9oOS9CyMVJ7LMndKtydoCsHhDU8xfxypu6brL/DRMyHxlSMT
 Wt86tC/HeRhQ1mfSr9sgh7fsNgbmOS1l25QJqAZevCgkzhVfbLmINXV/vobpzAKZX1
 tGaHvQE+V4/+uj/gHN5NtPO9XxwqE9QUvx0bfdr0ThL27rA486CjcAfGEAOdwo7ZuG
 Mh6imPq0S6ODt8nORXZe2Nk+2nxEY2DKTqsJ4yjU76b1auGq4HSbiBfa0nux5EJkub
 hbiarybQFAjh+ljV3MFojhdRXun0f/G9MFqkg4h+KKJuB5ni/TjocDzmnfdX2lXU0b
 QClUcrNnphbmQ==
Date: Tue, 27 Sep 2022 11:27:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH][next] ASoC: SOF: control.h: Replace zero-length array
 with DECLARE_FLEX_ARRAY() helper
Message-ID: <YzLP+wH5UjKmkgEJ@sirena.org.uk>
References: <YzIcZ11k8RiQtS2T@work> <YzIj6tdtDe9YrX+I@sirena.org.uk>
 <81af0106-a732-ce45-bb1c-c45db9e1aeb9@embeddedor.com>
 <YzIqNqhTIuaWZrOl@sirena.org.uk> <202209262009.D1377D0C3@keescook>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="W1mEP/YeLmI8MbXS"
Content-Disposition: inline
In-Reply-To: <202209262009.D1377D0C3@keescook>
X-Cookie: Vote anarchist.
Cc: alsa-devel@alsa-project.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-hardening@vger.kernel.org
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


--W1mEP/YeLmI8MbXS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 26, 2022 at 08:16:16PM -0700, Kees Cook wrote:

> Seems like it's worth getting the MAINTAINERS regex updated? Is this
> right?

Yes, looks about right.

--W1mEP/YeLmI8MbXS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMyz/oACgkQJNaLcl1U
h9Cofgf/c1psLUiMDxR0MRIUMEeS+1ev/8ITyrbroJ1mCXJul5ZSsVuZaluhhXNb
rpHnfwWgZwYvzXeCuOI/MQ2gzZHBYkcKUhrn+dbeomhRtSmHSA7G0Xb3zdEc7xhL
fevVzsb5rXXiNVO4xVZ+IBSy3I8sN4sip6BXTrAOE9Ltk4uuPdqPncRh0uucnDI7
3R46mIU9xk6mRkWMH8ugJ4qZPpaLk32mkfr/qb0ztj1HlBC+F1PQPCdLuHtjW4VX
j99wXosQMvqOfAbxo8UpmX/IfIUWBk9i0HEV5/+xV24uSNI/bgR8hBRAlb/SjiMH
mvB6kGk6wuKa+FCm9d0tAhLV60tShA==
=ie0Q
-----END PGP SIGNATURE-----

--W1mEP/YeLmI8MbXS--
