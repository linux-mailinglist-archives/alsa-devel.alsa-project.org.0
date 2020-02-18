Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DF4162372
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Feb 2020 10:34:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 811F01670;
	Tue, 18 Feb 2020 10:33:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 811F01670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582018475;
	bh=RyPcxs0bOitOXiDKwyUbOQD7BpAGyRhf+FwZ8Vh7gF0=;
	h=References:From:To:Subject:In-reply-to:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hFYwK7YNHbh3ChiQVl0vwsIT0NO2JR+DxEUfH/JbUI/Sg283+wcWcA6KiatPoT4MI
	 vYG3PMyBlTSrqKY2wf26SLh55lssjJgCEPXw1uHiX0kSoPojyqzS6ffIIxmTbazuLY
	 4RM25gGJ91csxj4eYAfVivUV/5EVQIw2d8ix2nBA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E130F8014A;
	Tue, 18 Feb 2020 10:32:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C3EBF80148; Tue, 18 Feb 2020 10:32:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58DC5F800C4
 for <alsa-devel@alsa-project.org>; Tue, 18 Feb 2020 10:32:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58DC5F800C4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="VTaMuOJv"
Received: by mail-wm1-x343.google.com with SMTP id g1so2004325wmh.4
 for <alsa-devel@alsa-project.org>; Tue, 18 Feb 2020 01:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=5Vu5NREMqZNgn/ugbyRfT/sUu90ARmdAjTNhjJow4ng=;
 b=VTaMuOJvmVCVZGf1e9CGkyUz0S7jnNLCV/LN8dgXGfFMuX4otjCtJEleDAkB7PKZ8o
 finjLiRZn9hxUlDm5FFUzNrUqi5yMCiAIiE3kgiOhaMxk1Wxm95lDMK3z7G/5cA3e+oC
 5tmZTCUDAQITGFsC0xMfCZxzU/LqxSN7r1HyZgmlAJb3sartwnrRAfr5I4MXHIuO6noq
 3pm+SVBsJdPEFJjLePstjpAErRzCtPbQbNgwb2Us2U735qsUQzMZQY6h7b5CFezJMa2s
 RbSYFS4nwDvDaQY8mUkapbLA+9QXUaxNH/M4xrdZrgOpewi+H95lc3Svb9hC9XQD9SXN
 Pt5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=5Vu5NREMqZNgn/ugbyRfT/sUu90ARmdAjTNhjJow4ng=;
 b=MLsb6WUeeXLTR4jt125CYBmVoPhskd9qo5tNEjHVVXV7suEmekyoJ7vQOK+XFnsfT9
 /5SOBRIRNQUmYPeIOy5Up9XkTeZvJBvnSzn9soy+HHPyL0JFTHBQCBLN0wjMdtnoD+lf
 yyyVRbsmXuxgLg14atLqy2nITaPa5uCcbXO/HfkmpxtFnbEejpC3xOl2+KNmwu3M2rRW
 lr5jH/kOEanl3kS/F77wh+pd/vv0bRCFmUWbv82aG5H79prGE72MHYuzjW6vkpq4rU1B
 wWGcJKTZCx2593tRI52fsLzd4ouDakeP7AMoiKv6uiHcXa8UHz9Nabn6RQQXbNcbrN80
 nr+A==
X-Gm-Message-State: APjAAAXvnM4e8gj37udxx0YEknEqIVxSJ8B+W43r6zU7cYITtCvlEYm1
 2+YvhPYUVh9NOV3qyDbjsI5fmg==
X-Google-Smtp-Source: APXvYqwA4p4xTRLmc1PHQhlRYoA9irCDEUh5d1GD4hj2Qv/UyOsb4cp+cyo8BLIu2TaPKadjOksZpw==
X-Received: by 2002:a1c:1fc5:: with SMTP id f188mr2117144wmf.55.1582018367152; 
 Tue, 18 Feb 2020 01:32:47 -0800 (PST)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id y1sm5239049wrq.16.2020.02.18.01.32.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 01:32:46 -0800 (PST)
References: <20557448-d6d2-7584-e2ac-c46d337e1778@samsung.com>
 <CGME20200217180640eucas1p220a8a33489d01a860821370060953153@eucas1p2.samsung.com>
 <20200217180626.593909-1-jbrunet@baylibre.com>
 <e70bb7a5-21b0-0e71-871e-2c02b35f86ea@samsung.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Mark Brown <broonie@kernel.org>
Subject: Re: [RFT/DONTMERGE] ASoC: devm_snd_soc_register_component fixup
In-reply-to: <e70bb7a5-21b0-0e71-871e-2c02b35f86ea@samsung.com>
Date: Tue, 18 Feb 2020 10:32:45 +0100
Message-ID: <1jblpw5jgi.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>,
 linux-kernel@vger.kernel.org
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


On Tue 18 Feb 2020 at 07:47, Marek Szyprowski <m.szyprowski@samsung.com> wrote:

> Hi Jerome,
>
> On 17.02.2020 19:06, Jerome Brunet wrote:
>> Hi Marek, would you mind trying the following patch. It should target the
>> component removal intead of removing them all. I'd like to comfirm this is
>> your problem before pushing in this direction. Thanks
>>
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>
> It helps a bit. There is no warning from sysfs, but vc4-drm is still not 
> registered properly:
>
> raspberrypi-firmware soc:firmware: Attached to firmware from 2019-07-09 
> 14:40
> raspberrypi-clk raspberrypi-clk: CPU frequency range: min 600000000, max 
> 1200000000
> vc4_hdmi 3f902000.hdmi: ASoC: CODEC DAI vc4-hdmi-hifi not registered
> vc4_hdmi 3f902000.hdmi: Could not register sound card: -517
> vc4-drm soc:gpu: failed to bind 3f902000.hdmi (ops vc4_hdmi_ops): -517
> vc4-drm soc:gpu: master bind failed: -517

