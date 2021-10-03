Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C99420397
	for <lists+alsa-devel@lfdr.de>; Sun,  3 Oct 2021 21:21:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0CE6F168B;
	Sun,  3 Oct 2021 21:21:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0CE6F168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633288919;
	bh=x9SABqpRKie2mPDrUwhlRSnKf4/2PfoIZhnOLacOHcY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YP2jS2/SxbnUcqLfvQWnzdLbuJ5a3VQzc6L+mVwHIN4i4rxsfGjyhnKbE3L23VYhT
	 WxDQjWLKRqOX4AcZcTtzAD7ig41iqG224p6IhKwqzF99SYB9CfiGfNBQJkGFGzuh61
	 UVGStAMcUvJYh/n4tCtvAQx1yHmHopn2xvXLuozk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F130F80171;
	Sun,  3 Oct 2021 21:20:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6BBA8F8027D; Sun,  3 Oct 2021 21:20:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8CACDF800ED
 for <alsa-devel@alsa-project.org>; Sun,  3 Oct 2021 21:20:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CACDF800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.b="fwRxnKpJ"
Received: by mail-ed1-x530.google.com with SMTP id dj4so57227211edb.5
 for <alsa-devel@alsa-project.org>; Sun, 03 Oct 2021 12:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x9SABqpRKie2mPDrUwhlRSnKf4/2PfoIZhnOLacOHcY=;
 b=fwRxnKpJDl3IyqA2nmFJ4LIKEfm6yueuX1XC24nRfJOtOUATODtGDH9WiSVqh2io8p
 fdFbQ6GOYOA0SNxY9h4bPgCEjb1LhYIrZdENKjY/tnM2tdGMW80813vmjZWGj31ksuqq
 sf+O7m6mRAUVro1sgm7MAqTJTGjE0LsdEJiLhlXsho6SmOa9ER4oU/d3jWgVZ4ec97qv
 uXoj60Bz2MywPY/3oD1njE/M8aQd7YLVBy7hvFu7zM8sjXmepUl+nI1p66nJbPNnD/OM
 C8XBF8deanREh3mFS0ovJcvlAd0cTwJQBqG4H9Y1rgzeduOPXoI8NN3X3gn7at8HLs7J
 SiJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x9SABqpRKie2mPDrUwhlRSnKf4/2PfoIZhnOLacOHcY=;
 b=6n5ilMsuLU2qLN98Evb1ZV6rFm3cJUL4lJgf920039t78VBe/kDTGdxGEAmaxUhljs
 RpmaO1Ur3gbkmAmIXJ6uqPSteJKr8+vlVWfACE9+YTOGYXTYSbp8TQh6nBwLnNqeoBK9
 rX7w7lywfLip+dEFFbyWXggoMMH8gA4n7rOPQXwJPKdoV7y4F+gAK/fVQg7CTuEcPQuT
 ur7JpZaLMTdKqJ/58I29uGEcAg43ITzbpsSBP5oMHeCl1KLy/YiD5l7v26djHbzqhGAs
 k48rLvnr15zI0gvmSmIB+vU2Z/+SBL1yq992NfUfSqXp8ofm1bhBNXCBHzNde7EO1OhD
 tkig==
X-Gm-Message-State: AOAM5320jDZ62C/2kvNVjdHbI2ssdZKE2AbhSV4BOtHQhj7x4gvj2A4C
 spCJYRC18TY4IVy1lgYC5e8jmsTshZU2keo++bM=
X-Google-Smtp-Source: ABdhPJxeiNMz/Wy3CjeIvJ8eJbY/octZ0Wqvp1t5pIwM2Ozxo20fMHdxxjJHpe+wfTpxd6wfyG7hcgoXphs9t5xFvUw=
X-Received: by 2002:a17:906:584:: with SMTP id 4mr12550005ejn.56.1633288831764; 
 Sun, 03 Oct 2021 12:20:31 -0700 (PDT)
MIME-Version: 1.0
References: <20211002234313.3209294-1-martin.blumenstingl@googlemail.com>
 <1j35pivzho.fsf@starbuckisacylon.baylibre.com>
 <CAFBinCCCQebCEdLjYAfWkF4NDPdma8UzVMhHOhZPVreoV2qd2w@mail.gmail.com>
In-Reply-To: <CAFBinCCCQebCEdLjYAfWkF4NDPdma8UzVMhHOhZPVreoV2qd2w@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 3 Oct 2021 21:20:21 +0200
Message-ID: <CAFBinCDzUvwt6XNEVBjhw5E0rEKWzrvjbPvVAgv77vyffE1yfw@mail.gmail.com>
Subject: Re: [RFC PATCH v1 0/1] ASoC: meson: aiu: HDMI codec control questions
 and issues
To: Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, broonie@kernel.org, linux-amlogic@lists.infradead.org,
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

On Sun, Oct 3, 2021 at 9:17 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
[...]
> documentation on AIU_I2S_SYNC [0]:
I forgot to add the link to my last email, sorry about that - adding
it here to clarify where I got this info from.


[0] https://github.com/endlessm/u-boot-meson/blob/f1ee03e3f7547d03e1478cc1fc967a9e5a121d92/arch/arm/include/asm/arch-m8b/register.h#L2147:L2152
