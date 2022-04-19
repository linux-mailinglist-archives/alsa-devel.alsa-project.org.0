Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CECD5061F2
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Apr 2022 04:00:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F63216EB;
	Tue, 19 Apr 2022 03:59:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F63216EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650333635;
	bh=fRr6wX0i3nxYWOHj1ahUcFHQgyhC0jpanOrqYCD4Ygw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NSRvgIq4vh5dvQKCtS3LpXA+I/6ye8yIx34YyrI3zkR8pNSbQ3iawdhDFm24+s5L1
	 gBjGm1LgmExkbWX/wp0uCloRDDtSvIJn8xBb8jtXddxFaDTwRhf2GwT30KU2Vimp1K
	 lnF5mg0YErOR/iYbB7HM8NffVZeYwcarAFQ5Gs20=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 263BFF804CB;
	Tue, 19 Apr 2022 03:59:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45D82F8025D; Tue, 19 Apr 2022 03:59:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, SPF_HELO_NONE, SPF_NONE, T_SCC_BODY_TEXT_LINE,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 39DABF80116
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 03:59:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39DABF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="M9TlNCxx"
Received: by mail-qk1-x72a.google.com with SMTP id b68so7739173qkc.4
 for <alsa-devel@alsa-project.org>; Mon, 18 Apr 2022 18:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wCsQtD2NQ+gbeoKp9EzAjHzyK6SBXrAkZNvU9pPrYqA=;
 b=M9TlNCxxcBX0yUHiIVEapcv8P3OPBDK5VOwlHdUva2h3+sMA0gk7fJtp7stFVeb8CY
 HYTNcluvwI0Sgg42bXELRbBOCihfzVIb5lpF8DVz/ljn7GPxht0cJSqtxrlfSHIDr+qK
 mVpxQfqMgMwWpGRBRWzBwHLOCb+qKSrk9it8C0Ai0PGUwlJc1EdrAgnZlhHRz1q8fv9+
 rqzkmxsv26cA7Ha1t4s5ukPeM4hDhXlnW8U8m8pb1KYOJXjj5BnpxsyCXMS86WHXhVPx
 /5lKSn9NdL4M1vNq+YiAoWFCPvEb1mR2rcroAF0mpO+YkQioXAtJ6yXAge0kiLzkYxyI
 CYRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wCsQtD2NQ+gbeoKp9EzAjHzyK6SBXrAkZNvU9pPrYqA=;
 b=3+EjcN32YbbpM/XSXOcelPRITpWi+pB6yqBLqxN5C0ooadgQky/f+oc0H/75+52vE9
 nwVVCjrbZf+VulUqrzvAtidReKkiadj9qadVQn8QGZLWiMihpWcehJ/55zLlMjdBYjiJ
 YjFQOKh1ER/3wNUnAKjqwzKr4fSBBwFlBl+Xdq9zN0xjYHKvGcwCEgOGpr0Dv+BMIJVb
 WS88AYpUCectN6K7ECkH98rLBi2Db3xfL0WFfCW4JuOIGbcf7CPhxulpPy+WqiQMnSQx
 tEwxGuLmgdf8Hejdc1JA51Sy7IYhmrvXcnugpkzkGSWb76yC/BVCbL/+E8sRWx1/ofje
 gVQA==
X-Gm-Message-State: AOAM5309JfojsIocY9r1YhlXJls+sIqwa0+LpiYFp3twqG3fKRjkDUXd
 qW/6vtiiNJb+k67gudh582nv1On/Fdt2S8l6ErQN6Q==
X-Google-Smtp-Source: ABdhPJymdwkKvk3KkRb/O6pCJ7D6/9Nv7MBaNf+tmHbYqlewiWquB4d2TgeCmsw5i4kp2kBKCwfxtnz9T03ex9VIObA=
X-Received: by 2002:a37:9603:0:b0:67d:da02:19e8 with SMTP id
 y3-20020a379603000000b0067dda0219e8mr8458309qkd.242.1650333568819; Mon, 18
 Apr 2022 18:59:28 -0700 (PDT)
MIME-Version: 1.0
References: <Ylk5o3EC/hyX5UQ0@google.com>
In-Reply-To: <Ylk5o3EC/hyX5UQ0@google.com>
From: Curtis Malainey <cujomalainey@google.com>
Date: Mon, 18 Apr 2022 18:59:17 -0700
Message-ID: <CAOReqxhDpmexe_aLHb2-ESjSE2uij2SrPxRCZD3YxZm0JjtwrA@mail.gmail.com>
Subject: Re: [Sound-open-firmware] out-of-bounds access in
 sound/soc/sof/topology.c
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Ricardo Ribalda <ribalda@chromium.org>, Tomasz Figa <tfiga@chromium.org>,
 Sound Open Firmware <sound-open-firmware@alsa-project.org>
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

> Now control data allocations looks as follows
>
>         scontrol->size = struct_size(scontrol->control_data, chanv,
>                                      le32_to_cpu(mc->num_channels));
>         scontrol->control_data = kzalloc(scontrol->size, GFP_KERNEL);
>
> Which is sizeof(sof_ipc_ctrl_data) + mc->num_channels * sizeof(sof_ipc_ctrl_value_chan)
>
> For some reason it uses sizeof(sof_ipc_ctrl_value_chan), which is not
> the largest member of the union.
>

For the record, this could be hitting as far back as 5.4 as I have
been trying to debug an invalid IPC write in JSL.
