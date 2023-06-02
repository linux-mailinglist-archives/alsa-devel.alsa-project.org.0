Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB82A71FEBB
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Jun 2023 12:14:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E22684A;
	Fri,  2 Jun 2023 12:13:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E22684A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685700877;
	bh=J06m1QW5AP72CMMPlSA0/12ApgkgGx1asxOAI/g4VDQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aOd5eafduPX/fwpwBAMgTfaZOZtGnmYGbNsr1gP4AZ6qlQ2Cm9XUChkVKErcbUxLv
	 NY2y5tnQxrVFRuZsDahbcvXbFyo60hlB6v/MLm8+mvPAbOO6PEmkwUU8u05xRFvGJj
	 CXevQqi/zPgclEdqHSvOdIQ64bbl8zaH+s8SsxpA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 438C5F80527; Fri,  2 Jun 2023 12:13:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E4F23F8016B;
	Fri,  2 Jun 2023 12:13:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9B5CF80199; Fri,  2 Jun 2023 12:13:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 55A04F800C1
	for <alsa-devel@alsa-project.org>; Fri,  2 Jun 2023 12:13:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55A04F800C1
Received: by mail-io1-f46.google.com with SMTP id
 ca18e2360f4ac-774924b7c4dso35955039f.1
        for <alsa-devel@alsa-project.org>;
 Fri, 02 Jun 2023 03:13:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685700784; x=1688292784;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l/PIFR+ZIA9eZqhv8ThRSE/EHs2TLrNkw8dWpu4ejEo=;
        b=cvgz1dE8qdUPea5gIJ84jOSzZRiZl5RYX+4jfwkbR1xpyHSmdXUuKeu/TIqnOcgwJr
         TVOn7z2Nbe/xiZQLZtL4Ggdz9xlLjgSJsqyt/epibEhWjtB43aVij++54dXdW6uvItd7
         PnUS/XlSEsNcUFeTfw46COlkJ5g/OhIzbPMX90eerEfDFdUPXYcMA42zSSQMBgaK1kMU
         MpcMuKwEGGmzsBaTsJJYa+PvPQz6wY6M4HFskhSgI2uIzd2MF26D1udsr9LJLJ/0ZckG
         rlmni72XtUKELiU3JpqVyiPS685RM4S4XjZeV//CZWpPyXIkai/xn6L6WwW2TGS31+lx
         F1/Q==
X-Gm-Message-State: AC+VfDyz/yILHV1XrFBe9jj8GcPoQet5lz3okfiaH8OqBQgPxYsjppKC
	3CQv33n2fQHRlu02ltU3OQ==
X-Google-Smtp-Source: 
 ACHHUZ6CYRer4ThVGQY100UimlMmqDeEPZXk9gl/qzrUD8+oKZRBwxw0FiZma7Yt5Kk1HtF3Qk5qGA==
X-Received: by 2002:a6b:db17:0:b0:76c:71dc:55f3 with SMTP id
 t23-20020a6bdb17000000b0076c71dc55f3mr2219262ioc.6.1685700784312;
        Fri, 02 Jun 2023 03:13:04 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id
 z3-20020a029f03000000b0040f94261ab1sm208404jal.12.2023.06.02.03.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 03:13:03 -0700 (PDT)
Received: (nullmailer pid 1359772 invoked by uid 1000);
	Fri, 02 Jun 2023 10:13:02 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin@pqrs.dk>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>
In-Reply-To: <20230602090322.1876359-2-alvin@pqrs.dk>
References: <20230602090322.1876359-1-alvin@pqrs.dk>
 <20230602090322.1876359-2-alvin@pqrs.dk>
Message-Id: <168570078201.1359749.10287160624641352834.robh@kernel.org>
Subject: Re: [PATCH 1/4] ASoC: dt-bindings: document new
 symmetric-clock-role flag
Date: Fri, 02 Jun 2023 04:13:02 -0600
Message-ID-Hash: AGZV67C5STAHF2PPBEMS7FJUPEWWHEH6
X-Message-ID-Hash: AGZV67C5STAHF2PPBEMS7FJUPEWWHEH6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AGZV67C5STAHF2PPBEMS7FJUPEWWHEH6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Fri, 02 Jun 2023 11:03:18 +0200, Alvin Šipraga wrote:
> From: Alvin Šipraga <alsi@bang-olufsen.dk>
> 
> The new flag specifies that both ends of the dai-link have the same
> clock consumer/provider role. This should be used to describe hardware
> where e.g. the CPU and codec both receive their bit- and frame-clocks
> from an external source.
> 
> Signed-off-by: Alvin Šipraga <alsi@bang-olufsen.dk>
> ---
>  .../devicetree/bindings/sound/simple-card.yaml        | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/sound/simple-card.yaml:33:5: [error] syntax error: could not find expected ':' (syntax)

dtschema/dtc warnings/errors:
make[1]: *** Deleting file 'Documentation/devicetree/bindings/sound/simple-card.example.dts'
Documentation/devicetree/bindings/sound/simple-card.yaml:33:5: could not find expected ':'
make[1]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/sound/simple-card.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
./Documentation/devicetree/bindings/sound/simple-card.yaml:33:5: could not find expected ':'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/simple-card.yaml: ignoring, error parsing file
make: *** [Makefile:1512: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230602090322.1876359-2-alvin@pqrs.dk

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

