Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD21812E42
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Dec 2023 12:12:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CE72A4A;
	Thu, 14 Dec 2023 12:12:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CE72A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702552369;
	bh=TZ1vRXqDptocYRDVGwkp62YEwPxCdg9ggzn/jKJtTkM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Q5qjFxNAh3GqitH/0+SiBDzWDdX8TRQamj5ZbwBMPcgMDmUr8Wf9oD8KyeK9b9CIr
	 yUiY6GnKel0apXKXQ1Q9rkrB6tYHlf6wMOAgO+AF5aLQPCpPe/0ZKCY3d5sADvMay1
	 cw9suuwCFd42T5pNLcwQ1zWSae3f1GvTj4R1ZTBg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 522D5F80589; Thu, 14 Dec 2023 12:12:12 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6012AF80578;
	Thu, 14 Dec 2023 12:12:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53EDBF8016A; Thu, 14 Dec 2023 12:12:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DA285F80114
	for <alsa-devel@alsa-project.org>; Thu, 14 Dec 2023 12:12:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA285F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jCto4tIK
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D707861F60;
	Thu, 14 Dec 2023 11:12:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D6ACC433C8;
	Thu, 14 Dec 2023 11:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702552323;
	bh=TZ1vRXqDptocYRDVGwkp62YEwPxCdg9ggzn/jKJtTkM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jCto4tIKs4RHUeT5DSunbTCDcENsTdfoLFS4ipfkZ6kOsekcz2jCh3YVVbaIaiJ9Y
	 /ARs6Ymr1+vbllJvvtj7ZHfRhhCY9rw33GUV0xZshRhPkz+bpOU8JMjqne68o33oug
	 EcsD4YcX2EYyAqV0pMZKEbkWgwGyIrNfG2Yp7SX6p7SPD1cIHtxhnYA0pWPVrtxdv7
	 H29UX8mp+FwOlnh8A2Qx+Jv+EtSdCphfFPbjmSrB/wwo2C0RAHjBWObPK8niZg7fNe
	 t6036iKGMjpmcI3NYQ212rs6FdvPUwmufO0yMzbhNK8fTAZP6UaCDJXRcju80iEi8O
	 Dw5eDnNMowzgg==
Date: Thu, 14 Dec 2023 11:11:58 +0000
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com,
	brent.lu@intel.com
Subject: Re: [PATCH 2/2] ASoC: SOF: ipc4-topology: support NHLT device type
Message-ID: <337560f8-94e3-447e-825a-6a3d916fcf16@sirena.org.uk>
References: <20231127120657.19764-1-peter.ujfalusi@linux.intel.com>
 <20231127120657.19764-3-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8UjZ1pKW2iNdRUe1"
Content-Disposition: inline
In-Reply-To: <20231127120657.19764-3-peter.ujfalusi@linux.intel.com>
X-Cookie: Preserve the old, but know the new.
Message-ID-Hash: G67YJXZ4H6L46O7LZZUKEOOC7OXPIUPW
X-Message-ID-Hash: G67YJXZ4H6L46O7LZZUKEOOC7OXPIUPW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G67YJXZ4H6L46O7LZZUKEOOC7OXPIUPW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--8UjZ1pKW2iNdRUe1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 27, 2023 at 02:06:57PM +0200, Peter Ujfalusi wrote:
> From: Brent Lu <brent.lu@intel.com>
>=20
> The endpoint in NHLT table for a SSP port could have the device type
> NHLT_DEVICE_BT or NHLT_DEVICE_I2S. Use intel_nhlt_ssp_device_type()
> function to retrieve the device type before querying the endpoint
> blob to make sure we are always using correct device type parameter.

Acked-by: Mark Brown <broonie@kernel.org>

--8UjZ1pKW2iNdRUe1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmV64v0ACgkQJNaLcl1U
h9DO1Qf+N+1u2arL1wwjXJMSutWkreFnWV4qGzay46WqEXsYk9m+NvqBfKIp9Qpa
ZktGdZoz9hzMRLbATzqBYME6YosPniWO/p04r2eeYSI0x8wO67LGVT13dnciW1eR
9Dk8F7Jk2rKfj1Or5y0yOej7CMgWXH+6T6zUmlOdzAHJTu9sENaTZlSlSDbscyIw
Ft/3ClozxWeKWo27yTLTHA2+ofuQCTc9pxbj4GCT/UvYpVxIDnH+tvY4roCQ1hak
cDk/VG+FWIrlfFdMiREh1aDEm2F99m/PZQ6ZvsKgJEfoX2Bc7P5snSWEP+0SOXdx
gnfwbTOPPCLxOmpVThFNIgHzcC9Vgg==
=07ia
-----END PGP SIGNATURE-----

--8UjZ1pKW2iNdRUe1--
