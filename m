Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF01219C55
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jul 2020 11:31:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D40621660;
	Thu,  9 Jul 2020 11:30:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D40621660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594287086;
	bh=XfUUBz0TJJZNMjuX5Npz+gggCJ/ZmxStn0WY37zvPFE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fc67g0VOejRKX7iEPdePmQIXxIxHwLFQZCbxLk2ElybjK8IDTvjuqmZCfWCyjeFrV
	 MkewY1PUAFYOhas2ZrN8ZxkzFYgJuZF2k41dGAC94whkyfVUzPKdPXZWV1WE+esD+Y
	 y+d41XBGLPKvAlwLIx/Zh5EqUFzkPBhF3gbId8Dc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF4A4F802FD;
	Thu,  9 Jul 2020 11:27:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C9AFF802FB; Thu,  9 Jul 2020 11:27:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54EC3F802EB
 for <alsa-devel@alsa-project.org>; Thu,  9 Jul 2020 11:27:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54EC3F802EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="th/+uK9d"
Received: by mail-wm1-x341.google.com with SMTP id l17so1094678wmj.0
 for <alsa-devel@alsa-project.org>; Thu, 09 Jul 2020 02:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IUWPqNTyupX2OfJokS7Cyg6szXXlNV4uQSRKuBbr+Nk=;
 b=th/+uK9dwrxSw1xSQDtZLXE93rsinY7TIBR5hcrowU8HCYEo+RR5AQxCCEJOI1NwAE
 RF8Wl4q6A998sRt0mKbrYLRppA7usgYnsIa8tAeN458OgIpojMVBP+ImgJmm0TOGrvRC
 lJOeDXjUNFXYSkfzZcjbGrmhlw6B8K7d7nTceNSz7N4Kbg4Fz1yoLPVCSlNEruYN8nuw
 sqPNJQY12V5+Lox4FiLNTOPiBseRbsjXgF2o2mzA3y94RVcZBBzW101AtTjEnfhfMsgN
 uIQmwhcXhDFfbX/wW01yt3fp6D8weEUoIgs3cTino+4KBshiJiS8YGgJUD5s12S2Gu1z
 YVig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IUWPqNTyupX2OfJokS7Cyg6szXXlNV4uQSRKuBbr+Nk=;
 b=VZNCFOaIQn9RCZOv6Wfl2nThGNFT4MIo4qAyV/V16Zo/sxy2lZvdmtIdDaegy0gahJ
 t9N1czWEIuw8sW4J6sU7BisugrMgEp0Nnwb28lPkgjos3BWeQF6NwWPfjpy71BahnPPs
 Zskfr6JxlwKpciYj6JpttEIU5M++rbRJ8Zjnsy7lSYMAdpeeFrlxwQGrRFc+EhaUU/SH
 QBAKgdFLRSHs7jiEndeDSX+g8ZS7P23xycT4PoZT5KVCovIZGS7otLqQKlh8EAxOi/qf
 tqXyE8JCn+v+1ggKUZ7MBxIjXEEl1Oo17vgxvIc2Hrf51UCxqp7kV3KEy7Uy5hkMKDr8
 xcaA==
X-Gm-Message-State: AOAM532tMlgUE+LW5sMrOWo/4uM1Uc31/FMCLN3tGCMlRSbILlZZ/Acd
 4DGTK8LTNc9USntbxBNNuKRuMA==
X-Google-Smtp-Source: ABdhPJz4oppYHDMOr7cWktwBN00kT6be7JvWf8qKYCDNjlSQ2uUZu9nCNLwF+xq1vN5a0vn60fBs0w==
X-Received: by 2002:a7b:c4d6:: with SMTP id g22mr13844105wmk.170.1594286835202; 
 Thu, 09 Jul 2020 02:27:15 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id 65sm4082233wmd.20.2020.07.09.02.27.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 Jul 2020 02:27:14 -0700 (PDT)
Subject: Re: [PATCH v3 7/8] ASoC: qcom: lpass-sc7180: Add platform driver for
 lpass audio
To: Rohit kumar <rohitkr@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <1594184896-10629-1-git-send-email-rohitkr@codeaurora.org>
 <1594184896-10629-8-git-send-email-rohitkr@codeaurora.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <2d39e123-4b97-787a-7d6c-7d9fdfaa8f56@linaro.org>
Date: Thu, 9 Jul 2020 10:27:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1594184896-10629-8-git-send-email-rohitkr@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Rohit kumar <rohkumar@qti.qualcomm.com>, Ajit Pandey <ajitp@codeaurora.org>
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



On 08/07/2020 06:08, Rohit kumar wrote:
> From: Ajit Pandey <ajitp@codeaurora.org>
> 
> Add platform driver for configuring sc7180 lpass core I2S and
> DMA configuration to support playback & capture to external codecs
> connected over primary & secondary MI2S interfaces.
> 
> Signed-off-by: Ajit Pandey <ajitp@codeaurora.org>
> Signed-off-by: Rohit kumar <rohkumar@qti.qualcomm.com>
> ---
LGTM,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>



>   sound/soc/qcom/Kconfig        |   5 +
>   sound/soc/qcom/Makefile       |   2 +
>   sound/soc/qcom/lpass-sc7180.c | 216 ++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 223 insertions(+)
>   create mode 100644 sound/soc/qcom/lpass-sc7180.c
> 
> diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
> index 0ea4cde..87bec7f 100644
