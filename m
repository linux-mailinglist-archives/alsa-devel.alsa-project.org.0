Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC20355BC46
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jun 2022 00:24:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 255411650;
	Tue, 28 Jun 2022 00:23:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 255411650
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656368686;
	bh=hfW1R7g9hMtpRypFz3CWGKi8T7sb6RDtKvbjkBuRv+U=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lg6r2Za+GhFB52Oz06I3VMCCq+Ot6Ani16gUZs9V0s6NBRfkajvpJOBVPRnZhWSP5
	 BK3MwDLhB+xLJgbeBgsfCrdKAUYIaPLXWYGRauxk1ZuSn1vX6Werj47idNx0pIuEol
	 2JzqAhsu3L8rqf8AEGK8j8D5Vt9CsxCNRwvUhbsc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5EEFCF800E9;
	Tue, 28 Jun 2022 00:23:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08F9DF8028B; Tue, 28 Jun 2022 00:23:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ACDCBF800E9
 for <alsa-devel@alsa-project.org>; Tue, 28 Jun 2022 00:23:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACDCBF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="NeoN1lcd"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1C132613F9;
 Mon, 27 Jun 2022 22:23:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 968C7C34115;
 Mon, 27 Jun 2022 22:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656368619;
 bh=hfW1R7g9hMtpRypFz3CWGKi8T7sb6RDtKvbjkBuRv+U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NeoN1lcdtu4I69R8NpPKjxA+ATVrzCajy0VW6KNAUHUukau6Svtz5LD03rf1Z0hk2
 5oW2nKsOf5+Kqtd9E1LRlxwxbXSu+waqtdVGZp6iSbD63+4n8a6e9kTIR7PuB1lC3o
 W7FG4HyjVulb2i2mgrQrblzK0PSpf8sqkUEMIJMYofny1BezvTRO4L3713nmdy/soi
 rViWUZvoHst7OYXYn9Y9aRGBN+FFwKO3jD2WEfX181zzeWP3om1OWVHCrY+Gh9zdlr
 alDidw+zrQ2uV/bYpyB/RySrNFU/akEbp//SEEGCSWlYHRvykzdrR/fOfYjvFqIQUR
 P+xOAOwq7rg+w==
Date: Mon, 27 Jun 2022 23:23:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Daniel Mack <daniel@zonque.org>
Subject: Re: (subset) [PATCH 0/8] ASoC: max98396: Some assorted fixes and
 additions
Message-ID: <Yrot5+S1nPIF66Cn@sirena.org.uk>
References: <20220624104712.1934484-1-daniel@zonque.org>
 <165636115333.3997797.6298161546515778991.b4-ty@kernel.org>
 <b59afe57-7608-f049-c075-1a95d65984c4@zonque.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="K0qSPhrMW6MUNYT+"
Content-Disposition: inline
In-Reply-To: <b59afe57-7608-f049-c075-1a95d65984c4@zonque.org>
X-Cookie: Your supervisor is thinking about you.
Cc: devicetree@vger.kernel.org, ryan.lee.analog@gmail.com, robh+dt@kernel.org,
 alsa-devel@alsa-project.org
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


--K0qSPhrMW6MUNYT+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 27, 2022 at 10:26:41PM +0200, Daniel Mack wrote:

> Umm, I was about to send out a new version of this series tomorrow to
> address the things you pointed out, and some more detected by the test bots.

> Which patches got applied now? I only see "Fix register access for PCM
> format settings" in for-next and for-5.19 currently?

Yes, the bugfix:

> > [1/8] ASoC: dt-bindings: max98396: add voltage supplies
> >       (no commit info)
> > [2/8] ASoC: dt-bindings: max98396: Add #sound-dai-cells
> >       (no commit info)
> > [3/8] ASoC: dt-bindings: max98396: Document adi,bypass-slot-no
> >       (no commit info)
> > [4/8] ASoC: max98396: add voltage regulators
> >       (no commit info)
> > [5/8] ASoC: max98396: Improve some error prints
> >       (no commit info)
> > [6/8] ASoC: max98396: Fix register access for PCM format settings
> >       commit: cf5c888539f353cb10e127d3a8754554cacd293a
> > [7/8] ASoC: max98396: Implement DSP speaker monitor
> >       (no commit info)

it's the only one listed here too.

--K0qSPhrMW6MUNYT+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmK6LeYACgkQJNaLcl1U
h9CJcAf/UuFobsVtuIagiJULvdETzWOrXop+AEvWirtZvinUQGpjV6spQxBipSPy
J64H2pug5WIPlbx87k9rsB465JM+DMve/fnVMJlc26WfUBCvgyqQBO0RXGKjulYQ
rqCaHpkSTtprYnMPnN+WVmzVaGnd/5RsCFs8n4/s8U+GcvFtjuTrIdhwUBnwN8r5
KCXOmX3yurgnwypsNl6Emz3HbUoS2HLUMuHcRu53GIldam5x+WBX4rVhRScY2bXl
tSj+NNsHycx4HJSQYmOhTAB1QMeICPxyGvKfKGNbDC1gHnVNYXHD7+mn6rzKbbjY
1L58+aqpSUeAjFu8vP5ruJE1ZSWkeQ==
=/Au6
-----END PGP SIGNATURE-----

--K0qSPhrMW6MUNYT+--
