Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B55A6BA3A72
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Sep 2025 14:41:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52D87601E6;
	Fri, 26 Sep 2025 14:41:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52D87601E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1758890495;
	bh=HzjbS5RDKUB+2C5nPrcsTl3Z+/Q6+IrlhjUdjbo/YX8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kmpKnSiMfZsxYZD2vVKntVppOqyxlueTTDPtmkjDQu4hpYrS/eXgWyI1OgOfG5rMu
	 ksI3B8m22lWtKIR1I1WQa8kIpvIG2Vl5EC1qxrFnlFhZJ2gseixcytNbtfH4AD8lUE
	 dYbmP13GqNLCl4dT0bieGAECUiVDC4d7z/jZxcKc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A316F805E1; Fri, 26 Sep 2025 14:40:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F32DF805E1;
	Fri, 26 Sep 2025 14:40:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ABDD0F805D9; Fri, 26 Sep 2025 14:40:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E61A0F805D3
	for <alsa-devel@alsa-project.org>; Fri, 26 Sep 2025 14:40:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E61A0F805D3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jUMRQNQI
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E9BCC61D73;
	Fri, 26 Sep 2025 12:40:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B36C4C4CEF7;
	Fri, 26 Sep 2025 12:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758890449;
	bh=HzjbS5RDKUB+2C5nPrcsTl3Z+/Q6+IrlhjUdjbo/YX8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jUMRQNQIq/vl9gLe9paUJIvYeiVsmWcmhR3TkfV1GMqJgrX59EQu+WQi8RS+ZG1Ux
	 DtZ8tH4hvuOkn0+nLqPfij1TZOIYRqvQdOZMIBd3nJNnaVY0mHXH244pHHWFSwo1QM
	 lqWSXwM+zvxiJTC2aUXgJPgEufG9co7Dzne8xMpW0NsGnni/d5vBo8J+3Azw9kkizT
	 hc9n4gp6GMOol4jHECyrbf4HGYEYOnnLkzV//nZ2AHgC2MCPbmIsaJShTKnw40m6Pv
	 53lb7w75Gm17WHhODg0G/R6dVzT7P/IO6CTFK/9dN6MuUS1FgwQ2QTt3ICqYpceXSe
	 pat3CXh33O2Vg==
Date: Fri, 26 Sep 2025 13:40:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Baojun Xu <baojun.xu@ti.com>
Cc: tiwai@suse.de, andriy.shevchenko@linux.intel.com, 13916275206@139.com,
	alsa-devel@alsa-project.org, shenghao-ding@ti.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org, k-yi@ti.com,
	henry.lo@ti.com, robinchen@ti.com, jesse-ji@ti.com,
	will-wang@ti.com, jim.shil@goertek.com, toastcheng@google.com,
	chinkaiting@google.com
Subject: Re: [PATCH v2 2/2] ASoC: tas2781: Add tas5828 support
Message-ID: <e7cc9383-3a83-4c94-ba30-30e0117489b1@sirena.org.uk>
References: <20250926043339.8419-1-baojun.xu@ti.com>
 <20250926043339.8419-2-baojun.xu@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Gspcy/cvBUDr0LgI"
Content-Disposition: inline
In-Reply-To: <20250926043339.8419-2-baojun.xu@ti.com>
X-Cookie: Your canceled check is your receipt.
Message-ID-Hash: 34PXEUJV7SJ35JSE7U5PDDCQZC2KYMOH
X-Message-ID-Hash: 34PXEUJV7SJ35JSE7U5PDDCQZC2KYMOH
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/34PXEUJV7SJ35JSE7U5PDDCQZC2KYMOH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--Gspcy/cvBUDr0LgI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 26, 2025 at 12:33:39PM +0800, Baojun Xu wrote:
> Update ti,tas2781.yaml for adding TAS5828.

Reviewed-by: Mark Brown <broonie@kernel.org>

--Gspcy/cvBUDr0LgI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjWicoACgkQJNaLcl1U
h9BjEAf8CB6jA+6G6TBClRdHJ/Vo7FGkEm9xXkdeTiz2yJtFZIchyE9upnm9XviW
tpqpapiueZX35ZJ30roKiQCDpyuGuL6OussCGFOJxQgjV63vig8EGdeari8UXktS
RyflfGgQ+tktQTfddkI0j4AHE1FBqxcmX0mBgZaeta1KvOcuFdeXMjzyailJHNhC
ztqlLcnaMTDik+kcFBMpS5d00hUMEm1m09e2qrs+LpT8Cx/5sFzmDra1fl6LpXnc
y37Jd5KRbO67cb3BjUPLbCZaBnyyvRxiaNRFV+yjOLpecnRbb9d1WEhreKDVWZhr
RKLkHTrpB7XVGvuACfnbuQpe/X67EA==
=VJb8
-----END PGP SIGNATURE-----

--Gspcy/cvBUDr0LgI--
