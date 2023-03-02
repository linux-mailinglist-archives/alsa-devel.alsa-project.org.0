Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D29416A833A
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Mar 2023 14:06:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D539510E;
	Thu,  2 Mar 2023 14:05:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D539510E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677762366;
	bh=frWoAE5XQ4SaLtqfCBvI8MPVLtMjarZnlBiNvn1W4xk=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oKepsUt4u2yihBHNyuPWu6se2T5UOipGOpKsNnPXUITFnhP8sgbX+FeETxuG4/nP2
	 b/ITJRW7f2WOTydeue21mE2edbgqa+P3iQseclUY/m05KHxfWrjgL39VsGeDCtfpxh
	 7gxgdks99zr99eeo8cD9KIduVUBnv/NzgjRGh8Yo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 298C1F8025A;
	Thu,  2 Mar 2023 14:05:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7E42F80266; Thu,  2 Mar 2023 14:05:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E3A1CF800DF
	for <alsa-devel@alsa-project.org>; Thu,  2 Mar 2023 14:05:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3A1CF800DF
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-53852143afcso427082717b3.3
        for <alsa-devel@alsa-project.org>;
 Thu, 02 Mar 2023 05:05:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X18LEh0g5lt3E5bs+v6xlkNcEAN9JmhuluP548V82lk=;
        b=r4+mXP87uH1wik95MrwZiVnaJgdER6dpdYsYi6Da5DmIHRNCbOeWZM5YWgSAI+11LF
         QrRCjj2MKGmt/fvVAXo6n03aMF2H2l8gS5fiN7cXZI+gKtPhWud6EDAKYOHs57x6dY9s
         fGHSNS7uygcXvO64Z1tV6arb9+zuumY66fPw3FCkfWyxJIAXtkmTqB8vxCPQeJ+MKPVc
         0F87xn5Y0N5Y+WiZp7Lgbd2J0bwi0r7Vv/lcZUjria4GG3r4Pe0y9lxsfBwaCBE17PxJ
         lXzfTAgLYzrMgyMUIhSsLv7DgLV/yQRgDB3x/TudE+oK7xrbdkFXHFrOipZOwvbJ41Fq
         d+8Q==
X-Gm-Message-State: AO0yUKXWQn7GkSgRG1q8+x2EsSn54TgYipbxBSx0vWgq3WYU8+eR6FLJ
	jDNnkI8UUS8Q5h3/r85LhQ==
X-Google-Smtp-Source: 
 AK7set99Kml+ZlGBFLIQciIuYyUn/ayyZxT/PJoaMEmLBbf6uluXXipONSdP2IEsSPutmUjyQ1oISw==
X-Received: by 2002:a05:7500:4395:b0:f8:882c:4e5e with SMTP id
 fn21-20020a057500439500b000f8882c4e5emr246636gab.77.1677762304745;
        Thu, 02 Mar 2023 05:05:04 -0800 (PST)
Received: from robh_at_kernel.org ([209.91.220.210])
        by smtp.gmail.com with ESMTPSA id
 l4-20020ab053c4000000b0068b8c1fa859sm1977991uaa.26.2023.03.02.05.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 05:05:04 -0800 (PST)
Received: (nullmailer pid 284033 invoked by uid 1000);
	Thu, 02 Mar 2023 13:05:02 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: richard.leitner@linux.dev
In-Reply-To: <20230302-max9867-v1-1-aa9f7f25db5e@skidata.com>
References: <20230302-max9867-v1-0-aa9f7f25db5e@skidata.com>
 <20230302-max9867-v1-1-aa9f7f25db5e@skidata.com>
Message-Id: <167775917220.270950.1253335215666674705.robh@kernel.org>
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: maxim,max9867: convert txt
 bindings to yaml
Date: Thu, 02 Mar 2023 07:05:02 -0600
Message-ID-Hash: 2UISJQ3UENLAA5VVXRPLWVTWX3HEZJGC
X-Message-ID-Hash: 2UISJQ3UENLAA5VVXRPLWVTWX3HEZJGC
X-MailFrom: robherring2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Richard Leitner <richard.leitner@skidata.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Ladislav Michl <ladis@linux-mips.org>,
 Benjamin Bara <benjamin.bara@skidata.com>, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2UISJQ3UENLAA5VVXRPLWVTWX3HEZJGC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Thu, 02 Mar 2023 12:55:01 +0100, richard.leitner@linux.dev wrote:
> From: Richard Leitner <richard.leitner@skidata.com>
> 
> Convert from max9867.txt to maxim,max9867.yaml and add missing
> '#sound-dai-cells' property.
> 
> Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> ---
>  .../devicetree/bindings/sound/max9867.txt          | 17 --------
>  .../devicetree/bindings/sound/maxim,max9867.yaml   | 51 ++++++++++++++++++++++
>  2 files changed, 51 insertions(+), 17 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/maxim,max9867.yaml: 'oneOf' conditional failed, one must be fixed:
	'unevaluatedProperties' is a required property
	'additionalProperties' is a required property
	hint: Either unevaluatedProperties or additionalProperties must be present
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
./Documentation/devicetree/bindings/sound/maxim,max9867.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/sound/maxim,max9867.yaml#
Error: Documentation/devicetree/bindings/sound/maxim,max9867.example.dts:18.9-13 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:434: Documentation/devicetree/bindings/sound/maxim,max9867.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1508: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230302-max9867-v1-1-aa9f7f25db5e@skidata.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

