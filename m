Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0EA325607
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Feb 2021 20:04:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9EA2D1665;
	Thu, 25 Feb 2021 20:03:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9EA2D1665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614279876;
	bh=cAaSvG2BerGSMdFxg0upOESmzyD1xRwJf5OiauApi3g=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IlgJtnnZHYlrWyxHeVwep4fsq8188rqrn8ysEUPJUGVMNDyAcliVboXmo9SDQV69n
	 c0rPxGjzKTB2UgNe11brxI4aVmqvBFY71tIGbsO3A7R6lmCVJ5DhTguF8P5WnCrkU4
	 K4nnNcXMRUEA6oZSihrb9s+KPz0Xm+2RHaf2gfHA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0CCEF8016D;
	Thu, 25 Feb 2021 20:03:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9867F8016A; Thu, 25 Feb 2021 20:03:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3D6E0F80159
 for <alsa-devel@alsa-project.org>; Thu, 25 Feb 2021 20:03:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D6E0F80159
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="exv++/JG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614279779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XFKozbHhnqP0a9+4FvYtN86/9o6SBDgQyBJdWAPtLYc=;
 b=exv++/JG8B7WNECsKCbl8T2pYB4UyQZ76/Fufy+ROwP0UrKSFRVSJbVw92yKCYacGJZ2N/
 ee6Vs1Sr3+08PLxTt+c57N/CPBXZ3fwspQJ6sZJ5HxpkaJX2gjc4JOB50WjRPYCavI8kGR
 d4OWjLl5fH0h1xcI65si014Vu/HuYmE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-541-aSK53epMPYO6jJUFVycigA-1; Thu, 25 Feb 2021 14:02:58 -0500
X-MC-Unique: aSK53epMPYO6jJUFVycigA-1
Received: by mail-wr1-f71.google.com with SMTP id b7so3462024wrv.7
 for <alsa-devel@alsa-project.org>; Thu, 25 Feb 2021 11:02:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XFKozbHhnqP0a9+4FvYtN86/9o6SBDgQyBJdWAPtLYc=;
 b=nBeFxvdxykGptMvx+ejfpVd1QUDcYoaHlEp8sSMXSd8jgbpN09acUpbb2p6Tz8bJ2F
 aLfk3l12waghF/FmSYWjh/7JzXF85A9jCgd46EmeKDDOtFYu9Vna8rBDrtVPJYdmPkTw
 7xA1MYQZLOtoSX9bzViCmvwV7MqVpJ8dPLG9d9SlHvm0VbFiX5eOTqrsm8YGmPzhnCYs
 JV9+bcgnXUPzt84VLZ9VVeUaYJNLa96jjeAzASfLQLtv5PRN4pJccr+n0/8NrYOLOdib
 J7KYrV1us1H1hkfw2OXpB30hVm92D9iHV9nZJq9SECfggQEH3pU3P7kQ++LPJVC3YhMy
 NWUg==
X-Gm-Message-State: AOAM530mFNGlKNSYZiagpHJauKqGtyqs20THK6nk5569XGa3YmeE8oJk
 i4DG+fQlgvomB9WqvSUwNV8t3G1uZYmd54bBDp8p+6dos0tQAwlpuYUUGVo7OAohs3kGwRc405z
 xJnIiAKDhw1/OF1MttsqOFL8=
X-Received: by 2002:adf:f750:: with SMTP id z16mr5053375wrp.108.1614279776657; 
 Thu, 25 Feb 2021 11:02:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyofpaHNGnRewH6YHzPuJRqwWTHK/BQLCP4h/Yb+AZpMyiGXAnajZWb3bS8LQE8CSJUwyqDIA==
X-Received: by 2002:adf:f750:: with SMTP id z16mr5053138wrp.108.1614279774228; 
 Thu, 25 Feb 2021 11:02:54 -0800 (PST)
