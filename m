Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9A615CC9B
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Feb 2020 21:54:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79D781698;
	Thu, 13 Feb 2020 21:53:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79D781698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581627276;
	bh=g5dCUhFdm6ZgRfir2GsI3Bm8U1ZW04EVd7gFQ2Wnn5s=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t/0hU4xr38JChIeEGyBB8xuvcIGYmfod2gHE3xbtDLAcVKAamykKpAPizdRm/21W4
	 wFyNJhAXSSokzLmk+OaYdO9LAGaK7Liav55jgQkdFb27iOzJIY/Tw8wDdHsoL5DcHL
	 tA6bEikxqFEVT8etnpkIo5m29L4o5F8l3Oqs8vw0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BEEFF80146;
	Thu, 13 Feb 2020 21:52:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E93BF80145; Thu, 13 Feb 2020 21:52:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00DFFF80139
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 21:52:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00DFFF80139
Received: by mail-oi1-f195.google.com with SMTP id l9so7228442oii.5
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 12:52:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=s8i10ohrT2+weilggglqs0Ir1n1ZSXHJ2uT8Wx+VWFA=;
 b=h0J47eGHK2WLP+eR/AeBykuo9Aytk9GxNDsEuEKLb5xN+/zOIyx9IgIM3q3Sgplu/9
 wjGT2PW3/QViciVcs12NmuFY/FAKv+7bv2/FSBOfYya2H5dGiyAvlTfZGIb9MUe57qeS
 P3xctakzxjy2y6jI4VHhMKnp03BLjKR750sz8BfvVxSgPDJK+Ca0q//05jUI69rlp2GE
 mh7t5pQ5E/Uih9ls5xiwVwH8KK7HaGpw7454LH06Cl5aAvD8mxzrsSdNdcn5cJRJ3Evz
 CQvpVEzvdaTphfqne035MBH2Ybhtk9TWV+wdAUZ9K72D/1TVmjqOEWajb5IwKHNDdL+G
 loVw==
X-Gm-Message-State: APjAAAVWATR5nqr+4XjwkMEh9czZ/ObxO+LGUUp/0iTR/Z2WcDeJZYlG
 01DB750q3vfnBB8iah0+Lw==
X-Google-Smtp-Source: APXvYqyxzp7FojO4VNDr08MgWew7G0vsADdfBY2x0CqIPVAPAt7ZS5c/S285NmepbwZyFpewQmPbIA==
X-Received: by 2002:a54:4010:: with SMTP id x16mr4368671oie.174.1581627151779; 
 Thu, 13 Feb 2020 12:52:31 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id p184sm1046185oic.40.2020.02.13.12.52.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2020 12:52:30 -0800 (PST)
Received: (nullmailer pid 14780 invoked by uid 1000);
 Thu, 13 Feb 2020 20:52:30 -0000
Date: Thu, 13 Feb 2020 14:52:30 -0600
From: Rob Herring <robh@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Message-ID: <20200213205230.GA13640@bogus>
References: <87tv3vqc93.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87tv3vqc93.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: dt-bindings: renesas,
 rsnd: switch to yaml base Documentation
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 13 Feb 2020 14:37:04 +0900, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> This patch switches from .txt base to .yaml base Document.
> It is still keeping detail explanations at .txt
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  .../bindings/sound/renesas,rsnd.txt           | 518 -----------------
>  .../bindings/sound/renesas,rsnd.yaml          | 528 ++++++++++++++++++
>  2 files changed, 528 insertions(+), 518 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

Unknown file referenced: [Errno 2] No such file or directory: '/usr/local/lib/python3.6/dist-packages/dtschema/schemas/sound/simple-card.yaml'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml: patternProperties:^rcar_sound,src$:patternProperties:src-.: 'if' is not one of ['type', 'description', 'dependencies', 'properties', 'patternProperties', 'additionalProperties', 'unevaluatedProperties', 'deprecated', 'required', 'allOf', 'anyOf', 'oneOf', '$ref']
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml: patternProperties:^rcar_sound,src$:patternProperties:src-.: 'then' is not one of ['type', 'description', 'dependencies', 'properties', 'patternProperties', 'additionalProperties', 'unevaluatedProperties', 'deprecated', 'required', 'allOf', 'anyOf', 'oneOf', '$ref']
Documentation/devicetree/bindings/Makefile:12: recipe for target 'Documentation/devicetree/bindings/sound/renesas,rsnd.example.dts' failed
make[1]: *** [Documentation/devicetree/bindings/sound/renesas,rsnd.example.dts] Error 255
Makefile:1263: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1237280
Please check and re-submit.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
