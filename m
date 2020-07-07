Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC93A216A74
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 12:37:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B402950;
	Tue,  7 Jul 2020 12:36:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B402950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594118223;
	bh=eWilmxL1Pp5afMTknP+I9u/CgSUT6XCuGkQ3LcJjx+A=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lFvsE93Yq0dzVu/k4B8Cg/RLWHQ5yy2tZe8FU7MIiJMIhgGOPl0smX+AkXr8cNarg
	 q8x3X3YHkwa+euzt0J4dbexrLP6uimJyURssUA12yOk6TtPz0hzA4COoWxe0GBfGT4
	 SyXEAEZeZVTaKEamTMmlbimR5mpq5t18YK5wHOKw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD25BF802DC;
	Tue,  7 Jul 2020 12:31:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC73AF802A9; Tue,  7 Jul 2020 12:31:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A284CF8027C
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 12:30:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A284CF8027C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="tvG/T9F7"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4EB582065F;
 Tue,  7 Jul 2020 10:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594117857;
 bh=eWilmxL1Pp5afMTknP+I9u/CgSUT6XCuGkQ3LcJjx+A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tvG/T9F7afny7pIuP/iUdkoeTgIxUliBMpmWH/65CxrDm0Bp1+wvuPzMdijN5LkeD
 vCLXbP8KtNdtkYG4dQjLuKYiTn5DXSNsMeDSlksYoO4zRPYv1QOEt3e2JRaWu5OiPJ
 DTWLAUrFxK8QPQk87x1aLNKvk53EHwvdbXIhfkNs=
Date: Tue, 7 Jul 2020 11:30:53 +0100
From: Mark Brown <broonie@kernel.org>
To: Akshu Agrawal <akshu.agrawal@amd.com>
Subject: Re: [PATCH] ASoC: rt5682: Add fmw property to get name of mclk
Message-ID: <20200707103053.GF4870@sirena.org.uk>
References: <20200707100825.24792-1-akshu.agrawal@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="VuQYccsttdhdIfIP"
Content-Disposition: inline
In-Reply-To: <20200707100825.24792-1-akshu.agrawal@amd.com>
X-Cookie: I hate dying.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Oder Chiou <oder_chiou@realtek.com>,
 "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 open list <linux-kernel@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
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


--VuQYccsttdhdIfIP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 07, 2020 at 03:38:25PM +0530, Akshu Agrawal wrote:
> Non-dts based systems can use ACPI DSDT to pass on the mclk.
> Thus add fmw property mclk-name to get the name of the system clk
> and link it to rt5682 mclk.

ACPI doesn't support clocks at all, you need to add a clock binding to
ACPI first.  The idiomatic way to do this would be to have board
specific quirks.

> +	device_property_read_string(dev, "realtek,mclk-name", &rt5682->pdata.mclk_name);
> +

No, this is not at all OK - you're adding this via a device property
which means that this will show up in the DT bindings too.

--VuQYccsttdhdIfIP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8ETtwACgkQJNaLcl1U
h9AN6wgAgo5at99d+D1JNkuzvhAbwOx+ZYmgFdlmbYCjbCSCW1rALhghF5kzFGTN
Jq+x6GVw0RX2O1hXNrNdhZdNTdRgxiZzOYMGbaLmnj9DSJj57hUEEynQhI0wOpRN
/vEG2xzLcd3B4wPhfv7uVzMcO4miHVIkY7RAEYnpeKD4fan0assPAjFJwUX0VCz0
D+qy3FGEpAulCk4HtidGRZVAIF1bsFehFrJc9FWurg2CGQDfyhn4BjVPci3eGl2j
Gwgr981VctOUltCO3nmMIeXUiAm4JMdBKb4BBpu13417GjFxXUpY0sPxhnHGmhgH
4t9vGlxY36bl2v6R1B5Y00Pkt30JJA==
=n+az
-----END PGP SIGNATURE-----

--VuQYccsttdhdIfIP--
