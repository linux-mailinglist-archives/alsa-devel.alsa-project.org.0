Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C64CD36EEEC
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Apr 2021 19:31:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 558361686;
	Thu, 29 Apr 2021 19:30:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 558361686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619717504;
	bh=3nNjieIbFH1R2tL/qi1BjN1A0vBzMFEZXjr571krKJ8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LqnL3fPOrWDEUNaWq1nOiGy0keSStnXX8bOSjp2QwEAbEgcYrg+e1VfuSZYf2RLLD
	 n1ki24U2DcOHYC0wLfSAyB7l/OFr4kuNvAy8CYIlGt9C6SP8a8xM80N7jQAveyXRGO
	 5R49gs7ffbV8AJeH+ceUNdX54fdpWb+YzyT0Lkkg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE185F80117;
	Thu, 29 Apr 2021 19:30:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DBC68F801EC; Thu, 29 Apr 2021 19:30:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27725F80117
 for <alsa-devel@alsa-project.org>; Thu, 29 Apr 2021 19:30:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27725F80117
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="kMMSivIu"
Received: by mail-ej1-x630.google.com with SMTP id t4so17774017ejo.0
 for <alsa-devel@alsa-project.org>; Thu, 29 Apr 2021 10:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OFBMDY5UFtEBwcAjvwZZclBxV30/Up90Z782IhWox14=;
 b=kMMSivIuZfF+6IMlAtBIOHVGs3ssoVR48fVt9DAo3gd18TcgQUOlAAfAIkztT+JF7b
 1pvAbk89OTBNVdpl7MSPJcFLqGvVw04b88nnjUPrvbaVg0bwgUpUHjEYxQsjTyMbXJ4F
 PpUVv0y0H1J1j2bqmVul0pIE8wvnsm2/BiXR1LUua9y7cOt4PC/mrOBDs2wop7GVI2f1
 NUlkkKBN1GqTw1ITaCCCud8OiahpiKns0XqdruWYN38ZMLPrSK0Z/J9GNHiLqYMbvg7Q
 Rs5fUiBS9Py86iNrE6djppKy1vNyxT7FbwBfU9a4DULEjWLmufxyvCJMKgNSEB+ojU44
 YwRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OFBMDY5UFtEBwcAjvwZZclBxV30/Up90Z782IhWox14=;
 b=UYMlamz0hROGOnF3d45AJCwkM6UOxPrCWDxNI+EiUw4jji9ywKYqICUmCaAouOd+Wn
 PZHO7S7TGSi1G99LID/D1QNDlQ1AE7MB6uKHkAQjeAHYZ1tcFTlz56Nn4TOObUzaIcvg
 YmPyxRp4aoYrmzvtiWRWQ0BPTEV4QyKu0X9GwoZzuW9hcEy6HmHPXcCQWROIjuo4jU8Q
 0Chj3TDPil49zVASGpo9v7hzJZl/4ofxUWNaVwngRwWhcPHfJpjiTRxtLiTNQL+Tb6JN
 WdRTc/sHY9hBgqjATnSbJm3s8Yoe0C81xVaRzLEXojLdN5HGFDD9x0oVfCrYLVPAjipf
 73Cg==
X-Gm-Message-State: AOAM533JqqUGEg/II3zz+bD35QcSSGxj/2X5scuuazanQWMmA91UNVRc
 4Sl58UtzTSPg9D7VLavPUsNwaLWkHmvQvwQ06Ek=
X-Google-Smtp-Source: ABdhPJxp1tPQ8lOl5Gzz5r7uBmvGjKiJEi24/ltOWkogeENna8S8Q25usKnLBkeGqPZ7GZBKQJbdHxOX+03rtI5XGg4=
X-Received: by 2002:a17:906:e118:: with SMTP id
 gj24mr1028130ejb.205.1619717403194; 
 Thu, 29 Apr 2021 10:30:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210422120413.457-1-tiwai@suse.de>
 <20210422120413.457-2-tiwai@suse.de>
 <CAHXb3bcKvPSceMuvrq-X8dUyxdrH6iAHTHq_RgTXoAAiXygwUQ@mail.gmail.com>
 <CAOsVg8rAkwLgLP_LSj6CfYG+1R2oB5-sV4KQhLJMqCEqL2wDQA@mail.gmail.com>
 <s5hlf99788o.wl-tiwai@suse.de>
 <CAOsVg8rPfh-scSmmJSVASPTw7o3vw_zZ05YzVZ_JYFJHbcOcyg@mail.gmail.com>
 <s5hlf964td3.wl-tiwai@suse.de>
 <CAOsVg8okhRKPSnSOOCjMMD4wBxFB=E1i7JaQQY0T+CfCa_Jz1g@mail.gmail.com>
 <s5him494kqr.wl-tiwai@suse.de>
 <CAOsVg8o2Ad0pZK2qrLq8=NfJYd-1swveyhrmtPN8995m-dBoKg@mail.gmail.com>
 <s5hczudwixs.wl-tiwai@suse.de>
In-Reply-To: <s5hczudwixs.wl-tiwai@suse.de>
From: Lucas <jaffa225man@gmail.com>
Date: Thu, 29 Apr 2021 12:29:52 -0500
Message-ID: <CAOsVg8panN9JLnCOuGXqOwdOzGBLbpBiTfrYJdJo1ezGjQpuFg@mail.gmail.com>
Subject: Re: [PATCH 2/2] ALSA: usb-audio: Generic application of implicit fb
 to Roland/BOSS devices
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, "Keith A . Milner" <maillist@superlative.org>,
 Mike Oliphant <oliphant@nostatic.org>
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

Alright, thanks!  I really appreciate your suggestions and will try what I
can.  First, I will have to see if I can track down the code change that
broke it.

On Thu, Apr 29, 2021 at 4:15 AM Takashi Iwai <tiwai@suse.de> wrote:

> The error -110 is ETIMEDOUT, and the symptom implies that the problem
> is rather in USB core side.  You'd better ask USB devs.  It might be
> worth to run git bisect if it's a kernel regression and reliably
> reproducible.
>

It must be reliably reproducible (with my hardware at least), as luckily,
it never varied in my tests.

Thanks,

  Lucas
