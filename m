Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 840B0B43D4E
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Sep 2025 15:33:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C09AA601F8;
	Thu,  4 Sep 2025 15:33:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C09AA601F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1756992822;
	bh=PW5kXIRFLwL+fxJf7ks3y5OVmZKeqvOAfO82HG95t0I=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=R6j3FPzvZP8HXmjYjxLhZ4S87x0572OOPV21kco81pVGET8c0Cz/XD4l2uuINLZZR
	 hbITiJZBtjuOQ1/7HxtIKuYAsMw31VD02ytGEhotAjznUE0KJUxBPXlH8kO5wEvAm/
	 lcc6o36Ey8cauIF9V6yMkteSBBGIFWLxlGkxvZhk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4CADF805DF; Thu,  4 Sep 2025 15:33:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E384F805C6;
	Thu,  4 Sep 2025 15:33:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2DAA4F804B0; Thu,  4 Sep 2025 15:33:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E9F18F800B0
	for <alsa-devel@alsa-project.org>; Thu,  4 Sep 2025 15:32:59 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id BC2686C7D;
	Thu,  4 Sep 2025 15:32:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz BC2686C7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1756992778; bh=JtRGO8uwi8mBGvn+c6qB+KKAyArUJaFD4X1AqLtgwgo=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=08y3GvXv9kHziTB7+oQw7CNgVXjj47IqRtVt+LVi/KDjn4cP53kzeSQfpHDlnWdaV
	 pBur4tlxYnzpWZpyFyHMNlS5Xuy9VWbdKhpIpemSYt42DM0ASutYswOPxYwmvTruzq
	 A/2/UOsHf87tD9xw4W/CV/1d3CiNG0HhvZhYgK5w=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Thu,  4 Sep 2025 15:32:52 +0200 (CEST)
Message-ID: <13e0868a-6528-42fa-ab9a-2b5e37e095f3@perex.cz>
Date: Thu, 4 Sep 2025 15:32:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ALSAfirewire broken / Pipewire 90ms delay
To: "M. Armsby" <m.armsby@gmx.de>, alsa-devel@alsa-project.org,
 Takashi Sakamoto <takaswie@kernel.org>
References: <224C5A41-DCED-4FA2-BE82-898F257DA2E9@gmx.de>
 <20250724143813.GA23616@workstation.local>
 <FD6FDA7B-D958-47BB-B90C-1A82349F94E4@gmx.de>
 <48A27ABA-5EF6-400D-A47A-103C1A4ABC6D@gmx.de>
 <1B53DD0F-1D85-49EC-BA7F-970BE9AEF457@gmx.de>
 <d21fb84e-d72e-4747-a9ff-92722b93f835@perex.cz>
 <20250903111519.GA76122@workstation.local>
 <3e07de0a-affa-4776-9172-83b2b071fbe8@perex.cz>
 <20250904131807.GA209723@workstation.local>
From: Jaroslav Kysela <perex@perex.cz>
Content-Language: en-US
Autocrypt: addr=perex@perex.cz; keydata=
 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
In-Reply-To: <20250904131807.GA209723@workstation.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: XQJQJQLEN6EL6DEH74GFVCDOHO6464LR
X-Message-ID-Hash: XQJQJQLEN6EL6DEH74GFVCDOHO6464LR
X-MailFrom: perex@perex.cz
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XQJQJQLEN6EL6DEH74GFVCDOHO6464LR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 04. 09. 25 15:18, Takashi Sakamoto wrote:
> Hi,
> 
> On Wed, Sep 03, 2025 at 02:19:59PM +0200, Jaroslav Kysela wrote:
>> On 03. 09. 25 13:15, Takashi Sakamoto wrote:
>>> Hi Jaroslav,
>>>
>>> On Wed, Sep 03, 2025 at 10:47:32AM +0200, Jaroslav Kysela wrote:
>>>> For Takashi Sakamoto:
>>>>
>>>> The hw_params constraints in the firewire driver should be improved based on
>>>> [1]. The drivers may also require the SNDRV_PCM_INFO_BATCH info flag.
>>>
>>> How it works in this case?
>>
>> I guess that the question is for the BATCH flag. It's just an information
>> that the stream queuing is not granular enough like for PCI cards and the
>> samples are queued in chunks to the hardware. Applications can handle the
>> queuing differently in this case.
> 
> Hm. A packet can multiplex several Multi Bit Linear Audio (MBLA) data
> frames defined in IEC 61883-1/6 (e.g. 0, 6-8 frames per packet at 48.0
> kHz sampling transmission rate) When considering the frame count reported
> by typical serial sound interface in embedded SoCs, this granularity is
> not particularly unusual, even if DMA transmission occurs between system
> buffer and the interface buffer. Since the ALSA PCM interface does not
> expose this granularity, it remains invisible to userspace applications,
> and application therefore cannot distinguish its origin. This is why
> these drivers does not report the BATCH flag[1].
> 
> Nevertheless, one likely reason might be that i programmed the
> IEC 61883-1/6 packet stream engine to recycle retired packet buffers as
> quickly as possible, using a "sequence replay" approach. This behaviour
> may appear as though it follow the concept of the BATCH flag.
> 
> I plan to redesign both the engine and PCM operation implementations of
> each driver to address this point, as well as to add support for
> SNDRV_PCM_INFO_SYNC_APPLPTR to packetize in application processes.
> However, it is not yet the right time (I still have some items in Linux
> firewire stack itself).

Thanks for this update.

>> See also proposed (and applied) change in [2]. Please, read [1] thread
>> referred in my previous e-mail to see the problematic buffer size
>> configurations for firewire drivers.
> 
> In Linux FireWire subsystem, there is a size restriction on the context
> header within the.structure specific to isochronous context[2]. This
> software-side restriction determines the upper limit of the PCM
> buffer. The content of IEC 61883-1/6 CIP header is stored into this
> buffer, The frame count in each PCM period/buffer, as well as the total
> count itself, are governed by the computation of the number of headers
> fitting into the context header buffer[3]. The count differs by the
> design of target device. The design of protocol mentioned in the above
> appends more constraints[4].

It would be nice to check the buffer size / period size values using procfs 
for the problematic 2048 setup (see the referred thread), if there's a demand 
to fix this. Maybe there's a mismatch between GUI/sound server settings and 
driver settings.

				Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
