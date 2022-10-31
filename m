Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D50A9614035
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Oct 2022 22:55:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62691166C;
	Mon, 31 Oct 2022 22:55:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62691166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667253354;
	bh=FFGfPDLkVcZktYz3pbO3mrkBD87ZdMPNLu3yTzjFccQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U6F6Xn7J/zcHsYVzq/g1t4teARd1ALyZm56Xsz87CJsYRTXBZzAEWiYhTDU3lgEDE
	 gGGsu3zBkP/PZmX/aoUtfR0mlZBqTsySigyXWGOd1XjKcwyfSEmEw7UUf8S6xsx2JP
	 BUH51Jn6w74HDt09cw5uoIUDGUIOA+JMBsx8HqhQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA027F8021D;
	Mon, 31 Oct 2022 22:54:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 393CCF80163; Mon, 31 Oct 2022 22:54:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E3174F800F3
 for <alsa-devel@alsa-project.org>; Mon, 31 Oct 2022 22:54:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3174F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="eC9YoqyK"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0D33861495;
 Mon, 31 Oct 2022 21:54:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BFD4C433C1;
 Mon, 31 Oct 2022 21:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667253288;
 bh=FFGfPDLkVcZktYz3pbO3mrkBD87ZdMPNLu3yTzjFccQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eC9YoqyK9Z2EZNl8+LOIP2tPNeif2YkEHO582v1NBPTulTQ39gL4j+++ChjpL5+fd
 7A634MKLAiNtOFyZ1M11DPfpG12e2srIabQjIeDwSs7+BryxISsYKxzd9Oa6GVLo9R
 nMn3Er8nIIaLKLoqSTd4vsgkq1o0p4OcbfzYr+VIMz+dw+RUSdCkvV6cZT3L+WygqC
 Dpoq6UlhPal/EHREY0tPPxIODSQ0GVg80JNuQDG4dMAABNh9dVZyrgi050JrnzuZKs
 7faXojMJZQsTjeSU5bBy5jWRfHIm4oDQkQOLlGqA3SkLdqykNRkVo5QE/D/O32VfCQ
 vezhYyhZiIngA==
Date: Mon, 31 Oct 2022 21:54:42 +0000
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Subject: Re: [PATCH 6/8] ASoC: rt5682: Support dbvdd and ldo1-in supplies
Message-ID: <Y2BEIpTIQKuvMPJ9@sirena.org.uk>
References: <20221028205540.3197304-1-nfraprado@collabora.com>
 <20221028205540.3197304-7-nfraprado@collabora.com>
 <Y1/JCN+mtlT0r/rw@sirena.org.uk>
 <20221031163140.h63kjpivwg7xpvs3@notapiano>
 <20221031190938.GA3264845-robh@kernel.org>
 <20221031193810.vdsdndr4ltvhrfel@notapiano>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="pxMlgxtl57zbllW0"
Content-Disposition: inline
In-Reply-To: <20221031193810.vdsdndr4ltvhrfel@notapiano>
X-Cookie: Are you still an ALCOHOLIC?
Cc: Oder Chiou <oder_chiou@realtek.com>, Rob Herring <robh@kernel.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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


--pxMlgxtl57zbllW0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 31, 2022 at 03:38:10PM -0400, N=EDcolas F. R. A. Prado wrote:

> We could have both if we converted the existing ones to lowercase first, =
but as
> I mentioned in [1] this requires using devm_regulator_get_optional() befo=
re
> falling back, which seemed like an abuse of that API and to unnecessarily
> complicate the code.

Yeah, it's definitely not what the ABI is for and probably more trouble
than it's worth.  We *could* probably write some helpers that handle
legacy supply names to the regulator core code if someone really wanted
to retire old names, that way the complication would be shared between
users which seems more managable but someone would still need the time
and enthusiasm to write the code.

--pxMlgxtl57zbllW0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNgRCEACgkQJNaLcl1U
h9ClYQf9FsCx0G+N6VTpjGeY5nkPr29CUIIugDCl4wTHz+wFi7U/VdaIbjstqF9y
2laVvOENRoq28dcIG1adZWcTZtDflCRfS72W1e7x/p/6eg5Syl1S96YZqYAmh+H+
DuZ6it8zFCiTO3emtcLI8ZxK89TFdBebgo5R3g63lvmcfIhvk3A6u/vYxCJCvRVo
oDk5tB/cWSTC3qX+dU9a4aFpqjsecHmhnmE0nqLLYpyMxDQtTvmsyvWh2dcqbQi6
kJkRByMxqmsbgYCjUec0FDkuIvbeb0Up1apSK4Ui+lb+wtYqExcfcEcuA7LgbtpG
gTSTYSGcZLpFBepWyyoyqYODwJssDA==
=DG1t
-----END PGP SIGNATURE-----

--pxMlgxtl57zbllW0--
