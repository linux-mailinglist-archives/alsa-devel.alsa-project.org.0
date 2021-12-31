Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE36C48242E
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Dec 2021 14:24:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 315A916B5;
	Fri, 31 Dec 2021 14:23:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 315A916B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640957056;
	bh=5UkmkWpXTBCyTJgkkimv8xhoOJAFuv+vuYinozWQV8g=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o2+qcoDV1SWO+hpmXxPFtVSjeR8ZdiPHno6/796ApIjf6tLAvdk/DXJmy6k73K4fU
	 Qv7D7u0/tjyxLQGD0/ErOPxBXJo1vcRXVpCDakOm46PQujWca9CII1szr1Smjwvvp4
	 vEtidRHYdJw/eFgEc9U83mjzTUcZJB19FVJON/jc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F297F80125;
	Fri, 31 Dec 2021 14:23:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E822BF800EB; Fri, 31 Dec 2021 14:23:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9714F800EB
 for <alsa-devel@alsa-project.org>; Fri, 31 Dec 2021 14:23:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9714F800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="DATKKwHk"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9DC80B81D5C;
 Fri, 31 Dec 2021 13:23:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CED03C36AEA;
 Fri, 31 Dec 2021 13:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640956982;
 bh=5UkmkWpXTBCyTJgkkimv8xhoOJAFuv+vuYinozWQV8g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DATKKwHkdtxEw/L9kwDOrAkxtyjWqvD5pqSmb/RYFdEvZ/V4+bqHmRU9lN05BBuiG
 NHf0K3vXJAp1SRJRkbZBpnwAcWai2kcTznvl0gLo0v2WSjoWIBr+gNq6Z5GAHMuEyJ
 hVbwrVSdJ1wHj+mRCM9w0JBuxDPrm2gD/K4g6siqW4yF3ORwPBbn61JLt70dOnn7FQ
 NM7JAktjyWPdIrxlQIZc1mlsCa3EjhULmsi4OiMAllzsAmOhG4T+x7NxOKbFVVmOmq
 JHKF6h7lHRiVPr3zQseCD3sB1rz+OuD3XJLLEcb28blP32u6yDYBDFlDhrclevCVCH
 PJEPeE+W+njnA==
Date: Fri, 31 Dec 2021 13:22:57 +0000
From: Mark Brown <broonie@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 2/5] ASoC: rt5640: Allow snd_soc_component_set_jack() to
 override the codec IRQ
Message-ID: <Yc8EMRxc07NphgcR@sirena.org.uk>
References: <20211227153344.155803-1-hdegoede@redhat.com>
 <20211227153344.155803-2-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vFugnW1waGfe7DY6"
Content-Disposition: inline
In-Reply-To: <20211227153344.155803-2-hdegoede@redhat.com>
X-Cookie: Piece of cake!
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Bard Liao <bard.liao@intel.com>
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


--vFugnW1waGfe7DY6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 27, 2021 at 04:33:41PM +0100, Hans de Goede wrote:
> On some boards where the firmware/fwnode information is in essence
> read-only (x86 + ACPI boards) the i2c_client for the codec may contain
> the wrong IRQ or no IRQ at all.

This doesn't apply against current code, please check and resend.

--vFugnW1waGfe7DY6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHPBDAACgkQJNaLcl1U
h9Crbwf/U1k0zmhBTl97sTJWhRMJirpht2U8Or/TuRKChSapzA8aSwLwAPTQVWku
7YKt+KbZ6JccMM2KqVvhQGqPxwfKkIYuHDWLwrbX5ujZ/YYMprxXfMePmG3uqG8r
3CAAVXd7y3K98knGM4/CAF0x60KJ13bOgl/tt0Azh+s7fPAaiNM+ZrSSIHZB8Vdp
duMt2cxgiNDG3uHiaU5JrMDogvapIaj/CNnUeKZe9bN4r0eYh470WYfP3ro+vXUr
Jt0++GPScQOlhZhpuubQm2JTjdFRWKpNZxFDxzFhr7zmeVMpmLPtItjqgHeIi2bE
B9lgvWcWn7bCEcYhfjF41wuV+fXhmw==
=7kGW
-----END PGP SIGNATURE-----

--vFugnW1waGfe7DY6--
