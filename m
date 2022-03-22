Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1244E3E0C
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Mar 2022 13:03:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D66311669;
	Tue, 22 Mar 2022 13:02:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D66311669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647950629;
	bh=oXomf+OroFKXPI727l4Y0841A5BkhUXzo5xCfhdMsC0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aEqENYjxI95At7GwQOmqzlmNcmhm2+9QyPKr+r98S4yMLHlnsusiZ+WQ36p6vM4DY
	 cAqjinl+dDGUTSkNfp4DWW3OrIkKJ46LXnqOHl3Cmpt0Yvmwb4+FfUmUu2wN1M70mL
	 lvkTgdbjbuZjgV+5Aw8pyQZEiimJ4HxWlnJVadyM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F403F8032D;
	Tue, 22 Mar 2022 13:02:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87FDEF800FD; Tue, 22 Mar 2022 13:02:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C773F80116
 for <alsa-devel@alsa-project.org>; Tue, 22 Mar 2022 13:02:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C773F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TKE/1FWW"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B5DFC6137C;
 Tue, 22 Mar 2022 12:02:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 545B5C340EC;
 Tue, 22 Mar 2022 12:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647950556;
 bh=oXomf+OroFKXPI727l4Y0841A5BkhUXzo5xCfhdMsC0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TKE/1FWW/oIajs0VV3zmrI5NUmCEutISIFYySMXYpw+kvv0dJFWgyqzsVMXykcuoX
 PyW7CTXlKifLMnywE5dTPyddnXvi+eurEpvnVBN1blVkHfFTNnAhPA7OE976g/tlqX
 qbH1SznaPVG4E7H6Fq+qBcpe1PMXBezhJxT6ktcaIQRGDLiQWddT0rcKHLQi6S76bn
 nuH0sA2NVhSCD0GcNMHL/GhCRYNfhBtAtnl4B1E4WmVWpqwLjXfwYlNfiQ+eIw1biZ
 yxcoyoqSE0Vw3q7w4p3fNwK+Njl8UbLlQfh8LnObtcK56M/8fqDoxNl9qtaEAcMHc9
 fzBoxgyDpyTYQ==
Date: Tue, 22 Mar 2022 12:02:28 +0000
From: Mark Brown <broonie@kernel.org>
To: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: Re: [PATCH v2] ARM: OMAP1: Prepare for conversion of OMAP1 clocks to
 CCF
Message-ID: <Yjm61MFGuo0Yug/B@sirena.org.uk>
References: <20220310233307.99220-3-jmkrzyszt@gmail.com>
 <20220321215416.236250-1-jmkrzyszt@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="j44egohE1ZoQznmQ"
Content-Disposition: inline
In-Reply-To: <20220321215416.236250-1-jmkrzyszt@gmail.com>
X-Cookie: Drop that pickle!
Cc: alsa-devel@alsa-project.org, Felipe Balbi <balbi@kernel.org>,
 Paul Walmsley <paul@pwsan.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Tony Lindgren <tony@atomide.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alan Stern <stern@rowland.harvard.edu>, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-omap@vger.kernel.org, Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 linux-arm-kernel@lists.infradead.org
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


--j44egohE1ZoQznmQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 21, 2022 at 10:54:16PM +0100, Janusz Krzysztofik wrote:
> In preparation for conversion of OMAP1 clocks to common clock framework,
> identify users of those clocks which don't call clk_prepare/unprepare()
> and update them to call clk_prepare_enable/clk_disable_unprepare() instead
> of just clk_enable/disable(), as required by CCF implementation of clock
> API.

Acked-by: Mark Brown <broonie@kernel.org>

--j44egohE1ZoQznmQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmI5utQACgkQJNaLcl1U
h9COEQf9ELwbgSwwn1JVU6FAUZODISuwoWMyUuvHTGdNQEvrMH3GFIUbXQVQONw5
wO62KwasXhYThVzc3rrC74tKTRzwY9/CvA4GNJfZqmHSuXg02O1XqYe6zUmlRbdt
qxVjr4o/EKcY48qmrI9SV9k4GBDuOeU2fSZJP7EIvFqLC/tfDbQYYuRB+TY9Ig+j
oTmg/0JXVooTcMULwexILHzRg4S4+mxOAjfsMojVzku0MepzEPzGo0xZDGYmD0RC
QggKUpiyDnHPKgNk+pEG+1HmSf9sEd2Vb4k2eMfkacZ7Tz81/FON54F8K/213wKl
hCsEajyZs2COxhX4Xfe+zoGXkLD3bg==
=HhWj
-----END PGP SIGNATURE-----

--j44egohE1ZoQznmQ--
