Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5308749BCF
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2019 10:14:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3EB316F7;
	Tue, 18 Jun 2019 10:14:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3EB316F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560845690;
	bh=mO5OjtFkGKuUit4jNqhN72SPgP6WRyqx1ul0KndZ/WA=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ff2342OW9ylcqOCSi3FXeBmuEGNEDZZ4lCjfunfgVn/FNCeXHDtLYJrEafNAQVx7G
	 iCFp04aLh0KbfxizHTjojB/ocjZIqnM9jFX+2mi3SrBN7L6kyQ1HSkbKzavz+ZtHkU
	 aiVKZnW919CQ4fM2TrtfcSsn0O5Sl4cO46G4YNzk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F36BF8971B;
	Tue, 18 Jun 2019 10:13:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9CBBDF896F4; Tue, 18 Jun 2019 10:13:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 415E3F89682
 for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2019 10:13:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 415E3F89682
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="fVFXPhPq"
Received: by mail-wm1-x342.google.com with SMTP id 207so2141526wma.1
 for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2019 01:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=A1EQqhov8GIAHcRALyrTo95BX/wMNvkrcX1BAH+gcHU=;
 b=fVFXPhPqKIKjaT2O6gcVuMT+Bp6qsx0D3k8Zab+TsU468kSMjEi7t1AsBPaFFPoVGz
 YFt/t7e/lBHvir+0dDviw50OaKw8BoS1n8ag7dkiF8QctNTnM1PtVwTt2klkB1GC/GPi
 3uhFkk5SmeidcOT84y94qnWZY2C1t+NVDsRq2nj8hNuTpsnkgvubcHK/ibV6f7gWWDiS
 nE4AEYUnk6DAPts40QJ2RSBxr0lSGkNGeR/Aw79iXvFYWUeKgls21JHuI6X3sT+2du3/
 kHUsei92oxxLKcb+ZgCYHddMVQZMUiuHD7uUFiICCl0LydhP4PX9hRpuY/+6F64V2C88
 qC6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=A1EQqhov8GIAHcRALyrTo95BX/wMNvkrcX1BAH+gcHU=;
 b=GrwDHoAZf8ktziWqU5SYp+0zs5xBHFffij/Kw+aCR3ANyXdK2Tc6M83ekwQ/m/3jGp
 Qk1p4w0EPk7bUpAAD0S1W/eHuk7LO9Xd3z6dmcjCFkKn94qqhc8JC9HCIib6uS6gpdgg
 EkN2FtDwSsowiJDVSkpKqwhitbS/0+pWuLToSKEMlOwM9tl+A4KLIgEc18PZ5RDumWlv
 e9rH15ArakxRB2+18/DoQsmnAVAL5dscbttP9nm37UZXU/zx2u9AG2k3+5dfqqRIjVqe
 Hq3oyl8p9MYhpKB2BZGrLuwY+kmGYWf8qPEiPXv8ctS5niD2dTjAdKTkP8A19Ik6YAUw
 SRgQ==
X-Gm-Message-State: APjAAAXQU1RyxKHxB8WKL6vckCplydYbfiaIYQ1eDaS6V8KYnEVXhtgQ
 CMkboCsNim5RRfdK6PETW5pyhA==
X-Google-Smtp-Source: APXvYqzIrn8u/txhtI7DRk2qYrbC/FWvYlvylHwE4xyIyB3aOYH2N7Zh2XTDr4RKjkCNwWcHIIYflw==
X-Received: by 2002:a1c:dc45:: with SMTP id t66mr2360140wmg.63.1560845579797; 
 Tue, 18 Jun 2019 01:12:59 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id 32sm30733908wra.35.2019.06.18.01.12.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 18 Jun 2019 01:12:59 -0700 (PDT)
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Patrick Lai <plai@codeaurora.org>, Banajit Goswami
 <bgoswami@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
References: <20190618052813.32523-1-bjorn.andersson@linaro.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <ad8ef1b1-a69c-df2f-cec4-d69278b570dc@linaro.org>
Date: Tue, 18 Jun 2019 09:12:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190618052813.32523-1-bjorn.andersson@linaro.org>
Content-Language: en-US
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH] ASoC: qcom: common: Fix NULL pointer in of
	parser
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Thanks Bjorn for this patch.

On 18/06/2019 06:28, Bjorn Andersson wrote:
> A snd_soc_dai_link_component is allocated and associated with the first
> link, so when the code tries to assign the of_node of the second link's
> "cpu" member it dereferences a NULL pointer.
> 
> Fix this by moving the allocation and assignement of
> snd_soc_dai_link_components into the loop, giving us one pair per link.
> 
> Fixes: 1e36ea360ab9 ("ASoC: qcom: common: use modern dai_link style")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

I think the original patch did not realize that there are multiple links!

Acked-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
