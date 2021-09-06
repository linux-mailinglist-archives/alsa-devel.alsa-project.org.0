Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81017401AC2
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Sep 2021 13:49:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0202176D;
	Mon,  6 Sep 2021 13:48:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0202176D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630928943;
	bh=6aDKCqu7JUaygznso9JGDgn2RHl3/CuxBKHsT/8A0lk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JOcz8Dw/s9flSx068lptw6hAdy3GSZBaqCRXHrPan39xOJrznflywG76S/Ef+OiYG
	 1VMhZanCYntsvWgWIHUaAtUGs2bNAUdBsLrltTDbFjHAS/qJzqcfwbpj/WHN6KiHyB
	 yTSF5Ig4GooKColNpy8rCr0IUDYIdDxWIWxKnAMg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23427F800B5;
	Mon,  6 Sep 2021 13:47:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 575BFF802E7; Mon,  6 Sep 2021 13:47:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EA59BF8014D
 for <alsa-devel@alsa-project.org>; Mon,  6 Sep 2021 13:47:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA59BF8014D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GCIGLnFO"
Received: by mail.kernel.org (Postfix) with ESMTPSA id C39FC60F14;
 Mon,  6 Sep 2021 11:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630928856;
 bh=6aDKCqu7JUaygznso9JGDgn2RHl3/CuxBKHsT/8A0lk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GCIGLnFO443t/wH9KJX7gxqLZ/AsJXnCQeOdnOvRaq7CiFd7g0bIgyW+MbtaUM3Wr
 +sxyua/eKGw5Sfq4WoOKHmmesRwMGddAp3FjvdsSwSzQ05eF0aS2l6Q/l5C/7vNG+5
 OYWPmzJbTspXA5CBPo4BY42TShaJN/bN1FyZfl2i/qCiqxXNMkuHMGPDJNrVINtYpU
 WMGk4ssNYLLwZriGXW9Fn8nxoxJc+XpcHR06q8YTYE+SBWdDATYCV/TujPKtm++atD
 GoxWhlRTdZ1RDI+I7yV/AUllx0E4hIU0oKXJaFwYDAp7CD0NnxJLCc08haFk7Pu/XL
 C3f3MXG+u8tPQ==
Date: Mon, 6 Sep 2021 12:47:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH for-5.15 0/5] ASoC: fsl: register platform component
 before registering cpu dai
Message-ID: <20210906114701.GC4309@sirena.org.uk>
References: <1630665006-31437-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vOmOzSkFvhd7u8Ms"
Content-Disposition: inline
In-Reply-To: <1630665006-31437-1-git-send-email-shengjiu.wang@nxp.com>
X-Cookie: I smell a RANCID CORN DOG!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, nicoleotsuka@gmail.com,
 festevam@gmail.com, linux-kernel@vger.kernel.org
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


--vOmOzSkFvhd7u8Ms
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 03, 2021 at 06:30:01PM +0800, Shengjiu Wang wrote:

> There is no defer probe when adding platform component to
> snd_soc_pcm_runtime(rtd), the code is in snd_soc_add_pcm_runtime()

...

> So if the platform component is not ready at that time, then the
> sound card still registered successfully, but platform component
> is empty, the sound card can't be used.

This sounds like a bug which should be fixed there?

--vOmOzSkFvhd7u8Ms
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmE1/7QACgkQJNaLcl1U
h9A2PQf+MXqqe36AsD9bn8IpQ83/IyczIGKq7d94luUncaivHbSF3i18scHq2SrW
d1wUCYn+J0TbavlsquPzmuuFzGVQ8B0I0mWvqfLvcCOboaEce6os/pgXqxJKctqd
XimllKcJFViLzssrsJG1q2XHCwXw1mj9clwKXZ6iOjQxtTN5GqFEBdQd14hy+Zod
wKhPoCb87qO/ngT6iSwVqGoET5xip9q4WkeeO5QCTCcTyW1Mc4YbuV9dnqV2DjQ0
9rW4xZ0xA1ZbLekeaYzqChqmYyWxn0RGdVa/wiyDXPS0I/FaYJAJ6xkD0VvyYF6E
ObuvLN4+E7wgeufVxAeSwXbORT6/uA==
=PvOc
-----END PGP SIGNATURE-----

--vOmOzSkFvhd7u8Ms--
