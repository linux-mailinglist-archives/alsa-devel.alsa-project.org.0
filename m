Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C9F275DA7
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Sep 2020 18:39:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C550175D;
	Wed, 23 Sep 2020 18:38:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C550175D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600879188;
	bh=FiyYNIydlw3wxJqyUMyIQHWWUDAPi9BauKJqiFoVNRU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uHIwSkWXakB4gHqKDfMKtLIs+t3UvBZgq0+9USBzxU63fcwOh2T0dxMok7yM+Q27A
	 PPafr4I9VfrZCV/dsLa7NJmJuRthd8LOuz3mAdTDiEy4gFLhUgDww9VjK2OkF9wVw3
	 qcq4KuTfW1w/NlxLe/SdkxOv1WArEis3yqGl+DrI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B53D1F800B4;
	Wed, 23 Sep 2020 18:38:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4807FF80171; Wed, 23 Sep 2020 18:38:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44C7FF800B4
 for <alsa-devel@alsa-project.org>; Wed, 23 Sep 2020 18:37:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44C7FF800B4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TQr6ZN7W"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A5F2120791;
 Wed, 23 Sep 2020 16:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600879072;
 bh=FiyYNIydlw3wxJqyUMyIQHWWUDAPi9BauKJqiFoVNRU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TQr6ZN7Wwd8TeXFpLCmmJSRYGrNtpOpIMyRkSBv6DYyhHjrMDWvsHrPV15tpaLimH
 ttMBVNRTz8hDL4N9YqUgmzTI8uax0wGvdUgINZU9tbROrvP5hVa8oavSxgc53GRCcB
 SPYRwOJyqhT01RibJFHLniiCJtTXYLxzSOpCP8WU=
Date: Wed, 23 Sep 2020 17:36:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH 1/6] ASOC: Intel: sof_sdw: restore playback functionality
 with max98373 amps
Message-ID: <20200923163657.GA46671@sirena.org.uk>
References: <20200923080514.3242858-1-kai.vehmanen@linux.intel.com>
 <20200923080514.3242858-2-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="FL5UXtIhxfXey3p5"
Content-Disposition: inline
In-Reply-To: <20200923080514.3242858-2-kai.vehmanen@linux.intel.com>
X-Cookie: A king's castle is his home.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 Keyon Jie <yang.jie@linux.intel.com>, pierre-louis.bossart@linux.intel.com,
 Rander Wang <rander.wang@intel.com>, ranjani.sridharan@linux.intel.com,
 daniel.baluta@nxp.com
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


--FL5UXtIhxfXey3p5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 23, 2020 at 11:05:09AM +0300, Kai Vehmanen wrote:

> Fixes: 7eec07f389a60 ('ASOC: Intel: sof_sdw: add dailink .trigger callback')
> Fixes: 5595f95c32650 ('ASOC: Intel: sof_sdw: add dailink .prepare and .hw_free callback').

I don't seem to have either of these commits, I think you meant
ae3a3918edf57b and 06998d49bcac8a9 respectively?

--FL5UXtIhxfXey3p5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9reagACgkQJNaLcl1U
h9DffAf9G1K2A0Yhpixo7RjKRdFbTdGzC5Q0mugRhc0JOEhu8Ovbx6lf8zXSaCST
pKUdnvb4C6BmQoEpkMWBZwwJlp32xtguo/iXxCNtMitjaDaObSKqDiTRkdIyaacX
rlhQC6JKW4mMqUFnlgrTBxu0pLfHL9xhVorowAW69ZsH8gyq5sh2720QRVQInCmN
CFcTQFZhIrJJA50WNxfrzChhrjh1mFO5nvVqRLXAsmuPbagBqt54rQhaLIdsIoEw
slGQEXD7DxcNvcI1elJL3quG/NZWO6wpfyNdoq7X8HRCOt+H3SwRLXRVVOr348YL
8K0rze9bXfJX/mDOpPKMUker840VXA==
=iw2N
-----END PGP SIGNATURE-----

--FL5UXtIhxfXey3p5--
