Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F26355BC68
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jun 2022 01:01:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E2E54E;
	Tue, 28 Jun 2022 01:00:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E2E54E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656370884;
	bh=Z4asEYUealFqydw5I05dupNVDABcLr5kvCckY0hx2OU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bzImID1Qp7T/9oz66hRS6gcDM7LtLTUFCY4HrZfwEYAhLc1CuaS16bLEzj1mvo7cm
	 HqlY/Bw0BrS7mH3TamRm95hsA4cFpPq11YyTcCvc8heYaGMPHlKwXgCJZeQWhw4f4F
	 Apzt6Jji+OxTqmU6Nx0HL8UtOJk+o/DbwgxXgeHo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20309F8012F;
	Tue, 28 Jun 2022 01:00:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94AF0F80128; Tue, 28 Jun 2022 01:00:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com
 [209.85.166.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D0DCF8028B
 for <alsa-devel@alsa-project.org>; Tue, 28 Jun 2022 01:00:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D0DCF8028B
Received: by mail-il1-f179.google.com with SMTP id h20so7021231ilj.13
 for <alsa-devel@alsa-project.org>; Mon, 27 Jun 2022 16:00:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BBFolvCCjJnxhxohRNSfL/AQrqOPHqKgSw2LBcN2NnQ=;
 b=ByhIE8UN8Y6pgCw/g6+/LquhzrZkIh722VcvhpMb5/HTBqSlWyfu4Iqf/le/qobh+z
 6aZ7+FINs2moocgXmyrO2Gu8uEOFnMRs4ac4P0R3R1IuCLgui09wpPyYiSi93jFnZ3Fi
 FQ45+BGC/yRDyeIXCwbkwxbKAt+H0rDQa9h2aTyQkZ+trvuEUo94SO/aNPHWPy1+Lqg0
 QkCI8Ir2fehTutFpk5XphHjxroi/dzxLMZMpdAVnmqV+dtGeampdrwcAycKVLd2GYYbr
 HD8t0pcBKf+fUpC8pvyV6Jw3eCxuz05nYivQX+oX22ucEWia+Vdp8nkbp+QiFbJVcfZ1
 Cp+A==
X-Gm-Message-State: AJIora9e90sOuDhPTJMbFHfiqclS0qMKg9tegcIl9FhR0qt0fZ59ZW1j
 GIeUUqrte5GNLZ+aXBubHg==
X-Google-Smtp-Source: AGRyM1s3mDmWtHR9KacZ3brBzVulekXmlkOSi7niZLvqZ3o/vbqhjQZ0fgaGh7zEyYExAh29I7iuRQ==
X-Received: by 2002:a05:6e02:154d:b0:2da:9539:3093 with SMTP id
 j13-20020a056e02154d00b002da95393093mr4813252ilu.131.1656370814723; 
 Mon, 27 Jun 2022 16:00:14 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id
 u18-20020a92ccd2000000b002d8d813892csm5083745ilq.8.2022.06.27.16.00.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 16:00:14 -0700 (PDT)
Received: (nullmailer pid 3126600 invoked by uid 1000);
 Mon, 27 Jun 2022 23:00:12 -0000
Date: Mon, 27 Jun 2022 17:00:12 -0600
From: Rob Herring <robh@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2 6/7] ASoC: dt-bindings: fsl-sai: Add new property to
 configure dataline
Message-ID: <20220627230012.GA3122063-robh@kernel.org>
References: <1655451877-16382-1-git-send-email-shengjiu.wang@nxp.com>
 <1655451877-16382-7-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1655451877-16382-7-git-send-email-shengjiu.wang@nxp.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, Xiubo.Lee@gmail.com, festevam@gmail.com,
 tiwai@suse.com, lgirdwood@gmail.com, nicoleotsuka@gmail.com,
 broonie@kernel.org, krzk+dt@kernel.org, shengjiu.wang@gmail.com,
 linux-kernel@vger.kernel.org
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

On Fri, Jun 17, 2022 at 03:44:36PM +0800, Shengjiu Wang wrote:
> "fsl,dataline" is added to configure the dataline of SAI.
> It has 3 value for each configuration, first one means the type:
> I2S(1) or PDM(2), second one is dataline mask for 'rx', third one is
> dataline mask for 'tx'. for example:
> 
> fsl,dataline = <1 0xff 0xff 2 0xff 0x11>,
> 
> it means I2S type rx mask is 0xff, tx mask is 0xff, PDM type
> rx mask is 0xff, tx mask is 0x11 (dataline 1 and 4 enabled).
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  Documentation/devicetree/bindings/sound/fsl-sai.txt | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/fsl-sai.txt b/Documentation/devicetree/bindings/sound/fsl-sai.txt
> index c71c5861d787..4c66e6a1a533 100644
> --- a/Documentation/devicetree/bindings/sound/fsl-sai.txt
> +++ b/Documentation/devicetree/bindings/sound/fsl-sai.txt
> @@ -49,6 +49,14 @@ Required properties:
>  			  receive data by following their own bit clocks and
>  			  frame sync clocks separately.
>  
> +  - fsl,dataline        : configure the dataline. it has 3 value for each configuration
> +                          first one means the type: I2S(1) or PDM(2)
> +                          second one is dataline mask for 'rx'
> +                          third one is dataline mask for 'tx'.
> +                          for example: fsl,dataline = <1 0xff 0xff 2 0xff 0x11>;
> +                          it means I2S type rx mask is 0xff, tx mask is 0xff, PDM type
> +                          rx mask is 0xff, tx mask is 0x11 (dataline 1 and 4 enabled).

You mean 0 and 4 enabled? Or 1 and 4?

How many 3 cell entries can you have?

Rob
