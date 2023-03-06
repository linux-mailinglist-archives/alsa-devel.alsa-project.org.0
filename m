Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C646AC5BC
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Mar 2023 16:43:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF4551125;
	Mon,  6 Mar 2023 16:42:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF4551125
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678117389;
	bh=nB4ijDWwr++TTjml87oexpk5dGZAXKgKh6x6cTFPTAA=;
	h=Date:From:To:Subject:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vA4QpCHONHtmdG6ptYWE5PZe2wwOIzjyRpEtGmyzHrpbaouk+vpFzcBmaOlW676aD
	 u7eEYcnZ6DdTnDRjie3sooiOAYx79vjgAHaXuwa4lWVfaP8eE81yJZ8UorbcPWWnGf
	 MBSZYT39mmNKFquXKHueqGYE0m7oZU1YfpHPI5J0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 24C63F80236;
	Mon,  6 Mar 2023 16:42:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0F45F8042F; Mon,  6 Mar 2023 16:42:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7B9CCF800C9
	for <alsa-devel@alsa-project.org>; Mon,  6 Mar 2023 16:42:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B9CCF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Y7pgUr7Q
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id B37C4240009;
	Mon,  6 Mar 2023 15:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678117328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4+e/cUqhhX/VA/vt11SGpFMg3F+XphXS1/Hro38i4j0=;
	b=Y7pgUr7QHXRIZk9xlTpsJCwpUTN6J93viTIZPEPSAu5ZhECKJ2jOfMP9JFBqxLQNuei34Z
	tKLWB7FoAqSYE1PTY6ROhpqYUfgTlToyScGeKDgIVmUER65rZTwF9S1kKKWTu/P2Wrno5b
	fjLhWcgMRzdMyJCOtqls3mPQbmf6lgBIJJzqhScg+Vc5VY+ufSUGvRYmuaHL/vScl+JD+h
	5iPYWJhDzoQX5TLjFPLfFYWP8nErrdcYz0KDIE1sjeJcH67gkRx79N2SEaiVlz/MkMJK4L
	UwV37a+dm/zpn1w7yGKYoqjcPjwxlcQ7wOcVaX2spOpnPyfxvvOgD5jlmJbnAg==
Date: Mon, 6 Mar 2023 16:41:58 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 01/10] dt-bindings: soc: fsl: cpm_qe: Add TSA
 controller
Message-ID: <20230306164158.767e6420@bootlin.com>
In-Reply-To: <20230226174833.GA76710-robh@kernel.org>
References: <20230217145645.1768659-1-herve.codina@bootlin.com>
	<20230217145645.1768659-2-herve.codina@bootlin.com>
	<20230226174833.GA76710-robh@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: L2KRNLUPLMLXWTN45OYZRDSDRLLNDW3L
X-Message-ID-Hash: L2KRNLUPLMLXWTN45OYZRDSDRLLNDW3L
X-MailFrom: herve.codina@bootlin.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Li Yang <leoyang.li@nxp.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Qiang Zhao <qiang.zhao@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L2KRNLUPLMLXWTN45OYZRDSDRLLNDW3L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Rob,
On Sun, 26 Feb 2023 11:48:33 -0600
Rob Herring <robh@kernel.org> wrote:

[...]
> > +  '#size-cells':
> > +    const: 0
> > +
> > +  '#fsl,serial-cells': =20
>=20
> #foo-cells is for when there are differing foo providers which need=20
> different number of cells. That's not the case here.
>=20

Ok, I will remove the #fsl,serial-cells property on the next iteration.

On the next series iteration, I will also remove the #fsl,chan-cells proper=
ty
present later on a patch related to the QMC binding. The #fsl,chan-cells ne=
eds
to be removed exactly for the same reason.

> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    const: 1
> > +    description:
> > +      TSA consumers that use a phandle to TSA need to pass the serial =
identifier
> > +      with this phandle (defined in dt-bindings/soc/fsl,tsa.h).
> > +      For instance "fsl,tsa-serial =3D <&tsa FSL_CPM_TSA_SCC4>;". =20

Thanks for the review.
Herv=C3=A9
