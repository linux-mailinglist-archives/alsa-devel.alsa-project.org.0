Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D01D8368D54
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Apr 2021 08:51:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57BE31692;
	Fri, 23 Apr 2021 08:50:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57BE31692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619160672;
	bh=oagQ2UCQYqDeYm9HUubR6S4935LYy5tc+aN3AvEvqtw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UASVfkwEhfDO4qvmcYQryHqYi2aKhOoEf8S1AiBWw9PY/Y6KXk47bTHIFCws+D4ll
	 ZBPWhbhXmos2LbF6eVmGz9L6DTRqCbgqpO9CTikYrH1550qJUSmxd/srvzwkdBOE94
	 2AFGES9fRh+r8yC188onb/e6IdISgocy2FWt2Y/4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B6DBF80256;
	Fri, 23 Apr 2021 08:49:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD048F80227; Fri, 23 Apr 2021 08:49:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2AE2F800AE
 for <alsa-devel@alsa-project.org>; Fri, 23 Apr 2021 08:49:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2AE2F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="j1iOMnV9"
Received: by mail-ej1-x629.google.com with SMTP id r12so72354126ejr.5
 for <alsa-devel@alsa-project.org>; Thu, 22 Apr 2021 23:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yEeGdhNsSLlv0Q36mdjwlFLJaETze7L97C+htohystA=;
 b=j1iOMnV9SBvXL55WdbYMeccK0SvUFJQgoJNG3pV0TU5jkIqGCnOOJlQO32GVHyYYhY
 UgsIWCW+fsNJqn1MHqake/PEAHTGkDHb1zzuYkT1c9tpen8iyoyEUbn8BeluyIVXFHke
 6eT9pVxoq6XsSTud7vGLxaHdjM/pmxIcvGqGulFP6mIxvDc5zW8TPxoCPTloK+xdqgA0
 gXqSefBXAvNgvZf84mTEOWZBHZjG5pKFU+dXq5J70h4FGDLdC6J+x41SFbWCcVxV95K0
 ctUzUKozMHKM7ea92zQxTERDgcNcn4AEaRp0Oe0mradQYg3WZb1+8+ane6sjK2pc0thX
 P2nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yEeGdhNsSLlv0Q36mdjwlFLJaETze7L97C+htohystA=;
 b=XLGU1LG328RlOZn17wj39pYXEMTHGOtHq2xMJ6BEiQE0AcBSrD8v5StLNOJkIjZ3a8
 IPgesrUmNoU3YStxuUL5MTQY4zPKTNkByDuqsQcLbCfHYgPhKUIXFYB0PeljcLgQTJm0
 TRhne+cwKRdRwiCw+2+ksR+RBzrgQIUeF0vbGGbZOQoNmaqfmOTKe1Gf1L8D6rIAn1th
 wvb5QIWRyLGccTvf6SSPJh09gHiTLbCu82VDqhXEQTItXcMOlJI8/GkURgsqfEzjUI6t
 a13dbXhORHkW1WZ1NMIgySuSJ24Of3P/4V4ZuINppdhf+D4OuUfHkJnegnva9rxOb98Z
 zCYQ==
X-Gm-Message-State: AOAM533y3Ldw9uk//3mgl0LULlhBYH9BGRbGrOwCJ/fn6JT5pGEmiocV
 G7qTlyK76sdz5RsioRybnDHpcLhwBqMoCVTOlU4=
X-Google-Smtp-Source: ABdhPJzQt+RtY0Sqw+hTn4mFPmLajbxLluKZjFkdGUfpBGbkcxulpB1Fz1Lwb2SnoTN3En6rEYr2Jkeg46Ji51f+mNY=
X-Received: by 2002:a17:906:94d2:: with SMTP id
 d18mr2567517ejy.531.1619160574067; 
 Thu, 22 Apr 2021 23:49:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210422120413.457-1-tiwai@suse.de>
 <20210422120413.457-2-tiwai@suse.de>
 <CAHXb3bcKvPSceMuvrq-X8dUyxdrH6iAHTHq_RgTXoAAiXygwUQ@mail.gmail.com>
In-Reply-To: <CAHXb3bcKvPSceMuvrq-X8dUyxdrH6iAHTHq_RgTXoAAiXygwUQ@mail.gmail.com>
From: Lucas <jaffa225man@gmail.com>
Date: Fri, 23 Apr 2021 01:49:22 -0500
Message-ID: <CAOsVg8rAkwLgLP_LSj6CfYG+1R2oB5-sV4KQhLJMqCEqL2wDQA@mail.gmail.com>
Subject: Re: [PATCH 2/2] ALSA: usb-audio: Generic application of implicit fb
 to Roland/BOSS devices
To: Mike Oliphant <oliphant@nostatic.org>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 "Keith A . Milner" <maillist@superlative.org>
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

Most everything seems to be working, but I ran into a couple of, hopefully,
simple issues:

1. The UA-101 in its full speed (USB 1.1) mode times out for both capture
and playback, though its high speed (USB 2) mode is perfect.
(I'm using plughw to work with 2 channels here):
arecord -D plughw:UA101 -f S32_LE -r 48000 -c 2 ./file.wav
arecord: main:830: audio open error: Connection timed out

aplay -D plughw:UA101 -f S32_LE -r 48000 -c 2 ./other-file.wav
aplay: main:830: audio open error: Connection timed out

2.  I noticed with the INTEGRA-7 and the R-26, so far (with "pasuspender --
cat" running simultaneously):
When I first begin playback with aplay like,
"aplay -D hw:INTEGRA7 -f S32_LE -r 96000 -c 2 ./file.wav"
to play a long recording, and then start capturing for a while, while
that's still playing with something like,
"arecord -D hw:INTEGRA7 -f S32_LE -r 96000 -c 2 ./duplex-file.wav".
If I then end the arecord with ctrl-c before the aplay has finished, aplay
may end in the near future without finishing the entire playback, with this:
aplay: pcm_write:2061: write error: Input/output error

I may try beginning the capture first, and then starting aplay, but I've
run out of time for tonight.

If problem two can't be fixed, this functionality is certainly better than
before when it wasn't working at all.  I think JACK would keep the capture
and playback endpoints open, until itself closes, so it's probably a rare
person like me that would even notice it.

Thanks again!,

  Lucas
