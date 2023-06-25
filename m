Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A2273D155
	for <lists+alsa-devel@lfdr.de>; Sun, 25 Jun 2023 16:14:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2926D7F1;
	Sun, 25 Jun 2023 16:13:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2926D7F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687702456;
	bh=uyMnZUEOJHBblftWVKLe+I+7YWfa+kBCcbyAJi8+BwY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qEhy0ND6T8kULdv2gARZOUygllAtvAqdbvk2Qhi8WBgQw70cY5b+KybYO5IH3Ifdt
	 x84HGqbdHi34wDcmgYvg7b9xWTPp6DHudxr1bbSYXKSfQFqF2IlUUwfiCd1TxBSREX
	 5+b2MYiY9+2ZbsUj38jHXGGnDzoPQHnAvgFR1pLo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4ADBF80246; Sun, 25 Jun 2023 16:13:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0DA8AF80212;
	Sun, 25 Jun 2023 16:13:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB4FAF80246; Sun, 25 Jun 2023 16:13:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail.horus.com (mail.horus.com [78.46.148.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6B988F80093
	for <alsa-devel@alsa-project.org>; Sun, 25 Jun 2023 16:13:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B988F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=horus.com header.i=@horus.com header.a=rsa-sha256
 header.s=20180324 header.b=jX1M9Kbq
Received: from [192.168.1.22] (193-81-115-8.adsl.highway.telekom.at
 [193.81.115.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(Client did not present a certificate)
	by mail.horus.com (Postfix) with ESMTPSA id E77DE640B4;
	Sun, 25 Jun 2023 16:13:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=horus.com;
	s=20180324; t=1687702389;
	bh=7qJlAOheByQuos5Kt2MzKqpl7IodNTD/r1Gg6wvW1f4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jX1M9Kbq91C7ABFAHT2oWf+t0lV7BHptwiDILsSo5U/HLtYiT186oci1gZ/8BTA+Y
	 ov/uJ7/Ob06iCt6yw40TB22lzIH9O9jtGqTZN1Drs15HJMbqGSiqo3nAIPqLmZSdCX
	 eTwRjPyW/+Kv5ln7eG6LwWGCCPON6gNDec1/ypb4=
Received: by camel3.lan (Postfix, from userid 1000)
	id 20C345401CD; Sun, 25 Jun 2023 16:13:08 +0200 (CEST)
Date: Sun, 25 Jun 2023 16:13:08 +0200
From: Matthias Reichl <hias@horus.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
	Dom Cobley <popcornmix@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ALSA: pcm: fix ELD constraints for (E)AC3, DTS(-HD) and
 MLP formats
Message-ID: <ZJhLdE7oXAvIi1Yi@camel3.lan>
Mail-Followup-To: Matthias Reichl <hias@horus.com>,
	Markus Elfring <Markus.Elfring@web.de>, alsa-devel@alsa-project.org,
	kernel-janitors@vger.kernel.org, Dom Cobley <popcornmix@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	LKML <linux-kernel@vger.kernel.org>
References: <20230624165216.5719-1-hias@horus.com>
 <08b8fa18-9520-2959-a6c9-6ea6132d9b46@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <08b8fa18-9520-2959-a6c9-6ea6132d9b46@web.de>
Message-ID-Hash: LIPXGVEWJRJWXZB3AC5FY4OTNALTWVM4
X-Message-ID-Hash: LIPXGVEWJRJWXZB3AC5FY4OTNALTWVM4
X-MailFrom: hias@horus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LIPXGVEWJRJWXZB3AC5FY4OTNALTWVM4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, Jun 25, 2023 at 02:10:21PM +0200, Markus Elfring wrote:
> …
> > This patch fixes the constraints for the common AC3 and DTS formats,
> …
> 
> Please add an imperative change suggestion.

I assumed the motivation was pretty clear from the paragraph above which you
snipped off:

> The SADs of compressed formats contain the channel and sample rate
> info of the audio data inside the compressed stream, but when
> building constraints we must use the rates and channels used to
> transport the compressed streams.
>
> eg 48kHz 6ch EAC3 needs to be transmitted as a 2ch 192kHz stream.

The previous implementation added constraints that could be both too broad
and incomplete at the same time, leading to the audio device accepting
channel/rate combinations that are not supported by the sink while rejecting
combinations that are required to transmit the compressed bitstream.

Typical impact on users is eg "Dolby TrueHD passthrough does not work".

Consider this EDID audio block of a 2020 Sony TV which rejected Dolby TrueHD
passthrough:

    Linear PCM:
      Max channels: 6
      Supported sample rates (kHz): 192 176.4 96 88.2 48 44.1 32
      Supported sample sizes (bits): 24 20 16
    AC-3:
      Max channels: 6
      Supported sample rates (kHz): 48 44.1 32
      Maximum bit rate: 640 kb/s
    DTS:
      Max channels: 6
      Supported sample rates (kHz): 48 44.1 32
      Maximum bit rate: 1504 kb/s
    Enhanced AC-3 (DD+):
      Max channels: 8
      Supported sample rates (kHz): 48 44.1
      Supports Joint Object Coding
    MAT (MLP):
      Max channels: 8
      Supported sample rates (kHz): 48
      Supports Dolby TrueHD, object audio PCM and channel-based PCM
      Hash calculation not required for object audio PCM or channel-based PCM

The old implementation didn't add the 192kHz / 8ch combination that's required
to transport the MLP TrueHD bitstream, so opening the device in 8ch 192kHz mode
failed.

> How do you think about to add the tag “Fixes”?

I've thought about that but decided against it as adding exact constraints
has the chance of breaking existing applications that accidentally relied on
the (incorrect) previous behaviour of adding rather broad constraints.

Consider the following EDID of a 2009 Sony TV:

    Linear PCM:
      Max channels: 2
      Supported sample rates (kHz): 48 44.1 32
      Supported sample sizes (bits): 24 20 16
    AC-3:
      Max channels: 6
      Supported sample rates (kHz): 48 44.1 32
      Maximum bit rate: 640 kb/s
    Enhanced AC-3 (DD+):
      Max channels: 6
      Supported sample rates (kHz): 48 44.1 32

The old implementation would have constraints that allowed up to 6ch output at
32/44.1/48kHz while the correct setup would be to only allow max 2ch output
(both AC3 and EAC3 bitstreams are transmitted in 2ch mode).

So you could successfully output eg 6ch audio (which the sink likely wouldn't accept
and/or only output the first 2 channels) before but now this will get rejected.

so long,

Hias
