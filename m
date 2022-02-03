Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 342724A7FFF
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Feb 2022 08:46:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6FEB1620;
	Thu,  3 Feb 2022 08:45:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6FEB1620
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643874379;
	bh=4Awo+SvjP+9bFPEUUOoYEjPjKPG13xGbVA5EeTnVhek=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cs3KBagq1Cfoppacck63BLEbPoVTzqPH3LLablb7SN9UZ5lozgHiEGjSDSIHihfp2
	 3QZXfH3SHctoIMM0ebayAWvVE2AJvoXN2rt6hUUiaKEvxdPOtB2hq2yWaJD9nyXovO
	 PedUSsV5xCAZz2LTg2toazd8le+QI4Wosi/br5U4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10C23F80082;
	Thu,  3 Feb 2022 08:45:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 044DFF8027C; Thu,  3 Feb 2022 08:45:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60CE8F80163
 for <alsa-devel@alsa-project.org>; Thu,  3 Feb 2022 08:45:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60CE8F80163
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="IkENSZKx"
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 6DDF43F325
 for <alsa-devel@alsa-project.org>; Thu,  3 Feb 2022 07:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1643874301;
 bh=OhG4mziwKC+CPTcKfzKVCNrpnpfx1AqXsca0XJZYTPQ=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=IkENSZKx2UPD0uTMSWq8FgnjuKIaNjdntFRTsntRiUzBJ/uFWdMDCzDbbKSUDet9p
 2ym27URGUcml6PRI5xcqlJgynLo3x3791aDd8JmRn5Zw33PX1hM2PquoVLfOmQXDWg
 XEskYTGFbjoZ0hfqtiUH172plMGDmWYyo1qMo1gY8C1nPw1Sn0RwprCjkDHGLeR55h
 Z77KtZvi7EeK/Ly7GDwAqaeEPdPLDm8gHAujMmFGR7qA407v6WSN3zpX5Jb44Tpk81
 q/uWpZBZTNKu6/6tHT9J3r/lXSaRD8edMi9jaeJ+gNNqI3lcJnTEnzDz9mwxzDXFna
 IjsuyPn7HNQ4w==
Received: by mail-wm1-f70.google.com with SMTP id
 s1-20020a1ca901000000b0034ece94dd8cso5432376wme.5
 for <alsa-devel@alsa-project.org>; Wed, 02 Feb 2022 23:45:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OhG4mziwKC+CPTcKfzKVCNrpnpfx1AqXsca0XJZYTPQ=;
 b=CRFiHSxbVfBBvVAfqxBMiKP0KNnY5q4Ckt8n6FZTiHbcX90jnuNmwiTZN6zc1cu4fv
 KtlMdcVxgPkz3S7xShbKs8T64bRJ2hRr8VB/JqAd7+G0R31GnrZlSJESWDysdr0TKQZm
 yZWjaknIQMvwseZ8/i+D09wKxKPMvhaOZK4qMFkB4fs/74di5hRNRf0ZLqNrdXY9wIIu
 3HrwTJFlI14iQ0XO9RWYHYxlSElsr870Sg8cg3VNT+W7GkqGFVaH39bAKSLbrvDSHbAG
 Y/3gpjn48p48WTyCs/nL1MTy8pUE+goZpV1PcZejL6XzLrWv+3STwQRiy0rYcrte+D0P
 QEMQ==
X-Gm-Message-State: AOAM533OUCccGH1OzVQm+idBpKJVedy2l6Q7kANxg77oAtx3ZkXjqcje
 0zeEdovGXZwbc3iEKNPZjBSPCsOcB/twr4lEBtl2gMPEPhs+SnISCrdTUOBEYPEz0nEIfFoKJ7O
 Kh76xKh8HGaVcxygFi33CXeTxnr9vx2XdbAT1cLpg
X-Received: by 2002:a7b:cbce:: with SMTP id n14mr9065301wmi.90.1643874301179; 
 Wed, 02 Feb 2022 23:45:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx7EYnwfQf+4e0Aia2Vusv8wSUQioApcWXZhsNIYdjJxINrO8k+zt6JR/pR0m7cpCwMq3Pd7w==
X-Received: by 2002:a7b:cbce:: with SMTP id n14mr9065283wmi.90.1643874301004; 
 Wed, 02 Feb 2022 23:45:01 -0800 (PST)
Received: from [192.168.0.80] (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id k12sm19665768wrd.110.2022.02.02.23.45.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Feb 2022 23:45:00 -0800 (PST)
Message-ID: <15aa3b3f-67f1-c370-77e0-2de9c7cc6651@canonical.com>
Date: Thu, 3 Feb 2022 08:44:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] ASoC: samsung: Explicitly include gpiolib header
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Liam Girdwood <lgirdwood@gmail.com>
References: <20220202191322.3650708-1-broonie@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220202191322.3650708-1-broonie@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org
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

On 02/02/2022 20:13, Mark Brown wrote:
> midas_wm811 uses gpiolib but relies on the header being implicitly included
> which can lead to build failures in some configurations, explicitly pull
> the header in to avoid problems.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  sound/soc/samsung/midas_wm1811.c | 1 +
>  1 file changed, 1 insertion(+)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
