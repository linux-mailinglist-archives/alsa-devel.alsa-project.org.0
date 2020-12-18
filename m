Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE21E2DDCFE
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Dec 2020 03:42:09 +0100 (CET)
Received: from alsa1.perex.cz (unknown [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41E311744;
	Fri, 18 Dec 2020 03:41:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41E311744
Authentication-Results: alsa0.perex.cz;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel-com.20150623.gappssmtp.com header.i=@intel-com.20150623.gappssmtp.com header.b="K0iNceVw"
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B125DF80171;
	Fri, 18 Dec 2020 03:40:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 059BEF801F7; Fri, 18 Dec 2020 03:40:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 649FBF80168
 for <alsa-devel@alsa-project.org>; Fri, 18 Dec 2020 03:40:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 649FBF80168
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="K0iNceVw"
Received: by mail-ej1-x635.google.com with SMTP id jx16so989017ejb.10
 for <alsa-devel@alsa-project.org>; Thu, 17 Dec 2020 18:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9dgG7qudFm2M5ITbimg/EWCzHwUSe9U+CunlE6/jL+E=;
 b=K0iNceVwSaWAQkyefoafIL+r7jjBCygPntMyHwd3POvZ8g7YT3AyjHi/gqQvjRrJPp
 AQWvJ6QTr8tSOFjOEiKecyu618xXLtEzB37NYJTRWPBWh/iiWfJ5t/SN0pDlfSIXxTnW
 8XQzV9vnsOMuQsRKnQA5Jq590u5DiEXtzkdJCh1ysSLMrEsG1R56M1pUe8CrRCb+AcvC
 cnxem06FxnKPRYauImA7ZiEd5hlHlH70gZYuIdvcL9ybSDCFbUcFzjRNwwgZivcciosw
 8TUurj7TkNKk9PaAy3cONHdKYvZ8nYXBh9cejLzDWsfKSSXwUBWfA9pr0ceTS+6Hcm7W
 xQxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9dgG7qudFm2M5ITbimg/EWCzHwUSe9U+CunlE6/jL+E=;
 b=cDuuBAPKbP969LBUcYXExvVMFeTxPtx0YsoipTtRV2tejs8Cs/9gcVMF6Th59KBtVA
 36oghX6heX04riwQMVnFQZcxmp08gYfmuIno+RSoTfLdAIGyospX/s1NudgAP1YrnWfY
 jAYXxbIOULFtfOqPSplPs0LPs4T3ZjeGBPE/mjlo97RNTkWQQN+UDgmYA9Y53p7n42j4
 mIMPFmV7yNNuxcp20Txv4E3yULhBzkrAj3plsVnoVgsTA/DkP8UsxNXL8LyB0lGZW0QT
 zo7tg6UoJtR0HX+m7jxjyiS2ClRhf4l4OCE52cPHFPPBrPKVGmF9UD3Q46fSnWAqOPQf
 ZuLw==
X-Gm-Message-State: AOAM532qCc3UX0+zjL4LoFMli8My1qzjOm/kdJGq4LDeKz6AYHyG13Ca
 XfANIZr/FM58sPbZmokJCPy3tzyykFiFk2WWw3yeeA==
X-Google-Smtp-Source: ABdhPJySH0QTe8IayfD/c7x3TXLpQyM5fmUjCclwC7NQ12btUfoyVuaLt0jSgr0SOVFRPZFstKr7iq1l+tk4kWBsDWE=
X-Received: by 2002:a17:906:2707:: with SMTP id
 z7mr1965646ejc.418.1608259205621; 
 Thu, 17 Dec 2020 18:40:05 -0800 (PST)
MIME-Version: 1.0
References: <160695681289.505290.8978295443574440604.stgit@dwillia2-desk3.amr.corp.intel.com>
 <X8ogtmrm7tOzZo+N@kroah.com>
 <CAPcyv4iLG7V9JT34La5PYfyM9378acbLnkShx=6pOmpPK7yg3A@mail.gmail.com>
 <X8usiKhLCU3PGL9J@kroah.com> <20201217211937.GA3177478@piout.net>
In-Reply-To: <20201217211937.GA3177478@piout.net>
From: Dan Williams <dan.j.williams@intel.com>
Date: Thu, 17 Dec 2020 18:39:55 -0800
Message-ID: <CAPcyv4h-jg0dxKZ89yYnHsTEDj7jLWDBhBVTgEC77tLLsz92pw@mail.gmail.com>
Subject: Re: [resend/standalone PATCH v4] Add auxiliary bus support
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Kiran Patil <kiran.patil@intel.com>, David Miller <davem@davemloft.net>,
 linux-rdma <linux-rdma@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 Martin Habets <mhabets@solarflare.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Fred Oh <fred.oh@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Jakub Kicinski <kuba@kernel.org>,
 Dave Ertman <david.m.ertman@intel.com>,
 Shiraz Saleem <shiraz.saleem@intel.com>, Netdev <netdev@vger.kernel.org>,
 Leon Romanovsky <leonro@nvidia.com>, Parav Pandit <parav@mellanox.com>
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

On Thu, Dec 17, 2020 at 1:20 PM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hello,
>
> On 05/12/2020 16:51:36+0100, Greg KH wrote:
> > > To me, the documentation was written, and reviewed, more from the
> > > perspective of "why not open code a custom bus instead". So I can see
> > > after the fact how that is a bit too much theory and justification and
> > > not enough practical application. Before the fact though this was a
> > > bold mechanism to propose and it was not clear that everyone was
> > > grokking the "why" and the tradeoffs.
> >
> > Understood, I guess I read this from the "of course you should do this,
> > now how do I use it?" point of view.  Which still needs to be addressed
> > I feel.
> >
> > > I also think it was a bit early to identify consistent design patterns
> > > across the implementations and codify those. I expect this to evolve
> > > convenience macros just like other parts of the driver-core gained
> > > over time. Now that it is in though, another pass through the
> > > documentation to pull in more examples seems warranted.
> >
> > A real, working, example would be great to have, so that people can know
> > how to use this.  Trying to dig through the sound or IB patches to view
> > how it is being used is not a trivial thing to do, which is why
> > reviewing this took so much work.  Having a simple example test module,
> > that creates a number of devices on a bus, ideally tied into the ktest
> > framework, would be great.  I'll attach below a .c file that I used for
> > some basic local testing to verify some of this working, but it does not
> > implement a aux bus driver, which needs to be also tested.
> >
>
> There is something I don't get from the documentation and it is what is
> this introducing that couldn't already be done using platform drivers
> and platform devices?

There is room for documentation improvement here. I realize reading it
back now that much of the justification for "why not platform bus?"
happened on the list, but only a small mention made it into the
document. It turns out that platform-bus has some special integrations
and hacks with platform-firmware implementations. For example, the
ACPI companion magic and specific platform firmware integrations in
platform_match(). It's also an awkward bus name to use because these
devices do not belong to the platform. The platform bus is for devices
that do not have an enumeration mechanism besides board files or
firmware descriptions.

So while many of the auxiliary device use cases might be able to be
squeezed into a platform-bus scheme it further overloads what is
already a wide responsibility.

In comparison, the auxiliary-bus is tailored to the "sub-function of a
parent device/driver" use case. It lets the host driver be the root of
a namespace of sub-functionality in a standard template way.

> We already have a bunch of drivers in tree that have to share a state
> and register other drivers from other subsystems for the same device.
> How is the auxiliary bus different?

There's also custom subsystem buses that do this. Why not other
alternatives? They didn't capture the simultaneous mindshare of RDMA,
SOF, and NETDEV developers. Personally my plans for using
auxiliary-bus do not map cleanly to anything else in the tree. I want
to use it for attaching an NPEM driver (Native PCIE Enclosure
Management) to any PCI device driver that opts-in, but it would be
overkill to go create an "npem" bus for this.
