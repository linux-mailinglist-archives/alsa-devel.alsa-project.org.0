Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C33A26FE94
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Sep 2020 15:34:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE3D616DA;
	Fri, 18 Sep 2020 15:33:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE3D616DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600436087;
	bh=7hSwap25GA/Oqj6EwHSwuf9ZnYrwESdX+SdscU52A/E=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kudXAaAmc0JaKAI4sG3vKIDSzp9y9f3Tf3pM6xXkNWlBCxjPEmJ87v9Rtx16Vtr90
	 FW1LulnJiPOGBKsgLk8p100yfgkCfVBsAN/IsytS5xmMc1mRDyKggiG71nRqJkDm8R
	 XE+yNkv2E+b6CZiLS3JyLITmb2FFgmahY36t2EQc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B119FF8012D;
	Fri, 18 Sep 2020 15:33:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D53CF8015A; Fri, 18 Sep 2020 15:33:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55CE0F8012D
 for <alsa-devel@alsa-project.org>; Fri, 18 Sep 2020 15:32:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55CE0F8012D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="vYYfC+ob"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 48A2F206DB;
 Fri, 18 Sep 2020 13:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600435972;
 bh=7hSwap25GA/Oqj6EwHSwuf9ZnYrwESdX+SdscU52A/E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vYYfC+obikaqOheGC8najvfwzxvdJlg83XySo0o42UNQCvEiTknnak9ifvGjFH213
 5Cj60G9Oqb01lt0SVOdj9Oq2JEOD/we6NIhMI2/IoWAGDpFKzq6L6AhFuhP+ejlLo/
 Av1PuCER2V9qQ3umUUe2CkfWJl7d0vvBVrtgsGUc=
Date: Fri, 18 Sep 2020 14:32:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Necip Fazil Yildiran <fazilyildiran@gmail.com>
Subject: Re: [PATCH] ASoC: fix kconfig dependency warnings for SND_SOC_WM8731
Message-ID: <20200918133202.GH5703@sirena.org.uk>
References: <20200918131257.5860-1-fazilyildiran@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="AqCDj3hiknadvR6t"
Content-Disposition: inline
In-Reply-To: <20200918131257.5860-1-fazilyildiran@gmail.com>
X-Cookie: Beware of geeks bearing graft.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: paul@pgazz.com, alsa-devel@alsa-project.org, jeho@cs.utexas.edu,
 linux-kernel@vger.kernel.org
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


--AqCDj3hiknadvR6t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 18, 2020 at 04:12:58PM +0300, Necip Fazil Yildiran wrote:
> SND_SOC_WM8731 was made visible and dependent on other symbols with commit
> 1291e14175e6 ("ASoC: codecs: Make OF supported CODECs visible in Kconfig").
> To this respect, the symbols selecting SND_SOC_WM8731 turned out to be
> overlooking its dependencies.

> Switch reverse dependencies on SND_SOC_WM8731 to normal dependencies.

No, this is very user hostile - users shouldn't have to know exactly
which chips a given machine driver needs to figure out how to get the
config option visible.  Please fix the selects in the machine driver
instead.

--AqCDj3hiknadvR6t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9kttEACgkQJNaLcl1U
h9CkYAf9Ej630ZUjUIRfV2vJy5PY4LKnfppP92Ok6d+55eRBEh96EpC32AtBpzjw
J8fpK7kY+iamF25PKb0SJ/VZmMn9VleExTrT8v36f31FQIrcHpK0kmut8gdyI2oO
RccdBojyI5NQMpkj8rW7DFuPhj9d+lLemlToyRrCFyA8zBv8wyJKGiVzuZ3yPqLH
QZgwULLoeFpTH5nLmZw/MP3RBrOYJ95iFvcTGwKjY9PjmtEHnXtHj58RpThTqYEU
XS9qyLfH66TqHXrs0JKBgGu8GcDsvVtU6Zgc4qDSHzY8teYA+9nzntFDEQpDo34a
9+KfrurcST827/JyTd/SyWNVJoJjvQ==
=WAW4
-----END PGP SIGNATURE-----

--AqCDj3hiknadvR6t--
