Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD83D4A62C9
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Feb 2022 18:44:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71F8C1861;
	Tue,  1 Feb 2022 18:43:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71F8C1861
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643737480;
	bh=/KTrZBEyV6pqKGAlc78yl605G1ixk0QNgUXm07ChIdY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WNZkOjoc03w3a7frrxBWY0huSh5MX8WAjfoDHHERsxjJ8nvh08y4xCU0APoZUgC6a
	 2vkgSUanSwJNnsefRU1mg4zBmNvHAS0nvBA8utOJ1EcESa8jJfwZknmD/8H42Xci7I
	 ZBY7iZkcHpq7l15AfaD7uxdJ6QEV+nqJXQXtz/cg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD31DF80311;
	Tue,  1 Feb 2022 18:43:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8C44F80166; Tue,  1 Feb 2022 18:43:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A697BF8012C
 for <alsa-devel@alsa-project.org>; Tue,  1 Feb 2022 18:43:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A697BF8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="kf/99bOH"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 00CB9B82F41;
 Tue,  1 Feb 2022 17:43:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4744DC340EB;
 Tue,  1 Feb 2022 17:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643737406;
 bh=/KTrZBEyV6pqKGAlc78yl605G1ixk0QNgUXm07ChIdY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kf/99bOHt2NDqSRfO1wtMreMxosFlJLwM1bhGE4KJa6PBZ3panCiFVaWt2ZXgNrbY
 Bn0amhODmgn5i7lWWwESMr/C0/X1vYl8FPKZrzsfX/7Jl6e4sEVKJS+e7P+igBK3bL
 4f0poaLmUnNfa1zI0966jwD9hbjWLy+JcwJeEI4j06Ovdyz9Hi9CbOECGFGXSI5okM
 /RZMutlGvYgrvihFw8OELCYNExz7qaOBoq2RGCiIPIVVYFgHBo4n16mg9AOUsWQgTB
 7DylTHRT6qPFRvcbJQ2VRvQ/rhufh1zvOTYjVApA+Ca6+paWnQ3RpCOO/dNb+9QTuU
 LVneiEBsIxqiA==
Date: Tue, 1 Feb 2022 17:43:22 +0000
From: Mark Brown <broonie@kernel.org>
To: Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH] kselftest: alsa: Check for event generation when we
 write to controls
Message-ID: <YflxOnS65NDyx5Ul@sirena.org.uk>
References: <20220201151551.21497-1-broonie@kernel.org>
 <0e1bc48d-ff3e-a4f8-5f81-d6902e89458d@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="gY52o4Z50JJtWXeg"
Content-Disposition: inline
In-Reply-To: <0e1bc48d-ff3e-a4f8-5f81-d6902e89458d@linuxfoundation.org>
X-Cookie: All's well that ends.
Cc: alsa-devel@alsa-project.org, Shuah Khan <shuah@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, linux-kselftest@vger.kernel.org
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


--gY52o4Z50JJtWXeg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 01, 2022 at 09:18:52AM -0700, Shuah Khan wrote:
> On 2/1/22 8:15 AM, Mark Brown wrote:

> > +int wait_for_event(struct ctl_data *ctl, int timeout)
>=20
> Let's make this static.

None of the other functions in this file are static, that'd be a further
change to make the whole file consistent rather than having a mix I
think.

--gY52o4Z50JJtWXeg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmH5cTkACgkQJNaLcl1U
h9CU0Qf/REJTfz5jncQd+T4BEpJ+maX9T/SxGsXtSMDJELroUPB1VgnSV7HbU7SV
BULsVDO/95YK649ZArYHqqUVO+mq8hQhWq3YiFrhFINQUcGNrWL4yj1RiHlP6K58
Oi/enb0DmRTv4UAPt0d6gXWWKC3h/YxndeFyVcVAUSJ0+0CXs0J4e2CmYCCp2wRs
u2Ezppv+6oG/fbYn2J3Df9mDQNIW9/w1/TH1Ls1mEaH4vV+D3UB+SqKEDbs0Lt6C
IQK7pGArF4Env+GHwij+9igC7hlkTsZ357zkm4twodw4DSS62PJJAJJAfPdc0i65
QdejD4xkTzConfxU9P4aO7l9+jlQ3A==
=+qVw
-----END PGP SIGNATURE-----

--gY52o4Z50JJtWXeg--
