Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A5B902B64
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jun 2024 00:12:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65971823;
	Tue, 11 Jun 2024 00:12:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65971823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718057540;
	bh=Yzsgn2Ian0INJdPXwI7k53c47LSDS6kp4v1j3BFH0K8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XQJzQd83+GoX0+oi8XKVyfPxvqGL4LGZ3oV3nS0gPCy2rgMlHrRGCJ+De6dPIfeeT
	 Cvzlr7972q7MlOojtQhUFbZl/OtD590j/UM0GYV1ElV7R8Lc+/aGhhr5LQ2GOLk7Wl
	 EkC+tG2vZbMbAg6kVlUUv/emuJRpt1NJwCVvuRUE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E0FF7F805B5; Tue, 11 Jun 2024 00:11:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9215FF805B2;
	Tue, 11 Jun 2024 00:11:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 50BD6F8057A; Tue, 11 Jun 2024 00:09:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AD886F8010C
	for <alsa-devel@alsa-project.org>; Tue, 11 Jun 2024 00:09:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD886F8010C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KXcDSepV
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C6D3860C2F;
	Mon, 10 Jun 2024 22:09:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44B01C2BBFC;
	Mon, 10 Jun 2024 22:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718057350;
	bh=Yzsgn2Ian0INJdPXwI7k53c47LSDS6kp4v1j3BFH0K8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KXcDSepVx/ociyQ9ejFjcZdvG7+AZaKsFDk6mjMKQ/4naO9KzDviXMe6FVwkSnhqe
	 E5zSJ+0SFYLfV0A2nGQrSUWLzG+T5ShhKJZLVamk4UyfJYnMvQWSgsIgOUmB5PQnf8
	 Yr4aNyjmZT0Azvqv0nqsvhB/rsZefbrXIBL9NUVMdD5HZAPZDwRGoPod0YDRA2w9IX
	 8SWlnSxchW+BBQN/0WVJgL4+qNw+FpEguhgcf+UWhRjU9NV0wwj9K3r1Wk9h/BkO9i
	 SNDawBXoXWs+JRvDC+QmUieeTKJfdQN1DrpLYN8xBcYO5OpIpJ7DKXdGZUbY0Ssai6
	 THCNipAcPjWUA==
Date: Mon, 10 Jun 2024 16:09:09 -0600
From: Rob Herring <robh@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Linux-ALSA <alsa-devel@alsa-project.org>,
	devicetree@vger.kernel.org, Maxim Kochetkov <fido_max@inbox.ru>
Subject: Re: [PATCH 1/5] ASoC: audio-graph-port: add link-trigger-order
Message-ID: <20240610220909.GA3150939-robh@kernel.org>
References: <87v82ls82e.wl-kuninori.morimoto.gx@renesas.com>
 <87tti5s81m.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87tti5s81m.wl-kuninori.morimoto.gx@renesas.com>
Message-ID-Hash: RAI3GAB3IGJBGWVLTTNI4A4W3DMJTR3Y
X-Message-ID-Hash: RAI3GAB3IGJBGWVLTTNI4A4W3DMJTR3Y
X-MailFrom: robh@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RAI3GAB3IGJBGWVLTTNI4A4W3DMJTR3Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Jun 07, 2024 at 04:15:01AM +0000, Kuninori Morimoto wrote:
> Some Sound Card might need special trigger ordering which is based on
> CPU/Codec connection. It is already supported on ASoC, but Simple Audio
> Card / Audio Graph Card still not support it. Let's support it.

I have no idea what trigger order means reading this patch.

> 
> Cc: Maxim Kochetkov <fido_max@inbox.ru>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  .../devicetree/bindings/sound/audio-graph-port.yaml      | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
> index 28b27e7e45de6..d1cbfc5edd3ac 100644
> --- a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
> +++ b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
> @@ -25,6 +25,15 @@ definitions:
>        capture-only:
>          description: port connection used only for capture
>          $ref: /schemas/types.yaml#/definitions/flag
> +      link-trigger-order:
> +        description: trigger order for both start/stop
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +      link-trigger-order-start:
> +        description: trigger order for start
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +      link-trigger-order-stop:
> +        description: trigger order for stop
> +        $ref: /schemas/types.yaml#/definitions/uint32-array

constraints?

These are just definitions. Where are the properties defined?

>  
>    endpoint-base:
>      allOf:
> -- 
> 2.43.0
> 
