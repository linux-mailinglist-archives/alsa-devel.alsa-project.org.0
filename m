Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 952302FF1BE
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jan 2021 18:24:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02C7A18FF;
	Thu, 21 Jan 2021 18:24:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02C7A18FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611249897;
	bh=p+dPT8B85BJBWXsftx/eCRuWpt4zuygg+vXO3p1n4ak=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BIsD8+1ekvSQ9PmYrQzx3ud4Rs8gbNdk5r3NVCz8Tu12H0UFAwWXNFubO06Knpqxv
	 TZQxbi8AFvbBU1WqtBqcwfRTeOLjTIQlTWJRTDJbV3LZ+AdGlOwnLb+y08jVNUCz4L
	 Re+jOdtAT+oFkmFSIDRwfjIpZ6mFOais0OLR28BQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40094F8026A;
	Thu, 21 Jan 2021 18:23:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F31D3F80257; Thu, 21 Jan 2021 18:23:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D790F80162
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 18:23:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D790F80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="iq7gVo/2"
Received: by mail-wr1-x432.google.com with SMTP id m4so2518148wrx.9
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 09:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jrQ117e9rKdRX0ggNjZWyvNJf7Q2Kd1ZAAwvvs88o4k=;
 b=iq7gVo/2cAaYIqYQJzx28kvPUq73Rw/nAppQC219L/Bmt00/uixnyV96uaYqkcckIz
 wVMD7SkbKz4/YrsZS6ahohiHfFEzvK7jhr2oITBAiicAjnpEI8B+Tsfxq92beaqALsaB
 SWhiCC942ofZXDabA5nNZlbHvyteuybUiwb3RoVvEZKz6h99KP7FhcXbnQdsEv7cEnsQ
 4/1I2DOiXGO1ctT2CgwD2+vmh86Yy6OrvLivvbEirAMgObCTMtk4zCQIu9GGlpaW2r+x
 hisxfBEofvgcceOTEX3xO+RlO0YxJOI23Ek9FiAL58ZIIMe0GUyV9796y39lgCTZisoQ
 Yfdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jrQ117e9rKdRX0ggNjZWyvNJf7Q2Kd1ZAAwvvs88o4k=;
 b=Y/irVQ/dLwZHOMs34plJg+eiI70JvoaV/wgiBqKJCt6KdL2EdONOckUBBU9XJEz5uR
 ZShqWE8L8vxcDYmZeyV96xqKEiRbTwmrnYx5v3Aku1t8j3Am50s7AFRS5vJE7kN4RUUf
 gKVoc7ugg6zy7VbJ4QlACRZCtLvRjykvYqx7eLchPQJqcZs9g0C7Tm+/NqJDdt01Mt7g
 e3jueVTKfQVUFntwHPtTUIHvX5m3ila1Ft/VRjbuT2BiBz3XUhYqTU7512l9vFE/4ySN
 +azTVR8ZVXU/+IbEDV2CTEk4gosxEraERyWiBq4HM8fi76sg3KjhMAmeO7HhTSb/u98/
 8bHA==
X-Gm-Message-State: AOAM530U7ue2DIYZO2TbVr8u1BGyFXwYf+n53ul6JH7Hc5uk+0hd3di9
 I8v1lfsyh+bTu+pNDlW6t2DhhQ==
X-Google-Smtp-Source: ABdhPJzmpWKgxYOZNlDSS3ZCFf6nw/9Ar/frrAx9xmYIIlhoRyyCK4qnpFdKAMe+eBXYENSH8CaTiA==
X-Received: by 2002:adf:dc89:: with SMTP id r9mr531623wrj.52.1611249797530;
 Thu, 21 Jan 2021 09:23:17 -0800 (PST)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id r126sm9110206wma.48.2021.01.21.09.23.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 21 Jan 2021 09:23:16 -0800 (PST)
Subject: Re: [PATCH] soundwire: debugfs: use controller id instead of link_id
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Vinod Koul <vkoul@kernel.org>
References: <20210115162559.20869-1-srinivas.kandagatla@linaro.org>
 <20210119145220.GS2771@vkoul-mobl>
 <45300dc3-00b0-497b-804e-f7f1e857f32a@linux.intel.com>
 <57d5f1bd-50fa-30ab-03c0-260460e45d61@linaro.org>
 <6d4d4a6b-f28c-81db-4e67-2b5b94116fa4@linux.intel.com>
 <1fad2388-27d0-7014-818d-1272fa70ed9b@linaro.org>
 <33fe8455-01b4-f867-4974-a3e867c930f0@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <feee8676-33fe-7929-8b6c-6abe3a09159a@linaro.org>
