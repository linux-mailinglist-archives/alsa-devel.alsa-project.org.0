Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8FF10B657
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Nov 2019 20:06:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 340E316F1;
	Wed, 27 Nov 2019 20:05:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 340E316F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574881564;
	bh=2fkgyxLOVZBQbF2I+GN1tN4NdUcC+pA/TBSdvxJDcrk=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T8qeNxRuEHgdXyWpW5wjq+TGZFO/kjIIvwuTc8VtqLYVl2V2TdfUiYJPoSlGN5dsX
	 tQh3ipwRHnFcC9pLn/iMx/VAFAzYqDAG+TgTh58nCf6mo9ch1iGoIaw1JKjgIXqZL9
	 OGmJz8+Qc4ygnJ4oOABSqn8/m5bK7iXE2eILeyGo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1987F8013B;
	Wed, 27 Nov 2019 20:04:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3D4BF8014D; Wed, 27 Nov 2019 20:04:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F207F80109
 for <alsa-devel@alsa-project.org>; Wed, 27 Nov 2019 20:04:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F207F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="iZRo2n67"
Received: by mail-qk1-x743.google.com with SMTP id m16so20482961qki.11
 for <alsa-devel@alsa-project.org>; Wed, 27 Nov 2019 11:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CBEPvt39GtWJ4euUwX2i4cwLlsh1NYHp/HTc2zlbmgw=;
 b=iZRo2n67zphI1YVjGSzpdi/Gsq7FTpZTGr/zkZzVpO7CPA4PRZQJbNXsW1uUV2BNyW
 qRMn4hoAMheTuFgIha5UYPxKU/vEbjJtb1OxZqesXPzt28zSdyL3lGc0Y0YvW2I4pLSm
 wZ4MH+PE0q6gVc9ULg147DdB+PKpu7S41vUOuI3TqMtKQeCpusun7ocpWW3JWLIhK2hJ
 KFw7XYikPftrN9X62KvGJEUEU5u7HoE+PYXKabwtOly8HK8sKaUNNi5fnQSI/54xNZtC
 Kv4SgempGQwhNB80aFTp/ZzPbzUFkeim2UOHn2AF5aDBqq73YJrXd8tCDhmgcdGSKnKd
 JlOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CBEPvt39GtWJ4euUwX2i4cwLlsh1NYHp/HTc2zlbmgw=;
 b=NCsAuCPYHf0OJyBNwvFmdErYMWqCLQIplVW/8Va2VaKF5mNTbG40FX8MuCI1i9RQ88
 TLxMLAWipnKVhMzkFfx/evKnH9sWV/EAkl2410/4L7FBRrtufnPezuXTEJ+z0wbavyck
 KpZcqGrm9g9Lx5JZ89z0kFbTjdwGIfnZWDTFJY+3tBiQgELoZqf99obK0Z7L6FeC/vMd
 zMhZWlGZDX5FoHUg+zDTeSiQjOq3A61WbMVGeNxHXrwqIf5AjiuKTlCyGKVJedOvghzp
 3u+D9LPmdpbY3BQqQFKteYjxUHQ0GLjariXRF4Bg19p7qICSnpBw8vjluRvdQz6diEGd
 ajaQ==
X-Gm-Message-State: APjAAAVP8LKlxHKY5u87ZT6f5mXO281vE8522tU63euoN42txaxGLumI
 8CAnQUEwBj0tm1NYhVqXq3eZ12YkkwnUpU6fQSqht1mS
X-Google-Smtp-Source: APXvYqzhM7fakEoOB8+zth7CEIE9CEUD61L7Yhk8xyEHZ3/k+Whzxfp08WVogqRriBy1/AjdC5bDra8cl3CdbWQv0J8=
X-Received: by 2002:a05:620a:13c2:: with SMTP id
 g2mr5933025qkl.158.1574881453054; 
 Wed, 27 Nov 2019 11:04:13 -0800 (PST)
MIME-Version: 1.0
References: <CAOReqxjFaWhYCzzyZ90Pc5EvzUky6kCYqakz2XBwSOii9d3maA@mail.gmail.com>
 <s5hv9r5wmsz.wl-tiwai@suse.de>
In-Reply-To: <s5hv9r5wmsz.wl-tiwai@suse.de>
From: Curtis Malainey <cujomalainey@google.com>
Date: Wed, 27 Nov 2019 11:04:02 -0800
Message-ID: <CAOReqxg-ZRM5sBZhkPbnMr4MM_Jya2agba5NDWyQc_Wzmc92zA@mail.gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Dylan Reid <dgreid@google.com>, Jimmy Cheng-Yi Chiang <cychiang@google.com>
Subject: Re: [alsa-devel] Headset button mapping in the kernel
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

On Wed, Nov 27, 2019 at 4:01 AM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Mon, 25 Nov 2019 20:25:53 +0100,
> Curtis Malainey wrote:
> >
> > Hello ALSA Devs,
> >
> > I am looking to get some feedback/ideas on a possible change to
> > headset button mapping. Locally we are carrying patches that implement
> > the mappings in the machine driver (which we understand you do not
> > want upstream.) We are looking to see if we can add a new API
> > (something like a sysfs path potentially) to have userspace pass in
> > the mapping, if it chooses to, so the mapping can still be done in the
> > kernel. That way we can carry just the config locally and remove some
> > of the kernel patches we are carrying locally. Thanks.
>
> I guess you're referring to the mapping that is currently done via
> snd_jack_set_key() calls?  If so, an additional sysfs or such
> interface would be handy, and it should be relatively easy.
Yes this is what I was thinking.
>
> But a proper sysfs entry design is another question; it's an array,
> and this can be set for each jack object, so not that trivial.
Agreed, it will likely take some work, but it is good to know you are
open to the idea. I can start looking at some possible designs and
share them here. Hopefully will have them in the next week or two.
>
>
> thanks,
>
> Takashi
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
