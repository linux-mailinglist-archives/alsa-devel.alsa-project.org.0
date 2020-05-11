Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C91AD1CD89C
	for <lists+alsa-devel@lfdr.de>; Mon, 11 May 2020 13:36:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F4479F6;
	Mon, 11 May 2020 13:35:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F4479F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589196963;
	bh=KEV36LAFT7EPsF4800b7VxgtNNFnbGHTmn062G+4gCQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mbew6yN48LO2ljuAVdXOiay7MdBtPmUT7sAYHw3/0oLckKyqAW66xpnpEyuSaRoVf
	 K5xDO3YI+brpwTfo+3ZX8VZNoiv+38XmTQF+Huc57MNGG/eXJ9LRIL6xhP/60SZ9Xv
	 VtMc1I8TlDXd9ftAZ4PRqDXVZXdppdNp0b66reQg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4950DF801F2;
	Mon, 11 May 2020 13:34:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18783F80157; Mon, 11 May 2020 13:34:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B59EF800B7
 for <alsa-devel@alsa-project.org>; Mon, 11 May 2020 13:34:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B59EF800B7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="NujG1ykN"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9D39C20708;
 Mon, 11 May 2020 11:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589196852;
 bh=KEV36LAFT7EPsF4800b7VxgtNNFnbGHTmn062G+4gCQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NujG1ykNW2StJuoJ2mL+LRSfw82oR1nEqqqlU6gjha92W1B3Rx5ncwt2IXuZCkhUI
 OEtDGCOtrGzjG3WH05nVEv8QEmhtmXgM0irahHl7wMWZi/zqMfobUBXneDAF0vh2gm
 iED+ZyhHqceqhpyvSz42NOfIwMAWKHRoAZn8d2jY=
Date: Mon, 11 May 2020 12:34:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Sia Jee Heng <jee.heng.sia@intel.com>
Subject: Re: [PATCH 4/4] dt-bindings: sound: Add documentation for KeemBay
 sound card and i2s
Message-ID: <20200511113409.GF8216@sirena.org.uk>
References: <1589166964-8985-1-git-send-email-jee.heng.sia@intel.com>
 <1589166964-8985-5-git-send-email-jee.heng.sia@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="cYtjc4pxslFTELvY"
Content-Disposition: inline
In-Reply-To: <1589166964-8985-5-git-send-email-jee.heng.sia@intel.com>
X-Cookie: TANSTAAFL
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: liam.r.girdwood@linux.intel.com, alsa-devel@alsa-project.org,
 tiwai@suse.com, pierre-louis.bossart@linux.intel.com
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


--cYtjc4pxslFTELvY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 11, 2020 at 11:16:04AM +0800, Sia Jee Heng wrote:

> +description: |
> + Intel KeemBay I2S
> +
> +properties:
> +  compatible:
> +    enum:
> +      - snps,designware-i2s

If this is the DesignWare I2S controller we already have a driver for
that with existing DT bindings, anything that needs to be added should
be added to that.  We can't have multiple sets of bindings for the same
device.

--cYtjc4pxslFTELvY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl65ODAACgkQJNaLcl1U
h9Bbzwf/cuLlWreKr7FjTiJJoNUPm2CejNYQgBgTM3e1MJSjflntAk8dAVoeqXjz
PGzfbjinV/OUIK0BFzAGSvYJ/3/veYNnBeY6kSdioGMa48c+o3AXTmOgksc2Zwds
kq2a170EtrZ+uE+PljwvHzwx0WckQDgiKHbgzZXdOpKoUUte/0sRS43N9ZGaEy4k
IF4sWUyTucuHqO3TujcSCgO5pgw5eGlT5/2dl/y4Fs/wPtO2+QcREJm2aJNsrViw
MxFQ8oP6ofBdXwpY6bbsmP0qbJ0NSHvmn9G4wePplMmhupKo7CVha7ArisjYh6JZ
j+RwLTW7SqsS2ab4kfJWX5QNlk5dBg==
=gMPQ
-----END PGP SIGNATURE-----

--cYtjc4pxslFTELvY--
