Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BB018EB94
	for <lists+alsa-devel@lfdr.de>; Sun, 22 Mar 2020 19:33:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 546FF1614;
	Sun, 22 Mar 2020 19:32:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 546FF1614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584902004;
	bh=YJ+tALKEht2uunHs8AtqrOEBjw5ggc9I57xizYAtVao=;
	h=References:From:To:Subject:In-reply-to:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LL2dcvfC0yPQbqTYse+ijTOq2JuDblPcGEaIiHiRSSEc5kkq/HFShTcNNwHjs8C0/
	 OC8BcdecNCeMfg8frMwhed0PrAKHrHUUeK7bNfYN2hSvzi0lQDI3cdSwh7bJ0l5gcY
	 JOyOkFnfTi44OPMta2/x+B5oxEC3epIP9kHhnqM4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25C72F800F6;
	Sun, 22 Mar 2020 19:31:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC9A9F801F8; Sun, 22 Mar 2020 19:31:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1588CF800F6
 for <alsa-devel@alsa-project.org>; Sun, 22 Mar 2020 19:31:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1588CF800F6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="i9/EM43p"
Received: by mail-wr1-x443.google.com with SMTP id p10so1604654wrt.6
 for <alsa-devel@alsa-project.org>; Sun, 22 Mar 2020 11:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=t345tliBlqINDa8PSXt4lv98Z6uPV9ApDsTwoyUh4K8=;
 b=i9/EM43pwbkPODkA43IfFBziz7mD/e2iF6QmH9MXMkV9EccK1pkaR3rkTuF8/B8fI7
 4Z+8vCAC/lxmreMsVBxcXHtkQ9nDEPc49qfT9K2JQY2ad7+kBpmT5zUEWR+uF0t//LPC
 8AhdL3pPEdMamUDWdUXITgMN3Kpky5dMfJZvQTsEnkWoszljOc5ILpGVgBirodYJ9l+c
 uU9HINVEpKOEBNXi4PYSkyex0Yo70OrXvUFy4UhVMXU7WiWG/KgfsHEo9jhtREw26K3n
 oLY8u9EJG854eFvPSh/uvdoQKzyg9kgriDehTs5l9MhzrLrteW1u1wzrONNFlpBjPT6a
 /j8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=t345tliBlqINDa8PSXt4lv98Z6uPV9ApDsTwoyUh4K8=;
 b=h+8ZPjBRihuHmkXslZhZ7O3nAredX41ykRIvfpFe1htVET4nryX6ynimLRKjSSTd2i
 D0rqs6BNc45P4tmjvkVdmo6mGfBWOBHyRHKZL48UI8EM3WPkGiVH7oVId/lL5iJzcnOh
 IhbzyiGe2hzV73QUqL9fP4I1BLHLMCjsZrkIrGbTjTkJU5jbJOgwvoofE+USETFNMO97
 4YBZZGa+CCqY/JV+GXqbCWHA7SRkEzwiFcPZfrp8WZoRuuR9RYmJDSVaRyPiSiLdHw8X
 d6zDWvEnvB84lBxRfrNB3bry+2cB7MSGiOXmYZSXfppAUt3IoC5kXwMo6UUrXUDI0ukQ
 T25A==
X-Gm-Message-State: ANhLgQ30HkLFBUdMahC9lOMjqIjPJO61L8Y5JwxeP/cjhn3/HimqWjf7
 6EOZiJOXLxRkPT9ThxXwGAYP0Q==
X-Google-Smtp-Source: ADFU+vtYl2tirhzygQLImaRvVxGsLaQ7qwRGlxRLIFaQgG6POo2NZlaxl4e7Zub8wnLdztr8JVbVyw==
X-Received: by 2002:adf:b31d:: with SMTP id j29mr10790210wrd.218.1584901893310; 
 Sun, 22 Mar 2020 11:31:33 -0700 (PDT)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id s1sm19915958wrp.41.2020.03.22.11.31.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Mar 2020 11:31:32 -0700 (PDT)
References: <20200316023411.1263-1-sashal@kernel.org>
 <20200316023411.1263-8-sashal@kernel.org>
 <1ja74gg0v8.fsf@starbuckisacylon.baylibre.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH AUTOSEL 5.4 08/35] ASoC: meson: g12a: add tohdmitx reset
In-reply-to: <1ja74gg0v8.fsf@starbuckisacylon.baylibre.com>
Date: Sun, 22 Mar 2020 19:31:31 +0100
Message-ID: <1jsgi0ckcc.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-amlogic@lists.infradead.org, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Kevin Hilman <khilman@baylibre.com>
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


On Mon 16 Mar 2020 at 09:28, Jerome Brunet <jbrunet@baylibre.com> wrote:

> On Mon 16 Mar 2020 at 03:33, Sasha Levin <sashal@kernel.org> wrote:
>
>> From: Jerome Brunet <jbrunet@baylibre.com>
>>
>> [ Upstream commit 22946f37557e27697aabc8e4f62642bfe4a17fd8 ]
>>
>> Reset the g12a hdmi codec glue on probe. This ensure a sane startup state.
>>
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> Link: https://lore.kernel.org/r/20200221121146.1498427-1-jbrunet@baylibre.com
>> Signed-off-by: Mark Brown <broonie@kernel.org>
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>
> Hi Sasha,
>
> The tohdmitx reset property is not in the amlogic g12a DT in v5.4.
> Backporting this patch on v5.4 would break the hdmi sound, and probably
> the related sound card since the reset is not optional.
>
> Could you please drop this from v5.4 stable ?

Hi Sasha,

I just received a notification that this patch has been applied to 5.4
stable.

As explained above, it will cause a regression.
Could you please drop it from v5.4 stable ?

Thanks
Jerome

> It is ok to keep it for v5.5.
>
> Thanks
> Jerome
>
>> ---
>>  sound/soc/meson/g12a-tohdmitx.c | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/sound/soc/meson/g12a-tohdmitx.c b/sound/soc/meson/g12a-tohdmitx.c
>> index 9cfbd343a00c8..8a0db28a6a406 100644
>> --- a/sound/soc/meson/g12a-tohdmitx.c
>> +++ b/sound/soc/meson/g12a-tohdmitx.c
>> @@ -8,6 +8,7 @@
>>  #include <linux/module.h>
>>  #include <sound/pcm_params.h>
>>  #include <linux/regmap.h>
>> +#include <linux/reset.h>
>>  #include <sound/soc.h>
>>  #include <sound/soc-dai.h>
>>  
>> @@ -378,6 +379,11 @@ static int g12a_tohdmitx_probe(struct platform_device *pdev)
>>  	struct device *dev = &pdev->dev;
>>  	void __iomem *regs;
>>  	struct regmap *map;
>> +	int ret;
>> +
>> +	ret = device_reset(dev);
>> +	if (ret)
>> +		return ret;
>>  
>>  	regs = devm_platform_ioremap_resource(pdev, 0);
>>  	if (IS_ERR(regs))

