Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 427721615AC
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 16:12:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF6C4167A;
	Mon, 17 Feb 2020 16:11:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF6C4167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581952329;
	bh=jjWW/TdfSh7TIkxYe/HDrmCHX2tg+HWTtXZef2rvoDE=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UwwiG8HkSS0UjJSs9lukPUspHZCwVHV4zwmbpFSqiICmhLMLof0tHc2AQPIfX/jfE
	 kKX81RS3TW/KzXWTQ2yoAjLSP8AghdkqcdkMgisiasCtmtY2Aa0XhTFQxuAmLRrUQN
	 vIHmHQyMqOXQSXI3G7/KkYDtPWxMmIrqaocXLpeM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2F1EF800C4;
	Mon, 17 Feb 2020 16:11:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C82EF801F5; Mon, 17 Feb 2020 16:11:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06379F80096
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 16:11:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06379F80096
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ojab.ru header.i=@ojab.ru
 header.b="bugPKFwp"
Received: by mail-vs1-xe43.google.com with SMTP id p14so10560491vsq.6
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 07:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ojab.ru; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qDrsHCqzOJSGzZxsJvq3uCka6/zV41PReEFhdfgZzLw=;
 b=bugPKFwps3gcgpDw18lVDQKvmYLwc1Mb2Md6a6ii2HUwjmKwHfadWNjOyjNbCkB5Qn
 MJsVV/iG7Gn5RSKljPc2d30pPsdl+tQ/rvLu15GLtmzZIp6uqIJW5wEpy9QPX2BLJqf5
 JZZCvIk0JfcR2ztIs/M1oXdpJhFLUVKwL+kco=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qDrsHCqzOJSGzZxsJvq3uCka6/zV41PReEFhdfgZzLw=;
 b=tG2Y8eH3qP7rddXhn1UHsYNb3/SzJ4JuZefSGkA9MJSAZJz/cqJLCR2SGlbSEoEuCz
 s0BKgz08dS0kIxd57ntLQH7z5uS3qjIAat3Sbz1zCgQISdxT5TAcAS0MD0U3eOZDLjWX
 cY1J6gJ3PPZXOtfKJ7wR6Wpgdn93yNQwtmIGqHeWtjCC7eaMu8O6+suUbTKk53HT0prD
 IzkLtVprzvwWzsdmC8Gq/H3z31AoefVKGRf2J7BybcQrXevlx3S2k0LZNCkEeg+767SP
 G9miIFXZVZ/TWLWv0Uxh+uIulwMjyqai5tkgFPfjBM9ZjSxcn7bBn3/8ue3y9einfxDc
 3NUQ==
X-Gm-Message-State: APjAAAWqP2FuqPZczc4tG3U3ud3btVmK0glBHHbzyskYBXt3MKIbiYwu
 pK8CqmuBoIQyb4pHo1qeZchA8NwO256pGzMTd/utQw==
X-Google-Smtp-Source: APXvYqzhRZHagOk8MCS4WxswV2u7jOZOL8UuHiuBdm5QySlhumfkYxxiQlHiBvEfJLrl8zgvPswI3w/PYJvjd9MTWBU=
X-Received: by 2002:a67:e94c:: with SMTP id p12mr8276324vso.84.1581952266628; 
 Mon, 17 Feb 2020 07:11:06 -0800 (PST)
MIME-Version: 1.0
References: <CAKzrAgTD2oeyajKGOaPea98vZ-uKJOn6uOqABA+CKtpvYpWYvQ@mail.gmail.com>
 <CAKzrAgTCE4btXr04pkvLUG6PPbtn9dm5h_9rjqDYG0HrTZ0zbg@mail.gmail.com>
 <87h80x8t41.wl-kuninori.morimoto.gx@renesas.com>
 <130af222-1086-ebcf-6a0f-9a390f9afbc3@linux.intel.com>
 <CAKzrAgRJZd4UZjt411vA8WwUv1KyVahVTNyUS8nA1TbKsA57dg@mail.gmail.com>
 <14259e97-72f5-439f-b2f1-356b6e45bcfb@linux.intel.com>
 <CAKzrAgQR0iZWPCudQ6k+RNWGk3L-=UU792RW6s7LxF+8wOPDUw@mail.gmail.com>
 <7de214eb-d6a0-3f86-9eb3-76488f0ec99f@linux.intel.com>
 <87r2001bsi.wl-kuninori.morimoto.gx@renesas.com>
 <6d0f1830-a2f0-997a-99cc-05c268acefc6@linux.intel.com>
 <20200116145708.GQ3897@sirena.org.uk>
In-Reply-To: <20200116145708.GQ3897@sirena.org.uk>
From: "ojab //" <ojab@ojab.ru>
Date: Mon, 17 Feb 2020 18:10:54 +0300
Message-ID: <CAKzrAgQapgQtxMLYjEe9mSaXp_uYxMyH8fwvoJqM3Or0sqqfiw@mail.gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: Re: [alsa-devel] No sound since 5.4 on skl_n88l25_s4567
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

On Thu, Jan 16, 2020 at 5:57 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Wed, Jan 15, 2020 at 07:04:48PM -0600, Pierre-Louis Bossart wrote:
>
> > Maybe we could have some sort of boolean flag in the component->driver
> > definition and explicitly request a backwards-compatible behavior (e.g. for
> > all SKL/KBL machine drivers) when that driver is known to be flaky. There's
> > already things like 'fully_routed', maybe we can add something such as
> > 'disable_route_check'?
>
> A quirk for old stuff that can't be fixed sounds like a sensible
> solution to this.

Any update on this?

//wbr ojab
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
