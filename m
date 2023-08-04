Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F345770161
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Aug 2023 15:23:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B4647F4;
	Fri,  4 Aug 2023 15:22:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B4647F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691155416;
	bh=kJ3pdmHTuhq47H6UlFhigNWiYfJFQX6elbr0RgltItI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=q8Rut7iGEdB3jvywIjaCdYchxf5TOhT25jBspRiAMtO7QZ9Z5U6vlMx8CkoWozlQm
	 d/wZYEJhNVkfnQwGKVQlqNPTedJJPxIiNkaQiASdzN71vzt5hiiE/Z6fxIbVSJlVMG
	 eH1CHs67v7tEwWi38ihrgBtdvyGiuVbkrXoB5oOk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8DF98F801D5; Fri,  4 Aug 2023 15:22:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DB22F801D5;
	Fri,  4 Aug 2023 15:22:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2A6EEF802BE; Fri,  4 Aug 2023 15:22:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DD594F80087
	for <alsa-devel@alsa-project.org>; Fri,  4 Aug 2023 15:22:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD594F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=T5UFIDSD
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AB88361F9A;
	Fri,  4 Aug 2023 13:22:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 910C9C433C8;
	Fri,  4 Aug 2023 13:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691155357;
	bh=kJ3pdmHTuhq47H6UlFhigNWiYfJFQX6elbr0RgltItI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T5UFIDSDFUfQHcNJBfZpyO5slT3/sOudk8IwrnWIKxkN1XXRlJLwzU8DYOef0TYlg
	 KSFXPuwtNNIx3xATSwe/ETWF92qswYNeNfejerIygSECrAAFeCHI2wjwqnyaAPj46B
	 7ryOa+ThNipB+mfvdLyu0UDxkNVACgYHtTLHYcobnen3m/BCyLy3hum689/ewoo/HQ
	 rGlja0L8wlAxQX6RDJk3VXWYUcEfU7F6RBD2HQlNCS6RpjcTqUnLjEOsrXlvLYl4PM
	 mKEETEJI3pcLp1pqHwZXE4YfG6X+WdLmgjXdwlHjrYcw8WQuDutVrzxvOqfsylNIgK
	 eK4RT17eDu1Ew==
Date: Fri, 4 Aug 2023 14:22:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: Alper Nebi Yasak <alpernebiyasak@gmail.com>,
	alsa-devel@alsa-project.org,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, linux-kernel@vger.kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>
Subject: Re: [PATCH 04/27] ASoC: amd: acp3x-rt5682-max9836: Map missing jack
 kcontrols
Message-ID: <0a14cab1-f0ca-4428-866a-8ca29be5721d@sirena.org.uk>
References: <20230802175737.263412-1-alpernebiyasak@gmail.com>
 <20230802175737.263412-5-alpernebiyasak@gmail.com>
 <277be798-9bd0-baa0-9e0d-8a7a9ac67f02@gmail.com>
 <a0ba4144-7763-4d55-8517-f1c44fa4257e@sirena.org.uk>
 <3d6794c9-60d3-b8f3-99d2-afdc69593d9f@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pMcfcRe7WFXk8xDk"
Content-Disposition: inline
In-Reply-To: <3d6794c9-60d3-b8f3-99d2-afdc69593d9f@gmail.com>
X-Cookie: I'm hungry, time to eat lunch.
Message-ID-Hash: 3KJ3T5HFNBBFFTQRJPUHN6NA757V65J3
X-Message-ID-Hash: 3KJ3T5HFNBBFFTQRJPUHN6NA757V65J3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3KJ3T5HFNBBFFTQRJPUHN6NA757V65J3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--pMcfcRe7WFXk8xDk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 04, 2023 at 10:19:43PM +0900, Akihiko Odaki wrote:

> I see. Alper, can you add a patch to remove SND_JACK_LINEOUT to your series?

Please send an incremental patch on top of the series rather than
resending the full thing given how big the series is.

--pMcfcRe7WFXk8xDk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTM+5YACgkQJNaLcl1U
h9DHOwf+JkJDoTNDDi6E0mUdg+FTXiAjqI93Kkb165ham65WQaBHKUOmI3frfHZn
ZUB+RusbQEGSajFxjPuHWuZjQyb2eM6E1WPnO8dCoctwtAj4eXL4kqSxot8ydqtl
8KwWbrFMtolBBqsnCYxqvemiCIGVaBcSfRUbQx8UhcOy07c4jBxxO8ORK324YGuo
767aJGdUHFmQG8UUwy+gpCIPhMA53+G9BjPTlWf+Ov+hfu/7cdSoGsyFdJmaWrqp
y1bbKneCeTJUlfRBnCzSKNZWLgFxD3W0ai1jguajbtLS5aJHeoWSKIEc/8Vulzhb
hexjd82CB4DH1X/1MV0tvjeAVa2cbg==
=ToLN
-----END PGP SIGNATURE-----

--pMcfcRe7WFXk8xDk--
