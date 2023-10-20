Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA71D7D3931
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Oct 2023 16:20:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73AD6DEF;
	Mon, 23 Oct 2023 16:19:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73AD6DEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698070799;
	bh=Tu6pyTUtGymaS2j2r9iQnDpyhQcaCvR7FSo8pcjNejA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lLV3uHek3Pyyg28MilCbfUlKq7M6Pf1GAeE/bg9+0phInRp36S4qA8lBRqZ2U/XL3
	 Yiuo+BF6MNCnGo1oJNsaURPqXCUZlJuZmwiqwBZNi3wSDzwOZ/wvFWVtwjSpojp5+L
	 x+DAmT/mMgwU1ompZ9TRtJJwd8dAACeTUBQm/8cQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB1E9F805B1; Mon, 23 Oct 2023 16:17:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DDF1F805A9;
	Mon, 23 Oct 2023 16:17:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0EEABF8025F; Fri, 20 Oct 2023 17:37:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [IPv6:2607:f8b0:4864:20::112b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 12DC2F8019B
	for <alsa-devel@alsa-project.org>; Fri, 20 Oct 2023 17:36:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12DC2F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=cAFjKA7w
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-5a86b6391e9so10680277b3.0
        for <alsa-devel@alsa-project.org>;
 Fri, 20 Oct 2023 08:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1697816213; x=1698421013;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Tu6pyTUtGymaS2j2r9iQnDpyhQcaCvR7FSo8pcjNejA=;
        b=cAFjKA7w2OuVwbJeAFvOkIoQdzdWyhUmM83DuI6xhuh4dviqaruzhLS3bmyiPLCNqF
         AQi/IrTF1V6W/bX4rXzghUb7MrgqgXa2+Ofc0ZrpJJYP3E6+ruAUv9MNKgLSz2MPBknN
         jzbTlFEyxNim8fXs3DP4y4KkR0kySPg2nhDCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697816213; x=1698421013;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tu6pyTUtGymaS2j2r9iQnDpyhQcaCvR7FSo8pcjNejA=;
        b=R7bXT8FJ1SiyhmT7yEcO0ubm9ZZuhv55PW++CDPLhuEv42ipbOE7YiIk0fOavDdReN
         O00LcHTAdKhXU815/RmtDQdw66/PA8m1ZdRqtFVC3XRT6Yv5l8/HEb+TqU8COaDfvxDy
         Rkxs2/bGqAPpNVidItm2H5tyrkzKfvsbgfKmdn+36lsAURDe0mS1XiH7nGsbKfuYuYHJ
         SOiVmycWWhWz0AgnILw7oHnipO+ZtJjOqHxCCxw66SiCBqyzJ4cDrJGhtpST2cBdYNRQ
         sToTN6xUfvfjXeMCkWaUFG5YJADs4r4YQYpwqRfI1TYfjTYHQ4KCDDnCP5SVSTvWUsAZ
         gS9g==
X-Gm-Message-State: AOJu0Yy+PsMfLL1gRF6geERfbeEIgmI2tjy9Xq0hwTcUNfI5A/lRuD6E
	AxIAb9Xi7fPHXwNPud9JpsnkiInfvkoOQQ+eIogszQ==
X-Google-Smtp-Source: 
 AGHT+IFqUlPG6dlUmNyqyGkuC10+FI40s+GmD/Bn0XNtOkYk8p12lirTlbLaNaqGbzu5h56aM3HWjjPYZb8mY6Vee1A=
X-Received: by 2002:a81:7354:0:b0:5a8:1973:190a with SMTP id
 o81-20020a817354000000b005a81973190amr2633859ywc.8.1697816212688; Fri, 20 Oct
 2023 08:36:52 -0700 (PDT)
MIME-Version: 1.0
References: <20231018235944.1860717-1-markhas@chromium.org>
 <7b08520e-8f36-45a1-9b7a-316a33c8e8c4@linux.intel.com>
 <CANg-bXDvZ00ZHEgbUf1NwDrOKfDF4vpBOxZ4hGEp-ohs6-pZpw@mail.gmail.com>
 <5bc82aca-04f2-463b-ba52-34bcae6724d5@linux.intel.com>
In-Reply-To: <5bc82aca-04f2-463b-ba52-34bcae6724d5@linux.intel.com>
From: Mark Hasemeyer <markhas@chromium.org>
Date: Fri, 20 Oct 2023 09:36:40 -0600
Message-ID: 
 <CANg-bXCaUOxSTfR1oXKrdnDozA9Hn-NL7mqg+zvLASLQyouChA@mail.gmail.com>
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
	alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
X-MailFrom: markhas@chromium.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: PZV5CMS2EM3W5WT6JVU3SUODSPXQOQET
X-Message-ID-Hash: PZV5CMS2EM3W5WT6JVU3SUODSPXQOQET
X-Mailman-Approved-At: Mon, 23 Oct 2023 14:17:44 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PZV5CMS2EM3W5WT6JVU3SUODSPXQOQET/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

> FWIW we use this other quirk:
> DMI_MATCH(DMI_PRODUCT_FAMILY, "Google"),

Unfortunately DMI_PRODUCT_FAMILY is empty on these particular devices.
The coreboot version field is the only entry that has "Google" in it.

> How many engineers does it take to identify a Chromebook, eh?

Ha! There has been some discussion about this: to come up with a
canonical way for Chromebook identification throughout the kernel. But
nothing has been settled on AFAIK.
