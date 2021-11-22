Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A3645904E
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Nov 2021 15:34:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1D5D112;
	Mon, 22 Nov 2021 15:34:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1D5D112
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637591691;
	bh=HQ/rBtmshuw/WiM8hjphmiy6FIeophJG9i6cPEOi804=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NmDlSIHLeQ2RfBgn4CuwFoz5G/db+0ZCN/qvB7620G9Ulflr6D/1E7gS8QQDCUYh/
	 XQ7qpDZ6EZWNpcIPQ/TTru1njU4x5xEb9hgE4v8DzkVTYq2atM7RE8y7KpHEovzbCN
	 4HHqT8+7pf/CyMCZNxu/Ved8Dw+hpfxjdgBe1qd0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21A04F800E7;
	Mon, 22 Nov 2021 15:33:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D90E4F80212; Mon, 22 Nov 2021 15:33:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8D61F800E7
 for <alsa-devel@alsa-project.org>; Mon, 22 Nov 2021 15:33:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8D61F800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="S/HpMvWY"
Received: by mail.kernel.org (Postfix) with ESMTPSA id C771A60249;
 Mon, 22 Nov 2021 14:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637591596;
 bh=HQ/rBtmshuw/WiM8hjphmiy6FIeophJG9i6cPEOi804=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S/HpMvWYEpjtGsN1Av5DUevXs3i6X9x1C+k8KKFVfrN81LQrd3pCbmuawx9aQ44Ab
 joW26hfLnlIc1AO9gfbU/MAEGu1QCVZfNgOnWlTji3u3Qd71tMp4oFHUmqnDYoL5kj
 my45BtSYWYsaJXzhD7AgrsCz7REdbPbkQxvXj4ilC0aZGCDcavb2O3H//IJxQ9Hi3y
 s+yWkr2fgbS5fJAbZjZO6UaH0iP0TF5mICfk1XzoCW3LkHK4yf8vnsE1KNpYa5UVN8
 p/Poe211EAor7LspS77bzWR1eOnNilutb45uyp1FVCrVgRntbjTNTf8yGvgnvSCKYV
 AJn68i0LNIZeg==
Date: Mon, 22 Nov 2021 14:33:10 +0000
From: Mark Brown <broonie@kernel.org>
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Subject: Re: [RFC patch 2/5] ASoC: tlv320aic31xx: Add support for pll_r
 coefficient
Message-ID: <YZuqJiZznMfqmWR7@sirena.org.uk>
References: <20211119153248.419802-1-ariel.dalessandro@collabora.com>
 <20211119153248.419802-3-ariel.dalessandro@collabora.com>
 <YZunmnHqemZRJ6JK@sirena.org.uk>
 <CAOf5uwnrUdF4fOVGvp8GmuUL6SpsyjPq46WBP7hcY7bYbw7RHA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="1RMo0WyMSz1lb9Z2"
Content-Disposition: inline
In-Reply-To: <CAOf5uwnrUdF4fOVGvp8GmuUL6SpsyjPq46WBP7hcY7bYbw7RHA@mail.gmail.com>
X-Cookie: Lake Erie died for your sins.
Cc: bkylerussell@gmail.com, lgirdwood@gmail.com,
 Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
 kuninori.morimoto.gx@renesas.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 shengjiu.wang@gmail.com, tiwai@suse.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, nicoleotsuka@gmail.com,
 linuxppc-dev@lists.ozlabs.org
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


--1RMo0WyMSz1lb9Z2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 22, 2021 at 03:24:42PM +0100, Michael Nazzareno Trimarchi wrote:
> On Mon, Nov 22, 2021 at 3:22 PM Mark Brown <broonie@kernel.org> wrote:
> > On Fri, Nov 19, 2021 at 12:32:45PM -0300, Ariel D'Alessandro wrote:

> > > When the clock used by the codec is BCLK, the operation parameters need
> > > to be calculated from input sample rate and format. Low frequency rates
> > > required different r multipliers, in order to achieve a higher PLL
> > > output frequency.

> > > Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> > > Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>

> > Did Michael write this code (in which case there should be a From: from
> > him) or did he work on the code with you?  The signoffs are a little
> > confusing.

> It's fine. We are working together

In such situations it's best to include a Co-developed-by tag to say
what's going on, that makes it clear what's going on.

--1RMo0WyMSz1lb9Z2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGbqiUACgkQJNaLcl1U
h9AvtAf/cw+AV+VDF/3zHrh077dmoGB7oWdCofQf+EMfotDjQb7ln2ohOl5iIL8N
v/VZcOXCABOS0IS8UxhyNAtoa6T8hc2d+vKmxYBjmBAuq4LJ9UaYxIYVYschC4z3
Y/F6cvzPdQG62JFzxh6sOWuPI8u33jDIBhcnjG2i9j5RyxWhZ4bDsDE/qHmxfGnb
UaDdgcb7I/ImZnzxOAoEKq/piUZc3jBTPEpUlw671U/9qxm2ZIu0HuRwutYukUZn
dQKjU3uzK7tTdisZOQjl4XgxgtBJc4Do0D9ZOQ8DLIGyH4x+5ZNKo0S/w6V7x3x8
mBw/kmOkXQEx9gMIuPq2XgmaZ4g1LQ==
=ufg+
-----END PGP SIGNATURE-----

--1RMo0WyMSz1lb9Z2--
