Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F497BC20C
	for <lists+alsa-devel@lfdr.de>; Sat,  7 Oct 2023 00:09:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BB101E4;
	Sat,  7 Oct 2023 00:08:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BB101E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696630156;
	bh=S/N63H4X+QPAGfS1YS/mBfx58DuAbwAsy+1fq8W1EuY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ee7UBW60qFS4Le3U/IL2CduPyy3fSUG7iakHpI3BKKC5wy/N8V6HGV24HZ6cZk9MV
	 ncVMSSJSO1F1qIRu0h7BpvkAYyqyCkx0ZNmSWaPA9yu3AVynQokr3I8FSWyrwBe1gM
	 UTIIFwurSaBryxS3V8gYyekLFAT4N1ldi5j0zeKo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B9D19F80130; Sat,  7 Oct 2023 00:08:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 600F5F800C1;
	Sat,  7 Oct 2023 00:08:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E05CCF8047D; Sat,  7 Oct 2023 00:08:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5C34DF80130
	for <alsa-devel@alsa-project.org>; Sat,  7 Oct 2023 00:08:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C34DF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=lqqUlsyH
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A041A60BB8;
	Fri,  6 Oct 2023 22:08:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46CD3C433C7;
	Fri,  6 Oct 2023 22:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696630092;
	bh=S/N63H4X+QPAGfS1YS/mBfx58DuAbwAsy+1fq8W1EuY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lqqUlsyH7HQbKjX6+5MZaW5p3Joc5/jp6VffbnbSi4frEd/pPhmgULRdlX5REnhpP
	 BK2xli8u32zh+fkxpuHUOLaTi6MD1PXmD4uaT4ger+hlNVtAIdfLCOrFRtKzFzQdQz
	 2sQXEvvtRBzYF6TTKxDU1a+OboOZzIkfFfzieoDXlciUuulj9kl61ww0wJPKsFKgrl
	 bG0J56gOoLjF3VNIh6eD3ijl/+KNdaIHPaK1qZBx8m+Qm/Nj6jA1it1GsSd/KDmDTO
	 8t97yI7Q9ito8x5R+7R8OzvwKOZlUfEqCdWiEARsL6pB/CF8A3b9DgN6yKbMV0niw2
	 jzXwcskBcwReg==
Date: Fri, 6 Oct 2023 15:08:10 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Andrew Lunn
 <andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Qiang Zhao <qiang.zhao@nxp.com>,
 Li Yang <leoyang.li@nxp.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li
 <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, Nicolin Chen
 <nicoleotsuka@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Randy Dunlap <rdunlap@infradead.org>, netdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, Simon
 Horman <horms@kernel.org>, Christophe JAILLET
 <christophe.jaillet@wanadoo.fr>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v7 24/30] net: wan: Add framer framework support
Message-ID: <20231006150810.09e2c1a9@kernel.org>
In-Reply-To: <20230928070652.330429-25-herve.codina@bootlin.com>
References: <20230928070652.330429-1-herve.codina@bootlin.com>
	<20230928070652.330429-25-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Message-ID-Hash: RBNOSVUFSNPANGFPAIXOFCIDC3BTJINT
X-Message-ID-Hash: RBNOSVUFSNPANGFPAIXOFCIDC3BTJINT
X-MailFrom: kuba@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RBNOSVUFSNPANGFPAIXOFCIDC3BTJINT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 28 Sep 2023 09:06:42 +0200 Herve Codina wrote:
> +menu "Framer Subsystem"
> +
> +config GENERIC_FRAMER
> +	bool "Framer Core"
> +	help
> +	  Generic Framer support.
> +	  A framer is a component in charge of an E1/T1 line interface.
> +	  Connected usually to a TDM bus, it converts TDM frames to/from E1/T1
> +	  frames. It also provides information related to the E1/T1 line.
> +	  Used with HDLC, the network can be reached through the E1/T1 line.
> +
> +	  This framework is designed to provide a generic interface for framer
> +	  devices present in the kernel. This layer will have the generic
> +	  API by which framer drivers can create framer using the framer
> +	  framework and framer users can obtain reference to the framer.
> +	  All the users of this framework should select this config.

maybe make the menu a menuconfig with info about framers but hide 
the GENERIC_FRAMER symbol? The driver 'select' it anyway, what's
the point of prompting the user..

> +	if (WARN_ON(!dev))
> +		return ERR_PTR(-EINVAL);

no defensive programming, let the kernel crash

> +	ret = framer_pm_runtime_get_sync(framer);
> +	if (ret < 0 && ret != -EOPNOTSUPP)
> +		goto err_pm_sync;
> +
> +	ret = 0; /* Override possible ret == -EOPNOTSUPP */

This looks pointless given that ret is either overwritten or not used
later on

> +	mutex_lock(&framer->mutex);
> +	if (framer->power_count == 0 && framer->ops->power_on) {
> +		ret = framer->ops->power_on(framer);
> +		if (ret < 0) {
> +			dev_err(&framer->dev, "framer poweron failed --> %d\n", ret);
> +			goto err_pwr_on;
> +		}
> +	}
> +	++framer->power_count;
> +	mutex_unlock(&framer->mutex);
> +	return 0;
