Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD17AE4E5
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Sep 2019 09:50:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C302A1669;
	Tue, 10 Sep 2019 09:49:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C302A1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568101827;
	bh=yqreMmyMa4A9fOG8JBzrwwGIZcK/vLr2L7YAKl6buis=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XlZDHQG3KpzVVYMAbFCOlqYzcgIeqVcbAhm7J3FFrQFxj4+VYiPwPO6EpE/1WHOAT
	 57XbruxMqmwyFQsOo4sVNoXMm5XaSsSvNL+T1GZaWzJ3jj5yI7mP0/n4MfN6H0JPLk
	 bB4yUrFG4tejeowhviIdQGccWzaTTlFTljkyjfPQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ECAF2F80393;
	Tue, 10 Sep 2019 09:48:42 +0200 (CEST)
X-Original-To: Alsa-devel@alsa-project.org
Delivered-To: Alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ACF25F80368; Tue, 10 Sep 2019 09:48:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE, SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C72EAF800A9
 for <Alsa-devel@alsa-project.org>; Tue, 10 Sep 2019 09:48:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C72EAF800A9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="a2wNqDP+"
Received: by mail-qk1-x736.google.com with SMTP id u184so13123032qkd.4
 for <Alsa-devel@alsa-project.org>; Tue, 10 Sep 2019 00:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rAkZAbPk45Xqj5GPzfuHxRQkdHXONlTh8pgGL9L8DPg=;
 b=a2wNqDP+jwaKbO67xLKnck1VvXxV87H3YiaxqWbBdDBFgucK4Xxowzuhzsz6qZlc2p
 26N/y0KSVlMGfGfHldHdElGPn47EdRhdmQ9mReSwnAFjNa4lWGo56H6TnfbW5jOrHI2w
 bhXgvPvi6davBuRR321lAYTAMouAFXuw1X91Ol/bQaeNp1LmDOtS/XavMW2R/AYd3q0T
 n+4I8ROqH+RKjqlN1HBapWrYSzu18gicK2dbBdqCCi4OyZN7/gWuoROmDXZDZYlEXUDu
 s7nIGKIsgyS3sHl1wn5wzeO8v1almdwzdaKQVjzw0J8+B1gehbAaVAm3XB4ssZIopY/u
 E1Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rAkZAbPk45Xqj5GPzfuHxRQkdHXONlTh8pgGL9L8DPg=;
 b=gL145GR6EeIxhjx1ZIYTJz/dGjkNiZgYg5o00+MP46W0787kOL8M2ymhZcYiukRW3p
 gYeg3w5QSrKjlZ4E9BGPgdL8Z1bJk9uj5lO9uSw+VQpZxJ+NVLpE2sP1tbkI8/hGJUDH
 FN5GDp7M4ZJ4WNY2bZztVSRjqQ48YbhTCxtqVCmwcDHekTtoINoOPZnEbbHlfENIoU1M
 QlBIX2wnfFv/uhAdRwSi46K6mhcUUmMWaVhHZTANvAvR+jWPWaT6FRDYFYFM65ahcVrL
 uLNybuFQ/OPem4jhRjhEsem7TtdHJwrHf6qs56HbdFVieAAUAOHYBoDAyt/S/gkfBbjr
 sh3Q==
X-Gm-Message-State: APjAAAWEtwnp8jrLWA0Z8qfYBS43WmF6KB6aZU3WbyYT62k5gJvToch+
 mZEnbePHM74ApuiXHNOTYf0/Ha/C3znNcaMneWw=
X-Google-Smtp-Source: APXvYqx4c1DZsoeVx6DtWA+z0Toecyr4zsNKSHDKcW1PiB/gFW6ogXR8pLvkLpTaLsO0B/FZpRd8dXzvIwewZL8D8do=
X-Received: by 2002:a05:620a:1393:: with SMTP id
 k19mr6032588qki.35.1568101715898; 
 Tue, 10 Sep 2019 00:48:35 -0700 (PDT)
MIME-Version: 1.0
References: <CA+SWvNx9hGJN0v9erykioJUKyd726VzfP4b77u0RUHh_mgFooQ@mail.gmail.com>
 <CA+SWvNyUAyBQd9ktaZpvV8R7XcK8opA1_VQeMEnPfmr6jcSANQ@mail.gmail.com>
 <s5hzhjd9xg4.wl-tiwai@suse.de>
 <CA+SWvNw_=Fj_3M3sqVP767OOR+YDY=6-rPtPgmGXg+BcvuG3oA@mail.gmail.com>
 <s5h8sqwaabt.wl-tiwai@suse.de>
In-Reply-To: <s5h8sqwaabt.wl-tiwai@suse.de>
From: Pavel Hofman <pavhofman@gmail.com>
Date: Tue, 10 Sep 2019 09:48:24 +0200
Message-ID: <CA+SWvNwLUzPknid7ZDq114iX8zxMhayRvdxmLMxdDtq9AV3FbQ@mail.gmail.com>
To: Takashi Iwai <tiwai@suse.de>
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] Measuring Device Throughput - MMAP vs. RW
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

On Tue, Sep 10, 2019 at 9:18 AM Takashi Iwai <tiwai@suse.de> wrote:

>
> The value read from snd_pcm_status() should give the accurate pair of
> the position and the timestamp.
>
Thanks. IIUC, if I call snd_pcm_status() in that mmap_commit method, get
data between e.g. 10 seconds, and divide the increase of status._ptr
https://github.com/michaelwu/alsa-lib/blob/afb2fbd0e554e42e51325c3197a176ea96a74203/include/sound/asound.h#L422
by increase of status.tstamp, I should get the the most precise available
soundcard rate estimate referenced to system time.



> You need to check the delay count as
> well, which compensates the in-flight samples.
>
>
I need just the rate at which the soundcard consumes/produces samples, I do
not care about time at which the sound is being produced. I do not know
exact meaning of the delay field. Is it involved in this calculation?
Please is there any exact detailed description of the status fields?

Thanks.

Pavel.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
