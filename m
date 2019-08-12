Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB8D89968
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Aug 2019 11:06:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BEC64166E;
	Mon, 12 Aug 2019 11:06:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BEC64166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565600816;
	bh=k73Z9iuYU5pnxZoiqhmNGkJOFNlAb6gFNo+1HWKPy1Q=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HhgEimoaSeboqXZw8w53yJ4CR0nfdG+sYxwjI9TKb6j3IOCasepvspNjctxN3ON9r
	 BkHZMa1gTLjJKDgjcg+Qg9OjQv1RNkkIhU0g2/WS6+IWNXnb7Kww7nNIGD91tvDYen
	 vmGL4EvR6fnJnCUa2oMrChutuCIPAsRa9j6F+OCE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1BAFF80213;
	Mon, 12 Aug 2019 11:05:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40A46F80213; Mon, 12 Aug 2019 11:05:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_14,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AADE9F8015B
 for <alsa-devel@alsa-project.org>; Mon, 12 Aug 2019 11:05:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AADE9F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="K2BFc4di"
Received: by mail-wm1-x342.google.com with SMTP id 207so11440145wma.1
 for <alsa-devel@alsa-project.org>; Mon, 12 Aug 2019 02:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AWJiL+7zg6Ima534bZuseIPwdWeNk9fdB/sixhxGumQ=;
 b=K2BFc4diF9MOIydBpGiljdW9VVNeZjGfd7Trdr70W1zmTCMm++cfT3I4Gs1DJf8Hq3
 62ci06FebJH+iG7T+nbdizfzyr5OfCrOPDvPxFEaumY09OdROikoGmdWal5qANtysrHj
 lOZxURyUC3Tgenf1MwcdW828jqGejbQAMrhSgRd8A06JVpaLH0ym7VZeHROEIFxIVyvI
 2YeU/Y1crAYUffJeliGjfHNo8pm+WQshMEogGKM5u9gkYrISTdt9S10iA3JQ1pS7kUVf
 rSn8UH7WzYItHdPpj4DJV7GXZDBZL6W8wg5JBlcx1m8ZdsJkRX49MofZm9FGVqSmGY1e
 /ktA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AWJiL+7zg6Ima534bZuseIPwdWeNk9fdB/sixhxGumQ=;
 b=CzHdD38qyhOnuOQkweU/KZXbXshe0OblW0Ul4IT2o+X0hvhVVfNKq9JTBP+oTwxfL8
 EP/bjm50XLslCGSWDNn8h/gfPCCZytbjRbLa5iEbly1llLWiBQQsZEWKTPmp/EVp5PVq
 5FI6vgzt+AVdvUlmJPVjog9EpykuONN2kFwQefXwppIfFzLONgT6yQUIs5KYrGp6hdGx
 +CoQFr9UelTiDPlZJbaZ/IDSvOoy0foVMrHKHKPepuNCOgpymMAkLTO5FW/m3rG/7XgO
 ztUmMlrZXuGOHlwsv2s8oFQs8NM1juMw596KrF3xk3SBWZJVY6aV/twNAIU4xp3a3bFK
 nAiw==
X-Gm-Message-State: APjAAAU9+wfAiGoFwbxQpNvOyIuBhC4OSjNbZt0lGaSGtU4UT+/Fs+48
 ItUF9mFzEOIXD/VvgbAffFYdLw==
X-Google-Smtp-Source: APXvYqx3TsRhS9G0jmEqnE5mj/Efoz83lMVWBRL4X5b8foKuB4AOhkC5BGzEj3PchftN1c/+c42EqQ==
X-Received: by 2002:a1c:7914:: with SMTP id l20mr2426303wme.130.1565600706659; 
 Mon, 12 Aug 2019 02:05:06 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id d69sm7205314wmd.4.2019.08.12.02.05.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 12 Aug 2019 02:05:06 -0700 (PDT)
To: kbuild test robot <lkp@intel.com>
References: <20190809133407.25918-5-srinivas.kandagatla@linaro.org>
 <201908121031.HBxXaLjU%lkp@intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <a89e6a52-35da-15bf-6561-c58cb3453178@linaro.org>
Date: Mon, 12 Aug 2019 10:05:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <201908121031.HBxXaLjU%lkp@intel.com>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, linux-kernel@vger.kernel.org, plai@codeaurora.org,
 pierre-louis.bossart@linux.intel.com, robh+dt@kernel.org, lgirdwood@gmail.com,
 vkoul@kernel.org, broonie@kernel.org, kbuild-all@01.org
Subject: Re: [alsa-devel] [PATCH v3 4/4] ASoC: codecs: add wsa881x amplifier
	support
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Thanks for reporting this,

On 12/08/2019 03:46, kbuild test robot wrote:
> Hi Srinivas,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on linus/master]
> [cannot apply to v5.3-rc4 next-20190809]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
> 
> url:    https://github.com/0day-ci/linux/commits/Srinivas-Kandagatla/ASoC-codecs-Add-WSA881x-Smart-Speaker-amplifier-support/20190812-080612
> config: m68k-allmodconfig (attached as .config)
> compiler: m68k-linux-gcc (GCC) 7.4.0
> reproduce:
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # save the attached .config to linux build tree
>          GCC_VERSION=7.4.0 make.cross ARCH=m68k
> 
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>>> ERROR: "sdw_unregister_driver" [sound/soc/codecs/snd-soc-wsa881x.ko] undefined!
>>> ERROR: "sdw_write" [sound/soc/codecs/snd-soc-wsa881x.ko] undefined!
>>> ERROR: "__sdw_register_driver" [sound/soc/codecs/snd-soc-wsa881x.ko] undefined!
>>> ERROR: "sdw_write" [drivers/base/regmap/regmap-sdw.ko] undefined!
>>> ERROR: "sdw_read" [drivers/base/regmap/regmap-sdw.ko] undefined!
> 


There are changes in SoundWire Kconfigs 
(https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/soundwire.git/commit/?h=fixes&id=8676b3ca4673517650fd509d7fa586aff87b3c28) 
which are not available in linux/master yet so this error!

Once this patch lands then below errors should disappear.


thanks,
srini
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
