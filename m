Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6556633D3B
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jun 2019 04:35:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6A9F1662;
	Tue,  4 Jun 2019 04:34:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6A9F1662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559615710;
	bh=KfL2xp1LPpS1j6xMc9y4wlkYilbtU2Pj6PXKVIw1BjU=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DPxelTqMkvFDrtyh2Ci2pQzp243nL3ms4B/Tqe/OJi+rvaSGZkkAY9Q+alRwI/jKk
	 Zz+moiVHcbSGMbHHLXEAyDrAkJDh6jW2D22REj9uxIMP9Jbqf8o6D33OF+SYey3juD
	 gooOjU7aXNeOH42z3RaRlg9tdtzK3/jhjSDaNSSk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1EF81F896F7;
	Tue,  4 Jun 2019 04:33:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6DF2DF896F7; Tue,  4 Jun 2019 04:33:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_13,SPF_HELO_NONE,
 SPF_PASS, T_DKIMWL_WL_HIGH, URIBL_BLOCKED,
 USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com
 [IPv6:2607:f8b0:4864:20::943])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F11D5F80054
 for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2019 04:33:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F11D5F80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="L2wgBJ6W"
Received: by mail-ua1-x943.google.com with SMTP id j2so3375213uaq.5
 for <alsa-devel@alsa-project.org>; Mon, 03 Jun 2019 19:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L9qrn6ZWOL4a9ABbLwhwNcXe2mxBi3b41bjsqVx1qKg=;
 b=L2wgBJ6WPnx89IRlNzIfIT6Vdkfeyqjm5omuEYhjjjKu2o4EOPXcTDX3waZgh8YilK
 yXSZaTMDHI88pQ81iaqpZFQLN6WapthvBpjDY69PmVkeZ2KF1T4t0gExFf68zngJJrXg
 WXTC/E8o0dIVs4y3maxRaGNsDu22nyB8Ppob8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L9qrn6ZWOL4a9ABbLwhwNcXe2mxBi3b41bjsqVx1qKg=;
 b=DC5BIPWxzLoq9w1KzhTPjx8wQM5JNhRbeIEjmgNPZlXE0gR+xacQSFOEAURMfyZPTp
 il5q3U/uoC1d+4M68TOFassXlQuuvMZSaC1nZpPn8FS/lPMHQqZDwFnV/0qPyjG2PVrq
 xy9wmU2afr+bwVsa1V4No9HvWns4U419Yfa2ifjnvzXs4XOFpAXe4nSKejuON21w/dXM
 nlxfT/JicdTn/mCZ5q7mVRwMDoT00lsPZMJKoaWnsOq60HWkXVwpIwyFKW1kEbIuVx9n
 gTmPSH27f7ZHU4GdjQ1VHVgB+QTTtnes0C4sQKQju3owlFdcd8z+Rkt+2W81wJMG9Lv1
 XtPA==
X-Gm-Message-State: APjAAAX64hISzO+Puc6Fuar3mLWDdMt++4YKfnviHV9IyVPjIlO5KNk9
 x3oM+pmndaJQfAnY3WZe/Hii3n7zjmboaBcos0vn5g==
X-Google-Smtp-Source: APXvYqy4Rq54iSIDtGCA/AunF9GIqYwM1bmFuUVYZW9SWfV6PmQgE1hoj/71fJmhG6DWLEGWcRjIfxBR6ysqTzASKD0=
X-Received: by 2002:ab0:6444:: with SMTP id j4mr14852876uap.105.1559615597770; 
 Mon, 03 Jun 2019 19:33:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190603043251.226549-1-cychiang@chromium.org>
 <20190603043251.226549-2-cychiang@chromium.org>
 <41e7052b-a58c-5a8c-5d94-37237e0c2070@xs4all.nl>
 <20190603080931.GG21222@phenom.ffwll.local>
In-Reply-To: <20190603080931.GG21222@phenom.ffwll.local>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Tue, 4 Jun 2019 10:32:50 +0800
Message-ID: <CAFv8Nw+1sB8i1d87vLeKxRricZOi4gnXFSgOzW9k0sa_Tzybjg@mail.gmail.com>
To: Hans Verkuil <hverkuil@xs4all.nl>, Cheng-Yi Chiang <cychiang@chromium.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Mark Brown <broonie@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, 
 Russell King <rmk+kernel@armlinux.org.uk>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, 
 Rob Herring <robh+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Doug Anderson <dianders@chromium.org>, Dylan Reid <dgreid@chromium.org>,
 tzungbi@chromium.org, linux-media@vger.kernel.org, 
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, Dariusz Marcinkiewicz <darekm@google.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [alsa-devel] [PATCH 1/7] video: add HDMI state notifier support
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

