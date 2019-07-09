Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 121F763BEE
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jul 2019 21:29:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97E821667;
	Tue,  9 Jul 2019 21:29:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97E821667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562700598;
	bh=Vmy+bCWGB9MeVzw+W/dWBcj3+dlTtwIKA96LfA5ABaM=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WeXEAgqB70/KBXRy+UdMaZ4rU1gYsooDCIUDK94uKeIrRXx1NeTlNuoUVENiEEV/v
	 Uz/ka2nZq4cVHQSY1y+bgQjHW1ctLELGEYFzXEDoA+dTBWpRFy+FcNniJUvaEx9F5Z
	 SwslwuTtPkA1P/Gpj96RTKzptTEJ4+IERBP9G5vU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1392F80276;
	Tue,  9 Jul 2019 21:28:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86F3EF80274; Tue,  9 Jul 2019 21:28:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID, DKIM_VALID_AU, ENV_AND_HDR_SPF_MATCH, PDS_NO_HELO_DNS,
 SPF_HELO_NONE, 
 SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7CED4F800E2
 for <alsa-devel@alsa-project.org>; Tue,  9 Jul 2019 21:28:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CED4F800E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="EYrtokQh"
Received: by mail-lj1-x243.google.com with SMTP id x25so13960881ljh.2
 for <alsa-devel@alsa-project.org>; Tue, 09 Jul 2019 12:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jTMRQzTd2NAnqgiomIAA7+pDC1dbYmFpkxB/bf6Q4tM=;
 b=EYrtokQhnehr0WcObqpbJeY4e2nB9fRRTmznqmWADY5QLwarOLh9ftLlJoWuDbj9Ws
 LKlV2E0mrFvWSV5mfasr+HW1IUsQyjfPgofJwMETkEUeeMOyWuSmWPWisu5vtWN9idGP
 iE4dfOXxNRYePbaDKrVABpd0sY3E+x0wicoVTYViorHOrNfljzjbewh71v7GdlHJjGfF
 XBZ1OWzLSfe+uQP4VKVVSqrMQKO5g/9xnKJtPJs7SjwscxAMcEZJqiqet+KX/Nn2W2Ju
 ERuKU8w+aaUdG0Pli0BVCAV+o6aMX8dcdZsTbvMuKLhsrkTyXUfSBFl/GyzVtaO+LNxk
 EDKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jTMRQzTd2NAnqgiomIAA7+pDC1dbYmFpkxB/bf6Q4tM=;
 b=KzsGGIDOvfsgalm9c68ehN0IBpmBHvHCJFsxIEVbEDISYPdoWPt2EInWf2ywxPG+i6
 IlAPoMTPXpefSW+pC+nHukn03SOB8YkMeEsLfKejiKhJMWXh4JHMgIUGsnZLqymb0YNa
 FQfOEJO6zNxKurRX+V3h24QIlFdxwY6qiwnEE2ZOql7CJI8I9zk2TsxRXMQzDwGJSyVZ
 rXQ4PGi32TSmzA8ANEPJB9fUtTL2yzzMu6itmLUaXF46vmNdrBCAqdtwidBl5yhc0FJZ
 KhOPzywbOn35mO1rahocs2yjJZqdQ/7/mGImE2XZMzRwgqoOTfRLzRPKgBjYJMy69Uio
 QLtA==
X-Gm-Message-State: APjAAAXpEoTeg1Jiq5CNHXy9aEshTy0Vvbq5ol+FgLZLB7zOemcc9KM5
 CZZ6aFVg30NOUMCeK8FfXgs+MZip0HMi8fVsBTD0/w==
X-Google-Smtp-Source: APXvYqwM9kzkFtX3di4fu6k88dButQR4p9Lc7mMJUSG+58pifQxeL7fqmYaJSuErAlCvKbsWOEDiIXfK1HjZ4SeqrtU=
X-Received: by 2002:a2e:3008:: with SMTP id w8mr15177510ljw.13.1562700480420; 
 Tue, 09 Jul 2019 12:28:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAOReqxhxHiJ-4UYC-j4Quuuy5YP9ywohe_JwiLpCxqCvP-7ypg@mail.gmail.com>
 <20190709131401.GA9224@smile.fi.intel.com>
 <20190709132943.GB9224@smile.fi.intel.com>
 <20190709133448.GC9224@smile.fi.intel.com>
 <20190709133847.GD9224@smile.fi.intel.com>
In-Reply-To: <20190709133847.GD9224@smile.fi.intel.com>
From: Curtis Malainey <cujomalainey@google.com>
Date: Tue, 9 Jul 2019 12:27:49 -0700
Message-ID: <CAOReqxgnbDJsEcv7vdX3w44rzB=B69sHj95E8yBZ8DnZq0=63Q@mail.gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Ross Zwisler <zwisler@google.com>, Fletcher Woodruff <fletcherw@google.com>,
 Liam Girdwood <liam.r.girdwood@intel.com>, dmaengine@vger.kernel.org,
 Pierre-louis Bossart <pierre-louis.bossart@intel.com>
Subject: Re: [alsa-devel] DW-DMA: Probe failures on broadwell
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

Hi Andy,

Thanks for the information, we are running a 4.14 kernel so we don't
have the idma32 driver, I will see if I can backport it and report
back if the fix works.

Thanks.

On Tue, Jul 9, 2019 at 6:38 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Jul 09, 2019 at 04:34:48PM +0300, Andy Shevchenko wrote:
> > On Tue, Jul 09, 2019 at 04:29:43PM +0300, Andy Shevchenko wrote:
> > > On Tue, Jul 09, 2019 at 04:14:01PM +0300, Andy Shevchenko wrote:
> > > > On Mon, Jul 08, 2019 at 01:50:07PM -0700, Curtis Malainey wrote:
> > >
> > > > So, the correct fix is to provide a platform data, like it's done in
> > > > drivers/dma/dw/pci.c::idma32_pdata, in the sst-firmware.c::dw_probe(), and call
> > > > idma32_dma_probe() with idma32_dma_remove() respectively on removal stage.
> > > >
> > > > (It will require latest patches to be applied, which are material for v5.x)
> > >
> > > Below completely untested patch to try
> >
> > Also, it might require to set proper request lines (currently it uses 0 AFAICS).
> > Something like it's done in drivers/spi/spi-pxa2xx-pci.c for Intel Merrifield.
>
> And SST_DSP_DMA_MAX_BURST seems encoded while it's should be simple number,
> like 8 (bytes). Also SPI PXA is an example to look into.
>
> I doubt it has been validated with upstream driver (I know about some internal
> drivers, hacked version of dw one, you may find sources somewhere in public).
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
