Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F9C1F4590
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jun 2020 20:18:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F09EE1672;
	Tue,  9 Jun 2020 20:17:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F09EE1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591726685;
	bh=G41TtowFXaO/DAZpu0cVYo8z661oriNucxG1XFKHoPM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JIlZ5KxSOqtnqdq1Gs3mOF3KKqMUVNnWKjzlP0mCuw6/of6Zhsljp5B1AcEeqIZ6z
	 h+tmm6AJ/3odyRkhHpNN+U2/MNnnTjDAeeaF0dCiISii24X9UXQNx3SuLHwc4XdvMZ
	 b1XWf1kkgZaANlf1feiK7pEvrDHIcz72sxtgV6nk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2AAE0F80278;
	Tue,  9 Jun 2020 20:16:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC7E2F8028C; Tue,  9 Jun 2020 20:16:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D390F80088
 for <alsa-devel@alsa-project.org>; Tue,  9 Jun 2020 20:16:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D390F80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Gyw51rIp"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 30FBA2067B;
 Tue,  9 Jun 2020 18:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591726577;
 bh=G41TtowFXaO/DAZpu0cVYo8z661oriNucxG1XFKHoPM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Gyw51rIpi+ulSqItNrsmtKb5h+dKcu8gVfAGFvj7KkdeSp8+nHiXuDbW9zYEOdHs5
 ezOBuAZkwbHHeKHQuPDtyD4oc8RAgxLfzL3R5XqyqRlvrIeOruIL2y9KYURGeoWvRU
 nxEvl/QT0JBuEXwKlwDUkyoIQYEA5ypZfUKNs2J0=
Date: Tue, 9 Jun 2020 19:16:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Dan Murphy <dmurphy@ti.com>
Subject: Re: [RFC PATCH 0/2] TAS2563 DSP Firmware Loader
Message-ID: <20200609181615.GR4583@sirena.org.uk>
References: <20200609172841.22541-1-dmurphy@ti.com>
 <20200609175203.GP4583@sirena.org.uk>
 <6d6aaed3-dac8-e1ec-436c-9b04273df2b3@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Hnpg0BSo5EvPlUVi"
Content-Disposition: inline
In-Reply-To: <6d6aaed3-dac8-e1ec-436c-9b04273df2b3@ti.com>
X-Cookie: Be careful!  Is it classified?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com
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


--Hnpg0BSo5EvPlUVi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 09, 2020 at 01:07:50PM -0500, Dan Murphy wrote:
> On 6/9/20 12:52 PM, Mark Brown wrote:

> > I think you can just use enums for most of this - what you want to do I
> > think is parse the firmware, build templates for the controls and then
> > add them with snd_soc_add_component_controls().  Userspace *should* cope
> > with controls being hotplugged.

> Yes this was my concern if userspace could cope with dynamic controls.

Things like alsactl definitely do, and obviously anything that starts
after the firmware loads will be fine too.

--Hnpg0BSo5EvPlUVi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7f0e4ACgkQJNaLcl1U
h9BPZQf/QjR//jsXKkphJTsgYAHAiZJBkN3aZllUBbN4UHEukwcGT+6r/86c4C2S
bbRZ6krfhaQSfsFfKOKOlkSc6M4VFbSF8QHPDJgg+QxYNCyxn4YkKu+0PWp8bnYs
wza4rfr4xY3bMxxfeZT9IeNP7FnrV5F6oMxe2cjnZmhK2KsoJQq/WmovNok8s4yp
EzD+jAm38oRvC5pi7e6uqoekZMqJk0/YSz3mq0tqPKHQrobR/CPXbcak3ZbYPETL
TIwy58cQZ4gjzkA5Bc0HLo1J9B+naB/MCsAXIUdwFregMK3xdEVjYoX3Zu2bejuK
6VwccB7gTl9byPZqfVQM/rsUHtanKg==
=TxgD
-----END PGP SIGNATURE-----

--Hnpg0BSo5EvPlUVi--
