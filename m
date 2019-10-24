Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE38E3AE9
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Oct 2019 20:25:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3197F1718;
	Thu, 24 Oct 2019 20:24:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3197F1718
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571941522;
	bh=UPnQ2t0DqMlSwuZl/FcfPmy3am+MJwUm2Rg9ARtOxKc=;
	h=From:Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bXu9VeFRvU6M/rStmm4kb7+DbDGRI92pI1dHbbOS17Ktu+vfGoadkkr4zRxZWMoWY
	 L8vfCSACzRbab7dwcutl4JAClqdJL+2Dcs5kzE/jwUHlPBjZeyb02YOtfBCxfc9jNj
	 seIjmT75X75ttW9tYiBIR3uuCyknMQEW2fqxBJbo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40032F80377;
	Thu, 24 Oct 2019 20:23:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC1DBF8036B; Thu, 24 Oct 2019 20:23:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
 autolearn=disabled version=3.4.0
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33811F80274
 for <alsa-devel@alsa-project.org>; Thu, 24 Oct 2019 20:23:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33811F80274
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="F2nNcF/u"
Received: by mail-ot1-x341.google.com with SMTP id 53so9925247otv.4
 for <alsa-devel@alsa-project.org>; Thu, 24 Oct 2019 11:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=hCs2FuxbDBa/uwBY4Y8k7cKxguq9rRFLJ7isgBrWpbE=;
 b=F2nNcF/uNAU2yWtZgNDCggJBxm3JJDLnbvceCMTbZcUntbBcHhhoIzX+1Q6qiA4k/v
 yAUrapLUL87sFZsnTShkPD2HGJo2Mj86HRlRQTmQWycU1W83JXpg1D6/Rl72EGAcdf0O
 btp7W8B32vkJR/BKgQyb8FYVcYkhfA2cNo97uMNXqHjySCKRWZNPrsfAtRgRGE/4/QeR
 GqTx0WOJjMnEo/t0+KJrlNluWxuNT3o6pojV+thCfuq4Nc3wUX8o78P+PcqM6RVI2J+G
 6Bv2kf7e1LefJcPZlBN5cOn8RtXq2X1xUrbrX0l/yT++u4pFwVxJEjNgjpEweyqvbq4a
 KYdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=hCs2FuxbDBa/uwBY4Y8k7cKxguq9rRFLJ7isgBrWpbE=;
 b=k0+QO5RIaGo7PO+VAK/M5WZrA2SbbU8Jf2PmaMUgqxmcXmBEopzBeO3mB+Pho0Kkrj
 drkWDbyQks7gBv2eKErleqDJYsGj8U7wDi0FvgJ2nqaWplT5YhKRxVCgUAY3P5I5rTnr
 jfl4BsE/WCFbeaTmYozXqawvF3UEv+XlVpdQF0Gh+IkBvnde8hZdN74q2YDgKkSKsgLF
 bWV4FTu3i3IiGqUj6FndZZnsfDLy9YCYvWqt10KOVuyECaFv+LlG2477GZ29X7p20Ndh
 qtMzvAruIO3SkoQBe9SMmXG96GkaR2B4+6AYB9zBS1Cfl/cAx77ll1iGS9AS2bkdYDsA
 ODnA==
X-Gm-Message-State: APjAAAWlFT35Vnj3EQqYr+5iOyXkSoXIxV7aQzMdtOOwtbf26KIVK+CA
 c0T7ONYvAdSKVirMQVce08U5G5TQip91CmXYS+P0mA==
X-Google-Smtp-Source: APXvYqzxSnfQMJlcXU+5F1IsFWuQkXMN8JDnIO0ygbXFVEcHevekp0asJLH7pIIrSwMP/hNfWxSoyiDZa4W2egr59NY=
X-Received: by 2002:a9d:baf:: with SMTP id 44mr3613764oth.182.1571941409590;
 Thu, 24 Oct 2019 11:23:29 -0700 (PDT)
MIME-Version: 1.0
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 25 Oct 2019 02:23:18 +0800
Message-ID: <CA+Px+wUAzwf1kYD8eMogE9Y6Euw4_-itc5EPWU19c_Sg6+ypQA@mail.gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Takashi Iwai <tiwai@suse.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 jarkko.nikula@linux.intel.com
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>,
 Tzung-Bi Shih <tzungbi@google.com>, Benson Leung <bleung@google.com>,
 Dylan Reid <dgreid@google.com>, Hsin-yu Chao <hychao@google.com>
Subject: [alsa-devel] Questions about max98090 codec driver
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

Hi,

I am studying an odd issue of max98090 codec on Baytrail-based
chromebook.  The issue is: when user playback and capture
simultaneously, it seems the PLL never get locked if msleep(10)
between the SHDN off and on
(https://elixir.bootlin.com/linux/v5.4-rc2/source/sound/soc/codecs/max98090.c#L2120).
The playback stream becomes silent and the console keeps printing "PLL
unlocked".  But, if comment out the msleep(10) between the SHDN off
and on, the issue fixed.  I am trying to find the reason but facing
further more questions and may need your inputs.

1. The commit b8a3ee820f7b ("ASoC: max98090: Add recovery for PLL lock
failure") enables ULK interrupts
(https://elixir.bootlin.com/linux/v5.4-rc2/source/sound/soc/codecs/max98090.c#L2088)
when PCM stream starting.  If max98090 claims its PLL is unlocked,
max98090_pll_work() get scheduled to workaround it by SHDN off and on
(https://elixir.bootlin.com/linux/v5.4-rc2/source/sound/soc/codecs/max98090.c#L2106).

I feel it is weird to sleep in max98090_pll_work().  Especially, at
this line https://elixir.bootlin.com/linux/v5.4-rc2/source/sound/soc/codecs/max98090.c#L2125
(it makes less sense to "wait" in another thread).  Note that, the
threaded IRQF_ONESHOT handler and max98090_pll_work() are in 2
different threads.

I guess the original intention is:
- disable ULK interrupt in IRQ handler
(https://elixir.bootlin.com/linux/v5.4-rc2/source/sound/soc/codecs/max98090.c#L2260)
- schedule max98090_pll_work() to workaround it
- wait 10ms to give PLL chance to lock
- enable ULK interrupt again
If max98090 claims its PLL is unlocked again, repeat the above by
receiving another ULK interrupt.

Unfortunately, the odd issue seems not be fixed by my rough
implementation of these.

2. According to the datasheet page 164 table 90
(https://datasheets.maximintegrated.com/en/ds/MAX98090.pdf), there are
some registers should only be adjusted when SHDN==0.  But I fail to
find max98090.c tries to set SHDN to 0 and restore it afterwards when
writing to these registers.  For example,
https://elixir.bootlin.com/linux/v5.4-rc2/source/sound/soc/codecs/max98090.c#L1897.
I am wondering if it would bring any side effects because the
datasheet states "Changing these settings during normal operation
(SHDN=1) can compromise device stability and performance
specifications."

3. By searching some history data, I found a previous version did not
have the msleep(10) between the SHDN off and on
(https://crrev.com/c/191740, click the file name in the middle of the
window to see the diff.  Pardon me, I do not find another public
repository for this).  I am curious if anyone of you still remember
why the upstream version contains the msleep(10).  I am also curious
if anyone of your environment works well with the upstream version
max98090.c.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
