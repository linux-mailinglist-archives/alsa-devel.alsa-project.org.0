Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B513C7D397F
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Oct 2023 16:39:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8787B84D;
	Mon, 23 Oct 2023 16:38:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8787B84D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698071954;
	bh=lE8sc7lMxPUTiCNze+DpXwWn8FTfkpYeh3kEHU1GTO8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gpCZN6wEGm+01K/ywKfjLEtifAuAUV6SYjYcLrNFdFioCAVyf8KUf+fNvm+kzdRho
	 AncB0SvuwbP5uNoJ63DegBXm8V4w32W8IR0NSZxVA9S//KhRBBpT7l+w/5zyH/aHmk
	 gwnonkx8zV0FVpCe50YHCl5olkjx4HlhH6MYZMFg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AAB74F80558; Mon, 23 Oct 2023 16:38:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 17837F8032D;
	Mon, 23 Oct 2023 16:38:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38591F8025F; Fri, 20 Oct 2023 21:35:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AAB9EF8019B
	for <alsa-devel@alsa-project.org>; Fri, 20 Oct 2023 21:35:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAB9EF8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=HNx1OJUF
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-5a82c2eb50cso13281587b3.2
        for <alsa-devel@alsa-project.org>;
 Fri, 20 Oct 2023 12:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1697830532; x=1698435332;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lE8sc7lMxPUTiCNze+DpXwWn8FTfkpYeh3kEHU1GTO8=;
        b=HNx1OJUFY6YOu46gWGoDgLXFQJQE8UH0BklqbZGDSemxo8iocF2JJiuM6/zPYs216n
         4KKlBZFACF0C4uIKNB/EFgfyHNxBc2kwWhrhMM0mMe+v5XjNS6k1WJdHDtQiS8yMBCQE
         PNlL2+tTWII+AhDQWop3HqblwxJCVp2rQ+6f8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697830532; x=1698435332;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lE8sc7lMxPUTiCNze+DpXwWn8FTfkpYeh3kEHU1GTO8=;
        b=hv9XgayHrwZuZ0aimSC9XURWz7g1FydTcpPsQvYUU+EhDevjnaTHHKdlAYATJasvZj
         XH1bdDDX7mO/lrr3XEAMEZMdhlOg/Up9wG3jMWdKX0aFht8FjC9u0Be6UU1JSQlGYmto
         mrNWgpIoulPcfYUDpK0rk1SF/L5O58jb1b971bRvLxpsKFkx2UyXf0rQlO5oDaoLlTXF
         oJXzpbtaNE0rdkDfhCdkeYdcpc39kvJqx2MaLXM+RSEbrKoV0NuhCPt3/lqgVUURzulH
         Tjb7lPRPPkAV9JfimKFOKg16IkUf3RNjR6vmO4383pRM19Kg5uHqU0m/My1oM0PmanPh
         J88A==
X-Gm-Message-State: AOJu0YwkQg3RUo7cZfs6jXMNjv1p3Z8l78/Oeu/O7ZyFNUyiVbIjH2oG
	+7Onhs2khKAhZ8QeeDymkW3N5CiJ2vNEYXTESavj7A==
X-Google-Smtp-Source: 
 AGHT+IFFR6JbKQHRmgDymH+yYcdqV4a00GQtxOE+bW1LRTtg43H8mRXY8EcQ+QbZtDleHGFGavx90BozcrWErCODPls=
X-Received: by 2002:a81:65c2:0:b0:583:3c54:6d89 with SMTP id
 z185-20020a8165c2000000b005833c546d89mr2795753ywb.44.1697830532450; Fri, 20
 Oct 2023 12:35:32 -0700 (PDT)
MIME-Version: 1.0
References: <20231018235944.1860717-1-markhas@chromium.org>
 <7b08520e-8f36-45a1-9b7a-316a33c8e8c4@linux.intel.com>
 <CANg-bXDvZ00ZHEgbUf1NwDrOKfDF4vpBOxZ4hGEp-ohs6-pZpw@mail.gmail.com>
 <5bc82aca-04f2-463b-ba52-34bcae6724d5@linux.intel.com>
 <CANg-bXCaUOxSTfR1oXKrdnDozA9Hn-NL7mqg+zvLASLQyouChA@mail.gmail.com>
 <80f8a742-4a60-4c75-9093-dcd63de70b66@linux.intel.com>
In-Reply-To: <80f8a742-4a60-4c75-9093-dcd63de70b66@linux.intel.com>
From: Mark Hasemeyer <markhas@chromium.org>
Date: Fri, 20 Oct 2023 13:35:21 -0600
Message-ID: 
 <CANg-bXBbQVEJ-SwLoHfnu30pCkFcJb9Dywxf603cwUOD6N19Bw@mail.gmail.com>
Subject: Re: [PATCH v1] ALSA: hda: intel-dsp-config: Fix JSL Chromebook quirk
 detection
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: =?UTF-8?B?QW1hZGV1c3ogU8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>,
	LKML <linux-kernel@vger.kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>, stable@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
 Brady Norander <bradynorander@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, Curtis Malainey <cujomalainey@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-MailFrom: markhas@chromium.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: XMRNXQIX2HUXJOX5XAPUMXPQWRGTVS7M
X-Message-ID-Hash: XMRNXQIX2HUXJOX5XAPUMXPQWRGTVS7M
X-Mailman-Approved-At: Mon, 23 Oct 2023 14:38:19 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XMRNXQIX2HUXJOX5XAPUMXPQWRGTVS7M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

> There's been multiple rounds of discussions with Curtis, we introduced
> DMI_OEM_STRING but it's still not good enough, and now the previous
> conventions are not being followed on what is a relatively old platform
> already...

Thanks for pointing that out. ChromeOS uses the fw_path module
parameter for JSL boards so I missed this. The DMI_BIOS_VERSION should
be consistent across all Chromebooks assuming 3rd party firmware
wasn't installed. I'll throw up another patch addressing this.
