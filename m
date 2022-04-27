Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACF4511BDB
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Apr 2022 17:25:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F345616D6;
	Wed, 27 Apr 2022 17:24:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F345616D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651073141;
	bh=JlPHMZjtz41n9jQFrgK3+bd+ZcmQpyjMl/Qk9pCRLtw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YDlqL9MBkZrTltkXjwEur9ACKn9BRCyhLFXdVOsjO+2Plisr5QRWdmBK1xvKEd0WS
	 tPZtswqLhqeUSuwKavTutlyekQVS74kcLI4ATmYR7AgBaJse3tnaTCp8Ru9AwO/lBU
	 9ReacYex83/v9Q8RN51hsAgEYzypU8WoKW0K6iNo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 54C48F80253;
	Wed, 27 Apr 2022 17:24:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7C31F8016E; Wed, 27 Apr 2022 17:24:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4381FF800AE
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 17:24:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4381FF800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="G6cdi3mV"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E8E806119C;
 Wed, 27 Apr 2022 15:24:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4287C385A9;
 Wed, 27 Apr 2022 15:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651073076;
 bh=JlPHMZjtz41n9jQFrgK3+bd+ZcmQpyjMl/Qk9pCRLtw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G6cdi3mV8Wm7lwMwZlMJhJyM6oiN1wulMwe7jiMaUq8uDGRwAITcPJLnd/sEmoxhr
 LkUl+DAILm7hRI0sIqGwt7Okr+B66+2SHF9sHFCkK0LwFbblmrOKrMMpL4bVQYDDTA
 V2KRIDTzz+2V4OLuxMkL8FZAME5HHj+fq0RhPx50K/ryV6V5a3t+mVxk2jlNI/MLeZ
 G0wCmpwVYwCEmNyhY8PU6FeJzKVIbBpp1LRFdvRFZX7kE0SBYTM6reZ/khAN3OKks3
 EZGiXwlE6ZIuIvNUR7dqrdsATOi8BfL3YkfEipv/NR4xczvN8I64ZDIiTuET4Jo3Y8
 HAxZ+5RQj9wOQ==
Date: Wed, 27 Apr 2022 16:24:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: WM8962 crashing on suspend
Message-ID: <YmlgL+Ur6BeWiUtr@sirena.org.uk>
References: <CAHCN7xJuAuGmSQsmBfg-C6jOdJmf1Li=YWp7Jdi29nU3kk1GcA@mail.gmail.com>
 <20220426174150.GZ38351@ediswmail.ad.cirrus.com>
 <CAHCN7xLqixKxM_L7P9T2BqLpyHoGTYpMODKJotCneXZK+wUEMg@mail.gmail.com>
 <20220427145730.GE38351@ediswmail.ad.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="p1Fdl8n0WgrD8w9s"
Content-Disposition: inline
In-Reply-To: <20220427145730.GE38351@ediswmail.ad.cirrus.com>
X-Cookie: Buckle up!
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Adam Ford <aford173@gmail.com>
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


--p1Fdl8n0WgrD8w9s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 27, 2022 at 02:57:30PM +0000, Charles Keepax wrote:
> On Wed, Apr 27, 2022 at 08:12:56AM -0500, Adam Ford wrote:

> > static const struct dev_pm_ops wm8962_pm = {
> > + SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
> > SET_RUNTIME_PM_OPS(wm8962_runtime_suspend, wm8962_runtime_resume, NULL)
> > };

> > I applied this, and it appears to make the issue go away on a 5.15
> > kernel.  I haven't tried it on a 5.18 yet.  If this fixes the issue,
> > would that be an acceptable solution to push upstream?

> Feels like those operations should be runtime PM, like there is
> no reason to keep the CODEC in a high power state than necessary.

The issue Adam reported was suspending during playback - if you suspend
during playback or capture the device is not idle at the point where we
start trying to suspend so it shouldn't be in runtime suspend and won't
by default be runtime suspended by the PM core.

--p1Fdl8n0WgrD8w9s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJpYC4ACgkQJNaLcl1U
h9DpZAf/YusXgpjpzUXMZissqpoREXI0H8AwYtfEQSiRGiXunq8LiypyC9YpKXhD
B16WNV3+HqQ5ZmC2M1ojVdmBBsQvKwFEDlqzPJTZ6O/0IuNsjtcBerSXrLQXSrTN
2v6AlqqHLHEiLRtY4LkGtkiNsatBcsnG8rvA8S/aKjBnRVMV8qzK/kRjUWMosTnW
DOY27vdFcGtPJQsUDVOHBHg+6bGKtsAARRT3B5zoo233iANkyxkKehx8B9DZ5sg+
cMSX3a4PGyOv4m5ZJWBNkOqRtzThnyb3k2EcDEc6o2zWuF9uRPebgRZgyGtO2zD4
Wh737VW9OEdyzKhU+6rOORXf5EibNA==
=16bs
-----END PGP SIGNATURE-----

--p1Fdl8n0WgrD8w9s--
