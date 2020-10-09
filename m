Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A43288903
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Oct 2020 14:40:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F95015F9;
	Fri,  9 Oct 2020 14:40:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F95015F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602247255;
	bh=O8SIIfJRwWuHk98lRcVZMZnZGub2X+eLW5ZkAFQvpYk=;
	h=Subject:From:To:References:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E4PLv55T5VNrwFNtqRr2oHKnsbG2RJXRAWnkNH6iJOnh1pgrlip4Gz0cugfYKmo5T
	 Eaus/K7eKcd8ywOs/bketQ3xkinLgM+sAz9aHgJI8N9YqbcABcoTx3b4RA7c7nsGTE
	 ZdrIEM35oPAIJwG9tA4d4vytIhFnTYo8n0KIuBKs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77F3CF80165;
	Fri,  9 Oct 2020 14:39:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 62A14F8015B; Fri,  9 Oct 2020 14:39:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.earthlovesme.ca (24-65.162.static.aei.ca [216.162.65.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2FFEF80128
 for <alsa-devel@alsa-project.org>; Fri,  9 Oct 2020 14:39:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2FFEF80128
Received: from localhost.localdomain (Unknown [10.10.10.3])
 by mail.earthlovesme.ca with ESMTPSA
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128)
 ; Fri, 9 Oct 2020 08:39:14 -0400
Subject: Re: Discover a microphone device, to later discover if it is
 receiving input
From: info <info@dressmaker.ca>
To: alsa-devel@alsa-project.org
References: <de6ebf17-8f71-c497-28bc-7819338baddb@dressmaker.ca>
Organization: Dressmaker Canada Inc.
Message-ID: <5378606a-5b71-5d1b-f7f4-a6f33dce60b3@dressmaker.ca>
Date: Fri, 9 Oct 2020 08:39:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <de6ebf17-8f71-c497-28bc-7819338baddb@dressmaker.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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

Can maintainers of this list please give a straight answer: is asking 
questions and leaving comments here a waste of time?

On 2020-10-04 12:22 PM, info wrote:
> Hi all,
>
>
> I am writing a program that aims to auto-discover the microphone 
> device that the user is speaking into. I started off by querying 
> device hints and collected all devices with the IO types of null, 
> since I have not found any devices with the type of Input. I am 
> puzzled how it is possible that there is no Input, where a microphone 
> device should not be able to emit sound. This is the list on my 
> particular machine:
>
> Name of device: sysdefault:CARD=SB
> Description of device: HDA ATI SB, ALC892 Analog
> Default Audio Device
> I/O type of device: (null)
>
> Name of device: front:CARD=SB,DEV=0
> Description of device: HDA ATI SB, ALC892 Analog
> Front speakers
> I/O type of device: (null)
>
> Name of device: surround21:CARD=SB,DEV=0
> Description of device: HDA ATI SB, ALC892 Analog
> 2.1 Surround output to Front and Subwoofer speakers
> I/O type of device: Output
>
> Name of device: surround41:CARD=SB,DEV=0
> Description of device: HDA ATI SB, ALC892 Analog
> 4.1 Surround output to Front, Rear and Subwoofer speakers
> I/O type of device: Output
>
> Name of device: surround50:CARD=SB,DEV=0
> Description of device: HDA ATI SB, ALC892 Analog
> 5.0 Surround output to Front, Center and Rear speakers
> I/O type of device: Output
>
> Name of device: surround71:CARD=SB,DEV=0
> Description of device: HDA ATI SB, ALC892 Analog
> 7.1 Surround output to Front, Center, Side, Rear and Woofer speakers
> I/O type of device: Output
>
> Name of device: sysdefault:CARD=SB
> Description of device: HDA ATI SB, ALC892 Analog
> Default Audio Device
> I/O type of device: (null)
>
> Name of device: front:CARD=SB,DEV=0
> Description of device: HDA ATI SB, ALC892 Analog
> Front speakers
> I/O type of device: (null)
>
> Now, I am more puzzled, because none of them is a microphone device 
> explicitly. How can my program determine which of them is actually a 
> microphone?
>
> Also, why are devices are duplicated in the output from 
> snd_device_name_hint()? The very first device is also repeated as the 
> 2nd last one...
>
>
> Regards,
> Alex
>
>


