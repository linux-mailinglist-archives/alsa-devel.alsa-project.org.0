Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDC67D7461
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Oct 2023 21:33:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 530ED6C1;
	Wed, 25 Oct 2023 21:32:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 530ED6C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698262407;
	bh=ZEC6SiD956fvl4s5yXxFlRFIaaeMysUnrTT9R0rL6uc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dwx7CzjTOo9g/JJsMGet97E2Lv1hEb4SqOcjyzjtBv8esuzipP9u7+Y3KbtKEaUl8
	 r8fYPYPih9xmwFHlP5hou9PpldaVrXobloPLzFKb1cx5AB/qA/dJZuCPJC8RJZrkhw
	 myDh0OHm1U1eCH5dfnDcaYWIUUMFSOVbUBvPAoUg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B88D4F80165; Wed, 25 Oct 2023 21:32:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 354A7F80157;
	Wed, 25 Oct 2023 21:32:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66840F80165; Wed, 25 Oct 2023 21:32:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 47260F8010B
	for <alsa-devel@alsa-project.org>; Wed, 25 Oct 2023 21:32:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47260F8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NNjzDaSG
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 327CFCE37DB;
	Wed, 25 Oct 2023 19:32:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7A68C433C7;
	Wed, 25 Oct 2023 19:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698262338;
	bh=ZEC6SiD956fvl4s5yXxFlRFIaaeMysUnrTT9R0rL6uc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NNjzDaSGX6Xm/ojy0S9ANDFMlr6eKMq9gQjnX+RSpD7B6pmXp9N1HZQcj7PnMXOaI
	 FPlk4cYKswApKmXKwZtFkLHe8Wd/MGYdolE+3ljriPunliyXP8I6vwS6kAryW675n0
	 w/YJ6ecaLbusz7GPBlZLWXa9nVVhQt+FCaqUj3I0522oj4hgjjsfiT7CU/6YwIxKv6
	 OBBMTyKRN8L2N3992/sREdR/vhMVZ/pCX7XS1EACF7/FZ1FaIqIV7XziFecwMyGOws
	 k2n7E3UYYAEQWd4eT7A7Ot5Gnu5jV3LmcJLia/oW/bjKXaWWcLXjfbX3XZgi/vuvgS
	 jaj/Vm8Qz315A==
Date: Wed, 25 Oct 2023 12:32:15 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Li Yang <leoyang.li@nxp.com>
Cc: Herve Codina <herve.codina@bootlin.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Andrew Lunn <andrew@lunn.ch>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Qiang
 Zhao <qiang.zhao@nxp.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
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
Subject: Re: [PATCH v8 00/30] Add support for QMC HDLC, framer
 infrastructure and PEF2256 framer
Message-ID: <20231025123215.5caca7d4@kernel.org>
In-Reply-To: <20231025170051.27dc83ea@bootlin.com>
References: <20231011061437.64213-1-herve.codina@bootlin.com>
	<20231013164647.7855f09a@kernel.org>
	<20231025170051.27dc83ea@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Message-ID-Hash: VN6PPMMO26OGOBV5RY75JBFXPGUPU2DJ
X-Message-ID-Hash: VN6PPMMO26OGOBV5RY75JBFXPGUPU2DJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VN6PPMMO26OGOBV5RY75JBFXPGUPU2DJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 25 Oct 2023 17:00:51 +0200 Herve Codina wrote:
> > Which way will those patches go? Via some FSL SoC tree?  
> 
> This series seems mature now.
> What is the plan next in order to have it applied ?
> 
> Don't hesitate to tell me if you prefer split series.

FWIW we are happy to take the drivers/net/ parts if there is no hard
dependency. But there's no point taking that unless the SoC bits
also go in for 6.7.

Li Yang, what are your expectations WRT merging this series?
