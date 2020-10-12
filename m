Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECB128AFD8
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Oct 2020 10:14:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02FD2167F;
	Mon, 12 Oct 2020 10:13:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02FD2167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602490462;
	bh=uIvM//zwBDG1d2kkOirLN7zJ6MD/TCVMJb9IdpTmzog=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SbVP0xe+F539FrpA4ZAGT/5l/kPdvHQ7vrfbJn9BgQ+hrAV+tqLsUzHVKGUa54GPv
	 8SjLRq4ZF/LqA3FCXhr0tleDNB2ZCR3YmfUGav1hWJiyMw/I88IgQoVBdVIhInRHUQ
	 p6ILnFRzx1B/6wpoWy5NMaYefbX3cxNcnDSiBwi8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74A62F8021D;
	Mon, 12 Oct 2020 10:12:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7328BF80217; Mon, 12 Oct 2020 10:12:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_135,RCVD_IN_MSPIKE_H4,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C81F4F800D8
 for <alsa-devel@alsa-project.org>; Mon, 12 Oct 2020 10:12:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C81F4F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="C67lLPKA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602490353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T5vWzjUr2UXWpERHYLcGQzynot/lOzdboXshiWnRWYU=;
 b=C67lLPKAXtIzShgfSRftItO/CxYlsVteeoJZyTCTRWcehuiUH2B/1kUemdbZ+Y/vcFfJ3d
 CeXiLMThhOQYA7LRVjno6BDxjTeCPg+i0gCSUtrspTTl++Ra/6kpiv+L6ONbf/r8wIbooG
 xPJOu+rDGr6CJ33ATU/8fCjVoveiaFY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-79-QIr-rgHGNHOhgNbLAkqfOA-1; Mon, 12 Oct 2020 04:12:29 -0400
X-MC-Unique: QIr-rgHGNHOhgNbLAkqfOA-1
Received: by mail-ej1-f70.google.com with SMTP id d13so6041287ejz.6
 for <alsa-devel@alsa-project.org>; Mon, 12 Oct 2020 01:12:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=T5vWzjUr2UXWpERHYLcGQzynot/lOzdboXshiWnRWYU=;
 b=PMwa353+TcN7Yze+3djuz2nXcNy5hAZSt05cf1JPScywu9flm82MIyWOowkGIGh0Ww
 Q3LU+M1YlFo8gnmhJzxg+TjeTD57+dM8cexxR0BjcVA+7m8bNyKOGJ2wNj6+Miteqmyn
 PrYiSK6MbvQYhFN4T3GwKUF3CkiUVMuRpy7bodK+I6w4kMViXHZ2CKLlDq6b4lVu83RE
 9QirMSrRkSIyUGHwNvjn5yYx44+wsTNFr7stQyShOWbLDhRtgFO+tDb3L7XnL7AZJ7UH
 6ppQEy7UUqiWV1KveZoER5W5yHAI1vJl2VR6nUo3pfp1MvMBov/jqiLS0rEbUW3y9CWk
 iS4w==
X-Gm-Message-State: AOAM533qKRB0TdwSNiVtnZco9M6XqH8TPv1ZzNXco/GB0xU+CEFSMpIV
 eBDvG/oekT3Xquy8Osh1laHu5jkHZ6pPunmIAKFPFd9VnLBYEmo06+/gKIUOJLYfENtXviK3Pap
 HujWJtQ/VsexfbxoKPYynxZ0=
X-Received: by 2002:a17:906:a51:: with SMTP id
 x17mr27911082ejf.137.1602490348344; 
 Mon, 12 Oct 2020 01:12:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCFsIlHmtstAZRWzIIqmCWxgwHRW/tiujgYZNN6Ogr91Nila//IX/hRU1bstP/5ap7ZhTSfw==
X-Received: by 2002:a17:906:a51:: with SMTP id
 x17mr27911060ejf.137.1602490348053; 
 Mon, 12 Oct 2020 01:12:28 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id l9sm4677351edn.75.2020.10.12.01.12.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2020 01:12:27 -0700 (PDT)
Subject: Re: [PATCH] ASoC: Intel: Do not load legacy SST driver on BYT when
 SND_SOC_SOF_BAYTRAIL is enabled
To: "Rojewski, Cezary" <cezary.rojewski@intel.com>
References: <20201011095346.49589-1-hdegoede@redhat.com>
 <b92b6b6d382048829a37ae803d4f9451@intel.com>
 <6fbc7ba0-646a-27b9-8879-e9f4045385fa@redhat.com>
 <972f16ace6e546ef8c5cd2d15784d89e@intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <fe7a71dc-9ee9-7c44-ea21-f4df5cc111b6@redhat.com>
