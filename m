Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFEC7418FF
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Jun 2023 21:41:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D2817F4;
	Wed, 28 Jun 2023 21:40:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D2817F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687981282;
	bh=klgTWdJWuY+ukpWOnYTdmCpH06zL7nTICvdJceCsqqQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GJU5fhPrXaWt0OyYx0n8VnSvj9/2OkplQ2wedx/J2TbIUljRS6P8rgtGfLyd5Hy7x
	 HddJFYsVGGSFUvLQC8qenVWsvE6dZc3LLXPOv9c798vXAPpjsnvo49uhp7x+0hK9F+
	 A8VNbMZbrv9jfnOuMLzPJTIOn5/YesXGFAKXeRIg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C921DF8027B; Wed, 28 Jun 2023 21:40:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 65861F80212;
	Wed, 28 Jun 2023 21:40:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6865BF80246; Wed, 28 Jun 2023 21:40:27 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 3D283F80124
	for <alsa-devel@alsa-project.org>; Wed, 28 Jun 2023 21:40:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D283F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=CylwdhIn
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3EAAE6144F;
	Wed, 28 Jun 2023 19:40:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54110C433C0;
	Wed, 28 Jun 2023 19:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687981220;
	bh=klgTWdJWuY+ukpWOnYTdmCpH06zL7nTICvdJceCsqqQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CylwdhInikX6hCGDUJn+nYbTRlGsBpp8Ur1zy7oz6vC3UiprJVxVbFkCZu74t2Jtu
	 ZiEy79TUuvXOOtW/Bfd3qpZLlyZFkU5s41sV/eC5HbLQ4zcrdDAc553OUbwklCuyRg
	 na5DZ7Re+mqsLV37CoA4VTFyrlL+fDLinK29qUx22ceiiKxmgtjSevvnmNaaTt033Z
	 IZ6IL22GqPzZqCgBJwJNQIkU5ToE4Sn5FwqVysax+mF/tePaX3LFWpfdteoqyMR4sL
	 CQh/pCdpvXIZy2UcIY+I6iVRPEcJ3LbQTaqJDECGNaFtJN9fzCErqCO1FIg8cNB48P
	 llGyLkXmA2NiA==
Date: Wed, 28 Jun 2023 20:40:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	krzysztof.kozlowski+dt@linaro.org, andersson@kernel.org,
	robh+dt@kernel.org, devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, johan+linaro@kernel.org,
	perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
	ckeepax@opensource.cirrus.com, kuninori.morimoto.gx@renesas.com,
	linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH 2/3] ASoC: qcom: q6apm: add support for reading firmware
 name from DT
Message-ID: <c5bbdaa9-43fb-4ec3-af7d-b1629d2d88f7@sirena.org.uk>
References: <20230628102621.15016-1-srinivas.kandagatla@linaro.org>
 <20230628102621.15016-3-srinivas.kandagatla@linaro.org>
 <f71c8d2b-d5f4-42bb-932f-5b9ec6117ffc@sirena.org.uk>
 <73dce263-bee6-554f-9eb6-af4aa7badab1@linaro.org>
 <c377aefe-2678-4ba7-96b3-2186e8f3f1b4@sirena.org.uk>
 <fabef33c-a8c7-af61-80b4-91e55081c977@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mgpSf2rFHH6HbzH9"
Content-Disposition: inline
In-Reply-To: <fabef33c-a8c7-af61-80b4-91e55081c977@linaro.org>
X-Cookie: HELLO, everybody, I'm a HUMAN!!
Message-ID-Hash: TVCBDUGNYSMZ6DCGF3C53QC7NDGOGPK3
X-Message-ID-Hash: TVCBDUGNYSMZ6DCGF3C53QC7NDGOGPK3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TVCBDUGNYSMZ6DCGF3C53QC7NDGOGPK3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--mgpSf2rFHH6HbzH9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 28, 2023 at 10:33:16PM +0300, Dmitry Baryshkov wrote:
> On 28/06/2023 21:10, Mark Brown wrote:

> > If the goal here is to put all the firmwares for a given board in a
> > single place surely it would be better to factor this all out of the
> > individual drivers so that they ask some helper for a directory to use
> > for firmware?  Adding these device specific firmware node properties
> > doesn't seem to follow.

> This quickly becomes overcomplicated. Some platforms use different firmware
> naming structure. Some firmware goes into a generic location and other files
> go into device-specific location. So having a generic helper doesn't really
> help.

That sounds like a job for symlinks surely?

--mgpSf2rFHH6HbzH9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmScjJwACgkQJNaLcl1U
h9BCDgf+MwHq6JhItt1dx5AosYopofv5eM+cXQTZJxH7Ty1pBE0ZrubrQITHgUps
ZMN5jdtiLpD1sam4qsyb1yNUB8o+4sk7p6Q6rKS/Bwv73R6lQwd04PS3+KW+12V/
Pg39ZUdB4XjjKgmKQ+LKBXZi2qkB4Vhd9ApqIMIEtNYXhRk68JVnhlUseenPfn6Y
+bay/mh1nmisb1hVYEhwlabisc2pRStjRhD4+MKBxEEdHPKyUtUciYCUasW4OCj6
mcptRKGax8OZWyWykw0htaHI19V+6QkTFvZDlNc7mwWBqQx+t7FxgsbpGR3Eo1L2
dnMNFETQ1pxu67LvWHYP5e6gRpok4Q==
=Nl3r
-----END PGP SIGNATURE-----

--mgpSf2rFHH6HbzH9--
