Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C933FB249
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Aug 2021 10:15:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A16A61719;
	Mon, 30 Aug 2021 10:14:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A16A61719
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630311316;
	bh=DmgQuc/TXpYWrHoUxMjW1HxU1IZB5J99jEbUgxTE8eY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pLEMVFQIkF5OAJCzYbeeTJgd3zBJLRCcioOqEDjRl3ACxe0K3hOlfAs4o/FRhnXVR
	 P+vzhRHO6w2NmuGRdkzzq4dkA+ovtYNcrjr9ylc68qok0Y2Vaon+Vjnt8Jk/3efAEw
	 Z8vUpFPztEg/3yP1Y9A/eo7DDEidYoTGlaUwQcB8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21B6EF80218;
	Mon, 30 Aug 2021 10:13:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2D69F80218; Mon, 30 Aug 2021 10:13:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DBF31F80171
 for <alsa-devel@alsa-project.org>; Mon, 30 Aug 2021 10:13:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBF31F80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="uEs3c3Xa"
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 8A9924079F
 for <alsa-devel@alsa-project.org>; Mon, 30 Aug 2021 08:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1630311226;
 bh=eSx3NUMPq83UK+z5+YBa3OObfzdkGkOX4S8bufFEz/Y=;
 h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=uEs3c3XaIrWd7WC+tPWJ45z5sYhMy6uLbBtZDqircY0A8aflGyqix0UpTy55CNbpj
 45aX2Ss+RfrlYxXgnNQbrZ1Kn0QFcD74PwEQ10iuFkhD7b8p131hd2pDTeYF42+n2r
 rZ4m3SCR+pn362X/UCMAyPOzTslhAWtLSkbu0WE64R9Dmk5JJPCZBherh2an5phK0+
 FJg4cEwsQ6cyI2bUpczr3/RIO+5LrHvcTjPYYB2ZeHuBS8NikYUFA9/zWeyqQ/Eii9
 Ym6wl+FmlHwKQuksD39x/M2nx1poWX8kqxR7ECN5kzGeMSUBpj/BRDlRqgoYRgqktj
 Q5lgI9kV8NGwQ==
Received: by mail-wm1-f71.google.com with SMTP id
 r4-20020a1c4404000000b002e728beb9fbso9721368wma.9
 for <alsa-devel@alsa-project.org>; Mon, 30 Aug 2021 01:13:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eSx3NUMPq83UK+z5+YBa3OObfzdkGkOX4S8bufFEz/Y=;
 b=ZlVuK0pe6rWjbVzC6InSHvqt54UHpOI2NWMZyXYidMrh+8HnRn+d5NdRdjzGZxFVuH
 CUQEfFAyV/RdXyoQHrmbs/CYJ9TDNKKqabbp8a1BT3/V3MrQxVkq+52WYVVwv2GdEPNN
 4bCvhPJXS96obPz4kb0n0qig9uU7EISTlzX96eqxbMDmUamVJjayf9JcecGNsSEdDa0B
 /R1QonlQ0oE5fEz6KPHHoD3eNzqxTLy7MCorPq/jXDXdgeEhffR+SwpVmYJBvCOr+Ts5
 kQGgVtX5vog3e/8ffPP0bsOgq0yR3bUDceQcErErk3A4p6QR/AFcMo7nAHGJ9mi65adu
 BvMA==
X-Gm-Message-State: AOAM531r/uNF/W3eSyWu1WGFVYRXRjtounHBPdmvrNOusXin8gb0VM2u
 8omx53g7ZDQiiJgkCOsdcEM21T7LgN+/osY20+PU/y+rNJya78Kuw9awyDRn609dTBVuCkzOuCi
 C3dbCMlbIYEcEIQx9TsCrC6PQSFjACcXZlHmNBKgt
X-Received: by 2002:a05:600c:428a:: with SMTP id
 v10mr31271907wmc.25.1630311223574; 
 Mon, 30 Aug 2021 01:13:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6olxhDfz1lLDwfzLkp8OUNUr1AoxOLKW23LNJzBGbO3TIlKX5j+QsdumWOsvWLwaJ3ofS5Q==
X-Received: by 2002:a05:600c:428a:: with SMTP id
 v10mr31271886wmc.25.1630311223430; 
 Mon, 30 Aug 2021 01:13:43 -0700 (PDT)
Received: from [192.168.3.211] ([79.98.112.211])
 by smtp.gmail.com with ESMTPSA id l1sm12582917wrb.15.2021.08.30.01.13.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 01:13:43 -0700 (PDT)
Subject: Re: [PATCH] ASoC: samsung: s3c24xx_simtec: fix spelling mistake
 "devicec" -> "device"
To: Colin King <colin.king@canonical.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org
References: <20210827185003.507006-1-colin.king@canonical.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <db203d28-5a90-401a-962a-aaebae5b6cb2@canonical.com>
Date: Mon, 30 Aug 2021 10:13:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210827185003.507006-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

On 27/08/2021 20:50, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in a dev_err error message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  sound/soc/samsung/s3c24xx_simtec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