Received: from redhat.com (212.116.168.114.static.012.net.il.
 [212.116.168.114])
 by smtp.gmail.com with ESMTPSA id s11sm8971320wme.22.2021.02.25.11.02.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 11:02:53 -0800 (PST)
Date: Thu, 25 Feb 2021 14:02:50 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH v5 6/9] ALSA: virtio: PCM substream operators
Message-ID: <20210225135951-mutt-send-email-mst@kernel.org>
References: <20210222153444.348390-1-anton.yakovlev@opensynergy.com>
 <20210222153444.348390-7-anton.yakovlev@opensynergy.com>
 <s5h35xkquvj.wl-tiwai@suse.de>
 <d9b6e8fa-7356-1cbf-029b-6f7c8bad4994@opensynergy.com>
 <s5hlfbcpayj.wl-tiwai@suse.de>
MIME-Version: 1.0
In-Reply-To: <s5hlfbcpayj.wl-tiwai@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: virtio-dev@lists.oasis-open.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Anton Yakovlev <anton.yakovlev@opensynergy.com>,
 virtualization@lists.linux-foundation.org
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

On Thu, Feb 25, 2021 at 01:51:16PM +0100, Takashi Iwai wrote:
> On Thu, 25 Feb 2021 13:14:37 +0100,
> Anton Yakovlev wrote:
> > 
> > On 25.02.2021 11:55, Takashi Iwai wrote:
> > > On Mon, 22 Feb 2021 16:34:41 +0100,
> > > Anton Yakovlev wrote:
> > >> +static int virtsnd_pcm_open(struct snd_pcm_substream *substream)
> > >> +{
> > >> +     struct virtio_pcm *vpcm = snd_pcm_substream_chip(substream);
> > >> +     struct virtio_pcm_substream *vss = NULL;
> > >> +
> > >> +     if (vpcm) {
> > >> +             switch (substream->stream) {
> > >> +             case SNDRV_PCM_STREAM_PLAYBACK:
> > >> +             case SNDRV_PCM_STREAM_CAPTURE: {
> > >
> > > The switch() here looks superfluous.  The substream->stream must be a
> > > good value in the callback.  If any, you can put WARN_ON() there, but
> > > I don't think it worth.
> > 
> > At least it doesn't do any harm.
> 
> It does -- it makes the readability worse, and that's a very important
> point.
> 
> > >> +static int virtsnd_pcm_hw_params(struct snd_pcm_substream *substream,
> > >> +                              struct snd_pcm_hw_params *hw_params)
> > >> +{
> > > ....
> > >> +     return virtsnd_pcm_msg_alloc(vss, periods, period_bytes);
> > >
> > > We have the allocation, but...
> > >
> > >> +static int virtsnd_pcm_hw_free(struct snd_pcm_substream *substream)
> > >> +{
> > >> +     return 0;
> > >
> > > ... no release at hw_free()?
> > > I know that the free is present in the allocator, but it's only for
> > > re-allocation case, I suppose.
> > 
> > When the substream stops, sync_ptr waits until the device has completed
> > all pending messages. This wait can be interrupted either by a signal or
> > due to a timeout. In this case, the device can still access messages
> > even after calling hw_free(). It can also issue an interrupt, and the
> > interrupt handler will also try to access message structures. Therefore,
> > freeing of already allocated messages occurs either in hw_params() or in
> > dev->release(), since there it is 100% safe.
> 
> OK, then it's worth to document it about this object lifecycle.
> The buffer management of this driver is fairly unique, so otherwise it
> confuses readers.
> 
> 
> thanks,
> 
> Takashi

Takashi given I was in my tree for a while and I planned to merge
it this merge window. I can still drop it but there are
unrelated patches behind these in the tree so that's a rebase
which will invalidate my testing, I'm just concerned about
meeting the merge window.

Would it be ok to merge this as is and then address
readability stuff by patches on top?
If yes please send acks!
If you want to merge it yourself instead, also please say so.

-- 
MST

