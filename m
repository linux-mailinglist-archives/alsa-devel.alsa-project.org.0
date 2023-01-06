Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C428F65FA0E
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Jan 2023 04:19:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E52C12538;
	Fri,  6 Jan 2023 04:18:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E52C12538
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672975169;
	bh=lro3u/RwAW4zFg/csgs4x+zOsGtT1tTxvMDpRZuKn/0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=hLaXKI7gxEa1YH41kGFziRgIVK9kUrqIE6oTuYAbCre97i45ASNRkXjkPPCF2kNZS
	 gOB3CUTKl/YYid3ma1JdiNg90mB7HHGACARDwSWjXWh7TOMBAPzOZ+vlRFvHCibGjH
	 1xeoXdZj+UMkdTYlQmuMidPdzGLnW7iEz1G0m5Tk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BEBAF8025A;
	Fri,  6 Jan 2023 04:18:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B64FDF8022B; Fri,  6 Jan 2023 04:18:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
 [209.85.166.48])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4C1E3F800C0
 for <alsa-devel@alsa-project.org>; Fri,  6 Jan 2023 04:18:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C1E3F800C0
Received: by mail-io1-f48.google.com with SMTP id h6so191835iof.9
 for <alsa-devel@alsa-project.org>; Thu, 05 Jan 2023 19:18:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=wYKFaUU4WUwK+xZfWsHkCMpC56jh+w0/QlmTFIkRs60=;
 b=MXtnCk8Pa1cTMaCXncGuvRICHZnS8GA/JkuENjrDj3+rf1j4hEm8TQad6VM22Nb27e
 7rhlzmB1hqbKFw8qkB7oilztUKf+cWElhu6h2Na52pb9nNSJScER1gE/jR67FjKgIER6
 rALQT7lAjPa/beucZhaD1iM737+2bAYJETknRYWI5yjWsMwNHMy6028bymq9lTrYSh4e
 n9lxDHS5gnOfEysKBvcuIG4HOOpXRyBjp2g7fWUUInG7EjFmf8rrmYgtXLlf3z71AyoC
 9Gyy0n45jHLgzzGQmOIqZhe0Q+CsinXHi8woOq+T1CZ598D1mRaf7iMKjj7QFZyML6vc
 d/mA==
X-Gm-Message-State: AFqh2kpOja9DkgGb7bVr+pL72/mnsws8UatkrZF1zq5RidQw2nrRmAG8
 08e3q1D67ib/JXdm8VEz5w==
X-Google-Smtp-Source: AMrXdXsDBq+c58aF7nVFnVtwsw1bd0pMqZ3FjaWxnzSYHCQSOa7QxBXE9B8Uo7bbzH4pwSuY1aeihw==
X-Received: by 2002:a6b:dc10:0:b0:6eb:abee:634e with SMTP id
 s16-20020a6bdc10000000b006ebabee634emr35457157ioc.7.1672975103094; 
 Thu, 05 Jan 2023 19:18:23 -0800 (PST)
Received: from robh_at_kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 n35-20020a056602342300b006bb5af55ddfsm13874837ioz.19.2023.01.05.19.18.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 19:18:22 -0800 (PST)
Received: (nullmailer pid 2198646 invoked by uid 1000);
 Fri, 06 Jan 2023 03:18:21 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Faiz Abbas <faiz.abbas@arm.com>
In-Reply-To: <20230105160346.29018-1-faiz.abbas@arm.com>
References: <20230105160346.29018-1-faiz.abbas@arm.com>
Message-Id: <167297490078.2192494.10604791859897237948.robh@kernel.org>
Subject: Re: [PATCH] ASoC: dt-bindings: simple-card: Document
 simple-audio-card, plat
Date: Thu, 05 Jan 2023 21:18:21 -0600
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, lgirdwood@gmail.com, broonie@kernel.org,
 linux-kernel@vger.kernel.org, Deepak.Pandey@arm.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, Anurag.Koul@arm.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


On Thu, 05 Jan 2023 21:33:46 +0530, Faiz Abbas wrote:
> The simple card driver has support for adding cpu, codec and platform
> nodes with the simple-audio-card prefix. Add documentation for the plat
> binding.
> 
> Signed-off-by: Faiz Abbas <faiz.abbas@arm.com>
> ---
>  .../bindings/sound/simple-card.yaml           | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/sound/simple-card.yaml:293:2: [error] syntax error: expected <block end>, but found '<block sequence start>' (syntax)

dtschema/dtc warnings/errors:
make[1]: *** Deleting file 'Documentation/devicetree/bindings/sound/simple-card.example.dts'
Documentation/devicetree/bindings/sound/simple-card.yaml:293:2: expected <block end>, but found '<block sequence start>'
make[1]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/sound/simple-card.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
Traceback (most recent call last):
  File "/usr/bin/yamllint", line 33, in <module>
    sys.exit(load_entry_point('yamllint==1.26.3', 'console_scripts', 'yamllint')())
  File "/usr/lib/python3/dist-packages/yamllint/cli.py", line 210, in run
    prob_level = show_problems(problems, file, args_format=args.format,
  File "/usr/lib/python3/dist-packages/yamllint/cli.py", line 106, in show_problems
    for problem in problems:
  File "/usr/lib/python3/dist-packages/yamllint/linter.py", line 203, in _run
    for problem in get_cosmetic_problems(buffer, conf, filepath):
  File "/usr/lib/python3/dist-packages/yamllint/linter.py", line 140, in get_cosmetic_problems
    for problem in rule.check(rule_conf,
  File "/usr/lib/python3/dist-packages/yamllint/rules/indentation.py", line 580, in check
    for problem in _check(conf, token, prev, next, nextnext, context):
  File "/usr/lib/python3/dist-packages/yamllint/rules/indentation.py", line 346, in _check
    'wrong indentation: expected %d but found %d' %
TypeError: %d format: a real number is required, not NoneType
./Documentation/devicetree/bindings/sound/simple-card.yaml:293:2: expected <block end>, but found '<block sequence start>'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/simple-card.yaml: ignoring, error parsing file
make: *** [Makefile:1508: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230105160346.29018-1-faiz.abbas@arm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

