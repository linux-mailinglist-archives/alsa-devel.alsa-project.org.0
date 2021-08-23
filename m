Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E623F4BC0
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Aug 2021 15:31:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5984015DC;
	Mon, 23 Aug 2021 15:30:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5984015DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629725508;
	bh=fMbBX/VO3lXVzBJpQ6w+NfSQe728oprrgbUlevTiTLw=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ICV6iNq7TW24lJz00CccIwibpluGjzz5GbqI2H5+EfWI7JMo4VwcPPLa1RO59AEtK
	 p9OjZKW4KJg0uy5XtyuiuRpBpguoJqM4GZld1xTPCbJCNYFcIJK++3ZPKE9oAzCtjv
	 mmo6JumzJz6GAbZQerklEjxIFSJ6QzeqU6p10fVg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC9C7F8016E;
	Mon, 23 Aug 2021 15:30:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74D0BF80217; Mon, 23 Aug 2021 15:30:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com
 [209.85.161.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B50ACF800E7
 for <alsa-devel@alsa-project.org>; Mon, 23 Aug 2021 15:30:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B50ACF800E7
Received: by mail-oo1-f52.google.com with SMTP id
 t2-20020a4ae9a2000000b0028c7144f106so4319193ood.6
 for <alsa-devel@alsa-project.org>; Mon, 23 Aug 2021 06:30:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=tYKXcPONtDHENaTk531QOuIYk5FCjGu+6Vp94/ZbRyY=;
 b=D6NDWjjFF+e8EsoySP0lPOO77FCxydSjEvfHPksDFncPHoBAeHbP4mRf9e2GGdmk9z
 8cSZ5gUlSL96uxRUhdDaLLADc1cjyRawadidlGyJVhRvflRyYoe6CvNTDFqzw3wzfBPP
 rbjQGMPf5jme90f4S1xIC9A+HselpKyu8tY9vfpGNE0rMquoDoq3QAqCX22gouVDMrhZ
 6vMnZcQkzRPmkVFRW8sAIhedvAsMWuAaKdKm8H7U1Yjr7XTpAZrelstB6WZSrc1UnefN
 JQLj1o8sPjkkhg8jVeSQPvW3CwbhISsNPSSj2MIx9/MTXcKXY2prRrjMywMauBjQfZYZ
 TJdw==
X-Gm-Message-State: AOAM533XTns+g/uWTsg9Dr1iZkvXeU8nwpOp9l8x9+/6gJWvk0AZeYFq
 AiYIuJOXmsOyQqfk2dX4eA==
X-Google-Smtp-Source: ABdhPJzjXLnJ1CRjEDilFbPZxBvNwH89yBnHeyfUNi7XPvRtSxuGSZLoS6YuOJgz+Yoc+qe1I5w/6A==
X-Received: by 2002:a4a:6f4a:: with SMTP id i10mr39788oof.64.1629725416546;
 Mon, 23 Aug 2021 06:30:16 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id p124sm3620811oia.8.2021.08.23.06.30.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 06:30:15 -0700 (PDT)
Received: (nullmailer pid 1982768 invoked by uid 1000);
 Mon, 23 Aug 2021 13:30:13 -0000
From: Rob Herring <robh@kernel.org>
To: Sugar Zhang <sugar.zhang@rock-chips.com>
In-Reply-To: <1629716132-21544-1-git-send-email-sugar.zhang@rock-chips.com>
References: <1629715710-21137-1-git-send-email-sugar.zhang@rock-chips.com>
 <1629716132-21544-1-git-send-email-sugar.zhang@rock-chips.com>
Subject: Re: [PATCH 15/15] ASoC: dt-bindings: rockchip: i2s: Document property
 'clk-trcm'
Date: Mon, 23 Aug 2021 08:30:13 -0500
Message-Id: <1629725413.505500.1982767.nullmailer@robh.at.kernel.org>
Cc: linux-rockchip@lists.infradead.org, alsa-devel@alsa-project.org,
 broonie@kernel.org, heiko@sntech.de, devicetree@vger.kernel.org
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, 23 Aug 2021 18:55:32 +0800, Sugar Zhang wrote:
> This patch documents property 'rockchip,clk-trcm' which is used
> to specify the lrck.
> 
> Signed-off-by: Sugar Zhang <sugar.zhang@rock-chips.com>
> Change-Id: I648142c57c568bbed209f2b9188b1f539a3285b2
> ---
>  Documentation/devicetree/bindings/sound/rockchip-i2s.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
make[1]: *** Deleting file 'Documentation/devicetree/bindings/sound/rockchip-i2s.example.dts'
Traceback (most recent call last):
  File "/usr/local/bin/dt-extract-example", line 45, in <module>
    binding = yaml.load(open(args.yamlfile, encoding='utf-8').read())
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/main.py", line 434, in load
    return constructor.get_single_data()
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 120, in get_single_data
    node = self.composer.get_single_node()
  File "_ruamel_yaml.pyx", line 706, in _ruamel_yaml.CParser.get_single_node
  File "_ruamel_yaml.pyx", line 724, in _ruamel_yaml.CParser._compose_document
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 891, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 904, in _ruamel_yaml.CParser._parse_next_event
ruamel.yaml.scanner.ScannerError: mapping values are not allowed in this context
  in "<unicode string>", line 80, column 8
make[1]: *** [Documentation/devicetree/bindings/Makefile:20: Documentation/devicetree/bindings/sound/rockchip-i2s.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
./Documentation/devicetree/bindings/sound/rockchip-i2s.yaml:  mapping values are not allowed in this context
  in "<unicode string>", line 80, column 8
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/rockchip-i2s.yaml: ignoring, error parsing file
warning: no schema found in file: ./Documentation/devicetree/bindings/sound/rockchip-i2s.yaml
make: *** [Makefile:1419: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1519630

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

