Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CCAD235761C
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Apr 2021 22:32:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BA593E;
	Wed,  7 Apr 2021 22:31:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BA593E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617827550;
	bh=r0qea766oAB5hQ3fUOlsZ6YTI++yK8j1boe+/Qo4XIU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CPuVQTS+po4mlRvZXx5IR6O37hGCtRgrtOo9HzfB+TbBWmoojnvzgYYLox7oTwpQI
	 ny9ik7e+ms/SY/IAe8ZrhoSDCOh7vmMMMomdPm1r1fc4tMuofxuxDY07vEqgC4JSki
	 w9GOObli/kOEa5WPizyXL+97M4qUHYSnBjVDP2x0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1FA1F80124;
	Wed,  7 Apr 2021 22:31:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ABD95F8016A; Wed,  7 Apr 2021 22:31:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A317F80162
 for <alsa-devel@alsa-project.org>; Wed,  7 Apr 2021 22:30:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A317F80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="uzbg+CPe"
Received: by mail-qk1-x72f.google.com with SMTP id c4so20205552qkg.3
 for <alsa-devel@alsa-project.org>; Wed, 07 Apr 2021 13:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JwKCp9Lz/80qBThTvGuf45g6v/uJIi9oLorowc68LXE=;
 b=uzbg+CPewwTpUzFqZMmDIqVwEMwF9ddzQXWGXxbICmpKv/uuBDSB/BO7u4JbxOf/jp
 FutyHyLNzFIgnyvN1d0tZMcO1uzQPCgjESGmw5O8x/t6vddFNYCD6hfbbSsA0SzZ10Rv
 HF2/uregCRspE9vDSuI93OnbL7poMx0FR2K2Hzy/xBfeMYcLJxDqoyFdwny9daS18jWR
 US/MxwpzEpE8Edvaa3h+h22KaDm6O1ye42Hd5Ns/yaPvBrhSCJCL3bM7R5fJ3z6f3VyX
 YCgXci3aLeF7Kl/HzXjiaNo+dvESl8W8pQSxR1NCzotAmwlqDScoVwZqLBcZ4WZBFTbU
 MErw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JwKCp9Lz/80qBThTvGuf45g6v/uJIi9oLorowc68LXE=;
 b=RcvR7spfoLD7j2W2xnQV7djJ4I0OClGMQkZA2Kk2soH/BtEskyokBAPXR8EwfLNZk8
 tu2OttkSKiv/JRNTd0SMftBOW9/VDJXxwZSH87ojhjMUeGAgXrvu+PZFNSzbw7KKAMYd
 TRE4XUFtyVbn4F+TaqrgSu8Z3amlXv74U2+0alOEPFEKzGJVXG7UB4BDggcPI85iXUMJ
 iLFNkJ4kCtVCtKQp7lfIM53BgKf2TERuPpX9K2Ez0Gj+UdEEYbOaQV0eBavAPNNWO+Dr
 nY7EG726XHzudIgWsaYf8TTjlQriY1lgXIfVz+8MK2nOfLZjcwOCfiFns9Nbl3brGLFG
 w0hA==
X-Gm-Message-State: AOAM533gcciuup0Bqte4ZnQv7vxkqkqiBimcPDQSTKrXOUC9QCw4dRIq
 SZnHl/L6Rhcm8Jcoa7nKBP8XlzqlDvMR6JghoRo=
X-Google-Smtp-Source: ABdhPJyMS35X3XshyFNHf6vi0Q8Ryrtt9MYzeRGMKUeocSjnO6NAM1HAoT4OjeFBwC71//03faLtzW4ChfAKs70HBWc=
X-Received: by 2002:a05:620a:10a6:: with SMTP id
 h6mr5099979qkk.366.1617827448924; 
 Wed, 07 Apr 2021 13:30:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAHXb3begced9GYCQ4a6qLOK2PrQR9gHeSvb3HAG29DVpZ+vwiQ@mail.gmail.com>
 <CAEsQvcu5freEXMFwBRH0aQsT9=ngvOY_SkA6dmfs_YVvMYYuJw@mail.gmail.com>
 <CAHXb3bddyVMXrZHxmtz5AM4j7TRwWSbZcLM94JjcbOMfrd4+2g@mail.gmail.com>
In-Reply-To: <CAHXb3bddyVMXrZHxmtz5AM4j7TRwWSbZcLM94JjcbOMfrd4+2g@mail.gmail.com>
From: Geraldo Nascimento <geraldogabriel@gmail.com>
Date: Wed, 7 Apr 2021 17:35:30 -0300
Message-ID: <CAEsQvcs+-O_eGW928eLdbde9EhWiD3qxjCuv2iW477DZDprkBw@mail.gmail.com>
Subject: Re: Implicit feedback on BOSS GT-1, the saga continues...
To: Mike Oliphant <oliphant@nostatic.org>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org
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

Em Qua, 7 de abr de 2021 17:16, Mike Oliphant <oliphant@nostatic.org>
escreveu:

> Hi Geraldo - I don't have that patch applied, but it shouldn't make any
> behavioral difference - it just seems to be simplifying the code.
>

Point taken.


> The issue is that the BOSS GT-1 *does* need implicit feedback on playback
> to avoid clock timing issues, and the current behavior is disabling that
> feedback.
>

Mike, would you mind posting some dyndbg logs for both the stock behaviour
and your endpoint.c/generic quirk modified behaviour?

Just add snd_usb_audio.dyndbg=+p to your kernel options and please share
the logs.


> Mike
>
> On Wed, Apr 7, 2021 at 1:04 PM Geraldo Nascimento <
> geraldogabriel@gmail.com> wrote:
>
>> Hey Mike, did you catch the latest patch by Takashi Iwai for capture
>> quirky devices?
>>
>> You can find it here:
>> https://patchwork.kernel.org/project/alsa-devel/patch/20210406113837.32041-1-tiwai@suse.de/
>>
>> Em Qua, 7 de abr de 2021 16:55, Mike Oliphant <oliphant@nostatic.org>
>> escreveu:
>>
>>> I had thought that the recent implicit feedback changes were fully
>>> working
>>> on the BOSS GT-1, but it turns out that I just hadn't tested well enough.
>>>
>>> Audio playback and capture works, but with periodic dropouts. I get the
>>> exact same behavior as I did with the quirk to completely disable
>>> implicit
>>> feedback. Without the implicit feedback, you get dropouts from clock
>>> drift
>>> - how bad probably varies from card to card. On mine it is every second
>>> or
>>> so.
>>>
>>> If I switch playback feedback for the GT-1 to generic by doing
>>> "IMPLICIT_FB_GENERIC_DEV(0x0582, 0x01d6)", I get the previous old
>>> behavior,
>>> which is that playback completely fails to start.
>>>
>>> With generic playback feedback, and using my previous patch to endpoint.c
>>> to avoid playback waiting on capture mentioned here:
>>>
>>>
>>> https://mailman.alsa-project.org/pipermail/alsa-devel/2020-January/161951.html
>>>
>>> playback and capture work perfectly for me.
>>>
>>
