Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 027F1162AF7
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Feb 2020 17:46:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DAC21698;
	Tue, 18 Feb 2020 17:45:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DAC21698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582044375;
	bh=uQbSAwGDz9FJaYwjUTngZnOp0C2M4gvUSXL3Y/kG+wk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lSJkyg7CFPN3HJp7CW5s4f8eVWiYUnKHSwWoKkPLRHbfxK5KhZokvC9RIVmp+BBbL
	 ex4eSsL3v3Gmd+eFRHXi8Nf/ceqQdyxclN7MYTFMo0TQdVgQFrFKuHhtcmiBz7IJQw
	 IHeBozCl4v04FpdX+5x101nUkTq3VUl8280Wqab8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2133F80135;
	Tue, 18 Feb 2020 17:44:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E4DBF80148; Tue, 18 Feb 2020 17:44:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 48A15F80137
 for <alsa-devel@alsa-project.org>; Tue, 18 Feb 2020 17:44:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48A15F80137
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 80A2830E;
 Tue, 18 Feb 2020 08:44:27 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0338D3F68F;
 Tue, 18 Feb 2020 08:44:26 -0800 (PST)
Date: Tue, 18 Feb 2020 16:44:25 +0000
From: Mark Brown <broonie@kernel.org>
To: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH] ASoC: cpcap: Implement set_tdm_slot for voice call support
Message-ID: <20200218164425.GJ4232@sirena.org.uk>
References: <20200211181005.54008-1-tony@atomide.com>
 <ae2b7d9e-d05e-54ac-4f18-27cc8c4e81a0@ti.com>
 <20200212144620.GJ64767@atomide.com>
 <9a060430-5a3e-61e1-3d2c-f89819d9436f@ti.com>
 <20200217232325.GD35972@atomide.com>
 <8fc1dded-6d28-f5cd-f2f9-3a6810571119@ti.com>
 <20200218153211.GI35972@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="4vpci17Ql0Nrbul2"
Content-Disposition: inline
In-Reply-To: <20200218153211.GI35972@atomide.com>
X-Cookie: No alcohol, dogs or horses.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Merlijn Wajer <merlijn@wizzup.org>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Pavel Machek <pavel@ucw.cz>,
 Sebastian Reichel <sre@kernel.org>, "Arthur D ." <spinal.by@gmail.com>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>
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


--4vpci17Ql0Nrbul2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 18, 2020 at 07:32:11AM -0800, Tony Lindgren wrote:
> * Peter Ujfalusi <peter.ujfalusi@ti.com> [200218 15:16]:

> > > Hmm does set_sysclk called from modem codec know that cpcap codec
> > > is the clock master based on bitclock-master and set the rate
> > > for cpcap codec?

> > Neither component should call set_sysclk, set_tdm_slots. The machine
> > driver should as it is the only one who know how things are wired...

> OK, but so what's the machine driver part in this case?

The machine driver is responsible for saying how everything is glued
together, both where the wires run and any policy decisions about how
the clocking tree should be arranged or TDM used.

--4vpci17Ql0Nrbul2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5MFGgACgkQJNaLcl1U
h9BWigf9HfGg6QYgwXFW+UiKeanYp+tlVmrtYAk5vKqT+qhhZaUphuoL0k1AjEar
fhxVZBAyq6Xum6S6U8dTncKMled15zqe6RzRqXf/3MrmiX+nF/UsNhJkRbDPIZhH
8a/RIeMIaPpfB46mB0VWQIFqsHSpCIhuWxIKIKW1yqqpobWatjHG2kLHWxGZZ3k6
ajFkE6B/+1HYORI8eOtDBFM4GldmmVWM/Lfo7DadnRpCnoyte2n+dVsEidhYmxJv
biw9pG50kKZmeJth2GMVcvlBdrYM32WKJv8iZKt2NF3qJEMgMDuekj+L3Slz3Ev8
r8/i+/DRJeHwCwifLyfgg/VZjjqZAg==
=sLmb
-----END PGP SIGNATURE-----

--4vpci17Ql0Nrbul2--
