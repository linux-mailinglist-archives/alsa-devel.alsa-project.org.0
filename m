Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD236A5BF3
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Feb 2023 16:30:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B3D8828;
	Tue, 28 Feb 2023 16:29:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B3D8828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677598230;
	bh=hcXafIxHuoahz1Cokb3IrPCYphDo8xRmiIBP8KWMMW8=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BPtKXxVuaVes/XP/0Ao083/70Qel5Eh393sGfGGdgOjt6qBUzgOahyOgRYfsna78T
	 U6fiYrrQpVkdEBzcFs7EOFTKrN+jGyNeBPZx3d5lt0S7uun3PvG0H9Oi9mojcjoghp
	 aNMnvdJ0zvD4RpdH4Nev9OZ8RvdWNLv5e3Wzh+ms=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E6A58F800FA;
	Tue, 28 Feb 2023 16:29:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D83D9F8049C; Tue, 28 Feb 2023 16:29:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 90593F800FA
	for <alsa-devel@alsa-project.org>; Tue, 28 Feb 2023 16:29:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90593F800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=2bvrZc0h
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5FEE4B80E67;
	Tue, 28 Feb 2023 15:29:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3C2DC433EF;
	Tue, 28 Feb 2023 15:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1677598161;
	bh=hcXafIxHuoahz1Cokb3IrPCYphDo8xRmiIBP8KWMMW8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2bvrZc0hDxg6mbBnAIMY0O72OpR3+QAyiBK3BjlyFb+zHGlH4G23le/063J2XMs6B
	 HZpUVrM359GPeSUL2HWAH5PPSpBnCd+DCedkVNH01gdwIvQpcTYFkUOwn+ivo09o8Z
	 u0z9zhu58bwTCwgfv2/4hxBK71fsF/L1NIFzK3VY=
Date: Tue, 28 Feb 2023 16:29:18 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Subject: Re: [RFC PATCH v2 12/22] sound: usb: card: Introduce USB SND
 platform op callbacks
Message-ID: <Y/4dzus7J07quj61@kroah.com>
References: <20230126031424.14582-1-quic_wcheng@quicinc.com>
 <20230126031424.14582-13-quic_wcheng@quicinc.com>
 <Y9Ui82OaI54Qx8Ft@kroah.com>
 <2c062ab0-905c-f1fe-eca2-02e23cc9fa6f@quicinc.com>
 <5e5c6481-8d5d-dc3f-e40e-986e3ac30387@quicinc.com>
 <Y/2tsfGGzAlLzxwd@kroah.com>
 <b38b317e-9c5e-a655-4364-df49c3b64b88@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b38b317e-9c5e-a655-4364-df49c3b64b88@quicinc.com>
Message-ID-Hash: XPZT2YMZQG4LGRAZ7KWUMGCCRFHN24Q5
X-Message-ID-Hash: XPZT2YMZQG4LGRAZ7KWUMGCCRFHN24Q5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XPZT2YMZQG4LGRAZ7KWUMGCCRFHN24Q5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Feb 28, 2023 at 01:19:33AM -0800, Wesley Cheng wrote:
> Hi Greg,
> 
> On 2/27/2023 11:30 PM, Greg KH wrote:
> > On Mon, Feb 27, 2023 at 06:59:32PM -0800, Wesley Cheng wrote:
> > > Hi Greg,
> > > 
> > > On 2/10/2023 2:49 PM, Wesley Cheng wrote:
> > > > Hi Greg,
> > > > 
> > > > On 1/28/2023 5:28 AM, Greg KH wrote:
> > > > > On Wed, Jan 25, 2023 at 07:14:14PM -0800, Wesley Cheng wrote:
> > > > > > Allow for different platforms to be notified on USB SND
> > > > > > connect/disconnect
> > > > > > seqeunces.  This allows for platform USB SND modules to properly
> > > > > > initialize
> > > > > > and populate internal structures with references to the USB SND chip
> > > > > > device.
> > > > > > 
> > > > > > Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> > > > > > ---
> > > > > >    sound/usb/card.c | 28 ++++++++++++++++++++++++++++
> > > > > >    sound/usb/card.h | 20 ++++++++++++++++++++
> > > > > >    2 files changed, 48 insertions(+)
> > > > > > 
> > > > > > diff --git a/sound/usb/card.c b/sound/usb/card.c
> > > > > > index 26268ffb8274..803230343c16 100644
> > > > > > --- a/sound/usb/card.c
> > > > > > +++ b/sound/usb/card.c
> > > > > > @@ -117,6 +117,24 @@ MODULE_PARM_DESC(skip_validation, "Skip
> > > > > > unit descriptor validation (default: no)
> > > > > >    static DEFINE_MUTEX(register_mutex);
> > > > > >    static struct snd_usb_audio *usb_chip[SNDRV_CARDS];
> > > > > >    static struct usb_driver usb_audio_driver;
> > > > > > +static struct snd_usb_platform_ops *platform_ops;
> > > > > 
> > > > > You can not have a single "platform_ops" pointer, this HAS to be
> > > > > per-bus.
> > > > > 
> > > > 
> > > > Agreed.
> > > > 
> > > 
> > > I looked at seeing how we could implement this at a per bus level, but the
> > > USB class driver model doesn't exactly have a good framework for supporting
> > > this.  Reason being is because, at the time of the USB SND class driver
> > > initialization, there is a big chance that there isn't a USB bus registered
> > > in the system, so the point of adding the operations is not clear.  However,
> > > we need to ensure that we've added the platform/driver operations before any
> > > USB SND devices are detected.
> > 
> > But the offload "engine" is associated with the specific USB bus
> > controller instance in the system, so perhaps you are just not adding
> > this to the correct location?
> > 
> 
> There are several parts to the offload logic:
> 1.  XHCI interrupter/resource components - fetching addresses to the proper
> event ring and transfer rings for the audio DSP.  This is the part which is
> specific to the controller instance, and APIs are being directly exported
> from the XHCI HCD, as the offloading features utilized are only specific for
> XHCI based controllers.  This is handled in patches 1-6 in this series.
> Each XHCI instance will have its own set of interrupters, and transfer
> resources.
> 
> 2.  USB offload class driver - driver which interacts with USB SND for
> operations like UAC descriptor parsing, USB audio device support params, and
> USB endpoint setup (ie issuing SET_INTERFACE to enable the device to start
> playback this is a SETUP transaction).  It will interact with the USB
> backend and items in #1, to set up the audio playback.
> 
> > The sound core shouldn't care about this at all, add the logic to the
> > USB host controller driver instead, why isn't this just another USB bus
> > function?
> > 
> 
> The intention of the platform ops here is to mainly keep track of USB SND
> card/pcm device creation, and access to the main "struct snd_usb_audio".
> This structure carries all the information about the different substreams
> allocated, as well as the formats supported by the audio device.  This is
> passed onto the USB backend, which will be utilized in my next revision to
> allow userspace to specifically select the proper card/PCM device to enable
> offload on.

Oh, I can't wait to see that user/kernel api :)

It's really hard to answer you here as I don't see any patches, and I
don't know how your hardware really works.  But in general, you should
always be working on the bus level here, and that will get rid of any
static lists or any "single controller pointers" that you all have had
in previous versions.

I'll wait for patches to be able to comment further.

thanks,

greg k-h
