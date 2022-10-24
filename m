Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9C560A7A5
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Oct 2022 14:54:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B88157643;
	Mon, 24 Oct 2022 14:53:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B88157643
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666616071;
	bh=wiDvYU9tdgpOig6nr7IIgq5/IdZ+y3RdrQt1IcO89/0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TRdLhrj2YbWNRV3auMttfTi3Zurp43tnAQ/tWK28hUju104ETaoQXCvxZejvGLu+0
	 0pkqrWEjop8PLHHL37VHCgQbnV34M2nhyQvDBkV9CPXE4HRnQWalmq2M3FolijLMDF
	 GT6oa3dpOPD8lenLGU9lsXcMOlYnm+p4vucXLw58=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1484FF8053D;
	Mon, 24 Oct 2022 14:53:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1FEEFF80431; Mon, 24 Oct 2022 14:53:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 308AEF80431
 for <alsa-devel@alsa-project.org>; Mon, 24 Oct 2022 14:53:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 308AEF80431
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="pIjNTn/F"
Received: by mail-qt1-x82a.google.com with SMTP id a24so5496327qto.10
 for <alsa-devel@alsa-project.org>; Mon, 24 Oct 2022 05:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=V2WxXBEhE9lmDiSCmtp6HlQFdsUIOok3Tbt3p22NXFQ=;
 b=pIjNTn/Fw5wWPAnx2/iV0f7mAvnR9IX0NCgHKJpazCJnQ1lUaI1x7+jTaz8VYmauFw
 9RqxCpRkKWJd0rFVRquaxty4jObK9YVXOa8B/ART4GgclBBJOiCLUvD6UkecvNvTkile
 Ql1kTwcznQdIkkerX139c4qhw/erTM55HQ9pbOj9I0/RwJtwvlh3lN+18e4GyNGwyzp3
 mH33QTClrMl467lrxdZ7cG5i9eC+l3SJ70c+d4lOhzQSMVlJMYEvZ6E1qskDNlYxbBRW
 tYGZ4Ht2h0l8C7iXxxoaMskAXr8pI/BeMKNAHkC1ZTdhH8k524eluQdJ0zLMClj5sVRK
 tYxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=V2WxXBEhE9lmDiSCmtp6HlQFdsUIOok3Tbt3p22NXFQ=;
 b=58lzv6a9HamWpBPWrAc9qXIZQAkSfFR9WOxqaeIYCrWrxaoqYZhHEGNXcEVYpScVzR
 cHqwOs8gWrGKagn0sN+DlcHQiwtjZ50VhjSidIOj4FwFbw41RGXvtveIsNbYsNKL+XjW
 RCNZ2kF8JtvyqAfXWXkbxzr4ls7J0TLQqQe3VBUSDYjpkNSMjY00AR1W4zcGOdowHQbI
 JSZwlV3CqpRcS9xsN8RP4SefDNVxEsDzUDrUVM+6wjMJhi1k+q1lFwmjHT2D7dYmoGM3
 p+Hstfb6wu0aPNUqxrrHJ0bXRomi+zwfBpaskcNJwW8H3eHE8FNfEsvwg/i1OrZeKmpb
 Y4Cw==
X-Gm-Message-State: ACrzQf0MjgbRUZdjR+Vwn9DyydZgizfWpFuT4Fw1x8PVpLpjMsfZIMX8
 FjR8CiKpKcwhJH1JjVVMoofXWg==
X-Google-Smtp-Source: AMsMyM6zKtB0VLD6JglF4BT8OXGL92tkP9rpSuRx3jzlARvuiFn8HIW3TcUaeoMq28LG3WQoVTOaKw==
X-Received: by 2002:a05:622a:15d1:b0:39c:f1da:fe0e with SMTP id
 d17-20020a05622a15d100b0039cf1dafe0emr27027912qty.662.1666616007083; 
 Mon, 24 Oct 2022 05:53:27 -0700 (PDT)
Received: from [192.168.1.8] ([64.57.193.93]) by smtp.gmail.com with ESMTPSA id
 y8-20020ac81288000000b00398a7c860c2sm12704392qti.4.2022.10.24.05.53.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 05:53:26 -0700 (PDT)
Message-ID: <78b09272-4184-b2d6-3849-a6e0e8a16255@linaro.org>
Date: Mon, 24 Oct 2022 08:53:24 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 21/21] ASoC: samsung: remove unused drivers
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
References: <20221021202254.4142411-1-arnd@kernel.org>
 <20221021203329.4143397-21-arnd@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221021203329.4143397-21-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Ben Dooks <ben-linux@fluff.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
 Simtec Linux Team <linux@simtec.co.uk>
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

On 21/10/2022 16:27, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The s3c24xx SoC platform was completely removed, as were most of the
> s3c64xx based board files, leaving only the DT based machines as well
> as the MACH_WLF_CRAGG_6410 machine. All other board specific ASoC
> driver can can now be recycled.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

