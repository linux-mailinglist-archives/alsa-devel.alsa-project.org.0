Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8B05B4C61
	for <lists+alsa-devel@lfdr.de>; Sun, 11 Sep 2022 08:37:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9644116AE;
	Sun, 11 Sep 2022 08:37:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9644116AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662878271;
	bh=quZBqV1f0MVfaI6Q8HdCGQpEYYUcthXKReBldOeNjK4=;
	h=Date:From:Subject:To:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MoLfXwNFwDgFqdPszBg2UefCYf8lI2kR9XrI6qN7GmLOmo8hTpXmHpKX+mnuVnffh
	 9J+CYFZKJzNK2GS7nPlBbge01FNCvuARR4NradG4D5FLaJDU9pWaFBHSwq2waI3h3l
	 b3Z5C66siIqco0wA/JRtjfpSZ3/wchN5Hn/gilVs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF15AF80425;
	Sun, 11 Sep 2022 08:36:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4814DF80256; Sun, 11 Sep 2022 08:36:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1947F8011C
 for <alsa-devel@alsa-project.org>; Sun, 11 Sep 2022 08:36:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1947F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="HpVyDQSx"
Received: by mail-pj1-x1036.google.com with SMTP id o23so3914665pji.4
 for <alsa-devel@alsa-project.org>; Sat, 10 Sep 2022 23:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date;
 bh=rLoZPCz3iqj/otZpqJcV6DJvojjpGid7m4NE/GhnbPY=;
 b=HpVyDQSxgsmV1eBBTUhIdODmdXvEpYb9rx9Q7qy2CDjMRP/ZJ0+2vLsb3+pyUXnw/W
 rUTsvm+ni3bCEti33QBVNaaXchW5IAgISNmBEMgROIfmq6WAyXgPrKuxEg/dbsMPpmRC
 McqaNuCDqMpLC8e/5BO/rkEwhOb8UZHLx9stT6Lw1ge5ACFL/SvNkQRU/ByJOePPB8N+
 BuxhnlHHPff/2qlmFmmfo0OttPD0GxzpKBusQH1FtIa0eBtCYFE0OehbinKCAcmTwcbR
 gNAPZkkyLG+AS24m+FGPccDN/Zosnnf7G1oPNK5nZGySw7M1HeqIQHBekgtNc4Kn1vu9
 a0Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=rLoZPCz3iqj/otZpqJcV6DJvojjpGid7m4NE/GhnbPY=;
 b=IWKImkG26eeOTrRUZffWNkfqkHdPY5+0tudDMI+DfKSmnmLOe4WxoOrz74B10zZoRO
 q1VlYdEgfU1r4Yjr48jVM6rdVefZwgytoTUxBPPzan0vx/fIYLUGyxvDd6+ITRMoHrxW
 oECVkwFcNxpHx61VN9VHK4uZ0LOWG3DFtISz95KdvXe0DxDSJHKXe/dty6AOXM/zaNMl
 g3pl8pKbqaaPZ7FSQg/sQFgCWKmD37vqMNhi3E6Uor/OFZ/PA3Q37KtcV9nvRq9tFQAn
 M3KMcL0A74Vzs5dFMw+aSOSVaaVvzQn8Teo3cBxhIhZcOZORqVZn0FaK950Gfr3nTeHM
 hxbg==
X-Gm-Message-State: ACgBeo3GSLHrL0p9tbfk79v5e0xdqCD4134/YrtgrQpxQ9T8fv1o7z6/
 Fe84zxL4BPwHfvjm3g9oAcs=
X-Google-Smtp-Source: AA6agR6DD0403W1ObxUkdI0/nki3p+rM7v1/bwvxo/F1Py/Jx0Rkoc9WzvCe9af/hiCLdnl6nzoz3g==
X-Received: by 2002:a17:90b:17c5:b0:202:596d:6e40 with SMTP id
 me5-20020a17090b17c500b00202596d6e40mr18269436pjb.53.1662878201310; 
 Sat, 10 Sep 2022 23:36:41 -0700 (PDT)
Received: from [192.168.0.109] (118-231-217-35.adsl.fetnet.net.
 [118.231.217.35]) by smtp.gmail.com with ESMTPSA id
 w11-20020aa79a0b000000b005375a574846sm2713280pfj.125.2022.09.10.23.36.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 10 Sep 2022 23:36:41 -0700 (PDT)
Message-ID: <27c23d02-ab49-680b-a334-4b73da4c086d@gmail.com>
Date: Sun, 11 Sep 2022 14:33:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
From: David Lin <ctlin0.linux@gmail.com>
Subject: Re: [PATCH] ASoC: nau8825: Add ADCOUT IO drive strength control
To: Mark Brown <broonie@kernel.org>, David Lin <CTLIN0@nuvoton.com>
References: <20220907065126.406208-1-CTLIN0@nuvoton.com>
 <Yxh+seNpKW5lxhjp@sirena.org.uk>
Content-Language: en-US
In-Reply-To: <Yxh+seNpKW5lxhjp@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, WTLI@nuvoton.com, SJLIN0@nuvoton.com,
 KCHSU0@nuvoton.com, lgirdwood@gmail.com, YHCHuang@nuvoton.com
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

On 2022/9/7 下午 07:21, Mark Brown wrote:
> On Wed, Sep 07, 2022 at 02:51:27PM +0800, David Lin wrote:
>> Add a property to control the driving of ADCOUT.
>>
>> Signed-off-by: David Lin <CTLIN0@nuvoton.com>
>> ---
>>   Documentation/devicetree/bindings/sound/nau8825.txt | 2 ++
>>   sound/soc/codecs/nau8825.c                          | 6 ++++++
>>   sound/soc/codecs/nau8825.h                          | 3 +++
>>   3 files changed, 11 insertions(+)
> Binding and driver patches should normally be separate patches.
OK, I will separate them.
>> +  - nuvoton,adcout-drive-str: ADCOUT IO drive strength. 0 - normal, 1 - stronger.
> Why not just make this a boolean property rather than requiring values?
>
>> +	nau8825->adcout_ds = device_property_read_bool(dev, "nuvoton,adcout-drive-str");
> It looks like it's being parsed as a boolean.

It's my fault. I will correct it as description of boolean.

Besides, kernel bot catch a build error, I will also fix it.

