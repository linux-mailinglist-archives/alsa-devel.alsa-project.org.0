Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 082CAAB79B
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Sep 2019 13:58:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8643915F9;
	Fri,  6 Sep 2019 13:57:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8643915F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567771114;
	bh=xOKas7d/dEwRdERPnpqEQp9TaQ1ggkiLFO/cYoBoeQ0=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W7Ozzf2EnBDjEUJN0mVcDzDV5l/0AORLKN18iyZYMbIJzrHtZcTmHO8VeD7rhToyP
	 frVNUUnsPN0oYOkDOkUbByYtGgFjm9E/HFy4Bl7vBTrAdSOwq4hS1x81mY1WHQPp0x
	 Od/SvqDzdH4aSuq4ID9QBmU+j01YN+NjyQsl0v5I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE5D6F80394;
	Fri,  6 Sep 2019 13:56:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74BBDF80394; Fri,  6 Sep 2019 13:56:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A19BF80214
 for <alsa-devel@alsa-project.org>; Fri,  6 Sep 2019 13:56:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A19BF80214
Received: by mail-qk1-f194.google.com with SMTP id u184so2396693qkd.4
 for <alsa-devel@alsa-project.org>; Fri, 06 Sep 2019 04:56:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7F1mUtKY856FJCLvPUe7oWqK5RgOugdtEGZ/H9fzbmY=;
 b=nMAYbHP8/eMKE9jgpdSyF/unFAN53WGwRrGlrXAkKMtFEorLbYB12BX9TJ2Bk0S7v9
 FEBRtdqlk12C05voL7MUT+cfLNhv9kXA2rVj6dohfRTOCAEl185ClOrD16Upsi0sfYZf
 uRz6pqA2mJLW4dLyfY5PIsTTbN3z1uOKW+rSLaJ+AzXWJIKOog1SrNu6Igo8ONCmSC/2
 llPrbaNCnoVPe7Gt5JgdNHWSdJyNM6pv+S75hFR7Kky0Pholl4hD2YSS0TbW+vIKHVqO
 am96z297uNsa/K6IXiprTIYuR64fguwtjQ7AllL7e5d3Iq/bO7oNeOIMl+AUDhYbjsQ8
 H3VQ==
X-Gm-Message-State: APjAAAVVTO5SDcz4WZdTWdzKF6h9yY/qGY7ZDKZHNpSgirMp7dnA3auX
 XvhGxPX6AjvRsGA1wc7Nx0QnlmZFe+8kPMYTu/I=
X-Google-Smtp-Source: APXvYqzwhelhrJw6v97UlvQ9gFA+EJEgAwG1lBZjHPuhlD2jF5AyUyvgcLeKKXFPoQHWEZjaqubrLx7rtowyRq2juOc=
X-Received: by 2002:ae9:ef8c:: with SMTP id d134mr8236616qkg.286.1567771002514; 
 Fri, 06 Sep 2019 04:56:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190905203527.1478314-1-arnd@arndb.de>
 <20190906043805.GE2672@vkoul-mobl>
 <CAK8P3a38ywYFaGekbi6_idwrZvaVX8u8giUpK1r26QAbekLp8Q@mail.gmail.com>
 <20190906104403.GH2672@vkoul-mobl>
In-Reply-To: <20190906104403.GH2672@vkoul-mobl>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 6 Sep 2019 13:56:26 +0200
Message-ID: <CAK8P3a35e2MQh0nz-zFmrMbFxy2CdrOE48WVh+UUv-Luwf+eqQ@mail.gmail.com>
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

On Fri, Sep 6, 2019 at 12:45 PM Vinod Koul <vkoul@kernel.org> wrote:
> On 06-09-19, 12:02, Arnd Bergmann wrote:
> > On Fri, Sep 6, 2019 at 6:39 AM Vinod Koul <vkoul@kernel.org> wrote:
> > >
> > > On 05-09-19, 22:35, Arnd Bergmann wrote:
> > > > Soundwire gained a warning for randconfig builds without
> > > > CONFIG_ACPI during the linux-5.3-rc cycle:
> > > >
> > > > drivers/soundwire/slave.c:16:12: error: unused function 'sdw_slave_add' [-Werror,-Wunused-function]
> > > >
> > > > Add the CONFIG_ACPI dependency at the top level now.
> > >
> > > Did you run this yesterday or today. I have applied Srini's patches to
> > > add DT support for Soundwire couple of days back so we should not see
> > > this warning anymore
> >
> > This is on the latest linux-next, which is dated 20190904. As Stephen is
> > not releasing any more linux-next kernels until later this month, I'm
> > missing anything that came in afterwards.
>
> That is interesting as next-20190904 has the DT changes :) Can you share
> the config you used to get this.
>
> I have two instances of sdw_slave_add() in next-20190904:
>
> drivers/soundwire/slave.c:              sdw_slave_add(bus, &id, acpi_fwnode_handle(adev));
> drivers/soundwire/slave.c:              sdw_slave_add(bus, &id, of_fwnode_handle(node));

Ok, I remember now: the warning I got was actually on mainline.
It's fixed in linux-next, but from all I can tell, 5.3-rc7 is still broken.

      Arnd
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
