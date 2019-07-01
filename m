Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5875C0C4
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2019 17:59:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FF8A169A;
	Mon,  1 Jul 2019 17:59:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FF8A169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561996791;
	bh=GG4cywtFT0GVffgQZsn78kdTZdUALbVTVrrlThnnEnQ=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Yop1TN7/7LgYcyMGYBO/JopwI6b3v/I0iYNCqCvoyJ+1HCDeemaZnkXtJGQGUXNE4
	 W9kqF09GltCD9BGaekN4YYH8eSVdRW6g1iYllIgWQ0u2/jPc1VbEwiQLpIKNmM55zd
	 iGSB16jJIn4UP1qHhmryM6rTZijrMLBBLPbOt81Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7DF25F80090;
	Mon,  1 Jul 2019 17:58:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5081DF80090; Mon,  1 Jul 2019 17:58:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ABD2BF80058
 for <alsa-devel@alsa-project.org>; Mon,  1 Jul 2019 17:58:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABD2BF80058
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="cJtp1S7s"
Received: by mail-lj1-x244.google.com with SMTP id v18so13750518ljh.6
 for <alsa-devel@alsa-project.org>; Mon, 01 Jul 2019 08:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e81E/ko3LJmCEpD4MXZTen4sbl8whJVU0nJ9idHhAP0=;
 b=cJtp1S7sXiZlY3dfkxxivVwU/JMH10aQ1E0Wv4JuPDgywEa9jJQG/7dZ04u6Fh3TWX
 dwZirShZRXpIV44J9j0ODM4xfZ/46cjcYnd1gLCnxr2dR1G6INpsBUQyX0dvVA9eUKEk
 h973rZ6Gf6PE0mIwGLYzKBGS4jg+0LrPVOZh8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e81E/ko3LJmCEpD4MXZTen4sbl8whJVU0nJ9idHhAP0=;
 b=In2WnXeunL1oO23Zm9QjOctXo2reYlrarqs2PF5+Gn4s+XiEmOmLVff5L3iKoVH1uH
 BS5m5AZ6bEmoY2K+00aov9w1x4K4yC1fO2AlEYKVtu/R5ME5xftaCB+aFEwkRTYYoDID
 HRQzC8dziMw2P8DrKGXyF+zmwAnI2+UZqWiwt50zEr5kvXmcVVYOsC40u+bKdFFr3OLM
 w8Rgr8LPD+Xy8rjrjHyDA+8uKjUl3hGBTiERLbew6oiztpSn1wJ4tOuu+HYgGI55VyLD
 C97+59E7EQKQNrJmqLkuItyu2ISSGV8ONDmSXk9gNuBoqdUA9EowEF6TjWn7LfNlF8Lc
 24eg==
X-Gm-Message-State: APjAAAWDoWA6rnEkh5sC/kjDKBSTFF0Fk55Hl/yensVeDVPKvc5Idqf3
 zLh2A29FrrwvqMnml/TZLwc+1UNBrUI=
X-Google-Smtp-Source: APXvYqxQa3k30FHjcZVFDvu/chfztZhakef9Wybe4oR5WCALmEeyAbLqC9RJ1WmlRwNTzJCe8Y8M0w==
X-Received: by 2002:a2e:8892:: with SMTP id k18mr14684597lji.239.1561996680349; 
 Mon, 01 Jul 2019 08:58:00 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com.
 [209.85.167.54])
 by smtp.gmail.com with ESMTPSA id l11sm289113lfk.1.2019.07.01.08.57.59
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Jul 2019 08:57:59 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id x144so9161560lfa.9
 for <alsa-devel@alsa-project.org>; Mon, 01 Jul 2019 08:57:59 -0700 (PDT)
X-Received: by 2002:a19:3f16:: with SMTP id m22mr11771250lfa.104.1561996678581; 
 Mon, 01 Jul 2019 08:57:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190626212220.239897-1-evgreen@chromium.org>
 <20190626212220.239897-2-evgreen@chromium.org>
 <s5hlfxh6e4p.wl-tiwai@suse.de>
In-Reply-To: <s5hlfxh6e4p.wl-tiwai@suse.de>
From: Evan Green <evgreen@chromium.org>
Date: Mon, 1 Jul 2019 08:57:21 -0700
X-Gmail-Original-Message-ID: <CAE=gft43b6RsLMO9LDSD+uhomr4pV9-WFs5aB1u5Z=q-zsV-hQ@mail.gmail.com>
Message-ID: <CAE=gft43b6RsLMO9LDSD+uhomr4pV9-WFs5aB1u5Z=q-zsV-hQ@mail.gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Amadeusz S*awi*ski <amadeuszx.slawinski@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [alsa-devel] [PATCH v2 1/2] ALSA: hda: Fix widget_mutex
	incomplete protection
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

On Mon, Jul 1, 2019 at 7:09 AM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Wed, 26 Jun 2019 23:22:19 +0200,
> Evan Green wrote:
> >
> > The widget_mutex was introduced to serialize callers to
> > hda_widget_sysfs_{re}init. However, its protection of the sysfs widget array
> > is incomplete. For example, it is acquired around the call to
> > hda_widget_sysfs_reinit(), which actually creates the new array, but isn't
> > still acquired when codec->num_nodes and codec->start_nid is updated. So
> > the lock ensures one thread sets up the new array at a time, but doesn't
> > ensure which thread's value will end up in codec->num_nodes. If a larger
> > num_nodes wins but a smaller array was set up, the next call to
> > refresh_widgets() will touch free memory as it iterates over codec->num_nodes
> > that aren't there.
> >
> > The widget_lock really protects both the tree as well as codec->num_nodes,
> > start_nid, and end_nid, so make sure it's held across that update. It should
> > also be held during snd_hdac_get_sub_nodes(), so that a very old read from that
> > function doesn't end up clobbering a later update.
>
> OK, right, this fix is needed no matter whether to take my other
> change to skip hda_widget_sysfs_init() call in
> hda_widget_sysfs_reinit().
>
> However...
>
> > While in there, move the exit mutex call inside the function. This moves the
> > mutex closer to the data structure it protects and removes a requirement of
> > acquiring the somewhat internal widget_lock before calling sysfs_exit.
>
> ... this doesn't look better from consistency POV.  The whole code in
> hdac_sysfs.c doesn't take any lock in itself.  The protection is
> supposed to be done in the caller side.  So, let's keep as is now.

Ok.

>
> Also...
>
> >       codec->num_nodes = nums;
> >       codec->start_nid = start_nid;
> >       codec->end_nid = start_nid + nums;
> > +     mutex_unlock(&codec->widget_lock);
> >       return 0;
> > +
> > +unlock:
> > +     mutex_unlock(&codec->widget_lock);
> > +     return err;
>
> There is no need of two mutex_unlock() here.  They can be unified,
>
>         codec->num_nodes = nums;
>         codec->start_nid = start_nid;
>         codec->end_nid = start_nid + nums;
>   unlock:
>         mutex_unlock(&codec->widget_lock);
>         return err;
>
> Could you refresh this and resubmit?

Sure, will do. Thanks for taking a look.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
