Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BE17C9178
	for <lists+alsa-devel@lfdr.de>; Sat, 14 Oct 2023 01:44:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC3CB1FE;
	Sat, 14 Oct 2023 01:43:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC3CB1FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697240677;
	bh=kIvC6oLJ2+AUx/IOgUHH4CZaon+yoM/YFfB71HCTxoc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EElkF/Wb2l2D12g0VMK6qffgvPZ/u11KgOhsc5GUU7Ufwxnv8gN9rdr/C4DDuju2X
	 CmPX1GRlLhZ5nI7fc7Jks61RixqmHaSe65x6pfTURsG9eUGUuQJ7P2BB4pKu3Lq0Kq
	 BLUai/aioH++lxAyV6flLUmXE52ylYJYQg7jXqjw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EAAC4F80567; Sat, 14 Oct 2023 01:43:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 479B9F8055A;
	Sat, 14 Oct 2023 01:43:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 05D71F8055B; Sat, 14 Oct 2023 01:43:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A30D3F80557
	for <alsa-devel@alsa-project.org>; Sat, 14 Oct 2023 01:43:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A30D3F80557
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=DmEHKd62
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6472A62202;
	Fri, 13 Oct 2023 23:43:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A580BC433C9;
	Fri, 13 Oct 2023 23:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697240589;
	bh=kIvC6oLJ2+AUx/IOgUHH4CZaon+yoM/YFfB71HCTxoc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DmEHKd62ExSoKx+QQTE8u6t6elMWQi+ciycFGNKuR3+RMCBnOSd6WPu4Ar5bfSDyV
	 xh2CYO2261DINbmmhtcLu48ob/63h140+lRZ25WKDYryUxGsPokoFvwO5zt061fpCu
	 uWvVYFoMb+OjR/yj6D/0gyNF5RwtBOcvwsvHO2peuMUReiVB67TnGQ5vzQvhcJkrLM
	 c05TEqAaWXjQYuuke1xVlZE/t0oBH3Trqw4qmImFfE8DvbcWeBkWKrZnxiy8X/YmD1
	 KTOkWb4aBraL8iM4R44weNIwUm0B7qeJ8hRB2k/hPsDfIzL98dtKmCWZhyWj0fFboH
	 uYkxKBu92Zfqg==
Date: Fri, 13 Oct 2023 16:43:06 -0700
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
Subject: Re: [PATCH v8 23/30] wan: qmc_hdlc: Add runtime timeslots changes
 support
Message-ID: <20231013164306.423c8723@kernel.org>
In-Reply-To: <20231011061437.64213-24-herve.codina@bootlin.com>
References: <20231011061437.64213-1-herve.codina@bootlin.com>
	<20231011061437.64213-24-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Message-ID-Hash: VIRSRD3XKA7XN47JBQP4ZWALTVRW4COB
X-Message-ID-Hash: VIRSRD3XKA7XN47JBQP4ZWALTVRW4COB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VIRSRD3XKA7XN47JBQP4ZWALTVRW4COB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 11 Oct 2023 08:14:27 +0200 Herve Codina wrote:
> QMC channels support runtime timeslots changes but nothing is done at
> the QMC HDLC driver to handle these changes.
> 
> Use existing IFACE ioctl in order to configure the timeslots to use.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Acked-by: Jakub Kicinski <kuba@kernel.org>
