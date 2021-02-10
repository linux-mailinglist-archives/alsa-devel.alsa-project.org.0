Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B238A317117
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Feb 2021 21:19:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39F4F16EB;
	Wed, 10 Feb 2021 21:18:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39F4F16EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612988346;
	bh=VjGbqZItAK0osKQ8Ic34D6swFYf0Vfvlc6wysMUAiIo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oYEU3bKS4U2jW/tOK4MY/eVNt3r0JHnsXfqG3ZpB1LQTGz6stoHqlK+gNzsaQ14L2
	 OrdfSvS90CAA5oI5fuzQM8fmHHXUhXJGLJPm6qhvkaF0lBiZqhtNWX6Hw2o6eKPZow
	 uM6U3wK/nQvJ1qK0+YGvkOfm50m3wsTj/FLPyvjQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ECDC6F8026B;
	Wed, 10 Feb 2021 21:18:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ADBE8F80240; Wed, 10 Feb 2021 21:18:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3069F8010D
 for <alsa-devel@alsa-project.org>; Wed, 10 Feb 2021 21:18:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3069F8010D
Received: by mail-oi1-f170.google.com with SMTP id 18so3492577oiz.7
 for <alsa-devel@alsa-project.org>; Wed, 10 Feb 2021 12:18:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PghPjc/EDyUZ+Xv9BQGl3x1AgRl531Jn7MQbiU3ehz8=;
 b=mCoiLYlZyqrBOFxJWIXnuzO6oES3AxI+05nOFfjClYlR5NaWAYXU+5GEsZ7AV35Rrf
 IbcNs8mpi5RouA7OOg3ii8Qjz9fd7BXvGN7n7OyhZBoTUpi1gwRV1qubyzkpwguUb41K
 PGlIZDaRJ9OYrmJ23azHjljA94xB75lQJLyFLkGOzfw4IRlvvkgTylQMe+/sCB8pcv8u
 iYf0wHr0Z9kGRcqvEALyjicLtHYNJULujp0mcF5xAVNGsbNJHHUhBhiexRoVEfvwjBdy
 LrxT3+RtikdtXEEfX0KKEogqR00gzdJJq39wQERYpOWLD3z6JKkbOyWRMbeacHlS55yl
 S32Q==
X-Gm-Message-State: AOAM533iyFMoX26EX+bH0gJgx3AnZ4CWu40zL/PfIco6pAyaPQ+sE33c
 yF/GVkWMHKT6MGCxvgh0aQ==
X-Google-Smtp-Source: ABdhPJzZlowNIv/ACD6W8hqSxqNRvgQacbTlIF2kKTHuTSotK7FjhvPDFcOX1itOFJV9IHnTcDB4RQ==
X-Received: by 2002:a05:6808:13c4:: with SMTP id
 d4mr570253oiw.90.1612988280377; 
 Wed, 10 Feb 2021 12:18:00 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id q7sm682011oif.1.2021.02.10.12.17.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 12:17:59 -0800 (PST)
Received: (nullmailer pid 2688296 invoked by uid 1000);
 Wed, 10 Feb 2021 20:17:58 -0000
Date: Wed, 10 Feb 2021 14:17:58 -0600
From: Rob Herring <robh@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v4 5/7] ASoC: qcom: dt-bindings: add bindings for lpass
 tx macro codec
Message-ID: <20210210201758.GA2688240@robh.at.kernel.org>
References: <20210210093055.18350-1-srinivas.kandagatla@linaro.org>
 <20210210093055.18350-6-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210210093055.18350-6-srinivas.kandagatla@linaro.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, robh+dt@kernel.org, linux-kernel@vger.kernel.org,
 broonie@kernel.org
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

On Wed, 10 Feb 2021 09:30:53 +0000, Srinivas Kandagatla wrote:
> This binding is for LPASS has internal codec TX macro which is
> for connecting with Soundwire TX codecs like WCD938x.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../bindings/sound/qcom,lpass-tx-macro.yaml   | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
