Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16509332D1B
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Mar 2021 18:21:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89F71186B;
	Tue,  9 Mar 2021 18:20:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89F71186B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615310460;
	bh=JFD7a2rcLlzQsueKy6nKgXKP1Q/PVBSmH5txohE8xP0=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VtCNCqm4Tfx4zAvt+DmzfdE7Zygb/3SpBgtg+Uw5vfdeCBrOtoTc8mujisHp/rc1P
	 poJHaWc9iXhjzJMa/BTJ5n3cmN6gTNMPXomeI2WfAyqVvK5QptQfiOGk4zBJfWOOAD
	 iMrQ9CnP3EA9oGHTaRm3QNNyi9KdFGrBcMi99ulM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0EB90F80256;
	Tue,  9 Mar 2021 18:19:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5EE83F80227; Tue,  9 Mar 2021 18:19:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0621F8014E
 for <alsa-devel@alsa-project.org>; Tue,  9 Mar 2021 18:19:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0621F8014E
Received: by mail-il1-f173.google.com with SMTP id p10so12859444ils.9
 for <alsa-devel@alsa-project.org>; Tue, 09 Mar 2021 09:19:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=JsaLqg+Y+wZKqqo4vFt6KIoJc4yVnjqgApdeWlQB3eg=;
 b=sh0asu+byDU35dfJj5wv42/DYU3d3zGpvV1rGRJVYCRI3atn7Xf7+6a7asN6SIzkZH
 TRJ5cU8F6J5/uSXpzJpjHbNiR+OONlb9nkyurEs1y5NFZIiRi+2uaUVOBWJN3MQEMswn
 H9od9DJQGhDM74cknfcmd9zhKfnA6Bs19G5QLsl/o9HUeyWCYcrD/3I6460a5nRoAssO
 IJflYa1X+Zz2tvpHZmD+c1QjRhjSRfxTU/gGkdNPD9ot17A8MgdbfW0MXlqbMIX3RAfU
 RJ4y2VXh56tzyBs3o7UfKH1danVmH2VrOpj1+svkV0sztFjPYjeFQ569RnGUvRjQLD8e
 /CMw==
X-Gm-Message-State: AOAM5310rbm974eaBmzcRMHWLl6mQlAeWiqDvBhOPAJBH325XWIghebM
 K5M+tYWWkVdPFseY6bSc/g==
X-Google-Smtp-Source: ABdhPJwn+5EIhFQnFbb9g58ohLGO2gRFJG9Jfjgso1gkrRdgI1TduaMeMt6PrbW35OnRaWGFUaYw4A==
X-Received: by 2002:a05:6e02:12a1:: with SMTP id
 f1mr24653652ilr.124.1615310358499; 
 Tue, 09 Mar 2021 09:19:18 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id e4sm7917359ilc.47.2021.03.09.09.19.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 09:19:17 -0800 (PST)
Received: (nullmailer pid 485086 invoked by uid 1000);
 Tue, 09 Mar 2021 17:19:11 -0000
From: Rob Herring <robh@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20210309141514.24744-5-srinivas.kandagatla@linaro.org>
References: <20210309141514.24744-1-srinivas.kandagatla@linaro.org>
 <20210309141514.24744-5-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 4/5] ASoC: dt-bindings: wsa881x: add bindings for port
 mapping
Date: Tue, 09 Mar 2021 10:19:11 -0700
Message-Id: <1615310351.627443.485085.nullmailer@robh.at.kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 vkoul@kernel.org, broonie@kernel.org, sanyog.r.kale@intel.com,
 yung-chuan.liao@linux.intel.com
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

On Tue, 09 Mar 2021 14:15:13 +0000, Srinivas Kandagatla wrote:
> WSA881x SoundWire device ports are statically assigned to master ports
> at design time. So add bindings required to specify these mappings!
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../devicetree/bindings/sound/qcom,wsa881x.yaml          | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/qcom,wsa881x.example.dt.yaml: speaker@0,1: 'qcom-port-mapping' does not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/qcom,wsa881x.example.dt.yaml: speaker@0,2: 'qcom-port-mapping' does not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml

See https://patchwork.ozlabs.org/patch/1449860

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

