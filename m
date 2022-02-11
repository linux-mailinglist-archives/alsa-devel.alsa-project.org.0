Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4384B2512
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Feb 2022 12:59:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5B38192A;
	Fri, 11 Feb 2022 12:59:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5B38192A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644580799;
	bh=pgz5WoyfElnAyzBIovA0IXn76dZ8q1uHsh96lNL+XAI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rhV7WRtCcXbY8TbA/FCGaqletPlFVppKidCY/wAnMUc7g4gocfvEy5Ej/lMZmyiGn
	 bCeXj94Ea+jt27idG8MaxY420pLEyBb0HRyxVLItujNAErGtRGscwpTv1KNpfFu/Fh
	 WsFwYzOTgVlL3R4zU+B0I11hOHIdkqz/2sahjen0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63A0FF800B0;
	Fri, 11 Feb 2022 12:58:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6FB56F80125; Fri, 11 Feb 2022 12:58:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22D0AF80125;
 Fri, 11 Feb 2022 12:58:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22D0AF80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="V5oUialu"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F11DE61B76;
 Fri, 11 Feb 2022 11:58:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B7CAC340E9;
 Fri, 11 Feb 2022 11:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644580724;
 bh=pgz5WoyfElnAyzBIovA0IXn76dZ8q1uHsh96lNL+XAI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V5oUialuPGmZ70jHjuFpzC/zncDrcjgmjV/chXHS1MOpvH46ZCdBB6gPoeOwyuDs5
 S0FH6N6snATeM/uDQ0tOrdbfcbKTZ1zU2Af6fzcN+ZaUq7jdZgk7DlKlcw5n0FfDbN
 T9TRnHyjoi4SV/Q+VBCw/EJZP+LIz1M9WjOeTqy6LSm7WECz0Pd2t1S7pqGrxxYTYw
 QFnRyReKldltujYEXPImbvKFMiRzLk9AA6OGOlHau0W9dSk2C/ylZI0gbRxXvZpZba
 05rjN2QwlljnC++eiK/8VAFO4Hr7bAP/qnsXblASkVmiu258weJTz/VoudFkHcZaIn
 yoMCanTuXa1nQ==
Date: Fri, 11 Feb 2022 11:58:39 +0000
From: Mark Brown <broonie@kernel.org>
To: Luiz Sampaio <sampaio.ime@gmail.com>
Subject: Re: [PATCH 31/31] sound: soc: sof: changing LED_* from enum
 led_brightness to actual value
Message-ID: <YgZPb39aPMm64gSL@sirena.org.uk>
References: <20220121165436.30956-1-sampaio.ime@gmail.com>
 <20220121165436.30956-32-sampaio.ime@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="plmduE3cU0Ei6ORP"
Content-Disposition: inline
In-Reply-To: <20220121165436.30956-32-sampaio.ime@gmail.com>
X-Cookie: do {
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, sound-open-firmware@alsa-project.org
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


--plmduE3cU0Ei6ORP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 21, 2022 at 01:54:36PM -0300, Luiz Sampaio wrote:
> The enum led_brightness, which contains the declaration of LED_OFF,
> LED_ON, LED_HALF and LED_FULL is obsolete, as the led class now supports
> max_brightness.
> ---

You've not provided a Signed-off-by for this so I can't do anything with
it, please see Documentation/process/submitting-patches.rst for details
on what this is and why it's important.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--plmduE3cU0Ei6ORP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIGT24ACgkQJNaLcl1U
h9Dligf+M7qs1xkty0Kg+UH9bpC0lH91jFsVPaoq+vPltqshE0VI0JvJryAUdaA3
040Qmc5PWko17MNBzyf+9ME5bDy+gQzhgiREmqPnNnQQYg6p4/ib9VtPQ01U+juB
5cSXcNp5YHv/1Ewum9vvSGUDgLnHeTqp8NDF0CyosRL88EvPEcA93jrFh+KzzB7y
mrSNhEpXNcFaCHpUgN/PjjEpOzgRuwwEihTa5IFoeAoiLqkT0rZUvi3pW3ieyUpN
0oIMw5VKrUN/q+Ub5yXgZc6qdCtyy9VlHPsk/2jPfw/EwBOb39u1A5JVCmeqP+DL
/LwIe7ZulmRGqnE02dtCKbujcehWdA==
=nfQH
-----END PGP SIGNATURE-----

--plmduE3cU0Ei6ORP--
