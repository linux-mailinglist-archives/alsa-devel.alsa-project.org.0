Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF61A1CA1
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 16:25:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0489D165F;
	Thu, 29 Aug 2019 16:24:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0489D165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567088713;
	bh=rDCTNXIavr6m6wH47CtXLBt1Ck+q7zO/cuxPbGAPjb4=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Bum1BLWyWe0N+B6sKG3/zzurxZRyGVrL7oicHAUGkzCunhz9aoVcySZsx1yHhJvkC
	 Ia8OaPM70RmzdKx+bHo/eW9Kyhi77VLz+///TKfgBxRsx3CKVbQ+vSH3uLa+gYJszB
	 2PJBNE4IpJJi9Kd/C1E7PWMtU5xBSSEdDtvNJGVI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 221ABF897C3;
	Wed, 28 Aug 2019 18:01:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3436F897C3; Wed, 28 Aug 2019 18:01:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93249F897C3
 for <alsa-devel@alsa-project.org>; Wed, 28 Aug 2019 18:01:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93249F897C3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="t82bo+7n"
Received: by mail-lj1-x242.google.com with SMTP id m24so29871ljg.8
 for <alsa-devel@alsa-project.org>; Wed, 28 Aug 2019 09:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yR3tqYiTxpppS/HN0rTYfpt0BO2DjSod+qzn1YFlyUY=;
 b=t82bo+7nReRN8qUwONp3FOyUNOQe+SJmGjj43nMjkurkeSF72Pd1VV3hRf1OgE66RR
 KDWoG2kZQnBVJzkM8KDZCFy7mqz9bcKdJSmmEx2dYdkoTRZLvN6pnCl8E0pBhjwKdkJ4
 sf49qG2yOviuQ4Fu1Tm1UKeNFc43o8A1iRxF9LdpIDyvUrr/EXGEZPFdILgnN8BLCa2n
 KW3jLLC38MeV3yMp6xS8/rl6fTmU4XS6EpBjg41uqXmYE0AhDM2igs87zJIiHIANDVPC
 XsI6R22UTUjfppFtkbsj92qJogfUbp92F2UjpP47UJCKAq9rZ+NXm3mNfnDYXCPxjkdA
 RFnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yR3tqYiTxpppS/HN0rTYfpt0BO2DjSod+qzn1YFlyUY=;
 b=asAWio4N2F72Og7wZzzt7w91igYJEABRh1jXINhNNZ39zK9l7J6k/hwgAdIH9K6/zs
 DA6o8NOrUuqvmoVKHTtazav/gAY7g82jELUtBjSXLpYg2rZzwU4tmNZsNvS47yeGyp59
 Pp0EjUjHJSczZJJQT0Cr5Dr6qsod804PITZ3UiqzuG0J7m5KbcfiXiMKmo4mp9oJSlJp
 JbSdfW/3pETxPFXfMRaMkrkGxz7I/AYbATJyxCk0AWnlxOidr2anM0s+KVlGkIGdgrez
 y1QgWKSNDGy5okQnoop8SVQ/CRe+wdRwlGazu5LNUj0VTWaRVMuxv5mhVzDNAaE5UbVx
 yr8g==
X-Gm-Message-State: APjAAAV9TdC2gedJo4kjWCF5gPicWAbF9a9cHXxGWnAJt7caZz/11sB8
 ltLEl52N4vE7yAEH199IIKmKRDS6H17YfSeutUk=
X-Google-Smtp-Source: APXvYqyOP2EB8a83ZtqOJPUj3xY7/goLSp49RDBCXTtxODlPCxl+xIBbp0pHHEXIFG32IeOGVr0WeRsO6J9J5w8UT1g=
X-Received: by 2002:a2e:978e:: with SMTP id y14mr2524405lji.10.1567008091865; 
 Wed, 28 Aug 2019 09:01:31 -0700 (PDT)
MIME-Version: 1.0
References: <1567012817-12625-1-git-send-email-shengjiu.wang@nxp.com>
In-Reply-To: <1567012817-12625-1-git-send-email-shengjiu.wang@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 28 Aug 2019 13:02:32 -0300
Message-ID: <CAOMZO5BF6M4McwGTuNU8jM41+N3jeaJp+U2ST5JY7e+yv8GO_A@mail.gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [alsa-devel] [PATCH] ASoC: fsl_ssi: Fix clock control issue in
	master mode
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

Hi Shengjiu,

On Wed, Aug 28, 2019 at 2:21 AM Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
>
> The test case is
> arecord -Dhw:0 -d 10 -f S16_LE -r 48000 -c 2 temp.wav &
> aplay -Dhw:0 -d 30 -f S16_LE -r 48000 -c 2 test.wav
>
> There will be error after end of arecord:
> aplay: pcm_write:2051: write error: Input/output error
>
> Capture and Playback work in parallel in master mode, one
> substream stops, the other substream is impacted, the
> reason is that clock is disabled wrongly.
>
> The clock's reference count is not increased when second
> substream starts, the hw_param() function returns in the
> beginning because first substream is enabled, then in end
> of first substream, the hw_free() disables the clock.
>
> This patch is to move the clock enablement to the place
> before checking of the device enablement in hw_param().
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

It would be nice if you could add a Fixes tag as well.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
