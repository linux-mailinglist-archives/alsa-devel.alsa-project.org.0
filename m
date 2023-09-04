Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BECB8791BE7
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Sep 2023 19:16:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5707827;
	Mon,  4 Sep 2023 19:15:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5707827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693847768;
	bh=4TBv+hfoSawKYK7q4TRAzz0jWAHC4YJ34BO8FxPlzYY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=H7yAMFWDPhvm+nY1nkZRSrL6ZD9RC9VUuzP7WYIEzyJblJRszXmTWFfVsmEHTrMxq
	 rxTrWkLX4nplS5hlKYvNLhDircfzhDXaE0+SCBGT6igHwjVD8JZF9c8q3KbIE+ZfxA
	 mwE8eBQgdXFDUS93UA5cBlXVxSKABrca18YV5azc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 508CAF80537; Mon,  4 Sep 2023 19:14:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A83E3F80431;
	Mon,  4 Sep 2023 19:14:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A8E5F8047D; Mon,  4 Sep 2023 19:14:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 44ECCF800AA
	for <alsa-devel@alsa-project.org>; Mon,  4 Sep 2023 19:14:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44ECCF800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jOIHJs9H
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 709ECB80CB0;
	Mon,  4 Sep 2023 17:14:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0486EC433C7;
	Mon,  4 Sep 2023 17:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693847683;
	bh=4TBv+hfoSawKYK7q4TRAzz0jWAHC4YJ34BO8FxPlzYY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jOIHJs9HxaWqT5qRvCdkhBG6JCUAYqOzDHSLHzopSZftVn2EgQbo+hMNC3Q1rK2Mo
	 PjyjheNlC0l/FohNCQ5dzApRCT289c5tdYkaBe+ZT1zzRqHKpg61NwQdXDCPvZwvYf
	 KKRzjG3J4YVHm7oaZEzTp9zU90Zf5DtPuphxTVcmpBI4RSFmRnOy3TkaB9B0UncoyG
	 jH7LaWvZtfCmoi/qnaASzo7c/d1nExMzTYVjXZFtM9ceSxrnDSN8y+Wx/Iep0H89lJ
	 1MkQwJ+sNjLa+7EZYrKRGu7cHPoKJ5uEvdCsxmGErqHmN+bHF7i/z9ZXq3BCqh/Tlb
	 ULgsypY6SvyLA==
Date: Mon, 4 Sep 2023 18:14:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, wangweidong.a@awinic.com
Subject: Re: [PATCH 1/3] ASoC: aw88261: drop undocumented, fake sync-flag
 property
Message-ID: <f62eb98b-39a3-4601-94a2-2cc6508cf2ae@sirena.org.uk>
References: <20230904125309.43350-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GXtndeLIKth/q1R8"
Content-Disposition: inline
In-Reply-To: <20230904125309.43350-1-krzysztof.kozlowski@linaro.org>
X-Cookie: Immanuel doesn't pun, he Kant.
Message-ID-Hash: TNCMTI7JB7CVGPXZE7BWXKOOAHENLVMP
X-Message-ID-Hash: TNCMTI7JB7CVGPXZE7BWXKOOAHENLVMP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TNCMTI7JB7CVGPXZE7BWXKOOAHENLVMP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--GXtndeLIKth/q1R8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 04, 2023 at 02:53:07PM +0200, Krzysztof Kozlowski wrote:
> The Devicetree sync-flag property was never accepted and is not allowed
> by bindings.  It is not used by any upstream user, thus considering that
> it was never documented, should be dropped.

It would be better if we could just get the properties documented of
course.

--GXtndeLIKth/q1R8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmT2EHsACgkQJNaLcl1U
h9Asiwf/XyF5Cp/WwF5q7viU6OXe4fP8SaMpwSrssThySvAfFTGHeJY65Mafv7h9
wx8j+Uh2Ug7nb7uHn7+Xipzx19WHwuJPcqQPSXQbtOj6kenClXsafpAvQioC7mKe
rSC//1qVA6sxBCkDHyyGzDG2qZafFUJmNEmyJC+LcbWMCGKQ+OwrBYVoFAhr1x4M
KbWfQ/NTmd7Be+pT3tUawHD8UoZhnTRVKxAC2xtIxex9nLoZ6CAgGMyS3GpYssvF
Pyj9SoeGaLf4JMWel9lnbwCoDXLOQ2jdCTQNlmAMCoUQe5shX4FOJGPEIYjRlT/N
S/yQaRQvl48+CBmHQtsHYLBh4lNAaQ==
=/F0p
-----END PGP SIGNATURE-----

--GXtndeLIKth/q1R8--
