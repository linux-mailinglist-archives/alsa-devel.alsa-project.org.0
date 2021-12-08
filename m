Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A99F246DE01
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Dec 2021 23:07:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36596271D;
	Wed,  8 Dec 2021 23:07:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36596271D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639001274;
	bh=5BzRC5BA99luQgZqSykkqvpjaCtII4cNWKEOAxFjCvY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RiqCku826aqIDxGUcaTZ92n4XmPcsWnrZMrjVhXHm2rmRmVzXC3fC6Xq+TnjBooKS
	 M+u7m6Ez3xx+0OVMpXVJBfm/e/2MgFgPDzs1n6LLkH8Oyfxn/UjJm98xkgtxAPYLoU
	 xdDBKXouiopT24E2qJ3KLq6S19IYZTdx4mmIWH/k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F473F804EC;
	Wed,  8 Dec 2021 23:06:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8988F804E5; Wed,  8 Dec 2021 23:06:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9940CF80103
 for <alsa-devel@alsa-project.org>; Wed,  8 Dec 2021 23:06:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9940CF80103
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="MWbxU3nA"
Received: by mail-il1-x132.google.com with SMTP id m5so3528065ilh.11
 for <alsa-devel@alsa-project.org>; Wed, 08 Dec 2021 14:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Qgjw9+9lL3xAImaF5HZygUwNAxWz9liV5VfwAbG8uCY=;
 b=MWbxU3nAgs6ZlUx4tYXOELJZcOwF2SnWET+yXIKrCX65kEZtmOSyQCnLEYUeilNT7m
 ZEXecdERmWP6pyDmPOb3hgpWXSz5afwXSa9MVG4Om1rw5BDjcDQfq4RVxK3PGrIV3mXb
 IaZfTdk2CgX3Ollv/iXsuxUH4lcOsI9bYKuqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Qgjw9+9lL3xAImaF5HZygUwNAxWz9liV5VfwAbG8uCY=;
 b=emkPmvuRT82uQzZGClP1Ca6T14g1n+4nfeqlWZIvtbKdnTSLLv2tjcJ2v4B5+xTw9o
 aH+cHUQ5a3H8ky/XHcUQkCFiQmREYZzShXviSJ3sfBJ8tnWm+DSGgrKXR7ihzGj37sgs
 89c30W0+jwqAHLNi4GM3d+uED157lQnVfG/+wczQQKn2uQ9Smffaxgl5uynk73gP1ffI
 /wgMDeI1RwOIqTp7VBCdkS8eSLba2ADkhvPh8UShT1iiCfdjl40b+f7/ApU3C3gg+JAA
 lOBuZIhx2G8Mc9ZyrnOBa3mx5xheDMrhwlTaToEUs6DlVzA6CM+LgZlW7wsf2kXI6bGE
 Q85Q==
X-Gm-Message-State: AOAM5306t2PulQ9CgJAYaclGgVrsh/z+glwulAJ8VJIldEslDXwYvDei
 GgbHGB9ADaUnyO/lyOTw9RGslg==
X-Google-Smtp-Source: ABdhPJy54p0dG794taCZs5Slo3XmDWJqbp6em0OEz64G9t5tSEJdZS44LKPnAN2BvXgvhGjK9JtqNw==
X-Received: by 2002:a05:6e02:1090:: with SMTP id
 r16mr10336398ilj.208.1639001191140; 
 Wed, 08 Dec 2021 14:06:31 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id r18sm2417986ilh.59.2021.12.08.14.06.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Dec 2021 14:06:30 -0800 (PST)
Subject: Re: [PATCH v3 3/3] kselftest: alsa: Use private alsa-lib
 configuration in mixer test
To: Mark Brown <broonie@kernel.org>
References: <20211208211745.533603-1-broonie@kernel.org>
 <20211208211745.533603-4-broonie@kernel.org>
 <b76dd5e0-56ba-79f4-21c2-ac5455d7fd65@linuxfoundation.org>
 <YbEnPzSO0HKHd8uX@sirena.org.uk>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <806397d0-894a-0f86-bf73-30deb3d3c0d5@linuxfoundation.org>
Date: Wed, 8 Dec 2021 15:06:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YbEnPzSO0HKHd8uX@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kselftest@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>,
 Shuah Khan <shuah@kernel.org>
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

On 12/8/21 2:44 PM, Mark Brown wrote:
> On Wed, Dec 08, 2021 at 02:27:34PM -0700, Shuah Khan wrote:
> 
>>>    		}
>>>    	}
>>> +
>>> +	snd_config_delete(config);
>>>    }
>>>    /*
> 
>> This open comment at the end of the patch looks odd. Does this compile?
> 
> Yes, it's the start of the comment describing the next function, more
> complete context is:
> 
> 		}
> 
> 		snd_config_delete(config);
> 	}
> 
> 	/*
> 	 * Check that we can read the default value and it is valid. Write
> 	 * tests use the read value to restore the default.
> 	 */
> 	void test_ctl_get_value(struct ctl_data *ctl)
> 	{
> 

Yes my bad :)

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
