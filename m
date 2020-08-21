Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE43F24D4D3
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 14:21:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5AE8F1689;
	Fri, 21 Aug 2020 14:20:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5AE8F1689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598012469;
	bh=mQ1hv+AwijnZGPh/O/1Xm92YOvPAB1PWPbr2CRnnio8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YsxIZgGg9eomb4s0XrUxwnjUmu3cybRLndObYLpNPr8h3p/+Ph9EE/+VZ6jvRpX6w
	 pL1a4oRdwF2xjqSGQPiIXdJzzI2vmFfpChlI+Pa19eUx4wt3bHVv8e/QbRTBkKYL7b
	 gOP6wkio0S0GhIvX8HFz7paito5QcvfLXVFv0An8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7AFB0F80253;
	Fri, 21 Aug 2020 14:19:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 055FCF80218; Fri, 21 Aug 2020 14:19:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8511DF800D3
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 14:19:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8511DF800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="sc+twMc+"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 991D020724;
 Fri, 21 Aug 2020 12:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598012357;
 bh=mQ1hv+AwijnZGPh/O/1Xm92YOvPAB1PWPbr2CRnnio8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sc+twMc+TEz/a2qBNT+l00XqltAvFPrGEJbnR4CyCNjYn9sY4DchBddc4qgIzByD9
 zfMwP1ODhRmgei6YpWD/RaMiEsGBDMOSBDfUrMdKpvBgoHJ1UuFmjBrghtCvF44NGs
 qSRwsk76nmBopa4HW0cQ0qnjAOD1VLlrsmJjdZKE=
Date: Fri, 21 Aug 2020 13:18:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: More Generic Audio Graph Sound Card idea
Message-ID: <20200821121844.GF4870@sirena.org.uk>
References: <87k0xszlep.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="FeAIMMcddNRN4P4/"
Content-Disposition: inline
In-Reply-To: <87k0xszlep.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: divorce, n:
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Sameer Pujar <spujar@nvidia.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>
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


--FeAIMMcddNRN4P4/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 21, 2020 at 01:15:41PM +0900, Kuninori Morimoto wrote:

> I'm thinking below style as new audio-graph-card2.
> It is not tricky, thus connection judgement for normal vs DSP is easy.
> Then, code can be more readable (=3D no guaranty :P) ?

Having an audio-graph-card2 isn't ideal but may be required at least
during development :/  Ideally we'd be able to have the new driver parse
both binding formats (or rather, have the new binding format be new use
cases for the same binding format) and only use -card2 while it's in
development.

>   | Front End PCMs    |  SoC DSP  | Back End DAIs | Audio devices |
>  =20
>                       *************
>   PCM0 <------------> *           * <----DAI0-----> Codec Headset
>                       *           *
>   PCM1 <------------> *           * <----DAI1-----> Codec Speakers
>                       *   DSP     *
>   PCM2 <------------> *           * <----DAI2-----> MODEM
>                       *           *
>   PCM3 <------------> *           * <----DAI3-----> BT
>                       *           *
>                       *           * <----DAI4-----> DMIC
>                       *           *
>                       *           * <----DAI5-----> FM
>                       *************

I think your plan with this explicit representation of the DSP is where
we want to get to, the issue is mapping this onto DPCM as it currently
stands.  The binding you proposed underneath looked sensible on first
readthrough.

--FeAIMMcddNRN4P4/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8/u6MACgkQJNaLcl1U
h9CR9Qf/RHMoOhZPwK+uJ6yqYU0P/a2VoSq5B4ForZZGXtpSPbGoo+rbD3PQG5Xv
/ZXvASHFGWH6cqL6wg3FFWA3MNPpvEgRbsqKpgrbTZ159UeOE2Jy2xhn2zWJNc4P
7/l1tScURe+cWtHsXycFJj3MVtsFFjgBiDMK1OPUyt4wosZ8tJ4caKPerY141yFh
WeadSY/b7qVyL7PwdH2KcbiAAf221iAiDGZym1tKeJp8nQjoFINwsyLGFPzJDYR2
dVhj4IsAfnKUzGRIzaeVR3UQBGa2XC7X0pMUAxz4E4qPqR5gzdqGYbIDjRTpXrJS
I9Ka/K3S8NcRSvOCFu3GA4i53pB4Cw==
=RMya
-----END PGP SIGNATURE-----

--FeAIMMcddNRN4P4/--
