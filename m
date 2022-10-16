Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E61600414
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Oct 2022 00:59:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D477B18E4;
	Mon, 17 Oct 2022 00:58:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D477B18E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665961165;
	bh=1xaQt59rby8zRIHIHlgzAWQJphpbY4So2d6UAaD3+VA=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sTe8UEDRFFKytdnry7Rjd8zrsnJzGQvHEwQhGYAxNG2PZSsJavqvoOohziCtRtgzW
	 MEMcDs1hUc+M5KT7bMWeMbkI/ZYZxqf0f29MXIZzr0KGvp9iM/PlG/0wMEaZm/u6RP
	 VswGmLBGwq7gtp1kLIrdNMzTylmyO6MKgvim2CJM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49399F8027C;
	Mon, 17 Oct 2022 00:58:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0BEFFF80271; Mon, 17 Oct 2022 00:58:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com
 [209.85.160.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EA645F800E5
 for <alsa-devel@alsa-project.org>; Mon, 17 Oct 2022 00:58:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA645F800E5
Received: by mail-oa1-f52.google.com with SMTP id
 586e51a60fabf-134072c15c1so11662372fac.2
 for <alsa-devel@alsa-project.org>; Sun, 16 Oct 2022 15:58:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0Y87I5y8One47p+rmmdOCebsJ8OGc+ziD4kkEXvM+88=;
 b=ydvytutHWc4twDin2Tse8fWulAXt9e7p5JCNShuNEW1Xeo73/UjbPHVVh2yaBW10NL
 8FVzapQaUbYROAm1uIkNFlVN8Vwx8h+7pQISgfcKB2lkkDaMVhjAAlfqW+SY6/gtQ6lQ
 y2JeehqcdeKLWYBgRkxvaeuNooesZiclbcTJIWYxGjAUS5+0j8lApln5bnKevTZYbUqN
 NPfMx2BFpJKucVHaDJTb58rTinsrExdBtlqi+OLCSpudSgXUKPY434By4DsnI6iMHT1W
 ti8uf0Cr2LHlh5t/r48sL5igvwt5j93mFf/H8wZ7JKhuHAMiBsGN5xYpJrCgHHYY9VQv
 5GNw==
X-Gm-Message-State: ACrzQf1EcQwl6MmFLTiKUKKfHp9J19/Mhtm/FERX9Z56Ck/NGgxb6e4C
 XGlI5q9rvgKwv0GBJhqdNw==
X-Google-Smtp-Source: AMsMyM6MGesx6YMXRfGI+ybf558PQpJkenbC9nU1KqgyID4KBQq+J+KBgulytBUZQIgd1z0vFxps5w==
X-Received: by 2002:a05:6870:160b:b0:12b:8d8d:1401 with SMTP id
 b11-20020a056870160b00b0012b8d8d1401mr4246968oae.7.1665961099843; 
 Sun, 16 Oct 2022 15:58:19 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 n5-20020a05680803a500b00354d9b9f6b4sm3723473oie.27.2022.10.16.15.58.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Oct 2022 15:58:19 -0700 (PDT)
Received: (nullmailer pid 3904628 invoked by uid 1000);
 Sun, 16 Oct 2022 22:58:18 -0000
From: Rob Herring <robh@kernel.org>
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
In-Reply-To: <1665820441-617-1-git-send-email-quic_srivasam@quicinc.com>
References: <1665820441-617-1-git-send-email-quic_srivasam@quicinc.com>
Message-Id: <166596080441.3896287.5989385957462109322.robh@kernel.org>
Subject: Re: [RESEND] dt-bindings: soundwire: Convert text file to yaml format
Date: Sun, 16 Oct 2022 17:58:18 -0500
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@quicinc.com, lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, tiwai@suse.com, robh+dt@kernel.org,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, agross@kernel.org,
 srinivas.kandagatla@linaro.org, broonie@kernel.org, quic_rohkumar@quicinc.com,
 quic_plai@quicinc.com, swboyd@chromium.org, judyhsiao@chromium.org,
 Ratna Deepthi Kudaravalli <quic_rkudarav@quicinc.com>
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

On Sat, 15 Oct 2022 13:24:01 +0530, Srinivasa Rao Mandadapu wrote:
> Update soundwire bindings with yaml formats.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Ratna Deepthi Kudaravalli <quic_rkudarav@quicinc.com>
> Signed-off-by: Ratna Deepthi Kudaravalli <quic_rkudarav@quicinc.com>
> ---
>  .../devicetree/bindings/soundwire/qcom,sdw.txt     | 214 ---------------------
>  .../devicetree/bindings/soundwire/qcom,sdw.yaml    | 185 ++++++++++++++++++
>  2 files changed, 185 insertions(+), 214 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
>  create mode 100644 Documentation/devicetree/bindings/soundwire/qcom,sdw.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/soundwire/qcom,sdw.example.dts:36.38-39 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:384: Documentation/devicetree/bindings/soundwire/qcom,sdw.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1420: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

