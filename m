Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D960F705AF5
	for <lists+alsa-devel@lfdr.de>; Wed, 17 May 2023 01:04:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF6E611C;
	Wed, 17 May 2023 01:03:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF6E611C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684278250;
	bh=SPb1Qiyye5bTrfittZe8ije6CMaptPeS7qDp6IrJHkI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Kh/xPxY3kuRep+52j0UOm69Mzq+PvoOf/rIi99QXQR+aS+7kOOJeUM2tOgYW9Gs+g
	 BWuqTTEdDsgJZS8rBiZumWtuKWId2lsm7VxTjtKj2Lz+68Zc/ItkOyABC55OKoDE2S
	 iKYVs+qvtsJlyDaV7OVnjt00eN0u8AhG2kUqU6dw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C628F8053D; Wed, 17 May 2023 01:03:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BBE66F8025A;
	Wed, 17 May 2023 01:03:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D321F8024E; Wed, 17 May 2023 01:03:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 39814F8024E
	for <alsa-devel@alsa-project.org>; Wed, 17 May 2023 01:03:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39814F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=gE7NeLlO
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1ae3f6e5d70so2132985ad.1
        for <alsa-devel@alsa-project.org>;
 Tue, 16 May 2023 16:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684278185; x=1686870185;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dXAXcPnEMhyYXSrts+BDCr1Z/hTfqLKKX238n2NzWBU=;
        b=gE7NeLlO01ovd5SVd2T5kargJMuVm0zgZx2TXdH+DmhMqoG71nLkRe/n/8Z5U1vgKs
         DOCe6yXDkDVVl6oiGGlYOvpB6jEZJWgU6igSk18ouSXh8sIGzFfFlFJhTP2l+UZjvJ6b
         1o0PCXrRvw7/Yo1M9LxJGNbpeHKWJ4IE7g0Z4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684278185; x=1686870185;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dXAXcPnEMhyYXSrts+BDCr1Z/hTfqLKKX238n2NzWBU=;
        b=OXsd4//0xtSCHwa+7ZepXAKgCj8regH+wXcq3A2EqK2xwu/onm6usuFvezTbyX+i8y
         vKahnrIkz4p/tisojvNxKPIoEis+9d0O1ZLxjcRqtKnKeUN/lENPfmMtjn0/qzxlXObk
         wL34quQgEFwAlU/EBqL9BCBETGcT250Anw//burD9vmlj1IyLdGtajNxdcXL30RhF6AO
         pu5d5ThcO82uu/2hEtWn08JGB3YdMNU3rXWCfo8PQo5di52R0c2rkJcpa81qODOoHRE8
         5FGqu4LQmxmGv9XQjW/Xja/QOQt2Cpj9grX2GqaL9L3CM7AXp/VAqs8hqN3AxGNAQfk1
         ZPQw==
X-Gm-Message-State: AC+VfDxvQ6vOuE6PK676l1Ribc5TDxs9zZmgZNjjLWgfdCQLxaqyoOZQ
	ar4dcEYoSIp80msSgyyFOqzUzTvH9l79iOnhkPc=
X-Google-Smtp-Source: 
 ACHHUZ4oOf2bwISyp/5AD8Hr0xONh/+rBbWjC7YRDrXEPyCxoARl8jz9aGjg27JBh+f0JTkSETBq0w==
X-Received: by 2002:a17:903:1c2:b0:1ac:94b3:3aaa with SMTP id
 e2-20020a17090301c200b001ac94b33aaamr35032955plh.6.1684278185234;
        Tue, 16 May 2023 16:03:05 -0700 (PDT)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com.
 [209.85.214.181])
        by smtp.gmail.com with ESMTPSA id
 bi7-20020a170902bf0700b001a9b29b6759sm16030118plb.183.2023.05.16.16.03.04
        for <alsa-devel@alsa-project.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 May 2023 16:03:04 -0700 (PDT)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-1aaf702c3ccso12315ad.1
        for <alsa-devel@alsa-project.org>;
 Tue, 16 May 2023 16:03:04 -0700 (PDT)
X-Received: by 2002:a17:902:f0cb:b0:1ae:4008:5404 with SMTP id
 v11-20020a170902f0cb00b001ae40085404mr136910pla.0.1684278183867; Tue, 16 May
 2023 16:03:03 -0700 (PDT)
MIME-Version: 1.0
References: 
 <20230516164629.1.Ibf79e94b3442eecc0054d2b478779cc512d967fc@changeid>
In-Reply-To: 
 <20230516164629.1.Ibf79e94b3442eecc0054d2b478779cc512d967fc@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 16 May 2023 16:02:52 -0700
X-Gmail-Original-Message-ID: 
 <CAD=FV=W76Skw_OFezBRrGf5SZtpMOgtV0S-HVcWmbrmAvFL7vQ@mail.gmail.com>
Message-ID: 
 <CAD=FV=W76Skw_OFezBRrGf5SZtpMOgtV0S-HVcWmbrmAvFL7vQ@mail.gmail.com>
Subject: Re: [PATCH] SoC: rt5682: Disable jack detection interrupt during
 suspend
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Oder Chiou <oder_chiou@realtek.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
	Stephen Boyd <swboyd@chromium.org>, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: JCAX2RGBEJRN54LEX6RZZD2AJIMKWX6H
X-Message-ID-Hash: JCAX2RGBEJRN54LEX6RZZD2AJIMKWX6H
X-MailFrom: dianders@chromium.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JCAX2RGBEJRN54LEX6RZZD2AJIMKWX6H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

On Tue, May 16, 2023 at 9:47=E2=80=AFAM Matthias Kaehlcke <mka@chromium.org=
> wrote:
>
> The rt5682 driver switches its regmap to cache-only when the
> device suspends and back to regular mode on resume. When the
> jack detect interrupt fires rt5682_irq() schedules the jack
> detect work. This can result in invalid reads from the regmap
> in cache-only mode if the work runs before the device has
> resumed:
>
> [   56.245502] rt5682 9-001a: ASoC: error at soc_component_read_no_lock o=
n rt5682.9-001a for register: [0x000000f0] -16
>
> Disable the jack detection interrupt during suspend and
> re-enable it on resume. The driver already schedules the
> jack detection work on resume, so any state change during
> suspend is still handled.
>
> This is essentially the same as commit f7d00a9be147 ("SoC:
> rt5682s: Disable jack detection interrupt during suspend")
> for the rt5682s.
>
> Cc: stable@kernel.org
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>

Reviewed-by: Douglas Anderson <dianders@chromium.org>
