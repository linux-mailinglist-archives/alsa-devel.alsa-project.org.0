Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A30A2653ABD
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Dec 2022 03:39:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F099170C;
	Thu, 22 Dec 2022 03:39:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F099170C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671676792;
	bh=2rqtpBM4U7YFCg1EJL4EERx3WMFIEkUoD3hzdRnCKzE=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=C3RphYUYAj+VbJJTwuvQ6NM0FGAMQmkAZESRvrIyZuOM7cYXFI7XHIvsbhtIjpzhs
	 Iki15OwVndNjhZQ+JyrzpK7KFtlOh2CBFHn7cjK9kPF9HWu3h8CW0jIx14sflVk6jY
	 KwdzOeA2gb7a+rZz90JJpTWE+BWyFwGkluC5DsWw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8569FF8032B;
	Thu, 22 Dec 2022 03:38:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55052F8026D; Thu, 22 Dec 2022 03:38:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E6A9F80158
 for <alsa-devel@alsa-project.org>; Thu, 22 Dec 2022 03:38:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E6A9F80158
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=hxQnwu+I
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-417b63464c6so10409297b3.8
 for <alsa-devel@alsa-project.org>; Wed, 21 Dec 2022 18:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2rqtpBM4U7YFCg1EJL4EERx3WMFIEkUoD3hzdRnCKzE=;
 b=hxQnwu+IPergHL/GDm/YOvOtzhjMwNWg0W6Dbpq0MN6FI8L6esY6zzP4xm61kKJMPb
 Y3pfmqPzSXsH2sMQ9MAXMZsqOVsUIYE7+90XMrJ/nbKcW9da8uQDUOjkJc7F9ci1U/IA
 ji5AshW0wsQNFo4il+CsFgvvqzNdhmI40ZXFAHJidNxwHmOHkqwePthxeY0XQrdav5qI
 rW0znGU8cFooskSLnMERRCuh+tEMzCv/BvC2MWJ09PmeTt4IxZpOauAnTsHaioTbUszO
 wJko2o15RblIyicUv/hT7Anv+AO7kIalKdrhEF27NNFTjOI55CyrcLH+gYZpBHMbHP74
 tNrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2rqtpBM4U7YFCg1EJL4EERx3WMFIEkUoD3hzdRnCKzE=;
 b=l7EXbiQ7Kc0UhPv2GXYmSsOCXMQd2VE1myQ5mQaT7rj4/bMMVnf+D6S8iUcFBbiqIg
 rmc3dGyUgIGEYTq1MHKfVKMf2N5lmx/K9P4gwshnWSemPP5nU073xzHjFB7QX+RTG9h0
 Cht30mR3a6EvdzUDVOOhDGDZavHrW6eaHAmWEaO536AwQgwfiVrvEH9hYSm/2xS6Gprj
 yvX07jNhEx3PtcPWZmzEQ1iTuDMSzSGWxAJ3er/TzFHZg+OSVcAfTFTSnVWYtgXY7XAS
 Uf4oljBZ1aiqRg/n+YLWEtr7x/ukciiOVQqwHKTmaGMQcf+UMxXjg1fl2gfXzreFNasr
 k/fw==
X-Gm-Message-State: AFqh2kqliSiDfSC6ivpP07GkDjqsputqMS4vTEHxM9pdHxu1FMF5MZkh
 aRy/BXcVk/5edhkV7cVtqd5/rzNoUQ8cspnIpshSrw==
X-Google-Smtp-Source: AMrXdXvKJzCFk493wJHzhQkQyWBaWT6jDS8d8BEzv3PgUXqGOVeKLTro06nccHyNJ7D90SZQ7kvJmVdr7qGU0NYIYp4=
X-Received: by 2002:a0d:cb84:0:b0:3c4:df92:a3d2 with SMTP id
 n126-20020a0dcb84000000b003c4df92a3d2mr401485ywd.487.1671676728848; Wed, 21
 Dec 2022 18:38:48 -0800 (PST)
MIME-Version: 1.0
References: <20221216154938.9426-1-ajye_huang@compal.corp-partner.google.com>
 <b0612bbd-2eba-36cf-9c29-7542cf32adfd@linux.intel.com>
 <CALprXBYy9_ax8-xfh0paB59Pn=TB7yVLwtY8vnT_-y5vWd867w@mail.gmail.com>
 <9aa4bffd-bc7e-0e40-3063-5ce80b5fbe9a@linux.intel.com>
 <CALprXBZkhWitJBeenKHxzyQvkf=Q2FDAHKD511oCWC8-SJBK+A@mail.gmail.com>
 <07538266-ea40-389e-9e68-054822121e0b@linux.intel.com>
In-Reply-To: <07538266-ea40-389e-9e68-054822121e0b@linux.intel.com>
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Date: Thu, 22 Dec 2022 10:38:37 +0800
Message-ID: <CALprXBaJx82yCRjc91HLu7jAiEEtBNGM+wcjw0uzu5WaQ3vhXw@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: Intel: sof_nau8825: add variant with nau8318
 amplifier.
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Libin Yang <libin.yang@intel.com>,
 "balamurugan . c" <balamurugan.c@intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 ye xingchen <ye.xingchen@zte.com.cn>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, David Lin <CTLIN0@nuvoton.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, alsa-devel@alsa-project.org,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Brent Lu <brent.lu@intel.com>,
 Yong Zhi <yong.zhi@intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Pierre

On Thu, Dec 22, 2022 at 8:27 AM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
>
> That would be more consistent indeed, no objections from me.

Thank you , I will send the v3 patch with modified string "adl_nau8318_8825".
