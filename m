Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1CD1A38F9
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Apr 2020 19:35:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1DA281670;
	Thu,  9 Apr 2020 19:34:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1DA281670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586453714;
	bh=DXYjomrc/f5bEEPEFQgzhXexRrc97dUampv4VzpUuGg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r657UfPyyyLlEJ7//FxjCVsiM8Qo2P2NUWfeT4jDFwKnGB1DyJTKVkm4U/PA2tc4U
	 TB0KEmzIZpquTcl4Ld2mHxuH819Jd+dYsTe99U8b1HKH1AQB7uj88S+fXeOoCDsT2g
	 b7t8kL6VvtFPpqvNhy3NTcmDd+z0T3zsWAV8MLC4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2ABBCF801DA;
	Thu,  9 Apr 2020 19:33:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 094F7F801D8; Thu,  9 Apr 2020 19:33:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 294EDF800CB
 for <alsa-devel@alsa-project.org>; Thu,  9 Apr 2020 19:33:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 294EDF800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="i33YDFJb"
Received: by mail-lj1-x241.google.com with SMTP id h25so512468lja.10
 for <alsa-devel@alsa-project.org>; Thu, 09 Apr 2020 10:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=w6oua6pgdDdSLqZ3ElhE13JK0x2D0ixah/qXhh6Ol1s=;
 b=i33YDFJbxAY1klyUDrn2OSxE4UVt9CzORk36sK2BG/j0PsNrBCtaMIKE+7iaPewQJt
 PB4k7YFlnp7LTU0Rl9P9t+XEqXnQOuOK3m0fcKC7UBGcPKwDOD2KC7fYfGqZrpQqiLVH
 4P4KUpeLgqtjuHbmkH1Kol4U6zu3/EtBcC+1xPcqiPY7gAU5/trfH4HZPStaH44Q8Ocj
 YEDus66YJHWajYVDdHMSFW9zbAIi2/Ih9Q/AfLeqB6LGr/sWvSfOxRmv0X6c+6qh/n6u
 Lt6BEuRkvBkEuU51VvtT34BKIta0ENM9TVh1jIjqxGeuypqu1VvVIaS6iPU0pIOy2M2U
 Es3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=w6oua6pgdDdSLqZ3ElhE13JK0x2D0ixah/qXhh6Ol1s=;
 b=UxdnKD8WLF58ImFZ2Vrr9/8VomefsL/zV1VDsWpgDZ1jn/Sh/7/5PZsqN7NZjukjlR
 DcO889DpeChtYa3HCGAWPHPgPenBC8P2Mmo3ADx1QgVYeJeVKdoPqEDILCKaygiTBgHk
 iGkr4ZeXueAgWnBLxubMJn58O78K4SzOiLGUIN+IJ9yF3FRJoJkBqBzWTBom7nZ1lsTC
 unQkAkmx1fvJJveZfEfyrgUSDOHB4bslfT4F8CvKY/+WMLvPhuYBzgDw7JY0AS6V5XoI
 W83cZuY4RhzvDQ2txHT54f6Z8H2yl1N1/V6DvjRXH4nEGXCdaXGCklCshTEtYI/Fgbt/
 szww==
X-Gm-Message-State: AGi0PuawfDyjqPQT41vO93SXfXbDZgrHFvgs495xr/r7zxZiuLEOdC+0
 vTh9tRw5CYZFjY0ZU+2jG0o=
X-Google-Smtp-Source: APiQypIFKzX2orBYpj3ZpvYChLybojahKGx4VgxULoLxhE1PIkc77vnIGEr1STj82ZoZhDpkUZ+Vhg==
X-Received: by 2002:a2e:9757:: with SMTP id f23mr513176ljj.269.1586453606298; 
 Thu, 09 Apr 2020 10:33:26 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru.
 [91.78.208.152])
 by smtp.googlemail.com with ESMTPSA id y25sm10535877lfy.59.2020.04.09.10.33.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Apr 2020 10:33:25 -0700 (PDT)
Subject: Re: [PATCH v1 0/2] Support headset on Tegra boards that use WM8903
To: Mark Brown <broonie@kernel.org>
References: <20200330204011.18465-1-digetx@gmail.com>
 <5c9c995a-a571-e543-e680-30739cb1561c@gmail.com>
 <848cc6c5-e8e4-2796-3ee1-3e12a3e92c54@wwwdotorg.org>
 <a7159a8e-4987-0c08-ce3a-fa82d926218e@gmail.com>
 <20200409172952.GG5399@sirena.org.uk>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <0a82ccac-7a4c-ca0c-9a88-3a77c7bc24e6@gmail.com>
Date: Thu, 9 Apr 2020 20:33:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200409172952.GG5399@sirena.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Stephen Warren <swarren@wwwdotorg.org>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>,
 linux-tegra@vger.kernel.org
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

09.04.2020 20:29, Mark Brown пишет:
> On Thu, Apr 09, 2020 at 08:13:54PM +0300, Dmitry Osipenko wrote:
> 
>> The code change doesn't affect any of the old users, so it should be
>> safe anyways.
> 
>> I understand that you don't feel comfortable to give an ACK if you're
>> unsure, but I assume that Jon is in the same position, and thus, I'm not
>> sure how to move forward.
> 
>> Mark, could you please help with reviewing this series?
> 
> It is currently the merge window.  Nothing other than bug fixes is going
> to get applied until the merge window is over, probably Sunday or Monday.
> 

Will be awesome, thank you :)
