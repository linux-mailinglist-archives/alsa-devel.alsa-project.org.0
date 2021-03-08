Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB4633061F
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Mar 2021 03:54:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD61A183E;
	Mon,  8 Mar 2021 03:53:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD61A183E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615172081;
	bh=7LJzvyM0iG8S+Zbi2tAEBne+IX+2fOipKvbwElT9Kf0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XeS6rGETJVSvxHHEF6EiSdjzI/+KG5lZSbPeKUThacdgt9g7mqvR9oR7nYiTbgxqP
	 4em9DGqLtx9VTN2x8zfT4k5dEkRaSdpXAyEIe/q6F64x5Aec6B3i7y+seG9w/i8V1m
	 HmVx8cQk/JjAhiWy087R1tuPFP/aUF6bO4ooW8J4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 576EAF800D0;
	Mon,  8 Mar 2021 03:53:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 237A4F801D8; Mon,  8 Mar 2021 03:53:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D97C8F800ED
 for <alsa-devel@alsa-project.org>; Mon,  8 Mar 2021 03:53:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D97C8F800ED
Received: from mail-lf1-f70.google.com ([209.85.167.70])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>) id 1lJ60x-0002M6-UN
 for alsa-devel@alsa-project.org; Mon, 08 Mar 2021 02:53:00 +0000
Received: by mail-lf1-f70.google.com with SMTP id w21so2996245lfk.0
 for <alsa-devel@alsa-project.org>; Sun, 07 Mar 2021 18:52:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7LJzvyM0iG8S+Zbi2tAEBne+IX+2fOipKvbwElT9Kf0=;
 b=KmkwN0QEI9gMTJqRMFB2Xwn5crI9oSA7iLmxo6gPiNmmt/8hLnILkW/paSec6pIo/i
 fPEp83sJc3GgcE8n/crnWRPPPsCwC0ioQH4qh6qyh34DX8AAHna9dFiA/Hzf/TlkkiI0
 V3JguOsFx+MRgx784oir0wmEEEeEQ4uNXRmxVbS2lDacwSA0t9nb50C0vGCmdfnGAtfS
 NIfn+C2vgPx7vaIFA26XJoRm6HT7yvrs2kExc71TjRU3OQ9Bwnqu43J6uTLe23KJ5ypE
 EwhjpZenRjY7gja+PMj/9uU2PShRqZqmBhVxsfdzspSWMIQ89pjEyeLHKnvt9xyf3qGV
 ayUw==
X-Gm-Message-State: AOAM530HtD+iqy2o/YNMh+d8i9bz+YIlliThyFiZDSmULLvkeIMxzJlY
 RJrvFpJNisaoh/+i/xByqaNDWBokrzo7JuDMvm0SB7jRy6isGqG5fW/GfTdm7UGIQTwHJeuD0xM
 Gvo0WnztJMrgwwSuV1V8pDkfH13p62FkTGkDIzEhkKuWqczAANd4XVfu5
X-Received: by 2002:a2e:5753:: with SMTP id r19mr12495080ljd.126.1615171979404; 
 Sun, 07 Mar 2021 18:52:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyEjITmJmS/wy4vZ+7yht6kBnzVu7eo1SaP2wxes4owMbz/ewjv5dAGJDSblGk7Ib1eR/6Z036BlVKLqH5IWf4=
X-Received: by 2002:a2e:5753:: with SMTP id r19mr12495069ljd.126.1615171979146; 
 Sun, 07 Mar 2021 18:52:59 -0800 (PST)
MIME-Version: 1.0
References: <20210125115441.10383-1-cezary.rojewski@intel.com>
 <CAAd53p4fycxLn6y0WpaMWvWkN8EwmT216b40DavttfshN_GMRg@mail.gmail.com>
 <324dc8a5-c4d3-6ebf-c8e9-6321d6c93dab@intel.com>
 <CAAd53p4gqyuFPWX55fnPGHORXXf58++ZRMH9WFYp+QwS1=xDJQ@mail.gmail.com>
 <181c989f-7a4d-3cdd-11be-7378dbc9502c@intel.com>
 <5e970d19-9544-50fe-f140-b66245418c6e@intel.com>
 <CAAd53p4srH6NFwcyUCBnLj=MS8-YBvA9CPjMbcryGgi5CmUUHw@mail.gmail.com>
 <2c93bf65-4996-08c6-5be1-da4b9966e168@intel.com>
 <f20e5e2b-3761-5e13-3166-5f026d088aa1@intel.com>
 <CAAd53p6ZyuAzNJWLyONkbFndSRF2HBLn=6HLzb5RUShCmNWdVQ@mail.gmail.com>
 <46f88397-dd4e-ffb4-3bd3-8f64c4827b66@intel.com>
In-Reply-To: <46f88397-dd4e-ffb4-3bd3-8f64c4827b66@intel.com>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Mon, 8 Mar 2021 10:52:47 +0800
Message-ID: <CAAd53p6atLtgP-nrDm+CCLuBq=NNga8xcTW-7wNRQamduhzuOA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: Intel: Skylake: Compile when any configuration is
 selected
To: Cezary Rojewski <cezary.rojewski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 =?UTF-8?B?QW1hZGV1c3ogU8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
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

On Mon, Mar 1, 2021 at 8:37 PM Cezary Rojewski
<cezary.rojewski@intel.com> wrote:
>
> On 2021-02-22 4:04 PM, Kai-Heng Feng wrote:
> > Hi Cezary,
> >
>
> ...
>
> >>
> >> I'd like to close the compilation issue which this patch is addressing.
> >> Could you confirm that the presented change fixes the issue on your end?
> >
> > No, the SST regression is not fixed.
> > However, it's not the scope of this patch, which is to fix a different issue.
> >
> > So please proceed to merge the patch. We can discuss the SST
> > regression in other thread.
> >
>
> Thanks for the reply Kai-Heng.
> Could you elaborate on the SST regression subject though?

I think it's easier for us if you can involve in the bug report directly:
https://bugs.launchpad.net/bugs/1902457
https://bugs.launchpad.net/bugs/1915117

Kai-Heng

>
> Mark, do you want me to re-send the patch?
>
> Regards,
> Czarek
