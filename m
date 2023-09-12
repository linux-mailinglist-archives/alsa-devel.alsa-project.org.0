Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EAB79D887
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 20:17:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43055A4D;
	Tue, 12 Sep 2023 20:16:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43055A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694542659;
	bh=jh5T5UyTegwwkeivH1ZRwP9K8owrs1S2MNDdSEDICis=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=f7jfk6bODX0wqeVmD+5ZAwWoQ46WzMBQ4lgBQ34M30gUUIKjA4By3kSEh6K0af0BZ
	 GdR1dkdjx/W9uj1WYrnlH9BTaCw6u5sfFnm+t2edlpIhRTrDzIkyqMeYKI72PviBFh
	 DG1OTjR0R40InWGr0+8cqOFd9CLT7LdfgLNboEWk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A55CF80212; Tue, 12 Sep 2023 20:16:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EC651F8007C;
	Tue, 12 Sep 2023 20:16:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A4C3F80246; Tue, 12 Sep 2023 20:16:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C8BD6F8007C
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 20:16:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8BD6F8007C
Authentication-Results: alsa1.perex.cz;
	dkim=fail reason="signature verification failed" (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=IR/OMxa+
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 518AFB81D36;
	Tue, 12 Sep 2023 18:16:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13FEEC433C8;
	Tue, 12 Sep 2023 18:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694542573;
	bh=jh5T5UyTegwwkeivH1ZRwP9K8owrs1S2MNDdSEDICis=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IR/OMxa+L/bn1llX2o1lzvlA23d6gd9+e4J/5n+gNZUlkl5qVwDFTgM229ZQ02Ic2
	 VfRf2BmYijB+VI6390vsTYIKDqeKXxto/q8crI/8TX8BxRjVK/RUxqRQZilOMBwi+/
	 2fYTPQIZB1wTptoIp/d6wiYH90WyhiRSdC5dtgSD0m37vpG/N/W97GXw0N/vMZlYMP
	 +zgqa/euRQfMYKkLwNBcIl87bdS28ZoeNUALmlv+5W5iYWqfRfXzFSKBu82MyvXjGe
	 4763B2z9gcCo2GD81Pa9cpgRE6z/q+0LRRpwbwuP5VcbDgpxxk7CpQ3EK+b4M3EHyG
	 HiyoyYLJ1g78Q==
Received: (nullmailer pid 1126678 invoked by uid 1000);
	Tue, 12 Sep 2023 18:16:08 -0000
Date: Tue, 12 Sep 2023 13:16:08 -0500
From: Rob Herring <robh@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew@lunn.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Qiang Zhao <qiang.zhao@nxp.com>,
 Li Yang <leoyang.li@nxp.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Randy Dunlap <rdunlap@infradead.org>, netdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
 Simon Horman <hor
 ms@kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v5 06/31] dt-bindings: soc: fsl: cpm_qe: cpm1-scc-qmc:
 Fix example property name
Message-ID: <20230912181608.GA1111902-robh@kernel.org>
References: <20230912081527.208499-1-herve.codina@bootlin.com>
 <20230912081527.208499-7-herve.codina@bootlin.com>
 <20230912175832.GA995540-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230912175832.GA995540-robh@kernel.org>
Message-ID-Hash: XNB7KW43FKF5SD4ICVQ776CHTXUOT3XN
X-Message-ID-Hash: XNB7KW43FKF5SD4ICVQ776CHTXUOT3XN
X-MailFrom: SRS0=xM+6=E4=robh_at_kernel.org=rob@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XNB7KW43FKF5SD4ICVQ776CHTXUOT3XN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Sep 12, 2023 at 12:58:32PM -0500, Rob Herring wrote:
> On Tue, Sep 12, 2023 at 10:14:57AM +0200, Herve Codina wrote:
> > The given example mentions the 'fsl,mode' property whereas the
> > correct property name, the one described, is 'fsl,operational-mode'.
> > 
> > Fix the example to use the correct property name.
> > 
> > Fixes: a9b121327c93 ("dt-bindings: soc: fsl: cpm_qe: Add QMC controller")
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > ---
> >  .../bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml           | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> I have this same fix in my tree, but you missed something. Please add 
> additionalProperties or unevaluatedProperties to the child node schema 
> so that this error is flagged.

NM, I see the next patch now.

Acked-by: Rob Herring <robh@kernel.org>
