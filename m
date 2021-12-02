Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E1F466AB4
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Dec 2021 21:04:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A56D2833;
	Thu,  2 Dec 2021 21:03:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A56D2833
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638475487;
	bh=8zo4GOCTWISBlsosUL4zeIRDuEFJLGVldmp6fHfhYpg=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UKRPTZ081s3o/7syQ/z6A85ADUORcrYTqKDSLFVGCSQDeFlHfElRgRKiiEoLpf1dz
	 JAMCVD/lkLyR+YhiSEtI3HkutxhqftAjlPagZQuPv3QA9eIqff1/vHCkiKDjw/8V0S
	 BJH4aY4grAdflVboC96R8POdY0wAVZ2RNsk+zOiU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D92EF8023A;
	Thu,  2 Dec 2021 21:03:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4FB2BF80162; Thu,  2 Dec 2021 21:03:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58C24F800CE
 for <alsa-devel@alsa-project.org>; Thu,  2 Dec 2021 21:03:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58C24F800CE
Received: by mail-oi1-f181.google.com with SMTP id bk14so1349291oib.7
 for <alsa-devel@alsa-project.org>; Thu, 02 Dec 2021 12:03:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=tdFnY4wzmt+MgdOT2Tq5J82thiu5XzZLbDcTwtxSNYk=;
 b=2WldbHzX+6NbudeQbtdrzVTYZJZeH8AhYZmX2nkied2xVP0zcqxd5yalQOoUTGL2t/
 veobK/FrZtHpDcULgDR62maXBTZvtJUvAmY9bmAwzgIhVBdcu7Ca8SXBYOhValZznaPk
 NniiSHbPEwZNlBusRM6rKCMWSzxl2ccYKyp/Zo4qIYz0eWVbVfsJstl293EL/NC8TxFb
 cP9kpczCGLUP56p4FHKMv/goJRGyy6yHcip5PvBIi+ROjdMlKaJGMvyWeibSho7TwcQ9
 YANPpLQdRsVz00yk1FOY4GLb3llMRPK+CPjj7rgaqen2KO02Zlg7uGhHlY6wFXIx2rmL
 xVyw==
X-Gm-Message-State: AOAM531fAQTLOF2IWPjIbNXSbpoL4x4PdVlnQapEtJs3TjDE2gkaCE1J
 r/rmZ7SVdn+Ccg1a24LPtQ==
X-Google-Smtp-Source: ABdhPJy+Vf8yrVBOrncV37VxW9c3c7Y/RAVX3OHOeNP3Xt7D8Nw+7TsHiQ6ZGDEM3eK2Axdz+VoWvQ==
X-Received: by 2002:a05:6808:1a01:: with SMTP id
 bk1mr6236903oib.46.1638475395629; 
 Thu, 02 Dec 2021 12:03:15 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id a5sm203291otd.74.2021.12.02.12.03.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 12:03:14 -0800 (PST)
Received: (nullmailer pid 1112575 invoked by uid 1000);
 Thu, 02 Dec 2021 20:03:13 -0000
From: Rob Herring <robh@kernel.org>
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.com>
In-Reply-To: <1638459806-27600-9-git-send-email-srivasam@codeaurora.com>
References: <1638459806-27600-1-git-send-email-srivasam@codeaurora.com>
 <1638459806-27600-9-git-send-email-srivasam@codeaurora.com>
Subject: Re: [PATCH v7 08/10] ASoC: dt-bindings: Add SC7280 lpass cpu bindings
Date: Thu, 02 Dec 2021 14:03:13 -0600
Message-Id: <1638475393.161838.1112574.nullmailer@robh.at.kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
 bjorn.andersson@linaro.org, Venkata Prasad Potturu <potturu@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, broonie@kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, agross@kernel.org,
 rohitkr@codeaurora.org, swboyd@chromium.org, judyhsiao@chromium.org,
 plai@codeaurora.org, linux-kernel@vger.kernel.org
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

On Thu, 02 Dec 2021 21:13:24 +0530, Srinivasa Rao Mandadapu wrote:
> From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> 
> Add bindings for sc7280 lpass cpu driver which supports
> audio over i2s based speaker, soundwire based headset, msm dmics
> and HDMI Port.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> Co-developed-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> ---
>  .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  | 70 +++++++++++++++++++---
>  1 file changed, 62 insertions(+), 8 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.example.dt.yaml: lpass@62d80000: reg: [[0, 1658351616, 0, 425984], [0, 1659895808, 0, 167936]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.example.dt.yaml: lpass@62d80000: reg-names: ['lpass-hdmiif', 'lpass-lpaif'] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.example.dt.yaml: lpass@62d80000: interrupts: [[0, 160, 1], [0, 268, 1]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.example.dt.yaml: lpass@62d80000: interrupt-names: ['lpass-irq-lpaif', 'lpass-irq-hdmi'] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.example.dt.yaml: lpass@62d80000: iommus: [[4294967295, 4128, 0], [4294967295, 4146, 0]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1562819

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

