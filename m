Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D616E279B50
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Sep 2020 19:21:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 795FE1A9D;
	Sat, 26 Sep 2020 19:20:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 795FE1A9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601140886;
	bh=zHI56kT8cuqEwkqYFfWFIgFw4ZimOq+Z6DjvLsDpZMs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oZheObyQ8I/Vrea6BBhvPCllRSh8BqX/viwNmGHbkqcZy+mqETGDRqOoKWFj/VVP8
	 hDaf7O+wLdejuu9xhYxYJp0Wk+vk4ocElJU8ppuWh/NuvTwzCfEb4JxjkDNByWfOZJ
	 M7GgVOrqb00TyVwnT0RS67FCl4KIwuMeDcAX/HbY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8307AF80259;
	Sat, 26 Sep 2020 19:19:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77580F80256; Sat, 26 Sep 2020 19:19:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C723EF800FD
 for <alsa-devel@alsa-project.org>; Sat, 26 Sep 2020 19:19:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C723EF800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="gMWbjhin"
Received: by mail-wm1-x32b.google.com with SMTP id w2so2352677wmi.1
 for <alsa-devel@alsa-project.org>; Sat, 26 Sep 2020 10:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Lkvu6Do6zi8mY6e4YbMjyVYGYPqXE9nNWYgmKxJTz5Y=;
 b=gMWbjhinVtmFxKlT6A60gjXT9XbVk4Hu5WEqGrnA+SpGJgNw5NfIjmoIYXpNlw7D9b
 UWtugf4K6WrVMGDY/BkC85+7HKzZP09rQodoKB+o2qxQNQp61yvF11WYTXj8ii60ayia
 AxEPZGJLz6d1Mb2xcl7FxkTw0zPSmZWJesmPhq73e2IUz6vprRd8u54439u/O/Iu8B9C
 VjPNWfnpqpCE3GNI2fMdTFJI4UjcfYrwqjSMUMRuGLOeksias9GIFzjjJweMh5mFh5em
 h7yFF1E6dUndkLq3k3yFX1f9OLUh127FtVzlD0vLE3VJnI8huZUwCu4iNtMatQu9kIQ8
 WL7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Lkvu6Do6zi8mY6e4YbMjyVYGYPqXE9nNWYgmKxJTz5Y=;
 b=Ux/van84VSDrB6Ck4/xpfH2pxTfZtrw4oZcDeUbBsGRWuvv5KnFLsRIbAqjcr+Z7se
 +6d3UpF5J3jpRti/XqsL6EMQaDtYnPyl6vdQV69tMj9+UxG6FJ1x0L8o0wNxzrmw1ZOu
 GadQDvAm0iTUu3BoSA01xdSE2/trqZeqkV6lDkgjQNgOpPCrCRN4GuqIA0v7Kf+AwhK4
 mGKSl630xw5EYOTzuJ2sbfw/XVR23kZlgF0CZTTxzHxQRcYcJ1Vw6UMqV+jn7/yVHjnM
 jFjO5XvNJmr1bwq+pm+92IyUpRzW4LbtzmENVvBFE1w598d6AzyllEQuXFCm+roa/DRY
 okWA==
X-Gm-Message-State: AOAM533rhl3Tj7+6iO6N8oGVOuS4UM7H4xhYrUsRk8MLUlFMxXTgW3IH
 6k2ibeGEY0HCSfW9fkc+Bl+BhO/gKpYugw==
X-Google-Smtp-Source: ABdhPJxEOGhVqSdsVDi20EGXCiOZDwnuLJWllECZphdU5gP9knDCQbeADdpGF+mxv29Cz+FkSu63Rw==
X-Received: by 2002:a7b:c4d1:: with SMTP id g17mr3298799wmk.167.1601140748905; 
 Sat, 26 Sep 2020 10:19:08 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id o16sm7080304wrp.52.2020.09.26.10.19.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 26 Sep 2020 10:19:08 -0700 (PDT)
Subject: Re: License clarification of sound/soc/qcom/qdsp6/q6afe-clocks.c
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <alpine.DEB.2.21.2009261855280.31589@felia>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <dab67d9c-8ef6-bf41-dd9a-fbd6e29d6818@linaro.org>
Date: Sat, 26 Sep 2020 18:19:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2009261855280.31589@felia>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 linux-spdx@vger.kernel.org
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


Thanks Lukas for spotting this,


On 26/09/2020 18:01, Lukas Bulwahn wrote:
> At the end of the file, you further state it licensed with GPL-2.0 with
> the following line:
> 
> MODULE_LICENSE("GPL v2");
> 
> So, is this just a typo in the SPDX-License-Identifier or do you really
> intend to license this file under GPL-1.0 only?

yes, this was totally unintended typo from my side, Just sent a patch to 
fix this!

thanks,
srini
