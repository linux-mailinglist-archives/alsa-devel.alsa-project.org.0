Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 765E545D4C4
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Nov 2021 07:25:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B24D181C;
	Thu, 25 Nov 2021 07:24:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B24D181C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637821526;
	bh=gbK6NiU9VK1qdHHrJL9D6I34RF1fumvAqWl/aIJJPd8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kKGtOHGeQyrc1qf7jSu2NVaKibdtfgxF+o/M/xLRJ+v9hkeeVeymhdeMd0L4bDH9l
	 wEJUWMYMPMYfAujdP89Ij0DvZyacFU+xR8JJgvKxIy3BuiBuoGHmdIuVzAZKsR48n/
	 lDtWHQi5OaQ5Q6Rg1ZxJN2HiIQnBGH8GZ+AhjuBM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C465F804AB;
	Thu, 25 Nov 2021 07:24:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8E83F804AC; Thu, 25 Nov 2021 07:24:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,USER_IN_DEF_DKIM_WL autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BBC31F80087
 for <alsa-devel@alsa-project.org>; Thu, 25 Nov 2021 07:23:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBC31F80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="eBkXht65"
Received: by mail-pf1-x42e.google.com with SMTP id o4so4911340pfp.13
 for <alsa-devel@alsa-project.org>; Wed, 24 Nov 2021 22:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=kioAbeV26jtOfLhbsus8RZ8a8iejlIcHXqYXJ7To1Ns=;
 b=eBkXht65eaQyuRQDrrqCwhAyWn3xzgvUxbldnoSVNCmLIw5i7yhixiswI7oX6tDXIn
 e5VxmyxOwzGNfTqxQYytEWv+s4+GcFrVweqtrK/1Z76qFlfXaq0g925E6SR3StK2J+j/
 FB6zzBJ6IP07wKtdatpdYqJS0QNNQqTErPT+Rp5noIa2gs3eZInhIbe12dJwHI5EXaKm
 jSfsYO10l/rSZmurWnXJb9C9AaQW9o1SviDRMUk6PXZlVVZFipwQ4uji1PKMVUw3Mc3z
 +AoumEWKC9YLtfDNGAhWOeSfQxHNMpo4Zl1Ws3XBY3FvKe9zAODqAohbXMerXt0Q3aSe
 WXtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=kioAbeV26jtOfLhbsus8RZ8a8iejlIcHXqYXJ7To1Ns=;
 b=OCsq6FTaYR9STqOMc4iQsmibfOVH98fvxtH3/7i8thFrzyy6jR7h8cUthRqCqzmPPH
 1opG9IjsXUy+bXcUP+FxFn+HxuH79NARfD6OWiCk19zO1g/7OnmsDY4l0Zg7q8214GQe
 J5X8ETwRLhiv0UJLfxMkFu4U9AG6va/ZBw+y5Mpe6GpviJQ+VqZuSocEGDfGlDOANLhm
 Zk0U5+8j6jJzkll1ovKyUMk9FxGSYSzTgkRA6Bk7pXfCu8sJ6jUnhrL3jh72Uz/s4vBQ
 a7hdTXnwGwXP/Qe0ERK/bXlHZRToTjnEX4PW6pOxZ8w2ygsvHSdQltT5APSzDnARrbc4
 akGA==
X-Gm-Message-State: AOAM533fg8W1kiN95zxVeNelFt4uDEtDXMPlqy5ILlMLb1BBGDPrs++K
 bVUaC0Oc+LsDCOXM6EWNQX5Dig==
X-Google-Smtp-Source: ABdhPJzZmfrw/Y/XnG3KSGm70RCpboamkYNWMx5n6NPi3BL1desf895RZ7uwO1XPBwJ0K0TV+4KGoQ==
X-Received: by 2002:a63:481e:: with SMTP id v30mr13663106pga.33.1637821433350; 
 Wed, 24 Nov 2021 22:23:53 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:cd6a:1959:1c65:cc19])
 by smtp.gmail.com with ESMTPSA id u11sm1800235pfk.152.2021.11.24.22.23.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 22:23:53 -0800 (PST)
Date: Thu, 25 Nov 2021 14:23:48 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>
Subject: Re: [PATCH v3 2/3] mailbox: mediatek: add support for adsp mailbox
 controller
Message-ID: <YZ8r9GvUFqkGCqSz@google.com>
References: <20211124084514.28002-1-allen-kh.cheng@mediatek.com>
 <20211124084514.28002-3-allen-kh.cheng@mediatek.com>
 <YZ4TCYmvegnC/kR0@google.com>
 <f3642bcd031fbfd461b5efae1eba4816cc4856b2.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f3642bcd031fbfd461b5efae1eba4816cc4856b2.camel@mediatek.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 "cujomalainey@google.com" <cujomalainey@google.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Mark Brown <broonie@kernel.org>,
 Jassi Brar <jassisinghbrar@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "sound-open-firmware@alsa-project.org" <sound-open-firmware@alsa-project.org>
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

On Thu, Nov 25, 2021 at 09:51:27AM +0800, allen-kh.cheng wrote:
> On Wed, 2021-11-24 at 18:25 +0800, Tzung-Bi Shih wrote:
> > > On Wed, Nov 24, 2021 at 04:45:13PM +0800, allen-kh.cheng wrote:
> > > > > +static int mtk_adsp_mbox_send_data(struct mbox_chan *chan,
> > > void
> > > > > *data)
> > > > > +{
> > > > > +  struct adsp_mbox_ch_info *ch_info = chan->con_priv;
> > > > > +  void __iomem *reg = ch_info->va_reg;
> > > > > +
> > > > > +  spin_lock(&ch_info->lock);
> > > > > +  writel(ch_info->ipc_op_val, reg + MTK_ADSP_MBOX_IN_CMD);
> > > > > +  spin_unlock(&ch_info->lock);
> > 
> > >
> > > Why does it need the lock?
> > >
> > > Is the write to MTK_ADSP_MBOX_IN_CMD a synchronous operation?
> > > - If yes, I failed to understand why does it need the lock.  Every
> > > calls to mtk_adsp_mbox_send_data() should wait for the data
> > transfer
> > > completion.
> > > - If no, I also failed to understand
> > why.  mtk_adsp_mbox_send_data()
> > > has no way to be aware of the transfer completion.  Would expect a
> > > loop for checking the completion for the case.
> > >
> >  
> 
> In ADSP MBOX IPC flow,
>  
> Host would call mbox send data when the shared data transfer completed.
>  
> (mtk_adsp_mbox_send_data will notice client using MTK_ADSP_MBOX_IN_CMD)
>  
> It’s more like a signal.
>  
> In general case,
>  
> There may be some hosts use the same mbox channel.
>  
> I think it’s better using lock to protect access to
> MTK_ADSP_MBOX_IN_CMD registers

I still failed to understand.  What if 2 hosts notify the same client by writing MTK_ADSP_MBOX_IN_CMD at the same time?
