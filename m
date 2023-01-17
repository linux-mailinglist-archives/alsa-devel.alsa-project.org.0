Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BED3C66E1FE
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Jan 2023 16:23:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1563569ED;
	Tue, 17 Jan 2023 16:22:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1563569ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673968982;
	bh=RAKVGUDoNG56kbr1i2BVgW6ayD1oRHysUPGkaNattSM=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=LoiAVUQ5VllRCuv1W0+aqQYlI5F7Xjmq8zXjY+W1ijbH1ixuTqEYIwCQ/Bgq36BVd
	 SXoRFI8ANzyqB48xLmrat86hZPAwnANVzBSuBHFk0MjFNM55YU67LYi4Kjy3QjEHRt
	 GxfWd4WtjybZtsEGcC1dcxwNrOG5egFPzTKgEmfs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0845F8022D;
	Tue, 17 Jan 2023 16:22:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D1CBF8047B; Tue, 17 Jan 2023 16:22:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5108F8023A
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 16:21:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5108F8023A
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=OIWfmjfo
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B9F106147F;
 Tue, 17 Jan 2023 15:21:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B6B1C433EF;
 Tue, 17 Jan 2023 15:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673968916;
 bh=RAKVGUDoNG56kbr1i2BVgW6ayD1oRHysUPGkaNattSM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OIWfmjfoDLkOvfyqp+a+MgHkJ5TOeNusREp9mhrZe98ajDogIzXafz9xiV0ft1gWL
 OvIHQBW+A4KDd7f+U9jP1uaYK5hHB+K/3gwN7KybCSgcDjMBNYkDMRmXf20HlRZqeg
 XlULh1DP4WA6jqMnVdb6whfY7+fJQM7Brsji+9JD46lTaCWxc1CYhKK/R6qO3aeNKI
 asOJf9HXKrJN7Gaqs+mGsOO2nGRrfIRK8wiHTE4RLPjOAqYuOv8eTSNoQOBYQNGK5r
 4ZXZcAPlqOATzxKMepTuSNuELPeENmcbkV2eY30ddsRibY2n0wLgS1I29FN/AXs2hF
 mJ1b3XwTeIO4Q==
Date: Tue, 17 Jan 2023 15:21:17 +0000
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH v2 0/3] ASoC: SOF: sof-audio: Fixes for widget prepare
 and unprepare
Message-ID: <Y8a87Q8QIfLo++kK@sirena.org.uk>
References: <20230116125506.27989-1-peter.ujfalusi@linux.intel.com>
 <Y8afrS+wfZujFRHS@sirena.org.uk>
 <675f42a7-1d26-10bd-5862-f758d8b41849@linux.intel.com>
 <597d5cee-f9fd-411f-c780-8413b6fd422d@linux.intel.com>
 <Y8auL5VNefcFZAB4@sirena.org.uk>
 <63b9317b-97af-2264-0cce-5a0181496799@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="q70r2xhmHozn2w7K"
Content-Disposition: inline
In-Reply-To: <63b9317b-97af-2264-0cce-5a0181496799@linux.intel.com>
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


--q70r2xhmHozn2w7K
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 17, 2023 at 04:30:47PM +0200, P=E9ter Ujfalusi wrote:

> Sure, just to be sure: v3 which is against 6.2-rc, right?

Yes.

--q70r2xhmHozn2w7K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPGvOwACgkQJNaLcl1U
h9AjRAf+KqNSEKWfoxfiItt9HThLUe97zpqEPPrrQSJhsq0W1kE/JSpm9gj8wz4b
R9k9/rEbz2KGPK53fMILqSlBQvZ0gLIgE+MQE/kcqxDd9eMKzz8AKqJQqxFGRfGt
i7pLr39Qp0OkgLqib4J3rnCXmlbXk2dIkKBNcZuoag3wf+kStgl/Xc0FGgxOtaMY
mgyrjnB2gfbnmCX3x2zA6v0iV+J51I6k/VQbX2SZVwIauIwCmF7Oi5k1oLaKfdyr
qdtgQdtBIZpFVuDLVoey8UHAx9kYaceE74V/eoDOBNZlKtTuTYNegyknq8CGBopl
O8bpcOLBUq+Y5gAglIQ5HkJCfP04kA==
=Qf5y
-----END PGP SIGNATURE-----

--q70r2xhmHozn2w7K--
