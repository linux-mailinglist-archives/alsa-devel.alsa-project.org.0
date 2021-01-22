Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A69CF3008FA
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jan 2021 17:48:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3179A1F54;
	Fri, 22 Jan 2021 17:47:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3179A1F54
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611334126;
	bh=cKtC2bAnc5N/gQiY7H2+4a6nJHpq/TFLqbt2qoYcmuk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QkRa/aYpjGDGWKTg3u/QYpY9cgQfYzp0FiSTdV5bZs6a8vuEpVlal0DDLN3sshosN
	 hc1SVJpfeP+sPyaS0tZH4a0wWW8Ws6H2X7C42MLyB8ItW29IgFYVIMDv2x8KgaDW+O
	 sZZBmrStlLRAp2qg+NZqQZjWaPCCfBOTrPi3H0hE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE3D1F80290;
	Fri, 22 Jan 2021 17:42:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB530F80253; Fri, 22 Jan 2021 17:42:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B7EDF8015B
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 17:42:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B7EDF8015B
IronPort-SDR: 9ns6BnJ1AMqzkrVRdMWOinMU9Xczkp+L/Kga+z7YR76hglyw0X54fe3SfKoTyG9n2fHRs4Bpzs
 w1kljuEyxfKg==
X-IronPort-AV: E=McAfee;i="6000,8403,9872"; a="179551113"
X-IronPort-AV: E=Sophos;i="5.79,367,1602572400"; d="scan'208";a="179551113"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2021 08:42:38 -0800
IronPort-SDR: eyKTjn9B1POkjG9aA8K5ifo9qU5aNWzoFmJyMj5AAdRvlSYZ0Cl5tGgaow9HKO+peCX4rVHvHT
 32gigo3asZMA==
X-IronPort-AV: E=Sophos;i="5.79,367,1602572400"; d="scan'208";a="428027764"
Received: from cdgarci1-mobl1.amr.corp.intel.com (HELO [10.212.60.15])
 ([10.212.60.15])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2021 08:42:37 -0800
Subject: Re: [RFC PATCH 1/2] soundwire: add support for static port mapping
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, vkoul@kernel.org,
 yung-chuan.liao@linux.intel.com
References: <20210120180110.8357-1-srinivas.kandagatla@linaro.org>
 <20210120180110.8357-2-srinivas.kandagatla@linaro.org>
 <fcc1b199-644d-8c7f-5e8b-d12b0d9c9a04@linux.intel.com>
 <0a2bbbe5-821a-34dd-e893-fef42baaad2b@linaro.org>
 <9a688b02-80a6-fb1f-d6fa-36ba2d88d3b9@linux.intel.com>
 <c6278763-57d9-2631-7b43-829259a9ea1f@linaro.org>
 <3ee60ad9-9635-649e-ba67-d40a96b25256@linux.intel.com>
 <487c91f9-f6ea-75c2-9150-52db2de42a3a@linaro.org>
 <eaf13d70-86fe-3e18-7a5a-4043f2d8a22d@linux.intel.com>
 <aaf34f07-5eed-3045-e4c6-dc9416689b20@linaro.org>
 <f960757f-ec8b-6d3f-f00e-27242c687926@linux.intel.com>
 <e962caa8-89c3-4a22-5932-4498c406e8f8@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <adb91730-35db-db7a-75b3-4771723de945@linux.intel.com>
Date: Fri, 22 Jan 2021 10:42:36 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e962caa8-89c3-4a22-5932-4498c406e8f8@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: gregkh@linuxfoundation.org, sanyog.r.kale@intel.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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


>> No, what I was saying is that you need to define multiple streams e.g.
>> - headset capture (configured with or without click suppression)
>> - mic capture (configured with AMICs or DMICs)
>> - playback (or possibly different endpoint specific streams depending 
>> on whether concurrency between endpoint is possible)
>>
>> if you change the configuration, you have to tear down the stream and 
>> reconfigure it - and for this we already have the required API and you 
>> can guarantee that the configuration for that stream is consistent 
>> between master and slave(s).
> 
> Yes, we make sure that new configuration is only applied before the 
> stream is started, and not in middle of already started stream.

ok, we are almost in agreement but...

>>> All am saying is that codec can decide which ports it has to select 
>>> based on mixer setting before the stream is setup/started. This 
>>> updated mapping between slv port and master ports is passed as part 
>>> of the port_config in sdw_stream_add_slave().
>>
>> if you completely remove the stream and re-add it with updated 
>> configuration things should work.
> 
> That's exactly what we do currently!
> 
> The updated ports due to new configuration ex: for "mic capture" dailink 
> needs to be communicated from slave(codec) to master so that it can 
> allocate correct ports. That is what this patch is trying to do (share 
> current port map information).

.. we have a disconnect on how to do this configuration update.

The 'stream' support was designed so that a stream can be split across 
multiple devices (both masters and slaves). With this design we need to 
have a central configuration and distribute the information to all 
devices taking part of the stream.

It seems you are in a different solution-space, where the codec driver 
needs to notify the master of which ports it needs to use?

I also don't see where the mapping is actually set. Patch 2 uses a 
mapping but there's no codec driver change that defines the mapping?

Do you actually call sdw_stream_add_slave() with a new mapping?

It feels we are missing the codec part to really see what you are trying 
to do?

