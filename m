Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF1D39A1BA
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Jun 2021 15:00:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7799170B;
	Thu,  3 Jun 2021 14:59:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7799170B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622725215;
	bh=gvcb2SXhgr+UunqPA/nY7tn6VD7g8lj08swHUsCbfpE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cowU2Ty81BZkwsovbcl/z1iUvVR/eMyAiSwIsoQV6KW6Xcj94lqv1tXT9QpIYdDuD
	 kd6e1bsxfuJqxAM3SBu82L+qQRtMh9ST5YjEMDnbJoTREHRf4PiUINsXyPGDOkGIit
	 FQRK87dIdN+IPLehnwwTNSFchMV6NIe2HnEBFSXM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E077F800E5;
	Thu,  3 Jun 2021 14:58:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29261F80254; Thu,  3 Jun 2021 14:58:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 07A85F800E5
 for <alsa-devel@alsa-project.org>; Thu,  3 Jun 2021 14:58:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07A85F800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="aDfm993C"
Received: by mail-ed1-x52e.google.com with SMTP id o5so7013069edc.5
 for <alsa-devel@alsa-project.org>; Thu, 03 Jun 2021 05:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=S32qhgXw6lhcBac72fW5aifr88ZTXgBqkSLyW4FBSRE=;
 b=aDfm993CvwBzKEU6AMF3NjjBBTCq3pYbIDf+HDoVgTqBJ5UrcUk/OuIlcxTYXL1loC
 TjdpT6ASpEN6RgFQTG5jrJggb5OUNheVMZjleXGXQtwdLmJqtFEwdg8WS8cSTDfM27vX
 rdDT/0PJl6TnTWvPQQsH7JX16wXJ6a8pqDJz9VyrS8fHhtVOMi4NzxF4ai/Wm2wr1UYJ
 JQilApDLYXx2/ePzQix7V+ngwWD9t3pUvHIamB20DG+ZMMmN5ce3+AwsGDGPRlJ0ZJQr
 xCTgCsTDQCFIrHZX3gbGw8v+QC5otgxdnbsD17u27A7ZinB+VpB8g++j3n+WllPD6acs
 WaDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=S32qhgXw6lhcBac72fW5aifr88ZTXgBqkSLyW4FBSRE=;
 b=ngx4IAdE+KhgKD+aptJQvVWctXGfVnAUAOz9fLN4R39XhWEUoUsSj1tDctb+03e2R5
 8r0+oXqSE6CPLZpp4IeCMzT4rr4qJ6cTbgwX0aFzT5E7LBkEU17AMSIjWVQbDseL5vM1
 BjPWNhIrXynKrUE3YUa5yNzm7DLeu6fkrBAt8iidASGokQHiUuogGX97EUn7inq3D8H7
 VYbf1hJhlZ6S5C0Zk3J6SZ4QCa/VL5e5LcFenXL7W6y3eO2CfvpqCJBixpcNXJnoGzDR
 ljpKQRcL0/qd7qqx/vsMQwQmYAI/2sfLuEk1FgHUEDQeioA04krbRcI/h/Mrpg1oiTPi
 8zWw==
X-Gm-Message-State: AOAM532Ec4ZSwwVkIlNLt8gP3G1RWB16lkf7QzlKM4o/YLdqpntG29ya
 0NlMGbK8FX8GYsO2e7PE3hTvIQ==
X-Google-Smtp-Source: ABdhPJzmI3KvAOVc3eQ2Z1TXrXwjtBqFKOhH08L/qt7QjcYkxgy6UMrK5D0Kj9lBamgyA8IQJBPzrw==
X-Received: by 2002:aa7:dc12:: with SMTP id b18mr43396617edu.52.1622725116707; 
 Thu, 03 Jun 2021 05:58:36 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id ho32sm1423106ejc.82.2021.06.03.05.58.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 03 Jun 2021 05:58:36 -0700 (PDT)
Subject: Re: [PATCH v2 2/4] ASoC: codecs: wcd: add multi button Headset
 detection support
To: Mark Brown <broonie@kernel.org>
References: <20210524110700.27077-1-srinivas.kandagatla@linaro.org>
 <20210524110700.27077-3-srinivas.kandagatla@linaro.org>
 <20210603124455.GE4257@sirena.org.uk>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <676a583f-1bed-f837-3013-ffec7bfd36e1@linaro.org>
Date: Thu, 3 Jun 2021 13:58:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20210603124455.GE4257@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com
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



On 03/06/2021 13:44, Mark Brown wrote:
> On Mon, May 24, 2021 at 12:06:58PM +0100, Srinivas Kandagatla wrote:
> 
>> +		break;
>> +	default:
>> +		break;
>> +	}
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL(wcd_mbhc_event_notify);
> 
> Why is this not EXPORT_SYMBOL_GPL?  Same for the other symbols that are
> exported, between ASoC and regmap I'm not clear that there's anything
> useful that is usable from non-GPL code...

This was not intentional, will fix this in next version.
> 
>> +	/* Report insertion */
>> +	if (jack_type == SND_JACK_HEADPHONE)
>> +		mbhc->current_plug = MBHC_PLUG_TYPE_HEADPHONE;
>> +	else if (jack_type == SND_JACK_HEADSET) {
>> +		mbhc->current_plug = MBHC_PLUG_TYPE_HEADSET;
>> +		mbhc->jiffies_atreport = jiffies;
>> +	} else if (jack_type == SND_JACK_LINEOUT)
>> +		mbhc->current_plug = MBHC_PLUG_TYPE_HIGH_HPH;
> 
> This would be more idiomatically written as a switch statement.

I agree, I did try to keep it mostly in switch case, looks like I missed 
this one. Will change this in next spin.

--srini
> 
