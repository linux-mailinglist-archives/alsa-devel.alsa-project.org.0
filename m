Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B416F57167F
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jul 2022 12:03:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4789B163A;
	Tue, 12 Jul 2022 12:02:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4789B163A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657620207;
	bh=CuWBTBgNofV4ELD6QdGF93Zki4mzX6HN05uJV8UeG8A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QbYRAUZhZVDpOs0XghlVzRMY6MiJY8Oh6T6wB2SvxezFLN976Q4mj/yoWH7/RDAUr
	 eKnmj6PpHW3wkDOWwFN0G5ZDjV6df8W9/Y4xZjsrMY0VISBgxy45L1NNK2AtnNlMJ6
	 9xNWSRLtE3NyT5or9xryrjWCmExWlqJi7VAPk+3s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AEEE3F80279;
	Tue, 12 Jul 2022 12:02:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D765F80246; Tue, 12 Jul 2022 12:02:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2BC92F8012B
 for <alsa-devel@alsa-project.org>; Tue, 12 Jul 2022 12:02:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2BC92F8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="hlrceudd"
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-31bf3656517so75299407b3.12
 for <alsa-devel@alsa-project.org>; Tue, 12 Jul 2022 03:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4vZMV8oO8pCweKFytCi1iyECBfJ/cRqo4N+xWIgMCDg=;
 b=hlrceuddbxzhswflQp//3s+I0oedn19qUOus6S6+DajiBapdEKXfWCc0/B/7yXYSgY
 H3chfuWXi6d0wp2fBskXlohHwpBjlgwOr8N9bqlyrgNMss8c8BQvaO8lF2EdHvcjEmby
 +Zg9Ue9ufVjye1/Hlk3S/6u8avsCFZWQlEuDmpV4Fc7yAGyQF/6K5Fx/3RR1qixl+gu4
 GtRn7C2uq/lFklL55SMy3FLPQWKlKctPS+OY7FDCernW8MhECQXIOy1iDGdeeqjrInV7
 trPURKzs3TCV3dI3KY4Zidcm8jWMsuO78gpCPd6Kojarja28uYOxU5ozdBzW8RiYJKFC
 muTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4vZMV8oO8pCweKFytCi1iyECBfJ/cRqo4N+xWIgMCDg=;
 b=KQtCD1AENoVftp7WxXAk8c57RAFY/oVMkG1+eoVUw305paH8P5PLXlsiBgy1VLZ61C
 8tAaZjvwCH2QUyzLMNpHRD+P4moym4JfF8k270r9zqnqXXDvjT5FjGZ3pyJX+CHlblgM
 fCt2fcLwi1ZNrYkNO+TUc46t2N4GOToo6oBK4fz5USupUkyqHbpDpM3VSDqi7sYeDwpG
 0FBTuIbquikQLvprVT3y5iPbzr0bYEducCJ9qRs6tf+Ccmnt2Ym2rbOjkvtBiXVyFscp
 TrIsmtAn7JfDq403FGkbhYH7icaxt5jeTr4b8M1waTFJFA/wQxqhUpwNhaP0j80+1kpz
 7ang==
X-Gm-Message-State: AJIora+uCxSEhEoUoIoGbgLZ5n3oazgQ31P/NQnYwsnFtcPAa7PsFPWp
 ehEV6Tot5xG2f8WuMJj+ATOXxKyRw0aNDsZ5DGc=
X-Google-Smtp-Source: AGRyM1tX9LHWdFnOx6PnMAodo72U2Y4oB407lI+eIJm82vFHZ6VJuGwFZ2w4XCkG/HigS+UJenZjYCGxr3cgr7QqwpA=
X-Received: by 2002:a81:108f:0:b0:31c:d7ae:9ff1 with SMTP id
 137-20020a81108f000000b0031cd7ae9ff1mr23759980ywq.18.1657620136053; Tue, 12
 Jul 2022 03:02:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220711095219.36915-1-andriy.shevchenko@linux.intel.com>
 <87ilo2r8np.wl-tiwai@suse.de>
In-Reply-To: <87ilo2r8np.wl-tiwai@suse.de>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 12 Jul 2022 12:01:39 +0200
Message-ID: <CAHp75VfjsJG0+Tgzb=QowNcS3yTEZNs0vd_LAq7P9rNxtHVAfA@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] ALSA: hda: cs35l41: Improve dev_err_probe()
 messaging
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Lucas Tanure <tanureal@opensource.cirrus.com>, patches@opensource.cirrus.com,
 Takashi Iwai <tiwai@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 James Schulman <james.schulman@cirrus.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 David Rhodes <david.rhodes@cirrus.com>
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

On Tue, Jul 12, 2022 at 11:35 AM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Mon, 11 Jul 2022 11:52:16 +0200,
> Andy Shevchenko wrote:
> >
> > Drop duplicate print of returned value in the messages and use pattern
> > return dev_err_probe(...) where it's possible.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> Applied this one, but postpone the rest three patches, as there seems
> a build regression according 0day bot.

Thanks and sorry for that, something (mis)happens, I'll test it
carefully for v2.

-- 
With Best Regards,
Andy Shevchenko
