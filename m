Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 561E62F63D4
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jan 2021 16:11:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E64D616A8;
	Thu, 14 Jan 2021 16:10:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E64D616A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610637086;
	bh=8Ytg6rr+vhZOUVZ7YEBZ/tNIoxH6BmhiIZ4QW6uSU6k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cKOaquIy1ajARH+ECEG6/t+sgWsxT+hAoadHL8bQG9px5QfhdqpQmqm7BZsy6tn+F
	 F6OvRRSrlY0c7bOq4v5+MmiUG19u50jukY0XKnGCufxA/dQB/POKQxrxRLwFejNdKD
	 7y/4id7BOaJA5CD6Y7V5TggtmrijcxmDInyxI8FE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30481F80118;
	Thu, 14 Jan 2021 16:09:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A2E80F8025E; Thu, 14 Jan 2021 16:09:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30C6DF80113;
 Thu, 14 Jan 2021 16:09:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30C6DF80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mPElLYb5"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2FB4323A7F;
 Thu, 14 Jan 2021 15:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610636979;
 bh=8Ytg6rr+vhZOUVZ7YEBZ/tNIoxH6BmhiIZ4QW6uSU6k=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=mPElLYb5hepykdQ/Xo1H+mD6Knr9MAWGDeHJsjGCdHy0nLBB1bucA/BUl1lbldhGM
 yb0C1DFlOnTna9RMU9tAD+Lw82ormFRQoTrckV5nbwuZLeDAQCRAguydFBjQ0wUtWs
 BRklh/cg37QQYHMW06gJO1KBYdb+gvl80iw9OnxazPEunxML1/S5RP0J7tlCM6nH1u
 JM4ocIbKfQBFa1XSZ9tEDjIZL0WQxlsx5VJ/j0pBB72FPpdHo8NXT/cConBnKV7B9Y
 dxLd3PAUhO3935UWV8Uv3WbZZbmNquGR4TojaJ95Tmxgowt+Sgfej/CCE8CpjC7Lym
 x6tNjzdT9NSsA==
Received: by mail-oo1-f51.google.com with SMTP id k9so1432584oop.6;
 Thu, 14 Jan 2021 07:09:39 -0800 (PST)
X-Gm-Message-State: AOAM532XyFZWdYNlVi99Q/NFGeIz2eyR50df3zlolSL87wlHtOxqQcO2
 9ns/9b51zEm1UKl7K0zDBfcH+GiKzOEIxuWRmW0=
X-Google-Smtp-Source: ABdhPJxy7/gXoT00gpRoe9YxdlRpPkuHIlxwpQreEYKCcKDdViftSZjGKzQ29riPpA+gtnR22JvNi9rxLl7X13N8tbE=
X-Received: by 2002:a4a:9c01:: with SMTP id y1mr4951976ooj.15.1610636978562;
 Thu, 14 Jan 2021 07:09:38 -0800 (PST)
MIME-Version: 1.0
References: <20210112203250.2576775-1-arnd@kernel.org>
In-Reply-To: <20210112203250.2576775-1-arnd@kernel.org>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 14 Jan 2021 16:09:22 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0+YmZTzYYk0D5HpBEB7Kp=ryx1U4KRKCyz4XYM3v9rAQ@mail.gmail.com>
Message-ID: <CAK8P3a0+YmZTzYYk0D5HpBEB7Kp=ryx1U4KRKCyz4XYM3v9rAQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] [v2] ALSA: hda: fix SND_INTEL_DSP_CONFIG dependency
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rander Wang <rander.wang@linux.intel.com>,
 sound-open-firmware@alsa-project.org
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, Jan 12, 2021 at 9:32 PM Arnd Bergmann <arnd@kernel.org> wrote:
>

> ---
> v2: fix various build issues in the first version, now passes
>     all randconfig builds I tried

Please disregard this version, while I have a tree that passes
the randconfig builds now, this was not the patch from it that
I wanted to send...

       Arnd
