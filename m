Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E21936FC92C
	for <lists+alsa-devel@lfdr.de>; Tue,  9 May 2023 16:38:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8503E10C3;
	Tue,  9 May 2023 16:37:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8503E10C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683643078;
	bh=vpobpJmD2PRTdK1kFeukPqy706kubskVlykD91dgbyA=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Eif4Mo1q+z5yWwyGmXosDWNIag8CYuvw9CvR3kEFjZnwMJYN6p/r64/VXUDnPKmql
	 Wdu8tiXS551Z7Se201Huyn/ZGkDZBqe/cChBK0bfvfm/raIi1BWi6EK8GZuwg+iTnf
	 CNfKq1T3BehXG1RqR2u/nN7seS0F6VjXpJoohS+M=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3AB73F8032D;
	Tue,  9 May 2023 16:37:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7DEB6F804B1; Tue,  9 May 2023 16:37:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D5F7CF80310
	for <alsa-devel@alsa-project.org>; Tue,  9 May 2023 16:37:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5F7CF80310
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=JX+7P8Om
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4FB5F625AE;
	Tue,  9 May 2023 14:37:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D119C433EF;
	Tue,  9 May 2023 14:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683643019;
	bh=vpobpJmD2PRTdK1kFeukPqy706kubskVlykD91dgbyA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JX+7P8OmYI3ocXlnLhmDPDlVH5bI0X9Z2AAHjsU3g9dNsFUF8mp8ZnDHIJ0ulD4At
	 YZWaI/YqULzaVS0y8sdfQ4hFMxlJhi0NrQkBTIIXB6NaODxBM6ZZ9oUpQonZ9r0wZ0
	 TFDAUn1pisiOH1Ac9izlO8VyAfJIw3YJJS+BjV/TxZq/kqmuReqy0PWIo4ZsPhWnwt
	 kAmRxSdoLJd8DfUPYgRLXnRH7NMV6UqHHiiazb/eD+TUOcWyI/21OvXhqjDDZ5Uiv8
	 OdnSMs3ZuUL9yeOIf2yXr+OVGF3FHM0EWqrJXZlWcjBxQ56KbPNFec1YclJXhbgG8D
	 CMNN/w2EjvQvQ==
Date: Tue, 9 May 2023 23:36:56 +0900
From: Mark Brown <broonie@kernel.org>
To: Ravulapati Vishnu Vardhan Rao <quic_visr@quicinc.com>
Subject: Re: [PATCH] ASoC:codecs: lpass: Fix for KASAN use_after_free out of
 bounds
Message-ID: <ZFpaiBs19P2m2i/q@finisterre.sirena.org.uk>
References: <20230509103232.20953-1-quic_visr@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rp6eN0jACiHvaET+"
Content-Disposition: inline
In-Reply-To: <20230509103232.20953-1-quic_visr@quicinc.com>
X-Cookie: Avoid contact with eyes.
Message-ID-Hash: DRTNVD4FOABCEPBHWOCNJDGKOAPV4KWP
X-Message-ID-Hash: DRTNVD4FOABCEPBHWOCNJDGKOAPV4KWP
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>,
 "moderated list:QCOM AUDIO (ASoC) DRIVERS" <alsa-devel@alsa-project.org>,
 open list <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DRTNVD4FOABCEPBHWOCNJDGKOAPV4KWP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--rp6eN0jACiHvaET+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 09, 2023 at 04:02:31PM +0530, Ravulapati Vishnu Vardhan Rao wrote:

>  	val = ucontrol->value.enumerated.item[0];
> +	if (val < 0 && val > 15)
> +		return -EINVAL;

Srini is right that it'd be better to read the upper bound from the
control, that way it can't geto out of sync.

--rp6eN0jACiHvaET+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRaWocACgkQJNaLcl1U
h9DFwwf+OGbDrdaAcrzv8y4tkJVfYVW0CN+Vi2I9TmTYkFz4yMuHLYz4/+Lqrqvb
VwxCESut40IbIG923f8kXLHI1ZLyMYZYfijCjhozfmIMwq+4IDclDAVN7X1nsSl9
U/AlK2kQ1E4hS2TLLqUgno9doE3EFXgJuKCfwT6AAWIK+T169fN3dXTlFT7SeTcP
OO+qkTftBiuYGKMW7hMZCvcOnw7lhgso2MP6iFVSZGHr67rB84cNOvgJ4og6J90U
+2wOn5Xdw4KepnGGOFl7uD8B5XbTeva3ooOEkkRDa+oEZ/L6VmvsnQm30N+iC935
xuGsCPLEIwrsj9V571lsqHei093EBw==
=QfcG
-----END PGP SIGNATURE-----

--rp6eN0jACiHvaET+--
