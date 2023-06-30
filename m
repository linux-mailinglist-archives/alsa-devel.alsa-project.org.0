Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0BB743F3F
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Jun 2023 17:56:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99812846;
	Fri, 30 Jun 2023 17:55:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99812846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688140564;
	bh=znGCPupWQFYQBD7vDLixPFDgA/zyCTswlUzLFo6LN0s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ttefQ6Gp2TVt3wNzKGr0TvjTq/lPe/rrQdTIgTCWSvh/gHRl5zrNmG9+Z337LM4ly
	 pMlK7dzm+dXfqpof8JjQBcLrkaRu2GnPoUao5y+yGYbFu6NowO/a8hjKSKkGvQP0Lv
	 U0kTKq29x2D7y76q4RRCP87aXOxt2bo8DZJCcGw0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A54D8F80553; Fri, 30 Jun 2023 17:54:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 62E51F8027B;
	Fri, 30 Jun 2023 17:54:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B11F8F8027B; Fri, 30 Jun 2023 17:54:51 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 56BA0F8027B
	for <alsa-devel@alsa-project.org>; Fri, 30 Jun 2023 17:54:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56BA0F8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=IUJyhaD7
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E660461789;
	Fri, 30 Jun 2023 15:54:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7D24C433C8;
	Fri, 30 Jun 2023 15:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688140486;
	bh=znGCPupWQFYQBD7vDLixPFDgA/zyCTswlUzLFo6LN0s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IUJyhaD77kes7pGmCciwOF0ExXAtfsYln9338xKaVOnMe8lc+LFQs/4+FKA/lSq/H
	 gRt/z8nco3KXa8qu/EKIvYNhLlS/i90M4JBKrHgCaJpRxCCa6f4DxVH69Pv8zmPn2w
	 zOOMRMoa0Y2ExguoMY5oewSgkdmhyAzjI/0Uqsyjpi0XYyGgeUIhr9cD3LNXRlLCl2
	 TF4g41EBl6FdR3O3QW3ZsQFqOCP/hb9qlJ3TCQ8nTT9NoB2xX7rHF2jDuu6Ld4v5zH
	 dQJk7vcLKrMSskBLwVAQY3knIoOwP5vG+/YZqfZgNKT8LNABExX3glEs1K5yohnqn4
	 uocXy0i59RtvQ==
Date: Fri, 30 Jun 2023 16:54:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] ASoC: codecs: wcd938x: use dev_printk() for
 impedance logging
Message-ID: <1bf122cb-2d6b-46d9-8c4c-addbf2791c23@sirena.org.uk>
References: <20230630142717.5314-1-johan+linaro@kernel.org>
 <20230630142717.5314-4-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hSt2JuKKCbATmO2M"
Content-Disposition: inline
In-Reply-To: <20230630142717.5314-4-johan+linaro@kernel.org>
X-Cookie: Old mail has arrived.
Message-ID-Hash: ZI3QHSV3STQ66DJEMT72IUQ2Q4PZY673
X-Message-ID-Hash: ZI3QHSV3STQ66DJEMT72IUQ2Q4PZY673
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZI3QHSV3STQ66DJEMT72IUQ2Q4PZY673/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--hSt2JuKKCbATmO2M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 30, 2023 at 04:27:15PM +0200, Johan Hovold wrote:
> Pass the component structure also to the
> wcd938x_mbhc_get_result_params() helper so that the component device can
> be used for logging consistently.

Ah, in fact here we are.

--hSt2JuKKCbATmO2M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSe+sEACgkQJNaLcl1U
h9CtfAf/RMS/usFSZCmHcxanmIbzDtqHU77xROkqioT1SFXvd0zaQnAQLbRKrAdw
fFNE3POk2vZhchx05N/qyHouo0tDCf1QfUCcT2YcCdO+R1yXqcJ7uBffZcpuuGiw
8nH5n1N2iVL+Z8G02wtTBHwxUgbUvCQ7iSQtOLZflfoJDbbsm2jZQB/4sK75Tsjf
WI/T19SlzuaWY3vgix03aQTaqhH/PB23idQEsd4vmedV4QlrLBS7JSrXj4NF6dO4
nda4/sUqk7oZDodrjqljIeSMSLMMgTqk0G6xz9n6lchhSSdyVs7jZSnOpf2XX0BC
Whg8eGzEDs3Y8av9N1AZbcEzVKWguw==
=bCg9
-----END PGP SIGNATURE-----

--hSt2JuKKCbATmO2M--
