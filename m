Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4821AE2223
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Oct 2019 19:55:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C108F1660;
	Wed, 23 Oct 2019 19:54:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C108F1660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571853323;
	bh=VMjImAL9C2DOqOMD/hBxjr8sQYUVOp7AXlLBaVWO+l8=;
	h=References:From:To:In-reply-to:Date:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TmjneCvml91WKzbFcJ2ejg9T4q5SHH9ID8WU6nk+9tibkx1bEemXNTnZAIKG/Y/IN
	 XqBcPylVXLo3ysyyK0PQUv23FP8mn921VmGXPkrD777c8Ybc+JVN2xhZ8nRns3Twfw
	 S7isx9eqGLogFhAldc3yP/VXNcZuzIEEaBfqjsR0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01561F80393;
	Wed, 23 Oct 2019 19:53:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9B82F80368; Wed, 23 Oct 2019 19:53:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34749F80112
 for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2019 19:53:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34749F80112
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="B4JsPq0L"
Received: by mail-wr1-x444.google.com with SMTP id p4so23082879wrm.8
 for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2019 10:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=Pd1hXIbyhKvoq4Ce5+sJpjUPNTW4sF25HitKZRQWVXw=;
 b=B4JsPq0LniaQyv7ddF8xlzipH8jpJjEDYGD/tK+Xo/3m1MT59+5PrNAWgDYT1tn0aG
 U0Rg0fgVroScAIzNCEbfrCAA3lMCE+u9rK1IhABFJX29n1lWNsw9JhLZygsvDShiTak+
 DiwcUt3XsAcTGcNS2i1QqozEN/v/MI791M7AiIOvHsZPoPNPEPYqYPpMYE35iGZ24N9l
 lSLOcdXUxBq+aptYNUfjawsJcSBo6V9FP8NTEApy0szgfq1XL+GbgcnDwvkBre76ecsC
 S4LKqNNqFKjl/7ieLyQpMcCZN7EtGwBgIw1E/JrVq4QxMMEyTM1MRiWf+3mTeBgnYD5Q
 P1yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=Pd1hXIbyhKvoq4Ce5+sJpjUPNTW4sF25HitKZRQWVXw=;
 b=fwg/gfxI3lpKpC5C8me04KWTXS2jW+/w/K3WQl4hMrVfuBKQKhRp+WhHHQpFC71jQE
 pTBTMQlG3SF+Ea8SU0cRZuXb7RMAwYLpNyEG/lHNQORM9jbQCUG3nblZjkfbO1WzgFzU
 v88qqPf++SmPjH//rWXgnFnesfyX24OOeUfroxyHEc6SOy3MCPUUrZ5U2/qZKtKb2x8U
 UEFTJuK1AjxLadIfayunUDqKwgpw3EkKIij2A7K2WFy0FLYQdW2KsF9xvpvP7pog4ioa
 xW9w7PzjrjbpaJ9jlGVTJHOyq0XyEFijHByNstZ92Rr8XlaK51KUQujwExnya13KETCa
 gHuw==
X-Gm-Message-State: APjAAAWLEF7ivMP3YrW/JyzuDYXuIniSfY0zwKqABr+gf9tmeAjMGA6k
 84DC8PnslozeHlRi+xEhdkoy6A==
X-Google-Smtp-Source: APXvYqyV3FVHmPnXhN7309BG4pPr+cmN8g3UWW39XvABLAOl0v0PrEKVunEVe6dkZuTaCi3CQve2fQ==
X-Received: by 2002:adf:ee10:: with SMTP id y16mr9507135wrn.67.1571853213196; 
 Wed, 23 Oct 2019 10:53:33 -0700 (PDT)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id f143sm39085313wme.40.2019.10.23.10.53.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2019 10:53:32 -0700 (PDT)
References: <20191023161203.28955-1-jbrunet@baylibre.com>
 <s5ha79rph1j.wl-tiwai@suse.de>
User-agent: mu4e 1.3.3; emacs 26.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Takashi Iwai <tiwai@suse.de>
In-reply-to: <s5ha79rph1j.wl-tiwai@suse.de>
Date: Wed, 23 Oct 2019 19:53:31 +0200
Message-ID: <1jv9sfcpr8.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Russell King <rmk+kernel@armlinux.org.uk>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH 0/2] ASoC: hdmi-codec: fix locking issue
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


On Wed 23 Oct 2019 at 18:23, Takashi Iwai <tiwai@suse.de> wrote:

> On Wed, 23 Oct 2019 18:12:01 +0200,
> Jerome Brunet wrote:
>> 
>> This patchset fixes the locking issue reported by Russell.
>> 
>> As explained a mutex was used as flag and held while returning to
>> userspace.
>> 
>> Patch 2 is entirely optional and switches from bit atomic operation
>> to mutex again. I tend to prefer bit atomic operation in this
>> particular case but either way should be fine.
>
> I fail to see why the mutex is needed there.  Could you elaborate
> about the background?

You are right, It is not required.

Just a bit of history:

A while ago the hdmi-codec was keeping track of the substream pointer.
It was not used for anything useful, other than knowing if device was
busy or not, and it was causing problem with codec-to-codec links

I removed the saved substream pointer and replaced with a simple bit to
track the busy state. Protecting a single bit with a mutex seemed a bit
overkill to me, so I thought it was a good idea to replace the whole
thing with atomic bit ops. [0]

Mark told me he preferred the mutex method as it simpler to understand.
As long as as it works it's fine for me :)

I proposed something that uses the mutex as a busy flag but it turned
out to be a bad idea.

With the revert, we are back to the bit ops. Even if it works, Mark's
original comment on the bit ops still stands I think. This is why I'm
proposing patch 2 but I don't really mind if it is applied or not.

[0] https://lkml.kernel.org/r/20190506095815.24578-3-jbrunet@baylibre.com

>
> IIUC, the protection with the atomic bitmap should guarantee the
> exclusive access.  The mutex would allow the possible concurrent calls
> of multiple startup of a single instance, but is this the thing to be
> solved?
>
>
> thanks,
>
> Takashi
>
>> 
>> Jerome Brunet (2):
>>   Revert "ASoC: hdmi-codec: re-introduce mutex locking"
>>   ASoC: hdmi-codec: re-introduce mutex locking again
>> 
>>  sound/soc/codecs/hdmi-codec.c | 15 +++++++++++----
>>  1 file changed, 11 insertions(+), 4 deletions(-)
>> 
>> -- 
>> 2.21.0
>> 
>> _______________________________________________
>> Alsa-devel mailing list
>> Alsa-devel@alsa-project.org
>> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
>> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
