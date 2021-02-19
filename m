Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 488F331F755
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Feb 2021 11:34:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C33431658;
	Fri, 19 Feb 2021 11:33:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C33431658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613730858;
	bh=YfYZCKt13a8lM5ephvvAB4v2K4EvdTJKEAoR0B/swp4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EDR8TZevF8DHS5hBa6BTsskVPtrq7VK/7wvBDqdZiVhTzkjXQkeRV4z/VhYj5Cfzy
	 IYCTaPybauhlmWsGdmTSo+Wtf+nkvWClMvbVSHqWV3H2h99BP+zC3tovqYiV7810h4
	 jCCHc9ffzfIW6BdEw2nmwFGQhs04CoaE8nzQALWg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2605AF800C7;
	Fri, 19 Feb 2021 11:32:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB07EF8020B; Fri, 19 Feb 2021 11:32:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3EE26F8013F
 for <alsa-devel@alsa-project.org>; Fri, 19 Feb 2021 11:32:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3EE26F8013F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="g2akgUBq"
Received: by mail-wm1-x32c.google.com with SMTP id o24so7069108wmh.5
 for <alsa-devel@alsa-project.org>; Fri, 19 Feb 2021 02:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YA6cVmb3O8kfg77cfufV4vF5LZGgXd8Nc0ggOr/yxQo=;
 b=g2akgUBqFY4TJ9apFUfvffNNRB0bVw1EfiyHlYf2xfLhOhSNMgDhZ2ekYSro1aRv0y
 YxwsI2PqaXVpeXUd/AisX4/W1tD64i/bH7cTHzg2tILvazeIZHcORibTod9P2baTQII6
 2vNgGZMuIGsS+33R1bwl80LPPZfHCLCGbhZ/PADGKZUTPT6rNeMxbUeIbdD9dDvdAzpe
 cGE1M+xC9cCs8dCH7iFSNKOYnKMdT90EvYS9w74LL6L6eru1Dl1Cg9wf1iIK4LreIUf6
 CoP+Pl3t5Osi7k0DkInZYz57MC/lq8PzUrIWH4Y1tH1LS3PsYwCfhDpe398Y3C8lt7cP
 x/mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YA6cVmb3O8kfg77cfufV4vF5LZGgXd8Nc0ggOr/yxQo=;
 b=S2AgeBtPV64fv61KuQjIe8r9iOGEG0xxJhe3Z4HRy/aZBOGC3GLj9TS908X9CNF707
 ObIeApCvzZeqhTvgfX0qJ8BOs8EMI+d+3cyYlG66vAQ8LbDvbYHcUZMgI1JLPKucjB6l
 7Dak7plIPkwRzlkR9uYH+AofWLTbEDZvRJY1ve+h6NXG6d7TSuOWFp0WeOUiGaf5jToq
 aMa8nNYSZ/0rfzLXTF9r4Od2IPA21AKqu7uH5+qtbZE+M9oDxhNMXdVLY74iD3LYmTsi
 e1v1j8K1fD0pxY8ZIsEVQ7RQrRSoabzobc8dL0vp/7w7VUPIzEsCORVATx4bbrpaVIp1
 8WIA==
X-Gm-Message-State: AOAM532HFu4Zi9DGeWN9p0eeUppHjmYVv4/zvJsc9EPJ4SYU+YET1oRO
 tm7P6BT9wjxFRDOxuhXWpjwLLA==
X-Google-Smtp-Source: ABdhPJyod/Chre5Hg126y0UCkIws+WRja69sBoEr0FnlKIrEy14chE+KtuJgD3afsY1XaUlV96zVLA==
X-Received: by 2002:a1c:105:: with SMTP id 5mr7668229wmb.89.1613730759275;
 Fri, 19 Feb 2021 02:32:39 -0800 (PST)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id u198sm3850727wmu.1.2021.02.19.02.32.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 19 Feb 2021 02:32:38 -0800 (PST)
Subject: Re: [PATCH 00/10] ASoC: qcom: remove cppcheck warnings
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20210218222916.89809-1-pierre-louis.bossart@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <f5d6a07d-7d3a-b05e-b6b2-62ada214d143@linaro.org>
Date: Fri, 19 Feb 2021 10:32:37 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20210218222916.89809-1-pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, vkoul@kernel.org, broonie@kernel.org
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

Thanks Pierre for taking time to fix these warning!

On 18/02/2021 22:29, Pierre-Louis Bossart wrote:
> Second batch of cleanups for Qualcomm SOCs and codecs. The only
> functional change is the addition of a missing error check in the last
> patch.
> 
> Pierre-Louis Bossart (10):
>    ASoC: qcom: lpass-hdmi: remove useless return
>    ASoC: qcom: lpass-platform: remove useless assignment
>    ASoC: qcom: q6dsp-dai: clarify expression
>    ASoC: qcom: q6afe: remove useless assignments
>    ASoC: qcom: q6afe: align function prototype
>    ASoC: qcom: q6asm: align function prototypes
>    ASoC: wcd-clsh-v2: align function prototypes
>    ASoC: wcd9335: clarify return value
>    ASoC: wcd934x: remove useless return
>    ASoC: lpass-wsa-macro: add missing test
> 
>   sound/soc/codecs/lpass-wsa-macro.c | 2 ++
>   sound/soc/codecs/wcd-clsh-v2.h     | 6 +++---
>   sound/soc/codecs/wcd9335.c         | 2 +-
>   sound/soc/codecs/wcd934x.c         | 2 --
>   sound/soc/qcom/lpass-hdmi.c        | 4 ----
>   sound/soc/qcom/lpass-platform.c    | 2 +-
>   sound/soc/qcom/qdsp6/q6afe-dai.c   | 2 +-
>   sound/soc/qcom/qdsp6/q6afe.c       | 5 ++---
>   sound/soc/qcom/qdsp6/q6afe.h       | 2 +-
>   sound/soc/qcom/qdsp6/q6asm.h       | 6 +++---
>   10 files changed, 14 insertions(+), 19 deletions(-)
> 

All for these changes LGTM,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


--srini

