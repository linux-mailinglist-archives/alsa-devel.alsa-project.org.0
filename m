Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8291850EDE3
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Apr 2022 02:56:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 083B81890;
	Tue, 26 Apr 2022 02:55:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 083B81890
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650934594;
	bh=2Db05rJ3GklhO7x/HSrPE//Wckn/4vEXEylbU8NeAtc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qTwg5NvU/atIzH2NUqoPwUyT5A6mRv/M3AW5RjZlqkqGgGPX3DMNmHXrf9/QWVxC3
	 1whSgK8bM1D8PO7cszmRJse8wmI4kPbkD3cYs0x00Ig8VXpVTwVnWMkVZ1x6aIO1Kb
	 mqgTN8J7zBQiF5FNVgTUAab8w8nJuUSZJJU/eL0I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F6C0F8016B;
	Tue, 26 Apr 2022 02:55:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D266BF8016A; Tue, 26 Apr 2022 02:55:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6195BF8014B
 for <alsa-devel@alsa-project.org>; Tue, 26 Apr 2022 02:55:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6195BF8014B
Received: by mail-oi1-f178.google.com with SMTP id l203so8222510oif.0
 for <alsa-devel@alsa-project.org>; Mon, 25 Apr 2022 17:55:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Aa14jKg1EBvAUQaSK50DEJUfnrJhBtd3b/4HS3dD0yA=;
 b=h/bbV9ZGv5WJYoiEGWhWDnIFdrJep6dVTF7Dv4uDmlWMFoRnku0rbhjdY7bAp6/4wG
 tFMfd/vnKEqztII4L0GPE+mcSNrpsErJ1+1jZb9P3hSwDq2cS6pNepmfxH8tp06iUarh
 3kXCBDI1q6PhFxXS4/VhM9ubylbcVt3a6qeXi4MbqARU/yLRPlCkNlPXGYvozQV5Sxgs
 K8DOdPUA/KnnlorzWl/JOs6mIlo7ChpGDTAqBbTsWT9xvyZfPF/nQWJWce4rGeL0Xbvy
 h+LRg+6JcZIV6cgM7kXWNNBsqE/L5aWenaaH2bv6G9cYx98bX54IqPjFpAG+mQ7hXzEz
 kb+A==
X-Gm-Message-State: AOAM532UL/ae1FFtznS6SBNkP28JPmrOqs/N9x64PaN9tpECWghhzirM
 1FyY43tWtgNjPy8M2rWuFQ==
X-Google-Smtp-Source: ABdhPJzCEDuN/45uLcrN3SNTFLMqH442El+5OlEkAz0JcvBRd/hcw/J/vYnNhkiEeo/e+B046yRqSA==
X-Received: by 2002:a05:6808:170b:b0:2fa:729a:a42e with SMTP id
 bc11-20020a056808170b00b002fa729aa42emr13915543oib.0.1650934523215; 
 Mon, 25 Apr 2022 17:55:23 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 m15-20020a9d644f000000b005ce0a146bfcsm4348105otl.59.2022.04.25.17.55.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 17:55:22 -0700 (PDT)
Received: (nullmailer pid 657948 invoked by uid 1000);
 Tue, 26 Apr 2022 00:55:21 -0000
Date: Mon, 25 Apr 2022 19:55:21 -0500
From: Rob Herring <robh@kernel.org>
To: Ryan Lee <ryan.lee.analog@gmail.com>
Subject: Re: [PATCH V3 1/2] ASoC: dt-bindings: max98396: add amplifier driver
Message-ID: <YmdC+XaH2ZQhSNOW@robh.at.kernel.org>
References: <20220425173715.1827706-1-ryan.lee.analog@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220425173715.1827706-1-ryan.lee.analog@gmail.com>
Cc: drhodes@opensource.cirrus.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, ckeepax@opensource.cirrus.com,
 stephan@gerhold.net, arnd@arndb.de, hdegoede@redhat.com,
 linux-kernel@vger.kernel.org, broonie@kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, ryans.lee@analog.com, cy_huang@richtek.com,
 robh+dt@kernel.org, srinivas.kandagatla@linaro.org, pbrobinson@gmail.com,
 lukas.bulwahn@gmail.com, krzk+dt@kernel.org,
 pierre-louis.bossart@linux.intel.com, tanureal@opensource.cirrus.com
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

On Mon, 25 Apr 2022 10:37:15 -0700, Ryan Lee wrote:
> From: Ryan Lee <ryans.lee@analog.com>
> 
> This patch adds dt-bindings information for Analog Devices MAX98396
> and MAX98397 Smart Amplifier.
> 
> Signed-off-by: Ryan Lee <ryans.lee@analog.com>
> ---
>   Changes from v1:
>     Fixed yamllint/dtschema/dtc warnings and errors
>   Changes from v2:
>     No change
> 
>  .../bindings/sound/adi,max98396.yaml          | 79 +++++++++++++++++++
>  1 file changed, 79 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/adi,max98396.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
