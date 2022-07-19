Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC6A579779
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Jul 2022 12:18:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED36416CB;
	Tue, 19 Jul 2022 12:17:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED36416CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658225907;
	bh=oqP/Xh2tpjQDFtuqBkRGg45SMZ6PZlX0tyfAB133gG8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uolS/URg/XgVn269drxuB1NpttDB2SzRctUvymCC2revtxQrD1mWdPJ/XEOMDyIPZ
	 xieakj1at3nkPC8o3+nL0WaZcwTO7FKSHQ/kXgPPbjlxvX5G8VG71whIAMtohL5DIG
	 W2boxXqsbIO9yFXYbsbQ90v+R9qYA5l6YYF0rsJA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A38DF80224;
	Tue, 19 Jul 2022 12:17:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50DAFF801EC; Tue, 19 Jul 2022 12:17:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21E78F80118
 for <alsa-devel@alsa-project.org>; Tue, 19 Jul 2022 12:17:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21E78F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="HNiTzVqG"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C49E5B81A99;
 Tue, 19 Jul 2022 10:17:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3A61C341C6;
 Tue, 19 Jul 2022 10:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658225835;
 bh=oqP/Xh2tpjQDFtuqBkRGg45SMZ6PZlX0tyfAB133gG8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HNiTzVqGEMb0m3WuaWF2J8hrKZG9/NUMZF0EjjtFOmnPHvy+0SUejkjyauU/WhEKX
 Q6eTE1ZZK21BRLYD+WQvlCfqtKwD0BLgjXM09FnbooacQqKeR21+aHtI5s5N/2te8f
 LBwFeqCOXFo6rGwCZtQUle0JmUYolWZLmnOTTQs7rlFSJjix8NRQ12IpAjXtB317N8
 dMCxzp9kaDnAe+LYaipi783nt/+kODAQR58rb1JzpCS7mR6mV27bpGRj4l754z50C8
 AvKB3XQa8irExShPCo3OYdiMez9cA7Gbs6jgagauQbJbWiBMCRWFRWRNmW6U2rjPzo
 V/ByuOXK9SeCQ==
Date: Tue, 19 Jul 2022 11:17:09 +0100
From: Mark Brown <broonie@kernel.org>
To: David Laight <David.Laight@aculab.com>
Subject: Re: [PATCH -next 2/5] ASoC: fsl_asrc: force cast the asrc_format type
Message-ID: <YtaEpf6Cd7KH7wH4@sirena.org.uk>
References: <1658222864-25378-1-git-send-email-shengjiu.wang@nxp.com>
 <1658222864-25378-3-git-send-email-shengjiu.wang@nxp.com>
 <f2609401c8834e8bbe926200bfc87971@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="LFRJZB4yNeG2Q0Le"
Content-Disposition: inline
In-Reply-To: <f2609401c8834e8bbe926200bfc87971@AcuMS.aculab.com>
X-Cookie: We have ears, earther...FOUR OF THEM!
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "shengjiu.wang@gmail.com" <shengjiu.wang@gmail.com>,
 'Shengjiu Wang' <shengjiu.wang@nxp.com>, "tiwai@suse.com" <tiwai@suse.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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


--LFRJZB4yNeG2Q0Le
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 19, 2022 at 10:01:54AM +0000, David Laight wrote:
> From: Shengjiu Wang

> > -	ret = of_property_read_u32(np, "fsl,asrc-format", &asrc->asrc_format);
> > +	ret = of_property_read_u32(np, "fsl,asrc-format", (u32 *)&asrc->asrc_format);

> Ugg, you really shouldn't need to do that.
> It means that something is badly wrong somewhere.
> Casting pointers to integer types is just asking for a bug.

That's casting one pointer type to another pointer type.

--LFRJZB4yNeG2Q0Le
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLWhKQACgkQJNaLcl1U
h9BPlgf+JGVf/ji4pgeN+BGwYdDo93frPQL5cU/EaCnDYcwQa1TAfhLTCpDrCsui
StpSb2FMjgupXLjNy3oQfKO4tNg6xc65g5EjKLp3yYOoqx9AZPpZc7jt6FxA2tKo
UBKw6FlfQALG7nEGPFIpTNHJUh/dzi4f8oHH7KTPgRZzFSxshjeWi6cMcOS2TPa1
tEqbOywPpR9d30/vRLa6bjUOCRw07PpHcAg2AcHawKHc6rtq7BHKU7GQavNFj7pK
MIRBHFc80by53rkgR6ebwloSVluV0cJv7TIMY8U5kginz5yypS+GVNNzq2m6S+lI
lKjTbNKherzmaXwg+nnCV9Sg1VoaYA==
=Ewrl
-----END PGP SIGNATURE-----

--LFRJZB4yNeG2Q0Le--
