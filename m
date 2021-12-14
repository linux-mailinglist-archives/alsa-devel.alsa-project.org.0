Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EF8474933
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Dec 2021 18:23:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61B032009;
	Tue, 14 Dec 2021 18:22:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61B032009
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639502583;
	bh=DQXw1oNtiheyBRhKKdtObSfOECO40/pDH6eiY19UKOk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mFuEqveQHuVjUSaTYPwqpuapOD7EtpT9u76oBHwJRYzZjjcEekIbwMvQl62y4KbCy
	 qd2jxkv/wdhu/Us5gadoUYm86KwPFFPRMAzny3V6JdtDMnXpMzA6RtIbPCoRf82fzw
	 qT17cYBfCwGcHT9OJQVpR57p0xOwHeUc9VIgHIOI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7D12F80249;
	Tue, 14 Dec 2021 18:21:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9EAB8F80246; Tue, 14 Dec 2021 18:21:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02276F800FE
 for <alsa-devel@alsa-project.org>; Tue, 14 Dec 2021 18:21:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02276F800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="jZD4QsWD"
Received: by mail-wm1-x32d.google.com with SMTP id
 az34-20020a05600c602200b0033bf8662572so14257632wmb.0
 for <alsa-devel@alsa-project.org>; Tue, 14 Dec 2021 09:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Xs9607BDx2T01u5LqyPaCAPyvesOcrbFjspbhqFitRc=;
 b=jZD4QsWD9EHLJLspQN8NnHR3EIUz/Vl4QL1JHjeRVvh/5MoYOixQoVvVBbfOl+JWbs
 wWUlX7dhyGC6F68DWdY5nsH3O/DjCR/M+1z8L5NpGJiA8gWffbveRPGQwS3aOK7ZMfIc
 TsmJM6aQNXvCqwFWsHQeuAoRubFg0ll5RbZvT/Kjaq12J8eGzxys1IA9ya1LVUavt2x2
 zxB9axRsPLshtyqAT0IpO13LQWYz5yJXWW5h9VehaUQyFRzoKAmDEKj4r/Bk2mX3EWQD
 qubt5CRWH2jvfFJaxQWlj3KUL0A0UK/52kVbhd/0jkCYakH+mVwgEzWNFPEMNoppOo2D
 rz7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xs9607BDx2T01u5LqyPaCAPyvesOcrbFjspbhqFitRc=;
 b=r+EC7FZiEMMLfFkrlcS7aZnEv+4MMfKG3uFd+E7S4FKa66pgSaVweWf3/5Guz6Xk3g
 p6Hvm7C2G/2gn0LsvSrgNSKJxdEdnnGzpQ+6NRQ0r9x7bstIYDJCEeiZJT2+uZXrGv32
 YxeK/ZwrKgLjfgjBFc+U+mdlNlCxnnL5JGmQFI1k6DmQ4Cu5z/K4yaczGDmpw8pB0dEi
 Vqg6buhMTbZT1kf+DXCK+hjoeFyFt380Un8DqKzakr2lnah7uR7zG+Xr5pp1BP5SMCF8
 sGzIkufJNSUZAku3CjD7yIJsvje9ETzlkNvEj29aVr7zzKbUkYJWxvIcLebpm+mX52Fd
 0JNw==
X-Gm-Message-State: AOAM532ATwuSyHw2bBOe49nOe76x46rC/izzBRBKv7ZkpZ1zmaIA55O6
 4U4/toLLEAacJK54zeaTpng9HEV+1xqx7e09/38=
X-Google-Smtp-Source: ABdhPJz2j774LLWhSct0g9YlaoUSrM0H3bM6tJPmvkDzP75CZG4hVTgym+YAuXScBjS4vDsslvt6j2Y7q1Y1Sr3VSio=
X-Received: by 2002:a05:600c:500a:: with SMTP id
 n10mr295300wmr.136.1639502499047; 
 Tue, 14 Dec 2021 09:21:39 -0800 (PST)
MIME-Version: 1.0
References: <20211214030215.3181149-1-broonie@kernel.org>
 <8ff9d4b2-1905-2efa-cb86-e8f6cef06ef2@infradead.org>
In-Reply-To: <8ff9d4b2-1905-2efa-cb86-e8f6cef06ef2@infradead.org>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 14 Dec 2021 19:21:25 +0200
Message-ID: <CAEnQRZB9E4uBDuUidiJ+QJnQhGZp43jig4q93Pkw3pSr=K48YQ@mail.gmail.com>
Subject: Re: linux-next: Tree for Dec 13 (SND_AMD_ACP_CONFIG)
To: Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
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

Hi Randy,

This should be fixed by https://github.com/thesofproject/linux/pull/3284

Let me quickly send this to alsa-devel.


On Tue, Dec 14, 2021 at 12:08 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
>
>
> On 12/13/21 19:02, broonie@kernel.org wrote:
> > Hi all,
> >
> > Non-merge commits (relative to Linus' tree): 5960
> >  6555 files changed, 277265 insertions(+), 120864 deletions(-)
> >
> > ----------------------------------------------------------------------------
> >
>
> on i386 or x86_64:
>
> when # CONFIG_ACPI is not set,
> so SND_SOC_ACPI is not set:
>
> WARNING: unmet direct dependencies detected for SND_AMD_ACP_CONFIG
>   Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_ACPI [=n]
>   Selected by [y]:
>   - SND_SOC_AMD_ACP_COMMON [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && X86 [=y] && PCI [=y]
>
>
> Full randconfig file is attached
>
> --
> ~Randy
