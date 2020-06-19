Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D150200514
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jun 2020 11:31:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C739D167E;
	Fri, 19 Jun 2020 11:30:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C739D167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592559091;
	bh=20GDWBY4Jaruy1G66StajTAx6nGSsyYg2GD4WrWN9vY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aJFnfZsU4OtOye/tGeSkB3US4S7dQyDkFw+IzJ4tHDIzgOuUVQryTTgCwJvNH0hHg
	 7y4ar7c5hloyV0PvSfuVybz7w2qOJ6hqnhRgv6BP6nqJzmEXFqMih4gqlmSMAXyoOk
	 eY7Yo02Hs2Z1IuNl9BqjDHJQ8rAKBRxwMt+LGyoc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D854AF80255;
	Fri, 19 Jun 2020 11:29:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65E75F80252; Fri, 19 Jun 2020 11:29:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9AF28F80232
 for <alsa-devel@alsa-project.org>; Fri, 19 Jun 2020 11:29:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9AF28F80232
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="mWxCcNKu"
Received: by mail-wr1-x443.google.com with SMTP id t18so8994668wru.6
 for <alsa-devel@alsa-project.org>; Fri, 19 Jun 2020 02:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rnmzgcKo/cBaDVUinsVzz5iYDrFt1Jg4MPKsxfJtIl4=;
 b=mWxCcNKuTZASSNd7jalvWR9GzEUGsZDpmy2q7VfMBiMO2j/l6Q/HNDM5GKyqA6AqW+
 AUi+ol35+rU6R0Wso2uAfHe0kwM05pdnJ9m9p7ErKNfWz83dnkMKHamX7GtzAlx+SxQP
 zf71Tao0ULZWEExaa/Ld8TFaiTdQjrgiKQ86wmJmvNe/5kV3XHXGzPn2e68YpaPfrmyS
 He8RFDM+urT4huq23TMwwkT8bOQ0AfNCpvZv+d3iQ6HCEN4+R4JUoBE14dyyPAg7EtY0
 V+ff+EVIcbL7x3sdIg/00yxtNxMTQZ6ovQCypY0kACLorkteLS0uNbeOsT/4eQeUHNu8
 joaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rnmzgcKo/cBaDVUinsVzz5iYDrFt1Jg4MPKsxfJtIl4=;
 b=mZnS5gcVP/pzFp00RFLaqzEUiHEZSacNXXEjZyMbXm8Df4zxyJWJPgBLFj5LWHcVs6
 BCm0mywicnB1+kMisWhYmxkaT9zARJ4PihNGE05nDmnJBxiiuU3+DpMflPi9aiBFxkaf
 oTfEFTa/6fC1WWkDxKtS8IzIDzf7BGRFiZOUURDgjagnauTLOvcHUVbAJ9OQOyUnvjlR
 j/aiO3Rve3HT24oc4bMuBGWT6QmjgpPnzWAgUk3s3fLHs4sv8jYHJKDrJdwV8lYIOTyy
 SIGLg5qxXlBYjgFMod9SCY2EVzdauhv3QkIkjCXPiA2w6Z98we3iciMcYr8pDB59UiOX
 w6MQ==
X-Gm-Message-State: AOAM531A6XddFnU8+0vcL2tzXVHEJxCZ9MFOAhFgiSuSAhJy3LOS0IFJ
 13gP2BH1YMi0MJvB5GQBpNeZWQ==
X-Google-Smtp-Source: ABdhPJybrcTtdKuMtr08fQG2M3BYBsLRtDo0jbW3M7e8VIim590FRQjLi35LSQpkk5XSbfkXY340uA==
X-Received: by 2002:adf:ed01:: with SMTP id a1mr3287107wro.271.1592558977492; 
 Fri, 19 Jun 2020 02:29:37 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id o15sm6240352wmm.31.2020.06.19.02.29.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 19 Jun 2020 02:29:36 -0700 (PDT)
Subject: Re: [PATCH 1/3] ALSA: compress: document the compress audio state
 machine
To: Vinod Koul <vkoul@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>
References: <20200619045449.3966868-1-vkoul@kernel.org>
 <20200619045449.3966868-2-vkoul@kernel.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <e4b24fc3-4e5d-bff7-e3ff-83ecea1e713f@linaro.org>
Date: Fri, 19 Jun 2020 10:29:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200619045449.3966868-2-vkoul@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org
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



On 19/06/2020 05:54, Vinod Koul wrote:
> So we had some discussions of the stream states, so I thought it is a
> good idea to document the state transitions, so add it documentation
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---

Thanks Vinod for doing this,
Makes things much clear on the state-machine side!

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

>   .../sound/designs/compress-offload.rst        | 52 +++++++++++++++++++
>   1 file changed, 52 insertions(+)
> 
> diff --git a/Documentation/sound/designs/compress-offload.rst b/Documentation/sound/designs/compress-offload.rst
> index ad4bfbdacc83..7292717c43bf 100644
> --- a/Documentation/sound/designs/compress-offload.rst
> +++ b/Documentation/sound/designs/compress-offload.rst
> @@ -151,6 +151,58 @@ Modifications include:
>   - Addition of encoding options when required (derived from OpenMAX IL)
>   - Addition of rateControlSupported (missing in OpenMAX AL)
>   
> +State Machine
> +=============
> +
> +The compressed audio stream state machine is described below ::
> +
> +                                        +----------+
> +                                        |          |
> +                                        |   OPEN   |
> +                                        |          |
> +                                        +----------+
> +                                             |
> +                                             |
> +                                             | compr_set_params()
> +                                             |
> +                                             V
> +                                        +----------+
> +                compr_drain_notify()    |          |
> +              +------------------------>|   SETUP  |
> +              |                         |          |
> +              |                         +----------+
> +              |                              |
> +              |                              |
> +              |                              | compr_write()
> +              |                              |
> +              |                              V
> +              |                         +----------+
> +              |                         |          |
> +              |                         |  PREPARE |
> +              |                         |          |
> +              |                         +----------+
> +              |                              |
> +              |                              |
> +              |                              | compr_start()
> +              |                              |
> +              |                              V
> +        +----------+                    +----------+     compr_pause()      +----------+
> +        |          |                    |          |----------------------->|          |
> +        |  DRAIN   |<-------------------|  RUNNING |                        |  PAUSE   |
> +        |          |                    |          |<-----------------------|          |
> +        +----------+                    +----------+     compr_resume()     +----------+
> +              |                              |
> +              |                              |
> +              |                              | compr_free()
> +              |                              |
> +              |                              V
> +              |                         +----------+
> +              |     compr_free()        |          |
> +              +------------------------>|          |
> +                                        |   STOP   |
> +                                        |          |
> +                                        +----------+
> +
>   
>   Gapless Playback
>   ================
> 
