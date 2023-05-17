Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0831F705C9B
	for <lists+alsa-devel@lfdr.de>; Wed, 17 May 2023 03:47:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3EF6F1F7;
	Wed, 17 May 2023 03:46:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3EF6F1F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684288052;
	bh=in1whizeLWlvhF2+6xar1ogYy8/Jxq2IPchedPQ6B6I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LmUTxYUy/pQL7COFbMu+PJDs4LDEzaCoBG94BYlaAhUQv7zl7WFlzF4+L9HLvKBSn
	 CkEXrkNEMfAV9j8E1xW+hmPwvixG35sIFtwPa8Q1g1jSkD/GqhCNhyaOE5UCFBD8Lr
	 /dRf6OVgBRpwgPLMRoLlRiE+4WgpDpAKeUlKnxZ4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D11B6F80553; Wed, 17 May 2023 03:46:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 55F1CF8025A;
	Wed, 17 May 2023 03:46:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C149F80272; Wed, 17 May 2023 03:46:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C3BAAF8016A
	for <alsa-devel@alsa-project.org>; Wed, 17 May 2023 03:46:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3BAAF8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NHiio5/1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B013A60DBF;
	Wed, 17 May 2023 01:46:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A971C433D2;
	Wed, 17 May 2023 01:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684287987;
	bh=in1whizeLWlvhF2+6xar1ogYy8/Jxq2IPchedPQ6B6I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NHiio5/1S2s+PPSZDLWWsJn0iG9F9kpI4p5aH2fMMGa4MhQ3cYGImW/wSQeaIVYdx
	 n8jP2d+jEHdCgTAroW3C9BBizd6WfiaPoGFTnUIidO4I3kDRO7roC3JW2GT6JJKCYV
	 IZz2eO0XvP3ZlA8zwnmeRKG3VYjnu34G+tr94MFTsedzSqGZLvk5Auh+NgabPQnulD
	 rAUdHH8axVGnl9YLnVwOrKtX5vuv2bdUUDzwO2Pqr8HuzWaiZ7xNsoiq8CHS7xszt8
	 iCfZpkEf/XCl+tWQIDtQ7w8Bxx6yMF3zvJd84JF00WP0VGv9YNBgEV+WhBRxQTsOA6
	 r5OWBDboF/UEA==
Date: Wed, 17 May 2023 10:46:22 +0900
From: Mark Brown <broonie@kernel.org>
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Douglas Anderson <dianders@chromium.org>,
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
	Stephen Boyd <swboyd@chromium.org>, stable@kernel.org
Subject: Re: [PATCH] SoC: rt5682: Disable jack detection interrupt during
 suspend
Message-ID: <ZGQx7kB6mEL2/wIa@finisterre.sirena.org.uk>
References: 
 <20230516164629.1.Ibf79e94b3442eecc0054d2b478779cc512d967fc@changeid>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xNwPqIq/92Tep2/e"
Content-Disposition: inline
In-Reply-To: 
 <20230516164629.1.Ibf79e94b3442eecc0054d2b478779cc512d967fc@changeid>
X-Cookie: Avoid contact with eyes.
Message-ID-Hash: F3O5TEMZURWB4AYZFXAMZAPVCG6FQSV3
X-Message-ID-Hash: F3O5TEMZURWB4AYZFXAMZAPVCG6FQSV3
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F3O5TEMZURWB4AYZFXAMZAPVCG6FQSV3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--xNwPqIq/92Tep2/e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 16, 2023 at 04:46:30PM +0000, Matthias Kaehlcke wrote:
> The rt5682 driver switches its regmap to cache-only when the
> device suspends and back to regular mode on resume. When the
> jack detect interrupt fires rt5682_irq() schedules the jack
> detect work. This can result in invalid reads from the regmap

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--xNwPqIq/92Tep2/e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRkMe0ACgkQJNaLcl1U
h9Bafwf/QAH3bcfIs5CjDCsQuoDD1Gkw5eGlIX4i3xmz0ZhhQIIpw5tk36OmcPkq
SiVLtAcryA5DzQoQJWRkxV4rkjnvexYVk/2fWDxC4AUstVIT9pr1+B7t/ZmThduf
karaEO5do0OCo79WWNGpOt3ipa1dxRaF+bGXnZLdexdaIGl48L+Brl9eOiTaRv7a
877FUAS0ZyfVWbQgBjGTjTSafxmKnaVf1XzkigOb6SItIfI9qxIpyeGngsLRT80G
vdJbenuYj6s0NAquSxu5J6F9qlhTfnAgxOyFgc9s8zM4A78undZVtB78NJCUh4Kt
+Ayvuo4dMoLGnaiLD5fkoAphKiMP7A==
=pTfh
-----END PGP SIGNATURE-----

--xNwPqIq/92Tep2/e--
