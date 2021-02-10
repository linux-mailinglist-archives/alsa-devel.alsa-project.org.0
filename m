Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF2E317115
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Feb 2021 21:18:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4AE416D2;
	Wed, 10 Feb 2021 21:17:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4AE416D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612988320;
	bh=Je2EyyVhKU9RXjNW2+robtMD3iUlSjTIN5+XmKbcuFQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UtDkl3WACJZF0eRloUVeUmx+E9PlfG/nQzvuWddoRZ6d1aqtejYqKk5IrTFvaF50u
	 GNxFC01kK1sh0Ud643laRGRvar1Hb8VTBl8vp9/xFt+fR+RA7tyeQEILZW3NDe6Pj1
	 V/VUjUptctO2yr469a1gRQtRHUgNzh2f+2ql2Bro=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED111F8022D;
	Wed, 10 Feb 2021 21:17:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 838FCF800F1; Wed, 10 Feb 2021 21:17:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DEDD1F800F1
 for <alsa-devel@alsa-project.org>; Wed, 10 Feb 2021 21:16:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DEDD1F800F1
Received: by mail-ot1-f52.google.com with SMTP id e4so3049485ote.5
 for <alsa-devel@alsa-project.org>; Wed, 10 Feb 2021 12:16:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZXsyAUgNpQ7MKm5gpNUdWcFNxxOrvuvI1ZTaGnmXF78=;
 b=W2mqQPzTBDVVTaObr1euLO4E729pMwTxuz6AdzGPxee4r/knUjiEc7oY+Qr0iSgqXD
 WGQDWsCH+CVNFBLJXQHDPDAk50sIoqpY7zoAIHx8s2o2hdYpHcvMurhKFXxKJzrvlsA9
 +xjpjpzOomUkWG6FEVCoyUFk6it8mzf1v68rUl2SIlvQtIm9Vwb4v35mvWj/NWk+m6Q+
 d983NoaUgGmUP/XW6KE4VcR2B4V5RE4lXsIaIb2Tff0GTlYmpebRE0jo+mTJuS9n1Fnr
 jHxVsROGWUrpl3nPxFoGu9kxZR15ubYiH3f4dzwMLp1+B/QT78T6fnUiohgMutB3mYM3
 VqGg==
X-Gm-Message-State: AOAM533W+dMfhZ+WzwwkZKXm41x7w+GTAYwutXtCodEqrrKSg5mE43TF
 0Gk/Bvjb1DCKH8ZF1/uOWA==
X-Google-Smtp-Source: ABdhPJwUOUeHGJSiGCowqI6v+JsevRF/BUPkVWmYhpXW5eZR8ZqZRK8RdpUyMIAkkbbMnorumr+sNA==
X-Received: by 2002:a9d:3625:: with SMTP id w34mr3405528otb.330.1612988218236; 
 Wed, 10 Feb 2021 12:16:58 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id e17sm614219otf.32.2021.02.10.12.16.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 12:16:57 -0800 (PST)
Received: (nullmailer pid 2686353 invoked by uid 1000);
 Wed, 10 Feb 2021 20:16:56 -0000
Date: Wed, 10 Feb 2021 14:16:56 -0600
From: Rob Herring <robh@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v4 1/7] ASoC: qcom: dt-bindings: add bindings for lpass
 rx macro codec
Message-ID: <20210210201656.GA2686235@robh.at.kernel.org>
References: <20210210093055.18350-1-srinivas.kandagatla@linaro.org>
 <20210210093055.18350-2-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210210093055.18350-2-srinivas.kandagatla@linaro.org>
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

On Wed, 10 Feb 2021 09:30:49 +0000, Srinivas Kandagatla wrote:
> This binding is for LPASS has internal codec RX macro which is
> for connecting with SoundWire RX codecs like WCD938x.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../bindings/sound/qcom,lpass-rx-macro.yaml   | 62 +++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
