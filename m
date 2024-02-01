Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5466C8459B8
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Feb 2024 15:14:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDC5984D;
	Thu,  1 Feb 2024 15:14:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDC5984D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706796865;
	bh=ECkhvJTSiwtqcsjiUJstiQ6wao8GGDI7wuIUzGHetV0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dMrBsLV1xltWeTA/2M6r3qBhbyKmC/4yX880hywJieNE2X+G2B8apLxkUBTWhphVi
	 gPVexTKePdPP0GJNQ8m40yK49otGhZeaKB5zGv2EPKwsqxllpRWPI1071EBNppq48T
	 vjAvWl3UpunHNTucZ+peNDUE5MVW7e3CS/MKzVng=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2F5F5F80580; Thu,  1 Feb 2024 15:13:53 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 50423F8056F;
	Thu,  1 Feb 2024 15:13:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71DCDF8055C; Thu,  1 Feb 2024 15:13:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from puleglot.ru (puleglot.ru [IPv6:2a01:4f8:1c0c:58e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2EDA3F80548
	for <alsa-devel@alsa-project.org>; Thu,  1 Feb 2024 15:13:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2EDA3F80548
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=tsoy.me header.i=@tsoy.me header.a=rsa-sha256
 header.s=mymail header.b=TBIluyxF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tsoy.me;
	s=mymail; h=Sender:MIME-Version:Content-Transfer-Encoding:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
	:List-Post:List-Owner:List-Archive;
	bh=+NSjZq6XHGcqL3FInz/Fdm3h+tMVGOHalEiYvpOjEMU=; b=TBIluyxF7nJjqWEALZtEgWRGxM
	foFyCfB+4Xn7u2CDvVkjj6GcqDC9oNQsAnYU3kJSAWwtZplBhXtNfFGIH1ZpTYIBgnHGq4R0xzRII
	KwqgFDotJq8j5PHCb+l4KF0rW9CnNwM/HIEUexnG1d8AMY24qyUDdPtlFfM4G/jfw+Yc=;
Received: from [10.8.10.223]
	by puleglot.ru with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <puleglot@puleglot.ru>)
	id 1rVXov-00000000zUI-3P8O;
	Thu, 01 Feb 2024 17:13:37 +0300
Message-ID: <63f56132a10263e29a7b667225a756e3ed4223dd.camel@tsoy.me>
Subject: Re: [PATCH] ALSA: usb-audio: Ignore clock selector errors for
 single connection
From: Alexander Tsoy <alexander@tsoy.me>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, Takashi Iwai
	 <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Date: Thu, 01 Feb 2024 17:12:51 +0300
In-Reply-To: <87le84z6t8.wl-tiwai@suse.de>
References: <20240201115308.17838-1-alexander@tsoy.me>
	 <87le84z6t8.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 
MIME-Version: 1.0
Sender: puleglot@puleglot.ru
Message-ID-Hash: 76T7CVT5YMMUZGBUUUIZIYV7CWYRMMB2
X-Message-ID-Hash: 76T7CVT5YMMUZGBUUUIZIYV7CWYRMMB2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/76T7CVT5YMMUZGBUUUIZIYV7CWYRMMB2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

=D0=92 =D0=A7=D1=82, 01/02/2024 =D0=B2 13:51 +0100, Takashi Iwai =D0=BF=D0=
=B8=D1=88=D0=B5=D1=82:
> On Thu, 01 Feb 2024 12:53:08 +0100,
> Alexander Tsoy wrote:
> >=20
> > For devices with multiple clock sources connected to a selector, we
> > need
> > to check what a clock selector control request has returned. This
> > is
> > needed to ensure that a requested clock source is indeed selected
> > and for
> > autoclock feature to work.
> >=20
> > For devices with single clock source connected, if we get an error
> > there
> > is nothing else we can do about it. We can't skip clock selector
> > setup as
> > it is required by some devices. So lets just ignore error in this
> > case.
> >=20
> > This should fix various buggy Mackie devices:
> >=20
> > [=C2=A0 649.109785] usb 1-1.3: parse_audio_format_rates_v2v3(): unable
> > to find clock source (clock -32)
> > [=C2=A0 649.111946] usb 1-1.3: parse_audio_format_rates_v2v3(): unable
> > to find clock source (clock -32)
> > [=C2=A0 649.113822] usb 1-1.3: parse_audio_format_rates_v2v3(): unable
> > to find clock source (clock -32)
> >=20
> > There is also interesting info from the Windows documentation [1]
> > (this
> > is probably why manufacturers dont't even test this feature):
> >=20
> > "The USB Audio 2.0 driver doesn't support clock selection. The
> > driver
> > uses the Clock Source Entity, which is selected by default and
> > never
> > issues a Clock Selector Control SET CUR request."
> >=20
> > Link:
> > https://learn.microsoft.com/en-us/windows-hardware/drivers/audio/usb-2-=
0-audio-drivers
> > =C2=A0[1]
> > Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D217314
> > Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D218175
> > Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D218342
> > Signed-off-by: Alexander Tsoy <alexander@tsoy.me>
> > ---
> > =C2=A0sound/usb/clock.c | 10 +++++++++-
> > =C2=A01 file changed, 9 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/sound/usb/clock.c b/sound/usb/clock.c
> > index a8204c6d6fac..60fcb872a80b 100644
> > --- a/sound/usb/clock.c
> > +++ b/sound/usb/clock.c
> > @@ -347,8 +347,16 @@ static int __uac_clock_find_source(struct
> > snd_usb_audio *chip,
> > =C2=A0			=C2=A0=C2=A0=C2=A0 !writeable)
> > =C2=A0				return ret;
> > =C2=A0			err =3D uac_clock_selector_set_val(chip,
> > entity_id, cur);
> > -			if (err < 0)
> > +			if (err < 0) {
> > +				if (pins =3D=3D 1) {
> > +					usb_audio_dbg(chip,
> > +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "%s():
> > selector returned an error, "
> > +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "assuming a
> > firmware bug, id %d, ret %d\n",
> > +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __func__,
> > clock_id, err);
> > +					return ret;
> > +				}
> > =C2=A0				return err;
> > +			}
>=20
> Hmm, what's the difference of the behavior except for the additional
> debug message?=C2=A0 Both returns ret, so I don't see how it fixes.

If pins =3D=3D 1, then ret is returned, otherwise err is returned. They are
not equal here. But yes, the code is a bit confusing.

