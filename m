Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CC6480975
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Dec 2021 14:14:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 340831687;
	Tue, 28 Dec 2021 14:13:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 340831687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640697240;
	bh=myWWuQbNzvR83lW49dDvEV2aOzwfduo6cw/k/KO4QXo=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MHUJxofxaJYqctGPGCDI+QwQv19dWVxxKw+xJToDJNvdqd7pIGmh33JZeo2y7aA4+
	 zO1IHrI3QYpm/GSBjOCSBKFNhoBt6tP9xxTFo3gNqPM41bzK/EsZaMKizJcaPdt8Ki
	 SD2sHcwMZPCINwUW003T0/NAEnu5WaBYc4mvk2Ko=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93A05F80246;
	Tue, 28 Dec 2021 14:12:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 142E6F80224; Tue, 28 Dec 2021 14:12:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1819DF800E9
 for <alsa-devel@alsa-project.org>; Tue, 28 Dec 2021 14:12:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1819DF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="iqUw/HgI"
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id DEE153F1A5
 for <alsa-devel@alsa-project.org>; Tue, 28 Dec 2021 13:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1640697163;
 bh=PHoxW3qi5dqUGPM3GtNEF3gB6+cmt8tlvVRU3SmK+uQ=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=iqUw/HgIeeASox6ZlQmsssd35WIbzE7etR6wBqpqRMO766Txx/5dWxC5862lVea5x
 J3NSResRz4OCYARMykVaOFgvP0YP9y+8mozH48+u7SBlep/Vqz43ZMOYMm8QEfHsaV
 bBc0a+Gcb0gy3RC6adwIia4OLy/OPUB/FpyJU18B+xIfqHN27TkfnQ7NUh057UCMKL
 yJogGz1NlOqkeDrJuPBkiFqNqakT1RWhpCmAXqrLGK46fF5JQ/kE9cLnqiqYXfxYO9
 syVS3/0CyvzVV4r1cEzMHHAhTb561UblCBvjxem+Q6Tffo4L4GX/8TrJM7PIskgDLs
 nuo97lhGkkbYA==
Received: by mail-lj1-f198.google.com with SMTP id
 v19-20020a2e87d3000000b0022dbe4687f1so3238664ljj.7
 for <alsa-devel@alsa-project.org>; Tue, 28 Dec 2021 05:12:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PHoxW3qi5dqUGPM3GtNEF3gB6+cmt8tlvVRU3SmK+uQ=;
 b=YPywgaxVSJwv6CVc0huPC4LYh6uJzf75jsNkF1e3eTqACkZM8JO2x8FHEdvIKTO3/M
 NOTGeSOJoGj/DXmgI7u8eUZhcsT4eHvI5QygkildsEAftC+BtTEYJrIiSq3VACqVTtAn
 26/fF3aHUw49XakAhO71QglXIbsDcnWXTZ2WDs4zUp6M1p63CoS9xwnCuuPCfSLLtbO3
 BZDALgsmwQ/JpqzdXsu/rTHEeDcXOziIPT4+OgZxRFbxkgjxpaJXHOYmpNFDarmgSqq8
 WDx0GpQ56LewD4G5odtKiWSKkjU0bPiH273QkVcdzS/k1bd+Gk4xdEjI2CPhAYJtUQUB
 vzug==
X-Gm-Message-State: AOAM531AHb2BRRjRVtxPdloi34QCVTMyiJI9av4LC3tjKzK4ZWmCDsHH
 x8tYXkXNkqu1RIYX0qxtXM/imRBcvX79nFzKIoppHroEYyqXYiqk+G59smzryVbS/3H9LTCFpHu
 uqoOiSlFfzwTxvXdzorQMpOS4JHqGkJwP/xyGtL7z
X-Received: by 2002:ac2:46d4:: with SMTP id p20mr19141642lfo.653.1640697162839; 
 Tue, 28 Dec 2021 05:12:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyoavReARFXLadW++33qI3Nh2nMVHqNtx8xt4u7Le2xVMY4oTna4zrRBpafVgDfdAK51erwxw==
X-Received: by 2002:ac2:46d4:: with SMTP id p20mr19141604lfo.653.1640697162249; 
 Tue, 28 Dec 2021 05:12:42 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id
 r11sm115506ljp.18.2021.12.28.05.12.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Dec 2021 05:12:40 -0800 (PST)
Message-ID: <5e799c7f-573b-d254-80e6-85404ef536b6@canonical.com>
Date: Tue, 28 Dec 2021 14:12:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH] ASoC: samsung: idma: Check of ioremap return value
Content-Language: en-US
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>, s.nawrocki@samsung.com,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com
References: <20211228034026.1659385-1-jiasheng@iscas.ac.cn>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211228034026.1659385-1-jiasheng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

On 28/12/2021 04:40, Jiasheng Jiang wrote:
> Because of the potential failure of the ioremap(), the buf->area could
> be NULL.
> Therefore, we need to check it and return -ENOMEM in order to transfer
> the error.
> 
> Fixes: f09aecd50f39 ("ASoC: SAMSUNG: Add I2S0 internal dma driver")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> ---
>  sound/soc/samsung/idma.c | 2 ++
>  1 file changed, 2 insertions(+)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