On Mon, Jun 3, 2019 at 4:09 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Mon, Jun 03, 2019 at 09:45:49AM +0200, Hans Verkuil wrote:
> > On 6/3/19 6:32 AM, Cheng-Yi Chiang wrote:
> > > From: Hans Verkuil <hans.verkuil@cisco.com>
> > >
> > > Add support for HDMI hotplug and EDID notifiers, which is used to convey
> > > information from HDMI drivers to their CEC and audio counterparts.
> > >
> > > Based on an earlier version from Russell King:
> > >
> > > https://patchwork.kernel.org/patch/9277043/
> > >
> > > The hdmi_notifier is a reference counted object containing the HDMI state
> > > of an HDMI device.
> > >
> > > When a new notifier is registered the current state will be reported to
> > > that notifier at registration time.
> > >
> > > Based on Hans Verkuil's patch:
> > >
> > > https://patchwork.kernel.org/patch/9472521/
> >
> > Erm, you are aware that this patch morphed into a CEC-specific notifier
> > found in drivers/media/cec/cec-notifier.c?
> >
> > I don't think it makes sense to have two notifier implementations in the kernel.
> > The original intention was to have the notifier deal with both CEC and ASoC
> > notifications, but there was not enough interest for the ASoC bits at the time
> > and it was dropped.
> >
> > I am planning changes to the cec-notifier API, I hope to work on that this
> > week. I'll CC you when I post those. Those might be a good starting point
> > to convert the cec-notifier to an hdmi-notifier as was originally intended.
> >
> > I've added your colleague Dariusz Marcinkiewicz to the CC list since he's been
> > working on some nice cec-notifier improvements as well.
>
> We also have some interfaces for drm/alsa interactions around hdmi
> already in drm/drm_audio_component.h, but it's not used by anything
> outside of i915. Imo we should extend that, not reinvent a new wheel.
>
Hi Daniel,
Thank you for the pointer. Looking at the ops, it seems that it is
specific to HDA.
I am not familiar with drm and HDA. I am not sure how applicable it
would be to report jack status to ASoC.
There is a use case in sound/soc/codecs/hdac_hdmi.c though so it
should be possible.

> Another note: notifiers considered evil, imo. Gets the job done for one
> case, as soon as you have multiple devices and need to make sure you get
> the update for the right one it all comes crashing down. Please create an
> api which registers for updates from a specific device only, plus
> something that has real callbacks (like the drm_audio_component.h thing we
> started already).

To clarify a bit, this hdmi-notifier indeed supports updating from a
specific device only.
hdmi_notifier_get takes a device and return the notifier.

It seems that a major difference between drm_audio_components and
hdmi-notifier is that
drm_audio_components defines all supported ops in drm_audio_component_audio_ops.
On the other hand, hdmi-notifier passes different events using an enum
like HDMI_CONNECTED and let listener handle different events.
In this regard I agree with you that drm_audio_component is cleaner.
Anyway, I will look into it a bit more and see how it works.

Thanks again!

