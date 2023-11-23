Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C243F7F6322
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Nov 2023 16:38:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFA5CE0F;
	Thu, 23 Nov 2023 16:37:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFA5CE0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700753887;
	bh=pAE0IXNMhHsGWU0+8hFk9Uwf1vqlCzEPqOKEWcrI6Xw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=i1lrapKpF7tkEn6H7Vv+1YKN6aJy1W+rE+QGbZ7/nfsqL2J9JCtinwfxJYmJNnB1d
	 WTWXbDIZveN0Ptmky/wTsVf6z5nyGu39SHIqMh3Enhec4LAkqwXjD0RDbmdBjb6XOa
	 hfqH9PgPIapLG7IiOf44eaf0NsAv8AphJaVyCup0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B85BF80571; Thu, 23 Nov 2023 16:37:34 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0ADDFF8057E;
	Thu, 23 Nov 2023 16:37:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8543F802E8; Thu, 23 Nov 2023 16:37:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 23E70F80249
	for <alsa-devel@alsa-project.org>; Thu, 23 Nov 2023 16:37:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23E70F80249
Received: by mail-io1-f49.google.com with SMTP id
 ca18e2360f4ac-7b37508cc31so7305839f.1
        for <alsa-devel@alsa-project.org>;
 Thu, 23 Nov 2023 07:37:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700753839; x=1701358639;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aLt1KUAUGHRqUvPHJLf1zcCoicLrr1OYvZT4WwBuoZE=;
        b=O2wMr4hSVewEiRKp3Hzmx+fCrm1qyqnMFb73KwUrVlWZ0Yfl7lERzYxFbfpXEa6xcY
         1cFek36DpVamOTEjVa6uUQW6jp6YRb5rdIVZj7K49hkK9qcbZAEVyY/2Zh1Hl+6z60rx
         ZrDvi2JZF800sUPPskfq9AlgRqNDUEoAL2q21dJSIUL9hCKKpSPSOT9jgX8cJsQ3KRdI
         uXZ2fpANET1TK7I5G4zDnab+WjxZo92GVnqLe/8IuTIhzWWtdJDzXE8Y+Ht7/05uOFmZ
         APGNDtFoTsPZuSDq6dnARUz7TeL8wLkf6CCQLswEIpsJVRNSymugcS6w3qPhB8ZMBOXc
         Yw2Q==
X-Gm-Message-State: AOJu0Yw8s+Hpvt48ID9z71mNYDRTlaEVNtGPlsdRd/E7oI6hKdjLRYK9
	87Eu18yFLfmqSAG0IRkBJA==
X-Google-Smtp-Source: 
 AGHT+IHxmIHckVPvE9RTOm5DMneEAqIyAk45FUNpf3d8xViwnKcBica9KXjhnjw12dR++i/1riIIUA==
X-Received: by 2002:a6b:d107:0:b0:7b3:4b1a:e414 with SMTP id
 l7-20020a6bd107000000b007b34b1ae414mr5939092iob.11.1700753838621;
        Thu, 23 Nov 2023 07:37:18 -0800 (PST)
Received: from herring.priv ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id
 q10-20020a0566380eca00b004668fb951e8sm360236jas.84.2023.11.23.07.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 07:37:18 -0800 (PST)
Received: (nullmailer pid 1407026 invoked by uid 1000);
	Thu, 23 Nov 2023 15:37:16 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: linux-imx@nxp.com, shengjiu.wang@nxp.com, linux-kernel@vger.kernel.org,
 daniel.baluta@gmail.com, iuliana.prodan@nxp.com,
 kuninori.morimoto.gx@renesas.com, broonie@kernel.org, robh+dt@kernel.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org
In-Reply-To: <20231123150012.154096-3-daniel.baluta@oss.nxp.com>
References: <20231123150012.154096-1-daniel.baluta@oss.nxp.com>
 <20231123150012.154096-3-daniel.baluta@oss.nxp.com>
Message-Id: <170075383625.1407009.6277919043530213618.robh@kernel.org>
Subject: Re: [PATCH v2 2/2] ASoC: dt-bindings: audio-graph-port: Document
 new DAI link flags playback-only/capture-only
