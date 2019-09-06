Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA4FAB64C
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Sep 2019 12:47:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EE9015E2;
	Fri,  6 Sep 2019 12:46:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EE9015E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567766828;
	bh=HPPds1JPtC4Us/7WpqY+w3suMsc/lNJk9qgoTFXxsAs=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZPz7Srbw1ZaiaLfH89BgoNZdfLbl9+bYAKnW6fmaU1qS9BxOIiWh9BSYZsZXaVaZJ
	 5/WR74RyqOnKZoTQy+nkNZhOdcWaRSiD9YRA8ku5l67zzNQT8ws0PsUPN6tSmEJZIL
	 tW7kcJzQrfSTxWG4NT0abaCtkdjhGfj8B/Lt3VO0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 560B1F80394;
	Fri,  6 Sep 2019 12:45:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2703F80394; Fri,  6 Sep 2019 12:45:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 522E7F80171
 for <alsa-devel@alsa-project.org>; Fri,  6 Sep 2019 12:45:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 522E7F80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="IDxctFLg"
Received: from localhost (unknown [223.226.32.145])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F2EFD2084F;
 Fri,  6 Sep 2019 10:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567766711;
 bh=8obvABzY456lelT+/+F0iiNkcUGvNaX0PoU7PvA7MHw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IDxctFLgE85TE+lmarvW0ZhIpYuXdofqQrSBdKIrPm3CGWpNYJmjk2lLowearehq3
 3VMQmSIPx3QAsdwv2bl03ucelgJ+waAVxPmtJJCLjM0DNYYletYyjdRnztifkQ8Vws
 td1cL8xV+TWdvhE8RDn2cUIkMKPAs+2hb2vFccds=
Date: Fri, 6 Sep 2019 16:14:03 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20190906104403.GH2672@vkoul-mobl>
References: <20190905203527.1478314-1-arnd@arndb.de>
 <20190906043805.GE2672@vkoul-mobl>
 <CAK8P3a38ywYFaGekbi6_idwrZvaVX8u8giUpK1r26QAbekLp8Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a38ywYFaGekbi6_idwrZvaVX8u8giUpK1r26QAbekLp8Q@mail.gmail.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
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

On 06-09-19, 12:02, Arnd Bergmann wrote:
> On Fri, Sep 6, 2019 at 6:39 AM Vinod Koul <vkoul@kernel.org> wrote:
> >
> > On 05-09-19, 22:35, Arnd Bergmann wrote:
> > > Soundwire gained a warning for randconfig builds without
> > > CONFIG_ACPI during the linux-5.3-rc cycle:
> > >
> > > drivers/soundwire/slave.c:16:12: error: unused function 'sdw_slave_add' [-Werror,-Wunused-function]
> > >
> > > Add the CONFIG_ACPI dependency at the top level now.
> >
> > Did you run this yesterday or today. I have applied Srini's patches to
> > add DT support for Soundwire couple of days back so we should not see
> > this warning anymore
> 
> This is on the latest linux-next, which is dated 20190904. As Stephen is
> not releasing any more linux-next kernels until later this month, I'm
> missing anything that came in afterwards.

That is interesting as next-20190904 has the DT changes :) Can you share
the config you used to get this.

I have two instances of sdw_slave_add() in next-20190904:

drivers/soundwire/slave.c:              sdw_slave_add(bus, &id, acpi_fwnode_handle(adev));
drivers/soundwire/slave.c:              sdw_slave_add(bus, &id, of_fwnode_handle(node));

Thanks
-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
