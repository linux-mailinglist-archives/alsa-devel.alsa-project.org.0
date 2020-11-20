Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E29882BB63C
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Nov 2020 21:06:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56C30170C;
	Fri, 20 Nov 2020 21:05:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56C30170C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605902793;
	bh=O6QlgpPZWJ0ZFa0Oit5xMmDdgPSwTCGSd8OW7gqJhYE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iBwx+Xa7tffiYhXan1AdYEQSBgLhL8O48AuGiV1BPWw0LW0hQiD+knLszIxmIOUyv
	 YutKzyRV8YYJLqNhjSQcLK2xMKoYh1dHcJKKv+3ru92pfF5GHi3y+rVSQRwiaFbPeu
	 3t/SPbhKxhxYTs36b63Q0D0C9vlcK9IpRqk4m31Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C40CAF8016D;
	Fri, 20 Nov 2020 21:04:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BDA3EF8016C; Fri, 20 Nov 2020 21:04:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5899EF80166
 for <alsa-devel@alsa-project.org>; Fri, 20 Nov 2020 21:04:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5899EF80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="z8SAy73j"
Received: from localhost (cpc102334-sgyl38-2-0-cust884.18-2.cable.virginm.net
 [92.233.91.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C45742225B;
 Fri, 20 Nov 2020 20:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605902691;
 bh=O6QlgpPZWJ0ZFa0Oit5xMmDdgPSwTCGSd8OW7gqJhYE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=z8SAy73jokhL1rD6RinyEXwIklNEbYMURVKsRlpggkmyDXr5PBXW+52WKiLcnsuO0
 vWsgTOJKVDxHkdTWsWxZ3hKryWwnjYPoDC3kX7eufWyQGipH/slnOu+p2EbAyfbfs/
 zkyRBYRiHv+8TW0qcgxXpZoWr1+j8Dc1XWNUgpwA=
Date: Fri, 20 Nov 2020 20:04:29 +0000
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 01/38] ASoC: ak5558: drop of_match_ptr from of_device_id
 table
Message-ID: <20201120200429.GJ6751@sirena.org.uk>
References: <20201120161653.445521-1-krzk@kernel.org>
 <20201120165202.GG6751@sirena.org.uk>
 <20201120194245.GA2925@kozik-lap>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="oYAXToTM8kn9Ra/9"
Content-Disposition: inline
In-Reply-To: <20201120194245.GA2925@kozik-lap>
X-Cookie: Have at you!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>,
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


--oYAXToTM8kn9Ra/9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 20, 2020 at 08:42:45PM +0100, Krzysztof Kozlowski wrote:
> On Fri, Nov 20, 2020 at 04:56:34PM +0000, Mark Brown wrote:

> > It would be better to fix these by annotating the table as potentially
> > unused, if nothing else it means if someone wants to add ACPI support
> > (or it just works on their ACPI system with the plain old I2C ID) then
> > they don't need to revert this change.

> The point is after this patch - removal of of_match_ptr() - they will
> already support the ACPI matching through the PRP0001.

> Keeping of_match_ptr() and maybe_unused will prevent any ACPI re-usage
> unless explicit ACPI table is added

Surely if that's the desired outcome the fix is to change the definition
of of_match_ptr() such that it leaves the reference with CONFIG_ACPI,
perhaps hidden behind a config option for PRP0001?  That seems better
than going through the entire tree like this.

--oYAXToTM8kn9Ra/9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+4IUwACgkQJNaLcl1U
h9C90Qf+I61ttAwAIZE/4fiWa7BmkBv4D00kqcaq3pu9eccMg7mleU/2IEA+WLuX
IXI3xrY2EvAn6BerMQQOCpY7h5QDpqYpk37MlaB1/VznoqMV3kN2OVTt0iigmZZ3
15xRwAW89OXYkZfnm2obupwURLm389fYcTFZpD6M90GYiUUFZ+uIENUT1vShaXDE
5Wq6yxBpRgmq3BlKxQFfD2fhZKqeWgrJwtgc7ChHfjYk1b6Il22K2RMiBVwv4Ax3
zpkY4Gbe79sa5yTYk1dRcUd9hnLMK8Sm/lIUTLuTtgMuKmKD8Aubv6x1qi6d4Cvb
/hqYpBit+g3Cr1zBlcEAdK/u/NUhVA==
=sv4Y
-----END PGP SIGNATURE-----

--oYAXToTM8kn9Ra/9--
