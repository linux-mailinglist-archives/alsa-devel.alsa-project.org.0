Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8D779EB47
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Sep 2023 16:40:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFE1A852;
	Wed, 13 Sep 2023 16:40:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFE1A852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694616056;
	bh=RJoIfCcg3Gqvlc6Pv3L0lR4WCeRLMrROYaRGXX3uIAw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RMNnuo1FQJrpmPBqv4kzkfNldvihFnISivvVk8TyB1i+yCwPQP9zMEMdVRBvgZpID
	 Smm3p+fi5uafyjLr2h7ziim9Mb0LQGbB2PmTZJN71FR6i1stHJg3ytbGhKS7ucNVmZ
	 UcpKD7hTTIQOk/C5TbFjF4wXJQF0QKm9I7AnifSY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1CEFEF8055A; Wed, 13 Sep 2023 16:40:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 90578F80246;
	Wed, 13 Sep 2023 16:40:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3BB13F80425; Wed, 13 Sep 2023 16:40:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4BCD2F80212
	for <alsa-devel@alsa-project.org>; Wed, 13 Sep 2023 16:39:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BCD2F80212
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=h0mv2ujn
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2A1E8B81F26;
	Wed, 13 Sep 2023 14:39:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C64A7C433C8;
	Wed, 13 Sep 2023 14:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694615989;
	bh=RJoIfCcg3Gqvlc6Pv3L0lR4WCeRLMrROYaRGXX3uIAw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h0mv2ujnNPBV1QjbllewX4FCxcYj7UIsM7RYsumCnJYKKZxxARRvsgTPkchtVUrOG
	 Rml9dusWCC3tOaFcBAlQZ+HyhFi21PQ2icCnZXU3YytqIFh6XOGdkU+3kNu8TwDyhB
	 WJRDtBek5vWld2P/ShKcBo1SVBdzlme7UdBJijsO2e7k/u1AEtQ98HIez9iAnnMUp4
	 WtYw87YW09XXT8g6GAGAFdOQxLYlJqVfeq92qL/KbAHqYFGZFctKtSpKUUK5BmqQUq
	 W6tyh/Uvo62Cr0+7zVDD/qfL/7JXV4Zt19ttI2wt2FXW7Ioi+S8Uq74Ra8HfNT3oE4
	 dbw/bY7nHM5AQ==
Date: Wed, 13 Sep 2023 15:39:41 +0100
From: Conor Dooley <conor@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Herve Codina <herve.codina@bootlin.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Randy Dunlap <rdunlap@infradead.org>, netdev@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
	Simon Horman <horms@kernel.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v5 25/31] dt-bindings: net: Add the Lantiq PEF2256
 E1/T1/J1 framer
Message-ID: <20230913-faceless-sloppy-9c408191630a@spud>
References: <20230912081527.208499-1-herve.codina@bootlin.com>
 <20230912101444.225809-1-herve.codina@bootlin.com>
 <20230912-overplay-donated-080eb97803d6@spud>
 <20230912185405.GA1165807-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="f/ltRk1gE1+sCzTa"
Content-Disposition: inline
In-Reply-To: <20230912185405.GA1165807-robh@kernel.org>
Message-ID-Hash: DBXKMPNHH2IUW77OEL2HQIWEI7BHYZ2U
X-Message-ID-Hash: DBXKMPNHH2IUW77OEL2HQIWEI7BHYZ2U
X-MailFrom: conor@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DBXKMPNHH2IUW77OEL2HQIWEI7BHYZ2U/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--f/ltRk1gE1+sCzTa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 12, 2023 at 01:54:05PM -0500, Rob Herring wrote:
> > > +  lantiq,data-rate-bps:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    enum: [2048000, 4096000, 8192000, 16384000]
> >=20
> > -kBps is a standard suffix, would it be worth using that instead here?
> > What you have would fit as even multiples.
> > Otherwise Rob, should dt-schema grow -bps as a standard suffix?
>=20
> Yeah, I think that makes sense. I've added it now.

Cool, thanks!

--f/ltRk1gE1+sCzTa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQHJrQAKCRB4tDGHoIJi
0iNbAQCQvNI/6rj3MUcE4cZYQRwXdY48ReUFl3upkSIAwL59UwEA5YVuiJyYj+pl
y+M6tf6hogZBT32WxEtJnwijye97rQw=
=lb0d
-----END PGP SIGNATURE-----

--f/ltRk1gE1+sCzTa--
