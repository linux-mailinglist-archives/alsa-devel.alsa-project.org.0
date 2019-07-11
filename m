Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F4F65F62
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Jul 2019 20:17:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DBF5B167E;
	Thu, 11 Jul 2019 20:16:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DBF5B167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562869041;
	bh=G/zNfczpyXb5rfiQDtsg19lM1UMCYCs4/Kd7K2+VoGg=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GyQ3D1IMR079OwFUPpSscwJ3CDVZBnFhQHCGX3v1vzJsPQMsAOmTluOhec10SdMWX
	 jZJ6+AjsZWtk4UUNK484R8IIujI92dOoQJcsW1Fpp1dZwyuoYi20rNHDVSqzKlPOHv
	 EV2HODI7P5lvpruybkIKdd8VQtdfapBwuMxWwA+c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC9B0F802FB;
	Thu, 11 Jul 2019 20:15:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26858F802FB; Thu, 11 Jul 2019 20:15:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID, DKIM_VALID_AU, ENV_AND_HDR_SPF_MATCH, PDS_NO_HELO_DNS,
 SPF_HELO_NONE, 
 SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 73DF6F801A4
 for <alsa-devel@alsa-project.org>; Thu, 11 Jul 2019 20:15:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73DF6F801A4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="VZ9c25tu"
Received: by mail-lj1-x242.google.com with SMTP id m8so6726726lji.7
 for <alsa-devel@alsa-project.org>; Thu, 11 Jul 2019 11:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Jys+Aym6KnhbTzR/MDF3RwfjVhOFhB89bd5ypnwJdRw=;
 b=VZ9c25tuP5SguEPOn0Kk7kr8E9e/8wzV/0xutOou+1KW2vM4vdzQH8d5KSvfnRC3SP
 CWdPByjoNq1e4dQn0SFHTzMrMMd3pWT9L5eKEnDRIAqfFH5J8+zJB3hzOlY66MiiTWS2
 mIqyX//9nCQ9U0/G4Ab6vuyaTDP5FczJGXQSOyHOMnnUBYmrNhlS6gofN+Y/DO4MiV3N
 Wdur8kyadou3yq+XLN3iRpPUQpboy20gXB/181UG/gH8Dui5tvSeGG986rIRLL73UfXP
 FZNsFWDlc7x09L9LQ9i1XuLvnkiBskVrixRJ6I0rHYEVEfjjKnRO7x+wnXTfCvjEo0I+
 1+6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Jys+Aym6KnhbTzR/MDF3RwfjVhOFhB89bd5ypnwJdRw=;
 b=f3LdxWEdJ3LCgZFJLbmVzmqdtAmWjT/Wu2TceG77g2lh42H9/MydrxV9ZxGTFgCQk6
 rtbsU+87qOKHnlkaFJBNs+za+hvetPlXCsVmAdy55T3v8sK+jKHI4o1jonZQxlCYWZs4
 p4mUOwwoLmwrBR7KQceEQD8ulqc8deQNjJaRV6+iNyg78N9fk1jMRg0sPN7r6zYcC14C
 ODxvOlBEjOMFnwDSlSphmXWRJbo28Cw6+UAxo/9su4MzVQT+oBOvTNvLA9nkk+j7OBjf
 wogo9NCFhq9B2EhzEIMmJOcTJ/LLqv/vIhFdyOptumaMnKvl2l3Ar7ExNl6RM9+qgWcr
 mdYw==
X-Gm-Message-State: APjAAAUnMEOZ0j17PrAg0SRPD8bNF6tG+KzP4zxHbvIDELbKWGF0xhO5
 l6r5G2CdGm8R6rpRUNLWmpt/dXHOVpJ1L91GhwghcA==
