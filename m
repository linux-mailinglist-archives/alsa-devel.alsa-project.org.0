Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D0F303FD5
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Jan 2021 15:13:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6614717A6;
	Tue, 26 Jan 2021 15:12:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6614717A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611670401;
	bh=vFmGhE1X/mQX857WwaXC2J2n7KyhqBxBIGJ9ADSK5Kc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZZ2t1fO9GuM9KjUn+pj5T+0fwGR8p4g9J6Yr0BTTe7HNYsHooLpShUn2WUMnbUEG2
	 yBGSfWd61b0ehyQicRIzO11pUyiYrmSKMucNZetxbggRSpNA3khesSH9/ABs7YENBT
	 LFkSdLk95Dhq2an6VmzXrvVNSkNGn53fiw9iG/SU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CCAFFF80108;
	Tue, 26 Jan 2021 15:11:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E35C2F8015B; Tue, 26 Jan 2021 15:11:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C09AF80108
 for <alsa-devel@alsa-project.org>; Tue, 26 Jan 2021 15:11:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C09AF80108
Received: from [123.112.69.135] (helo=[192.168.0.106])
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <hui.wang@canonical.com>)
 id 1l4P4I-0000Vp-6I; Tue, 26 Jan 2021 14:11:42 +0000
Subject: Re: [PATCH v8 1/1] alsa: jack: implement software jack injection via
 debugfs
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
References: <20210126074530.4450-1-hui.wang@canonical.com>
 <20210126074530.4450-2-hui.wang@canonical.com>
 <alpine.DEB.2.22.394.2101261338340.864696@eliteleevi.tm.intel.com>
From: Hui Wang <hui.wang@canonical.com>
Message-ID: <5b03573b-ed07-7e8a-8dcb-9ed2a35193d9@canonical.com>
Date: Tue, 26 Jan 2021 22:11:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2101261338340.864696@eliteleevi.tm.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Cc: tiwai@suse.de, alsa-devel@alsa-project.org
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


On 1/26/21 7:46 PM, Kai Vehmanen wrote:
> Hi,
>
> I gave this v8 series another review and did some actual testing with the
> patchset and looking good. Caching the hw status is a nice addition and
> the new underscore-replaced names look better than the early versions.
>
> Only some very minor comments to the code:
>
> On Tue, 26 Jan 2021, Hui Wang wrote:
>
>>   static void snd_jack_kctl_add(struct snd_jack *jack, struct snd_jack_kctl *jack_kctl)
>>   {
>> +	jack_kctl->jack = jack;
>>   	list_add_tail(&jack_kctl->list, &jack->kctl_list);
>> +	if (!strstr(jack_kctl->kctl->id.name, "Phantom"))
>> +		snd_jack_debugfs_add_inject_node(jack, jack_kctl);
>>   }
> This comparison is now done even if injection is disabled at build time.
> Maybe better to have this check on injection side? Or even not filter
> Phantom jacks at all and leave this for user-space to tackle?

So far there is no requirement to create injection interface for Phantom 
jacks, if users need Phantom jacks interface in future, we could add 
them then. Here I will move the comparison on injection side.

Thanks,

Hui.

>
> Br, Kai
