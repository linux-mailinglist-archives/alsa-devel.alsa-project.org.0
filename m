Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5477B5718
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Oct 2023 18:09:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32F4485D;
	Mon,  2 Oct 2023 18:08:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32F4485D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696262985;
	bh=A8RHgRJTdq1YDreXk6pMR2+4zGGe3daZlhUNpP+YvT0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SqaH02EMhGr/8WlU1syFdnmOjdxSsN4B0hHgRGCAT4nU9uLxqGXsEdE0GxBAB1w4e
	 Rrj/7INqILogNuDPJiTV93j9PdsrA5x4ithUEtURxNaAkGI2Sbo8RWzJ9e4cq5v/4b
	 UO7PTreGx8ET1ugHV3QtET53QteaFsR4LnWp4l/s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9B6F7F80551; Mon,  2 Oct 2023 18:08:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4052BF802E8;
	Mon,  2 Oct 2023 18:08:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B3714F802E8; Mon,  2 Oct 2023 18:08:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8B132F800C1
	for <alsa-devel@alsa-project.org>; Mon,  2 Oct 2023 18:08:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B132F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=fail reason="signature verification failed" (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=uHpSZwV+
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 3A78FB8119C;
	Mon,  2 Oct 2023 16:08:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEAD3C433C7;
	Mon,  2 Oct 2023 16:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696262924;
	bh=A8RHgRJTdq1YDreXk6pMR2+4zGGe3daZlhUNpP+YvT0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uHpSZwV+lJDbbehLSb/Spt3d5nct5tqN+zguTdzkPGP78BtxJA5slWfkTHCE8nFQo
	 5Yp3/oCpoJUvujCt8oxxEYnhBkzbbfdWcUXXSLMC2qKfBUPFd2AhM75roBWtzG12r+
	 zyO3n4G2YX0Ps18ARR/RDgmN7gspcIylPGhayXOz1Z3HxoUpPcb7dfOrvn+RuO5jOI
	 k2O/32V4DaM8k2gyvWyggG3PutfRoMw1ofZehwhbd+Ft3ixdNjLhr1VYMPu4nJnQko
	 xeOCGFGk/lxGzbnX61GXQT0EuQIbzaoX+ArQPRhaz4CGLZCfceZXmw3nFUYhiiDYic
	 5M3ipz/e+xiTA==
Received: (nullmailer pid 1849866 invoked by uid 1000);
	Mon, 02 Oct 2023 16:08:40 -0000
Date: Mon, 2 Oct 2023 11:08:40 -0500
From: Rob Herring <robh@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: linux-kernel@vger.kernel.org, Xiubo Li <Xiubo.Lee@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org, "David S. Miller" <davem@davemloft.net>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rob Herring <robh+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
	linuxppc-dev@lists.ozlabs.org, Qiang Zhao <qiang.zhao@nxp.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Li Yang <leoyang.li@nxp.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>, linux-gpio@vg,
	er.kernel.org@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Nicolin Chen <nicoleotsuka@gmail.com>
Subject: Re: [PATCH v7 25/30] dt-bindings: net: Add the Lantiq PEF2256
 E1/T1/J1 framer
Message-ID: <169626292036.1849826.7381200671829119399.robh@kernel.org>
References: <20230928070652.330429-1-herve.codina@bootlin.com>
 <20230928070652.330429-26-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230928070652.330429-26-herve.codina@bootlin.com>
Message-ID-Hash: DWIW2QSZLW3NBCL7VWAIO432CKRQGDBX
X-Message-ID-Hash: DWIW2QSZLW3NBCL7VWAIO432CKRQGDBX
X-MailFrom: SRS0=McIo=FQ=robh_at_kernel.org=rob@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DWIW2QSZLW3NBCL7VWAIO432CKRQGDBX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Thu, 28 Sep 2023 09:06:43 +0200, Herve Codina wrote:
> The Lantiq PEF2256 is a framer and line interface component designed to
> fulfill all required interfacing between an analog E1/T1/J1 line and the
> digital PCM system highway/H.100 bus.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  .../bindings/net/lantiq,pef2256.yaml          | 213 ++++++++++++++++++
>  1 file changed, 213 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/lantiq,pef2256.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