Date: Thu, 23 Nov 2023 08:37:16 -0700
Message-ID-Hash: DHUC5R27EDIY6J3MDN2QK47JH33PA4TR
X-Message-ID-Hash: DHUC5R27EDIY6J3MDN2QK47JH33PA4TR
X-MailFrom: robherring2@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DHUC5R27EDIY6J3MDN2QK47JH33PA4TR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Thu, 23 Nov 2023 17:00:12 +0200, Daniel Baluta wrote:
> From: Daniel Baluta <daniel.baluta@nxp.com>
> 
> Document new playback-only and capture-only flags which can be used
> when dai link can only support just one direction: playback or capture
> but not both.
> 
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  .../devicetree/bindings/sound/audio-graph-port.yaml         | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/sound/audio-graph-port.yaml:22:6: [error] syntax error: expected <block end>, but found '<block mapping start>' (syntax)
./Documentation/devicetree/bindings/sound/audio-graph-port.yaml:23:9: [warning] wrong indentation: expected 7 but found 8 (indentation)
./Documentation/devicetree/bindings/sound/audio-graph-port.yaml:26:9: [warning] wrong indentation: expected 7 but found 8 (indentation)

dtschema/dtc warnings/errors:
make[2]: *** Deleting file 'Documentation/devicetree/bindings/sound/audio-graph-port.example.dts'
Documentation/devicetree/bindings/sound/audio-graph-port.yaml:22:6: did not find expected key
make[2]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/sound/audio-graph-port.example.dts] Error 1
make[2]: *** Waiting for unfinished jobs....
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/socionext,uniphier-evea.yaml:
while parsing a block mapping
  in "<unicode string>", line 16, column 5
did not find expected key
  in "<unicode string>", line 22, column 6
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/cirrus,cs42l51.yaml:
while parsing a block mapping
  in "<unicode string>", line 16, column 5
did not find expected key
  in "<unicode string>", line 22, column 6
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/ak4613.yaml:
while parsing a block mapping
  in "<unicode string>", line 16, column 5
did not find expected key
  in "<unicode string>", line 22, column 6
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml:
while parsing a block mapping
  in "<unicode string>", line 16, column 5
did not find expected key
  in "<unicode string>", line 22, column 6
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/rockchip-i2s.yaml:
while parsing a block mapping
  in "<unicode string>", line 16, column 5
did not find expected key
  in "<unicode string>", line 22, column 6
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/marvell,mmp-sspa.yaml:
while parsing a block mapping
  in "<unicode string>", line 16, column 5
did not find expected key
  in "<unicode string>", line 22, column 6
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml:
while parsing a block mapping
  in "<unicode string>", line 16, column 5
did not find expected key
  in "<unicode string>", line 22, column 6
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/sgtl5000.yaml:
while parsing a block mapping
  in "<unicode string>", line 16, column 5
did not find expected key
  in "<unicode string>", line 22, column 6
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/wlf,wm8962.yaml:
while parsing a block mapping
  in "<unicode string>", line 16, column 5
did not find expected key
  in "<unicode string>", line 22, column 6
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml:
while parsing a block mapping
  in "<unicode string>", line 16, column 5
did not find expected key
  in "<unicode string>", line 22, column 6
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/socionext,uniphier-aio.yaml:
while parsing a block mapping
  in "<unicode string>", line 16, column 5
did not find expected key
  in "<unicode string>", line 22, column 6
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml:
while parsing a block mapping
  in "<unicode string>", line 16, column 5
did not find expected key
  in "<unicode string>", line 22, column 6
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/everest,es8316.yaml:
while parsing a block mapping
  in "<unicode string>", line 16, column 5
did not find expected key
  in "<unicode string>", line 22, column 6
./Documentation/devicetree/bindings/sound/audio-graph-port.yaml:22:6: did not find expected key
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml:
while parsing a block mapping
  in "<unicode string>", line 16, column 5
did not find expected key
  in "<unicode string>", line 22, column 6
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/ti,tlv320aic3x.yaml:
while parsing a block mapping
  in "<unicode string>", line 16, column 5
did not find expected key
  in "<unicode string>", line 22, column 6
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/audio-graph-port.yaml: ignoring, error parsing file
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1424: dt_binding_check] Error 2
make: *** [Makefile:234: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20231123150012.154096-3-daniel.baluta@oss.nxp.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

