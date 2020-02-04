Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B56151B2B
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Feb 2020 14:23:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DADA1689;
	Tue,  4 Feb 2020 14:22:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DADA1689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580822581;
	bh=2XsFPcw9+ZQbsApWOqd8sw3h8qIA87GmIs8o+NlwD3Y=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CEUywpbcNdXzCjvSF2KpCUUgRwrADoCy5YmvZk19OlqP8nKYAHkNOqmWw8cP0xez+
	 Tlsysj5JyctvCQMyyuYLT4JLd5QisV8Hbgc/s4LxEsGpyqd8MvWnZVkHR8w7doFCTj
	 4mBRZHUCB0Hb7S3XJ9rqg84FTjPhWzR5KbE0BftI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A757AF800F4;
	Tue,  4 Feb 2020 14:21:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2BAA0F80162; Tue,  4 Feb 2020 14:21:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B842DF800F4
 for <alsa-devel@alsa-project.org>; Tue,  4 Feb 2020 14:21:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B842DF800F4
Received: by mail-ot1-f68.google.com with SMTP id 59so17026001otp.12
 for <alsa-devel@alsa-project.org>; Tue, 04 Feb 2020 05:21:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KVrKWveR9k4x9vzNOToq7s3NXA+2AZmIcAe2EfBCbPo=;
 b=GyGNLajTXwmsYWc6v/jc7MqODevWaIcD6sNp6XH02PoG5ZNiFOt/a1GMSBTEhUF0nG
 lvG4v+K08rWrmWGZZmuaiqRWaHrHzmmxr9lg3+SDNYZB+WKu6UmhyOBeJgcRi5ddH4Z8
 05Kdhnn1+6KFH6lZK+E7dujbomHgHSoWocgqlq/f5354t30twZbZ3Hh8U3B7v1UbIiuc
 cc/nJh+ohP0jhkVlZlVKh8pFltGhW2EodaeyPmsf5uPOPDVeIYizFGevFygN6UL0egqx
 I4OCJe4RJ3dtNbqb4AH8R0tazoJrUlshND/0xBI64ThRkbH14Sn4NECecLkvpegegaKd
 RIhg==
X-Gm-Message-State: APjAAAXqfix0UFvNQdZCTZGSR84src67gehJmUQsSb5Pbb3qmlRx4q3y
 0OTvmKqyS/x82zzXXGX8I6cTmTdudHw7d6sOSro=
X-Google-Smtp-Source: APXvYqw1c/0MBx6lPDtFz9lgiWXHqMXu8272JmBs2BMg2EB4RC2X8iQqu+sRw2BpYMZVaSewmKj+LKnWEmjz+AHpD+I=
X-Received: by 2002:a05:6830:1d55:: with SMTP id
 p21mr22138743oth.145.1580822472473; 
 Tue, 04 Feb 2020 05:21:12 -0800 (PST)
MIME-Version: 1.0
References: <20200204111241.6927-1-srinivas.kandagatla@linaro.org>
In-Reply-To: <20200204111241.6927-1-srinivas.kandagatla@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Feb 2020 14:21:01 +0100
Message-ID: <CAMuHMdVw0crXH+=7e9GGLUR-c-SxZDz9kQdeWxkZyZ9Jx7CVig@mail.gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [alsa-devel] [PATCH v2] ASoC: wcd934x: Add missing COMMON_CLK
	dependency
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

Hi Srinivas,

On Tue, Feb 4, 2020 at 12:14 PM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
> Looks like some platforms are not yet using COMMON CLK.
>
> PowerPC allyesconfig failed with below error in next
>
> ld: sound/soc/codecs/wcd934x.o:(.toc+0x0):
>          undefined reference to `of_clk_src_simple_get'
> ld: sound/soc/codecs/wcd934x.o: in function `.wcd934x_codec_probe':
> wcd934x.c:(.text.wcd934x_codec_probe+0x3d4):
>          undefined reference to `.__clk_get_name'
> ld: wcd934x.c:(.text.wcd934x_codec_probe+0x438):
>          undefined reference to `.clk_hw_register'
> ld: wcd934x.c:(.text.wcd934x_codec_probe+0x474):
>          undefined reference to `.of_clk_add_provider'
>
> Add the missing COMMON_CLK dependency to fix this errors.
>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Thanks for your patch!

But did this change really fix your PowerPC allyesconfig build?
SND_SOC_ALL_CODECS will still select it...

Fix sent.

Disclaimer: tested with m68k/allmodconfig only ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
