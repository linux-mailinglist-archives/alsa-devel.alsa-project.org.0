Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FCD2A7557
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Nov 2020 03:22:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FD91166F;
	Thu,  5 Nov 2020 03:21:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FD91166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604542949;
	bh=Fu3ENaCB30uVCvZ6mgiGLSxhcCMgev6Ni3UTSwhTfeQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l5Xbzi4TQv4piFen6vBgmgaJYxBNgQywoCiwHwnlrXIjkajXSL07rKf+jUQYXsKVD
	 8QH3fkAb5G1tD5sm+WM51XpWuUAiq0YjfpvkwaVEy1VyXqFT4gGMchrfU/dPIMShTY
	 5TzuSZwuDK8elOb82dJgrCrLqq4iLEKOcOl9gFO0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FDCBF8023E;
	Thu,  5 Nov 2020 03:20:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1A3CF80234; Thu,  5 Nov 2020 03:20:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F2CBF80229
 for <alsa-devel@alsa-project.org>; Thu,  5 Nov 2020 03:20:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F2CBF80229
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="Lv3LadzM"
Received: by mail-io1-xd44.google.com with SMTP id p7so234360ioo.6
 for <alsa-devel@alsa-project.org>; Wed, 04 Nov 2020 18:20:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I/solZ431t0ggIQdrbszncAywIR8InJEHuB8KzVvg5U=;
 b=Lv3LadzM6ypzDnHnsKLmwzknaoDC4VUm946mAn1XlPgK8h1iuIh8II8FxYR71qOCWz
 s4otSQXgi7Kk3Q2T8hBHZ/9FleIqA7xUL16Ixnu6+Ydwa20QTSyNYSRLfH4relPBs3+J
 QdZRnTWNjRjxoJYCorP4bH+GqJRQigbK6jU3IZBmyGVTKi2gNcYphZTXAhVP8sl35ztO
 NFFEmVzmuTMQm1fqJx2f6Er6AiFaIF4mUvDT2Cq3hf4VM03nzCecUiBcYRefwdGKlVGn
 5eXdmsFbfO5qWTUuN+I36KrKfcL0+2ng6iw2TnkhELwT5rm5ezTAaDW7e6qrOzDlT8R7
 5ZUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I/solZ431t0ggIQdrbszncAywIR8InJEHuB8KzVvg5U=;
 b=XVH5nUJY3NYCSDhnRWlZlVdXnoyQQQUW3YEL5BcJQvsSF7+n6UoaRHq2jWhjqTY/Fs
 Zaj92Jj4BGEPb25GdM9wigRWQfBvV29XXszLgSGvbtUCSjrwsssi75Wlz2xSJ2bPNbH5
 pBUWhTtoQbahYqXi0XH7WxSBiV7LHnZ2ImifzjuUDDvu8WFbJo8oYqNwBoO8Aqe3mAdd
 U4QatOaZ0uyRRaNIqFDAA8BrirPE4VsPYjaebGecKGZf0YkvbQGKlM+OS4jvBC+qDx5t
 vEGEOFH77OCeNv/pbhdvKYydOyy4IjCaN4NRi4W2P5aee/a8H6Qf+vPssQDAeq7BdjOu
 Uw/g==
X-Gm-Message-State: AOAM5307C2/TbK520a9ajCJ4Toulwx5qtsD5FlTW+xDZeWCHvmOP8zKp
 cP93ebhxMsBradDkx1OarlhjdiL6xP3KRrljni22KQ==
X-Google-Smtp-Source: ABdhPJwiA2C3+vnjHU42UxPYeHuPugOQSHpCTWPQPcYcceiwEkxo9azkHnnfWljI9iXtaUN74q9zN225g8vU5L8xZm4=
X-Received: by 2002:a02:1c8a:: with SMTP id c132mr390360jac.126.1604542844792; 
 Wed, 04 Nov 2020 18:20:44 -0800 (PST)
MIME-Version: 1.0
References: <20201102023212.594137-1-CTLIN0@nuvoton.com>
 <0adb99c2-d0d9-5052-c163-4d9a341239fc@linux.intel.com>
 <da4d4666-3c91-16d7-926b-b339ae4e39be@nuvoton.com>
 <da9232f9-15c9-01ea-44cf-107ff4dd6c58@linux.intel.com>
In-Reply-To: <da9232f9-15c9-01ea-44cf-107ff4dd6c58@linux.intel.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Thu, 5 Nov 2020 10:20:33 +0800
Message-ID: <CA+Px+wVGosx=pmSkJKtYd9dQZ98D0aYG0KaDq6-ov67UoiV8Jw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: nau8315: add codec driver
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA development <alsa-devel@alsa-project.org>, WTLI@nuvoton.com,
 KCHSU0@nuvoton.com, Liam Girdwood <lgirdwood@gmail.com>, YHCHuang@nuvoton.com,
 Mark Brown <broonie@kernel.org>, CTLIN0 <CTLIN0@nuvoton.com>
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

On Wed, Nov 4, 2020 at 10:51 PM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
> The model from the Max98357a seems to come from 128f825aeab79 ('
> ASoC: max98357a: move control of SD_MODE to DAPM')
>
> It doesn't seem like this additional EN_PIN is useful at the codec level
> but may help with machine integration.

We have a platform that max98357a shares the I2S with another codec.
The software control here is for separating them.  See the commit
message of 128f825aeab79 ("ASoC: max98357a: move control of SD_MODE to
DAPM") for more details.

> I still don't get the POST_PMU/POST_PMD. This was changed in
> 04a646ff5acaa by Tzung-Bi Shih @ Google, wondering if there is an
> explanation?

There was a report for max98357a pop noise on rk3399-gru-kevin due to
commit 128f825aeab79.  Commit 04a646ff5acaa ("ASoC: max98357a: move
control of SD_MODE back to DAI ops") fixes it.  See
https://patchwork.kernel.org/project/alsa-devel/patch/20200721114232.2812254-1-tzungbi@google.com/#23502085.

There is no reason for the asymmetric POST_PMU/POST_PMD here.  You
should find that the sdmode_switch doesn't take effect immediately in
the DAPM event.  I guess I was trying something (e.g. turning on/off
when the stream is opening) but failed.  And I probably forgot to
recover the DAPM events back to symmetric (to avoid confusing people).

If nau8315 doesn't share I2S with other components for now, it could
be better to not introduce the software mute control.
