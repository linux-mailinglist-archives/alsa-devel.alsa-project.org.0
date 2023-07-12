Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5B074FEA2
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jul 2023 07:17:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F1677F8;
	Wed, 12 Jul 2023 07:16:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F1677F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689139033;
	bh=AMn0UtIni8VR801UXGiVgWN19POl5XiQj5Uj7EhRzfk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gEMUwJrQQF8ObDFdcveeh4D1YKl7wgMOA1uvO/OROoHpmZSCpuJpbPOxvQwsiROEj
	 MB5trOnJuxBYgFLJTEP49dW0c07x0ZGOy5UEc5qIHKq1YAGrBjgjn64g380+EgaPHE
	 JmJKUfE3Ak8mgQfM/Jaq1hJ/5ZYz5n/zuNyhohSw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A3A0F80290; Wed, 12 Jul 2023 07:15:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D4A0F80236;
	Wed, 12 Jul 2023 07:15:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57765F80249; Wed, 12 Jul 2023 07:15:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A5988F80153
	for <alsa-devel@alsa-project.org>; Wed, 12 Jul 2023 07:15:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5988F80153
Received: by mail-io1-f53.google.com with SMTP id
 ca18e2360f4ac-77a62a84855so224798239f.1
        for <alsa-devel@alsa-project.org>;
 Tue, 11 Jul 2023 22:15:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689138940; x=1691730940;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wKSzmt8hMlbZubw8Bz3GqPF8upMRfti75E4k3sjCdto=;
        b=IiY06HI0ziSsG8ufvKEV2rLEJ3gwodIPEXqYu9pP6IkCMgG48dLyZAWVaHW75LNWkB
         KntDa51BffIm7hmx4ur1G/kSX3gaIN725bg7Mf0wzDzt6NjcwnetJ722vmVHOa2Te1Wb
         QmSvJFipo66cPabgr8omO7uQP1n+xHG11BfAWryeLlsft0ffY0nHzHuyebttJU08ThhM
         c2NyXsgq+r8GCCc1yoWa7TkMSFwjN8jfieArgWmDysGPLEaBKOR7NMkd55u2rOU+1xSk
         oOUCmJEHdMygu2HI4ojz7PsGfry+jXYXvG2Ocl7AfZbCJ1H99zArml1Ny5t8NYT3HyiK
         TL/A==
X-Gm-Message-State: ABy/qLaOArLiI3jRD7yeN2es/oUhw9XNc0wtQ+n0ERErjgWNv97rOefu
	jaCscTjDjhdJUg7zh4lhQA==
X-Google-Smtp-Source: 
 APBJJlE0f1oUAsIvW5GwlxLOupfX0EVF6NhYj5beTh+z/lUbyjbik9bA0PsrX8MCvQVOw7HT0S4f1A==
X-Received: by 2002:a5e:c910:0:b0:77e:3d2f:d1f4 with SMTP id
 z16-20020a5ec910000000b0077e3d2fd1f4mr17007246iol.15.1689138940157;
        Tue, 11 Jul 2023 22:15:40 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id
 v6-20020a6b5b06000000b007870289f4fdsm1068756ioh.51.2023.07.11.22.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 22:15:39 -0700 (PDT)
Received: (nullmailer pid 2909708 invoked by uid 1000);
	Wed, 12 Jul 2023 05:15:37 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Kevin Lu <luminlong@139.com>
Cc: linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, shenghao-ding@ti.com,
 devicetree@vger.kernel.org, kevin-lu@ti.com, alsa-devel@alsa-project.org,
 robh+dt@kernel.org, tiwai@suse.com, broonie@kernel.org
In-Reply-To: <20230712044006.48456-1-luminlong@139.com>
References: <20230712044006.48456-1-luminlong@139.com>
Message-Id: <168913893753.2909692.17813614972049441778.robh@kernel.org>
Subject: Re: [PATCH v1] ASoC: dt-bindings: Add tas2505 audio amplifier
Date: Tue, 11 Jul 2023 23:15:37 -0600
Message-ID-Hash: NJ2ZSN3VB7UQD7DO6VRDUQ3YDR5MZ6NF
X-Message-ID-Hash: NJ2ZSN3VB7UQD7DO6VRDUQ3YDR5MZ6NF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NJ2ZSN3VB7UQD7DO6VRDUQ3YDR5MZ6NF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Wed, 12 Jul 2023 12:40:06 +0800, Kevin Lu wrote:
> Create tas2505.yaml for tas2505.
> 
> Signed-off-by: Kevin Lu <luminlong@139.com>
> ---
>  .../devicetree/bindings/sound/tas2505.yaml    | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/tas2505.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/tas2505.example.dtb: codec@18: 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/sound/ti,tlv320aic32x4.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/tas2505.example.dtb: codec@18: 'clock-names' is a required property
	from schema $id: http://devicetree.org/schemas/sound/ti,tlv320aic32x4.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/tas2505.example.dtb: codec@18: 'iov-supply' is a required property
	from schema $id: http://devicetree.org/schemas/sound/ti,tlv320aic32x4.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/tas2505.example.dtb: codec@18: 'av-supply' is a required property
	from schema $id: http://devicetree.org/schemas/sound/ti,tlv320aic32x4.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/tas2505.example.dtb: codec@18: 'dv-supply' is a required property
	from schema $id: http://devicetree.org/schemas/sound/ti,tlv320aic32x4.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/tas2505.example.dtb: codec@18: 'clock-source' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/sound/ti,tlv320aic32x4.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230712044006.48456-1-luminlong@139.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

