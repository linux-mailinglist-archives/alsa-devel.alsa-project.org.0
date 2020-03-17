Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0484D188475
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Mar 2020 13:45:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61D80183C;
	Tue, 17 Mar 2020 13:44:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61D80183C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584449103;
	bh=XU0HOJZA8XF+yb36iO2gO5oVtloqFB/nW7ctSug0G50=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZcFiEmBAqF0k5P+ZCsonsA5hQZpZsqE1bao01X+6BGXxJZ34n7e/ZYcu6mo170rwQ
	 Hq/qfMK3vvyeTnRFpLUztg8h53bD+3dTOhlTsiuQgr8TPuPe0NwEDRLWFSXeVYKxOh
	 f0QruUaXg7HfLFglqfbEW4irKGCFiyGL2hpgDt9o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 282AEF800C0;
	Tue, 17 Mar 2020 13:43:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B0B0F8022B; Tue, 17 Mar 2020 13:43:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3DCD9F800CD
 for <alsa-devel@alsa-project.org>; Tue, 17 Mar 2020 13:43:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DCD9F800CD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="SRNjU3Uj"
Received: by mail-wm1-x335.google.com with SMTP id a132so21275682wme.1
 for <alsa-devel@alsa-project.org>; Tue, 17 Mar 2020 05:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=O7+dx4u+Hruy3RY0YPcqfMJYfOQOVzar6fFmyL7+tXk=;
 b=SRNjU3UjPPU2JogOc3pawiJkNPK08TH4bpS78YDRyipn343c8eCRjVFArhAqN/UwRn
 vBf28ueQ2b6eOWQlnKEY5AwP93vzhEctKBTFNDK+NeRx9+3PQ+j7ld5mL2j38Sp2iTes
 jcw/gEljpgeAu6hKnZLoTmfTaMZaVwHHMQlFiaQvLqniz0O5We577uAioQofYQhsmN4P
 KzY53bj/GBfTUH5RrDltAT8+QoZlpHPL18D1CK3x8Qt11N/KgL+R1ZK0spQ1lwAtIVR+
 Inrr0fgIX+YfQmagoA0YbuQ555eAUMO90n4Ua+ibwfqy29Fup7TOmwwjrbWFBDem7rF5
 nQnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=O7+dx4u+Hruy3RY0YPcqfMJYfOQOVzar6fFmyL7+tXk=;
 b=F/qYI0A9bcfXXRP6ACkwpLTOJ2tcSxX4sCDYM5oiV7QVJocqaG69uOEMIELKBpEuZo
 oxVtrNwSdunzjIlv4zYGxa2dB3AB2Oiw91y3omaOZ12lKCLPoQOqiIrV7PnoFtE2Tzbp
 9kXTyTOYTwqWK41QL19jzmwUqSzKLJQd1aLFrQk8ElkfpPxiq6lJB8uq/etkK3gX92ab
 r5/BYD5m+FgKhmHKEjhwc6eW3XpxqCYGwOVFvdp5dB4wzPNeMFZW1whrYxFM+DdRy8hD
 546XYCyI6Vr/3YO2/QQCssqrin9AgaF+6PhZ/GvED8N9iOfLvc27q2ddglRrsc71ttWj
 cBYg==
X-Gm-Message-State: ANhLgQ1LqI8jsscwHKV0aLL0gJ70iUfVHb195uxB1K2PQwLaU93V/cc2
 yTRgX1uMNKGQvkRw/fT9H9HwQA==
X-Google-Smtp-Source: ADFU+vt/AaEOFL5fZe+X/ty23WjTiYTGHdmLhkv0hNuBk8EHyynzPFRjUWzteJ9xT1xDRbMjGxV9HA==
X-Received: by 2002:a1c:68d5:: with SMTP id d204mr5165851wmc.15.1584448992252; 
 Tue, 17 Mar 2020 05:43:12 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id k133sm3994585wma.11.2020.03.17.05.43.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 17 Mar 2020 05:43:11 -0700 (PDT)
Subject: Re: [PATCH] soundwire: stream: only change state if needed
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20200317105142.4998-1-pierre-louis.bossart@linux.intel.com>
 <6bc8412a-f6d9-64d1-2218-ca98cfdb31c0@linaro.org>
 <27a73cbd-9418-4488-5cb2-fb21f9fc9110@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <18a2cb7a-0e4c-e2f2-e3ca-99a8ae85469d@linaro.org>
Date: Tue, 17 Mar 2020 12:43:10 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <27a73cbd-9418-4488-5cb2-fb21f9fc9110@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, vkoul@kernel.org, broonie@kernel.org,
 jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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



On 17/03/2020 12:22, Pierre-Louis Bossart wrote:
> Hi Srinivas,
> 
>> This patch did not work for me as it is as wsa881x codec does prepare 
>> and enable in one function, which breaks some of the assumptions in 
>> this patch.
> 
> Ah yes, if two transitions happen in the same DAI callback that wouldn't 
> work indeed. We should probably add this restriction to the state 
> machine documentation, the suggested mapping from ASoC DAI states to 
> stream states did not account for compound cases.
> 
>> However with below change I could get it working without moving stream 
>> handling to machine driver.
> 
> The change below would be an error case for Intel, so it's probably 
> better if we go with your suggestion. You have a very specific state 
> handling due to your power amps and it's probably better to keep it 
> platform-specific.
> 
> Can you confirm though that this patch works fine if you move all the 
> stream transitions to the machine driver? That should be a no-op but 
> better make sure there's no misunderstanding.

yes, it works with this patch + moving wsa stream handing to machine driver.

--srini
> 
> Thanks
> -Pierre
