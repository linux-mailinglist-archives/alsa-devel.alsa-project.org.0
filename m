Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A37B7AE5AA
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Sep 2023 08:19:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B2BE9F6;
	Tue, 26 Sep 2023 08:18:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B2BE9F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695709180;
	bh=kGF7bGmtwYRWgUZmy6Siy8RwBtT0hNGGeH+iUiTU2dw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=i6vFI3jSMFbREaCH2PJGOSkwMKbOvmQ8ZNV372VuxYpMEGvVUcZecHNmFxERpkRsb
	 TU6Yh6P6fTlRc56dJwU9FlU+RLN+cJVb4JAlEss5IUxjzGJXaZV/VCazPpSqt7yuVz
	 /WwrbvyGTUfzC2IUifIbgnJv+1Sn1HfQoRkCfAdU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D9EFF80553; Tue, 26 Sep 2023 08:18:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D3ACCF80166;
	Tue, 26 Sep 2023 08:18:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43D2AF801D5; Tue, 26 Sep 2023 08:16:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CEBF4F80166
	for <alsa-devel@alsa-project.org>; Tue, 26 Sep 2023 08:16:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CEBF4F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oIGO8IF3
Received: by mail.gandi.net (Postfix) with ESMTPSA id E4C8640002;
	Tue, 26 Sep 2023 06:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695708971;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ujWjVGuy4dT6unLLLWziSi5PLKzhpynPY9RTZBnxGwk=;
	b=oIGO8IF31DJJA2EGozaZKK2wlXz/swohWFBat1HvAudglHQA4x4gfzgF7oXHYynuEAs6CO
	mqUgtgucAH1exMSSkAv+EOEZ0c4NeVfOZlWIF3szEJo+9aMT119c2CPmaoMih9J8hX7EJp
	2Pkg/zP427YLxkl6b4D2Nis7/eUV19HIimsagGaiCyrIeamOiYc+eNrC79Kqb5VqGuDae7
	qkbb8UUbxndHfgymj9uehhZfmfyj/BKkC+W5XMWkwNIZzo8SONYG4Oqq/XKQZ+nbp5yufC
	6vwKYX7BJulSOKEVgUXo8elNA23T8SeF1cnERnAlK1ZueLL/5puINDuXzlxgYg==
Date: Tue, 26 Sep 2023 08:16:08 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu
 <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, David Rau
 <David.Rau.opensource@dm.renesas.com>, Damien Horsley
 <Damien.Horsley@imgtec.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] ASoC: dt-bindings: Add missing
 (unevaluated|additional)Properties on child node schemas
Message-ID: <20230926081608.2eea3919@bootlin.com>
In-Reply-To: <20230925220947.2031536-1-robh@kernel.org>
References: <20230925220947.2031536-1-robh@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: X5UKLVQDIDVYKKWOH7LX6AADRPYAYQKT
X-Message-ID-Hash: X5UKLVQDIDVYKKWOH7LX6AADRPYAYQKT
X-MailFrom: herve.codina@bootlin.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X5UKLVQDIDVYKKWOH7LX6AADRPYAYQKT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 25 Sep 2023 17:09:28 -0500
Rob Herring <robh@kernel.org> wrote:

> Just as unevaluatedProperties or additionalProperties are required at
> the top level of schemas, they should (and will) also be required for
> child node schemas. That ensures only documented properties are
> present for any node.
> 
> Add unevaluatedProperties or additionalProperties as appropriate.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/sound/dialog,da7219.yaml | 1 +
>  Documentation/devicetree/bindings/sound/fsl,qmc-audio.yaml | 1 +
>  Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml   | 1 +
>  3 files changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/dialog,da7219.yaml b/Documentation/devicetree/bindings/sound/dialog,da7219.yaml
> index eb7d219e2c86..19137abdba3e 100644
> --- a/Documentation/devicetree/bindings/sound/dialog,da7219.yaml
> +++ b/Documentation/devicetree/bindings/sound/dialog,da7219.yaml
> @@ -89,6 +89,7 @@ properties:
>  
>    da7219_aad:
>      type: object
> +    additionalProperties: false
>      description:
>        Configuration of advanced accessory detection.
>      properties:
> diff --git a/Documentation/devicetree/bindings/sound/fsl,qmc-audio.yaml b/Documentation/devicetree/bindings/sound/fsl,qmc-audio.yaml
> index ff5cd9241941..b522ed7dcc51 100644
> --- a/Documentation/devicetree/bindings/sound/fsl,qmc-audio.yaml
> +++ b/Documentation/devicetree/bindings/sound/fsl,qmc-audio.yaml
> @@ -33,6 +33,7 @@ patternProperties:
>      description:
>        A DAI managed by this controller
>      type: object
> +    additionalProperties: false
>  
>      properties:
>        reg:
> diff --git a/Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml b/Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml
> index b6a4360ab845..0b4f003989a4 100644
> --- a/Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml
> +++ b/Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml
> @@ -60,6 +60,7 @@ properties:
>  
>    ports:
>      $ref: audio-graph-port.yaml#/definitions/port-base
> +    unevaluatedProperties: false
>      properties:
>        port@0:
>          $ref: audio-graph-port.yaml#

At least for sound/fsl,qmc-audio.yaml:

Acked-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé
