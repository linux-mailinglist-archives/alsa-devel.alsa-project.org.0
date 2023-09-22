Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC857AB238
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Sep 2023 14:35:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53FD1E7B;
	Fri, 22 Sep 2023 14:34:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53FD1E7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695386107;
	bh=RzoEDKgXA9Plve5Vj9i1yQ82lvCPe4tIm9i1J+xrNbo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QXCgsOTkYGdc9WmmpO4wa45tH84MI0kFavBbSLnX+xSHFoijwSdfO3gLlYqor6PHc
	 tX4D+CiSaNZFyjXDIBzi6uluB+86x2gH7yYC8CzmvLHB994wzJAD6Oj15JhdRdowLO
	 wFLJzh3Mdl5Dd4/Z35qn9LyZND4TnYP7W9CKgee4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D73EF8047D; Fri, 22 Sep 2023 14:34:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8EC91F80124;
	Fri, 22 Sep 2023 14:34:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 683AFF80125; Fri, 22 Sep 2023 14:34:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 66BC2F800AA
	for <alsa-devel@alsa-project.org>; Fri, 22 Sep 2023 14:33:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66BC2F800AA
Authentication-Results: alsa1.perex.cz;
	dkim=fail reason="signature verification failed" (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=WXWXW5xB
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 0810ECE243B;
	Fri, 22 Sep 2023 12:33:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68252C433C7;
	Fri, 22 Sep 2023 12:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695386016;
	bh=RzoEDKgXA9Plve5Vj9i1yQ82lvCPe4tIm9i1J+xrNbo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WXWXW5xBiYKZk3MrZ3MFLRAgcBn0R31B8ZNj2AuqPCzk+0Wzk6sgKzXf7UHDyh/n0
	 dV4FcaGJTmvygVdouHHwRcrTHWKun9ktn8gwloWlIF7vCBQS1eWCq/O5AKOlDJVmnt
	 XLNSnLPYo1j9Gug2yMjntpdQjIWXPUeFu5xqBC7rC2UnpsFat6nj8TcuhfXh01qJUC
	 jeZGohmVpJSgSmtql/ZqFWiYyvRnDAsPOAm1VZJFoYdvCRBTE1apiup+5laG9NfQ9O
	 01D9CnITZPeK7d4eGlyMYc7adVzZk112bEqkg6sTtQpxhWLKexeAtRKB2ViyP8mOuY
	 j4yZ3wRBvNfYQ==
Received: (nullmailer pid 2919399 invoked by uid 1000);
	Fri, 22 Sep 2023 12:33:32 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: linux-arm-kernel@lists.infradead.org,
 Randy Dunlap <rdunlap@infradead.org>, Takashi Iwai <tiwai@suse.com>,
 Simon Horman <horms@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-gpio@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 netdev@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Andrew Lunn <andrew@lunn.ch>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 alsa-devel@alsa-project.org, Paolo Abeni <pabeni@redhat.com>,
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Shengjiu Wan
 g <shengjiu.wang@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 devicetree@vger.kernel.org, Li Yang <leoyang.li@nxp.com>,
 Qiang Zhao <qiang.zhao@nxp.com>
In-Reply-To: <20230922075913.422435-26-herve.codina@bootlin.com>
References: <20230922075913.422435-1-herve.codina@bootlin.com>
 <20230922075913.422435-26-herve.codina@bootlin.com>
Message-Id: <169538601225.2919383.2942072541503354871.robh@kernel.org>
Subject: Re: [PATCH v6 25/30] dt-bindings: net: Add the Lantiq PEF2256
 E1/T1/J1 framer
Date: Fri, 22 Sep 2023 07:33:32 -0500
Message-ID-Hash: GRNI3UYCETM5GOOMQPKRXUJNFEFCRHN4
X-Message-ID-Hash: GRNI3UYCETM5GOOMQPKRXUJNFEFCRHN4
X-MailFrom: SRS0=kpay=FG=robh_at_kernel.org=rob@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GRNI3UYCETM5GOOMQPKRXUJNFEFCRHN4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Fri, 22 Sep 2023 09:59:00 +0200, Herve Codina wrote:
> The Lantiq PEF2256 is a framer and line interface component designed to
> fulfill all required interfacing between an analog E1/T1/J1 line and the
> digital PCM system highway/H.100 bus.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  .../bindings/net/lantiq,pef2256.yaml          | 214 ++++++++++++++++++
>  1 file changed, 214 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/lantiq,pef2256.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/lantiq,pef2256.yaml: properties:lantiq,data-rate-bps: '$ref' should not be valid under {'const': '$ref'}
	hint: Standard unit suffix properties don't need a type $ref
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230922075913.422435-26-herve.codina@bootlin.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

