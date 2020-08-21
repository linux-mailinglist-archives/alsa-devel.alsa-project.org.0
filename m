Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1099224D475
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 13:50:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 869711687;
	Fri, 21 Aug 2020 13:49:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 869711687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598010606;
	bh=Mf4nEuCCfFrSmxx0U2qLL0U3c8Gd0CBPiRIMYS2v0QU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aOtqHO/oolHcfJK3HXwISJhoNdM57kvZ9TpjZGIjuvXGVswVWOP+5iPZYNhpIhxx8
	 HNfxZa9yQlwEHBxofraQI86fQJxmFY42VTfP7/OPeRgtRuGd0bnKfGxt+vrY4v0rbL
	 G+rQtva+XOxfskbmvtOwA1bo9N51MZOoz/UfVfgo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92C3CF800D3;
	Fri, 21 Aug 2020 13:48:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B735FF80218; Fri, 21 Aug 2020 13:48:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 982E9F800D3
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 13:48:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 982E9F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="gYirXbcj"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 30357204EC;
 Fri, 21 Aug 2020 11:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598010489;
 bh=Mf4nEuCCfFrSmxx0U2qLL0U3c8Gd0CBPiRIMYS2v0QU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gYirXbcjD1r6AQs5kexWu86DAm3Ip6ybEloQlUSHtVIMnRYRubvcScfLTxqWfRZYn
 KGDnGNJ14csOiWG06WT/XyQ8lYxOVFF7dTl/MBHFEGnx7UrjWrzCOKDXSjWLfSVoGh
 COWpNKfB+GOPQfbQusUv/fVJvuGQ3N7a96Z8CH6g=
Date: Fri, 21 Aug 2020 12:47:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: More Generic Audio Graph Sound Card idea
Message-ID: <20200821114736.GD4870@sirena.org.uk>
References: <87k0xszlep.wl-kuninori.morimoto.gx@renesas.com>
 <CAEnQRZCsy+QiMpCCRPNF-BUcjaT+UVE2B_a6Bd48f8tRqXTpOA@mail.gmail.com>
 <87h7swzclq.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="T7mxYSe680VjQnyC"
Content-Disposition: inline
In-Reply-To: <87h7swzclq.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: divorce, n:
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Daniel Baluta <daniel.baluta@gmail.com>, Sameer Pujar <spujar@nvidia.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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


--T7mxYSe680VjQnyC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 21, 2020 at 04:25:53PM +0900, Kuninori Morimoto wrote:

> I'm not sure we need to update simple-audio, too > Mark ?

I think it's fine to not update simple-audio-card for new stuff, new
things are supposed to be using the graph card anyway.

--T7mxYSe680VjQnyC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8/tFcACgkQJNaLcl1U
h9BzuQf/cNhMoIV/n1f2rsPF933QLzGg9Y5W4++lzelU+tKbLC4ZebtMnwgpVxGN
VZ3Yz8wfy14ZO9GllKIbYhkR70l2wztDxr966sBK/mCQ6X28CvMhymod2Ng9w9Mp
4YVyMggTrfSCsW8tPqn/gNd0ECMnQYEokoXtzz1SuzIULVbEjxnXPODWC2oxTWiE
uMhRd0idsgBdLR5WUxTsmrwTT22zM83AeKFVUUkvaibp0cbOIb3ju0ENrGqCMsV3
ZjdcpG5nBXf/a42ddYS+TeiWuvQNgr2p3F+RnJFnTL6yPf+aYgcsVGpwOUXxQvPS
QtVCLtrJTPM1ft7PhXGTqZI2NRVLNQ==
=Z0oX
-----END PGP SIGNATURE-----

--T7mxYSe680VjQnyC--
