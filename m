Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D06FE219C27
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jul 2020 11:28:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5541515E0;
	Thu,  9 Jul 2020 11:27:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5541515E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594286920;
	bh=e/WPzaewiI0iSsSWW/YMe0i8gpodHFb1/yw5VnKEhI0=;
	h=From:Subject:To:References:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nGWfcEnVWWj5R2Pw4SRJFCnqUlRYqUuJN7ORnnW/pJstag/BENv19NRj4kwNAKTaP
	 V025nBaKVF+p/rQwh2zorS7WKwfD/GKfBRwSVd+y3/XAZxbDo4SrN6xJr2YckNXb/F
	 VnQL/dP8NatBr1Asjq+jbZwrnR2b2aPuvo84GM1c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62138F80255;
	Thu,  9 Jul 2020 11:26:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9DEB5F80255; Thu,  9 Jul 2020 11:26:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2426F8011F
 for <alsa-devel@alsa-project.org>; Thu,  9 Jul 2020 11:26:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2426F8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="O7MDbSYz"
Received: by mail-wm1-x344.google.com with SMTP id g10so5820029wmc.1
 for <alsa-devel@alsa-project.org>; Thu, 09 Jul 2020 02:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:subject:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=APNj3GH7SrabYcEbM6zu61jJ3pHiq7qsRHWWCs2umoo=;
 b=O7MDbSYzWGIlCaFtrOHXfNKetcTFX1AW9XD+/fzkTl8NVLoxj095nAGoucA8OJnDJU
 Zm/uWAu5mingySdpmLF4k89X7Vsdj5aEMi2ceiyM0xBOb4jj2XY15fvY+mRdzGuX6iJP
 pvCPPbzegHlqAealEJJlgXcmpC25RyB9orMrDTIspKgpE6ftC67lHDNXcTtXRJ1euK4j
 HI4RjLBOyxDgw8aMO2lRN4BmY0N2t9wgyfQfmdBfgeCs8bu/vYvjS78tisAWHY+RthJz
 Td9Ipg3cvGs/bzD5zWXtlsd+NG/zvR33hcIoyW9s16Hl0mLeLvVPLvWRwd/zwBgDiDd/
 2ILA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=APNj3GH7SrabYcEbM6zu61jJ3pHiq7qsRHWWCs2umoo=;
 b=NpfK2mkqIlCM4xme27wjLc/1+NimYZxumgUX4eT8O7GmxSiEEHr5peec4QIwRfZAJ4
 3g2QrmFt/s2ywSjHA3VsfxopQwq/ENIxigMSDtRMDnjdA55dfmhGrXF7uKZbMEFHKd07
 dccN/xaLmP+XuzJY4/Gmy1IJ2O+49yc9zWqYgU5+SUKaAnVTwANG0mF4MT/PUxTPr5x4
 0kr5U3XQTIZw4AckhUJbpoaLUf7pscCLZ+EOi8u+taFd44FNw75XlLgSuQrJr6c+jd4N
 n6LFZAPiDbQIXQY0LY5lOYsn82zWrsWaehPNyNKk95Y+K+EUMcZ2zD5+8RYIEU2gMlJk
 mKEw==
X-Gm-Message-State: AOAM531YOq0VOBLpJZGA5hkplQKFO7mICPLxJtOY49KSyRvq6yCaFmtX
 47uwURkSBHZLORpY9KQQ8nsRMg==
X-Google-Smtp-Source: ABdhPJwnQpg9nhUUvpf38ZMNkjv6EHAR8fOG/O494veiFS1mA+NS7MTvp9pVE9MP+AVMlD4JyLMohg==
X-Received: by 2002:a05:600c:2219:: with SMTP id
 z25mr14249418wml.154.1594286803124; 
 Thu, 09 Jul 2020 02:26:43 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id 26sm3725194wmj.25.2020.07.09.02.26.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 Jul 2020 02:26:42 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v3 2/8] ASoC: qcom: lpass-cpu: Move ahbix clk to platform
 specific function
To: Rohit kumar <rohitkr@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <1594184896-10629-1-git-send-email-rohitkr@codeaurora.org>
 <1594184896-10629-3-git-send-email-rohitkr@codeaurora.org>
Message-ID: <f50135bd-18e5-6a1e-0b39-d0cf51b05cc4@linaro.org>
Date: Thu, 9 Jul 2020 10:26:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1594184896-10629-3-git-send-email-rohitkr@codeaurora.org>
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



On 08/07/2020 06:08, Rohit kumar wrote:
> Ahbix clock is optional clock and not needed for all platforms.
> Move it to lpass-apq8016/ipq806x as it is not needed for sc7180.
> 
> Signed-off-by: Rohit kumar <rohitkr@codeaurora.org>
> ---
>   sound/soc/qcom/lpass-apq8016.c | 27 ++++++++++++++++++++++++++
>   sound/soc/qcom/lpass-cpu.c     | 40 ++++++++++-----------------------------
>   sound/soc/qcom/lpass-ipq806x.c | 43 ++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 80 insertions(+), 30 deletions(-)
> 

LGTM,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

