Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FE1288A50
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Oct 2020 16:09:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0772167E;
	Fri,  9 Oct 2020 16:08:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0772167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602252554;
	bh=EMefrkiR6VErnBfysfycnwnXyiK4IqvSiZNmhaUx7xw=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tgoJeYUBpoMErkIOU9fwgHaAOfykZNEgqg8fFZzwMbvlSe4CGFeCtJ8/AtOY2BkZ1
	 kyu6/boiuNlLvUN/GzeRvf5J07cxE0kxsS7HTiZKON6HXYVU+AXkEECZB3Eh7Epn1g
	 H5Iyt9oUJIYxLZM0Kg2C0lx/CWdq2v3ikNWOGtkw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D3E6F80165;
	Fri,  9 Oct 2020 16:07:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F2DBF8015B; Fri,  9 Oct 2020 16:07:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B5C5F800BF
 for <alsa-devel@alsa-project.org>; Fri,  9 Oct 2020 16:07:25 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 9A304A0040;
 Fri,  9 Oct 2020 16:07:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 9A304A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1602252444; bh=/mlODqTRA6pIsB2YAuSJv3Urebp1ojosppj7aeDvNR8=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=5pSW4L5PX+jdobcAAAh5MXYJoCbICWWPuq3QP1Os7I6IMGuMWh+vMJvqoWj4v9UjW
 feviIdp6C5CoJvB16wYEswqMUDFxH+tS46hlODcnN2iMUgQaIxrmq/eTMJx77YOKUF
 +6L8iFYpmLai66/GpnXsdEisi0Py7v2yFFTQkaI0=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri,  9 Oct 2020 16:07:22 +0200 (CEST)
Subject: Re: Discover a microphone device, to later discover if it is
 receiving input
To: info <info@dressmaker.ca>, alsa-devel@alsa-project.org
References: <de6ebf17-8f71-c497-28bc-7819338baddb@dressmaker.ca>
 <5378606a-5b71-5d1b-f7f4-a6f33dce60b3@dressmaker.ca>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <69ba716e-d576-088f-23e5-4462933e0159@perex.cz>
Date: Fri, 9 Oct 2020 16:07:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <5378606a-5b71-5d1b-f7f4-a6f33dce60b3@dressmaker.ca>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

Dne 09. 10. 20 v 14:39 info napsal(a):
> Can maintainers of this list please give a straight answer: is asking 
> questions and leaving comments here a waste of time?

Unfortunately, the hint list does not give information about the connected
mixer outputs or inputs. It's just a list of available PCM devices in the system.

If the I/O type is (null) it means that both directions may be available.

We have better device enumeration in UCM (Use Case Manager) by the use, but
the configurations are not available for all hardware yet.

BTW: Your e-mail header (From:) and signature does not seem trustly.

						Jaroslav

> On 2020-10-04 12:22 PM, info wrote:
>> Hi all,
>>
>>
>> I am writing a program that aims to auto-discover the microphone 
>> device that the user is speaking into. I started off by querying 
>> device hints and collected all devices with the IO types of null, 
>> since I have not found any devices with the type of Input. I am 
>> puzzled how it is possible that there is no Input, where a microphone 
>> device should not be able to emit sound. This is the list on my 
>> particular machine:
>>
>> Name of device: sysdefault:CARD=SB
>> Description of device: HDA ATI SB, ALC892 Analog
>> Default Audio Device
>> I/O type of device: (null)
>>
>> Name of device: front:CARD=SB,DEV=0
>> Description of device: HDA ATI SB, ALC892 Analog
>> Front speakers
>> I/O type of device: (null)
>>
>> Name of device: surround21:CARD=SB,DEV=0
>> Description of device: HDA ATI SB, ALC892 Analog
>> 2.1 Surround output to Front and Subwoofer speakers
>> I/O type of device: Output
>>
>> Name of device: surround41:CARD=SB,DEV=0
>> Description of device: HDA ATI SB, ALC892 Analog
>> 4.1 Surround output to Front, Rear and Subwoofer speakers
>> I/O type of device: Output
>>
>> Name of device: surround50:CARD=SB,DEV=0
>> Description of device: HDA ATI SB, ALC892 Analog
>> 5.0 Surround output to Front, Center and Rear speakers
>> I/O type of device: Output
>>
>> Name of device: surround71:CARD=SB,DEV=0
>> Description of device: HDA ATI SB, ALC892 Analog
>> 7.1 Surround output to Front, Center, Side, Rear and Woofer speakers
>> I/O type of device: Output
>>
>> Name of device: sysdefault:CARD=SB
>> Description of device: HDA ATI SB, ALC892 Analog
>> Default Audio Device
>> I/O type of device: (null)
>>
>> Name of device: front:CARD=SB,DEV=0
>> Description of device: HDA ATI SB, ALC892 Analog
>> Front speakers
>> I/O type of device: (null)
>>
>> Now, I am more puzzled, because none of them is a microphone device 
>> explicitly. How can my program determine which of them is actually a 
>> microphone?
>>
>> Also, why are devices are duplicated in the output from 
>> snd_device_name_hint()? The very first device is also repeated as the 
>> 2nd last one...
>>
>>
>> Regards,
>> Alex
>>
>>
> 
> 


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
