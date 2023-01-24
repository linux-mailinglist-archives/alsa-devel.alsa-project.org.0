Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CBC679412
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Jan 2023 10:25:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04937DF4;
	Tue, 24 Jan 2023 10:24:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04937DF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674552341;
	bh=jej7NOpFqLgX28VCVquSoNtHsfQ6W3Z1+97hzOBGO6A=;
	h=Date:From:To:Subject:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=sPPOxdefDtQnihCKSPa+DmZW3qDn7mzOTmCcekn//4Sr+6CQ9HusRKX7+2ik+zdOC
	 PtkrwVFcjCep+qOhwNsG388nAyy3rLct3oMH3M4kuIqPR9/8/F/65+yihqOrRWGFms
	 Gz7l4Xu/bxbLqqbf70daRpnCJskViz8BPWd8b3lA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47CCBF8025D;
	Tue, 24 Jan 2023 10:24:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4D40F8027D; Tue, 24 Jan 2023 10:24:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E268CF80163
 for <alsa-devel@alsa-project.org>; Tue, 24 Jan 2023 10:24:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E268CF80163
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=gHgXEI0L; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=QaAdCHCe
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 30A3121A1C;
 Tue, 24 Jan 2023 09:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674552268; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kok7ToRpAJYUCsoVsIt/UpbY9KO/LVhZdq/nniW8Jdw=;
 b=gHgXEI0LvE4q3kq1JQox7g1cuIB4B3ABxOQ8d1KwlzqzKtCwwMzM1uXbOCPazC1x3ebBIg
 bY9VMPLoth9N3tvc1NuANtTb86G6FwE+WH1A5wADAINzDrFzOfSc5mAm2te1uoY+mLQpdX
 sEkCxqVDXz584Kh1OGfEAyYayL1QR9c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674552268;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kok7ToRpAJYUCsoVsIt/UpbY9KO/LVhZdq/nniW8Jdw=;
 b=QaAdCHCeaqvtGgvY92LoZNb8v5UUC/ooi8+nloJP8ZgZEfWQ3qa7fR/6Y5/30TwwERv098
 VxCQBsbg97MxQ5AA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0CE2B13487;
 Tue, 24 Jan 2023 09:24:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id VhJVAsyjz2OKUAAAMHmgww
 (envelope-from <tiwai@suse.de>); Tue, 24 Jan 2023 09:24:28 +0000
Date: Tue, 24 Jan 2023 10:24:27 +0100
Message-ID: <871qnkwaic.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Marek =?ISO-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: Intel HD Audio: sound stops working in Xen PV dom0 in >=5.17
In-Reply-To: <Y878uwEqfQ9WWPZV@mail-itl>
References: <874jsp6r3q.wl-tiwai@suse.de> <Y8cGVGCWjODvMXUe@mail-itl>
 <87sfg85ic1.wl-tiwai@suse.de> <Y8fMVtWshr+yFLWk@mail-itl>
 <87fsc8t3s3.wl-tiwai@suse.de> <Y8nqIBJISq9Vm710@mail-itl>
 <Y8n7XkbM0aIEshlX@mail-itl> <87zgadpsz2.wl-tiwai@suse.de>
 <Y8qE9qBUi6Tuj0SS@mail-itl> <878rhxpcmr.wl-tiwai@suse.de>
 <Y878uwEqfQ9WWPZV@mail-itl>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, Harald Arnesen <harald@skogtun.org>,
 Alex Xu <alex_y_xu@yahoo.ca>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, 23 Jan 2023 22:31:39 +0100,
Marek Marczykowski-Górecki wrote:
> 
> On Fri, Jan 20, 2023 at 02:19:08PM +0100, Takashi Iwai wrote:
> > On Fri, 20 Jan 2023 13:11:34 +0100,
> > Marek Marczykowski-Górecki wrote:
> > > 
> > It's puzzling, then.  The patch changes the allocation with the
> > dma_alloc_coherent(), and that's what does with the Kconfig hack
> > you've tested.  One possible significant difference is the use of the
> > DMA address.
> > 
> > > BTW, xen_domain() will also return true on PVH/HVM domain, which should
> > > not need any of this special treatment. It's PV that is weird.
> > 
> > OK, then it can be an overkill.
> > 
> > Below is another try: it changes the different use of the DMA buffer
> > address.  Let's cross fingers.
> 
> 3 days update and it still works!

Great, I'm going to submit the proper patches, then.
Thanks for your patient testing!


Takashi
