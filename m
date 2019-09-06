Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1650AB54C
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Sep 2019 12:05:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6742A165E;
	Fri,  6 Sep 2019 12:04:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6742A165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567764300;
	bh=KCxYEelQ0MulcaXlxNzE6e1YCJhjWNGJ1y+8s3JZGQs=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qx1WbshGn4g8g2N/Ry1iP6qp2RZT/DKJffHvYwVp/I9IN7/gBYI5cS6LVN6Y7H/ph
	 R31s6+m8IRz83zggoWJLgnlZCW8hdKkLLdHpbO1cC798I2KalOgI2Ybj98uREdOFwI
	 a3EvEljvniOSNRXIqtmoMdAj3+LYMQLxOrlSs2Z8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 571B3F803A6;
	Fri,  6 Sep 2019 12:03:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4BFAF80394; Fri,  6 Sep 2019 12:03:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
 [209.85.222.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B82F2F80214
 for <alsa-devel@alsa-project.org>; Fri,  6 Sep 2019 12:03:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B82F2F80214
Received: by mail-qk1-f195.google.com with SMTP id f13so5028466qkm.9
 for <alsa-devel@alsa-project.org>; Fri, 06 Sep 2019 03:03:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xKKnxPPsgAIgwEztVgg1GoTTNsVPqwYHTfDwxBVh/EE=;
 b=mgTUhSTn2l0xPwJL13apUjgjFswfwberOzs5ybjq8LtjVN5Sie3iiZk0gkC3VFokjv
 34Q9wGi5oaB+mcFVdLqwhumAkFf1pPY2ieQyKS8+0YKQcy3O2LG/VXEVthyGRaIPoEai
 kCowYtgQv5cPNGFRupxvheAQx5jm6SDJ95GORini5LMgBW7lPX5sY9zO/gf9OoJE+T8A
 H4CPorNYDshGyPvAyVst85B1pFzKuEvxE+9q83uvw48ZQab2SY+UQU20tvdiRzD9YyYi
 C89Tp3lmgriSavOS8nQ9dy14r1m6rxrlqFA0Uxl4fSank+ou1MDNy/I81tL4qMd352u6
 Ys3w==
X-Gm-Message-State: APjAAAXHtN+vkt3qZpuv6XCTlVBB1DvyxrRfcyaDCAAxHbC/Z9MP1m9b
 ycm19jONeKgskm5PxsWTwZhPut3gLNEylWIL6ws=
X-Google-Smtp-Source: APXvYqxpCALRccn6ODP9KYrflsF0sVz2A7RrYULIVWFnlCGhvGoTB9uHGRbcU86PgkUBURKioMIpZ1WC2hVTyL6RRRQ=
X-Received: by 2002:a37:4b0d:: with SMTP id y13mr7614923qka.3.1567764188695;
 Fri, 06 Sep 2019 03:03:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190905203527.1478314-1-arnd@arndb.de>
 <20190906043805.GE2672@vkoul-mobl>
In-Reply-To: <20190906043805.GE2672@vkoul-mobl>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 6 Sep 2019 12:02:52 +0200
Message-ID: <CAK8P3a38ywYFaGekbi6_idwrZvaVX8u8giUpK1r26QAbekLp8Q@mail.gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>, Sanyog Kale <sanyog.r.kale@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [alsa-devel] [PATCH] soundwire: add back ACPI dependency
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

On Fri, Sep 6, 2019 at 6:39 AM Vinod Koul <vkoul@kernel.org> wrote:
>
> On 05-09-19, 22:35, Arnd Bergmann wrote:
> > Soundwire gained a warning for randconfig builds without
> > CONFIG_ACPI during the linux-5.3-rc cycle:
> >
> > drivers/soundwire/slave.c:16:12: error: unused function 'sdw_slave_add' [-Werror,-Wunused-function]
> >
> > Add the CONFIG_ACPI dependency at the top level now.
>
> Did you run this yesterday or today. I have applied Srini's patches to
> add DT support for Soundwire couple of days back so we should not see
> this warning anymore

This is on the latest linux-next, which is dated 20190904. As Stephen is
not releasing any more linux-next kernels until later this month, I'm
missing anything that came in afterwards.

       Arnd
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
