Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D851620F323
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jun 2020 12:53:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C2F41615;
	Tue, 30 Jun 2020 12:52:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C2F41615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593514412;
	bh=HfXO0VpheAvjk0ln5fPpGb/+WLwAz84prT9BG0X9ilY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=REtTP0iku9x2JCEhWY9kxSZjqr8Qc4VMWAknX140zP+x+OhXpZNB0gc1+oSj+zln0
	 P4Hfu7Ar5QIl3p22mhcqinf5142jePPDyXFxnW3Ste+TN8Kigj7LrBoJufL/ifVu8p
	 wp/VzfBkRgRuigyCZjhKiSE3aphgBozZFzlkxnYo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A191F80135;
	Tue, 30 Jun 2020 12:51:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F5CFF801F2; Tue, 30 Jun 2020 12:51:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA8CAF80135
 for <alsa-devel@alsa-project.org>; Tue, 30 Jun 2020 12:51:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA8CAF80135
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="r2pSDdwi"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 346E52073E;
 Tue, 30 Jun 2020 10:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593514304;
 bh=HfXO0VpheAvjk0ln5fPpGb/+WLwAz84prT9BG0X9ilY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=r2pSDdwiGRoQI9VKeLz1jw3q/Z55hiKs57B6RTbmJf36cofTKl3u8xNuSGOC0ucFu
 75fSyPBVGxMwk0Pr0eK4CfoyKFIyjYMoUUM2unZPNrHiz2dlciH66ii7K6aK0QTQDL
 Q3jCJp+w1eNhnSC3vPb4x/nIZttbAoKV9f8ULAQg=
Date: Tue, 30 Jun 2020 11:51:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH v4 00/23] Add support for Tegra210 Audio
Message-ID: <20200630105142.GF5272@sirena.org.uk>
References: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="6v9BRtpmy+umdQlo"
Content-Disposition: inline
In-Reply-To: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
X-Cookie: Walk softly and carry a megawatt laser.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: jonathanh@nvidia.com, nicoleotsuka@gmail.com, alsa-devel@alsa-project.org,
 atalambedu@nvidia.com, swarren@nvidia.com, kuninori.morimoto.gx@renesas.com,
 linux-kernel@vger.kernel.org, nwartikar@nvidia.com, lgirdwood@gmail.com,
 tiwai@suse.com, viswanathl@nvidia.com, sharadg@nvidia.com, robh+dt@kernel.org,
 thierry.reding@gmail.com, linux-tegra@vger.kernel.org, digetx@gmail.com,
 rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
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


--6v9BRtpmy+umdQlo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jun 27, 2020 at 10:23:22AM +0530, Sameer Pujar wrote:

> Following is the summary of current series.
>  * Add YAML DT binding documentation for above mentioned modules.
>  * Helper function for ACIF programming is exposed for Tegra210 and later.
>  * Add ASoC driver components for each of the above modules.
>  * Add DT entries for above components for Tegra210, Tegra186 and
>    Tegra194.
>  * Enable these components for Jetson Nano/TX1/TX2/Xavier
>  * Enhance simple-card DPCM driver to suit Tegra Audio applications with
>    few changes in core.
>  * To begin with, enable sound card support for Tegra210 based platforms
>    like Jetson Nano/TX1.

This series is too big and covers a few different topics which makes it
difficult to manage, please split it up.  The most obvious thing here is
that it contains both the drivers you're adding and a bunch of changes
to the generic audio cards (which are a single throwaway line in your
cover letter) - splitting out the generic card changes into a separate
series would result in more manageable sizes.

--6v9BRtpmy+umdQlo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl77GT0ACgkQJNaLcl1U
h9Cqgwf9Fw0z1EoYl+GQBfxwHgw1q0QJ+7vFY3wAPvTzfCpGF/GN0kWMZ5JRYfqA
HxqRAft5r6DgsdOMFRTCkL7ATAnWYyRaNDLoDeMINVQ9/mmaI1FPr/pNSo81X+OX
XL7gZ2xPW9t2GDqtW+AOLGi8crZdSGfWb8HZQDAp5S0tajhTYPpgprx8mXNHsAWk
mvpNfvCT1IeWgDpINtVq/75iixg+GgmA68C/x07ycpzpH2q3x91JbBjlGjlNXpL2
JMr7KKcz993cWC8BwOXIIxbetlbxS6LOINR0sQKFobxcqE16+UUmGpl/TFNDWqos
i2SEL/aLhcksjZJCyLrgV3MfQXoavQ==
=OUo+
-----END PGP SIGNATURE-----

--6v9BRtpmy+umdQlo--
