Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C3316147B
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 15:24:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB64D828;
	Mon, 17 Feb 2020 15:23:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB64D828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581949457;
	bh=Tlj6xL3WvQ5ViSrN9fjmXNjdx9cYt199CUCARCm/00c=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eetTxxKNjKkngjqN7vSuF/jkSqp+Aetja4+HoBEgmS2HuyuO2oE+UPOnz9DbPHF9Z
	 eysfKhruGfvG18NP3ENK1BNEDWFSy49xk59U9Km+UpTDjg3XmCSIuTvDeNQrpQUBwG
	 4IOFQ/1+IPrR63TcKiLlSkJC5BpV+wxZUDQBGanw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36588F80214;
	Mon, 17 Feb 2020 15:22:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DEC96F801F5; Mon, 17 Feb 2020 15:22:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14B60F8015E
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 15:22:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14B60F8015E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="LIoYI2jN"
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3FAE32072C;
 Mon, 17 Feb 2020 14:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581949360;
 bh=8DTBdEIPZHL+pnTNBLijhXTQYXxTMAMa6+mt+KfaJxo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LIoYI2jNtpluO89Bo+oIxKnwb861QMKWvv9jbloLr7yjtwXSIkR/ugSZedB3dJAsY
 n9xDDt7MdwpSEDjI5yOV3qZxwkuE5oVOTbXFum43Jpqimv/gVVThMB6DB3XdB3BqFL
 WYZQ6paTHo48EYtY0N8YweFCo5ERGUNw3SO1QO8Q=
Date: Mon, 17 Feb 2020 15:22:38 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20200217142238.GA1144881@kroah.com>
References: <20200213112059.18745-1-tiwai@suse.de>
 <20200213112059.18745-2-tiwai@suse.de>
 <s5hd0adguv9.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <s5hd0adguv9.wl-tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH 1/2] usb: audio-v2: Add
 uac2_effect_unit_descriptor definition
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

On Mon, Feb 17, 2020 at 03:18:34PM +0100, Takashi Iwai wrote:
> On Thu, 13 Feb 2020 12:20:58 +0100,
> Takashi Iwai wrote:
> > 
> > The UAC2 Effect Unit Descriptor has a slightly different definition
> > from other similar ones like Processing Unit or Extension Unit.
> > Define it here so that it can be used in USB-audio driver in a later
> > patch.
> > 
> > Signed-off-by: Takashi Iwai <tiwai@suse.de>
> > ---
> >  include/linux/usb/audio-v2.h | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> > 
> > diff --git a/include/linux/usb/audio-v2.h b/include/linux/usb/audio-v2.h
> > index ba4b3e3327ff..cb9900b34b67 100644
> > --- a/include/linux/usb/audio-v2.h
> > +++ b/include/linux/usb/audio-v2.h
> > @@ -156,6 +156,18 @@ struct uac2_feature_unit_descriptor {
> >  	__u8 bmaControls[0]; /* variable length */
> >  } __attribute__((packed));
> >  
> > +/* 4.7.2.10 Effect Unit Descriptor */
> > +
> > +struct uac2_effect_unit_descriptor {
> > +	__u8 bLength;
> > +	__u8 bDescriptorType;
> > +	__u8 bDescriptorSubtype;
> > +	__u8 bUnitID;
> > +	__le16 wEffectType;
> > +	__u8 bSourceID;
> > +	__u8 bmaControls[]; /* variable length */
> > +} __attribute__((packed));
> > +
> >  /* 4.9.2 Class-Specific AS Interface Descriptor */
> >  
> >  struct uac2_as_header_descriptor {
> 
> Greg, I suppose you are OK with this addition?
> 
> 

Yes, that's fine with me:

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
