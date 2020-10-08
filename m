Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B85286E31
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Oct 2020 07:40:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B91CB16B1;
	Thu,  8 Oct 2020 07:39:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B91CB16B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602135619;
	bh=0AU7Wey0YwLsCxF9Ikf9HWtOt61vAjPIa7mJcKiJ7dc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SEi+PemBtYUWxvcrnFLopxVu0HzdGqI2zl1qAYdfQ8d/9GYqN7NZezLJVFVWs/5PU
	 iiy662+AOnEc82iAhUZfh4mTwTcQGTh/i5ZW4ZqLRP2i5rOGr/ulf+NziwCyhQPiQE
	 E6FOPG6NM7QBsz6OKKpMlHcwYwMWvQmfSv6Im2ow=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9542F8016C;
	Thu,  8 Oct 2020 07:38:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4CD34F80169; Thu,  8 Oct 2020 07:38:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0D9EF8015A
 for <alsa-devel@alsa-project.org>; Thu,  8 Oct 2020 07:37:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0D9EF8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ml3paT+K"
Received: by mail-wr1-x442.google.com with SMTP id n6so4811652wrm.13
 for <alsa-devel@alsa-project.org>; Wed, 07 Oct 2020 22:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uzc1+OIpuC778zhrwXmoWv4oWCtwA3uOVXW778gGkv8=;
 b=ml3paT+KU4nk5x+67HGcDobgbHZCUhknrUGbn8Ei/i83N7QKesst6RKodzyNnzpYUL
 OE4Q8oDcGhTBpDDwJYbX0t4LPj4H+iFvRnJIV0X/ibHVqLtB8kDxf+nr/K23f+W4Sglj
 w4zB3+WLo07WUdGOkGxFYsPfMUg/Nk2R9H1hj4/VOzQpBzmFP7xc2j+PuP10WRM5qfey
 CxNoAqIKXTgliKTdGm45ez/GXOnmML8v/Nixp8f3B+5bV+UMGSOI8wNAFYffKYXQUQgS
 h+rYoRjIYHqov7TrHMaRK2kPktgYDnEA+fZX+SapdxilqPml2+ToGEkhR/1tY7OdeTqD
 +XSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uzc1+OIpuC778zhrwXmoWv4oWCtwA3uOVXW778gGkv8=;
 b=Zjt0Jd6F6PM9Yp4qpdxVAtEfk54qrbpond27OT6VgE89S2Q35WGnsbqIqXYf5PJX2E
 yhBgD5ZdjHybj7O3hSdBO4mdCGLVFUVYzM9WbpoMRFn7zy5872QenNdraaXb5qj+Mh2Q
 pD1XgM2fj1xArFv9ZDxX67+UnC2b1BxoVb+JgU69iXzkM1FU+0WtST8F9xLUu2Vk5/d3
 bvPlx5Ka4aOXwPf+djempUZf04AvtxueJV2TtmX1vMQnhWZP0pvtfEOcINCKyiW5by3y
 K2Zwh1gOpi6C8UVckYP11a7PSEqlrUaKcQa6eRbkZYUL75Rzn+siNehX9IiWjaiIm3OQ
 TltQ==
X-Gm-Message-State: AOAM532k6XVTngAPz1yReIeFBm55+LIhDkDRg6lWUilmDWBeTdmstJAB
 hC4bDlDNwocjw+P/gG87zHH+lw==
X-Google-Smtp-Source: ABdhPJy0nwSSdzGNFRWaXQ/aqDIfsPChRlGqie/SnNdwPMFez5OYqoih1QeT3sEFc7n3rd7ZrLLWfA==
X-Received: by 2002:adf:8030:: with SMTP id 45mr7377274wrk.177.1602135469363; 
 Wed, 07 Oct 2020 22:37:49 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id b200sm5594266wme.44.2020.10.07.22.37.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Oct 2020 22:37:48 -0700 (PDT)
Subject: Re: [PATCH v11 5/7] ASoC: qcom: Add support for lpass hdmi driver
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1602134223-2562-1-git-send-email-srivasam@codeaurora.org>
 <1602134223-2562-6-git-send-email-srivasam@codeaurora.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <fa33de91-16b8-8938-9577-e8e763039f83@linaro.org>
Date: Thu, 8 Oct 2020 06:37:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1602134223-2562-6-git-send-email-srivasam@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
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



On 08/10/2020 06:17, Srinivasa Rao Mandadapu wrote:
> From: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> 
> Upadate lpass cpu and platform driver to support audio over dp.
> Also add lpass-hdmi.c and lpass-hdmi.h.
> 
> Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> Signed-off-by: Srinivasa Rao <srivasam@codeaurora.org>
> ---
>   sound/soc/qcom/Kconfig           |   5 +
>   sound/soc/qcom/Makefile          |   2 +
>   sound/soc/qcom/lpass-apq8016.c   |   4 +-
>   sound/soc/qcom/lpass-cpu.c       | 247 ++++++++++++++++++++++++-
>   sound/soc/qcom/lpass-hdmi.c      | 258 ++++++++++++++++++++++++++
>   sound/soc/qcom/lpass-hdmi.h      | 102 +++++++++++
>   sound/soc/qcom/lpass-ipq806x.c   |   4 +-
>   sound/soc/qcom/lpass-lpaif-reg.h |  49 +++--
>   sound/soc/qcom/lpass-platform.c  | 383 ++++++++++++++++++++++++++++++++-------
>   sound/soc/qcom/lpass.h           | 118 +++++++++++-
>   10 files changed, 1075 insertions(+), 97 deletions(-)
>   create mode 100644 sound/soc/qcom/lpass-hdmi.c
>   create mode 100644 sound/soc/qcom/lpass-hdmi.h
> 

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
