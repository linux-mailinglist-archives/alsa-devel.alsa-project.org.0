Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 459083D3C64
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Jul 2021 17:25:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5CF01743;
	Fri, 23 Jul 2021 17:24:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5CF01743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627053944;
	bh=SZPewBRQJZCojWC9vM1jkHzk7FV+fphq0zntMxmhJzc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=psS5Sx/WAaJ0sGtqJID8wpQIyKPegP8VBiQNPGtUKPC0sBRAuymlmxuzjr8I0gQ0u
	 OOf5d6IJRfrbeDlQPxyHp5KNH2BTPbbzvUGqnJvzwxPaZ2GR6QsgOv457VfsNNFVpo
	 W56G1qrXW9qeo17pRZdxPLm7P1SjZSpW6HGbuQcQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53AA7F804AD;
	Fri, 23 Jul 2021 17:24:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45B3AF804AB; Fri, 23 Jul 2021 17:24:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7F6DF800DA
 for <alsa-devel@alsa-project.org>; Fri, 23 Jul 2021 17:24:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7F6DF800DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="HaIkDedA"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1073E60EFD;
 Fri, 23 Jul 2021 15:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627053851;
 bh=SZPewBRQJZCojWC9vM1jkHzk7FV+fphq0zntMxmhJzc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HaIkDedAtDCZljuTL7JA30QSgh2NdLwwF6ylOSfdGVrSOAR2l2ogTktTgnB6ZA5k5
 TL01S4GvsUQRNDV9qVxHSuFXtXvA6CStDbP/xA3cT7S4nd4XvBmiNQoA7MSodobUDE
 VClN8jjuAVEpciJ8n0BUNaPmpBkdnTaJnGZBo1xu/2x5zKvWA0jXi9UlxDzHuqOOKq
 4OHk92aIe4wPIBSJreuY/vz8YAlWONNJOlkbyYgNp2dcrC/vYQYxdu5lSuII/NmoOc
 CEwNNPJMhi/eBswekTbT40+cYmoWq/PQ+kPDg3oLjvq+v+5NuyLN8U8Mt+MZY4mmiC
 4x5UrwbtQ/iOQ==
Date: Fri, 23 Jul 2021 16:24:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: dapm: Revert "use component prefix when checking
 widget names"
Message-ID: <20210723152403.GH5221@sirena.org.uk>
References: <20210703125034.24655-1-rf@opensource.cirrus.com>
 <20210705165041.GC4574@sirena.org.uk>
 <a882a9e0-db05-2f89-abb9-8b308ccb56c8@opensource.cirrus.com>
 <1952b7f0-3c0a-faa4-8a1b-1a8bc4fff473@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qVHblb/y9DPlgkHs"
Content-Disposition: inline
In-Reply-To: <1952b7f0-3c0a-faa4-8a1b-1a8bc4fff473@opensource.cirrus.com>
X-Cookie: Integrity has no need for rules.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Lucas Tanure <tanureal@opensource.cirrus.com>,
 patches@opensource.cirrus.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, shumingf@realtek.com,
 rander.wang@linux.intel.com
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


--qVHblb/y9DPlgkHs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 23, 2021 at 04:17:26PM +0100, Richard Fitzgerald wrote:
> On 22/07/2021 10:55, Richard Fitzgerald wrote:
> > On 05/07/2021 17:50, Mark Brown wrote:

> > I don't mind if someone wants to change the core dapm functions if that
> > is generally useful, providing that it also updates all callers of those
> > functions to still work.

> > Changing the behaviour of core code to fix the Realtek driver without
> > updating other callers of those functions is a problem.

> Just to point out this is breaking stuff right now. It's not just
> theoretical.

You took several weeks to respond to my review comment, I'm sure you can
cope with waiting a day or two for a response to your followup (which
I'm having trouble understanding TBH).  It would probably help if you
could specifically identify the problem you are seeing and where you're
seeing it - as I said in my review comment there appears to be a
misconception about how the APIs are expected to work.

--qVHblb/y9DPlgkHs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmD63xMACgkQJNaLcl1U
h9C3Hwf+Mcep2J6MgGpHOIe7hbta2Wm+ZNc4j3NpK2rdi8GcR2+9+OMw6u2MlAug
CWVjXEZQE3JwjWAE5HXye+zYA60oC8I4PhzAJFRN/CIGbyzc8yJwgJe0KN6w66is
Op+sAyI8efowRSx4GdkLTZLrTVuNCwVz8pj0IWmgSXoGVA5sCviAnN5m+kii/jFP
xfCbdOdMuxImE5HEC8g+XlCovLmkqs6cqN1df/Pt4OWra0RbOeCbXmSfS7U0ZL3I
EeTCgDKYXNrvTg3tkGnsdD11jlauSnjHlfOtubX8MjXHGwBwowEBw/rQb0D01Cqn
X2u4h/iExKTaE1K60DNx/HUpW/ijGA==
=rpD2
-----END PGP SIGNATURE-----

--qVHblb/y9DPlgkHs--
