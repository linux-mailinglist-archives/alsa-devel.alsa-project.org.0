Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C11F105C37
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Nov 2019 22:47:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9ED017BF;
	Thu, 21 Nov 2019 22:46:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9ED017BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574372852;
	bh=T4qB8VHLiyt8lPuO90fe0xmKUOdwEuaZwuKDhM5FPL4=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mrJ4l+o5rO4ctp0mrdOO6ZWqcFq2+3B1y4iD6CIztyEIM54vgA8ppaYWhb38f/aq/
	 1t7UL4dfm1ZlEwEz1+uoyAxMMsBAmYK2EeiKM6n5CvR5fNoXhKf61vt+OdgdPe01L7
	 T6dG3Aq4HR7FWpjmftILzcBNMVaIr/TaLd0Rzu4Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A3A4BF80146;
	Thu, 21 Nov 2019 22:45:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 516A2F80146; Thu, 21 Nov 2019 22:45:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26225F800F0
 for <alsa-devel@alsa-project.org>; Thu, 21 Nov 2019 22:45:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26225F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="Rxs8zuyN"
Received: by mail-il1-x136.google.com with SMTP id m5so4862497ilq.0
 for <alsa-devel@alsa-project.org>; Thu, 21 Nov 2019 13:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BRInGiuNVlvsgoiyXixcjM//OdCoXiQ6x64O5Dt1aX8=;
 b=Rxs8zuyNi3o05aeOwMNhNn2uPSY5oO8bNhMRGWFsBpvwhVmpU539OkFT37q0Ff6FiA
 H6RDZ4bwkPXEm9A3NsfGpzXJWSQxlz+m+uTi4wNWJyV06GNGHcEd0vapnuNF2QvyEqEl
 CjfzOiVpr653Y0+gM68lcoY9WVD/m6+mKjp8DQ7W5pWXCDWBzi6/+vmwc3IvCHkPcrJ+
 kj2uJKiPtbCFjpx3siuZip0mtPSJsWyAVL1V/TxH6ymdxyDqEy/pUMQ+0M+QLp0jCU27
 Ohx0Ss9otG01sXD0h1enR5LxM0ov1w3s6AbeeD/OlZZIb/RuPIU8nmVPjWL5mcwA79cP
 Obig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BRInGiuNVlvsgoiyXixcjM//OdCoXiQ6x64O5Dt1aX8=;
 b=e6LMT1VxsoqwlqalLPBT/lDMruSltwTPdeFFva3qh3hlBrct2h24nHidaOz8AzWhJh
 ntWDUSJSpp2eLPujM8PO304WNgq7J4Sb/qO5Eway+L7uA1XXwFvPeqkbAqZqNBYta51w
 vrzfaiUr5UQGDh5HEbWhQ91elGs1wltVqRU3NpbiUP1ytXhjtC0Fn5E7VXVCexA9ftAL
 Ur2jUuVRGfSKP+62yzKYeLceeflBf+/zbn4tK3OTVVpxbmzoaOhWwegP6y6l97xzPdUv
 MnUQ8h72hki7jfcx3OT3iQZ3F7c3twE20sLnd2heC5DmRPGGY+Eh2xrlRECpZLvvo4vb
 DTkA==
X-Gm-Message-State: APjAAAVWRsCH8TWT8p6+TCHKc0edF832IH50OTFBjtq/7vk8k5bZTz27
 viAQ9JuUpc/IzFHsBJ3L+ULGvXwtMzU/FhoFs38+oQ==
X-Google-Smtp-Source: APXvYqxYUujSM9OUCDXfaldXMnvwRMRlR6+uXMXrWo2HzO0wGp2uhpRi8xj81AVe0kTuLFeTa6mHDwgEppgAFZ3ATRE=
X-Received: by 2002:a92:1513:: with SMTP id v19mr12388588ilk.125.1574372739717; 
 Thu, 21 Nov 2019 13:45:39 -0800 (PST)
MIME-Version: 1.0
References: <20191117085308.23915-1-tiwai@suse.de>
 <20191117085308.23915-8-tiwai@suse.de>
 <3b407a02-b791-52a4-2335-e21d8ab732dd@linux.intel.com>
 <s5hy2wdyq3t.wl-tiwai@suse.de>
 <CAFQqKeWgqHwrCSSbLrkuCHkBww2g4dsBcF93SDN_ZK_-KSe5tg@mail.gmail.com>
 <s5hpnhpyng6.wl-tiwai@suse.de>
 <CAFQqKeWPgPWpDgZUPvOqSFUY2Zq=8zW-=LhYimtg0S0Hqpc43A@mail.gmail.com>
 <s5hmucszzni.wl-tiwai@suse.de>
 <3fc820272992362a56881abf7230f1500fdfdd2a.camel@linux.intel.com>
 <s5hblt8z7ow.wl-tiwai@suse.de>
 <030249cd63d754bd70ce5de5c58e04784eecebff.camel@linux.intel.com>
 <s5hv9rgxohq.wl-tiwai@suse.de>
 <ce61828881dea0fffd2c26a92ad2571ab3565404.camel@linux.intel.com>
 <s5hy2wbwo8c.wl-tiwai@suse.de>
 <CAFQqKeVsQ1AjjKgS-HJ0-mg7JbbmMVjJcUB7wbvsbyz9e2TqLg@mail.gmail.com>
 <CAFQqKeWVuJs+bnZsrYAHdke0pZpBSmP71RFVrfwVE3=P4A7hsw@mail.gmail.com>
 <s5himndrmsv.wl-tiwai@suse.de>
 <CAFQqKeUimt32z1myzL+JOXoCUhn7jU1=Mj8e6egQKs+c5CY0pA@mail.gmail.com>
 <s5hftihrkzs.wl-tiwai@suse.de>
 <CAFQqKeU4pA_t=veRm0635pZmxpn=C9sNPPUEHkgavynPYxqwFg@mail.gmail.com>
 <s5hd0dksyuy.wl-tiwai@suse.de>
In-Reply-To: <s5hd0dksyuy.wl-tiwai@suse.de>
From: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
Date: Thu, 21 Nov 2019 13:45:28 -0800
Message-ID: <CAFQqKeUSLTShrFURPKW2ec7bbvfsWc9ofw8BD1cS1ia7Xs3D9g@mail.gmail.com>
To: Takashi Iwai <tiwai@suse.de>
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 7/8] ALSA: pcm: Add card sync_irq field
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

>
> >
> > OK, that makes sense. Thanks for the suggestion.
> > Regarding your previous comment about adding flush_work() to the
> sync_stop()
> > op, would that still be required?
>
> Yes, that's needed no matter which way is used; the pending work must
> be synced at some point.
>
Thanks, Takashi.
I will follow up with the suggested SOF changes after your patches have
been applied.

Thanks,
Ranjani
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
