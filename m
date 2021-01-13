Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D442F4F3E
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Jan 2021 16:53:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9802F1727;
	Wed, 13 Jan 2021 16:53:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9802F1727
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610553232;
	bh=q7k3TGI/eq411WQSLCAtz/yGhi4vyahhPoB4r6TRi3s=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oMOq5t5GL7aJ9ZI1gorNO0Mj6PK2hY56ImNA2Qa8ss3kwImC4VF6AbPN8kzbOOb/A
	 myGoAla7BProhxrw1J1Kea/9RfaAh+tBebooCuN9uTP3rhBp4OwjWPZslMuNGkJoy+
	 Kn477J4oziimzaWDpMoNX4sOMYaStTNmvtvCbj18=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3CA7F8014D;
	Wed, 13 Jan 2021 16:52:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2872F801ED; Wed, 13 Jan 2021 16:52:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92DCFF80085
 for <alsa-devel@alsa-project.org>; Wed, 13 Jan 2021 16:52:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92DCFF80085
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="iYtMOaPB"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 809D1233FC;
 Wed, 13 Jan 2021 15:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610553135;
 bh=q7k3TGI/eq411WQSLCAtz/yGhi4vyahhPoB4r6TRi3s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iYtMOaPBls1DYxFjBt3mDEdERuN+4AAeYk8pjtp46ZrVveuXYPKXkvs/Iw0v1c5Uo
 GTa4Efio7Sqg6hyBMGWA6Ku1DsnZXm3A9uQr8v9iOB+h7yhz/HPvcHGP3y68JNjtm8
 pQvws64DztvDBWkhRKHEdQBID8B+Iy6ThTszVu27aVGqzjQXXsnHmUXBOowmcI/xgE
 mNJEj7le3EaJNHOKw0O2RzQLHwGfey5NCPag/yAlpXdqkq0QYU3TE0Kh5dwVB4XM8Q
 sdav1G4M0LjMP+FQEStUJQzCNpAhv1BHxy2OQL+CESBvrq0i8dGbVkYckuhhz1WzR6
 VylOuNbxu4K2A==
Date: Wed, 13 Jan 2021 15:51:41 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v4 3/6] ASoC: audio-graph-card: Support setting component
 plls and sysclks
Message-ID: <20210113155141.GE4641@sirena.org.uk>
References: <20210108160501.7638-1-rf@opensource.cirrus.com>
 <20210108160501.7638-4-rf@opensource.cirrus.com>
 <87y2gzymc5.wl-kuninori.morimoto.gx@renesas.com>
 <762d798c-bd75-e24a-40fd-263f68f1a5f1@opensource.cirrus.com>
 <87czy9r9ue.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="AjmyJqqohANyBN/e"
Content-Disposition: inline
In-Reply-To: <87czy9r9ue.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Ignore previous fortune.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, f.fainelli@gmail.com,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, robh+dt@kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 nsaenzjulienne@suse.de
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


--AjmyJqqohANyBN/e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 13, 2021 at 09:00:19AM +0900, Kuninori Morimoto wrote:

> Ahh, sorry for my unclear comment.
> I think "PLL settings" is very board/platform specific,
> so, adding such code to common driver will be issue in the future.
> This is the reason why I don't want add it to audio-graph-card.

I don't think it's *that* weird, they're a fairly common feature of
devices and in terms of integration aren't particularly different to
sysclks, though this is for more complex CODECs.

--AjmyJqqohANyBN/e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl//FwwACgkQJNaLcl1U
h9CFBAf/Uxyi2fl/ossDgvy6HHNeO5hAZODyWKycY+ozxjsHrifNijcW0bol/c5j
chPhusj8uJnWw7JyIGbDWY3MabdzLB0T+TKANqIYVWaf2yVthuv3xQ43dpNO6qpt
qm2h+bepzSHJUarSWNFTtAgjhU06m97O/fUs1EOjlUt42LA+W/u2e+5ApaNllrpb
WM968+eDlrIyPddtjeSy8eSLDJq9WdxiaCUOqQDEHDEYNSA5YBeohViMyvOCiKxV
REcCisD9EZx0tIjPCFWUpzaKd7Sew6KnpPaopyLwGQi699kzxlqjTCOs+A5drJIo
et9ncrYvRyLx0HN0E4ubWvabQsWZHg==
=7p08
-----END PGP SIGNATURE-----

--AjmyJqqohANyBN/e--
