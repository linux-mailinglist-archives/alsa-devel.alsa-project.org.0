Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA47748B0A0
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jan 2022 16:16:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E984618FC;
	Tue, 11 Jan 2022 16:15:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E984618FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641914174;
	bh=ADB5GI847zCArJtKNOIf0lo0xSGpKkRGx9zYGaD7gZI=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kan0c4QPTv6sqdCAJTbzfAD2IswuFrY/iZjdZLL3DugNN/7k/fbnn3Cmrl6rtRFUl
	 WMEZHk7Bt0tWJn4eG4+r1vNuxlf3qgrEOu9GfxoPIMWIZjQxNKLboh7ZkEKik1lixi
	 HCLosL62JymnUQS0Smb5Yk+9uukJDqu7w+knLU0o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28E62F80054;
	Tue, 11 Jan 2022 16:15:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98D6EF8025E; Tue, 11 Jan 2022 16:15:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
 [209.85.210.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7304F80054
 for <alsa-devel@alsa-project.org>; Tue, 11 Jan 2022 16:14:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7304F80054
Received: by mail-ot1-f50.google.com with SMTP id
 w19-20020a056830061300b0058f1dd48932so18853614oti.11
 for <alsa-devel@alsa-project.org>; Tue, 11 Jan 2022 07:14:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=H5aXFc3cTbqVbXAscJ8U7IrcuiVGZ2Ji9H3Um66jTps=;
 b=TEZ05vt3EDzJqVT70qEbU3oIL2j1mdJDLsLmjMqiCcDPZ2DaAWvsPl9KXNd46kizac
 U9YnOcjnJvkRzCA42rkLrMONfe9P0gvhxOLo/xmzT3L+LTXQcXVvmYpZ1zdaoyVTeN9B
 IRELQxYYJc7GahU9tBjF34NYP7842CC71vzEeb+eAvAM6nZj0rzU6ZsmGzB+hFEKavuE
 atSOvUv2eH3xIjDt5TF8cugrrxw9uO2o2NfXFNLIpAN3EdaNY+Xrik8k20INEU3lPi0o
 gt+HcMge0ynA0AfsGBcVnvaZheD0oZQuTHVKtfOO+gMjPZFRiWLPjv7TST8aoF0bj/ds
 kpag==
X-Gm-Message-State: AOAM531gcksADY90lRYfs2UNMKViJ4cfSfQjUGct7OZymjiDGAi21Dqj
 hWGbWHkLeRv4kCjxMgJ1Xg==
X-Google-Smtp-Source: ABdhPJxOa21BbGALyE4de7BK9kyi2XavjSItN8TUDfHHHGzgfxNo02m5/Yq7yGoooGkxiPWUljlFsg==
X-Received: by 2002:a05:6830:1e10:: with SMTP id
 s16mr3550212otr.259.1641914092570; 
 Tue, 11 Jan 2022 07:14:52 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id x14sm205238oiv.39.2022.01.11.07.14.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 07:14:51 -0800 (PST)
Received: (nullmailer pid 2944756 invoked by uid 1000);
 Tue, 11 Jan 2022 15:14:49 -0000
From: Rob Herring <robh@kernel.org>
To: Daniel Beer <daniel.beer@igorinstitute.com>
In-Reply-To: <61dccc5c.1c69fb81.9af91.0df6@mx.google.com>
References: <61dccc5c.1c69fb81.9af91.0df6@mx.google.com>
Subject: Re: [PATCH 2/2] ASoC: dt-bindings: add bindings for TI TAS5805M.
Date: Tue, 11 Jan 2022 09:14:49 -0600
Message-Id: <1641914089.172148.2944755.nullmailer@robh.at.kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Andy Liu <andy-liu@ti.com>,
 Mark Brown <broonie@kernel.org>,
 Derek Simkowiak <derek.simkowiak@igorinstitute.com>
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

On Tue, 11 Jan 2022 13:00:09 +1300, Daniel Beer wrote:
> The TAS5805M is a class D speaker amplifier with integrated DSP. The
> example here includes a tested flat configuration for mono (PBTL)
> output.
> 
> Signed-off-by: Daniel Beer <daniel.beer@igorinstitute.com>
> ---
>  .../devicetree/bindings/sound/tas5805m.yaml   | 201 ++++++++++++++++++
>  1 file changed, 201 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/tas5805m.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/sound/tas5805m.yaml:44:1: [error] syntax error: found character '\t' that cannot start any token (syntax)

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/sound/tas5805m.yaml:  while scanning a block scalar
  in "<unicode string>", line 41, column 5
found a tab character where an indentation space is expected
  in "<unicode string>", line 44, column 1
make[1]: *** Deleting file 'Documentation/devicetree/bindings/sound/tas5805m.example.dts'
Traceback (most recent call last):
  File "/usr/local/bin/dt-extract-example", line 46, in <module>
    binding = yaml.load(open(args.yamlfile, encoding='utf-8').read())
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/main.py", line 434, in load
    return constructor.get_single_data()
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 119, in get_single_data
    node = self.composer.get_single_node()
  File "_ruamel_yaml.pyx", line 706, in _ruamel_yaml.CParser.get_single_node
  File "_ruamel_yaml.pyx", line 724, in _ruamel_yaml.CParser._compose_document
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 773, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 848, in _ruamel_yaml.CParser._compose_sequence_node
  File "_ruamel_yaml.pyx", line 904, in _ruamel_yaml.CParser._parse_next_event
ruamel.yaml.scanner.ScannerError: while scanning a block scalar
  in "<unicode string>", line 41, column 5
found a tab character where an indentation space is expected
  in "<unicode string>", line 44, column 1
make[1]: *** [Documentation/devicetree/bindings/Makefile:25: Documentation/devicetree/bindings/sound/tas5805m.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/tas5805m.yaml: ignoring, error parsing file
make: *** [Makefile:1413: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1578223

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