X-Google-Smtp-Source: APXvYqwg9+HrHWjwTDM78I11m/8M7PKj7fsOd0SBqm8pYU0n8uC7/Ok9sqDDch2TobcUeAFd9Xv6cEB09jt3/WghsSo=
X-Received: by 2002:a2e:3008:: with SMTP id w8mr3400463ljw.13.1562868929030;
 Thu, 11 Jul 2019 11:15:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAOReqxhxHiJ-4UYC-j4Quuuy5YP9ywohe_JwiLpCxqCvP-7ypg@mail.gmail.com>
 <20190709131401.GA9224@smile.fi.intel.com>
 <20190709132943.GB9224@smile.fi.intel.com>
 <20190709133448.GC9224@smile.fi.intel.com>
 <20190709133847.GD9224@smile.fi.intel.com>
 <CAOReqxgnbDJsEcv7vdX3w44rzB=B69sHj95E8yBZ8DnZq0=63Q@mail.gmail.com>
 <20190710164346.GP9224@smile.fi.intel.com>
 <CAOReqxgnUp2tTp__YCjF_QH4166FAA1CE8Yq_VdE9jLW6Q4s3A@mail.gmail.com>
 <20190711131232.GS9224@smile.fi.intel.com>
In-Reply-To: <20190711131232.GS9224@smile.fi.intel.com>
From: Curtis Malainey <cujomalainey@google.com>
Date: Thu, 11 Jul 2019 11:15:17 -0700
Message-ID: <CAOReqxhUb-47qDaJFQvOHfJQCP8Rz2sYsGpfr2wMgY3D6es=-g@mail.gmail.com>
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

On Thu, Jul 11, 2019 at 6:12 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Jul 10, 2019 at 02:24:48PM -0700, Curtis Malainey wrote:
> > On Wed, Jul 10, 2019 at 9:43 AM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Tue, Jul 09, 2019 at 12:27:49PM -0700, Curtis Malainey wrote:
>
> > > > Thanks for the information, we are running a 4.14 kernel so we don't
> > > > have the idma32 driver, I will see if I can backport it and report
> > > > back if the fix works.
> > >
> > > Driver is supporting iDMA 32-bit in v4.14 AFAICS.
> > > The missed stuff is a split and some fixes here and there.
> > > Here is the list of patches I have in a range v4.14..v5.2
> > > (I deliberately dropped the insignificant ones)
> > >
> > > 934891b0a16c dmaengine: dw: Don't pollute CTL_LO on iDMA 32-bit
> > > 91f0ff883e9a dmaengine: dw: Reset DRAIN bit when resume the channel
> > > 69da8be90d5e dmaengine: dw: Split DW and iDMA 32-bit operations
> > > 87fe9ae84d7b dmaengine: dw: Add missed multi-block support for iDMA 32-bit
> > > ffe843b18211 dmaengine: dw: Fix FIFO size for Intel Merrifield
> > > 7b0c03ecc42f dmaengine: dw-dmac: implement dma protection control setting
> > >
> > > For me sounds like fairly easy to backport.
> > >
> > I got the code integrated, and ran some tests. The test device
> > regularly hits a BUG_ON in the dw/core.c, debug is turned on in dw
> > core
>
> I see. We need ASoC guys to shed a light here. I don't know that part at all.
>
> Only last suggestion I have is to try remove multi-block setting from the
> platform data (it will be emulated in software if needed). But I don't believe
> the DMA for audio has no such feature enabled.
>
In theory, (assuming I understand this correctly) it seems the DMA
driver is failing to probe (from what appears to possibly be a
hardware issue) but we should fallback to a non-DMA/direct method to
load the firmware to keep the system alive.

Also I am still seeing the same dma_sync_wait: timeout! failures with
multi-block commented out.
> > We have only been able to consistently reproduce the DMA boot issue on
> > our original code consistently on 1 device and sporadically on another
> > handful of devices.
> > When the device did finally booted after 2-3 device crashes the device
> > failed to load the DSP.
>
> Yeah, it has something to do with this firmware loader code...
>
> > [    3.709573] sst-acpi INT3438:00: DesignWare DMA Controller, 8 channels
> > [    3.959027] haswell-pcm-audio haswell-pcm-audio: error: audio DSP
> > boot timeout IPCD 0x0 IPCX 0x0
> > [    3.970336] bdw-rt5677 bdw-rt5677: ASoC: failed to init link System PCM
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
