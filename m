Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BE82A4EEE
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Nov 2020 19:33:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 689FF1697;
	Tue,  3 Nov 2020 19:32:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 689FF1697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604428425;
	bh=S2+luEP224P+V/hzB3++cIuASCQaK+Zan4ukNr60FLA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B4JKbpIL0SDtAhe9Vv6CjkCqQQhikpl9YJulq2a20DVT81cUEq9GvUQBOfHj1Q+47
	 TluhMInnH8MU31rfm4tHcH5FcuIvRgkBst+r+6mlw1fVXTKlACamNbF3DkjY2kB2bD
	 8N1MkbZERfElv3XZPwz9MNdF1eq3qMyZv0oWWriE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6C82F80272;
	Tue,  3 Nov 2020 19:32:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69377F80171; Tue,  3 Nov 2020 19:32:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A27FEF80083
 for <alsa-devel@alsa-project.org>; Tue,  3 Nov 2020 19:32:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A27FEF80083
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="boO/t5WP"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9572820757;
 Tue,  3 Nov 2020 18:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604428324;
 bh=S2+luEP224P+V/hzB3++cIuASCQaK+Zan4ukNr60FLA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=boO/t5WPwDC2rtjnrpDDrySYTJ54UOhL5I4DexdZlMxZAjotXoQcqJWvEDtUHIpvy
 itMm7CILtwBPyiIzWomE0p2o7c7WXlFQPgMAorx7AFVo1yv3Si8z8725aNH07I3Ik5
 OMgokN5QMIbnkG0fGDV1cHqAnjjedWX+mEOUF8mA=
Date: Tue, 3 Nov 2020 18:31:54 +0000
From: Mark Brown <broonie@kernel.org>
To: "Limonciello, Mario" <Mario.Limonciello@dell.com>
Subject: Re: [PATCH] ASoC: rt715:add Mic Mute LED control support
Message-ID: <20201103183154.GG5545@sirena.org.uk>
References: <20201103125859.8759-1-Perry_Yuan@Dell.com>
 <20201103131253.GA5545@sirena.org.uk>
 <5f2c1282-4401-276a-8dad-127fa1f449fd@linux.intel.com>
 <20201103175948.GF5545@sirena.org.uk>
 <DM6PR19MB26368B60076D049F009B75A3FA110@DM6PR19MB2636.namprd19.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="z9ECzHErBrwFF8sy"
Content-Disposition: inline
In-Reply-To: <DM6PR19MB26368B60076D049F009B75A3FA110@DM6PR19MB2636.namprd19.prod.outlook.com>
X-Cookie: I don't get no respect.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "oder_chiou@realtek.com" <oder_chiou@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "Yuan,
 Perry" <Perry.Yuan@dell.com>, "tiwai@suse.com" <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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


--z9ECzHErBrwFF8sy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 03, 2020 at 06:04:49PM +0000, Limonciello, Mario wrote:

> I don't think it came through in the commit message, but I wanted to mention
> in the system that prompted this software does not control the LED.  The LED
> is actually controlled by hardware, but has circuitry to delay the hardware
> mute until software mute is complete to avoid any "popping noises".

Ah, this doesn't correspond to the description at all.

> The flow is:
> User presses mute key, dell-wmi receives event, passes to dell-privacy-wmi.
> This emits to userspace as KEY_MICMUTE.  Userspace processes it and via UCM
> switches get toggled.  The codec driver (or subsystem perhaps) will use LED
> trigger to notify to change LED.  This gets picked up by dell-privacy-acpi.

> dell-privacy-acpi doesn't actually change LED, but notifies that SW mute was
> done.

> If none of that flow was used the LED and mute function still work, but there
> might be the popping noise.

With a timeout so that if things get lost somewhere then the mute button
is still functional, or can userspace block mute?  Also what happens if
userspace tries to set the state without having done anything about
muting, will it trigger the hardware level mute as though the key had
been pressed?

--z9ECzHErBrwFF8sy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+hohkACgkQJNaLcl1U
h9B3+Qf/UodcwIVMP/9TkttH3uazJZfOQxj0EUuJOB5eFsOxCxEHaKKck7sPY5ng
PNpXfwWbGXkEngU8k3cmIEfM4aUML+t09MuDXxn96f8jc1TIb5Ypesy8UwI0Rh/S
pYAK3fBL9sXS93LQ8VnRHEiFGWJHyHrTtEBYWN4Et1FCsASNxzZ7QQlLqNcVixvH
KthGIT1k3Iazal43/EUxDvXj7W25qfxNqcHeulBI3WuABKit1P8pM5TCqrLDcyvc
bDObV1mofCmq1Iq/o5MVI2yr1U8YSMAsZb+uzRzonnKxCPM+jIbI7UWKG61+zn2J
4waYK8+afP34SjbeG4P7E24RO/rz/g==
=timC
-----END PGP SIGNATURE-----

--z9ECzHErBrwFF8sy--
