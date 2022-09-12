Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 299155B552F
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Sep 2022 09:18:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A032C16C1;
	Mon, 12 Sep 2022 09:17:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A032C16C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662967097;
	bh=tMnqPzvcW1Hc9q8NVuef3kpFPL22ITmRWG2jn6554Ow=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kxPTfMJQ1v4qm4Pe+elSSHQPffBaviXUpEO8qhXr/VQAWyx6S/Gp+1WYf6m3X5nhQ
	 FS0uVYU5MCsWDMh2DckxgSclDpypmqp7kSOd6yL77y70puo3BOUtSGBMGabItQgZvP
	 IdTgzs2HVRhVnTngq9wKrkxEL+DYN2hZdiGZXdLM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AA10F8030F;
	Mon, 12 Sep 2022 09:17:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AEB3FF8027B; Mon, 12 Sep 2022 09:17:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1DCE5F80095
 for <alsa-devel@alsa-project.org>; Mon, 12 Sep 2022 09:17:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DCE5F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="eCg9++X3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1662967035;
 x=1694503035;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=GL/r0e3Bljjih6Nhnen38jSQxiap0mNwoK1npXft9aY=;
 b=eCg9++X3L2x9fR/Rbu3rdTMFwXdc3NH6RCGePhJ2JvzTt7lj/eSJSjjW
 FGEXK6xFQmerodOUrLnw+UObuLn0io0mFkGjSPokuMBfTNVgtxOZr3HUN
 oIpycaj8pjoX/PQ4pb1Vd3F4qVIY8SuPrVq23U4o8GFg3D4P5VtfhcXo1
 j3x2opOzQynkiUQQPcg2N2MieeqkyjeGiLDH5C1C/NSc6JewkFNNpZYzy
 MxCAOks9TRbbImLjtC4HGN0kmCrl55mUjzejaZWctI6g9K1JtUsKGSNVH
 r7Z2U1HocaJbDK4SPplRCSR8qo0a8Uxgrv/j+NYcZf+focLlvCsCur65d g==;
Message-ID: <ae04a891-a626-0259-d39e-fc8045a7ca94@axis.com>
Date: Mon, 12 Sep 2022 09:17:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] ASoC: ts3a227e: allow enabling the jack detect in driver
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Astrid Rost <astrid.rost@axis.com>
References: <20220909093001.13110-1-astrid.rost@axis.com>
 <Yxt7tfm6MRMaDthO@sirena.org.uk>
From: Astrid Rost <astridr@axis.com>
In-Reply-To: <Yxt7tfm6MRMaDthO@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail04w.axis.com (10.20.40.10) To se-mail05w.axis.com
 (10.20.40.11)
Cc: alsa-devel-mejlinglistan <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, kernel@axis.com
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

Hello,


 > New properties need to be documented, I'm happy for that to be in the
 > existing document though obviously a conversion to YAML would be very
 > much appreciated.  However...

Yes, I am doing the yaml conversion for the other patch.
I guess this one - I will try to do differently.

On 9/9/22 19:45, Mark Brown wrote:
> ...this is something that should be done in the machine driver rather
> than the CODEC, the way the device is wired up in an individual system
> may be surprising or the system may have some more specific labelling
> that can be usefully applied so this is all deferred to the card.
> 
> It would sense to convert ts3a277e_enable_jack_detect() to be a
> component set_jack() operation, that'd enable it to be used more easily
> with generic cards (though I see that it's not yet wired up for
> audio-graph-card unfortunately).

Thank you! Yes, set_jack I did not see.
I actually thinking of putting this into simple_card.c. But than it 
needs to be really generic.

I will have a look.

Astrid


