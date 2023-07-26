Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DFA762A2E
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jul 2023 06:16:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5EAB47F8;
	Wed, 26 Jul 2023 06:15:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5EAB47F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690344979;
	bh=JctyBO2YGDNHm6PyaYDElro5t1yWDJCFcyBIWaxzZLM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LURvL+l1G8h/usmJtlKvwX2CZfP37kaw4Mz8jda33JX6fNpjt9SuUrgfV0cC4vado
	 GFCzG78OYb5dbc8a2YbPimXs2PBGRwWZuxfRW5pAGnGkhEocxK2oQMrqFR/iIpV3vs
	 E0sP6X+sjbuDSD2bVcr+onMMd8Zh0l7XXgT6UyvY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C9F6F80153; Wed, 26 Jul 2023 06:15:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 748D8F80153;
	Wed, 26 Jul 2023 06:15:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 760FAF8019B; Wed, 26 Jul 2023 06:14:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8FDA2F800C7
	for <alsa-devel@alsa-project.org>; Wed, 26 Jul 2023 06:14:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FDA2F800C7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=CncVg9XC
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 61407611D8;
	Wed, 26 Jul 2023 04:14:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 855FCC433C8;
	Wed, 26 Jul 2023 04:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690344865;
	bh=JctyBO2YGDNHm6PyaYDElro5t1yWDJCFcyBIWaxzZLM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CncVg9XCuOLZ7wI2l6fLx7/R1NMrNWelj3kUrm4rZfMdvSuTwYGpmTN0y1Zu76Tpr
	 dJyX+eas2yz+azx5J1DiGLD/3bB6EpoA+bs1CXtyZWZSHwI1h8n4RHNH5PGGL1d9Q5
	 T2iBMuuNuFzaUMc/KlkJndDN/KS81elqs8bqwYuCv9K9NEF+mrKiAj17s0Rpkfnnie
	 wvWtQAWMzY23+5E9xEP9DyL0tEiz1oissxpVF4jqf6M9qeEn5NjaAOJ+C71bfuDsO5
	 0pRboaWRg76D3OJMxx9u+wpH+7izUWI4pRmEPGyjqk7FbFQ7sJih9+6mq4x7rBlkG8
	 6UNFyA/sc9S1A==
Date: Tue, 25 Jul 2023 21:14:23 -0700
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
 Leroy <christophe.leroy@csgroup.eu>, netdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 00/26] Add support for QMC HDLC, framer infrastruture
 and PEF2256 framer
Message-ID: <20230725211423.742f0a6a@kernel.org>
In-Reply-To: <20230725092417.43706-1-herve.codina@bootlin.com>
References: <20230725092417.43706-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Message-ID-Hash: SCEIJLFDVHNRO3OJU7CF4JK6QSRMU2X2
X-Message-ID-Hash: SCEIJLFDVHNRO3OJU7CF4JK6QSRMU2X2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SCEIJLFDVHNRO3OJU7CF4JK6QSRMU2X2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 25 Jul 2023 11:23:36 +0200 Herve Codina wrote:
> I have a system where I need to handle an HDLC interface and some audio
> data.

The new code must build cleanly with C=1 W=1, after every individual
patch.
-- 
pw-bot: cr
