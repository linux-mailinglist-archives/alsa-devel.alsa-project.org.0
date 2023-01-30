Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C6F680C0D
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Jan 2023 12:33:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 316EADF4;
	Mon, 30 Jan 2023 12:32:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 316EADF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675078398;
	bh=JiMBbPMMdi6zKz45CXPL4XOHYUF7TMMq08+9fA/IcRg=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=TQYsvANb60kbcVuJhNy6AXx6EhmDKKIkvxKTm64hM2R4VeD9T23WrVeizNH+1BnxC
	 yQnVpWxoI3plsrnTEPZmQXAnXk0Wvsp0U0eqz/3Ragcnl2aSt9U0aed/91BGdQiAlb
	 NwSZchO8V+Q9JkzxDeQqr7rAkak+BPyMEmqnshTE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D9BBF8007C;
	Mon, 30 Jan 2023 12:32:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B845AF80236; Mon, 30 Jan 2023 12:32:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 HTML_MESSAGE,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C513F800A7
 for <alsa-devel@alsa-project.org>; Mon, 30 Jan 2023 12:32:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C513F800A7
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=mY7qIjBs
Received: by mail-pl1-x630.google.com with SMTP id d3so11242367plr.10
 for <alsa-devel@alsa-project.org>; Mon, 30 Jan 2023 03:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:from:references:cc:to:content-language:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nNqwaHoyDJ6oIABjnw374JO+nZ/hjHyOL9XFjyaSxKk=;
 b=mY7qIjBs8r1DuAYy1v0/svKeZzQoyE8iszvCNLuibg8uM6Y6C8pOHFsW0iZx9osL5U
 G0SdA57wgNbr6yKld4Pi376NpeD24u/3iqwZHzOoUPicZzKOHCkpBiIempp9VTqRGnAE
 sTF+vVngJgmCeChIFU/HewZGUcYzbB3CRoSkMP4X2SIlE6kiFt1t3AAOUmNM3mSLiISC
 cBV2E5QNctfJ46tWhPJKcblUWkAl3/53xWY+Dn3fGcYdm/dcvI+6YTBaWPSTlJBbnb2C
 68/AUTVD/rZC0w2ttJm5xDO0zfTCfpzIftbcGF7Uoo21Jq8GQhL9gxfsfw7/Lv5frDpV
 vRwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:from:references:cc:to:content-language:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=nNqwaHoyDJ6oIABjnw374JO+nZ/hjHyOL9XFjyaSxKk=;
 b=0dtuXb38M7hSK5bv2RL9QjpxL/7ZENctzds9j8XPyhEHz38pkdm69xfkMBwaM0SX73
 ySI9CedGJ9cS8qaQMI/4/LM/Oy3FvU+NFJIrMs+da8frykCkOSgZpqSxAnLpWKIDpoig
 hKhWxpd43BziUlAYKlvuSVd7b4WnUW2t1qBJXR7LUyXgQ8copcNe+prl/blk5Ea6lesg
 YcsCXg4bSQc3E6XTYjfSLHyCeg0C6z450ViSbtWw2t3UK6RiXb+HJbe8zhStd4tzsdFU
 C9+cObKWGREIaDeWGUArq+D7cGPbBi49XbsZP3XF88ay139Is70bkxc161BusNOJ2ZnN
 I0kw==
X-Gm-Message-State: AO0yUKXrV/h3Gg6KYSGKz8XL8oB9n+7a6Xl4UqNSmppY05E7M1B01c1k
 ovYzcuNROhNSlyN11FoW6fg=
X-Google-Smtp-Source: AK7set8EQJRfl+tjYSrhoSGwRO1r4Hyk5VGR/A24ClthMF0QXXC1Kk3RAZ0nKKkldcxRZkLtehYf1A==
X-Received: by 2002:a17:90b:4c46:b0:22c:b2bf:e462 with SMTP id
 np6-20020a17090b4c4600b0022cb2bfe462mr2206432pjb.34.1675078325124; 
 Mon, 30 Jan 2023 03:32:05 -0800 (PST)
Received: from [172.20.10.4] (42-72-249-34.emome-ip.hinet.net. [42.72.249.34])
 by smtp.gmail.com with ESMTPSA id
 n19-20020a637213000000b0044ed37dbca8sm6677285pgc.2.2023.01.30.03.32.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jan 2023 03:32:04 -0800 (PST)
Message-ID: <76e2e7a4-a9c6-1291-9995-beddd13f2e4d@gmail.com>
Date: Mon, 30 Jan 2023 19:32:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.0.3
Subject: Re: [PATCH] ASoC: nau8821: Implement DRC controls
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Seven Lee <wtli@nuvoton.com>
References: <20230110031622.459686-1-wtli@nuvoton.com>
 <Y71eG0VgAkntqH0I@sirena.org.uk>
From: LeeWeiTse <scott6986@gmail.com>
In-Reply-To: <Y71eG0VgAkntqH0I@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
Cc: alsa-devel@alsa-project.org, SJLIN0@nuvoton.com, KCHSU0@nuvoton.com,
 lgirdwood@gmail.com, YHCHuang@nuvoton.com, CTLIN0@nuvoton.com,
 dardar923@gmail.com, supercraig0719@gmail.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


Mark Brown 寫道:
> On Tue, Jan 10, 2023 at 11:16:22AM +0800, Seven Lee wrote:
>> This patch is support dynamic range compression controls.
>>
>> Signed-off-by: Seven Lee<wtli@nuvoton.com>
> This still isn't applying for me, for example on my for-6.3 branch:
>
> Applying: ASoC: nau8821: Implement DRC controls
> Using index info to reconstruct a base tree...
> error: patch failed: sound/soc/codecs/nau8821.c:322
> error: sound/soc/codecs/nau8821.c: patch does not apply
> error: patch failed: sound/soc/codecs/nau8821.h:350
> error: sound/soc/codecs/nau8821.h: patch does not apply
> error: Did you hand edit your patch?
> It does not apply to blobs recorded in its index.
> Patch failed at 0002 ASoC: nau8821: Implement DRC controls
>
> Are you sure you don't have any other changes in your tree?

Sorry, this is my company mail server setup for network security.
I will send the patch again by my Gmail, thanks.
