Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +EmKOG8DqWlW0QAAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Thu, 05 Mar 2026 05:15:43 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BCB20AB57
	for <lists+alsa-devel@lfdr.de>; Thu, 05 Mar 2026 05:15:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1CB560270;
	Thu,  5 Mar 2026 05:15:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1CB560270
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1772684143;
	bh=PbjHTwrWY0E4cnWo2pGmkWXHJVjIxFzRV3NIR8PPUwo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RB3tthDyEAO4Sk5BwfsrcYAuGdn+SmB9NEHlX3fFhrGk5l5/TolEJW/DEPpEV21z8
	 BjXnM3yMGTHOkwJNmxt+PwJ3zi3UpRABZq/kbuSRp81yax/UEO0HTvf8M70C0ScrpW
	 btRnNynbXHnOzjWOor3OAlqG6D9mqJGNbuI8nih4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C996F80224; Thu,  5 Mar 2026 05:15:08 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CC247F805F1;
	Thu,  5 Mar 2026 05:15:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8E3DF8025A; Thu,  5 Mar 2026 05:14:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-0.8 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com
 [209.85.221.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2E28FF800F3
	for <alsa-devel@alsa-project.org>; Thu,  5 Mar 2026 05:14:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E28FF800F3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=PvTkXjjh
Received: by mail-vk1-f175.google.com with SMTP id
 71dfb90a1353d-56af4aad3e5so91462e0c.3
        for <alsa-devel@alsa-project.org>;
 Wed, 04 Mar 2026 20:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772684096; x=1773288896;
 darn=alsa-project.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7XVJmgMFfGy7rnDyOtBDHB7aEliuxFeOISS+j/pH0oI=;
        b=PvTkXjjhe6MmkDXydksZYLYzj4VEh/VHI4RCYipK3TDXfObELK4Y3iMOAo1IsBVNfH
         kDzApPfGWNLaXJHUX204oAFHcbTHgsYYEb1j6wvyLuJ7Q+ZFdUKp+Ukp87kagW1mDqRT
         JP6uNXut7MgHlVGHlX+VFAQ7/nOjcYA8t+v7Lip9kuXHjCOr1Zki+6yl5Y4zSW1P+O/r
         jY+TbZo3HIWgZBjCxx3M8VEkTdtlww17MR/zKtRoLLxpNMUbop8oCJrRTVRiBWV69PPb
         zspusFg4SvHXZPCzgRGTDH/KE/lAMAjuCZCdFL158iqe+jo7NlLPilo0mX7SK4ztS0d/
         7VHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772684096; x=1773288896;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7XVJmgMFfGy7rnDyOtBDHB7aEliuxFeOISS+j/pH0oI=;
        b=qTzh3Z2RdLa3A+bI6Z4sC9HAL2YGGXH46kssqV1SzpXluyigTd4q9cAMCiQBfXCWo7
         7Y8p7YzLPwhJ57H2LGE9E+/4Q//SvfN9ZTw2xFiHL0xYnjalU7UkpWAdPOqAc1XkDl47
         rw95aNIdh/2FCI9Jh8sHZUoj4fxoBwkzy7QKXz0dMzucTukEG7uH0xJgO8eGLJBpfFh/
         WeYSS6L/cddPSuksEzkImO4febw5uYnju+nmI3jMrQIod1IoRW4W7bzqFIEE7NmN0i/Z
         ITJ5sKTqvzXRfUDYhcDhHpIr5BcUbNyog6fQ110DhSqFSTgckICyhlbC+YInHEMgJuDe
         4aBA==
X-Gm-Message-State: AOJu0YwcWHiJ255H9wp7ePTPXNSVz9HU8QGlCSYlNmg4nD1IxTCF7v1l
	4VU5GvDeW8tiLIdMIz7w2fri7GjE5Qv1ICeBg46A3GqI7bSzOO+Bkbqc
X-Gm-Gg: ATEYQzzTJ26ChpAZ8OfZs5S8UGz4SNhds23aFvYzWkFeM5D+VhhW4NlM4Ldmix6Qqze
	teatdHf1/ovxsjhLWugoeOVLsR2TEgLEMd8H9Qa//zXH+HKjoz/QKw8pvWCI0mZhXYdamm65RDs
	+Fw/9lME/fIH0KLav9uEnRf5BN4bTf6Ra2vqg/wFH+IMjvT78/aW0FYlH1JrcGaRcgLWeg8z2Ak
	L3deZ1z1WQmBPTB+RzdR8r+p6KCI5A2hFj0W83gLn7jnnF8KI0pG1uSIJsmAeo/ChkAByVo+rV1
	vdYgnsXjIk483gS5uobHJW7vA8RtaAmmuzvrsUAjR1zN9ltEmkidG40z8BE/4qABiX5SGtj2fGu
	bxnDvkf05RO5bIv3XW777BDqmUmlPPob6tmaKw9G2JDbq8nK6DmApJfU80PKnYuZPbaoxx4qcxf
	A=
X-Received: by 2002:a05:6122:d13:b0:56a:f979:a9d1 with SMTP id
 71dfb90a1353d-56af979b07emr54559e0c.1.1772684096328;
        Wed, 04 Mar 2026 20:14:56 -0800 (PST)
Received: from geday ([2804:7f2:8080:fd2e::1])
        by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-56aeee6eab5sm3099953e0c.8.2026.03.04.20.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 20:14:55 -0800 (PST)
Date: Thu, 5 Mar 2026 01:14:50 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Federico Beffa <federico.beffa@fbengineering.ch>
Cc: alsa-devel@alsa-project.org, linux-usb@vger.kernel.org
Subject: Re: USB Audio: AlphaTheta / Pioneer DJM-S11 (2b73:0037) fails UAC2
 clock enumeration
Message-ID: <aakDOsBgrsyL6ujD@geday>
References: <b59edf1e-3735-4d16-84d7-631bc0ad81da@fbengineering.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b59edf1e-3735-4d16-84d7-631bc0ad81da@fbengineering.ch>
Message-ID-Hash: KM53YCUR5S7BHIBQW5SC7Z4FPNL7VR4F
X-Message-ID-Hash: KM53YCUR5S7BHIBQW5SC7Z4FPNL7VR4F
X-MailFrom: geraldogabriel@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; loop;
 banned-address; header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; emergency; member-moderation;
 nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size;
 news-moderation; no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.10
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KM53YCUR5S7BHIBQW5SC7Z4FPNL7VR4F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
X-Rspamd-Queue-Id: 88BCB20AB57
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[alsa-project.org:s=default,gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:federico.beffa@fbengineering.ch,m:alsa-devel@alsa-project.org,m:linux-usb@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[geraldogabriel@gmail.com,alsa-devel-bounces@alsa-project.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[alsa-devel@alsa-project.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alsa0.perex.cz:rdns,alsa0.perex.cz:helo,alsa-project.org:dkim];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	FROM_NEQ_ENVFROM(0.00)[geraldogabriel@gmail.com,alsa-devel-bounces@alsa-project.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[alsa-project.org:+,gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[alsa-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16019, ipnet:77.48.128.0/17, country:CZ];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, Dec 23, 2025 at 08:48:49PM +0100, Federico Beffa wrote:
> Hello ALSA developers,

Hi Federico!

> 
> I am investigating Linux support for the AlphaTheta / Pioneer DJM-S11 
> mixer and would like to report the current behavior and ask for guidance 
> on possible driver or quirk development.
> 
> Device:
> Vendor ID: 2b73 (AlphaTheta Corporation)
> Product ID: 0037 (DJM-S11)
> Firmware: bcdDevice 1.05
> USB speed: High Speed (480 Mbps)
> 
> Environment:
> NixOS 25.11
> Kernel: Linux 6.12.62
> Driver: snd-usb-audio
> 
> Summary of the issue:
> The DJM-S11 enumerates correctly on USB and exposes AudioControl, 
> AudioStreaming, MIDI, and HID interfaces. However, ALSA fails to create 
> any PCM devices, and the mixer does not appear in aplay -l.
> 
> Kernel log shows the following errors during enumeration:
> 
> parse_audio_format_rates_v2v3(): unable to retrieve number of sample 
> rates (clock 1)
> Quirk or no altset; falling back to MIDI 1.0
> 
> As a result, only MIDI and HID interfaces are exposed; audio streaming 
> is disabled.
> 
> Descriptor observations:
> 
> - The device advertises itself as USB Audio Class 2.0 (bcdADC 2.00, 
> InterfaceProtocol 32).
> - A CLOCK_SOURCE descriptor is present (ClockID 1) with Clock Frequency 
> Control marked as read/write.
> - No valid clock rate list can be retrieved by the driver (GET_RANGE 
> appears to fail).
> - Audio streaming endpoints do exist:
> - Playback: 14 channels, 24-bit PCM, isochronous async OUT
> - Capture: 10 channels, 24-bit PCM, isochronous async IN (implicit feedback)
> 
>  From inspection of lsusb -vv, this appears to be a case where the 
> device advertises UAC2 but requires vendor-specific clock initialization 
> before audio streaming becomes usable. Without that, snd-usb-audio 
> correctly refuses to expose PCM devices.
> 
> I can provide the full lsusb -vv output and additional logs if helpful.
> 
> Questions:
> 
> 1. Is this a known pattern for newer Pioneer/AlphaTheta mixers, and has 
> similar hardware been handled via ALSA quirks in the past?

see sound/usb/quirks-table.h

> 2. Would it be acceptable to experiment with a quirk that forces a fixed 
> sample rate (e.g. 48 kHz) and bypasses clock queries, for 
> development/testing purposes?

Actually, for production.

It shouldn't be too hard to produce a quirk from the datasheet of the
Pioneer DJM-S11, and even if you're unlucky to be missing a few details,
trial and error will be your best friend.

Thanks,
Geraldo Nascimento

> 3. Or does this class of device realistically require vendor-specific 
> control handling beyond what snd-usb-audio quirks can support?
> 
> I am interested in starting development work on this (initially 
> out-of-tree) and would appreciate any guidance on the most appropriate 
> direction.
> 
> Thank you for your time and for ALSA’s continued work.
> 
> Best regards,
> Federico
