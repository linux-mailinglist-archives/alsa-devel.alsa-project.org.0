Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC05F1B7899
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Apr 2020 16:54:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88C8116C3;
	Fri, 24 Apr 2020 16:53:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88C8116C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587740068;
	bh=C9S/zLSMQlhIsaNZgKtD1+SlF05SJSxtBKA8za8taag=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JOfyxNHsW4bm9HtTxQ4mS7KulTCE+c3X9w+911scbkq0uc67aupoHJNUsLeQjm7gq
	 li1SbQVRt/iKfy+kyE9JHq7tkK6XQNQhHwQ3pCXIqcZWgedbKBU7i5lD3kyYI0gcqY
	 e+ccNFWJEv6FiuCWMJ0TGHqsiFBggm/v0NS6J6uo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83FB9F800BE;
	Fri, 24 Apr 2020 16:52:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55858F800BE; Fri, 24 Apr 2020 16:52:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D00A0F800BE
 for <alsa-devel@alsa-project.org>; Fri, 24 Apr 2020 16:52:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D00A0F800BE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="k7GmyWx3"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 332D82071E;
 Fri, 24 Apr 2020 14:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587739959;
 bh=C9S/zLSMQlhIsaNZgKtD1+SlF05SJSxtBKA8za8taag=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=k7GmyWx3aFa89wTykNFxjV1/omli7MQELf0vnCDVQcFJJa3NSKunuJ6+/J3NXF/85
 YJi2s7NK84MdytJ6NU+M5rgkmcEIn97w6WoIpL8yUGJAtj0ztwtzJFqTNnDF++rw6s
 1gnkgvqKoV+46XCoC0iB02iJKVkSggwi8TsYC2SM=
Date: Fri, 24 Apr 2020 15:52:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Mateusz Gorski <mateusz.gorski@linux.intel.com>
Subject: Re: [PATCH v4 0/3] Add support for different DMIC configurations
Message-ID: <20200424145236.GG5850@sirena.org.uk>
References: <20200424132002.3850-1-mateusz.gorski@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="4ndw/alBWmZEhfcZ"
Content-Disposition: inline
In-Reply-To: <20200424132002.3850-1-mateusz.gorski@linux.intel.com>
X-Cookie: Information is the inverse of entropy.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: cezary.rojewski@intel.com, alsa-devel@alsa-project.org, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com
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


--4ndw/alBWmZEhfcZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 24, 2020 at 03:19:59PM +0200, Mateusz Gorski wrote:
> Set of patches to enable DMIC capture on different hardware
> configurations.

Neither this posting nor the last posting seem to have managed to send
me a copy of patch 2.

--4ndw/alBWmZEhfcZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6i/TQACgkQJNaLcl1U
h9DbAQf+PrQwbFqc6ReWIHVPVp75axMCKo32CbCREXb+nXkt8EO9IstEkOkGDCHJ
7kcIXmxbNhib9Gee0yRVsj+KWRnQO6Z5TQK9KfgxaLDXtVblCcKW8lvgrq6+UotJ
BnnVPuaF2uWO9LQiUt5/ub4CdtjkQ9j+DztfCiEZ0uUVsrU3lIpgOv9wZ3e+BsIV
yMcj2MnYBa7+i2EuP8o0Urpdrx6q9nYAb8OCUAScetXpG4Ng+LDIuIi0javZ/dya
upXcf+O1NI8vEnufNLLN9PSax1b3Wc8FW3ypQdxW9UkwlOVi/YLIcSJqGrkDCyWo
U+xba5at76jPXNau7UFtlodySWuA7g==
=QYTz
-----END PGP SIGNATURE-----

--4ndw/alBWmZEhfcZ--
