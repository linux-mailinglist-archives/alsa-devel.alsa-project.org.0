Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE665942CC
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Aug 2022 00:16:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F80E15F2;
	Tue, 16 Aug 2022 00:15:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F80E15F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660601788;
	bh=smt8+V+UWQJvE9FdyFv1zy4gk5r1BUwiMSoCZ4hBVjU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=otx9qQxca+PBe6ZtafJjqfIpsdrz7HZ9VigiAddxmlvcVsJ1TCw6Cq1axzLvl5H3U
	 HLxoiGIwH0Wxt19oupiQO+e3wucxKKXBQTl2D1YFJxOeNXA5RO2JFU1SIb/oiqbyhL
	 PA+5RclY3/tulf5E9DVThsAqlCCunJEXV7Q7vgG8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FEEDF80095;
	Tue, 16 Aug 2022 00:15:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 586CAF804AE; Tue, 16 Aug 2022 00:15:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0FC3AF80095
 for <alsa-devel@alsa-project.org>; Tue, 16 Aug 2022 00:15:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FC3AF80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="a63vsign"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 92D4460FDA;
 Mon, 15 Aug 2022 22:15:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16201C433D6;
 Mon, 15 Aug 2022 22:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660601717;
 bh=smt8+V+UWQJvE9FdyFv1zy4gk5r1BUwiMSoCZ4hBVjU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a63vsignmGFTeXya19UCflc82YfEnrVRPUgzHTFE7GWju9yj2OMtqTrgIMhXzugeJ
 ICM67FZ4DD+V48UIujwhPO5EcLfiA42xyctj4R+DptILJkIDce2zvDvuE0J0q4VClA
 UlsHGJhot9oPnFKLXWnN5+4UuI5kjUi/oaNNylQcg3/ugjUNOqTtVysnQ+sN6zMmdY
 AU9tLU8NqSqx1IPngwlBtD38ByauskdYtEa4auekQ6N+xbeVnNcSH5yxeiFYYqTyG+
 LVMnzQ9Ig9m+TjZHoRjZLFYIJ2amFQ/SQjiHPwLt2Wsc+JsW9SIVRBeiaxH99d0882
 jq3RgUEZWUdVA==
Date: Mon, 15 Aug 2022 23:15:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH v2 3/6] ASoC: Intel: Drop hdac_ext usage for codec device
 creation
Message-ID: <YvrFcIpKsDp6VLoQ@sirena.org.uk>
References: <20220815174227.3071323-1-cezary.rojewski@intel.com>
 <20220815174227.3071323-4-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Wb0YEZLy0/MmeUwI"
Content-Disposition: inline
In-Reply-To: <20220815174227.3071323-4-cezary.rojewski@intel.com>
X-Cookie: We have ears, earther...FOUR OF THEM!
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
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


--Wb0YEZLy0/MmeUwI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 15, 2022 at 07:42:24PM +0200, Cezary Rojewski wrote:
> To make snd_hda_codec_device_init() the only constructor for struct
> hda_codec instances remaining tasks are:

Acked-by: Mark Brown <broonie@kernel.org>

--Wb0YEZLy0/MmeUwI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmL6xXAACgkQJNaLcl1U
h9Dfcwf+PVZYoULzaMUfY4znzaPa2nDXdp+7qtUrXgNGUccDkHurmhhDvF1QBOuy
nf2KTVHkh9Wt7Fm3otSskLqWD0ZHdRfMJ8qledoTlCRk8c8l1aJlqHnz2wz+TUbf
lvcmvfiUXbH/vgicji8tacxKhY3bhmN70M55SLhWyC3dP+KOfUi+MAW6iI3FO3Es
kCcVvzeVTat1pYCO+UlhoNO20uxh/eiNEq8gvLBvAeTfbz7cNVPsl7SvRusWG73S
GxX48zEMpJZd+hzj3zN80bP3+JOXcKdjtPbOX82SszCTHo99WwCcDUyucGFR+fEt
lvi18UQ+MSiLVURn5qelSl70vTKfJg==
=8sSn
-----END PGP SIGNATURE-----

--Wb0YEZLy0/MmeUwI--
