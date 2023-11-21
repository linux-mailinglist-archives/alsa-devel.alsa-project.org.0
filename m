Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2712D7F33C4
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Nov 2023 17:31:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 751FADED;
	Tue, 21 Nov 2023 17:31:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 751FADED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700584286;
	bh=I7rTz58KR+S4gPSJUCHMuvvrAgbVHDd5w5snGcC6fmI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aX41t26uPKjKbfo6Gi2HZ55Rgc7884vgr5jR2gqKk0surc0OPtIolZRHr7y2Cy1wo
	 ueXGLXqxHE0Yvfpn3RFbKoFjLifhhL8DAm6L2780cp1TJlPvroD1akKmoRPBmisS4/
	 9Q//sPs4bR98w2XBe1ceDNFCNZNGtxQdBJlPJMvw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0262F8057D; Tue, 21 Nov 2023 17:30:54 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F0F3AF80579;
	Tue, 21 Nov 2023 17:30:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1145F802E8; Tue, 21 Nov 2023 17:29:19 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 0C965F80166
	for <alsa-devel@alsa-project.org>; Tue, 21 Nov 2023 17:29:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C965F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=akn0TQ1t
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 478C461A81;
	Tue, 21 Nov 2023 16:29:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 914BEC433C7;
	Tue, 21 Nov 2023 16:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700584148;
	bh=I7rTz58KR+S4gPSJUCHMuvvrAgbVHDd5w5snGcC6fmI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=akn0TQ1tx9tIwVVjKiVUiShOxIyrgDS6HtWnmTgRUnnSklSjnfnhzl6+GuCsg5RjU
	 9SptLlLrBWaCEUXZt0ADSJ8CEKkqk2wF9KzP8cpzH4Gx09Owg9SZqDfyLEIg5QoKtl
	 yQghzy2Lc/VM67gqmGXGWcz4FaVbhGzQPssRmIrwgDrV26t4om/KFBJPyKHznpDeiP
	 wuqu+EX+sVaxwVH4N3+S5L9cHSc3CZb/Ev9j42UeMW/BbZmfG/VtCndmMqUDv495E7
	 YkCJYcWckqEaSJD5gcvnhn23OD3MEoSCXL9FZ8InCUW36S86FsgcPUYQUVaL1QHMTK
	 eeh5PRJrW3VzQ==
Date: Tue, 21 Nov 2023 08:29:06 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Mark Brown <broonie@kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>, Li
 Yang <leoyang.li@nxp.com>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Andrew Lunn
 <andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Liam
 Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li
 <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, Nicolin Chen
 <nicoleotsuka@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Randy Dunlap <rdunlap@infradead.org>, netdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, Simon
 Horman <horms@kernel.org>, Christophe JAILLET
 <christophe.jaillet@wanadoo.fr>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v9 00/27] Add support for QMC HDLC, framer
 infrastructure and PEF2256 framer
Message-ID: <20231121082906.354c9a7e@kernel.org>
In-Reply-To: <20231121084330.4064bf14@bootlin.com>
References: <20231115144007.478111-1-herve.codina@bootlin.com>
	<20231117164746.0589e955@kernel.org>
	<573c9ca1-a560-4f7a-ba21-80673a2e162e@sirena.org.uk>
	<20231121084330.4064bf14@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Message-ID-Hash: VN253NXNT6YCCH63VAUCTLGOSQEQW63E
X-Message-ID-Hash: VN253NXNT6YCCH63VAUCTLGOSQEQW63E
X-MailFrom: kuba@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VN253NXNT6YCCH63VAUCTLGOSQEQW63E/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 21 Nov 2023 08:43:30 +0100 Herve Codina wrote:
> I plan to send the v10 with the patch 23 fixed.
> Based on that v10, some patches (21 to 25 at least) could be applied and
> I will remove them for the future v11.
> I think it will be easier to follow if I iterate on the series removing
> patches as soon as they are applied.

It'd be helpful if you only reposted the patches you expect
to be applied, as a standalone series.
