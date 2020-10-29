Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A8B29EFDA
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Oct 2020 16:29:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE99341;
	Thu, 29 Oct 2020 16:28:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE99341
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603985346;
	bh=ms7pPaI2BQRwHJ0tl8OC3fFiFbKBk4wz+ee7t1QGLxI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uFhFVy3dS3rP0fnRm+yn7QCRJgzTVOcE3VYQ+jCXV2lhlyjvj4RV9h+ORb/8m8raE
	 Fltwpm29letmha03tFhbjkFU45Zyoh3N8KsKtiT2f3z9Cyvj80IuCswc3JXjgEvmaA
	 xhoYj+mnJG7PZeKtG4kIGvI3nF/xLNHyXW1ekGYI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6ADFCF80095;
	Thu, 29 Oct 2020 16:27:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36D75F8020D; Thu, 29 Oct 2020 16:27:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C040FF800D8
 for <alsa-devel@alsa-project.org>; Thu, 29 Oct 2020 16:27:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C040FF800D8
Received: by mail-ot1-f65.google.com with SMTP id k3so2611917otp.1
 for <alsa-devel@alsa-project.org>; Thu, 29 Oct 2020 08:27:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YqBVpZJyYpJyhp8SRHdLNd51IEGUo51ZrRSOs/0b7TU=;
 b=nzfIajB0BjakCaZ/2yrHptbEJli9/scs0mIq+F9JvHgx0uqcDPos9NQoETSIwvqngx
 vrVxFtvs1M6OjMgG9fgeR+OYhTUaOa41JQj4KYtlEbiwJifGodSgnI9Wpt+o9vW7mxdu
 1TZRGt+LEoh+vA9tWpP5xaol1jrUg+po1P/Ans66hJh+jJ9BjL+lmiPDjoLH0S+w9IYZ
 QbZZGmbwXDpWHWT110mp+GMzFZwMHPK6EXMq33irUhnnVkHN0WLX43Tz8+W7pCWJVoTM
 STz1Fwruuh8Ub/kXZKBAm9uEFWp1sZsD/ew6cGcUgpL2jIWK0hPxgvYmyGEeQF/G5Yxl
 m1PA==
X-Gm-Message-State: AOAM531g1uJ1YC/oshVoLrflD0tzto+sHxKXtaYIb8cHp55ku3pa/uvV
 GaTDREATgsKOBJOnJqbykA==
X-Google-Smtp-Source: ABdhPJxBNf9vh1Y0QDtx0o5GqcNwyUkqQh3ylRhfQbv8CGPulkDRTiGrhi5y/dY64xZLdbWygxh2mw==
X-Received: by 2002:a05:6830:155a:: with SMTP id
 l26mr3438506otp.88.1603985242687; 
 Thu, 29 Oct 2020 08:27:22 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id f142sm688509oib.10.2020.10.29.08.27.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 08:27:21 -0700 (PDT)
Received: (nullmailer pid 1902942 invoked by uid 1000);
 Thu, 29 Oct 2020 15:27:21 -0000
Date: Thu, 29 Oct 2020 10:27:21 -0500
From: Rob Herring <robh@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: fsl_aud2htx: Add binding doc
 for aud2htx module
Message-ID: <20201029152721.GB1901783@bogus>
References: <1603877930-10553-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1603877930-10553-1-git-send-email-shengjiu.wang@nxp.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 lgirdwood@gmail.com, broonie@kernel.org, tiwai@suse.com,
 linux-kernel@vger.kernel.org, nicoleotsuka@gmail.com, robh+dt@kernel.org,
 festevam@gmail.com
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

On Wed, 28 Oct 2020 17:38:49 +0800, Shengjiu Wang wrote:
> AUD2HTX (Audio Subsystem TO HDMI TX Subsystem) is a new
> IP module found on i.MX8MP.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
> changes in v2:
> - fix indentation issue
> - remove nodename
> 
>  .../bindings/sound/fsl,aud2htx.yaml           | 64 +++++++++++++++++++
>  1 file changed, 64 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/fsl,aud2htx.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/fsl,aud2htx.yaml: 'additionalProperties' is a required property
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/fsl,aud2htx.yaml: ignoring, error in schema: 
warning: no schema found in file: ./Documentation/devicetree/bindings/sound/fsl,aud2htx.yaml


See https://patchwork.ozlabs.org/patch/1389813

The base for the patch is generally the last rc1. Any dependencies
should be noted.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