It explains why the original patch of this thread triggered the issue.

The problem is at drivers/gpu/drm/vc4/vc4-hdmi.c:1108
The driver derives the component name directly from the device name and
assume all 3 components have the same name.

This is not ideal:
* We seen that debugfs was already warning about the name collision
* ASoC should be allowed to set the name

With this patch, the component name of the 2nd and 3rd component changed
but the name claimed by the card driver remain unchanged which is why the
card probe defers.

This particular issue can probably be solved with lookup of the
component name instead of a direct derivation. I'll check.

>
>> ---
>>   include/sound/soc.h                   |  1 +
>>   sound/soc/soc-core.c                  |  8 +++++++
>>   sound/soc/soc-devres.c                | 32 ++++++++++++++++++---------
>>   sound/soc/soc-generic-dmaengine-pcm.c |  2 +-
>>   4 files changed, 31 insertions(+), 12 deletions(-)
>>
>> diff --git a/include/sound/soc.h b/include/sound/soc.h
>> index f0e4f36f83bf..e5bfe2609110 100644
>> --- a/include/sound/soc.h
>> +++ b/include/sound/soc.h
>> @@ -442,6 +442,7 @@ int snd_soc_add_component(struct device *dev,
>>   		const struct snd_soc_component_driver *component_driver,
>>   		struct snd_soc_dai_driver *dai_drv,
>>   		int num_dai);
>> +void snd_soc_del_component(struct snd_soc_component *component);
>>   int snd_soc_register_component(struct device *dev,
>>   			 const struct snd_soc_component_driver *component_driver,
>>   			 struct snd_soc_dai_driver *dai_drv, int num_dai);
>> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
>> index 6a58a8f6e3c4..bf6a64fbfa52 100644
>> --- a/sound/soc/soc-core.c
>> +++ b/sound/soc/soc-core.c
>> @@ -2599,6 +2599,14 @@ static void snd_soc_del_component_unlocked(struct snd_soc_component *component)
>>   	list_del(&component->list);
>>   }
>>   
>> +void snd_soc_del_component(struct snd_soc_component *component)
>> +{
>> +	mutex_lock(&client_mutex);
>> +	snd_soc_del_component_unlocked(component);
>> +	mutex_unlock(&client_mutex);
>> +}
>> +EXPORT_SYMBOL_GPL(snd_soc_del_component);
>> +
>>   int snd_soc_add_component(struct device *dev,
>>   			struct snd_soc_component *component,
>>   			const struct snd_soc_component_driver *component_driver,
>> diff --git a/sound/soc/soc-devres.c b/sound/soc/soc-devres.c
>> index a9ea172a66a7..d5e9e2bed2ce 100644
>> --- a/sound/soc/soc-devres.c
>> +++ b/sound/soc/soc-devres.c
>> @@ -11,7 +11,7 @@
>>   
>>   static void devm_component_release(struct device *dev, void *res)
>>   {
>> -	snd_soc_unregister_component(*(struct device **)res);
>> +	snd_soc_del_component(*(struct snd_soc_component **)res);
>>   }
>>   
>>   /**
>> @@ -28,21 +28,31 @@ int devm_snd_soc_register_component(struct device *dev,
>>   			 const struct snd_soc_component_driver *cmpnt_drv,
>>   			 struct snd_soc_dai_driver *dai_drv, int num_dai)
>>   {
>> -	struct device **ptr;
>> -	int ret;
>> +	struct snd_soc_component *component;
>> +	struct snd_soc_component **ptr;
>> +	int ret = -ENOMEM;
>> +
>> +	component = devm_kzalloc(dev, sizeof(*component), GFP_KERNEL);
>> +	if (!component)
>> +		return -ENOMEM;
>>   
>>   	ptr = devres_alloc(devm_component_release, sizeof(*ptr), GFP_KERNEL);
>>   	if (!ptr)
>> -		return -ENOMEM;
>> +	        goto err_devres;
>>   
>> -	ret = snd_soc_register_component(dev, cmpnt_drv, dai_drv, num_dai);
>> -	if (ret == 0) {
>> -		*ptr = dev;
>> -		devres_add(dev, ptr);
>> -	} else {
>> -		devres_free(ptr);
>> -	}
>> +	ret = snd_soc_add_component(dev, component, cmpnt_drv, dai_drv,
>> +				    num_dai);
>> +	if (ret)
>> +		goto err_add;
>> +
>> +	*ptr = component;
>> +	devres_add(dev, ptr);
>> +	return 0;
>>   
>> +err_add:
>> +	devres_free(ptr);
>> +err_devres:
>> +	devm_kfree(dev, component);
>>   	return ret;
>>   }
>>   EXPORT_SYMBOL_GPL(devm_snd_soc_register_component);
>> diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
>> index 2cc25651661c..a33f21ce2d7a 100644
>> --- a/sound/soc/soc-generic-dmaengine-pcm.c
>> +++ b/sound/soc/soc-generic-dmaengine-pcm.c
>> @@ -474,7 +474,7 @@ void snd_dmaengine_pcm_unregister(struct device *dev)
>>   
>>   	pcm = soc_component_to_pcm(component);
>>   
>> -	snd_soc_unregister_component(dev);
>> +	snd_soc_del_component(component);
>>   	dmaengine_pcm_release_chan(pcm);
>>   	kfree(pcm);
>>   }
>
> Best regards

