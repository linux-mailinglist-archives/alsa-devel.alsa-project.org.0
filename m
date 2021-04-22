Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B3C367844
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Apr 2021 06:11:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71072166B;
	Thu, 22 Apr 2021 06:11:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71072166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619064719;
	bh=RUqaXRv9AUjHegjpDbtmxaVa/Lt0jqRw+z12dNllfcU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YkCwkPEFg9JLswDBtqJhKAiM2GQGeiNhLfUy80Jp81vqlQwZNsdYDGTRqD6At9Hjb
	 N8qs7rAhFlKui+7q4NQwG5u8fhrKXJe7bzpiQ982LXVW8t5Ho2yIf6iu3Hj1NqNtIw
	 HOedMoZ6143lwMd0iwRxl+AeK/4jDzQBSpKf+/wk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8634F800AE;
	Thu, 22 Apr 2021 06:10:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3DCF5F80168; Thu, 22 Apr 2021 06:10:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6FEFBF80059
 for <alsa-devel@alsa-project.org>; Thu, 22 Apr 2021 06:10:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6FEFBF80059
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Jayp6m5n"
Received: by mail-ej1-x62e.google.com with SMTP id mh2so45093407ejb.8
 for <alsa-devel@alsa-project.org>; Wed, 21 Apr 2021 21:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v2q1sdHWVh4lUHAPbXupBAtzX4TddfycZ+VOLF7cBrY=;
 b=Jayp6m5nCSMvGoHLujanhnnAQrax+x0nOJsdvAkr76mmfpDYr1YAbO0mV6T/6rNaVR
 9KPHA29JVZVnwEgaKA+xaWLNTy1LYNwRgmHlshab7GP3kc/4fAVAG3/MRLmDpeVr64QA
 hyK38VnHfwdgHp/Vt8JEjbxtezPMXxSdf5EUxrDJ+3PN03EkGc2ePyuXrWawUMmCTiy2
 nLkNPKEbHKFgPmnfYYbs7Yt6OpPhlpSpi1W/NXKnNf8ZwUZWL/lieim4IeshG3XwnbJf
 21tOSlFfkdRwBTYXyS+skPkTT3/A4tHNZOFsTIgL5kn88n0kJKHgBcsv8JgA0QjjKixp
 aMDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v2q1sdHWVh4lUHAPbXupBAtzX4TddfycZ+VOLF7cBrY=;
 b=qaNrg8yTyXsAP3DYmz5lugfWIcHXxBifI4hCHq0azAfJspMfdnmOOSfmiCRLxKh0zM
 24tAqdb/tF+0mSx0HSTywjQtHab/wm1+JXKQ40z2cFYbSa+e4PhKgq2oeb6iMLotoRYu
 buVeArQ4REsNwPxVuFYmUOGbqElvmRlpAsFuFBX8D5ZFWnS5tNxjDoGBi80zRCcdzH2K
 4POoBXdbaQSp6LefICckADloQX1BKNwzwkLfCbiVq5OwgoK843NoyNjC4HZPiTPfBZYq
 Pz04oQZVjh2Lr0azeWPXHqBuDtWwpGkNFvWP5e6h4vPhQDa3rzhUEBgd7PxM7WVihm5d
 OeEw==
X-Gm-Message-State: AOAM5307LDnrnAzYbsooZLm2UZYbQ9P2Yzf1G0scknxJa2Q0HdYdZelv
 l65cnt7q7A6PTyOHNZ8+ImKDtliidsucLEqwW+c=
X-Google-Smtp-Source: ABdhPJylCil3yWKdBmF2QDGmLoJcHiu6Ee1ud8INW4bXfdCvl3PxrO7+pfhnaYRzSnLavlNeSLrGWYDy8xuUjAUZXwc=
X-Received: by 2002:a17:906:4eda:: with SMTP id
 i26mr1027645ejv.301.1619064621758; 
 Wed, 21 Apr 2021 21:10:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210414083255.9527-1-tiwai@suse.de>
 <CAHXb3beNczUn-KWfO9P1Pa5+3piR8fDYHvoH5G08GmcvgR4Lxw@mail.gmail.com>
 <5949663.lOV4Wx5bFT@kam-desktop>
 <CAOsVg8p=yikaRQ-=RWdO8nWdC70tnw4kQ17KM-smShQvujrRJg@mail.gmail.com>
 <CAOsVg8pY80Vgi1XhzzFmQ4bBxK+1boksw7RM7_avMd4hqE0ERQ@mail.gmail.com>
 <s5h7dkwdib8.wl-tiwai@suse.de>
 <CAOsVg8qs+UZ2+G_0Pq=Vm87E+75jYg4Fg4eAaNTJzs=wFE5WAw@mail.gmail.com>
 <s5hlf9cau80.wl-tiwai@suse.de>
 <CAOsVg8rCkpBAKkuqUGxt55xGo4D=7RZC_A7CAbQgpG1yLWtHVw@mail.gmail.com>
 <CAOsVg8q8KNfaqW0bm90HHUcjqDMCU0etrNY7dhr8TuoMHYZcuA@mail.gmail.com>
In-Reply-To: <CAOsVg8q8KNfaqW0bm90HHUcjqDMCU0etrNY7dhr8TuoMHYZcuA@mail.gmail.com>
From: Lucas <jaffa225man@gmail.com>
Date: Wed, 21 Apr 2021 23:10:10 -0500
Message-ID: <CAOsVg8qo+wNg9MXVPL8EawHhgNkBKhTg0GSLwo8cmVDd1rxsPw@mail.gmail.com>
Subject: Re: [PATCH] ALSA: usb-audio: Apply implicit feedback mode for BOSS
 devices
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, "Keith A. Milner" <maillist@superlative.org>
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

Sorry, for my typo.  Here's the correction:  "Thanks for your grand
achievement, Takashi Iwai!"  (It ran through my head just after sending it
as these things often do for me.  Too bad there's no after-sent edit option
for email.)
