Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEF570E285
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 18:59:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C364F208;
	Tue, 23 May 2023 18:58:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C364F208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684861145;
	bh=ZOgRWSUZeAQRQ5r1OvrZ23h8E9WcL1BECJs8FsCwu4Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eyNS/L4T6BeCzUtXJMPHCzI852aI95P5K/b4mk1fumqAAJloMN2iEJc9GqBMQ1qjt
	 HcYTFaLL6tB8d4UyOOSzvTwun88zvMuTMWgOJXDEPGPmXFCJ4JyCX9G4H4sWO0qu0M
	 DS5gVh5TnF6XSQdcNUnwFe+aug/uhJdVeyOGoVBg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 438FCF80086; Tue, 23 May 2023 18:58:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B34FAF80249;
	Tue, 23 May 2023 18:58:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 408F5F8024E; Tue, 23 May 2023 18:58:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B2701F8016A
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 18:58:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2701F8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=OkVDIoD4
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 82E8D634A1;
	Tue, 23 May 2023 16:58:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D0C8C433EF;
	Tue, 23 May 2023 16:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684861087;
	bh=ZOgRWSUZeAQRQ5r1OvrZ23h8E9WcL1BECJs8FsCwu4Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OkVDIoD4tEZoLdZ/xUfE9c+NUefU1OXooZ6auYkikWy6kMyqxJ0YfM/3oeOMdICLB
	 N71Z05lVrelwQcnV0tTYQNrwylc8R3oER3PixagiICfpxB8wRdfD2ZHT05b+DjqGTg
	 WRq1Ldi65dSA5GhYYuXKGrUavb62X9tFFTy6tjgo0H4RoLGCKTnNpP1+DKw0UbiPbp
	 l9FrvjrSCFXD+xAi/+SerSyMRUiL6yhHtzsopL4zFam/qUaoeYVLbqgwq1bM+Z/4/S
	 zckmWsg0rZxyhB16hRhBE6U3QlOhxEyw3lVQ0KNJu5TjEmAaUTkDfKyccFwvMAfuyp
	 15JnQwxRWAYgw==
Date: Tue, 23 May 2023 17:58:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org,
	ckeepax@opensource.cirrus.com, tanureal@opensource.cirrus.com,
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH] regmap: sdw: check for invalid multi-register writes
 config
Message-ID: <dd2d2484-13f9-4fa6-85d2-5a540f137b3a@sirena.org.uk>
References: <20230523154747.5429-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KttESI1M0xs/s7UC"
Content-Disposition: inline
In-Reply-To: <20230523154747.5429-1-srinivas.kandagatla@linaro.org>
X-Cookie: Beware of low-flying butterflies.
Message-ID-Hash: AVSEFNFNKQ3OIBKFGC52XZMCAQZE7S3K
X-Message-ID-Hash: AVSEFNFNKQ3OIBKFGC52XZMCAQZE7S3K
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AVSEFNFNKQ3OIBKFGC52XZMCAQZE7S3K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--KttESI1M0xs/s7UC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 23, 2023 at 04:47:47PM +0100, Srinivas Kandagatla wrote:

> +	/* Only bulk writes are supported not multi-register writes */
> +	if (config->can_multi_write)
> +		return -ENOTSUPP;
> +

This doesn't seem like the right fix - I'd expect us to simply choose
not to use multiple writes, with an additional flag/check for bus
support.

--KttESI1M0xs/s7UC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRs8JkACgkQJNaLcl1U
h9BO1Qf/SF8Vg2vHrhREne+0bKejDxWWk5D1YXA1nuKMm6xnfjwxmxE0E4nsuZmC
2H94Qqjuyv2OFRrF8zvY5zczDzfbSiVbmCA3D8udwnFSz+QjbnPluIMPQOOa3pPi
44OIgVJWruEu1ofWtlv0YzCmWaEkkd0EMcQQo0A2i2MFDSeqYKhsnskOPKyDQR7g
I2JszY5qdCiH1FMyHEbJKHutlAm14xf5NfWClIxxkp7n85mmsbu7AtXskC8MdCQw
xN6FaRL6JCEO60zdl/ahFHEYyPdTcdtMHEogKFdI9uM9GOwB3qyf3lDnd97dBXR+
ychovc+cRMUbDRKjYTeNDasKMVOgeg==
=daRG
-----END PGP SIGNATURE-----

--KttESI1M0xs/s7UC--