Date: Mon, 12 Oct 2020 10:12:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <972f16ace6e546ef8c5cd2d15784d89e@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Hi Czarek,

On 10/12/20 9:58 AM, Rojewski, Cezary wrote:
> On 2020-10-12 9:42 AM, Hans de Goede wrote:
>> Hi,
>>
>> On 10/12/20 9:24 AM, Rojewski, Cezary wrote:
> 
> ...
> 
>>>
>>> Hello,
>>>
>>> Series:
>>> [PATCH v2 00/13] ASoC: Intel: Remove obsolete solutions and components
>>> https://lore.kernel.org/alsa-devel/20201006064907.16277-1-cezary.rojewski@intel.com/
>>>
>>>
>>> removes sst-acpi component along with many others so further changes to
>>> said component will only cause conflicts -or- require commit reordering.
>>> I'd advice against that.
>>
>> As I already mentioned in the private-thread which Pierre-Louis started
>> with me, Jaroslav Kysela and Liam about this I would advice against
>> applying
>> that series for now. First we need to put in more work to make sure that
>> the new drivers are actually ready.
>>
>> Also I must say that I'm quite disappointed that since I, as the person
>> who more or less single handedly have made sure that audio works properly o
>> Bay Trail and Cherry Traul devices (*), has not been Cc-ed on that series,
>> that seems like a huge oversight.
>>
>> Anyways I will reply in the thread of the series and ask Mark to revert
>> the entire series. Since IMHO the new drivers are clearly not ready yet.
>> Yesterday I ran my first set of tested and I immediately hit a DSP
>> hang doing just a few very basic tests.
>>
>> Regards,
>>
>> Hans
>>
>>
>>
>> *) And kept it working properly despite other people breaking it with
>> changes
>> like moving the userspace stuff to UCM2.
>>
> 
> Hello,
> 
> What's the name of the private-thread? Or perhaps I'm not even invited
> there?

You were not on the Cc when Pierre-Louis started the thread,
I'll try to remember to Cc you on further replies. I'll give a summary
at the end of this email, since this is probably useful info for
everyone reading along to have.

> Please, elaborate "new drivers". /baytrail/ has been deprecated for
> years with only two available boards (machine boards) to it - which are
> somewhat duplicates of /atom/ -or- SOF equivalents (bytcr-xxxx). From
> linux-kernel perspective, having 3x baytrail driver is simply bad.

Ah, sorry I think I jumped the gun a bit on becoming grumpy about this.

On second reading I see you are removing the old-old Bay Trail code,
while keeping the medium-old (CONFIG_SND_SST_IPC_ACPI) code around for
now, correct ?

Yes that should be fine. One request though in the future please Cc
me on (non trivial) changes impacting Bay and Cherry Trail devices.

> Several teams, clients and groups have been asked on multiple occasions
> about the usage of the /baytrail/ folder. Not once positive answer has
> been given.

Right, I don't know about other distros but in Fedora we have had
the use of the old sound/soc/intel/common/sst-acpi.c code disabled
for BYT/CHT for a while now.

Note Fedora does have the common/sst-acpi.c Broadwell / Haswell
bits enabled all the way up to kernel 5.9, but lets discuss that
in the thread where you remove the common/sst-acpi.c code.

Regards,

Hans


p.s. The promised summary:

Pierre-Louis contacted me about moving BYT/CHT devices to the SOF
driver so that the medium-old / CONFIG_SND_SST_IPC_ACPI drivers can
eventually also be removed. I agreed with that plan, but I was and
still am against doing it immediately as I want to first run a set
of tests to make sure the switch will go smoothly.

The Bay / Cherry Trail work I do is a personal-time side project, which
means mostly working on it in the weekend. As discussed in the off-list
discussion at a minimum I would like to run the following setups:

Realtek codecs:
BYT(CR) RT5640 SSP0 AIF1
BYT(CR) RT5640 SSP0 AIF2
BYT     RT5640 SSP2
CHT     RT5640 (HP pavilion X2 10-p002nd uses this weird combo)
CHT     RT5645
BYT(CR) RT5651
CHT     RT5651
BYT    RT5672

Other:
BYT(CR) ESS8316
CHT     ESS8316
CHT     NAU8824

Through the following test plan:

1. Test speakers
2. Test internal mic.
3. Plugin headset, test headphones
4. Test headset-mic
5. Stop all audio, suspend + resume, test speakers
6. suspend + resume while playing audio, audio should
    resume playing after resume.

This weekend I ran the test-plan on the first setup and
at step 3 (a couple of minutes into testing) I hit a DSP
hang (which I could not reproduce). Other then the hang the
testing went smooth. We will need to see if the hang was a
glitch or if I will hit it more often when I test the other
setups.

I have dmesg output from the hang, if someone is interested.

