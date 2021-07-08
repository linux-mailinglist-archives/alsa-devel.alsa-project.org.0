Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBC43BF9F6
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jul 2021 14:21:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 052201654;
	Thu,  8 Jul 2021 14:20:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 052201654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625746866;
	bh=nzbQtAXelnOhqd2lgPAB9ckPY2/al6VwXYmakKgDkTM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Um3x7vpW2dSPvqHuIml/45/kkCcH16rZWuiMg4DDhl47RWUmWHDOE/fOqhU9/A3kB
	 QIO7wXNIVMOt7D87CHFqPGMlQ18+0HWJQFhC3fQQovptK948HikYQoRb5ljT4oIIih
	 eyTeFqQlPErrjigVKqThAe1NAGQ1QXA7Y1+jwN5w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B8C6F80259;
	Thu,  8 Jul 2021 14:19:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98FE7F80249; Thu,  8 Jul 2021 14:19:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C280F80143
 for <alsa-devel@alsa-project.org>; Thu,  8 Jul 2021 14:19:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C280F80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ILX0wAE8"
Received: by mail-lf1-x135.google.com with SMTP id p16so14937310lfc.5
 for <alsa-devel@alsa-project.org>; Thu, 08 Jul 2021 05:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BwwQoY7unULfZhxr21xDtaltSqz8xw6dhmDwf2eJiFk=;
 b=ILX0wAE8rAcajasYuhIxnZRr4/YTlEhjc1tn2ZA4VEyCtGq76dYDwFZLWUoyCRyNkA
 cVtNSXcOqBPPB1PpuCV/yteIrOOv9JeBZVUaESS9EjkHvf7EFE+/oiVE3X8FWb0P/fHW
 kaG3g+yX4gNTBpjs58EC1GLNcPprT6rQyzngHTnLUZT8dMU8nrngP5b61d1cc0L9p0mG
 R0p711o/4nlJdN5X57YlW96iwJSwKpiEEEqKKe72D3cYQpYU12P33c55D+xKBa36+ZEk
 37TCWNuHULHIM8PFoDBeswl46TWjkvp/u2G/BAPPefnNd4/viKqryj6WxjVEuBFCwkuW
 egQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BwwQoY7unULfZhxr21xDtaltSqz8xw6dhmDwf2eJiFk=;
 b=RCQwMFhz4wehlIW70gOdyudRGTMSKj5U+oF2+TIAWprYFqHdYY3CWxA8Hou3cvZl9X
 FQSGEmF9fpuNYFG4r1LpDPfRrPZOMTdRkwQTU1ZlCl/zRx0J74n6khhhL7BK+OTCk6wG
 WyQZweMF/BITJj1IuJDb9Rz36Xax3u948Yh9JLMd9gjKUP7hx6CMMF5Z7e/zoaxKDc/W
 bGP+3c06on/L3F7otRi9zhzR+rmhOkfafosPRPkaEAFd+lWM368ssozxCfhPFRhm3+5T
 ukYhDlp/9el6dVlQAKwO6SoVB0cSyQXAPz+Z6qM7YHr7ETfa3yNpwxWJBRXPl2b104ub
 Qc1A==
X-Gm-Message-State: AOAM5312f8A1uoUXMMp9kNLRXfgssgmoTEJblZSjBP4fZyoti/Gi1SM2
 FohMQib6EXZ/yO8eNRRNfoPFW6DJFlX6CAQfTfU=
X-Google-Smtp-Source: ABdhPJxfkFozeW7UT4e/C07llwQ0GcDVmWREp3J7po5Zz3/Dx8O3S9+3uzduCoscqUhJq5xf30NwLRWpc6slX6vKDbE=
X-Received: by 2002:ac2:485c:: with SMTP id 28mr3055409lfy.549.1625746763929; 
 Thu, 08 Jul 2021 05:19:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAHhAz+h9=fMu7jLfmzZF2XMWAT=JBLik2WSSbfYtLg3kmzqWtg@mail.gmail.com>
 <s5hmtqx59hm.wl-tiwai@suse.de>
In-Reply-To: <s5hmtqx59hm.wl-tiwai@suse.de>
From: Muni Sekhar <munisekharrms@gmail.com>
Date: Thu, 8 Jul 2021 17:49:12 +0530
Message-ID: <CAHhAz+guERMjmT_bRrgWzMoKkH2S0Zv0JatjpbNJZnLj+RyxXw@mail.gmail.com>
Subject: Re: trigger timestamp
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel <alsa-devel@alsa-project.org>,
 kernelnewbies <kernelnewbies@kernelnewbies.org>
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

On Thu, Jul 8, 2021 at 4:59 PM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Thu, 01 Jul 2021 01:41:29 +0200,
> Muni Sekhar wrote:
> >
> > Hi all,
> >
> > >From the user space test application , Is it possible to get the
> > trigger timestamp corresponding to SNDRV_PCM_TRIGGER_START &
> > SNDRV_PCM_TRIGGER_STOP events for audio playback capture?
>
> That's exactly what trigger_tstamp of snd_pcm_status corresponds for.
Does aplay and arecord have any command line options to get the
trigger_tstamp? If not how to get it?
>
>
> HTH,
>
> Takashi



-- 
Thanks,
Sekhar
