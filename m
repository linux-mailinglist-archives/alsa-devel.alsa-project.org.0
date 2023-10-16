Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A9E7CAB85
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Oct 2023 16:32:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92F2B836;
	Mon, 16 Oct 2023 16:31:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92F2B836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697466723;
	bh=defiApIEnQ/UgMvC4U9vxLhkgVTPGmd4Bj+ZXwNvxNY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pF2eOZ5+FXyAIN2EWrNEpz4Qc4u22AJnbCHnsGzrda919FfgufhpxDV8fil83j/Om
	 a4fuWeG3FkVMyPsejHeAJPViYptr3JkyLbScuORkzDcCG04wv7WhBxO0GLzbm/Xedo
	 zrx/HLvNePB/t6DfYP2OfbanYnrjGWIX4LSOl6n8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7460F8019B; Mon, 16 Oct 2023 16:31:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E1B0F8024E;
	Mon, 16 Oct 2023 16:31:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A4F8F8025F; Mon, 16 Oct 2023 16:31:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com
 [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 36A4CF800C9
	for <alsa-devel@alsa-project.org>; Mon, 16 Oct 2023 16:30:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36A4CF800C9
Received: by mail-oo1-f47.google.com with SMTP id
 006d021491bc7-57bb6a2481fso2287589eaf.1
        for <alsa-devel@alsa-project.org>;
 Mon, 16 Oct 2023 07:30:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697466655; x=1698071455;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pogla2ixenuu9Whu/Txm0dkQOdChFbDxggoz3QMNrmQ=;
        b=I5s74C4I2RsK5uVQB3Pl60vNFlh2OHXniv+e76VxRbhFzTNO3zFHcU8xVKPFMIRtg0
         Fxsgu2BLWR0i3VxDkDUE4XceHro9rzt6LZfokOq4hztICpHnle324Odrhz+96eovBhp7
         cmz4d4fuob9/roDPGY3ThyMqFZcPSQIXKbix3e6iQbL7Wq45jSpcY9yTGVr+a/rKUj3h
         0bVfWikmlbtiBLpIzbbQ+N9+2GayLkDUs2w6RmGyBqaEHKsVxumcd9qXbdbQDKhKtPxD
         1UzOGGTq58v3M+nxH23rcPoCB85HD/N8BqpVLKTUPRm+boZlXzQzHBx/Gso+69mmJBjO
         ZLlQ==
X-Gm-Message-State: AOJu0YxZPba70LjyUZZBmMW/j59kfkEOqcMmFpF72gnAIBae3T3NAXTs
	HhM36fJoHs5isPtSVSQxmQ==
X-Google-Smtp-Source: 
 AGHT+IHx8iGwaQriKRdE3MbfGOtdCCNfmu6tH2ejuHsm2/UZEYPWAT5EG1IdyqRY9fD+m2NiQmDXHQ==
X-Received: by 2002:a4a:9b88:0:b0:57b:575f:4f8c with SMTP id
 x8-20020a4a9b88000000b0057b575f4f8cmr29144162ooj.9.1697466654636;
        Mon, 16 Oct 2023 07:30:54 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id
 cj25-20020a056820221900b0057e54da7201sm1093968oob.35.2023.10.16.07.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 07:30:53 -0700 (PDT)
Received: (nullmailer pid 2775610 invoked by uid 1000);
	Mon, 16 Oct 2023 14:30:52 -0000
Date: Mon, 16 Oct 2023 09:30:52 -0500
From: Rob Herring <robh@kernel.org>
To: Eugen Hristev <eugen.hristev@collabora.com>
Cc: krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 lgirdwood@gmail.com, broonie@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
Subject: Re: [PATCH v5] dt-bindings: arm: mediatek: convert audsys and
 mt2701-afe-pcm to yaml
Message-ID: <20231016143052.GA2770481-robh@kernel.org>
References: <20231013140505.483766-1-eugen.hristev@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231013140505.483766-1-eugen.hristev@collabora.com>
Message-ID-Hash: U4YUX4ZAB3A2P7BPXOKCOOJMO4FXZRMZ
X-Message-ID-Hash: U4YUX4ZAB3A2P7BPXOKCOOJMO4FXZRMZ
X-MailFrom: robherring2@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U4YUX4ZAB3A2P7BPXOKCOOJMO4FXZRMZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Oct 13, 2023 at 05:05:05PM +0300, Eugen Hristev wrote:
> Convert the mediatek,audsys binding to YAML, together with the associated
> binding bindings/sound/mt2701-afe-pcm.yaml .
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>
> ---
> Changes in v5:
> - removed example for mt2701-audio
> - renamed mt2701-afe-pcm to mt2701-audio
> - added clock cells as required, removed reg from required, in audsys binding
> - removed reference comment in mt2701-audio
> - removed assigned clocks from mt2701-audio
> 
> Changes in v4:
> - fix error reported by Rob's bot : 
> ./Documentation/devicetree/bindings/sound/mt2701-afe-pcm.yaml:11:4: [error] missing starting space in comment (comments)
> 
> Changes in v3:
> - not added Rb Conor Dooley since the patch was changed in a big essence
> - As per review by Krzysztof, also convert the mt2701-afe-pcm and reference
> the correct schema in the audsys binding.
> 
> Changes in v2:
> - remove comment reference to inexistent binding
> 
> 
>  .../bindings/arm/mediatek/mediatek,audsys.txt |  39 -----
>  .../arm/mediatek/mediatek,audsys.yaml         | 153 ++++++++++++++++++
>  .../bindings/sound/mt2701-afe-pcm.txt         | 146 -----------------
>  .../bindings/sound/mt2701-audio.yaml          | 117 ++++++++++++++

mediatek,mt2701-audio.yaml

With that,

Reviewed-by: Rob Herring <robh@kernel.org>
