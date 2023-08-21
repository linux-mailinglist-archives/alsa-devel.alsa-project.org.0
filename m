Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30189782B29
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Aug 2023 16:07:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 175EC832;
	Mon, 21 Aug 2023 16:06:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 175EC832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692626852;
	bh=jskCnmfcQS5EFi06b4333cYtIRY89QRwP0GiuGw2lz8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Hg5zfrO2UK2CmnBVm1ZW4FuGJ3C55o2jzNlB0PjNoZNPnheGIORCR3wqnSbwqvSfr
	 Ugs0URkTpbAREpjn3B92vYo9JMObu7Ah8vjKEFPyMW4fVAHbuOC4KA7JluUdO0/TvY
	 QSzeZSki+iE4oBEcDTJQ9VMRXVZnF1UoxllWV8ss=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C5B1F8025E; Mon, 21 Aug 2023 16:06:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 99A56F8016C;
	Mon, 21 Aug 2023 16:06:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B6D20F80199; Mon, 21 Aug 2023 16:06:35 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 8703DF800F8
	for <alsa-devel@alsa-project.org>; Mon, 21 Aug 2023 16:06:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8703DF800F8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=OPZBm3I8
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8FDE761849;
	Mon, 21 Aug 2023 14:06:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64BCCC433C7;
	Mon, 21 Aug 2023 14:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692626785;
	bh=jskCnmfcQS5EFi06b4333cYtIRY89QRwP0GiuGw2lz8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OPZBm3I8NJHoZf7lNV4qSpa5xDGS9Hj6d9J+HQ41DwnpKpgECp2/T0IvOCJNncVya
	 KUOCkzttOoxWUVf7H+69kgVBsKZOKqz22xOIyUo7v+iP0131btrysBz0SMywPcyYhE
	 r1LIquZBVqSczHC4FriOFXStKLlwWUx/900G6VzQA/QFZ5AJ+cAqk8rJs5nNpuXjH/
	 tj3V7Cvm/SvDWo97FwWn3Xcjh5X78b0j+JKRlXkGx1lUIhLdZYMK68JF7e8T4ZvBiR
	 5QCv5J7Z3bgb6+r7F0T8wA32Q/jw4GdjpCsRAZe18V0ZmeVy9c/BFOAhNVhnSzL53g
	 +nsYCO0dsNUdA==
Received: (nullmailer pid 1479558 invoked by uid 1000);
	Mon, 21 Aug 2023 14:06:22 -0000
Date: Mon, 21 Aug 2023 09:06:22 -0500
From: Rob Herring <robh@kernel.org>
To: Adam Ford <aford173@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-kernel@lists.infradead.org, aford@beaconembedded.com,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: fsl_easrc: Add support for
 imx8mp-easrc
Message-ID: <20230821140622.GA1473812-robh@kernel.org>
References: <20230820175655.206723-1-aford173@gmail.com>
 <f5b16676-04b9-7864-ffa7-1c48f3c2ca9c@linaro.org>
 <6089b46d-a580-af52-0cac-84b46fe11e6c@linaro.org>
 <CAHCN7xJyOjKSXbm17roAJDbk-gDKQHprE9t1d4VH2uYSMZcEDg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: 
 <CAHCN7xJyOjKSXbm17roAJDbk-gDKQHprE9t1d4VH2uYSMZcEDg@mail.gmail.com>
Message-ID-Hash: JGGGZY7U462NKTG4R4ZL7RM5AJDEU273
X-Message-ID-Hash: JGGGZY7U462NKTG4R4ZL7RM5AJDEU273
X-MailFrom: SRS0=A38r=EG=robh_at_kernel.org=rob@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JGGGZY7U462NKTG4R4ZL7RM5AJDEU273/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, Aug 20, 2023 at 04:05:16PM -0500, Adam Ford wrote:
> On Sun, Aug 20, 2023 at 3:33 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
> >
> > On 20/08/2023 22:32, Krzysztof Kozlowski wrote:
> > > On 20/08/2023 19:56, Adam Ford wrote:
> > >> The i.MX8MP appears to have the same easrc support as the Nano, so
> > >> add imx8mp as an option with a fallback to imx8mn.
> > >>
> > >> Signed-off-by: Adam Ford <aford173@gmail.com>
> > >>
> > >> diff --git a/Documentation/devicetree/bindings/sound/fsl,easrc.yaml b/Documentation/devicetree/bindings/sound/fsl,easrc.yaml
> > >> index bdde68a1059c..2d53b3b10f2c 100644
> > >> --- a/Documentation/devicetree/bindings/sound/fsl,easrc.yaml
> > >> +++ b/Documentation/devicetree/bindings/sound/fsl,easrc.yaml
> > >> @@ -14,7 +14,11 @@ properties:
> > >>      pattern: "^easrc@.*"
> > >>
> > >>    compatible:
> > >> -    const: fsl,imx8mn-easrc
> > >> +    oneOf:
> > >> +      - items:
> > >> +          - enum:
> > >> +              - fsl,imx8mp-easrc
> > >> +          - const: fsl,imx8mn-easrc
> > >
> > > You need here also const for fsl,imx8mn-easrc, otherwise you do not
> > > allow it alone. Test it for fsl,imx8mn-easrc DTS - you will notice warnings.
> >
> > Actually, I see now Rob's report... you did not have to test DTS even.
> > It was enough to test your change and this test was missing :(. Please
> > test your changes before sending.
> 
> For what it's worth, I did run 'make dt_binding_check', but I didn't
> run it with the extra flags from Rob's e-mail.  The tool didn't return
> any errors.

The error is not related to the '-m' (undocumented compatible) warning. 
It is as Krzysztof said.

Rob
