Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A403581A5
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Apr 2021 13:23:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B37CB1658;
	Thu,  8 Apr 2021 13:22:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B37CB1658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617881014;
	bh=8vGboLGcjBLdL6MJY+70vq4F2370Drh3TUOd2TgXsJM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EGppSTEHnR1OV++cgh0MbwM+4T43LDgrYl+X6Wchmd4+Q8ynAPu1M0cK9HvgLH5aU
	 R5pnAy4T6QlGqjvQ7YRqMfROO8Ju8mqA+v2Vg6eY29LXu1RDf5FfqL27qpzO5nkrqK
	 65fT5CnGa9fF7GadS5BQABqtm75qgvasbmklgn44=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0A42F80246;
	Thu,  8 Apr 2021 13:22:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 278A9F8020B; Thu,  8 Apr 2021 13:22:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7EA2F8012F
 for <alsa-devel@alsa-project.org>; Thu,  8 Apr 2021 13:21:58 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id BD072A003F;
 Thu,  8 Apr 2021 13:21:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz BD072A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1617880917; bh=P2Qy9u8HgF/GEeGrO92dqrH5Rlvcn2v/3ZUoBae8U6A=;
 h=Subject:To:References:From:Cc:Date:In-Reply-To:From;
 b=Yf2NbFOFHkQN9slZwmryR03elut/slTGI9lkdbriYbBhlG0I7eapT4hH08t4KzJFR
 pmEDI5rKHzMS5Xnt4k+PaNxCgoMtcPCKxAYg8uQ7wfgNObnyw7h6KK/mLeVKCfBYVv
 OjGA91i8dzpePcv3jcZrrCSgPm5THenczpfLoTgQ=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu,  8 Apr 2021 13:21:52 +0200 (CEST)
Subject: Re: [PATCH] ALSA: core - add more card sysfs entries
To: Takashi Iwai <tiwai@suse.de>
References: <20210408094314.1322802-1-perex@perex.cz>
 <20210408103819.GA40407@workstation> <s5h35w182a5.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <45acc908-3603-3479-9fb2-5206339a9ace@perex.cz>
Date: Thu, 8 Apr 2021 13:21:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <s5h35w182a5.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>,
 Pierre-louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Dne 08. 04. 21 v 13:05 Takashi Iwai napsal(a):
> On Thu, 08 Apr 2021 12:38:19 +0200,
> Takashi Sakamoto wrote:
>>
>> It should be done to emit snd_ctl_event when changing card parameters.
>> Silent change is the worst since many userspace applications can refer
>> to them in advance.
> 
> Agreed.  The changes of those names during operation is fairly
> intrusive, and can bring many side-effects.

The event may be nice, indeed. The locking is also not so safe. But it should
be implemented separately.

> Any reason that mixername and co have to be changeable inevitably?
> If that's about UCM profile and its selection of the hardware
> configuration, can it be another additional information instead of
> overwriting the existing strings set by the driver?

Thanks for the discussion. I expected it. The ASoC drivers set all those
parameters in an inconsistent way (nobody verifies that) and I just propose to
fix things at boot in the user space. The goal is not to allow the random user
changes, but to modify this settings via udev in a persistent way. Also,
another firmware can really make the card different from the user space view.

Yes, it's for UCM, but even if we don't consider this purpose, the kernel API
should return some reasonable information rather than very generic (or empty)
strings which are used in the native ALSA utilities for example. So, I think
that we should allow to "fix" this info also from the user space rather than
to extend the existing API.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
