Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4E95969B4
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Aug 2022 08:44:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 898EFAEA;
	Wed, 17 Aug 2022 08:43:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 898EFAEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660718667;
	bh=Pl8j8nMikEGLv3auuJamJeuxCXOj7rX7d17W0lTlskY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Yq+QiX3Vsci50QLRSRWU6ZXSY3exiEKqokgF/KjriI9QkRExc6Ilnm/WK1BH06G4l
	 M3WjK8dP7CPolnbXEg0o/Fb94NB243GylkFq/5UnYWJFxYBP6egcNU6NKkJLXksB/I
	 8LvIk03aZzv/5cPiCtAAjR3Ww/S/dN7rJHyzTmHI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3A11F802D2;
	Wed, 17 Aug 2022 08:43:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EFCFCF8025C; Wed, 17 Aug 2022 08:43:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8D90F80082
 for <alsa-devel@alsa-project.org>; Wed, 17 Aug 2022 08:43:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8D90F80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="IOxuVGEu"
Received: by mail-wm1-x32f.google.com with SMTP id ay12so6259494wmb.1
 for <alsa-devel@alsa-project.org>; Tue, 16 Aug 2022 23:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=Pl8j8nMikEGLv3auuJamJeuxCXOj7rX7d17W0lTlskY=;
 b=IOxuVGEuuWrhB890xfIpMhVaObL/QznrYMLo0MDJU8skANXcLIpC5rM9IZj9P1k1S9
 RTPEAdpwwl4G0dBwPFBLTa8u7oyRnV9YiY1/D/muF5gBw8zwSV/R+RccjDUHj6/ThBOT
 OV4PiVZqQvt1vUIAoHq/jUZDO3oIqeXHxJK/d2FGT6CLpVYrMaQyZqRk17hxWFlq9Ci/
 LO2AmqpVa4X9M7v/2LShjYzdQUVjSQM0NRDLDUGEG8M1tq3ELCylC683JyE9NYHh4sgL
 sHHHwPUJeHmp17fhNCvWy4DcEu9PEPM5zQCcwH05fw+IjbjE3IShAewKoqv8ZRiSdGL9
 0frQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=Pl8j8nMikEGLv3auuJamJeuxCXOj7rX7d17W0lTlskY=;
 b=OcYoTV4suH9sT0ojDxeVKEpiKo7JoruEGclJmFOsO93mL63OF8UwgUg1q1K2XWYu8H
 CbeBtkuFdJWUde01Be9AXi874ZMgHQYnZBieErGam0nQXV15It3onrrbuPClSEwUtiIs
 zJeHO56EhduVA4QupSqFJmdvUNxgtAmxuprIbfsTV0nqeYyxAVwvuUMAah9qLVSXJGnK
 ea4dNDeSvWUmQ4C6LR+NJRp52sGC5UzWwEsl5EwWRqd1Hut8Zk9SOixUG/BTTzs1hOQe
 5xRKrYM+3ZgabVFxuDgbv1aAGyGjJ2oXeLK1Yv6MQz9w+mCFZfrdvoqq/Xn7Rb2TcjOV
 CFPw==
X-Gm-Message-State: ACgBeo3UpmiCyiCVLxgGTPEZ7Kjyh8vAeqvBKiY7+TCqSNB1LLw3kEqg
 BJSO/LAZ3pBHy8fwS+djboaKwXsEjgbMFl0gRiafyHlK
X-Google-Smtp-Source: AA6agR4zBXMqxaZAI8I9XcEYwlBHvitoY+sgQ8XMVVj+73mhQTWSmHQhCEcvwzy9GHQ1Z5aLc69TnVciuWCbsk4WbM4=
X-Received: by 2002:a1c:f718:0:b0:3a3:2416:634d with SMTP id
 v24-20020a1cf718000000b003a32416634dmr1114507wmh.83.1660718133588; Tue, 16
 Aug 2022 23:35:33 -0700 (PDT)
MIME-Version: 1.0
References: <1660713867-26921-1-git-send-email-shengjiu.wang@nxp.com>
 <CAGoOwPT1tP-HP+0J1ddZ0Ea+67zzLzFFTeptTpNwkzxRK45b5g@mail.gmail.com>
 <CAA+D8AP2okZdD0YBWrxKGAxvp014S+R-dUSrPqbQN_ja3U5D2Q@mail.gmail.com>
In-Reply-To: <CAA+D8AP2okZdD0YBWrxKGAxvp014S+R-dUSrPqbQN_ja3U5D2Q@mail.gmail.com>
From: Nicolin Chen <nicoleotsuka@gmail.com>
Date: Tue, 16 Aug 2022 23:35:22 -0700
Message-ID: <CAGoOwPSgPSV2HOqC=t_NVor8YqxaLxmeDvMf8_j25phsPpcd4g@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Remove unnecessary FIFO reset in ISR
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Fabio Estevam <festevam@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>
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

On Tue, Aug 16, 2022 at 11:29 PM Shengjiu Wang <shengjiu.wang@gmail.com> wrote:

>> > The FIFO reset drops the words in the FIFO, which may cause
>> > channel swap when SAI module is running, especially when the
>> > DMA speed is low. So it is not good to do FIFO reset in ISR,
>> > then remove the operation.
>>
>> I don't recall the details of adding this many years ago, but
>> leaving underrun/overrun errors unhandled does not sound right
>> to me either. Would it result in a channel swap also? Perhaps
>> there needs to be a reset routine that stops and restarts the
>> DMA as well?
>
>
> Remove the reset, the channel swap is gone.

I have no doubt about that :)

> IMO, no need to handle the underrun/overrun in driver, the SAI
> hardware can handle the read/write pointer itself when xrun happen,
> and we don't need reset routine.

That'd be okay then.