> -Daniel
>
> >
> > Regards,
> >
> >       Hans
> >
> > >
> > > Modified by Cheng-Yi Chiang:
> > >  - Add a section in MAINTAINER.
> > >  - Changes connected and has_eld to bitfield of unsigned int.
> > >  - Other minor fixes to pass checkpatch.pl --strict checks.
> > >
> > > Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
> > > Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
> > > Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
> > > ---
> > > The original patch is at
> > > https://lore.kernel.org/linux-arm-kernel/20161213150813.37966-2-hverkuil@xs4all.nl
> > >
> > >  MAINTAINERS                   |   6 ++
> > >  drivers/video/Kconfig         |   3 +
> > >  drivers/video/Makefile        |   1 +
> > >  drivers/video/hdmi-notifier.c | 145 ++++++++++++++++++++++++++++++++++
> > >  include/linux/hdmi-notifier.h | 112 ++++++++++++++++++++++++++
> > >  5 files changed, 267 insertions(+)
> > >  create mode 100644 drivers/video/hdmi-notifier.c
> > >  create mode 100644 include/linux/hdmi-notifier.h
> > >
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 5cfbea4ce575..ffb7376f9509 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -16676,6 +16676,12 @@ W: https://linuxtv.org
> > >  S: Maintained
> > >  F: drivers/media/platform/vicodec/*
> > >
> > > +VIDEO FRAMEWORK
> > > +M: Hans Verkuil <hverkuil@xs4all.nl>
> > > +L: linux-media@vger.kernel.org
> > > +F: drivers/video/hdmi-notifier.*
> > > +S: Maintained
> > > +
> > >  VIDEO MULTIPLEXER DRIVER
> > >  M: Philipp Zabel <p.zabel@pengutronix.de>
> > >  L: linux-media@vger.kernel.org
> > > diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
> > > index 83d3d271ca15..000ba9bc0ae7 100644
> > > --- a/drivers/video/Kconfig
> > > +++ b/drivers/video/Kconfig
> > > @@ -34,6 +34,9 @@ config VIDEOMODE_HELPERS
> > >  config HDMI
> > >     bool
> > >
> > > +config HDMI_NOTIFIERS
> > > +   bool
> > > +
> > >  endif # HAS_IOMEM
> > >
> > >  if VT
> > > diff --git a/drivers/video/Makefile b/drivers/video/Makefile
> > > index df7650adede9..eff4736102ca 100644
> > > --- a/drivers/video/Makefile
> > > +++ b/drivers/video/Makefile
> > > @@ -1,6 +1,7 @@
> > >  # SPDX-License-Identifier: GPL-2.0
> > >  obj-$(CONFIG_VGASTATE)            += vgastate.o
> > >  obj-$(CONFIG_HDMI)                += hdmi.o
> > > +obj-$(CONFIG_HDMI_NOTIFIERS)      += hdmi-notifier.o
> > >
> > >  obj-$(CONFIG_VT)             += console/
> > >  obj-$(CONFIG_FB_STI)                 += console/
> > > diff --git a/drivers/video/hdmi-notifier.c b/drivers/video/hdmi-notifier.c
> > > new file mode 100644
> > > index 000000000000..d1eedf661648
> > > --- /dev/null
> > > +++ b/drivers/video/hdmi-notifier.c
> > > @@ -0,0 +1,145 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/* hdmi-notifier.c - notify interested parties of (dis)connect and EDID
> > > + * events
> > > + *
> > > + * Copyright 2016 Russell King <rmk+kernel@arm.linux.org.uk>
> > > + * Copyright 2016 Cisco Systems, Inc. and/or its affiliates.
> > > + * All rights reserved.
> > > + */
> > > +
> > > +#include <linux/export.h>
> > > +#include <linux/hdmi-notifier.h>
> > > +#include <linux/string.h>
> > > +#include <linux/slab.h>
> > > +#include <linux/list.h>
> > > +
> > > +static LIST_HEAD(hdmi_notifiers);
> > > +static DEFINE_MUTEX(hdmi_notifiers_lock);
> > > +
> > > +struct hdmi_notifier *hdmi_notifier_get(struct device *dev)
> > > +{
> > > +   struct hdmi_notifier *n;
> > > +
> > > +   mutex_lock(&hdmi_notifiers_lock);
> > > +   list_for_each_entry(n, &hdmi_notifiers, head) {
> > > +           if (n->dev == dev) {
> > > +                   mutex_unlock(&hdmi_notifiers_lock);
> > > +                   kref_get(&n->kref);
> > > +                   return n;
> > > +           }
> > > +   }
> > > +   n = kzalloc(sizeof(*n), GFP_KERNEL);
> > > +   if (!n)
> > > +           goto unlock;
> > > +   n->dev = dev;
> > > +   mutex_init(&n->lock);
> > > +   BLOCKING_INIT_NOTIFIER_HEAD(&n->notifiers);
> > > +   kref_init(&n->kref);
> > > +   list_add_tail(&n->head, &hdmi_notifiers);
> > > +unlock:
> > > +   mutex_unlock(&hdmi_notifiers_lock);
> > > +   return n;
> > > +}
> > > +EXPORT_SYMBOL_GPL(hdmi_notifier_get);
> > > +
> > > +static void hdmi_notifier_release(struct kref *kref)
> > > +{
> > > +   struct hdmi_notifier *n =
> > > +           container_of(kref, struct hdmi_notifier, kref);
> > > +
> > > +   mutex_lock(&hdmi_notifiers_lock);
> > > +   list_del(&n->head);
> > > +   mutex_unlock(&hdmi_notifiers_lock);
> > > +   kfree(n->edid);
> > > +   kfree(n);
> > > +}
> > > +
> > > +void hdmi_notifier_put(struct hdmi_notifier *n)
> > > +{
> > > +   kref_put(&n->kref, hdmi_notifier_release);
> > > +}
> > > +EXPORT_SYMBOL_GPL(hdmi_notifier_put);
> > > +
> > > +int hdmi_notifier_register(struct hdmi_notifier *n, struct notifier_block *nb)
> > > +{
> > > +   int ret = blocking_notifier_chain_register(&n->notifiers, nb);
> > > +
> > > +   if (ret)
> > > +           return ret;
> > > +   kref_get(&n->kref);
> > > +   mutex_lock(&n->lock);
> > > +   if (n->connected) {
> > > +           blocking_notifier_call_chain(&n->notifiers, HDMI_CONNECTED, n);
> > > +           if (n->edid_size)
> > > +                   blocking_notifier_call_chain(&n->notifiers,
> > > +                                                HDMI_NEW_EDID, n);
> > > +           if (n->has_eld)
> > > +                   blocking_notifier_call_chain(&n->notifiers,
> > > +                                                HDMI_NEW_ELD, n);
> > > +   }
> > > +   mutex_unlock(&n->lock);
> > > +   return 0;
> > > +}
> > > +EXPORT_SYMBOL_GPL(hdmi_notifier_register);
> > > +
> > > +int hdmi_notifier_unregister(struct hdmi_notifier *n, struct notifier_block *nb)
> > > +{
> > > +   int ret = blocking_notifier_chain_unregister(&n->notifiers, nb);
> > > +
> > > +   if (ret == 0)
> > > +           hdmi_notifier_put(n);
> > > +   return ret;
> > > +}
> > > +EXPORT_SYMBOL_GPL(hdmi_notifier_unregister);
> > > +
> > > +void hdmi_event_connect(struct hdmi_notifier *n)
> > > +{
> > > +   mutex_lock(&n->lock);
> > > +   n->connected = true;
> > > +   blocking_notifier_call_chain(&n->notifiers, HDMI_CONNECTED, n);
> > > +   mutex_unlock(&n->lock);
> > > +}
> > > +EXPORT_SYMBOL_GPL(hdmi_event_connect);
> > > +
> > > +void hdmi_event_disconnect(struct hdmi_notifier *n)
> > > +{
> > > +   mutex_lock(&n->lock);
> > > +   n->connected = false;
> > > +   n->has_eld = false;
> > > +   n->edid_size = 0;
> > > +   blocking_notifier_call_chain(&n->notifiers, HDMI_DISCONNECTED, n);
> > > +   mutex_unlock(&n->lock);
> > > +}
> > > +EXPORT_SYMBOL_GPL(hdmi_event_disconnect);
> > > +
> > > +int hdmi_event_new_edid(struct hdmi_notifier *n, const void *edid, size_t size)
> > > +{
> > > +   mutex_lock(&n->lock);
> > > +   if (n->edid_allocated_size < size) {
> > > +           void *p = kmalloc(size, GFP_KERNEL);
> > > +
> > > +           if (!p) {
> > > +                   mutex_unlock(&n->lock);
> > > +                   return -ENOMEM;
> > > +           }
> > > +           kfree(n->edid);
> > > +           n->edid = p;
> > > +           n->edid_allocated_size = size;
> > > +   }
> > > +   memcpy(n->edid, edid, size);
> > > +   n->edid_size = size;
> > > +   blocking_notifier_call_chain(&n->notifiers, HDMI_NEW_EDID, n);
> > > +   mutex_unlock(&n->lock);
> > > +   return 0;
> > > +}
> > > +EXPORT_SYMBOL_GPL(hdmi_event_new_edid);
> > > +
> > > +void hdmi_event_new_eld(struct hdmi_notifier *n, const u8 eld[128])
> > > +{
> > > +   mutex_lock(&n->lock);
> > > +   memcpy(n->eld, eld, sizeof(n->eld));
> > > +   n->has_eld = true;
> > > +   blocking_notifier_call_chain(&n->notifiers, HDMI_NEW_ELD, n);
> > > +   mutex_unlock(&n->lock);
> > > +}
> > > +EXPORT_SYMBOL_GPL(hdmi_event_new_eld);
> > > diff --git a/include/linux/hdmi-notifier.h b/include/linux/hdmi-notifier.h
> > > new file mode 100644
> > > index 000000000000..c8f35110e3e3
> > > --- /dev/null
> > > +++ b/include/linux/hdmi-notifier.h
> > > @@ -0,0 +1,112 @@
> > > +/* SPDX-License-Identifier: GPL-2.0
> > > + * hdmi-notifier.h - notify interested parties of (dis)connect and EDID
> > > + * events
> > > + *
> > > + * Copyright 2016 Russell King <rmk+kernel@arm.linux.org.uk>
> > > + * Copyright 2016 Cisco Systems, Inc. and/or its affiliates.
> > > + * All rights reserved.
> > > + */
> > > +
> > > +#ifndef LINUX_HDMI_NOTIFIER_H
> > > +#define LINUX_HDMI_NOTIFIER_H
> > > +
> > > +#include <linux/types.h>
> > > +#include <linux/notifier.h>
> > > +#include <linux/kref.h>
> > > +
> > > +enum {
> > > +   HDMI_CONNECTED,
> > > +   HDMI_DISCONNECTED,
> > > +   HDMI_NEW_EDID,
> > > +   HDMI_NEW_ELD,
> > > +};
> > > +
> > > +struct device;
> > > +
> > > +struct hdmi_notifier {
> > > +   /* Lock to protect callback registration and notification. */
> > > +   struct mutex lock;
> > > +   struct list_head head;
> > > +   struct kref kref;
> > > +   struct blocking_notifier_head notifiers;
> > > +   struct device *dev;
> > > +
> > > +   /* Current state */
> > > +   unsigned int connected : 1;
> > > +   unsigned int has_eld : 1;
> > > +   unsigned char eld[128];
> > > +   void *edid;
> > > +   size_t edid_size;
> > > +   size_t edid_allocated_size;
> > > +};
> > > +
> > > +/**
> > > + * hdmi_notifier_get - find or create a new hdmi_notifier for the given device.
> > > + * @dev: device that sends the events.
> > > + *
> > > + * If a notifier for device @dev already exists, then increase the refcount
> > > + * and return that notifier.
> > > + *
> > > + * If it doesn't exist, then allocate a new notifier struct and return a
> > > + * pointer to that new struct.
> > > + *
> > > + * Return NULL if the memory could not be allocated.
> > > + */
> > > +struct hdmi_notifier *hdmi_notifier_get(struct device *dev);
> > > +
> > > +/**
> > > + * hdmi_notifier_put - decrease refcount and delete when the refcount reaches 0.
> > > + * @n: notifier
> > > + */
> > > +void hdmi_notifier_put(struct hdmi_notifier *n);
> > > +
> > > +/**
> > > + * hdmi_notifier_register - register the notifier with the notifier_block.
> > > + * @n: the HDMI notifier
> > > + * @nb: the notifier_block
> > > + */
> > > +int hdmi_notifier_register(struct hdmi_notifier *n, struct notifier_block *nb);
> > > +
> > > +/**
> > > + * hdmi_notifier_unregister - unregister the notifier with the notifier_block.
> > > + * @n: the HDMI notifier
> > > + * @nb: the notifier_block
> > > + */
> > > +int hdmi_notifier_unregister(struct hdmi_notifier *n,
> > > +                        struct notifier_block *nb);
> > > +
> > > +/**
> > > + * hdmi_event_connect - send a connect event.
> > > + * @n: the HDMI notifier
> > > + *
> > > + * Send an HDMI_CONNECTED event to any registered parties.
> > > + */
> > > +void hdmi_event_connect(struct hdmi_notifier *n);
> > > +
> > > +/**
> > > + * hdmi_event_disconnect - send a disconnect event.
> > > + * @n: the HDMI notifier
> > > + *
> > > + * Send an HDMI_DISCONNECTED event to any registered parties.
> > > + */
> > > +void hdmi_event_disconnect(struct hdmi_notifier *n);
> > > +
> > > +/**
> > > + * hdmi_event_new_edid - send a new EDID event.
> > > + * @n: the HDMI notifier
> > > + *
> > > + * Send an HDMI_NEW_EDID event to any registered parties.
> > > + * This function will make a copy the EDID so it can return -ENOMEM if
> > > + * no memory could be allocated.
> > > + */
> > > +int hdmi_event_new_edid(struct hdmi_notifier *n, const void *edid, size_t size);
> > > +
> > > +/**
> > > + * hdmi_event_new_eld - send a new ELD event.
> > > + * @n: the HDMI notifier
> > > + *
> > > + * Send an HDMI_NEW_ELD event to any registered parties.
> > > + */
> > > +void hdmi_event_new_eld(struct hdmi_notifier *n, const u8 eld[128]);
> > > +
> > > +#endif
> > >
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
