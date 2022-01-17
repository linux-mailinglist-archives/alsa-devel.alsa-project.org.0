Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3546E490746
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jan 2022 12:47:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B53FD1784;
	Mon, 17 Jan 2022 12:46:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B53FD1784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642420060;
	bh=CNwmsGoaZ7LyvWgfHEqMTbUCUx3M20cPdzd+5810PDw=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DOA6nqHRZsHTR7IP0oQquUlATQXImNjE84SWyqZMFXjbNoSCJ/zN4Wy32yniawuLL
	 kgkmPVhbq2enESgyUrpY+TRDfZEvIhi5M2CvL0qq8Wn9+LYTofO50A2fZQ72sRGr50
	 BeV1gbkGjeviqZSnmTBr01OEA5c0oWiRIxLWtRQM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A8FFF80254;
	Mon, 17 Jan 2022 12:46:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A2A4F80249; Mon, 17 Jan 2022 12:46:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C02CDF80100
 for <alsa-devel@alsa-project.org>; Mon, 17 Jan 2022 12:46:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C02CDF80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="otS8mumh"
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id EBA7D3F1E5
 for <alsa-devel@alsa-project.org>; Mon, 17 Jan 2022 11:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1642419980;
 bh=2navcQ0WRElNhWSfCvnqCtUkEsAg/QuZ7IOd8SfSz50=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=otS8mumh03XUd2m//3fFutFUQ6Y2Yz5aUC2S65dDPi5PRo/UrQf+E9P0IdRn/BEoe
 8K3f+va2axqGoM4L5CnWbk1znhwBEtgznO/VG/cbzHN4L4kYEPH/8ylQr9VL0I09r3
 QmNnij+1JBzzK1PZzmDmiZgPfEMa5XNNATOtgv3DZxAAZguCieUoYPdPvVe4ZKekwr
 /4+1g6MQaPqVvADubZlzTDSwOAGSYmhDB0lpIbh9TNwAIZx/qsLRnXi8CP1T0KLvT4
 eSuhYaxXn/ZutcQqbJyMLVTUG/gF1R7d+Vqksk4REAVN3f6JlNNQXo3MHldb/DCpBH
 o3xGp9b79m5Lg==
Received: by mail-ed1-f69.google.com with SMTP id
 p14-20020aa7c88e000000b0040240401a02so3172411eds.14
 for <alsa-devel@alsa-project.org>; Mon, 17 Jan 2022 03:46:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2navcQ0WRElNhWSfCvnqCtUkEsAg/QuZ7IOd8SfSz50=;
 b=riAClSKmIWdA43EB7oFL4AKXddSrH84daYQW1yXvIZyTey6rDujYmb81vo5IUCxI7x
 vlx5Pjvn4oJCed6D8nQAAQL1uBHQXi+Y+mRb4OmKjcTACQ28VoeewrM5YmbCOP/+PLx9
 7NyY0c+wysKARRbZbe3RGcWRghHaPtJuJWs0sd+0roZTMEEFcRUp2BhzUNLz4QGEK9Eq
 7il0OjPLHV3CxLian7KCkHTkHMXcDaVJR+ZpbB20IyMcIIi0v8mvSy0Oydd/yLCeB3GR
 CPnngyy50trDDROC+oyGaeWP+/dZ4BSKkNPzWjwMCyan9nJDf0RtF0AU0pjo0fAJnlN4
 GQ/w==
X-Gm-Message-State: AOAM530Rc7g4fcTO0vJgUxw5I0SZPebMJEsJ1L9xqol4s6LqNFEJ11i6
 sM33r5xdcx9nza0p0pArjqRK1bXxv9VVOSh/BT9oLgYRl2jWLIpmo8QM03oI7nILuG889VOqFnG
 GZYH/I2IRYcNgN31kwXlgH7jQmpilK76iSYzzFzmK
X-Received: by 2002:a17:906:954f:: with SMTP id
 g15mr10577313ejy.755.1642419980497; 
 Mon, 17 Jan 2022 03:46:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyGTZAqOavFLCxp4H/YcZ7P4w7DVAjIx/j59efiAeyFrXxLU+CMV9xrYwEVLTkxErw6RieKXw==
X-Received: by 2002:a17:906:954f:: with SMTP id
 g15mr10577296ejy.755.1642419980301; 
 Mon, 17 Jan 2022 03:46:20 -0800 (PST)
Received: from [192.168.0.37] (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id w11sm4327081eds.88.2022.01.17.03.46.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 03:46:19 -0800 (PST)
Message-ID: <5ea17ac8-c351-069a-efe5-832b1778b7dc@canonical.com>
Date: Mon, 17 Jan 2022 12:46:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH] sound/soc/samsung: remove unneeded ret variable
Content-Language: en-US
To: cgel.zte@gmail.com
References: <20220117110357.863990-1-chi.minghao@zte.com.cn>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220117110357.863990-1-chi.minghao@zte.com.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Zeal Robot <zealci@zte.com.cn>, tiwai@suse.com,
 Minghao Chi <chi.minghao@zte.com.cn>, lgirdwood@gmail.com, broonie@kernel.org
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

On 17/01/2022 12:03, cgel.zte@gmail.com wrote:
> From: Minghao Chi <chi.minghao@zte.com.cn>
> 
> Return value from io_remap_pfn_range() directly instead
> of taking this in another redundant variable.
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>

Where is the report? What is being reported here? The tag reported-by is
used to credit bug reporters, mostly public as we work in a public way.
Since there is no bug and there is no public report of anything, the tag
is not applicable.

Please do not add unrelated tags to the patches.

> Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
> Signed-off-by: CGEL ZTE <cgel.zte@gmail.com>
> ---
>  sound/soc/samsung/idma.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 


Best regards,
Krzysztof
