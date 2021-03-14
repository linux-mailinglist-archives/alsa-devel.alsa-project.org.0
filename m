Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A6C33A526
	for <lists+alsa-devel@lfdr.de>; Sun, 14 Mar 2021 15:06:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77DC61756;
	Sun, 14 Mar 2021 15:06:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77DC61756
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615730813;
	bh=TmIpgmQ6y4D7lL1oHcx1Qs4CzcBcehM07rHCf09scdc=;
	h=From:Subject:To:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=snGS7G4r4yTEAqnFjg5arkuBQ+BPhlc7F4HUO9PWbPxraD3/omx/5U8NS99roMDbw
	 TjgQ9AghyecKZWQicdt5ws0sV6lVXW3+vTJeY0/l8nBaUJ08hBdfEMMfsEE5GOmOor
	 yPEn+wQZyHf/qfobTqE6efGNGavNv38eLoggX4YE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5238F80224;
	Sun, 14 Mar 2021 15:05:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0B95F80218; Sun, 14 Mar 2021 15:05:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ns4.inleed.net (mailout4.inleed.net
 [IPv6:2a0b:dc80:cafe:104::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E8BDF8010E
 for <alsa-devel@alsa-project.org>; Sun, 14 Mar 2021 15:05:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E8BDF8010E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=diwic.se header.i=@diwic.se
 header.b="iKsVj0lC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=diwic.se;
 s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-ID:
 To:Subject:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=MZT9Fe/ejP58gt9Ot84FvEXycetXfXBrjfpkSt8W79k=; b=i
 KsVj0lCphM1OT639B00FLxj90XyjeO4GPnwNI7+/CJutWmCkkFv9q3YGnngQmNZXyVSaN73cJux+x
 6lcZsZgKppGc1ZXQcAnsj6n7gKPW2b+dvdxtG1DJUoA55xI4HdEI1eNKi5UUEEanHGqpi+/Mu8BFx
 XS3W32ctDCt0Ib/Hb5EieGbKJsYk2NNo+I+/kkdhSCy0RP//y/iEckB9/golOOX7JPhtx9H2AQqXx
 A5yTY6lXSEm0+MqXPjwGxx8yi0868gvSCQYRFbjEbC1ezZNxX4JVxzhUqcB/LMMCwns2rnJrE6Ds6
 zkECmFUkems5El2k0P61ytXB1T8X1QwSQ==;
Received: from c83-254-143-147.bredband.comhem.se ([83.254.143.147]
 helo=[192.168.5.7]) by ns4.inleed.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94)
 (envelope-from <coding@diwic.se>) id 1lLRMi-00A0YT-LB
 for alsa-devel@alsa-project.org; Sun, 14 Mar 2021 15:05:08 +0100
From: David Henningsson <coding@diwic.se>
Subject: Midi timestamps
To: alsa-devel@alsa-project.org
Message-ID: <d02124d1-1af8-15e0-a7a5-af2c1732e440@diwic.se>
Date: Sun, 14 Mar 2021 15:05:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
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

Hi,

When writing an application that records midi (and e g saves it to 
disk), ultra-low latency isn't really needed, all we need to know is 
exactly when the midi message came in. The application can then wake up 
once a second or so, to write the incoming data, including an accurate 
timestamp for every event, to disk.

As far as I can see, the rawmidi interface does not support such a 
feature at all. There is a snd_rawmidi_status syscall, but its timestamp 
field is not even filled by the kernel (!). But even if that was fixed, 
it would not fix the problem as there could be several midi events in 
the buffer with different timestamps.

You could use the seq interface, it does support timestamps, but I can 
see at least two potential problems with this:

First, the seq code runs in a work queue, not in the actual IRQ. This 
means that midi event is timestamped too late, especially so if the work 
is delayed for some reason.

Second, seq hard-codes the timestamp type to monotonic - there is no 
monotonic_raw, so the timestamp would be affected by NTP changes.

Also, the timespec uses 32-bit for sec and nsec, but I suspect this is 
less of a problem (unless people constantly record midi for sixty years 
or so...).

It seems like it could be useful to have a rawmidi mode which 
automatically prefixes every incoming message with a timestamp. This 
would replace the current "raw" midi buffer with some type of header 
"length, timestamp, data" or so. Arguably this would make the rawmidi 
slightly less raw, but anyway. Does this make sense? Should I attempt to 
write something? Or would it be better to try to use (and potentially 
improve) the seq code?

// David

