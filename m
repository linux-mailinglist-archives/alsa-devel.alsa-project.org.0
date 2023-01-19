Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 423EB673DB7
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Jan 2023 16:40:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBEA673C9;
	Thu, 19 Jan 2023 16:39:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBEA673C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674142816;
	bh=xS2Z9TgsEdYkRLO3MUtTEHFJDwIjTfyXLKP658WCP3U=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=d5I1RS7n1KxvmpHi/FEDOO0dWjbzO2NeEBMTkatanRXh2PfX4ICLCQE82QIjYi62R
	 1LwCXSFQ1EFLXuOOtA8plNa5RQvUx2c9qyXC2tLQh+MAKPh8piarAuPNXOXcw5IqEE
	 N9+xvdcn5+sKqe7jJuRuAm8AP54v2ntd0pjSFqOw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86E5EF800F0;
	Thu, 19 Jan 2023 16:39:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81776F8047B; Thu, 19 Jan 2023 16:39:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0EEBF8024D
 for <alsa-devel@alsa-project.org>; Thu, 19 Jan 2023 16:39:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0EEBF8024D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=RzbKzm23
Received: by mail-wr1-x42b.google.com with SMTP id e3so2232773wru.13
 for <alsa-devel@alsa-project.org>; Thu, 19 Jan 2023 07:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OOhxRkaK5iJsPmgu7cE4ichYw4bJxnhNB1oQShnuPiw=;
 b=RzbKzm235PZAcKc7WeZAK6jCGYYnK4e2HJxFybcU+CbC/oAe/unT6TT0MwdrpHKAsj
 RRUNd3X+YacYM5A2vApQLC3G1GD9/d8eIweSSVzatbqb5N6GdpgMxpgq4R6e20qiUWM6
 K/U7FqDMSbYwMiO2tywoqCgXZ4qeoDgMcu1pKj0BtE4dAoroKbdF91Qi6bPNUU8qFIgI
 wj47VfIf8eT3AvXTjigfzfDBSOOK5/Y7n3fnlD6B7oUcZYDjZbfK8PLIvA4S/0XoRJ41
 rCmxG9WuaF4qO5SpIGutLo/aVmZnc3JL1dsMfCri595JTaEI6rh2rLGJdTkJva3CMRiD
 vN9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OOhxRkaK5iJsPmgu7cE4ichYw4bJxnhNB1oQShnuPiw=;
 b=JApWx1CpYWgXwu9dVL6r9v1LYbSAGfu3d41xOIYj1WvDoR1S2oCdDLbhmSImPtNHsZ
 lf1+VQl3Hpw8AY5BtLwVk6n+d+e5JHCX8UFx0wMJCTxXBV4ZeSLdiY5y4ObS6+F7Ol6L
 mlAFHpF/ylQriNUKGv99bx/pZrk0TCwz7YRrq/ByzcatsUA1OS0QMReHuIOputzKCAaT
 whH/D9cEtkNgIrZd7pwp2VxwIdF5xRKExwp0pIZYxbu8zRRk+kuoBJw1SBuREOpaNAdb
 mVa6Q1G41lezjTC83Mbdh/9kjIva3zuiAaOeY6MmSycXYcZ6XgEYsneRz2Urqfu1L9Bk
 jgkA==
X-Gm-Message-State: AFqh2kqn2AIpdx/+iPVkvsS4ry9KeA74dG7KQh8COlIohLf9+P7mjqmg
 mSPUL/JvARGmWp6mUgKzrOn1fA==
X-Google-Smtp-Source: AMrXdXtwYxY5U66bazeYqy96ygdXa4/ViKWR2UtRp2JjJBOGMcGXo6hk/d07aUoCXYWnvDgztytwnw==
X-Received: by 2002:adf:f6cf:0:b0:2bc:858a:3def with SMTP id
 y15-20020adff6cf000000b002bc858a3defmr18528056wrp.5.1674142749637; 
 Thu, 19 Jan 2023 07:39:09 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 n13-20020a5d67cd000000b002bdcce37d31sm23591319wrw.99.2023.01.19.07.39.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 07:39:09 -0800 (PST)
Message-ID: <479bc3b3-b923-d7c7-5c5c-b6b8b8eec7a8@linaro.org>
Date: Thu, 19 Jan 2023 16:39:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 1/5] ASoC: samsung: remove DMA filter function and data
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Mark Brown <broonie@kernel.org>
References: <20230118161110.521504-1-arnd@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230118161110.521504-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>, Arnd Bergmann <arnd@arndb.de>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 18/01/2023 17:10, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> This data is no longer passed by the platform code, so
> there is no point passing it down at all.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  include/linux/platform_data/asoc-s3c.h |  6 ------
>  sound/soc/samsung/dma.h                |  2 +-
>  sound/soc/samsung/dmaengine.c          |  3 +--
>  sound/soc/samsung/i2s.c                | 21 +++------------------
>  sound/soc/samsung/pcm.c                | 11 +----------
>  sound/soc/samsung/spdif.c              |  9 +--------
>  6 files changed, 7 insertions(+), 45 deletions(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

