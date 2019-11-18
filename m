Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1549C100C6F
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Nov 2019 20:57:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93472168C;
	Mon, 18 Nov 2019 20:56:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93472168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574107043;
	bh=AmcR0OEnpUntJKnWYAtE5pdGoviKAFKc+aD/GSnXcDU=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A7vV6NP1SFPjB/LI9eUBxdrcl+Lrfp0tjG23HvHBfPG5gx/ROyQ/sSOKv/LatNACc
	 7iIyptDvtR+uTdqVJdyr4tNFYS3oXQyzHo6S0sDJsqPic/EmQdfBinRd60BqTWzOqu
	 pTPCsuUWmNiUMQGNAuYNn7TmEIPyHH7AfGJPnswU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B969F8013C;
	Mon, 18 Nov 2019 20:55:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29D0DF8013B; Mon, 18 Nov 2019 20:55:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03BFEF800F6
 for <alsa-devel@alsa-project.org>; Mon, 18 Nov 2019 20:55:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03BFEF800F6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="nC02nqXN"
Received: by mail-il1-x144.google.com with SMTP id u17so17192352ilq.5
 for <alsa-devel@alsa-project.org>; Mon, 18 Nov 2019 11:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RFrhqVogoYJP6CGXmHBk7GxTvRtEu48GFu1M+QGTaCY=;
 b=nC02nqXNIb0TCXpz2I2YSkIKvA4YuJXz1Q0tOrwqF9mwTWrxJHryZ5GdQCArtrw0NO
 Yqp+Q4ZrNp3Bz7dD1S7LuF5twMIVrNENfVPWryyU29sy1w3hjK3IaDTSOndTWp4TGL/+
 y7xNEAHWXVHgQlaoAvi1vqGhINCP5Z2wIllFQv9O44nZ6Hmk+LwK3KwbrgKDtyG8n+w6
 jWcDK8EhY+qHAqM1cCOQrw9IE4HwcOvjwnK92vpziQEE5mSmuENZVVA9Z7M7nIrRGChf
 YJqRfaQI2/qad8Dhin3urRimzILUDlBlzrtFgtW+N4P+wVHizhYL2xgitD+VfnKICks5
 7SdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RFrhqVogoYJP6CGXmHBk7GxTvRtEu48GFu1M+QGTaCY=;
 b=BoSpRK5ED2A7xb1YRrWSxT4VgPVMvtII1RZPmdU8eHzCxR4aympTWCURmD/wwrOj+E
 zWmppkpcgziPsSO43W1+thqgySMfkrGAX0bqEyLZ0ucVxoWKKQmjZqL8bqHfBTJnhsfi
 ofopSZUd28bNj9RWmuxNUoj4qJfQL1jKkwd+ctQyD9VShD0HxoJIqG7+dMVp6W8U/d3V
 zLAIo5kSXtYtQAX8oswLiFmNLlwXha7dh3YgE2Nw+tKDAPHmA/I0E2w9iX9r05wLx+Bs
 15Y5cAQSK8gLTcLcXyB9iuJxxVytSGzcUwz4Nv1eRD4RIYu/KTX04CvWfn93ey6Z6wyS
 z9kA==
X-Gm-Message-State: APjAAAUqi61HZuuLnz8iQe9gctNz5GhnHBaiEGCtN6uDBPS6jptpYBPo
 qOSpoSLz2WE5wIatNNE6JCAmNw0FPlNQCrEJpHwpvg==
X-Google-Smtp-Source: APXvYqx/Xt9zeZwgX7gGCkIMwkvyPwYkWXSsK0JmoAevSpkslJCUVkCHQWj5v1Ab7+m1EPF1FGuYZorx0ZjRNzhiv6g=
X-Received: by 2002:a92:8108:: with SMTP id e8mr17423199ild.209.1574106930641; 
 Mon, 18 Nov 2019 11:55:30 -0800 (PST)
MIME-Version: 1.0
References: <20191117085308.23915-1-tiwai@suse.de>
 <20191117085308.23915-8-tiwai@suse.de>
 <3b407a02-b791-52a4-2335-e21d8ab732dd@linux.intel.com>
 <s5hy2wdyq3t.wl-tiwai@suse.de>
 <CAFQqKeWgqHwrCSSbLrkuCHkBww2g4dsBcF93SDN_ZK_-KSe5tg@mail.gmail.com>
 <s5hpnhpyng6.wl-tiwai@suse.de>
In-Reply-To: <s5hpnhpyng6.wl-tiwai@suse.de>
From: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
Date: Mon, 18 Nov 2019 11:55:19 -0800
Message-ID: <CAFQqKeWPgPWpDgZUPvOqSFUY2Zq=8zW-=LhYimtg0S0Hqpc43A@mail.gmail.com>
To: Takashi Iwai <tiwai@suse.de>
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 7/8] ALSA: pcm: Add card sync_irq field
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

>
> >
> > Thanks for the clarification, Takashi. But just wondering how would one
> pass
> > on the sync_irq when the snd_card is created? Typically in the case of
> the
> > Intel platforms, the card->dev points to the platform device for the
> machine
> > driver that registers the card and the PCI device is the parent of the
> machine
> > drv platform device.
>
> It's completely up to the driver implementation :)
> You can implement the own sync_stop ops if that's easier, too.
>
I think this would make sense in the case of the SOF driver and we'd
probably need to just call synchronize_irq() in the sync_stop() operation.
With this change, we can probably remove the workaround we have to address
the issue we were facing during snd_pcm_period_elapsed().

I can give this a try. We might need to run some stress tests to make sure
it doesn't break anything.

Thanks,
Ranjani
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
