Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC75010CA5C
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Nov 2019 15:30:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2906716E2;
	Thu, 28 Nov 2019 15:29:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2906716E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574951418;
	bh=eO5yL8kAd2KTh+U1QETCqlTOR8FBpq2bJpfy+3ymM2Y=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i7V30jJc2JOJIo8c5n683niFkfz8g6csP+BOABFmhVGSzVshJd0C52+GrKKCSnt3u
	 3ahOXYQMOxkrHzJ/axdwSaPEcBnxnUSumxz1U+UNzcXeDFTn1cfI0G4iu5/hzfoy9X
	 Y+oueRMG2Qg4o0w5TspbehpZrnDsKgNCkQ+QMS2A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CC40F80159;
	Thu, 28 Nov 2019 15:28:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D38DF80149; Thu, 28 Nov 2019 15:28:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B332F800CE
 for <alsa-devel@alsa-project.org>; Thu, 28 Nov 2019 15:28:25 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 69878A0042;
 Thu, 28 Nov 2019 15:28:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 69878A0042
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1574951304; bh=+5HDe1GJQQcveKIPfq3W6WhXMbjxAvn2IglImbrxg1s=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=aezBcLcFRY8+YvfddSscb8tuZkqzyCa7hIh9Gb5gIYeSDlNvLnofrpg0zMHiPbbin
 m/8+b5NAgSl8JtCsOWJFhJrV3eGaGYt1cMmGj2AoneR84+5lbLmjgBsbbyrFOMAU2R
 1y8nd4+OFaXIwVu+G+KOBOpHcTTnY+yjNolrLYQ8=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu, 28 Nov 2019 15:28:20 +0100 (CET)
To: Mark Brown <broonie@kernel.org>
References: <20191126103404.29534-1-perex@perex.cz>
 <dd238740-f154-a660-2a80-0ada80183dd2@linux.intel.com>
 <32edec86-ec1c-1809-2278-fecac09ac321@perex.cz>
 <20191126162935.GB4205@sirena.org.uk>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <48159775-bd7b-b473-7e02-3116ca8dee73@perex.cz>
Date: Thu, 28 Nov 2019 15:28:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191126162935.GB4205@sirena.org.uk>
Content-Language: en-US
Cc: Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: intel/skl/hda - export number of
 digital microphones via control components
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Dne 26. 11. 19 v 17:29 Mark Brown napsal(a):
> On Tue, Nov 26, 2019 at 02:51:19PM +0100, Jaroslav Kysela wrote:
>> Dne 26. 11. 19 v 13:33 Pierre-Louis Bossart napsal(a):
> 
>>> Any objections if we take this patch into the SOF tree (without changes
>>> to authorship) and provide it on alsa-devel next week with the cleanups,
>>> so that we don't have any conflicts?
> 
>> I'm fine with that, if we don't miss the 5.5 merge window. Otherwise, you
>> may rebase your changes on top. Mark?
> 
> You've missed the merge window already - it was open before this patch
> was sent.

So, what now? Rebase on top of Pierre patches? You added another patches to 
your for-5.5 branch today.

I'd also merge the other two trivial component patches:

https://mailman.alsa-project.org/pipermail/alsa-devel/2019-November/thread.html#159158

				Thanks,
					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
