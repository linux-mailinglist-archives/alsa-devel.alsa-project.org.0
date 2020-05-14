Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A78D91D36E5
	for <lists+alsa-devel@lfdr.de>; Thu, 14 May 2020 18:46:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45BCE166C;
	Thu, 14 May 2020 18:45:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45BCE166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589474791;
	bh=kiL8vY6CkFT/nNq8j8G4W4SxKVZkcdjMJyJMnjKV/O8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kLpwmMoa6zmh1NjqBJZfVvryujPXHMufONvLUyC0LKDdYikX3zqtB5w35AmxpJwLl
	 HcvdY4f5ZW0zA9ttbEoLB0lv2nW2ydnnXM6V9kj+Q2uSv2Phy/U3TK+Hu0xHUJAXEt
	 a0oaWWztEA8NOaEUCxBQGjgdF9C1lv5qpkV42OtE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4AF6F8014C;
	Thu, 14 May 2020 18:45:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D60FF8015A; Thu, 14 May 2020 18:45:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E7EDBF800E3
 for <alsa-devel@alsa-project.org>; Thu, 14 May 2020 18:45:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7EDBF800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uYDcr37i"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D11152065F;
 Thu, 14 May 2020 16:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589474735;
 bh=kiL8vY6CkFT/nNq8j8G4W4SxKVZkcdjMJyJMnjKV/O8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uYDcr37iHoOjl/hlTqP7CsPkPBznzGWa9E8GbAojK7k/uoZWlsYsfRs+NcLKmQayc
 7OSxfquRwk4uGNEWIU4N02y7Jz3mDsBWiej5zH92oE9Jnj4kj8piYuDPNru/GyerbM
 yBIig/E29GRRZ3ocvloXNsusqBZTIUvzwfnlqCcI=
Date: Thu, 14 May 2020 17:45:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Ajit Pandey <ajitp@codeaurora.org>
Subject: Re: [PATCH v2 2/7] ASoC: qcom: Add common array to initialize soc
 based core clocks
Message-ID: <20200514164532.GK5127@sirena.org.uk>
References: <“1586592171-31644-1-git-send-email-ajitp@codeaurora.org”>
 <1589474298-29437-1-git-send-email-ajitp@codeaurora.org>
 <1589474298-29437-4-git-send-email-ajitp@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="L1EIGrW/+75u5Nmw"
Content-Disposition: inline
In-Reply-To: <1589474298-29437-4-git-send-email-ajitp@codeaurora.org>
X-Cookie: I think we're in trouble.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, plai@codeaurora.org, linux-kernel@vger.kernel.org,
 srinivas.kandagatla@linaro.org
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


--L1EIGrW/+75u5Nmw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 14, 2020 at 10:08:14PM +0530, Ajit Pandey wrote:
> AHB-I/X bus clocks inside LPASS coreis not a mandatory clocks for
> SC7180 soc lpass variants, hence make it an optional one.

Do we need to improve the checks in the rest of the code so that if the
clock is missing on a SoC where it is actually mandatory we don't end up
trying to start without it?  Perhaps it's more trouble than it's worth
though.

--L1EIGrW/+75u5Nmw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl69dasACgkQJNaLcl1U
h9A0Bwf/e4hSBrydNbw3C8a6mbrZD1QBRV4+COWVM2MzaLMgNyNIjFLZ1WVbnBqV
4a61PcT9XpAfbeyCcyxLmP82FTUenpsJUdqPH13OadlO6geV/BX7RrUrhXwlFgkj
o/dxzOYavcWSubX+ETe32f1N8hAvJhtbJQ6H79Sb1Da6RUitORkV+nccijW3dL5a
rs9dU5OkyYc9667VCy3wdJ1kOfCOuIbWAJ3zp3dZ8GQtH/WQP+c1zsIgNu972G12
jrFVsdMHNoD3btoMcnkuUEpCKupMhgLIpV3+pnecHxGd5TofdoWCn1zrHQPvJsRO
kB2MCvcNi7AMI4TosibmhiVSahB7sQ==
=2gUC
-----END PGP SIGNATURE-----

--L1EIGrW/+75u5Nmw--
