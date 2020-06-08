Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8181F148D
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Jun 2020 10:34:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 356911664;
	Mon,  8 Jun 2020 10:33:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 356911664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591605256;
	bh=BSK/c5FkEOeV9RpvB0Ax5dsayyzpcarhUzL6mtIMa3U=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X+PsV83bY+uKDZ2pggg8bwgkK6eUbkEIabLZSKktAoikcch5i+a2/BDVym+HL1kfq
	 qfflRsjlyzfQh8fCMZpCH7VL9ct9V4oVU0GsF0KhyXOjQAo5KSzb6tNq3yOV9beIMs
	 KAoqYzU5O5f1qVqtisJwhRs7eR1hBWu9I0ffOQVQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4836DF801EB;
	Mon,  8 Jun 2020 10:32:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 095F2F8021C; Mon,  8 Jun 2020 10:32:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=PRX_BODYSUB_17, SPF_HELO_NONE, 
 SPF_NONE autolearn=disabled version=3.4.0
Received: from bollie.ca9.eu (bollie.ca9.eu [81.169.254.190])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 166F6F80125
 for <alsa-devel@alsa-project.org>; Mon,  8 Jun 2020 10:32:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 166F6F80125
Received: by bollie.ca9.eu (Postfix, from userid 8)
 id E428EC315E; Mon,  8 Jun 2020 10:32:26 +0200 (CEST)
Received: from [192.168.1.100] (p3e9d4712.dip0.t-ipconnect.de [62.157.71.18])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by bollie.ca9.eu (Postfix) with ESMTPSA id D804CC04FA
 for <alsa-devel@alsa-project.org>; Mon,  8 Jun 2020 10:32:24 +0200 (CEST)
Subject: Re: Clock sync problem?
To: alsa-devel@alsa-project.org
References: <20200607133959.kmljpqdwefuio3mk@overdrive.tratt.net>
 <s5hk10i58io.wl-tiwai@suse.de>
From: Thomas Ebeling <penguins@bollie.de>
Message-ID: <14f91307-c121-a9f8-4045-1319ee0ca49e@bollie.de>
Date: Mon, 8 Jun 2020 10:32:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <s5hk10i58io.wl-tiwai@suse.de>
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


On 08.06.20 09:19, Takashi Iwai wrote:
> On Sun, 07 Jun 2020 15:39:59 +0200,
> Laurence Tratt wrote:
>> Hello,
>>
>> I've found an interesting issue with an SSL2+ audio interface -- it plays and
>> records fine (and, for the money, the sound quality is excellent!), but
>> recording slowly but surely drifts over time. For example, if I record a
>> click track in Audacity (or Ardour), play it through the interface and record
>> it, and then line up the start of the recorded click track with the original,
>> the two tracks will be around 5ms out of alignment after 30s. Interestingly,
>> this problem does not happen with OpenBSD, where the two tracks line up
>> precisely.
>>
> The recent change in USB-audio might help for a case like yours.
> Try my sound git tree (for-linus branch) or Linus' tree.  The former
> should be pullable onto 5.7 kernel cleanly.

Since I recently had clock drift issues with Audient devices, I'm 
intrigued by this. @Takashi Can you quickly elaborate, what you think, 
Laurance's issue might be and what has changed in that tree that might 
help him fix it? Is there some general issue with the current (stable) 
sound/usb implementation?

Thanks!

Thomas
