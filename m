Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C61386F26
	for <lists+alsa-devel@lfdr.de>; Tue, 18 May 2021 03:29:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C023C166E;
	Tue, 18 May 2021 03:28:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C023C166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621301355;
	bh=tDMZGB+NLdjby04HkypcSoICl9YSom94uFQO0o5CX7s=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RYScA8Sr3vBGMxeqH6dtPsFCIly2x1l/v31QXLbKntsQldD9tMNpbLsmSNw/lCaZD
	 a7jUneFxY/JnK4l81symqJ2VmDDV+CcM8r9BGAVaB3Oi5EaVv7ZZYKeqcmUTZec4bF
	 WxGKAUWMqH/23pUSfelnriVx4ViKsRcEc1tSpwD4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2873FF80246;
	Tue, 18 May 2021 03:27:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CBF83F8020B; Tue, 18 May 2021 03:27:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 73AE2F80082
 for <alsa-devel@alsa-project.org>; Tue, 18 May 2021 03:27:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73AE2F80082
Received: by mail-ot1-f53.google.com with SMTP id
 q7-20020a9d57870000b02902a5c2bd8c17so7259116oth.5
 for <alsa-devel@alsa-project.org>; Mon, 17 May 2021 18:27:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=x5MuHDr1VuOYtFi32SjfZtdQohcWcKpREmn5Jo1hbuE=;
 b=jc7UOSRka30ZdMSSNuBPmP0ur8GJORSd+CLniiGylMBUIWVjSxx0daxPFXlTimhEsD
 60LGXHjlB6bFdSe5o87OVhKhngRv98jwznVruouIV3Vhx6csdULSv8cGRJ04+ELfnXkU
 0Pj+q6BeNGIwyi3R5X0X14PFgnl0CxGIj+LcunfVy5mpzOjkmqcFe2xbO0NmejCsP6UE
 dLGe5Z5VIs6WK3F+n3hdtd8jLiKufuwGUvojza1ODsINl6S/GcaSGEqyy2rQ9S2KD6EA
 FXUCSqElh4MTvezo1m3yANfdRFfpXoiCDvB4hogn9Dtd+Z+daq6HpfMfeUGBYNNRyCND
 nrDw==
X-Gm-Message-State: AOAM530epaa7q3Zgfe4/edIivVZiP1/yBVs+f/Jtgqylpg0f2IlTNKpi
 jlGpEnH5DK/AAPg+uQz8EA==
X-Google-Smtp-Source: ABdhPJzW/WET1XynmeNegfDrhTPJIkFYbUP1pwCRoml9gTosHpax4KZkPIP2FBySmP+4CDjgKyLGDA==
X-Received: by 2002:a9d:ea2:: with SMTP id 31mr2193056otj.200.1621301257191;
 Mon, 17 May 2021 18:27:37 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 77sm2500602otc.54.2021.05.17.18.27.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 18:27:36 -0700 (PDT)
Received: (nullmailer pid 3600153 invoked by uid 1000);
 Tue, 18 May 2021 01:27:35 -0000
Date: Mon, 17 May 2021 20:27:35 -0500
From: Rob Herring <robh@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v5 4/9] ASoC: dt-bindings: wcd938x-sdw: add bindings for
 wcd938x-sdw
Message-ID: <20210518012735.GA3600100@robh.at.kernel.org>
References: <20210514103405.29927-1-srinivas.kandagatla@linaro.org>
 <20210514103405.29927-5-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210514103405.29927-5-srinivas.kandagatla@linaro.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, broonie@kernel.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org
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

On Fri, 14 May 2021 11:34:00 +0100, Srinivas Kandagatla wrote:
> Qualcomm WCD9380/WCD9385 Codec is a standalone Hi-Fi audio codec IC
> connected over SoundWire. This device has two SoundWire devices RX and
> TX respectively. This bindings is for those slave devices on WCD9380/WCD9385.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../bindings/sound/qcom,wcd938x-sdw.yaml      | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd938x-sdw.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
