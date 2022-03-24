Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5A84E6190
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Mar 2022 11:13:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B499D17A3;
	Thu, 24 Mar 2022 11:13:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B499D17A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648116833;
	bh=xkAfLP1Sp1/YtsyKCLG0GnHCvWJKKoQ5COxAXBlg08Q=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HTq6YAavncdFuZH3XCiAWfckUO3VNw0jETTnxqrpo+p5GJj1IJPXUFvLydcPsaGFB
	 W48pbudKAVQUyOzCQQbT1RgWRHM67xwotTZIZCRrXJddoyxW07U5/weM4wK3/PKPOB
	 o6PVwfZBjc+78lpyQYfL8IokPDM8pgWmWJEyb9A0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18191F80115;
	Thu, 24 Mar 2022 11:12:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F29AF80165; Thu, 24 Mar 2022 11:12:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B67FF80115
 for <alsa-devel@alsa-project.org>; Thu, 24 Mar 2022 11:12:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B67FF80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="sm7QLThX"
Received: by mail-wr1-x42a.google.com with SMTP id b19so5854489wrh.11
 for <alsa-devel@alsa-project.org>; Thu, 24 Mar 2022 03:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=tOQR+WNAFByykc/KA2gwDNy9/V6HWPZkFMgLBjiNd90=;
 b=sm7QLThXviVRGAsVj14NYsetsIAoeg5k/XLrgCTc7HmIpcHeqCOX0D+rGQQBg8QeRs
 ZtF4ovdbW1sgzruv0i24OFWw0kYcRJD3C6sshJhUfF3Cstgo1G/6Yp5/TKOvaJlQGHe7
 q486ud3NwDxjLpD2ifG8GVhuxZ+FID6QuX3rTtHFfygFXhcvKZ/wlgmVPNcdwZOsgHZs
 f20/k+GAgfYyvsuQKAbASU5kv1aidneHuadgY/l4AfS+EfUqqdyO5eIA+bqfeffIP8zc
 YXEo2CLEZ699/f0D+Cy3VjMXSgIFlD5ydzqFtphKO/DgGLPNfVlR4OPjvHIzYF1lP7df
 +w7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tOQR+WNAFByykc/KA2gwDNy9/V6HWPZkFMgLBjiNd90=;
 b=6vWbvogamKDJtrZ3+Uh7uf1QRjD4nz3NphFMK+DzATCLDsBoX3Wn6YyYUcfBuC42Ji
 LycmvXRHRJkjuHxtq897pPZ0JiEVdP89yIW83OZYH2oS4bYEtcU9bV57pavsttaUKq3d
 SzfSk1fb/wHRrhw8WLw2IkNf9qO1Q278fpdKa6NS6gosn8SzC+piIrlD3faBtqlNtevk
 kV0jY9HZHvtdRo5Jt7YYjQDwHCpMRokArHm35df1IEGEuI+YTk+i7WCOag+7W7ndXuxn
 P+umdsRbmb9Z3YXEHQp5gPoem/8/viTvP513vA58lY6b4k3qZYoMGzixBeNTqmxinBrv
 vobw==
X-Gm-Message-State: AOAM530Z/COkhbsMkcen9Ie9NGXN8IugOdVjMre971QF//KK1aUpf8oC
 00Y/zwglIHUV2IVkM3aFz4Ta5+zKCApATQ==
X-Google-Smtp-Source: ABdhPJwn201rw4KN1anEnBpBCnc18BUtSKZI70d/XbA1qG4A72A+P1FeINj9zpFvqR5VUrEK08yDZQ==
X-Received: by 2002:a5d:4f01:0:b0:203:fb06:4c74 with SMTP id
 c1-20020a5d4f01000000b00203fb064c74mr3852907wru.374.1648116756529; 
 Thu, 24 Mar 2022 03:12:36 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id
 m3-20020a5d6243000000b001e33760776fsm2182122wrv.10.2022.03.24.03.12.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Mar 2022 03:12:36 -0700 (PDT)
Message-ID: <a611f9fc-8b80-0c28-1c75-545130d6329b@linaro.org>
Date: Thu, 24 Mar 2022 10:12:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Conceptual bug on SoundWire probe/remove?
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>
References: <d0559e97-c4a0-b817-428c-d3e305390270@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <d0559e97-c4a0-b817-428c-d3e305390270@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
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



On 23/03/2022 19:45, Pierre-Louis Bossart wrote:
> Hi,
> I could use feedback/guidance on a possible conceptual bug in the 
> SoundWire probe and bus handling.
> 
> When we probe a driver, the code does this:
> 
> static int sdw_drv_probe(struct device *dev)
> {
>      struct sdw_slave *slave = dev_to_sdw_dev(dev);
>      struct sdw_driver *drv = drv_to_sdw_driver(dev->driver);
>      const struct sdw_device_id *id;
>      const char *name;
>      int ret;
> 
>      /*
>       * fw description is mandatory to bind
>       */
>      if (!dev->fwnode)
>          return -ENODEV;
> 
>      if (!IS_ENABLED(CONFIG_ACPI) && !dev->of_node)
>          return -ENODEV;
> 
>      id = sdw_get_device_id(slave, drv);
>      if (!id)
>          return -ENODEV;
> 
>      slave->ops = drv->ops;

may be add try_module_get(dev->driver->owner) here, which should prevent 
the module from unloading in the first place.

--srini

> 
> The last line is the problematic one. If at some point, the user does an 
> rmmod and unbinds the SoundWire codec driver, the .remove will be called 
> and the 'drv' will no longer be valid, but we will still have a 
> reference to drv->ops and use that pointer in the bus code, e.g.
> 
>          /* Update the Slave driver */
>          if (slave_notify && slave->ops &&
>              slave->ops->interrupt_callback) {
>              slave_intr.sdca_cascade = sdca_cascade;
>              slave_intr.control_port = clear;
>              memcpy(slave_intr.port, &port_status,
>                     sizeof(slave_intr.port));
> 
>              slave->ops->interrupt_callback(slave,
> &slave_intr);
>          }
> 
> I noodled with a potential fix in
> https://github.com/thesofproject/linux/pull/3534/commits/82d64fb0fd39b532263f060a8ec86e47e9ab305b 
> 
> 
> where I force-reset this slave->ops pointer, but it is likely to be very 
> racy.
> 
> We probably need to avoid such references, or have a clean mechanism to 
> unbind, e.g. with all commands and interrupts stopped while the codec 
> driver .remove routine is handled.
> 
> Initial error reports at https://github.com/thesofproject/linux/issues/3531
> 
> Suggestions and comments welcome, thanks!
> -Pierre
