Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B37147EFCC4
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Nov 2023 01:49:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E60FFA4B;
	Sat, 18 Nov 2023 01:48:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E60FFA4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700268583;
	bh=t57+RslQFeKnJM3h8s2TI3ZEoZEyxEDagVoPEqzUmqw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=P67ePGiMjPEB2c4rnlfSk5f8FUYGZBnkYIrkXonnW6PlJyCdQBoTtPNC1v+n2Ebt0
	 CGs4ekRZurS+GMPpPK1rakYY1IPctTAGk9uGOyNZae8MztCEZHo42lytIJrxgHbpYs
	 /WHfCdoke2CRFAGZwgXZkKeOScqNYp1xeyXSDRQM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 580F3F80249; Sat, 18 Nov 2023 01:48:23 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ABE6BF80152;
	Sat, 18 Nov 2023 01:48:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA2C0F801D5; Sat, 18 Nov 2023 01:48:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B19D2F800ED
	for <alsa-devel@alsa-project.org>; Sat, 18 Nov 2023 01:47:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B19D2F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=IQs7w7qt
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A0994CE263D;
	Sat, 18 Nov 2023 00:47:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8519BC433C9;
	Sat, 18 Nov 2023 00:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700268468;
	bh=t57+RslQFeKnJM3h8s2TI3ZEoZEyxEDagVoPEqzUmqw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=IQs7w7qtKk/3FDjQkfTHKofphFehwcjkn9sjAVqiiHlSDHnFUcUkqWO8Pgy3/zFmE
	 AYMxPhjIt2GLa120lU8rpSUpci65qybU5kUTOhFbIfkFH3RLmL0sN3R9pYs16YqCSF
	 XRxSzYGV2+s2rvQbEXVZ4MHsne/RFlWGj9KeEMZjxZdhMEnzuEyTkQv/OnyofsMWZZ
	 CaTDitfbHF8ZXhHsP7bVr9bMIlJ4g2xPv9dMUPOon34EIUZXPEStD4TybsNM0X4xAW
	 O8zkdi3a45WxLIZPa8lYBeydEX+isHSwUwieWbWg0ggRi230gqABIRCwmK0BxaEy1j
	 Q5HjtqnDzNerw==
Date: Fri, 17 Nov 2023 16:47:46 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Andrew Lunn
 <andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Qiang
 Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Shengjiu Wang
 <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam
 <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Randy Dunlap <rdunlap@infradead.org>,
 netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org, Simon Horman <horms@kernel.org>, Christophe
 JAILLET <christophe.jaillet@wanadoo.fr>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v9 00/27] Add support for QMC HDLC, framer
 infrastructure and PEF2256 framer
Message-ID: <20231117164746.0589e955@kernel.org>
In-Reply-To: <20231115144007.478111-1-herve.codina@bootlin.com>
References: <20231115144007.478111-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Message-ID-Hash: IDIVGKXBOBFNFCC527MDF5QCDLDOZQC2
X-Message-ID-Hash: IDIVGKXBOBFNFCC527MDF5QCDLDOZQC2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IDIVGKXBOBFNFCC527MDF5QCDLDOZQC2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 15 Nov 2023 15:39:36 +0100 Herve Codina wrote:
>    - Removed Patches 6, 7 and 8 (patches applied)
> 
>    - Patches 7, 20, 21, 23 (patches 10, 23, 24, 26 in v8)
>      Add 'Acked-by: Jakub Kicinski <kuba@kernel.org>'

I thought someone (Mark?) asked for the networking stuff to be put 
on a branch. If that's still the preference - is it possible to factor
these out as a standalone series, too?  Will they build on their own?
