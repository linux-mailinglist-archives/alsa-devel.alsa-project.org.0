Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB066539D3
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Dec 2022 00:31:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E9EE16F8;
	Thu, 22 Dec 2022 00:30:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E9EE16F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671665499;
	bh=Hbc04cspKKUlq2xtt1rWNQAlNz5kGk6IPOX/yNft/AQ=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=cwJ5ln7InavvsA/Sf/7Pd67pLkEEs+AObiRWCzdnIsRQX/4SYI2ZGliOCwmN1Rg/P
	 ky9Nu6Z5NDI78LAe+vy+qRw9U6+ZWerEZMhQ0Y9vtBS7YD657zH5aELaJvhqG0eBH6
	 re1ifcKEhxwBJTBZU+pVfCUxxrCS+ypN4z9kezRw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FDC2F804AD;
	Thu, 22 Dec 2022 00:30:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 340D1F8047B; Thu, 22 Dec 2022 00:30:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B032AF80022
 for <alsa-devel@alsa-project.org>; Thu, 22 Dec 2022 00:30:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B032AF80022
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=V4dAPKt/
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-3bf4ade3364so6558947b3.3
 for <alsa-devel@alsa-project.org>; Wed, 21 Dec 2022 15:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Hbc04cspKKUlq2xtt1rWNQAlNz5kGk6IPOX/yNft/AQ=;
 b=V4dAPKt/20f1/6R3bTH5oYl+4FuzQgvbjYDe0cXrjWnsYdsEPJyXJa6W1YM0OMXDA4
 NrAGlCgqPwDN9qVSDM4vphAcpbnVOdY8ipYvuPTRuwGzYuHgzzYBX8675DMYRapmwxqr
 f43LLTzoibaRKtUVkXCnvblD3j+IO0Km4GfBgtxHqQyYLIB5zPgHi+9B7nd/95doL3bJ
 CcrOr7sJkrrjSKD/uGJ0KOwhmq1tyGFvnxLxbd0t0xDg2BoQHOL+jXZkOd3SopUANXqF
 vJI7HbLQUhrrlh8XAAaR7hKes8ueemmMmzzsqslTQ0YdTU6o+ZwK/0Zaeo8iGpl7QYDI
 j/VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Hbc04cspKKUlq2xtt1rWNQAlNz5kGk6IPOX/yNft/AQ=;
 b=YKpkDluZBg94YDcQAYYKaXPFe1oZXQpISXNJTVBbzKQyzTSkuOUGHgqq5KST4crxRb
 nMUyEEdQg4vNoDfKC26q0QG5FftEUUSK0I911STM8q1mVOyLtwzM69ZpO2LZLjGkSrhO
 L1knb4omKsMeYO86xuahR53eq7BI0LD5RjhZQi15zvrbJWfepHyOGX7lIVyqnO8eRWN4
 //74tWetEOYaLmsCGAAjyi3KhzTebo0T7AT9HJ9Wc+Hqqe8/f/PqnZA2FonlhCzjzL6d
 YKEty8cd/n9lYzuVlr55eBVYS0M54QFxN2Fqv6Z8FO2err4NLL8bDCK1XS6jw8HhuPeV
 h/zg==
X-Gm-Message-State: AFqh2kpSXEit6KO8dnWdtHUGb0dcrqiHzbtXu9BT4tE2tJaYDq7jwRaA
 ApSL6fSDtgklVS/L9IztXUeWtw352oOEEFFE/cqr1w==
X-Google-Smtp-Source: AMrXdXuvXVL02e5WE/59sAq11eayzxXSCUHaxb3H5iKshi4jzDDAn67x0CYU+QFbx7el2rNRbxssKT3vKa5SWTlcLqg=
X-Received: by 2002:a81:1149:0:b0:433:f1c0:3f1c with SMTP id
 70-20020a811149000000b00433f1c03f1cmr385286ywr.438.1671665434961; Wed, 21 Dec
 2022 15:30:34 -0800 (PST)
MIME-Version: 1.0
References: <20221216154938.9426-1-ajye_huang@compal.corp-partner.google.com>
 <b0612bbd-2eba-36cf-9c29-7542cf32adfd@linux.intel.com>
 <CALprXBYy9_ax8-xfh0paB59Pn=TB7yVLwtY8vnT_-y5vWd867w@mail.gmail.com>
 <9aa4bffd-bc7e-0e40-3063-5ce80b5fbe9a@linux.intel.com>
In-Reply-To: <9aa4bffd-bc7e-0e40-3063-5ce80b5fbe9a@linux.intel.com>
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Date: Thu, 22 Dec 2022 07:30:23 +0800
Message-ID: <CALprXBZkhWitJBeenKHxzyQvkf=Q2FDAHKD511oCWC8-SJBK+A@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: Intel: sof_nau8825: add variant with nau8318
 amplifier.
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Libin Yang <libin.yang@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 ye xingchen <ye.xingchen@zte.com.cn>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, "balamurugan . c" <balamurugan.c@intel.com>,
 Mark Brown <broonie@kernel.org>, Muralidhar Reddy <muralidhar.reddy@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, David Lin <CTLIN0@nuvoton.com>,
 alsa-devel@alsa-project.org, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Brent Lu <brent.lu@intel.com>, Yong Zhi <yong.zhi@intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Pierre

On Sat, Dec 17, 2022 at 1:37 AM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:

>
> Ok, thanks for the explanations.
>
> Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Yesterday, I saw Arnd Bergmann sent this patch "ASoC: Intel:
sof-nau8825: fix module alias overflow " for reducing the string to
prevent over length,https://patchwork.kernel.org/project/alsa-devel/patch/20221221132515.2363276-1-arnd@kernel.org/.

so, I need to check with you, should my string need to change the
format style with his, even the my string does not over length , from
.drv_name = "adl_nau8318_nau8825" to .drv_name = "adl_nau8318_8825",
align with his format style?

thanks
