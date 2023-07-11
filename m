Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A2974F42A
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jul 2023 17:59:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2AD53E9A;
	Tue, 11 Jul 2023 17:58:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2AD53E9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689091169;
	bh=7ZyyZ+HNOyEHI8v32fmj/vgPfWXG3mAXzwQ3E7RgbdM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lma7/sb2FRqjoAVNwc0RQtjOAfNdu+pNGsX8wuXXBxK0D4hMHeSINRoEZvMS56MbY
	 pXiA1YxqkSmetu9hykieGmq+xH9vFnvMT04hxNPFM2fF6r9bd8YteMH7QS0Mm5j6qz
	 xzhXCx5iw0zogldjUHf3iLp8zpPIOp1cL/5NnCqI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78637F8047D; Tue, 11 Jul 2023 17:58:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F08C6F80236;
	Tue, 11 Jul 2023 17:58:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 90DADF80249; Tue, 11 Jul 2023 17:58:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 45969F80153
	for <alsa-devel@alsa-project.org>; Tue, 11 Jul 2023 17:58:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45969F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=RmVAgD6g
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BE0EA614F8;
	Tue, 11 Jul 2023 15:58:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB401C433C8;
	Tue, 11 Jul 2023 15:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689091107;
	bh=7ZyyZ+HNOyEHI8v32fmj/vgPfWXG3mAXzwQ3E7RgbdM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RmVAgD6gKUakQGIrMNlss3vwYPnWy+eopA3xDIAATo2eZqd3m1EIcSKGYnArYY/FM
	 yCFDIhsfoIJMmOl5HinJTOM0vLclfnaxRWXtos7P5SGI/wvRfxJkf3+sYymET4CFvr
	 bz4V/Xepd0Mklqq5yMjy+NCnnoPDqiCceiH5LZ7DOnEp3qFY9C2jAL73xlYvXkfV/x
	 aJXkG3H5dB5rdSPLu5LhyN7x3ksKtVLPgnVsug5qPZmxZGiTQtsY8Vnrohm3HfRKyX
	 3Z8qt9j2ozptJr1sKYbs6g/9//rZWG+3wzmZLpmNWwnmixThnDj7VDxZMhYsh8spQT
	 6wQXlCYc42Q6A==
Date: Tue, 11 Jul 2023 16:58:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 00/13] PCI: Define Intel PCI IDs and use them in drivers
Message-ID: <a0625422-9b1f-468f-a282-71290a159bda@sirena.org.uk>
References: <20230711125726.3509391-1-amadeuszx.slawinski@linux.intel.com>
 <bc2484ba-3bb2-7d74-fcd1-55c9ec253b9c@linux.intel.com>
 <46d612f4-24a4-4493-aa9f-0ace5225a38b@sirena.org.uk>
 <87jzv6h2ui.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hidcHY8UvSTgc8PO"
Content-Disposition: inline
In-Reply-To: <87jzv6h2ui.wl-tiwai@suse.de>
X-Cookie: marriage, n.:
Message-ID-Hash: C6FGJKMES6OKD5HXVROJORP5LBL5F6HW
X-Message-ID-Hash: C6FGJKMES6OKD5HXVROJORP5LBL5F6HW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C6FGJKMES6OKD5HXVROJORP5LBL5F6HW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--hidcHY8UvSTgc8PO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 11, 2023 at 05:42:13PM +0200, Takashi Iwai wrote:

> I can do it if both Bjorn and Mark agree (after all patches get
> reviewed and no objection comes up).

Fine by me, I acked on the basis that it probably makes more sense in
someone else's tree.

--hidcHY8UvSTgc8PO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmStfB0ACgkQJNaLcl1U
h9BDwgf9FjGinq0r7SNgU7oSMxseTqJ+zHDQWJiDbeBxmWjolKQjDP7TRc07bYqS
qig9TsVEDjJR37T4+DPcJ/C2WXkM8y1Q0XciErCQu2Oh3nRiGj+xsIihqn5TBghj
k+lbwY/WZHTHdkeTUfy1RW+LdLlYQ63kHTChZIMw75iWTn9LG4ih0efiQ/NaZEBL
8a6DhGQgn+9ed8rl0yloh77a2j63JUjFTZ+inGGgGUHuVE51XrFEm6UBQbsbWPiU
SeZ5NDoRmem+0ZgUbMMLlkEuUUXFv8tmfN39t9/b3h4w2WNZ4fd5uAoHmQldaChB
YRPg6NVf4Rs/JlhP8P1I/QXfFMt1Tw==
=ikb8
-----END PGP SIGNATURE-----

--hidcHY8UvSTgc8PO--