Date: Thu, 21 Jan 2021 17:23:15 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <33fe8455-01b4-f867-4974-a3e867c930f0@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: gregkh@linuxfoundation.org, alsa-devel@alsa-project.org,
 yung-chuan.liao@linux.intel.com, linux-kernel@vger.kernel.org,
 sanyog.r.kale@intel.com
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



On 21/01/2021 15:12, Pierre-Louis Bossart wrote:
> 
> 
> On 1/21/21 6:03 AM, Srinivas Kandagatla wrote:
>>
>>
>> On 19/01/2021 19:09, Pierre-Louis Bossart wrote:
>>>
>>>> currently we have
>>>> /sys/kernel/debug/soundwire/master-*
>>>>
>>>> Are you suggesting that we have something like this:
>>>>
>>>> /sys/kernel/debug/soundwire/xyz-controller/master-<LINK-ID> ??
>>>
>>> Yes this is what I was thinking about.
>>
>> Vinod/Pierre,
>>
>> One Question here,
>>
>> Why is link_id part of "struct sdw_bus", should it not be part of 
>> "struct sdw_master_device " ?
>>
>> Given that "There is one Link per each Master"
> 
> it's true that link == master == bus at the concept level.
> 
> but we have an existing code base with different structures and we can't 
> break too many things at once.
> 
> In the existing flow, the 'bus' is created and setup first, the 
> sdw_bus_master_add() routine takes a 'bus' argument, and the link_id is 
> already set. This routine only creates a device and in the rest of the 
> code we keep using the 'bus' pointer, so there's no real short-term 
> scope for moving the information into the 'sdw_master_device' structure 
> - that would be a lot of surgery when nothing is really broken.

I totally agree!

If I understand it correctly in Intel case there will be only one Link 
ID per bus.


Does this change look good to you?

---------------->cut<---------------

diff --git a/drivers/soundwire/debugfs.c b/drivers/soundwire/debugfs.c
index b6cad0d59b7b..f22868614f09 100644
--- a/drivers/soundwire/debugfs.c
+++ b/drivers/soundwire/debugfs.c
@@ -19,13 +19,14 @@ void sdw_bus_debugfs_init(struct sdw_bus *bus)
                 return;

         /* create the debugfs master-N */
+       bus->controller_debugfs = debugfs_create_dir(dev_name(bus->dev), 
sdw_debugfs_root);
         snprintf(name, sizeof(name), "master-%d", bus->link_id);
-       bus->debugfs = debugfs_create_dir(name, sdw_debugfs_root);
+       bus->debugfs = debugfs_create_dir(name, bus->controller_debugfs);
  }

  void sdw_bus_debugfs_exit(struct sdw_bus *bus)
  {
-       debugfs_remove_recursive(bus->debugfs);
+       debugfs_remove_recursive(bus->controller_debugfs);
  }

  #define RD_BUF (3 * PAGE_SIZE)
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index b198f471bea8..242bde30d8bd 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -877,6 +877,7 @@ struct sdw_bus {
         struct sdw_master_prop prop;
         struct list_head m_rt_list;
  #ifdef CONFIG_DEBUG_FS
+       struct dentry *controller_debugfs;
         struct dentry *debugfs;
  #endif
         struct sdw_defer defer_msg;

---------------->cut<---------------

With this change I get something like this on my board:

~# find /sys/kernel/debug/soundwire/
/sys/kernel/debug/soundwire/
/sys/kernel/debug/soundwire/sdw-master-2
/sys/kernel/debug/soundwire/sdw-master-2/master-0
/sys/kernel/debug/soundwire/sdw-master-2/master-0/sdw:0:217:2110:0:4
/sys/kernel/debug/soundwire/sdw-master-2/master-0/sdw:0:217:2110:0:4/registers
/sys/kernel/debug/soundwire/sdw-master-2/master-0/sdw:0:217:2110:0:3
/sys/kernel/debug/soundwire/sdw-master-2/master-0/sdw:0:217:2110:0:3/registers
/sys/kernel/debug/soundwire/sdw-master-1
/sys/kernel/debug/soundwire/sdw-master-1/master-0
/sys/kernel/debug/soundwire/sdw-master-1/master-0/sdw:0:217:10d:0:3
/sys/kernel/debug/soundwire/sdw-master-1/master-0/sdw:0:217:10d:0:3/registers
/sys/kernel/debug/soundwire/sdw-master-0
/sys/kernel/debug/soundwire/sdw-master-0/master-0
/sys/kernel/debug/soundwire/sdw-master-0/master-0/sdw:0:217:10d:0:4
/sys/kernel/debug/soundwire/sdw-master-0/master-0/sdw:0:217:10d:0:4/registers



Thanks,
srini
