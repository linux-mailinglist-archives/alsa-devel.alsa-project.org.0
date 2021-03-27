Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D47E934BA38
	for <lists+alsa-devel@lfdr.de>; Sun, 28 Mar 2021 01:00:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AC73167A;
	Sun, 28 Mar 2021 00:59:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AC73167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616889614;
	bh=1qfph95VqWVmqze1fAFFRZBO6JCCATW2vv6XgtALa4U=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FjDXvpDiJ3PF/v8fOpQ369ay9EfHRlJSNretUDLR31vOXzDAeIxfASuVMrWQXEndF
	 2q3jv8ayQp8vwGx/39oGIjDnHocxvW+3R3G+pIDq4eVvPdvivbmUS270tcHK6yS9is
	 SH0LWImZTf0Nsuz0/7auct+IaU+OS2+au+MNZuvQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AABF7F80257;
	Sun, 28 Mar 2021 00:58:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95AB0F8025F; Sun, 28 Mar 2021 00:58:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E70CF80109
 for <alsa-devel@alsa-project.org>; Sun, 28 Mar 2021 00:58:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E70CF80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="MgbrWfaz"
Received: by mail-ed1-x536.google.com with SMTP id o19so10332535edc.3
 for <alsa-devel@alsa-project.org>; Sat, 27 Mar 2021 16:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=G/DFZEaVKxVwRN6uka2/CBVyUd20qkhja5uqcfFEIgc=;
 b=MgbrWfaztMeuJfPkK44xxsKFWrCeXk937DgiNAvb/gWKba6AovK6vhD50o4XAyd9qz
 d9/L1XQWDnok/VYVjYNOAaE3TfWYk2mtXgc6bpyd4OUedwBxdQkAzVw/++s5FpxJZ3r0
 P85E0uTaT/I1afA8n6w+v21ga7h0bXa395XcHPEPGeZYGPq8VaoS9u2diwiCeSqiPbem
 ey0Nqar61qI+24f8nVuWXI4098uVJ7k/QA2vSmVpKQN+ZoZFpKXfBAFB9QBfukps4XYy
 fJOxhB7d2FBjInuvS2oN0dCrifmSiG4o0a0zSlcoCdz50jPVCo/35ZNKyjIIfuoadvwR
 +e4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=G/DFZEaVKxVwRN6uka2/CBVyUd20qkhja5uqcfFEIgc=;
 b=WKr8ZxzjHD4n1L6PtEWpnYamJ41bGouEHU5Gi6DhB1i3gWxUD1a54tqACfLSnqzcgV
 lfTZoZVlBb0OiVyFiA8qowuX5/P6Skfqs+JXu969FwBJ2dwRIun8lhOaU8p3GwgctotG
 rw/CvT+E6cvCjtHzl5TF5U073qM7dP1+4wbePritzqJzFHYbIDCmIQKHmC8wJFzBqBMq
 C6g/8mHivQT3TalDyAwOpHC91JKdwF9CQUAaU5MkJ0ENUHlQrOrR4iEvS0J+qP5gi8/T
 LwQ7UfUtzWycMIBwvTBcTI2ymp93TvZysBjOOzrs16Hx32xE2EkGOFUzJBCnEIhkIYmz
 CBxA==
X-Gm-Message-State: AOAM533JWKCUPaS6gV+FBlbeMUgPwPsKHvMIya8XUKgPYrxT9tdX5Lj+
 LdJnLbsiEA1oIIMoaW38J5PBgA30tKfqm08wx86uEVTnwSc=
X-Google-Smtp-Source: ABdhPJzFBcd3oXpkefbK3+Uvy2sf+pjrnuudv/VD2/gbKQczgML7scWJeOUJkfganYFeoVHwoCzP23dQx95+FWhOSWk=
X-Received: by 2002:aa7:cc98:: with SMTP id p24mr21913490edt.187.1616889511030; 
 Sat, 27 Mar 2021 16:58:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAOsVg8oYg_3A70UMudHuysi3b9WYcZF++DK3uAruJSjygvgcUg@mail.gmail.com>
 <CAOsVg8pjPuLzdKUTVn7-33FSGPueTY7FKHpHqW7Of8m60PGQnA@mail.gmail.com>
In-Reply-To: <CAOsVg8pjPuLzdKUTVn7-33FSGPueTY7FKHpHqW7Of8m60PGQnA@mail.gmail.com>
From: Lucas <jaffa225man@gmail.com>
Date: Sat, 27 Mar 2021 18:58:19 -0500
Message-ID: <CAOsVg8oAz1Pn2sEAOgv=VO+CjvQtMEWQDAGFDBRjjLDe47MyYg@mail.gmail.com>
Subject: Re: [PATCH 1/1] Adding some Roland devices' USB digital audio
To: alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

Alright, the R-26 works perfectly with the patch too!  Through its built-in
controls, first I configured the MENU->AUDIO I/F SETUP->SAMPLE RATE to
"96.0 kHz."

Then, I connected it through USB and used this to capture & playback:
arecord -D hw:R26AUDIO -f S32_LE -r 96000 -c 2 ./file.wav
aplay -D hw:R26AUDIO -f S32_LE -r 96000 -c 2 ./file.wav

Then, in the "AUDIO I/F" tab on its main screen, I enabled "LOOP BACK" &
"DIRECT MONITOR" & was able to begin a new composite recording,
voicing-over what I'd recorded earlier, by playing it back while
interjecting.

Fun, fun, fun, and sounding excellent!

While I don't want this patch ignored, perhaps wait a bit just for now, as
tonight I'll be fact-checking it against the USB IDs I've realized can be
found in a collection of them: http://www.linux-usb.org/usb.ids.  When
done, I'll submit the finalized patch.

Thanks & Happy Hacking!,

  Lucas
