Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A179F481532
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Dec 2021 17:43:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D670174F;
	Wed, 29 Dec 2021 17:42:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D670174F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640796196;
	bh=Jy44pQhoh1SsdFj54HgE1uR5Y+iMGbuMqhjF2WeWB7s=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jYJ5LA6fQX9/CxCjwtSWbiOMXFm25fDKs5+eW2KXkDO9ZUArQDLD+kgHZJwuqAaFp
	 tKrPA/Tp52d8pitOI95NlyNyw8QqNo81fn+n6HWXDlyNoUyWxOYp6NrM01LqTwreky
	 PzqCiakjiplbLyK0CcyofKpHAX9ZZOg1xgMdPIMc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8490CF80224;
	Wed, 29 Dec 2021 17:42:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0EEAEF801EC; Wed, 29 Dec 2021 17:42:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, NICE_REPLY_A, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A57BEF800D3
 for <alsa-devel@alsa-project.org>; Wed, 29 Dec 2021 17:42:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A57BEF800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="N7L/ompp"
Received: by mail-pj1-x1029.google.com with SMTP id
 f18-20020a17090aa79200b001ad9cb23022so20413737pjq.4
 for <alsa-devel@alsa-project.org>; Wed, 29 Dec 2021 08:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=O2pbmS818arXigvBH3gLZ+98cJUFjjjLwuoZwBCC54M=;
 b=N7L/omppPMV1C0ehMzFhzNPNeqZA3VP/LFeXG2fzUnpA7oT+fQ5eHCVLFYLxB4kx4G
 5SidwXOxubPiDh7BsEHiytCsZfgbPBCrNIHVbBmvCyLlYeQVhSFz68wOiIKs95zmNMWK
 4ckShIPdJiKLQURmfcPITh+FoBrcGvGd0ItAscVNTuNG6KJf1ca+mNIZ8ngGG9wc6HQ0
 bXa5qVLrCeKWjle5tMbigdgU04SL9vczQA3sXr8FcSASgZUaIEBLx2TZ+KjfokX/vO3G
 ymzBwUYDi1NmlNiXUrQbUqnLWDwxmazyJD8sRKQyQTb+FXy5nu1AQfVE0FUvihzEMuNU
 XSbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=O2pbmS818arXigvBH3gLZ+98cJUFjjjLwuoZwBCC54M=;
 b=yPxf0Q73xrFoF8mcaUtHeb0XeQLL5kjM/EgkQqyz3iZ1aksnxxqLD7Du4M+V/QE6VB
 oLv1xW5rir50unJ7/9J3P759PYKIWPCWIJHJW2M9TOdXYtWoK4jlvFImzslPzw5fvEz+
 3JvNTZzJ0qDqoJA+HvbhRu4J9g72W9GFHHDnzb1rrYGxVnWlRrvEO6Id4+IdBESnycWi
 e65AsLRLSMFeKJ+0XoI2ovGPOfKJ5m0dBGi+4re/7/o57TPV39JF81k7alx2St8Zdt3V
 zPCDGRwDmDsuBHtgrXtqLeigK7o4xGspOwm03qLDPFH+TH6xQpPicBvzSWhl5EAEyeV0
 VlHg==
X-Gm-Message-State: AOAM532BMMFSQvuS42Hn8wJfTSxDh5icX/3OIyfC4bSXDErocZLH1/hW
 uWhoBfN+293CkM0+Afsq1Pw=
X-Google-Smtp-Source: ABdhPJzR4LfeXTTm9rQzzjk9apUOFDuZ8ZDYkGLT2rBEW4l51w8K06POiEJOQ3cgVmgta0tUZxVizg==
X-Received: by 2002:a17:902:a408:b0:149:9055:98b1 with SMTP id
 p8-20020a170902a40800b00149905598b1mr9422261plq.2.1640796116250; 
 Wed, 29 Dec 2021 08:41:56 -0800 (PST)
Received: from [10.230.2.158] ([192.19.161.250])
 by smtp.gmail.com with ESMTPSA id 145sm20757066pgd.0.2021.12.29.08.41.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Dec 2021 08:41:55 -0800 (PST)
Message-ID: <abefdc9b-bf5f-3ec9-4d14-172f525d962f@gmail.com>
Date: Wed, 29 Dec 2021 08:41:54 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] mips: bcm63xx: add support for clk_set_parent()
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <20211229000553.32240-1-rdunlap@infradead.org>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20211229000553.32240-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Lars-Peter Clausen <lars@metafoo.de>,
 Russell King <linux@armlinux.org.uk>, Paul Cercueil <paul@crapouillou.net>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com, Jonathan Cameron <jic23@kernel.org>
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



On 12/28/2021 4:05 PM, Randy Dunlap wrote:
> The MIPS BMC63XX subarch does not provide/support clk_set_parent().
> This causes build errors in a few drivers, so add a simple implementation
> of that function so that callers of it will build without errors.
> 
> Fixes these build errors:
> 
> ERROR: modpost: "clk_set_parent" [sound/soc/jz4740/snd-soc-jz4740-i2s.ko] undefined!
> ERROR: modpost: "clk_set_parent" [sound/soc/atmel/snd-soc-atmel-i2s.ko] undefined!
> 
> Fixes: e7300d04bd08 ("MIPS: BCM63xx: Add support for the Broadcom BCM63xx family of SOCs." )
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>

Thanks!
-- 
Florian
