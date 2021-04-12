Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F37F235C806
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Apr 2021 15:57:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FFFC41;
	Mon, 12 Apr 2021 15:56:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FFFC41
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618235851;
	bh=x2y2LiwSn/JFqSCi22pWM8RVk/CjX2kkxPxrcQVs6jc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y6L+krXKvLvt7+iICQlM6alTxPShLqwtYi2szHxzWueglDSq5WyK1QUnQ66e0rVpb
	 vrJ1MlDfcWcW1/wl94luEefyxvyNOA7gUd1qsp2oQhoo6h1/FaHGe3usEZ/bNy/nHo
	 Xf5AhWs9BfzTkpjpmasOm+gM0l/oUqXRGhAm2Kl0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD55CF8025B;
	Mon, 12 Apr 2021 15:56:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17739F80269; Mon, 12 Apr 2021 15:56:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77E36F8013D
 for <alsa-devel@alsa-project.org>; Mon, 12 Apr 2021 15:55:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77E36F8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Y1IBVfNn"
Received: by mail-ej1-x62d.google.com with SMTP id r9so20419440ejj.3
 for <alsa-devel@alsa-project.org>; Mon, 12 Apr 2021 06:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CHE3PEKmt4PiYb+8QucOok1H1iAClDgNrdUbB5VajiU=;
 b=Y1IBVfNnkpqfWHMc9n+xO7iRonUwPUxYkDvVp/GdMcKNdsY6xsX4RkediQ+glSWwu4
 J1eSFCpPi16FdZGI9QnJG4yuXnCfdvg6oLhT2ZvlrmrRqVIP6YxNBX6uWE6zT8VxezqI
 7KgZMSwOpZBHYXYYBp/AqRnbV9vkfUudvOX7ZcVXUcLR9WpUnbLmaP/gzdQTEgbZwkyt
 OO3DkTHbjBoDB4uewLLCS7C6NglKjPJNcwYFPUAmYJE8rzaRoIJvKTE2naR5A++eC7r3
 hNpeXrHvGwTAHgOJPRV5GoN8p83v7s7kuR4JYBhk1/poI1Szgi7yP3KbTAQ5o3Otfzeu
 cDNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CHE3PEKmt4PiYb+8QucOok1H1iAClDgNrdUbB5VajiU=;
 b=SuLVqNvDb+KO67Q0n522BJpzs0QWjnsVCu580nsoIhE64tPb2pMyB+Sd1KLwQryjvk
 dQRkuj6fmBBJ5+8mubCIZP36s2cy62LtcNILh3WkJy0ZRe3RSJab4za2X+c5mOaDrPPY
 jZVu8kMY8uZl+VJrjQ+aYANT3eBaS28xDpgUqEnfxKUr8Rg9yVnN+QqT3SBKqf7Fl8aH
 tNwPauMR97TgXSGpbNMlI7ay6UChRDe4feQ+zurt0ppyz2Uwg0gHxPA7deKBN9Wjk8GM
 CTIUsAJOyN5MBVLPzVpfNMhoAJp4Swchky5YE/GtF2vSuN7yKNYJZC+NWeWaB38eMN/d
 rwSw==
X-Gm-Message-State: AOAM5325GZiyV9YOoF7CniFAcTOOTa9CTvwGryMDu6tfuZIsDfDyLW6p
 iwu13SiYroBega+9/3kcZNvJnA==
X-Google-Smtp-Source: ABdhPJwV+A9Rln/7A8ARvKJL0fEz1anXCCSJrnljNI82mFk155ylDOFnoef3CfGrqt9BlsWx4AmhNQ==
X-Received: by 2002:a17:906:9a81:: with SMTP id
 ag1mr18018154ejc.464.1618235752397; 
 Mon, 12 Apr 2021 06:55:52 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id q16sm5867591ejd.15.2021.04.12.06.55.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 12 Apr 2021 06:55:51 -0700 (PDT)
Subject: Re: [PATCH 4/5] ASoC: lpass: use the clock provider API
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
References: <20210410111356.467340-1-jbrunet@baylibre.com>
 <20210410111356.467340-5-jbrunet@baylibre.com>
 <0c8c3b5d-891a-9bfa-3bbc-4982542df38a@linaro.org>
 <1jmtu38znu.fsf@starbuckisacylon.baylibre.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <9d56c9ea-a64a-2939-1bce-dcd40ca16b40@linaro.org>
Date: Mon, 12 Apr 2021 14:55:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1jmtu38znu.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Stephen Boyd <sboyd@kernel.org>, alsa-devel@alsa-project.org,
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



On 12/04/2021 13:17, Jerome Brunet wrote:
>>>    -	return of_clk_add_provider(np, of_clk_src_simple_get, va->hw.clk);
>>> +	return devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, &va->hw);
>> Now that we convert this to devm, You missed error path and driver remove
>> where we delete clk provider. This should be removed as well as part of
>> this patch.
> Indeed. I should not have switched to devm here - It was not really the
> purpose of the patch. Habits I guess.
> 
> Do you prefer I stick with devm (with the suggested fix) or revert to the
> no-devm way for the v2 ? It makes no difference to me TBH.

devm should be good.

--srini
> 
