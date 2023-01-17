Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC6C66E02E
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Jan 2023 15:19:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26ADB6905;
	Tue, 17 Jan 2023 15:18:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26ADB6905
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673965171;
	bh=uVGdRX9tb66aSkyW8WYEjW1kFdCKXI7yv9+/xjC0zqo=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=au8ZBDxfO9eMQTqOvA39l3We3EDEzCaVzxJdPdl2sNRzBWYweD9ygSz4NrTDvyS+w
	 yPrezT2QmGXiyuuD2ZMpio+6eHASKWb71fLrkpohYG0qC2e7z3K/mpaxA97KPZDe7R
	 0dMsC2MPPwWyp872XnB5fLM9Y/DRBwZOoKCpLxI8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94CCDF804F2;
	Tue, 17 Jan 2023 15:18:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF4ADF804EC; Tue, 17 Jan 2023 15:18:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B6A6F804DE
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 15:18:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B6A6F804DE
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=S4tHOGVq
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B094461467;
 Tue, 17 Jan 2023 14:18:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B328C433EF;
 Tue, 17 Jan 2023 14:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673965107;
 bh=uVGdRX9tb66aSkyW8WYEjW1kFdCKXI7yv9+/xjC0zqo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S4tHOGVqyoS+akOGzS9EYsbdhEd+Gkiv1LooYpscK2oesI9P1IRDEK8ixSe8nSwzM
 IrvHuFb1AZp6ux+Bj42KyuwTB1rIThKhZ7FGLpvgdZiz2S5E0AHDC48AddpwFdfsPP
 OgfcfxQbBFnV7nBIq3I8M49vzJNPZPwuYLTEvbBvNNfOSLKRWnkreREAj8N/gTOyTE
 M1hUDsJwUKmBI3mdTu37YsyXeuBNMO/tY81p1YmdqFeO1TJjb8pSh8Dk4p5w6xmQWg
 n1+TGbFZHDAzk39uXk40l/OZaq27mgLr3Z5L7fjh3unJQoOqA3wPkNRnb+Lh0qJw9i
 hwCNEme6jXdnw==
Date: Tue, 17 Jan 2023 14:18:23 +0000
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH v2 0/3] ASoC: SOF: sof-audio: Fixes for widget prepare
 and unprepare
Message-ID: <Y8auL5VNefcFZAB4@sirena.org.uk>
References: <20230116125506.27989-1-peter.ujfalusi@linux.intel.com>
 <Y8afrS+wfZujFRHS@sirena.org.uk>
 <675f42a7-1d26-10bd-5862-f758d8b41849@linux.intel.com>
 <597d5cee-f9fd-411f-c780-8413b6fd422d@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="j2kQFq0eqFoFoF6s"
Content-Disposition: inline
In-Reply-To: <597d5cee-f9fd-411f-c780-8413b6fd422d@linux.intel.com>
X-Cookie: Serving suggestion.
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com, lgirdwood@gmail.com, rander.wang@intel.com,
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com,
 angelogioacchino.delregno@collabora.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--j2kQFq0eqFoFoF6s
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 17, 2023 at 04:05:18PM +0200, P=E9ter Ujfalusi wrote:

> It is the topology ops optionality stuff. It is in itself a trivial (for
> my eyes) conflict, but it is a conflict never the less.

> This is not going to backport cleanly to stable either.

> What would be the preferred way to handle this (for next, for 6.2 and
> for 6.1.x)?

Can you send me a version that applies against for-6.2, if it
doesn't backport to stable you can send an explicit backport
patch once that becomes an issue.  I'm much happier resolving a
merge between 6.2 and 6.3 than on initial application.

--j2kQFq0eqFoFoF6s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPGri4ACgkQJNaLcl1U
h9B2pAf+NVySSXpRnc8OU7v3saonOk7SJp2G6XKMs2ArATjYsfpivhMpD2xAlVVS
10k0mc/ic+rzoO32fRubXUQiFE+L7AhQ/C1uCOgyK1R/XCuAX8BUPTp6/MR3CkTR
auw1bInaYgc7S1Em4vq9q1fCiR12yfC28jyAt2E2fJE/R5zQXvV9CnU3qXksstZr
IJSWfQVtJKP31/lBs616Id9Y1oDrKAMzXyZ/0hxwefp8OKZeainMRwBn4Nbs76jR
OEn1W4zlkdh8s7zAq3YHQlenLPqdTley6n1vbaakNoO67SJmpfzQ5f9q6LhrfQHb
wwBRdcIPhBBpq8F+4QqhURP7rcTP2g==
=ZmDc
-----END PGP SIGNATURE-----

--j2kQFq0eqFoFoF6s--
