Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 019EE1D14E
	for <lists+alsa-devel@lfdr.de>; Tue, 14 May 2019 23:31:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70C2E1681;
	Tue, 14 May 2019 23:30:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70C2E1681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557869488;
	bh=4CZ0AectgZYjsTHL9VTSQHg2lSlm3DhttA6tlt8PNmI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kfjmox4APRT2kEpKQnVY1+3WI6Z2JSMGtsCw6wV/Qj+z8/lMOmZujfYknvU1qFa7l
	 SXdrCZJyKtFLKUEgrWfj5JR2VPHng9YL9wPKJer4s5CWg97Xj40im/h5/YlXQQqCtj
	 l5U6d0Tl6VVUDbj0aVwXg8FIMPwgMG6+lmPqwwSs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BEEF7F89693;
	Tue, 14 May 2019 23:29:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54B67F896B6; Tue, 14 May 2019 23:29:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from cloudserver094114.home.pl (cloudserver094114.home.pl
 [79.96.170.134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B9F3F8072A
 for <alsa-devel@alsa-project.org>; Tue, 14 May 2019 23:29:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B9F3F8072A
Received: from 79.184.255.148.ipv4.supernova.orange.pl (79.184.255.148) (HELO
 kreacher.localnet)
 by serwer1319399.home.pl (79.96.170.134) with SMTP (IdeaSmtpServer 0.83.213)
 id bc0f4377005ba3a1; Tue, 14 May 2019 23:29:19 +0200
From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Tue, 14 May 2019 23:29:18 +0200
Message-ID: <1683867.ro8ObbCUgW@kreacher>
In-Reply-To: <CAJZ5v0i+M8y3ddr+Z5o5af8OatMXq3xqCF5CUg5PjnANrTOSHw@mail.gmail.com>
References: <20190501125322.23791-1-pierre-louis.bossart@linux.intel.com>
 <20190502045817.GZ3845@vkoul-mobl.Dlink>
 <CAJZ5v0i+M8y3ddr+Z5o5af8OatMXq3xqCF5CUg5PjnANrTOSHw@mail.gmail.com>
MIME-Version: 1.0
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Robert Moore <robert.moore@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 "open list:ACPI" <linux-acpi@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, jank@cadence.com,
 Joe Perches <joe@perches.com>,
 "open list:ACPI COMPONENT ARCHITECTURE \(ACPICA\)" <devel@acpica.org>,
 Erik Schmauss <erik.schmauss@intel.com>, Len Brown <lenb@kernel.org>
Subject: Re: [alsa-devel] [PATCH v2] ACPI / device_sysfs: change _ADR
	representation to 64 bits
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

On Monday, May 6, 2019 10:36:22 AM CEST Rafael J. Wysocki wrote:
> On Thu, May 2, 2019 at 6:58 AM Vinod Koul <vkoul@kernel.org> wrote:
> >
> > On 01-05-19, 07:53, Pierre-Louis Bossart wrote:
> > > Standards such as the MIPI DisCo for SoundWire 1.0 specification
> > > assume the _ADR field is 64 bits.
> > >
> > > _ADR is defined as an "Integer" represented as 64 bits since ACPI 2.0
> > > released in 2002. The low levels already use _ADR as 64 bits, e.g. in
> > > struct acpi_device_info.
> > >
> > > This patch bumps the representation used for sysfs to 64 bits. To
> > > avoid any compatibility/ABI issues, the printf format is only extended
> > > to 16 characters when the actual _ADR value exceeds the 32 bit
> > > maximum.
> > >
> > > Example with a SoundWire device, the results show the complete
> > > vendorID and linkID which were omitted before:
> > >
> > > Before:
> > > $ more /sys/bus/acpi/devices/device\:38/adr
> > > 0x5d070000
> > > After:
> > > $ more /sys/bus/acpi/devices/device\:38/adr
> > > 0x000010025d070000
> > >
> > > Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> > > ---
> > > v2: only use 64 bits when required to avoid compatibility issues
> > > (feedback from Vinod and Rafael)
> > >
> > >  drivers/acpi/device_sysfs.c | 6 ++++--
> > >  include/acpi/acpi_bus.h     | 2 +-
> > >  2 files changed, 5 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/acpi/device_sysfs.c b/drivers/acpi/device_sysfs.c
> > > index 8940054d6250..7dda0ee05cd1 100644
> > > --- a/drivers/acpi/device_sysfs.c
> > > +++ b/drivers/acpi/device_sysfs.c
> > > @@ -428,8 +428,10 @@ static ssize_t acpi_device_adr_show(struct device *dev,
> > >  {
> > >       struct acpi_device *acpi_dev = to_acpi_device(dev);
> > >
> > > -     return sprintf(buf, "0x%08x\n",
> > > -                    (unsigned int)(acpi_dev->pnp.bus_address));
> > > +     if (acpi_dev->pnp.bus_address > 0xFFFFFFFF)
> >
> > Would prefer to use U32_MAX instead of 0xFFFFFFFF
> 
> I would.
> 

I have made that change manually and applied the patch.

Thanks!



_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
