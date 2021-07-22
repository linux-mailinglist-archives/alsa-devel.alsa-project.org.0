Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12ADA3D2F38
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Jul 2021 23:32:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 958BB16FC;
	Thu, 22 Jul 2021 23:31:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 958BB16FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626989553;
	bh=S382gTC0H1viVmT5TKHqvSHptqHP3iQDPv1ZRsxlO/I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Js14SkNn0uSe+DiQ3o+YsdtOn0eZtfyNZgodWV9uSSiRemMlWQof7PTaLQzQz/7JR
	 pCdkaD/v7Y3muWLsjaA5Wn9KC8M7485yB52ZmoirKbxTDsaZQrLy9C6RhVHL13ahMS
	 pbWsfQebpMXJejQS970PxMSCNt7NgL+J26VLjD+8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CFC7CF80256;
	Thu, 22 Jul 2021 23:31:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25DA1F80227; Thu, 22 Jul 2021 23:31:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DATE_IN_PAST_03_06, DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F41D1F80114
 for <alsa-devel@alsa-project.org>; Thu, 22 Jul 2021 23:30:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F41D1F80114
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="TxDYhEkE"
Received: by mail-qk1-x729.google.com with SMTP id q15so6836914qkm.8
 for <alsa-devel@alsa-project.org>; Thu, 22 Jul 2021 14:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S382gTC0H1viVmT5TKHqvSHptqHP3iQDPv1ZRsxlO/I=;
 b=TxDYhEkEwD8bjc4NezBL4DlChJsi7L+/DeIEN3RKxbmXsktidzaezyScf4Ewaag9Du
 +i+8q4aOU30jwvlhY2Xrvz0FUFAiGRetd+dfNrFEme6oeYxgYnxj2rhm2/q2DSjAcFEn
 DMM7ZSMGRuo26H/gDTXFGa80fbrZEU8aLomQ5D1AIB/Ovl+q2zCl5FZe5ax7Y/mNsckA
 LkHGtYg9FwcowX9wbmCUvuVtzk8t7IMaS7GJRjhWAePXwPfO1Btuu/aiXNbOWY1U+P6R
 tCjT/Gf8sbB8SA8Uk0TkHfKBoSfXILju1AFP4huykAoYXui1A2aUbJEbszPRBDStS24n
 5stQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S382gTC0H1viVmT5TKHqvSHptqHP3iQDPv1ZRsxlO/I=;
 b=ITSzlSHf4Z1QQ8kj+ZjHEexG1uoCPGzm/yvSdcNb/iiPE8r9mboBQEF9pYv+PTcX/B
 oC6zznfV696aR0IBnp15coL60z69C1BxpkMFZV2wyvdPmOBx603cre3TqZuQHYUtW974
 wT6/QpOvjdVDuB4XvsUHsDtRdWUocGYvwvGTBiX5fYD9bAt194jUgXXrjmd0XWsQEBZb
 /NY85gg1QFy0WI53pywAuF+nVmhx8X2C7C5uL8mo2kcWvDcH/8DUHMWXBQ8flyQfjCdY
 5IS8RZLYu+jC0cwb7cu5IwZaapJS7CHQ/CM1afLe8k1XxILOKjTT7KWsAHNU4dQOYTDx
 LGQQ==
X-Gm-Message-State: AOAM533gmI4H/kD7+PXY9oLPJB2ytISMrjPlClad9kfyTkbtUO/LXkj9
 UgDYc5B14DPC7MRroMbJKeudSWidj2+QLHbn90Y=
X-Google-Smtp-Source: ABdhPJywYBUI2fc3tquKbhJtba0eTX4NfuSOGN9mjBZx56Eew8T9Ehpcj6HBh3/qqg/tIxRq707I/6XTHXWuah1kOAY=
X-Received: by 2002:a05:620a:893:: with SMTP id
 b19mr1745655qka.487.1626989453277; 
 Thu, 22 Jul 2021 14:30:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1626959758.git.g@b4.vu>
In-Reply-To: <cover.1626959758.git.g@b4.vu>
From: Geraldo Nascimento <geraldogabriel@gmail.com>
Date: Thu, 22 Jul 2021 18:30:46 +0000
Message-ID: <CAEsQvcs9BwJ7mAiw_wbNbRW6Y3yH9Kr=qyvxEFE0SRowuYe83w@mail.gmail.com>
Subject: Re: [PATCH 0/4] ALSA: scarlett2: note gen 3 support + fix four issues
To: "Geoffrey D. Bennett" <g@b4.vu>
Content-Type: text/plain; charset="UTF-8"
Cc: Takashi Iwai <tiwai@suse.de>, Hin-Tak Leung <htl10@users.sourceforge.net>,
 alsa-devel@alsa-project.org, Vladimir Sadovnikov <sadko4u@gmail.com>
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

On Thu, Jul 22, 2021 at 8:12 PM Geoffrey D. Bennett <g@b4.vu> wrote:
>
> Hi Takashi,
>
> In the sound-5.14-rc1 merge commit log the highlights included:
> "Scarlett2 mixer code fixes and enhancements". I think that the new
> support for Gen 3 devices is significant enough to be worth
> mentioning.

I wholeheartedly agree with Geoffrey, Dr. Iwai.
The commit log highlights are picked up by various media outlets, e.g. Phoronix.

Most of the time these mainstream channels are the ones that will end
up notifying the end-user that new hardware support is available.
It would be not only wise to divulge our efforts that add support and
fix bugs in supported hardware.

It would be kind too, sometimes some piece of Audio hardware is the
one key aspect holding back an user in an OS they don't particularly
like.
I'd go so far and say holding the user hostage, but I'll just leave it
here and end my 2 cents worth of comment.

Thanks,
Geraldo Nascimento
