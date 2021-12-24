Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D1747EC03
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Dec 2021 07:23:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8188E1856;
	Fri, 24 Dec 2021 07:22:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8188E1856
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640326984;
	bh=3E+D840h1QgViHB8iK4/k5kBUnpXJ37RoDLa8dcrjM4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NVdVBG8yqm0RgrErub+kxOQ6hEn4mvGLKZhqb8QMWS2qVF1jSZQPsn2VRp7ri+c1x
	 0/H9pDLHXrKhBhD5fhhTGawIoyX7GnLQgLYrRbRIbhKl7pIrpxT3RCFskDQeov+Plc
	 yXc92eTH0iMRrUP2Z1wyTuA77iSXU2Q8NTxZ88jU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A06EEF800FD;
	Fri, 24 Dec 2021 07:21:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21964F800FF; Fri, 24 Dec 2021 07:21:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DDFE9F800F3
 for <alsa-devel@alsa-project.org>; Fri, 24 Dec 2021 07:21:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDFE9F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="GmUZAkmI"
Received: by mail-pl1-x62f.google.com with SMTP id c7so6014475plg.5
 for <alsa-devel@alsa-project.org>; Thu, 23 Dec 2021 22:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sNpxwzLQQ6ADONuABqcXLxGvwIlj1QGrF7+dtH+1LOU=;
 b=GmUZAkmIZOcRLa10vWcuvWP4LRA1og/BAQ++pEm399YMHDpglcUCZu7u7yvDKKtHSb
 3PnYSflcfw/+sKzQnWkRpmn3m4BnSO6E+ve2TMqquar18IvYQtVQQBgMUEeB7yqkf0QO
 BHllzHB8rFICQTTkZmnnwTqVcr4L176uKW2xkT0o+w+kD1KkzRlWgffPFtgsFEf0ep1A
 2PqQZuaSzUnrasEGhUcCZ0/dC+M2aytflXq7CaMWWIHvioJAunPvqf8RRUFsZwK03b9U
 z+yf8IspNjlUljuHVX5FspZ8e5eJYTjbM6y6E9HsAsr/QBbn9B4CJyL+3V3aA3aGVBXh
 FSsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sNpxwzLQQ6ADONuABqcXLxGvwIlj1QGrF7+dtH+1LOU=;
 b=BkDk0J0U/3L4TVp4DGmpSokTsOYVLraLsdKuIiQmtRWqahThEOcOaHkW5P4TJ0z6nG
 Wd8t7Q8D2stCslMaTWZvhEXhaEOhvdCclOV2eEuncTUAIlvhOWc+1qXlBzi9Gj6Gpv0v
 01BNnhxnZn1AH6BzGssyRkH0P1PWnI/3Vr7vqh0LPxnEpH533lQrpTC+JScTDdYuIvZa
 qQSgiBCPMCHf70S7THlMRFAu+57RIA/GKitejN0LLRn+vfcbDunnEw+je+sz27aLLuPy
 tvHburv7M48QJELwdtUyI5U33qi4N3Ob0vhwLBZpn0mLiRG+jBAj+bNjLxQtUb37mCo+
 naLQ==
X-Gm-Message-State: AOAM533T50n0WtvNPXnolGxVNZgl31UGft+GeI1tijWk3zUujC5+abTa
 xDc8id7/kyGw7zj+KghewnPixWhgfp8evH7y5npFLw==
X-Google-Smtp-Source: ABdhPJyhDvNGhoociXAck/G2JM4Se0qdVi2Xqx6nfDisVkKSnKsJu5HmedXIB1DJhmn1AP+qqh+OmfwaiDIXyRdEh+Q=
X-Received: by 2002:a17:90a:fa12:: with SMTP id
 cm18mr6332101pjb.141.1640326904644; 
 Thu, 23 Dec 2021 22:21:44 -0800 (PST)
MIME-Version: 1.0
References: <20211214040028.2992627-1-tzungbi@google.com>
In-Reply-To: <20211214040028.2992627-1-tzungbi@google.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 24 Dec 2021 14:21:33 +0800
Message-ID: <CA+Px+wV5HydJdxmoEF7HkkBcAE_jbmtyBeAE62yuKMUJM=jGLA@mail.gmail.com>
Subject: Re: [RFC PATCH] ASoC: mediatek: mt8192-mt6359: fix device_node leak
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 =?UTF-8?B?SmlheGluIFl1ICjkv57lrrbpkasp?= <Jiaxin.Yu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
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

On Tue, Dec 14, 2021 at 12:00 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
> Option 1. Machine driver makes sure the object is valid until registered
>
> This patch adopts the option.  It needs snd_soc_register_card() to call
> of_node_get() somewhere to hold the reference count of of_node.  However,
> I failed to find similar logic in soc-core.c.
>
> Option 2. Machine driver borrows the reference count
>
> This is what [1] adopts.  Decreasing the reference count in device's
> remove() to make sure the object is valid for whole sound card's lifecycle.
>
> [1]: https://elixir.bootlin.com/linux/v5.16-rc5/source/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c#L1065

I guess I have found the answer to my original questions.  The of_node
in snd_soc_dai_link_component in snd_soc_dai_link is mainly for
matching the component[4].  snd_soc_component itself should hold the
reference count.

[4]: https://elixir.bootlin.com/linux/v5.16-rc6/source/sound/soc/soc-core.c#L749

In summary:
- ASoC doesn't need to hold the device_node reference counts.
- Device nodes can be released after components have bound.
