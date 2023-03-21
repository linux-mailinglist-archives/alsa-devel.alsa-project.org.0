Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBFD6C319D
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Mar 2023 13:25:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 884B21F0;
	Tue, 21 Mar 2023 13:24:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 884B21F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679401517;
	bh=tcd7yaaSbLBTzRt6IyfgIG6JothCMgLPcwm2QB3qXoA=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CED8ZjN3a/gwZ+2RuHA7W2+wlP74mD8ept8ychIu7uezel/vFpGnIciB4VX9CLson
	 +L3QFq3OGAC8+s/7FEtAWJoXum0G7kIgF4+cRPSXLvZfCwDpuvMeWp6sgXd/9yWs69
	 D8jZNJ8RlQbvnutb0rao1JljCf/bLMqTHjWRm8WI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BFCF9F80254;
	Tue, 21 Mar 2023 13:24:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6E8CF8027B; Tue, 21 Mar 2023 13:24:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F1EA0F8024E
	for <alsa-devel@alsa-project.org>; Tue, 21 Mar 2023 13:24:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1EA0F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Hi/8DH0D
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 035AB61B68;
	Tue, 21 Mar 2023 12:24:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 473A1C433D2;
	Tue, 21 Mar 2023 12:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679401453;
	bh=tcd7yaaSbLBTzRt6IyfgIG6JothCMgLPcwm2QB3qXoA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hi/8DH0D2NyG8n/LkRvM5diGPgA5A+q8i8agx2Audtsx9u9EjLXhWpPPGAapF25qG
	 JDY5b+hLiOQHZNq0NoBO1Yy8cwC8TkJTZZcN62E6kGA/wObK5NQWjBp1Rcv4GGkey0
	 OibxC8iWf+E6o9CEEwzVYX9LAN/GESmLtdSaBJhzhgVlH4EG6xY6CfW7Fe1Rr9eGL5
	 Lsvt/078uUxOboFsUj52Cju5RbbbgafyRULmIYqL++Ri8YYsvowHkuMuH36DDPRyo7
	 kuJMid/YnPnEXtORQNJ1HqMbzcBc+uFYH2ARvL0wTonEERK+9dWwOrZbSqG4PDddIL
	 tUqBOkVU5LzpA==
Date: Tue, 21 Mar 2023 12:24:06 +0000
From: Mark Brown <broonie@kernel.org>
To: Vlad Karpovich <vkarpovi@opensource.cirrus.com>
Subject: Re: [PATCH v3 1/5] ASoC: cs35l45: Support for GPIO pins
 configuration.
Message-ID: <ad7e366a-6bbd-4968-a3ec-d2d7422c576a@sirena.org.uk>
References: <20230315154722.3911463-1-vkarpovi@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ax8ctbVVBfyuXjTU"
Content-Disposition: inline
In-Reply-To: <20230315154722.3911463-1-vkarpovi@opensource.cirrus.com>
X-Cookie: Will it improve my CASH FLOW?
Message-ID-Hash: 57LUOQPXRHROZDXVHDUG4EYN3ZAMCMKX
X-Message-ID-Hash: 57LUOQPXRHROZDXVHDUG4EYN3ZAMCMKX
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/57LUOQPXRHROZDXVHDUG4EYN3ZAMCMKX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--ax8ctbVVBfyuXjTU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 15, 2023 at 10:47:18AM -0500, Vlad Karpovich wrote:
> From: "Vlad.Karpovich" <vkarpovi@opensource.cirrus.com>

> Signed-off-by: Vlad Karpovich <vkarpovi@opensource.cirrus.com>

Your From doesn't match your signoff which upsets tools if nothing else.

--ax8ctbVVBfyuXjTU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQZoeUACgkQJNaLcl1U
h9CxCwf9Gm/7GxnadvWCNfTU+SVT7JYGyLF0H+7QshC3Z3aRRi+YnXcvTAaQhNs3
jN8jqtMYShWymLCL0Nu+qn5n7f+qWdzfzhw80TRU1FXWU6qZ1jyixTHuNDuHu8tA
gTkkMoVCAn6lwEXmgGXbPjosI5/7dM5v6HsJ8xFD7+2WNMUKIfJ+yjdFL3UIviMJ
TXf3yPqUKttSgxB6cCah2Ps8K5FyVL4B21QCgODQv013fFc569/vORL+gtEiNpCQ
gbBbVyZy8FBAT64qWFdF1tHIwCMTkUPggRQKt0xvudy1HmBsiV+0KWS+sCHFhy6k
QC/WbyDOYhePoiclsrgvGvtXO6IlGw==
=YcLG
-----END PGP SIGNATURE-----

--ax8ctbVVBfyuXjTU--
