Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E287032776C
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Mar 2021 07:16:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CA82166B;
	Mon,  1 Mar 2021 07:16:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CA82166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614579417;
	bh=TWC8fLuP0mOC2AzXMPbA3XgEP+LNl1VODKsGLVo64xI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ew/GoQ/4/7I33WqBRJ+W+8dKzRoSg/tu6Qd7Yo7efeGcbyHTvyPntVHNjr7GOhc/F
	 giUUjZjje+wdJuZYX9xlw+/r0/rmmCgeG71B20zD7vb97FL/65FgK8xGzEVv5hFFHs
	 iFdEegVXWawTO9Ic7uo0LltimH19Vxq9+y1SfgCA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5989F8026A;
	Mon,  1 Mar 2021 07:15:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 878BAF8025E; Mon,  1 Mar 2021 07:15:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3336AF8010B
 for <alsa-devel@alsa-project.org>; Mon,  1 Mar 2021 07:15:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3336AF8010B
Received: from [123.112.65.122] (helo=[192.168.0.106])
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <hui.wang@canonical.com>)
 id 1lGbps-0006GU-3z; Mon, 01 Mar 2021 06:15:16 +0000
Subject: Re: [PATCH v2] ALSA: hda/hdmi: let new platforms assign the pcm slot
 dynamically
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
References: <20210225102028.41769-1-hui.wang@canonical.com>
 <alpine.DEB.2.22.394.2102261954260.864696@eliteleevi.tm.intel.com>
From: Hui Wang <hui.wang@canonical.com>
Message-ID: <a39de6ee-4336-1daa-55c6-ff5ba955e325@canonical.com>
Date: Mon, 1 Mar 2021 14:14:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2102261954260.864696@eliteleevi.tm.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
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


On 2/27/21 2:14 AM, Kai Vehmanen wrote:
> Hi,
>
> thanks! I tested this on a few machines and seems good, no functional
> issues.
>
> On Thu, 25 Feb 2021, Hui Wang wrote:
>
>> --- a/sound/pci/hda/patch_hdmi.c
>> +++ b/sound/pci/hda/patch_hdmi.c
>> @@ -157,6 +157,7 @@ struct hdmi_spec {
>>   
>>   	bool dyn_pin_out;
>>   	bool dyn_pcm_assign;
>> +	bool no_fixed_assign;
> hmm, I wonder if we could come up with a better name. "dyn_pcm_assign"
> and "no_fixed_assign" seem a bit at odds.
>
> How about:
>     bool dyn_pcm_assign;
> +  bool dyn_pcm_no_legacy;
>
> Then it's more clear this is still the same dynamic PCM assign policy, but
> we just drop the legacy exception.

OK, will change to it.

Thanks.

> Takashi, do you think we can go with this without any method (a module
> option) to opt-out?
>
> I'm ok to go with this, given all users should be using kcontrol status to
> select the PCM for HDMI/DP output. Any other method is not guaranteed
> anyways to work in all cases as the assignment is dynamic in the end..
>
> Br, Kai
