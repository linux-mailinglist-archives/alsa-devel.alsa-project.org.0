Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DB66A53B8
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Feb 2023 08:32:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A747828;
	Tue, 28 Feb 2023 08:31:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A747828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677569559;
	bh=e6s4tpTO5in76O06wuyEcoiAxV018g78W3FW7CWNMG8=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=b8MUHc50RDIPiYYYTmKgGlA0m5bYzXtj8L4KhRp7D82pOJGM9rvyG7sF6bgPKnQPe
	 R4Gi6iqPVZqm37/2pyyRnGhLXw8VjFzCKGDlXzEHPtd4HZC69AzXQxatXvjEV+KsAR
	 kKnNACx5EbI9qvGpFelMuH18/x0fgj+OxZmc1T8M=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 42EB2F802BE;
	Tue, 28 Feb 2023 08:31:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 14A72F8049C; Tue, 28 Feb 2023 08:31:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B7350F800FA
	for <alsa-devel@alsa-project.org>; Tue, 28 Feb 2023 08:31:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7350F800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=JmEu1Gdt
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4DC3661007;
	Tue, 28 Feb 2023 07:31:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D778C4339B;
	Tue, 28 Feb 2023 07:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1677569459;
	bh=e6s4tpTO5in76O06wuyEcoiAxV018g78W3FW7CWNMG8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JmEu1GdtX8gza/6UTwGHjaJOKfGTpyVRZty6nHoB8l3XBYVjcnHFvZuVD8uvAxHWu
	 dvRJX31VrceN5IU2JK5gI4TmGk0hJy8ACiJJyk4+FAjShY4+Rg1xxlVx7K4AkHVlNh
	 9CLm3iCWZAZcdGukKvVwqxtbOhrftl2jqQBTKcAE=
Date: Tue, 28 Feb 2023 08:30:57 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Subject: Re: [RFC PATCH v2 12/22] sound: usb: card: Introduce USB SND
 platform op callbacks
Message-ID: <Y/2tsfGGzAlLzxwd@kroah.com>
References: <20230126031424.14582-1-quic_wcheng@quicinc.com>
 <20230126031424.14582-13-quic_wcheng@quicinc.com>
 <Y9Ui82OaI54Qx8Ft@kroah.com>
 <2c062ab0-905c-f1fe-eca2-02e23cc9fa6f@quicinc.com>
 <5e5c6481-8d5d-dc3f-e40e-986e3ac30387@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5e5c6481-8d5d-dc3f-e40e-986e3ac30387@quicinc.com>
Message-ID-Hash: I3QGVSHZWVI2ECN2ZOP2TZJ3Z5EF367M
X-Message-ID-Hash: I3QGVSHZWVI2ECN2ZOP2TZJ3Z5EF367M
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: srinivas.kandagatla@linaro.org, mathias.nyman@intel.com,
 lgirdwood@gmail.com, andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 Thinh.Nguyen@synopsys.com, broonie@kernel.org, bgoswami@quicinc.com,
 tiwai@suse.com, robh+dt@kernel.org, agross@kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, quic_jackp@quicinc.com, quic_plai@quicinc.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I3QGVSHZWVI2ECN2ZOP2TZJ3Z5EF367M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Feb 27, 2023 at 06:59:32PM -0800, Wesley Cheng wrote:
> Hi Greg,
> 
> On 2/10/2023 2:49 PM, Wesley Cheng wrote:
> > Hi Greg,
> > 
> > On 1/28/2023 5:28 AM, Greg KH wrote:
> > > On Wed, Jan 25, 2023 at 07:14:14PM -0800, Wesley Cheng wrote:
> > > > Allow for different platforms to be notified on USB SND
> > > > connect/disconnect
> > > > seqeunces.  This allows for platform USB SND modules to properly
> > > > initialize
> > > > and populate internal structures with references to the USB SND chip
> > > > device.
> > > > 
> > > > Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> > > > ---
> > > >   sound/usb/card.c | 28 ++++++++++++++++++++++++++++
> > > >   sound/usb/card.h | 20 ++++++++++++++++++++
> > > >   2 files changed, 48 insertions(+)
> > > > 
> > > > diff --git a/sound/usb/card.c b/sound/usb/card.c
> > > > index 26268ffb8274..803230343c16 100644
> > > > --- a/sound/usb/card.c
> > > > +++ b/sound/usb/card.c
> > > > @@ -117,6 +117,24 @@ MODULE_PARM_DESC(skip_validation, "Skip
> > > > unit descriptor validation (default: no)
> > > >   static DEFINE_MUTEX(register_mutex);
> > > >   static struct snd_usb_audio *usb_chip[SNDRV_CARDS];
> > > >   static struct usb_driver usb_audio_driver;
> > > > +static struct snd_usb_platform_ops *platform_ops;
> > > 
> > > You can not have a single "platform_ops" pointer, this HAS to be
> > > per-bus.
> > > 
> > 
> > Agreed.
> > 
> 
> I looked at seeing how we could implement this at a per bus level, but the
> USB class driver model doesn't exactly have a good framework for supporting
> this.  Reason being is because, at the time of the USB SND class driver
> initialization, there is a big chance that there isn't a USB bus registered
> in the system, so the point of adding the operations is not clear.  However,
> we need to ensure that we've added the platform/driver operations before any
> USB SND devices are detected.

But the offload "engine" is associated with the specific USB bus
controller instance in the system, so perhaps you are just not adding
this to the correct location?

The sound core shouldn't care about this at all, add the logic to the
USB host controller driver instead, why isn't this just another USB bus
function?

> To add to the above, in case of OTG/DRD (dual role) designs, the USB HCD/bus
> isn't created until we move into the host role.  At that time, using DWC3 as
> an example, we will create the XHCI platform device, and probe the USB HCD,
> where a USB bus is created.

Great, again, tie it to the specific xhci host controler instance.

> In general, we currently think this USB offload driver should co-exist with
> the USB SND class driver, which handles all devices connected across every
> bus.

And that is incorrect, please do not do that.

> We can add a check to the platform connect routine to ensure that
> there is a reference to the USB backend.  If so, then that particular USB
> bus/sysdev can be supported by the audio DSP.  That way, we do not falsely
> populate USB SND cards which are present on another USB bus/controller.

You should NEVER be able to populate a USB card unless the USB bus
controller has given you the USB interface structure to control, so I do
not understand how this is an issue.

thanks,

greg k-h
