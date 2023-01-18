Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D48AA6718F7
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Jan 2023 11:31:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5AA7D49F1;
	Wed, 18 Jan 2023 11:30:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5AA7D49F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674037902;
	bh=s2BuUHCHoFDACjG07P8Pqv1tkPglRz+2uPHcMOTk7oA=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NMP3EaDFD3pyhDZ69KBUpmSHQTaPWSlUeteiQPQThPqkaFB7BMFiramJR3XvDoT/r
	 svnRsYcXZMUZjbl12aITHABssa3Ljsm0OwHWormQfXKY9FCNPnFPbEyWm4QCOibRD8
	 TENgmc8DKw9Ft+BhZy7YVe+rVGTkFjKjsTiIcvY8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CDD66F804A9;
	Wed, 18 Jan 2023 11:30:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 714D9F80482; Wed, 18 Jan 2023 11:30:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FORGED_MUA_MOZILLA,
 HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,NICE_REPLY_A,
 RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from a7-17.smtp-out.eu-west-1.amazonses.com
 (a7-17.smtp-out.eu-west-1.amazonses.com [54.240.7.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21CF3F80083
 for <alsa-devel@alsa-project.org>; Wed, 18 Jan 2023 11:30:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21CF3F80083
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key, unprotected) header.d=i2rs.nl header.i=@i2rs.nl
 header.a=rsa-sha256 header.s=2vyqd27h6gu7kyrtaamxo2tr266ggkha
 header.b=lrvL7xim; dkim=pass (1024-bit key,
 unprotected) header.d=amazonses.com header.i=@amazonses.com
 header.a=rsa-sha256 header.s=ihchhvubuqgjsxyuhssfvqohv7z3u4hn
 header.b=Gz8BvuNK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=2vyqd27h6gu7kyrtaamxo2tr266ggkha; d=i2rs.nl; t=1674037831;
 h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:References:From:In-Reply-To;
 bh=Leqq/TAfbhyVDcd/0IWpnK+Wx94n9nPo7bQXI0rc868=;
 b=lrvL7xim5/OaBwn+U/AV3pIr0tC5mn2tAo2B9yrFxUGEaLEKxghctztWWL5t8I1m
 BQUTUKdCJChLq1BwpWp5vOKRgtt+SEHsLisNNgCFB+uAMLSFKGjnIPDQJMHTbAO77CF
 AeCStTOwTRCiSTauz45Cbq4yEZ4TRoBjNCQ2vOEA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=ihchhvubuqgjsxyuhssfvqohv7z3u4hn; d=amazonses.com; t=1674037831;
 h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:References:From:In-Reply-To:Feedback-ID;
 bh=Leqq/TAfbhyVDcd/0IWpnK+Wx94n9nPo7bQXI0rc868=;
 b=Gz8BvuNK1+hMbQuJ10/zvQRhWYMERAIo22TpFaeF+RxV0xG0BlxYywoP8gBrCZub
 Cm23j2sWnJXqDNiLjGsZ5ER02baJTlq/mK8PxHeGJZbSFFNeSMNUcmlbmbTKR7bH2gT
 zOZ5cYOKojCU6n+/lMEelUUIaw2Po3SPoGfOkgHA=
Message-ID: <01020185c46e2494-187f697a-ade5-4080-a366-95e6322e9bb2-000000@eu-west-1.amazonses.com>
Date: Wed, 18 Jan 2023 10:30:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: Question about amidi -l output
Content-Language: en-US
To: alsa-devel@alsa-project.org
References: <01020185bc1fd1bd-853c4526-e5d2-428a-a216-1c38763f0b21-000000@eu-west-1.amazonses.com>
 <d8b10881-5fe4-4e62-53d5-072d7d984de1@gnuinos.org>
From: Jeroen Baten <jbaten@i2rs.nl>
In-Reply-To: <d8b10881-5fe4-4e62-53d5-072d7d984de1@gnuinos.org>
Feedback-ID: 1.eu-west-1.Qg6RKS0Vh85rXfbGE/RC4HMWYYzuNzzB1o81d5I/9kU=:AmazonSES
X-SES-Outgoing: 2023.01.18-54.240.7.17
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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

Hi,

Not that I want to argue, but if 'amidi -l' currently gives me 
"Boutique", than shouldn't somewhere in the udev hierarchy exist a 
string 'Boutique'?

root@studio:/lib/udev#  amidi -l
Dir Device    Name
IOhw:1,0,0   HYDRASYNTH DR MIDI 1
IOhw:3,0,0   UMC204HD 192k UMC204HD 192k MID
IOhw:4,0,0   Boutique MIDI 1
IOhw:5,0,0   Boutique MIDI 1
IOhw:6,0,0   Boutique MIDI 1
IOhw:7,0,0   Keystation 61 MK3 Keystation 61
IOhw:7,0,1   Keystation 61 MK3 Keystation 61
IOhw:8,0,0   Alesis Strike MIDI 1
root@studio:/lib/udev#  lsusb | grep outique
Bus 007 Device 013: ID 0582:028e Roland Roland Corp. Boutique JX-08
Bus 007 Device 012: ID 0582:028c Roland Roland Corp. Boutique JD-08
Bus 003 Device 003: ID 0582:01ff Roland Roland Corp. Boutique D-05
root@studio:/lib/udev#  grep -r -i 'boutique'  /etc/udev/*
grep: /etc/udev/hwdb.bin: binary file matches
/etc/udev/hwdb.d/20-usb-vendor-model.hwdb: ID_MODEL_FROM_DATABASE=Roland Corp. Boutique D-05
/etc/udev/hwdb.d/20-usb-vendor-model.hwdb: ID_MODEL_FROM_DATABASE=Roland Corp. Boutique JX-08
/etc/udev/hwdb.d/20-usb-vendor-model.hwdb: ID_MODEL_FROM_DATABASE=Roland Corp. Boutique JD-08
root@studio:/lib/udev#

Op 16-01-2023 om 21:45 schreef aitor:
> Hi Jeroen,
>
> On 16/1/23 20:48, Jeroen Baten wrote:
>
>> I hope someone can point me in the right direction.
>> So the Ardour application uses the output of amidi -l to name USB
>> devices. In my case I now have 3 devices all named "Boutique MIDI 1",
>> although they are 3 different types of synth.
>> I already added the devices to usb-list and system-hwdb so lsusb shows
>> up with correct synth names.
>> What can I do to make amidi -l show better device names? Where do these
>> names come from? What lib or db should I look at to patch and submit?
>> I hope someone can help me.
>
> You can use udev rules for that. The link below might help you:
>
> https://www.alsa-project.org/wiki/Changing_card_IDs_with_udev
>
> Cheers,
>
> Aitor.

-- 
Jeroen Baten              | EMAIL :JBATEN@I2RS.NL
  ____  _  __              | web   :www.i2rs.nl
   |  )|_)(_               | tel   :  +31 (0)648519096
  _|_/_| \__)              | Frisolaan 16, 4101 JK, Culemborg, the Netherlands
