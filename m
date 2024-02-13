Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B71A8530BE
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Feb 2024 13:43:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D38686E;
	Tue, 13 Feb 2024 13:43:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D38686E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707828221;
	bh=isVT3swz7BX2lSLns3AewMrJcOXQ42RCXPUYDhjUlgM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dxIs2yMXutE5bCiBjmYacMVTzJqzNEuANsqkl3mMuKioKWBhBPHAqKlCTDbSJqQG+
	 nTG6RnxL8uLI+vSO4X5FxE2SvNShvaiIuaHFGqYRFfI34VxPn3g88RkRkKxIFZQ8eD
	 NlaIqIrpTcniy4saeTPHMiZ0UVLyp2MLDzIzaSao=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E145F80571; Tue, 13 Feb 2024 13:43:20 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 65326F805A9;
	Tue, 13 Feb 2024 13:43:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5C0CF8016E; Tue, 13 Feb 2024 13:43:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from puleglot.ru (puleglot.ru [IPv6:2a01:4f8:1c0c:58e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 05D79F800BF
	for <alsa-devel@alsa-project.org>; Tue, 13 Feb 2024 13:43:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05D79F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=tsoy.me header.i=@tsoy.me header.a=rsa-sha256
 header.s=mymail header.b=NBat4QhS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tsoy.me;
	s=mymail; h=Sender:MIME-Version:Content-Transfer-Encoding:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
	:List-Post:List-Owner:List-Archive;
	bh=aapO+1NwCqHDBlHbx8Ce0IIDPV5ZOXBr3A2aFyBpNAQ=; b=NBat4QhSU7CU+g68EzUOH3nH2H
	Nai1+JWcpXa3qQmxJ4utVW5AflijC41zg118pDIHRLAMDm1NJzIBfhB547ThIqEu3tiVS2rk0HwVV
	IGxBwl6wXDbu3FUoKX0HQkMxyurU3ZJmiw4dYVPZFM1iOaW+QK3cA/CYnj0NXOhKmjQ0=;
Received: from [2a00:1370:819a:f1b4:f5a8:7291:14f0:548b]
	by puleglot.ru with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <puleglot@puleglot.ru>)
	id 1rZs7s-00000002MQX-2pHo;
	Tue, 13 Feb 2024 15:43:04 +0300
Message-ID: <4cf2602f203dc960a70751c48a22f73b3548f04d.camel@tsoy.me>
Subject: Re: [PATCH] USB: Always select config with the highest supported
 UAC version
From: Alexander Tsoy <alexander@tsoy.me>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela
	 <perex@perex.cz>, Nikolay Yakimov <root@livid.pp.ru>, Saranya Gopal
	 <saranya.gopal@intel.com>
Date: Tue, 13 Feb 2024 15:42:51 +0300
In-Reply-To: <2024021353-reversing-waltz-7402@gregkh>
References: <20240212152848.44782-1-alexander@tsoy.me>
	 <2024021353-reversing-waltz-7402@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 
MIME-Version: 1.0
Sender: puleglot@puleglot.ru
Message-ID-Hash: USNVUSQSW6NZI2C27NYZMZJKUC5B2TXI
X-Message-ID-Hash: USNVUSQSW6NZI2C27NYZMZJKUC5B2TXI
X-MailFrom: puleglot@puleglot.ru
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/USNVUSQSW6NZI2C27NYZMZJKUC5B2TXI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

=D0=92 =D0=92=D1=82, 13/02/2024 =D0=B2 12:05 +0100, Greg Kroah-Hartman =D0=
=BF=D0=B8=D1=88=D0=B5=D1=82:
> On Mon, Feb 12, 2024 at 06:28:48PM +0300, Alexander Tsoy wrote:
> > Config with the highest supported UAC version is always preferable
> > because
> > it usually provides more features.
> >=20
> > Main motivation for this change is to improve support for several
> > UAC2
> > devices which have UAC1 config as the first one for compatibility
> > reasons.
> > UAC2 mode provides a wider range of supported sampling rates on
> > these
> > devices. Also when UAC4 support is implemented, it will need just
> > one
> > additional case line without changing the logic.
> >=20
> > Signed-off-by: Alexander Tsoy <alexander@tsoy.me>
> > ---
> > =C2=A0drivers/usb/core/generic.c | 39 +++++++++++++++++++++++++--------=
-
> > ----
> > =C2=A01 file changed, 26 insertions(+), 13 deletions(-)
> >=20
> > diff --git a/drivers/usb/core/generic.c
> > b/drivers/usb/core/generic.c
> > index b134bff5c3fe..8aeb180e1cf9 100644
> > --- a/drivers/usb/core/generic.c
> > +++ b/drivers/usb/core/generic.c
> > @@ -48,9 +48,16 @@ static bool is_audio(struct
> > usb_interface_descriptor *desc)
> > =C2=A0	return desc->bInterfaceClass =3D=3D USB_CLASS_AUDIO;
> > =C2=A0}
> > =C2=A0
> > -static bool is_uac3_config(struct usb_interface_descriptor *desc)
> > +static bool is_supported_uac(struct usb_interface_descriptor
> > *desc)
> > =C2=A0{
> > -	return desc->bInterfaceProtocol =3D=3D UAC_VERSION_3;
> > +	switch(desc->bInterfaceProtocol) {
> > +	case UAC_VERSION_1:
> > +	case UAC_VERSION_2:
> > +	case UAC_VERSION_3:
> > +		return true;
> > +	default:
> > +		return false;
> > +	}
> > =C2=A0}
> > =C2=A0
> > =C2=A0int usb_choose_configuration(struct usb_device *udev)
> > @@ -135,22 +142,28 @@ int usb_choose_configuration(struct
> > usb_device *udev)
> > =C2=A0		}
> > =C2=A0
> > =C2=A0		/*
> > -		 * Select first configuration as default for audio
> > so that
> > -		 * devices that don't comply with UAC3 protocol
> > are supported.
> > -		 * But, still iterate through other configurations
> > and
> > -		 * select UAC3 compliant config if present.
> > +		 * Iterate through audio configurations and select
> > the first of
> > +		 * the highest supported UAC versions. Select the
> > first config
> > +		 * if no supported UAC configs are found.
> > =C2=A0		 */
> > =C2=A0		if (desc && is_audio(desc)) {
> > -			/* Always prefer the first found UAC3
> > config */
> > -			if (is_uac3_config(desc)) {
> > -				best =3D c;
> > -				break;
> > -			}
> > +			struct
> > usb_interface_descriptor	*best_desc =3D NULL;
> > +
> > +			if (best)
> > +				best_desc =3D &best->intf_cache[0]-
> > >altsetting->desc;
>=20
> Are you sure you always have a intf_cache[0] pointer?=C2=A0 What about
> altsetting?=C2=A0 Remember, invalid descriptors happen all the time, and
> are
> a known "attack vector" against the USB stack.
>=20
>=20

Well, similar code exists at the beginning of the loop. But I just
discovered that according to the Backwards Compatibility sections of
UAC 3.0 and UAC 4.0 specs, we need to look at the bFunctionProtocol
field of the Interface Association descriptor. So the current code that
selects UAC3 configuration is also not entirely correct AFAIS.
