Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1D5347D85
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Mar 2021 17:18:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C25A168D;
	Wed, 24 Mar 2021 17:18:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C25A168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616602738;
	bh=lPjiUDzqCnsuJToELEh7jPKykL1ajG411H7MdkfyUuU=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qCsRO/5ruOv6qjpB1rp2b2P4Oh9Oh4Lf632zmzh5xSl7nUZJWiUU0TRR/f3Bz2cLW
	 XY36PB/ltXlyzc+tkRH4xUFw9pyUL2m2Rrf7Yep3tFi6p3GKetaCsWUqzVFKGIvlx9
	 ARfN9mXnwyPZ1xh9Q2iUfZhscEA7NjJwCzUo3diw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8807F801D5;
	Wed, 24 Mar 2021 17:17:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35D7FF8016B; Wed, 24 Mar 2021 17:17:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from ns4.inleed.net (mailout4.inleed.net
 [IPv6:2a0b:dc80:cafe:104::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A26D3F8012B
 for <alsa-devel@alsa-project.org>; Wed, 24 Mar 2021 17:17:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A26D3F8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=diwic.se header.i=@diwic.se
 header.b="UESW/NTz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=diwic.se;
 s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nqotU1EeyNUx+1D402qXDjEdmAPzsymT0Ob56vqyDF8=; b=UESW/NTzOaXOK9BgE893qLLSvk
 bJz2TYMOfnr0eLRsqDG2GRpelGi0605+0FEwTVzwr2TpTELu46hMrMM6ydswAkftfmnE4/oOSzksO
 +oqf/HxCITHC5ncxOg2qCxDDYSw1+N3CaIRAiuDixNsqWjQTJDQg8y3W1bvAIjDqhfSkzGmjFGkHs
 cYAaTLVlViacQrH2lw4ZBPr7i3qmjGxXoH0CJU/++37i4uDr3qvi0XyurFkbM907jT+LgPTpyYZFH
 j4wSUSb+mvRtBiU0r37GB9KcZvkD+3hW/g41n8dEabltlEBbIVLyetuH18I890ChauNtU+NZQ900c
 /1/+cjZg==;
Received: from c83-254-143-147.bredband.comhem.se ([83.254.143.147]
 helo=[192.168.5.7]) by ns4.inleed.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94)
 (envelope-from <coding@diwic.se>)
 id 1lP6CC-009duy-B6; Wed, 24 Mar 2021 17:17:24 +0100
Subject: Re: [PATCH 1/1] sound: rawmidi: Add framing mode
To: Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
 tiwai@suse.de
References: <20210324053154.34107-1-coding@diwic.se>
 <20210324053154.34107-2-coding@diwic.se>
 <a0812386-d916-4cdb-a230-4c56e0b8952e@perex.cz>
From: David Henningsson <coding@diwic.se>
Message-ID: <c456e5a2-66aa-4390-6968-1e030e8962e7@diwic.se>
Date: Wed, 24 Mar 2021 17:17:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <a0812386-d916-4cdb-a230-4c56e0b8952e@perex.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Authenticated-Id: coding@diwic.se
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


On 2021-03-24 17:06, Jaroslav Kysela wrote:
> Dne 24. 03. 21 v 6:31 David Henningsson napsal(a):
>> This commit adds a new framing mode that frames all MIDI data into
>> 16-byte frames with a timestamp from the monotonic_raw clock.
> I would add support for monotonic timestamps, too. The NTP drifts are usually
> small, so it may make sense to support those timestamps, too. It may be handy
> for the synchronization among multiple machines (timing sources).
>
> The timestamp mode should be selected separately than the framing mode.
Okay, noted for v3.
>
>> +#define SND_RAWMIDI_FRAMING_DATA_LENGTH 7
>> +
>> +struct snd_rawmidi_framing_tstamp {
>> +	unsigned int tv_sec;	/* seconds */
>> +	unsigned int tv_nsec;	/* nanoseconds */
>> +	unsigned char length;
>> +	unsigned char data[SND_RAWMIDI_FRAMING_DATA_LENGTH];
>> +};
> Perhaps, we should consider to have a fixed header and variable data length
> here. For MIDI, the standard messages have only few bytes usually. It would be
> better to use this space for the seconds field:
>
> header {
> 	unsigned long long tv_sec;
> 	unsigned int tv_nsec;
> 	unsigned int len;
> 	unsigned char data[0];
> };

I considered that, but it has problems with alignment. If you have a 
normal midi message of 3 bytes, now your second tv_sec will end up 
starting on an odd byte, unless you add padding, and then that padding 
needs to be specified and so on. In addition, half of the header could 
end up in the end of the ring buffer and the other half in the 
beginning. So I found the 16 byte fixed version to be simpler and easier 
to implement correctly.

However if you like we could change the tv_sec to 64 bit and end up with:

#define SND_RAWMIDI_FRAMING_DATA_LENGTH 3

struct snd_rawmidi_framing_tstamp {
	unsigned long long tv_sec;	/* seconds */
	unsigned int tv_nsec;	/* nanoseconds */
	unsigned char length;
	unsigned char data[SND_RAWMIDI_FRAMING_DATA_LENGTH];
};

We'll then have only three bytes for the actual data, but since that is what most midi messages are anyway, it would be okay, I assume.

// David


