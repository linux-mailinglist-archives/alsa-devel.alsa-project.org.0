Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8A018FDFE
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Mar 2020 20:46:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DF631655;
	Mon, 23 Mar 2020 20:46:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DF631655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584992810;
	bh=zCAtNtjRoPXx6JmeMN5UgZhqCNa1x6VPSrcDikr0X04=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qJOVG2zc0pCnGzyBlKV9+8UbJAdCNcUheOhhDBFDpPoFdxUzfvbzIGOLeKTiNP8eU
	 CZD8j6+w7teqHufoZId4/T86PRCi2llsnhScmLcGpJIpEN5h6bdl5QCw6ZiTA9bEyS
	 DfvwLOCT7p4GESzykcZdR3Bu/L4iwLzGtvn4l8KM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A674F8015A;
	Mon, 23 Mar 2020 20:45:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0012F80158; Mon, 23 Mar 2020 20:45:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 07063F80095
 for <alsa-devel@alsa-project.org>; Mon, 23 Mar 2020 20:45:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07063F80095
Received: by mail-io1-f66.google.com with SMTP id v3so15600191iot.11
 for <alsa-devel@alsa-project.org>; Mon, 23 Mar 2020 12:45:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=r9i5Yy99e3CgW0P8gaLcjQIhjCX66478/XRcWS3+S84=;
 b=Smnby2kyjG7chNbEG/GJs5CwktqpLuxp+exGuu+mqFCfUw7kV3fq98Wzq7hX10QAAJ
 wraTjHm48sWqQzzOz5Qg6rVerjKzTO8Sehrh7sqgzM4TWtSpkFT2CczDdOl3CO+uqwuq
 Xe2BPpEHTpF3I7UJB9psS/qrX5MoRfbroQmDvVPrvi536RtjZM+0jXTCNCAV9Bz6PDj8
 g6sD6C+syelWM68Y2i0jikwDAl7/mSsJnn73Lv99BRXnF+AeKD71LIHnnxR9LEcDKzAz
 6SJf4hcwnX6ZnKm15JAywR7gXsM8YdDagB67nFXRvel6rU+rFNjsuh0GEarkiovweSkp
 s8TQ==
X-Gm-Message-State: ANhLgQ2vq0mrRUxre8hLsPyU3wI+1+CaLMav+DEgdOZOWqEQn/8X4sAx
 dnrCtB2vyACNX/Vyo4tWYA==
X-Google-Smtp-Source: ADFU+vsAzTXBZGUBrZAQ1lAg1LZa7C8Eb/zL/ybcePG+EQHsuJFpa2ORV2x7aE10Xrh+Imf8iDK5Eg==
X-Received: by 2002:a05:6602:cf:: with SMTP id
 z15mr20497163ioe.13.1584992701381; 
 Mon, 23 Mar 2020 12:45:01 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id o23sm5554448ild.33.2020.03.23.12.44.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 12:45:00 -0700 (PDT)
Received: (nullmailer pid 21498 invoked by uid 1000);
 Mon, 23 Mar 2020 19:44:59 -0000
Date: Mon, 23 Mar 2020 13:44:59 -0600
From: Rob Herring <robh@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 1/6] dt-bindings: sound: Convert jz4740-i2s doc to YAML
Message-ID: <20200323194459.GA21444@bogus>
References: <20200306222931.39664-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200306222931.39664-1-paul@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, od@zcrc.me,
 Zhou Yanjie <zhouyanjie@wanyeetech.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>, Mark Brown <broonie@kernel.org>
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

On Fri,  6 Mar 2020 23:29:26 +0100, Paul Cercueil wrote:
> Convert the textual binding documentation for the AIC (AC97/I2S
> Controller) of Ingenic SoCs to a YAML schema, and add the new compatible
> strings in the process.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  .../bindings/sound/ingenic,aic.yaml           | 92 +++++++++++++++++++
>  .../bindings/sound/ingenic,jz4740-i2s.txt     | 23 -----
>  2 files changed, 92 insertions(+), 23 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/ingenic,aic.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/ingenic,jz4740-i2s.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
