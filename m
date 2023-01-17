Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D3B66E490
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Jan 2023 18:13:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8E556B08;
	Tue, 17 Jan 2023 18:12:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8E556B08
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673975597;
	bh=1o746n6XaqNdBHBBXgIko8oc/lyHK2wDmVoUCTOc8co=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=PoKPgVQMjo0y7M2bTlF67NWggbX6lIJzj+MjODv/pdJ+DTNn4O71G7zgP6SyfKepk
	 LlLpVuCWfACTnf2z7wIVb78hR2HxBRZpF/qYNPaj2+f8xoP5sVSDGUEEmCh4MSWCpH
	 69+mqCASir8Rh976CZdKz/3pPse5QwjpjJCxiJyQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63366F804DE;
	Tue, 17 Jan 2023 18:12:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D884F804F2; Tue, 17 Jan 2023 18:12:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com
 [209.85.160.48])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C924F8026D
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 18:12:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C924F8026D
Received: by mail-oa1-f48.google.com with SMTP id
 586e51a60fabf-15b9c93848dso24369295fac.1
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 09:12:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GXlBNRvFyU5MgDW75FzyE0UnWFcuHtjWm9nMO/g5I80=;
 b=wry/JQ635BXXTQcw9c2l6ImEjy5hlC+XKaCMWNEcSnQXFWHgNVdNih2OgJ3MilV92z
 5ULfJucIQeAimRKHZW4qTnYkejuUgT0DV+Y4NCSqUhtmDbIYZWWiNUwz1UM9w1WGInYO
 CgYUsIO1wCaiqqRxBITlv20n1bP+iUbsDFrNDaHWTBmPJCa79HDnoQkZUOUgszBpTTod
 9JttMrn0rlJ56g7saFhjcXZImJXBzWgHWbX9OsjTNKxqd1PDpL289ewJURcGNnpT7syN
 ft5a6ZaEE8Nn2iGVTkm4mPwYP74UsufIMdE/ca+R0SHKI0rT+m7URTH1vwgSOkT53lzC
 OlhA==
X-Gm-Message-State: AFqh2kpCI7qeioWRik2RdfwEAt59ZCnI43jVBAnkzqOA0CCeuCKMvV0n
 XboRYlsU8Dnh0HsRBAcjKw==
X-Google-Smtp-Source: AMrXdXu8V+uqDI4MWC4oLGDZEHxnrDrioeXqBqtb0L0hElhLpi2SY88Kcro4xEnIAWEr2y9E0lt4Nw==
X-Received: by 2002:a05:6871:b324:b0:15f:931:5aa9 with SMTP id
 bd36-20020a056871b32400b0015f09315aa9mr1652176oac.59.1673975542064; 
 Tue, 17 Jan 2023 09:12:22 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 u42-20020a056870f2aa00b00140d421445bsm16630106oap.11.2023.01.17.09.12.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 09:12:21 -0800 (PST)
Received: (nullmailer pid 3254601 invoked by uid 1000);
 Tue, 17 Jan 2023 17:12:21 -0000
Date: Tue, 17 Jan 2023 11:12:21 -0600
From: Rob Herring <robh@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2 06/10] ASoC: dt-bindings: ti,pcm3168a: Convert to
 json-schema
Message-ID: <167397554057.3254544.17294836275411987169.robh@kernel.org>
References: <87358hj2ub.wl-kuninori.morimoto.gx@renesas.com>
 <87tu0xho3d.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87tu0xho3d.wl-kuninori.morimoto.gx@renesas.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


On Wed, 11 Jan 2023 01:11:35 +0000, Kuninori Morimoto wrote:
> From: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Convert the Texas Instruments PCM3168A Audio Codec Device Tree binding
> documentation to json-schema.
> 
> Add missing properties.
> Drop unneeded pinctrl properties from example.
> 
> Link: https://lore.kernel.org/r/cover.1669980383.git.geert+renesas@glider.be
> Link: https://lore.kernel.org/r/87mt7qpylw.wl-kuninori.morimoto.gx@renesas.com
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  .../devicetree/bindings/sound/ti,pcm3168a.txt |  56 ---------
>  .../bindings/sound/ti,pcm3168a.yaml           | 107 ++++++++++++++++++
>  2 files changed, 107 insertions(+), 56 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/ti,pcm3168a.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
