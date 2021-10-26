Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D09AB43AF57
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Oct 2021 11:45:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55BC116D4;
	Tue, 26 Oct 2021 11:44:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55BC116D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635241502;
	bh=S1Ql/jNpiH0p4hzeESN85u8gGg9RFcm6ct1oTldsl+I=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s43D3pOTudqr93tA3TwTryVwRfuDvKjEDWfguFtcem64IllpJyqNcb2+6BZ/c8vef
	 NSXMMncspEjue/aawrFQJoV+NPXNfL95iwzOtrccea3LV9b9FmNulnGd7YhUz+wBCR
	 RMWBTocd7lVp0epMHS9x5nzjLpZQgjD0OzVFgycs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2806F80269;
	Tue, 26 Oct 2021 11:43:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29CEBF802C8; Tue, 26 Oct 2021 11:43:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81904F8010A
 for <alsa-devel@alsa-project.org>; Tue, 26 Oct 2021 11:43:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81904F8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="cDyNYeZD"
Received: by mail-wr1-x435.google.com with SMTP id e4so18037308wrc.7
 for <alsa-devel@alsa-project.org>; Tue, 26 Oct 2021 02:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=7+2p05oQNdqMryM7yzyh3ArfUcmQhIgi4MURcO9pkCY=;
 b=cDyNYeZD0eE5qHYvZkTQ1FXatVBjBGgpQIpjy7PEZAm0hESeXIqpNH8uwL9VcIckNc
 Nw/G5e6ojWYcO50wS6h8pgCUfx7wSZ0EPCZlDmyB/a21I/GkXdnPGnsVDGep0RrvUyuH
 6hMFo0ncAI4yrwUE5/iwx90ANgaHEIktHwrVvAcESHq0baLlBpeiz+qh6u4ZEHCX5Fw6
 QmKG7f1HZ5N1Fyc+7wnTnGn0u35xx4M0lSU3k6N4+hN6fRyvLeXuTFZTNq6ZVqtdagfX
 2+TusB4JMMzFoD1gR9mGmqopNn1oGgTnDUZFEeBdhUDiK0S3NdkqX8+irb0iapoK+FCc
 dfvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7+2p05oQNdqMryM7yzyh3ArfUcmQhIgi4MURcO9pkCY=;
 b=nPrE8ccLkQr9BnJzosYHO90bwZD1Samob+KVjJkAHrJb9kaBio5QaoCi9rVjxo06Sl
 Czz3mjvQD5rsHNSTzHOgYanaiqVutcbjQwOHPtrcSLWgtABa9ye7Dt2KcyUIgAAB5gzk
 i2kiEaLFWiaK+4tYIjP+rgOniMnohVoAUd8JRwU0PKzppodIoGm3F1P76AXwEQyQLxhd
 HRDujeQf40C0yo0ucZ/9Li4WP/KaX74GcxWqgnwA5jfW4c8P30c9WJ2Wgr4DdVOoVnGm
 Qtb/dt9S/lKhMpHbr1IqqQk0bs/vxMBuJ2mID7W+piE6pWK5yqYZGJrbjxlO2FWwup6K
 7IPQ==
X-Gm-Message-State: AOAM532K/926qjk3fIA0UNi2BSQLYa6l1UhPNHuDsAjHK9i8xpXLST7D
 ZYS+Z3szZKuv3DJFysdiLBmgGw==
X-Google-Smtp-Source: ABdhPJwTI1PlvkM8HM+MxNdDu5WtYnRZ3fTiNZGc2h2fTOV87fP5ubXKinoJ0p4Wa3WJUQJ/YORVow==
X-Received: by 2002:adf:ba87:: with SMTP id p7mr30227824wrg.282.1635241411868; 
 Tue, 26 Oct 2021 02:43:31 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id i24sm89536wml.26.2021.10.26.02.43.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 02:43:31 -0700 (PDT)
Subject: Re: [PATCH v4 0/5] Update Lpass digital codec macro drivers
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org
References: <1635234188-7746-1-git-send-email-srivasam@codeaurora.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <c61e8a0b-27af-dab0-0a4d-2b8a95ed1ba2@linaro.org>
Date: Tue, 26 Oct 2021 10:43:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1635234188-7746-1-git-send-email-srivasam@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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



On 26/10/2021 08:43, Srinivasa Rao Mandadapu wrote:
> This patch set is to add support for lpass sc7280 based targets.
> Upadate compatible name and change of bulk clock voting to optional
> clock voting in digital codecs va, rx, tx macro drivers.
> 
> Changes Since V3:
>      -- Removed fixes tag.
>      -- Change signedoff by sequence.
> Changes Since V2:
>      -- Add Tx macro deafults for lpass sc7280
> Changes Since V1:
>      -- Removed individual clock voting and used bulk clock optional.
>      -- Removed volatile changes and fixed default values.
>      -- Typo errors.
> Srinivasa Rao Mandadapu (5):
>    ASoC: qcom: Add compatible names in va,wsa,rx,tx codec drivers for
>      sc7280
>    ASoC: qcom: dt-bindings: Add compatible names for lpass sc7280 digital
>      codecs
>    ASoC: codecs: tx-macro: Enable tx top soundwire mic clock
>    ASoC: codecs: tx-macro: Update tx default values
>    ASoC: codecs: Change bulk clock voting to optional voting in digital
>      codecs

Tested on SM8250 MTP,

Tested-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


--srini
> 
>   .../bindings/sound/qcom,lpass-rx-macro.yaml        |  4 +++-
>   .../bindings/sound/qcom,lpass-tx-macro.yaml        |  4 +++-
>   .../bindings/sound/qcom,lpass-va-macro.yaml        |  4 +++-
>   .../bindings/sound/qcom,lpass-wsa-macro.yaml       |  4 +++-
>   sound/soc/codecs/lpass-rx-macro.c                  |  3 ++-
>   sound/soc/codecs/lpass-tx-macro.c                  | 25 +++++++++++++++++++---
>   sound/soc/codecs/lpass-va-macro.c                  |  3 ++-
>   sound/soc/codecs/lpass-wsa-macro.c                 |  1 +
>   8 files changed, 39 insertions(+), 9 deletions(-)
> 
