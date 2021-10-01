Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 779AB41F19A
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Oct 2021 17:56:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1854416DA;
	Fri,  1 Oct 2021 17:55:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1854416DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633103796;
	bh=h8ENFER7tQZO2LJbbX6iLbyePDZ+FG4g73AnEQsjPvk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I1qHuUCRs3SxeEU5nT4E8TZmEYZOieKFMtmtVq60fYxao4Ur59RnlEPFGRTOngElA
	 13M9aDj0e23r3SiUvvdj5/wEtii31jOTZKEpbwg8WiJEc/x9RHFJ6uTqDiQiQyQ95f
	 ajqPF1BTUNQslnFBYK0rnH8Ei3stxISaqHxrKy60=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AAF7FF80165;
	Fri,  1 Oct 2021 17:55:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0071AF80165; Fri,  1 Oct 2021 17:55:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55E6EF80165
 for <alsa-devel@alsa-project.org>; Fri,  1 Oct 2021 17:55:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55E6EF80165
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lGFoo1TR"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8C49261ABE;
 Fri,  1 Oct 2021 15:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633103712;
 bh=h8ENFER7tQZO2LJbbX6iLbyePDZ+FG4g73AnEQsjPvk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lGFoo1TR8TS02Tuzde8z81JZXsJvF2xaeImkTWdt895YoJzCXlIwWqSTSMPbSa+qP
 XuCbproLyuAg5mZuw1OPX335IyLO+XmzcbCqyZ7zcrVBeMMGNAGiQPgbb8j4gcx+ua
 U2iwY19WlJkl/6qIf/qaFDzFQpl6vC+Fa1TFB+aOz/z7BAVlkktPCsCHGwPHRz02zO
 FdKlu/pU1Cf7KRX6J8duq3vOZrv80dcoDV5WIRhhlctAqe30HIfyCchJuwtpb+SO9J
 WhD0kxkJrcuiKvaO1ztZpJWcAI/a5wehbQsbPdNHwLbkgOELeNG3rNurDmbPg4eVqy
 Fqe+v8OSxUr8Q==
Date: Fri, 1 Oct 2021 16:54:21 +0100
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: hda-stream: limit PROCEN workaround
Message-ID: <20211001155421.GA33031@sirena.org.uk>
References: <20210928082248.6081-1-peter.ujfalusi@linux.intel.com>
 <20210928151012.GA25932@sirena.org.uk>
 <795a1c96-c4b5-a364-e192-58358c90d5de@linux.intel.com>
 <f28fb37c-a4ed-446c-90ba-d6124caa89b1@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="IS0zKkzwUGydFO0o"
Content-Disposition: inline
In-Reply-To: <f28fb37c-a4ed-446c-90ba-d6124caa89b1@linux.intel.com>
X-Cookie: Where do you think you're going today?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com, lgirdwood@gmail.com,
 ranjani.sridharan@linux.intel.com, rander.wang@intel.com
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


--IS0zKkzwUGydFO0o
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 01, 2021 at 08:58:28AM +0300, P=E9ter Ujfalusi wrote:

> Sorry about that.

> I'm going to script this from now.

No worries.  BTW while you're at scripting this I'd suggest looking at
signing your patches with patatt/b4 attest, it's pretty trivial to
integrate into the flow.

--IS0zKkzwUGydFO0o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFXLywACgkQJNaLcl1U
h9BouAf+I7gBUkKheupST2+oVDUv43LXxydtdPLgiSFVwOiZXb4M0QceRVI/KiQe
/pUFS1Zz55XPytwUGktN2RvriBuJQcIuLM651Kn91REyimxB2WxqrSo4hBqIeLzL
wn2Q2fHdtyh6qXv6MfNPxkM70tRSyL4mDWAxXggVIeFVA1IYEostm+AyW42DAGF+
m25JgR5eUgLU3xNeEeIDNvbL5VcSz9NCvXJGG5fHGsFxArjIA3TuzgqCnCtgv+hq
CDW6kY1Bm/kIviiLIyzsDS3oKz1YMbKCAFk2l3RlMm6m7hvscV2tjsT46rLxJMXV
xShwaPT/bTKH0lg51cGnW1Dw+FAKsg==
=1TeV
-----END PGP SIGNATURE-----

--IS0zKkzwUGydFO0o--
