Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E951DC29
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Apr 2019 08:46:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4970862;
	Mon, 29 Apr 2019 08:46:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4970862
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556520417;
	bh=dSO+oNiL4jF9hybu+LDW0TU5/MUGYst+E31D/mfzrhE=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=potxsUn++Ub5Gycy1EfOK4fiIpD2o8zce3ms+Lfhew4sPoPmYJkStE2LJKvDOE8fx
	 0ZVpqCzpyDqmipCdpC4YiZTyG+9wo6Zir5eEDaxsSg7eLoiFKcxePBl0T0CSu7qjhY
	 tWb/W9lh5FphaJoK8hgpUJJFc2QTNM1VWhzwNUXc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D452F80C41;
	Mon, 29 Apr 2019 08:45:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74E7CF80CAB; Mon, 29 Apr 2019 08:45:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS autolearn=disabled version=3.4.0
Received: from mta-p3.oit.umn.edu (mta-p3.oit.umn.edu [134.84.196.203])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C88FF806E7
 for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2019 08:45:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C88FF806E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=umn.edu header.i=@umn.edu
 header.b="oglRIhN8"
Received: from localhost (localhost [127.0.0.1])
 by mta-p3.oit.umn.edu (Postfix) with ESMTP id 49585674
 for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2019 06:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=umn.edu; h=
 content-type:content-type:subject:subject:message-id:date:date
 :from:from:in-reply-to:references:mime-version:received:received
 :received; s=20160920; t=1556520304; x=1558334705; bh=HR/VsmL+Sl
 Q9LEfLNg0cZiRdW29pIMsOScEdB/7Npfs=; b=oglRIhN8JL7V9EJT32AmBsxk4d
 nOVm/WeltHQJHOfHSvAbDiOlC10bBTIxmw1afCO04x3FbWWiai88XEStY4cNdNgg
 ox/r6Zsug6orBHeetIoD+uU3OTFtM8JftMRtlBnuq2WCX4w3Bv6G/rKNcka0HuyH
 n2SamimXSr7C3cgHD4lWl+07A1t1e4Dr3Juw0VA0dLh6wuN2Ng3pDudDXvMCeOPv
 XOUSs3CIc+8ViFhNFD8l1Vf4TDiXBVRdt74dEGovKqkn/QzbevaHDeUVedlVk6li
 HACmD+iM1D7aCkae0FOijlLs+nFJF/dGIA5d+NkaKJcKa4rq3Aa3+yztAm2Q==
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p3.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p3.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TdTrGZDv0FMm for <alsa-devel@alsa-project.org>;
 Mon, 29 Apr 2019 01:45:04 -0500 (CDT)
Received: from mail-it1-f176.google.com (mail-it1-f176.google.com
 [209.85.166.176]) (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested) (Authenticated sender: wang6495)
 by mta-p3.oit.umn.edu (Postfix) with ESMTPSA id 280A166E
 for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2019 01:45:04 -0500 (CDT)
Received: by mail-it1-f176.google.com with SMTP id q14so14719465itk.0
 for <alsa-devel@alsa-project.org>; Sun, 28 Apr 2019 23:45:04 -0700 (PDT)
X-Gm-Message-State: APjAAAXejypqi5Yzrs0thvyvIPCY6OMElokUhFD7bb7hDo33fplVjDDc
 ZFpgD5qAgcT03ZwthsRaQxcNhagzWQuKRLBRvBQ=
X-Google-Smtp-Source: APXvYqwmcBj42HoRDaYE7ExTxp+2Gctub0ZLZgUoKG3V35QOlgB829b/DrYE8s3uHW8sArdfI7YGEeZfc8W1tYIFh8s=
X-Received: by 2002:a05:660c:148:: with SMTP id
 r8mr4672499itk.125.1556520303936; 
 Sun, 28 Apr 2019 23:45:03 -0700 (PDT)
MIME-Version: 1.0
References: <1556433754-3291-1-git-send-email-wang6495@umn.edu>
 <s5hd0l6mwbz.wl-tiwai@suse.de> <s5ha7g9l6ea.wl-tiwai@suse.de>
 <CAAa=b7f7MMJ=2PBxz8yYM6u2SX7T2-YnC37gbapc1f9HOPQdeA@mail.gmail.com>
 <s5h4l6hl3ca.wl-tiwai@suse.de>
In-Reply-To: <s5h4l6hl3ca.wl-tiwai@suse.de>
From: Wenwen Wang <wang6495@umn.edu>
Date: Mon, 29 Apr 2019 01:44:28 -0500
X-Gmail-Original-Message-ID: <CAAa=b7dHFLnXWEd+v5LOVuGDim5zP+w=qy_aFAgiiMrbVBmmxA@mail.gmail.com>
Message-ID: <CAAa=b7dHFLnXWEd+v5LOVuGDim5zP+w=qy_aFAgiiMrbVBmmxA@mail.gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: open list <linux-kernel@vger.kernel.org>,
 "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Wenwen Wang <wang6495@umn.edu>, Kees Cook <keescook@chromium.org>
Subject: Re: [alsa-devel] [PATCH] ALSA: usx2y: fix a memory leak bug
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

On Mon, Apr 29, 2019 at 1:42 AM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Mon, 29 Apr 2019 07:50:11 +0200,
> Wenwen Wang wrote:
> >
> > On Mon, Apr 29, 2019 at 12:36 AM Takashi Iwai <tiwai@suse.de> wrote:
> > >
> > > On Sun, 28 Apr 2019 09:18:40 +0200,
> > > Takashi Iwai wrote:
> > > >
> > > > On Sun, 28 Apr 2019 08:42:32 +0200,
> > > > Wenwen Wang wrote:
> > > > >
> > > > > In usX2Y_In04_init(), a new urb is firstly created through usb_alloc_urb()
> > > > > and saved to 'usX2Y->In04urb'. Then, a buffer is allocated through
> > > > > kmalloc() and saved to 'usX2Y->In04Buf'. After the urb is initialized, a
> > > > > sanity check is performed for the endpoint in the urb by invoking
> > > > > usb_urb_ep_type_check(). If the check fails, the error code EINVAL will be
> > > > > returned. In that case, however, the created urb and the allocated buffer
> > > > > are not freed, leading to memory leaks.
> > > > >
> > > > > To fix the above issue, free the urb and the buffer if the check fails.
> > > > >
> > > > > Signed-off-by: Wenwen Wang <wang6495@umn.edu>
> > > >
> > > > Applied now, thanks.
> > >
> > > ... and looking at the code again, this patch turned out to be wrong.
> > > The in04 urb and transfer buffer are freed at card->private_free
> > > callback (snd_usX2Y_card_private_free()) later, so this patch would
> > > lead to double-free.
> >
> > Thanks for your comment! Does that mean we should remove
> > usb_free_urb() in the if statement of allocating 'usX2Y->In04Buf',
> > because it may also lead to double free?
>
> Yes, that's another superfluous code.

Thanks! I will rework the patch.

Wenwen
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
