Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EAA1369762
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Apr 2021 18:48:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB0DD16DC;
	Fri, 23 Apr 2021 18:47:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB0DD16DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619196504;
	bh=hrqrADAEzMFpkpMJhB8rj4N/o1LglX/44krbouGR8yg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DTsdhYLlHQOppdNVsQzfSJGtL1+mRSGaeF6sEDZAf9xwz5db68IsIOFQ0uVZz5DFv
	 pQdHr/TE4GcW8von0iTi+U5zRmShpkNu4HpVRB+1XSyR8WVkwcP5AwfW24KP30YRj3
	 4TXBhv8CLlwkUHEoEUJxtqqk6qSGZlWy0TE3yTyc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3413AF80256;
	Fri, 23 Apr 2021 18:46:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC74BF80227; Fri, 23 Apr 2021 18:46:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6735BF80117
 for <alsa-devel@alsa-project.org>; Fri, 23 Apr 2021 18:46:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6735BF80117
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="a+sdGTYK"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1783960FE6;
 Fri, 23 Apr 2021 16:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619196406;
 bh=hrqrADAEzMFpkpMJhB8rj4N/o1LglX/44krbouGR8yg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a+sdGTYK4aj9yDFncbICtCZWbqNeYXUw5nC+SdTJCCCyoZqQqXwfDB8l2K7bRr8UY
 N9rPkMalrUus9Y9lNssS0lW+IZVFqANoT+wr7iCqbGRjpQTsvhjSEfUUYH2T8Dk+q/
 Vc9DaR4qdj27qevhjdNdeuEUfyut+yz+SvHrfEp2ga+yla2IpizWu1S9lqpABvVYDw
 rtvS06aBSxaVeqOsQI9W4SvsqhycdtxdsdWs8Jr03n7PAs/kQ5pPfKlS4pmJasKZW/
 UVeXB9zBT81Rwoy/ANVYkarIIqSRRkjyrsORkgVSXFusR4QUf18npK86dcLJHMs+21
 UoG0KPu8vhFDA==
Date: Fri, 23 Apr 2021 17:46:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH 1/2] ASoC: dwc: add a quirk DW_I2S_QUIRK_STOP_ON_SHUTDOWN
 to dwc driver
Message-ID: <20210423164617.GG5507@sirena.org.uk>
References: <1619195089-29710-1-git-send-email-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="PpAOPzA3dXsRhoo+"
Content-Disposition: inline
In-Reply-To: <1619195089-29710-1-git-send-email-Vijendar.Mukunda@amd.com>
X-Cookie: This is now.  Later is later.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Sunil-kumar.Dommati@amd.com,
 amistry@google.com, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 Basavaraj.Hiregoudar@amd.com, Takashi Iwai <tiwai@suse.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Alexander.Deucher@amd.com,
 =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@gmail.com>,
 nartemiev@google.com
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


--PpAOPzA3dXsRhoo+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 23, 2021 at 09:54:38PM +0530, Vijendar Mukunda wrote:

> For CZ/StoneyRidge platforms, ACP DMA between ACP SRAM and
> I2S FIFO should be stopped before stopping I2S Controller DMA.

> When DMA is progressing and stop request received, while DMA transfer
> ongoing between ACP SRAM and I2S FIFO, Stopping I2S DMA prior to ACP DMA
> stop resulting DMA Channel stop failure.

This again...  copying in Peter for the sequencing discussion.  If we
need to do this I'm not convinced that bodging it in the driver is a
good idea, and especially not deferring it outside of the trigger
operation - for example on a suspend or pause we won't actually do a
shutdown() so the trigger will end up not happening which seems like it
may cause problems.  We'd probably be better off with the core knowing
what's going on and being able to reorder the callbacks although
designing an interface for that seems a bit annoying.

> This issue can't be fixed in ACP DMA driver due to design constraint.

What is the design constraint here - can't we fix the design?  Or is it
a hardware design constraint (presumably broken signalling between the
I2S and DMA blocks)?

--PpAOPzA3dXsRhoo+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCC+dkACgkQJNaLcl1U
h9BDTgf/e98lodiz8JAhBWlgb4e/N5kUc+JkS6Q8iz5kFGIG96PawL0jUcldx5Wx
dml7h0vBjDgBrkgFQ09HQ3nzoyJdVHRa6zqdvCt3af4u2YcpkUb8u7ljoSJJLdDK
yXQ4ROt1rC0MKrsVKzHqitiIMo8oSEl2F0Vs4aHLUUof6I3w7qhSSD1VVkGuh36U
yJ8JTwaCeKtkXDbth333kbaW7a8biVgUFFprtMzrpoeVH9A9p4CCjH0i+uPwB6cl
BX4HoHkoCdzHaisZsNob8MjjykSvoBGVtuKsquEpT+R5PkPRMuGcOYDW1FMJ5FrQ
GKwU1bfjUALew8t7yMnnhDZA9SASKg==
=025N
-----END PGP SIGNATURE-----

--PpAOPzA3dXsRhoo+--
