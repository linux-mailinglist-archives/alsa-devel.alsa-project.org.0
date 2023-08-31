Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C0C78F3B7
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Aug 2023 22:01:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4376208;
	Thu, 31 Aug 2023 22:00:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4376208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693512059;
	bh=vDqkT8pzGZtkRpUg9rOwPMFulsBPp2TzPWREvuUX8+8=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CRhR04Ds3H7OwYbn3kx79u+2qpu+cpSOB/5PoEsV0gEX9x5Sz85y0oPleeOA11KE3
	 jKVRLEL3IppbvhgmC/QwH3ecTclVcFJScWCfCE/mV6748RfBa9lKb5PRyyVCZhw45C
	 DlnebpB4X7bHzb8kuHYBtk1lvMAuckrvoauu27xs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59167F80236; Thu, 31 Aug 2023 22:00:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D7DCAF800F5;
	Thu, 31 Aug 2023 22:00:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46A09F80155; Thu, 31 Aug 2023 22:00:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D10D5F80007
	for <alsa-devel@alsa-project.org>; Thu, 31 Aug 2023 21:59:55 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id D8C8211E2;
	Thu, 31 Aug 2023 21:59:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz D8C8211E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1693511994; bh=rtULypEVgZwnDPhkrZawMato0RBe2XH3yAoweO8kF+8=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
	b=X/kcdtQ7k9+OJq6aRKiHTox4Xaw0PsSE4R+gFy25z4ZuD2paVYfL4frSaKh4ADhI+
	 z1EU6bDCeaeeWkstkbdtxYan6vnXs/eIiDJhksDeHLFim3aj7mm+XsnS6WDlQaCexZ
	 DMeiYG6jVVfSRN5YJXseMbpEYRFqpIKASCkwleQU=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Thu, 31 Aug 2023 21:59:49 +0200 (CEST)
Message-ID: <57760ae1-da91-101b-3e1d-3e143fd9f8bc@perex.cz>
Date: Thu, 31 Aug 2023 21:59:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Curtis Malainey <cujomalainey@google.com>
Cc: cujomalainey@chromium.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 ethan.geller@gmail.com
References: <20230824213312.1258499-1-cujomalainey@chromium.org>
 <20230824213312.1258499-2-cujomalainey@chromium.org>
 <73a6f02e-0df7-243a-85ac-48ca5a650cba@perex.cz>
 <CAOReqxhSsi_6+3SuBi3nMEVpZ5M7qQLDLhh7bJfkJufQP6dEAA@mail.gmail.com>
Content-Language: en-US
From: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH 2/2] ucm: docs: Add IVEchoData
In-Reply-To: 
 <CAOReqxhSsi_6+3SuBi3nMEVpZ5M7qQLDLhh7bJfkJufQP6dEAA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6AJLAVHPP5VWUN5FHBPEI6MQ6QYWOUJT
X-Message-ID-Hash: 6AJLAVHPP5VWUN5FHBPEI6MQ6QYWOUJT
X-MailFrom: perex@perex.cz
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6AJLAVHPP5VWUN5FHBPEI6MQ6QYWOUJT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 31. 08. 23 19:06, Curtis Malainey wrote:
> Curtis Malainey | Chrome OS Audio Senior Software Engineer |
> cujomalainey@google.com | Sound Open Firmware Lead
> 
> 
> On Sat, Aug 26, 2023 at 4:31 AM Jaroslav Kysela <perex@perex.cz> wrote:
>>
>> On 24. 08. 23 23:33, cujomalainey@chromium.org wrote:
>>> From: Curtis Malainey <cujomalainey@chromium.org>
>>>
>>> Provide a UCM value to mark devices which are needed to be opened only
>>> for HW purposes but should not be consumed for userspace.
>>
>> It would be probably better to describe this in the standard ALSA PCM API than
>> UCM. If the device is special, applications without UCM should be also allowed
>> to identify them.
>>
>>                                  Jaroslav
> 
> Would something like an additional device class and a format subclass
> be acceptable?

The device class extension sounds good.

I don't know details for the format extension - does app require to set 
hw_params ? If yes, is the goal to prevent standard applications to set the 
hw_params ? If no, the format bitmask may be set to zero, thus hw_params will 
always fail.

					Jaroslav
-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

