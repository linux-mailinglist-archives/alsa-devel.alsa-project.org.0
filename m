Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8682F79D8A3
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 20:24:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCDFB886;
	Tue, 12 Sep 2023 20:24:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCDFB886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694543091;
	bh=9PjwsXYdvGXo7MUL7wecpovXv5ZiPln8ttPB8U75U30=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hOcyyWYXDIEeyxSKMQ3aA8IcCV9uva2p7WjAIcU1rHcJ0S62w+nJqCSlUj4ZcILEv
	 Uj/q7p73u/TPS/CvuKM3WjS5Ese0EfV6oMezC5rbe1OoXrhu/agbArH2bnGDKfftna
	 peWB8VRWOamrWIK+Px9C0CNPhSTCiACOwxm4jo2Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 475C8F80537; Tue, 12 Sep 2023 20:24:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F0A4F80212;
	Tue, 12 Sep 2023 20:24:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 130D6F80246; Tue, 12 Sep 2023 20:23:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7D7A5F8007C
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 20:23:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D7A5F8007C
Authentication-Results: alsa1.perex.cz;
	dkim=fail reason="signature verification failed" (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=WiVa/+22
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id AF217B81DCF;
	Tue, 12 Sep 2023 18:23:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8926BC433C7;
	Tue, 12 Sep 2023 18:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694543030;
	bh=9PjwsXYdvGXo7MUL7wecpovXv5ZiPln8ttPB8U75U30=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WiVa/+22NCGW7IrffV01g/GdWC+ihuiANID47Be41qQQoSSJ9MWdaOfhEb9E0Q5VN
	 +r4kMs1yWdxu3fZxSMVAhcb1TNaDtndauRq5uWXU7mBetG9qmN4n6Ms8G4M3GnEpT6
	 IL8BpNw0B4f3QGsuR4iJODP+YKbeKGtOxcoRwXCmSfOmpw58KNwvZgqZoqFU46XehM
	 k5yjfS85vh+C4lBLsV3Gf18j3jx11EzTme/IAilZ+vPSeoagRxi7yNKtU2wB8T0SMM
	 fviEL+q+o20LzIhi5DMS0RPSpg2+62je5UWbBK2PUNRUJjbewFTZnJJWrRJjpUPVGS
	 Iyia4kBEwqV/g==
Received: (nullmailer pid 1158307 invoked by uid 1000);
	Tue, 12 Sep 2023 18:23:46 -0000
Date: Tue, 12 Sep 2023 13:23:46 -0500
From: Rob Herring <robh@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Randy Dunlap <rdunlap@infradead.org>, Jakub Kicinski <kuba@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>, Nicolin Chen <nicoleotsuka@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-gpio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Qiang Zhao <qiang.zhao@nxp.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Simon Horman <horms@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Fabio Estevam <festevam@gmail.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Eric Dumazet <edumazet@google.com>, Mark Brown <broonie@kernel.org>,
 netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, devicetree@vger.kernel.org,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Jaroslav Kysel
 a <perex@perex.cz>, Conor Dooley <conor+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Lee Jones <lee@kernel.org>,
 Li Yang <leoyang.li@nxp.com>
Subject: Re: [PATCH v5 07/31] dt-bindings: soc: fsl: cpm_qe: cpm1-scc-qmc:
 Add 'additionalProperties: false' in child nodes
Message-ID: <169454302597.1158257.5413851001884233921.robh@kernel.org>
References: <20230912081527.208499-1-herve.codina@bootlin.com>
 <20230912081527.208499-8-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230912081527.208499-8-herve.codina@bootlin.com>
Message-ID-Hash: IC53MAW463X33OLSAMPC7BKEA2YUGAUR
X-Message-ID-Hash: IC53MAW463X33OLSAMPC7BKEA2YUGAUR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IC53MAW463X33OLSAMPC7BKEA2YUGAUR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Tue, 12 Sep 2023 10:14:58 +0200, Herve Codina wrote:
> Additional properties in child node should not be allowed.
> 
> Prevent them adding 'additionalProperties: false'
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  .../devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml     | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

