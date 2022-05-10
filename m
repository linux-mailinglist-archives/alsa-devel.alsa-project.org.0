Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CAE521363
	for <lists+alsa-devel@lfdr.de>; Tue, 10 May 2022 13:15:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F35817F6;
	Tue, 10 May 2022 13:14:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F35817F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652181336;
	bh=1lnw92tFFloxyz+SRQlzXfqNdO+aQowWyIOa52kNAoo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aDPa5rFY434t+YS6258GflqkdVViqiFrvN732Tg+HRcuvBBsreTDWs6F1WaFYPOEg
	 v581srWskX0ExiGLejr3A8IFMzzu0URvkJ2NVc3FNLCLFyvDCLsgSP4EsIP+2vpYGc
	 SgPe+vpatyBqN8Jb0u44UWMb85x0h5yhCTcahEPc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F8E9F80510;
	Tue, 10 May 2022 13:14:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21089F804BB; Tue, 10 May 2022 13:14:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9EEDF8011C
 for <alsa-devel@alsa-project.org>; Tue, 10 May 2022 13:13:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9EEDF8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Pl5hgu98"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CFEBBB81B16;
 Tue, 10 May 2022 11:13:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AC27C385C2;
 Tue, 10 May 2022 11:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652181234;
 bh=1lnw92tFFloxyz+SRQlzXfqNdO+aQowWyIOa52kNAoo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Pl5hgu98j7yQeST24Yw4a4Bnxroe3JtiVCx0s5ijY3lMBTK3zMSbd14egmddDqkWz
 pe6fbHPnicg0Nq2GGjXrz+gX9lbor8lwTH3KLDekNnHR9SkJfEOBF6c8dQXj2Txkl0
 qCqAjjQc17dScfL9n2ZHLfFqVXKLWAnJk2BKVx1OMRCf5yGgOWbrp2Ezyo5XkBZDGt
 HWEtfQkv9QX4wixm6/g+f8PK0FED8Bcc5T6zUaDcusv7VbePcwncqwZNH+moOl1Yla
 2WDYcbT6CyD87Cooq+GL8A0TNvEfOpSVLDZ9qQeS6CfYVq9NCRz/JJygAhqOz6EY6I
 P/y4PBWpfmPjg==
Date: Tue, 10 May 2022 12:13:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Lukasz Majewski <lukma@denx.de>
Subject: Re: [PATCH 1/2] ASoC: wm8940: add devicetree support
Message-ID: <YnpI7CTiXzCYn918@sirena.org.uk>
References: <20220509121055.31103-1-lukma@denx.de>
 <YnkxIe1nVUiKNmdq@sirena.org.uk> <20220510092438.528ef474@ktm>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qAf9JxhdA/2u1K62"
Content-Disposition: inline
In-Reply-To: <20220510092438.528ef474@ktm>
X-Cookie: I've read SEVEN MILLION books!!
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>
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


--qAf9JxhdA/2u1K62
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 10, 2022 at 09:24:38AM +0200, Lukasz Majewski wrote:
> > On Mon, May 09, 2022 at 02:10:55PM +0200, Lukasz Majewski wrote:

> > > This adds devicetree support to the wm8940 codec driver.
> > > With a DT-based kernel, there is no board-specific setting
> > > to select the driver so allow it to be manually chosen.

> > You need to provide a binding document for any new bindings you add in
> > code.

> The second patch in this series adds proper *.yaml file to Linux source
> tree.

You didn't send the patches as a series, you sent two separate threads
so they got totally separated in my inbox.  I did eventually connect
them.

--qAf9JxhdA/2u1K62
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJ6SOsACgkQJNaLcl1U
h9Bpsgf9HulPrkkCBhalLtUuryJIf4qV7x1Y04CyPnGjl9Ho8sS9mNtiwG6Czlo0
+2f1GImlUw9xZWtHGEcjralJLVOsCXfr5vEtFsGTKhFclWa7zgwvyAEW4362zW51
BU+u1iZxL3/BHfKS5zk8+VztfDA7EkkRkIFgzl3b4e6yIUQZdW0BHn4qKFR98NVH
cVqsLpjo1xhwmsk+3NvzL6YBP4mBXadd+XiwW0BJ8X2PCtV9AIvqIy8+Eg+AHONL
yxVFnpM4Z4qHh9XZ/k2MOztDeLAdtowN13JGEcjVCDW/JOkNBrqNQLtnPNRtHUOd
sPFGLyuiYVFwUoSRouldnuTpbfZdrQ==
=WRQT
-----END PGP SIGNATURE-----

--qAf9JxhdA/2u1K62--
