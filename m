Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B51A48F7CC
	for <lists+alsa-devel@lfdr.de>; Sat, 15 Jan 2022 17:27:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 319C21949;
	Sat, 15 Jan 2022 17:26:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 319C21949
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642264059;
	bh=+rD7YR6a0DKbvGj8SnS8No787dr0DSJ/SsHNNRCuc7A=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZxaaBiL2WIuSlRKBNQEiGLUzQvC5CKvpef1811AZtznoKQucPme/9tseLqtBuZKvF
	 bepxhizo/N/lW1bzrpxYCT2MD2wGHFO4DBtV3eCsaK7DrYI1ZQrzZXF60omSgWevkX
	 zH8P5z43fZsvdoaeEPsPPGNekZHUHjVvwb/vqCQg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D535F80167;
	Sat, 15 Jan 2022 17:26:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57120F801D8; Sat, 15 Jan 2022 17:26:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE72AF800CE
 for <alsa-devel@alsa-project.org>; Sat, 15 Jan 2022 17:26:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE72AF800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="DFLIY5qv"
Received: by mail-lf1-x12a.google.com with SMTP id o12so24191162lfu.12
 for <alsa-devel@alsa-project.org>; Sat, 15 Jan 2022 08:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:user-agent:references
 :mime-version:content-disposition:in-reply-to;
 bh=4xnnkY/0N7vitggBHBYyS2U/q+4IqBCzhx6kWTZjGxw=;
 b=DFLIY5qvAceQd6eNdBXxvpVJFkF/1amxaCDjTsCXWvZv3f+yz4gz6EJXJRrlnLdcs6
 1yFfCIwuz8a4tluCjQrvtSChlWgk2L+rBBmiIHGUhaDZUqhWl1Kwf+29b2ssptS4eRvn
 L55UyaRl0eIFHWMH14JXMCJi9Nb3Z1t/DF77RdwurVr9CFIrM9Sod4bPaltxSTLNFlQD
 UZXz0SVdi8UUW8H1p9NKo6e70BcmwTahPZo7CQVWnKQmXpN8tOxRTInZEfjXPbdN8kpj
 PyBZmqb5DNywbSXYcvK+ZFLlymQ4EceTWle5V0ELPg7SAZjoBTUITJ17qxhxccSb0Jgd
 fv1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:user-agent
 :references:mime-version:content-disposition:in-reply-to;
 bh=4xnnkY/0N7vitggBHBYyS2U/q+4IqBCzhx6kWTZjGxw=;
 b=dOxivqFej6yk/25GjqjEAqPUB+0JpvbIIjBlDop+VZWmHTVBRJYmRR++SEmYXYOc3g
 B5bQSdLoxCKCqqYKdDFGpQYou6XMXVgksN8cwgi/Jf2mmXi0mzetb/lrrW7YW9/zGSXq
 v4D7rtZq/nkbZwuGP1StGbW7NwMQyb0OgoT0neiDS5RPRZtxDiAH1h2slShfrF3Zkzlr
 nyCEVKLx/osHCvXN+vcuextp33H9N/sCTm2KNaqw54bLv2M1kvCX1AAeqNkg+Ro2k6Tp
 +GgVXn6bCwEiy17pO+kdEXwb/1cL7q/p/Pue6MT6WFsuUu+2Rzxjkgxb6XMc0NVg8nG7
 thag==
X-Gm-Message-State: AOAM532+Y8iSr5VK7oKAW8F+/Sp+g7kWabAjYtYcz+b/KdUNE0YY59xS
 r6JdC/391GHp9FAumg4Ag4c=
X-Google-Smtp-Source: ABdhPJyE6L8fzGlQGy/ier4fQfMSK2AuzP91lK0y4ZIb+Fm1j7k/Ep/M8wewAgqI+E5fn5Bd3pdLIw==
X-Received: by 2002:a2e:3508:: with SMTP id z8mr9974618ljz.37.1642263986739;
 Sat, 15 Jan 2022 08:26:26 -0800 (PST)
Received: from localhost.localdomain (ntd06459.static.corbina.ru.
 [95.31.14.149])
 by smtp.gmail.com with ESMTPSA id x6sm902368lfn.144.2022.01.15.08.26.26
 (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
 Sat, 15 Jan 2022 08:26:26 -0800 (PST)
Date: Sat, 15 Jan 2022 19:32:08 +0300
From: Alexander Sergeyev <sergeev917@gmail.com>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: Re: [PATCH v2 1/1] ALSA: hda/realtek: fix speakers and micmute on HP
 855 G8
Message-ID: <20220115163208.xmvum6ehqcadonj7@localhost.localdomain>
User-Agent: mtt
References: <20220114164904.lgj7yimbei6fmloe@localhost.localdomain>
 <20220114165050.ouw2nknuspclynro@localhost.localdomain>
 <CAAd53p6KXD2mEHgkU_TpTrsU-vQ9Vxdip+6sPfDaVoSOkmaz-g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAd53p6KXD2mEHgkU_TpTrsU-vQ9Vxdip+6sPfDaVoSOkmaz-g@mail.gmail.com>
Cc: alsa-devel@alsa-project.org, Kailang Yang <kailang@realtek.com>,
 Jeremy Szu <jeremy.szu@canonical.com>, linux-kernel@vger.kernel.org,
 Elia Devito <eliadevito@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Werner Sembach <wse@tuxedocomputers.com>, Hui Wang <hui.wang@canonical.com>,
 Sami Loone <sami@loone.fi>, Cameron Berkenpas <cam@neo-zeon.de>
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

On Sat, Jan 15, 2022 at 11:47:40PM +0800, Kai-Heng Feng wrote:
> > Note that the device can boot up with working speakers and micmute LED
> > without this patch, but the success rate would be quite low (order of
> > 16 working boots across 709 boots) at least for the built-in drivers
> > scenario. This also means that there are some timing issues during early
> > boot and this patch is a workaround.
>
> Does this issue happen to warm boot (reboot) or cold boot?

The issue is definitely not limited to warm boots only. I can confirm cold 
boots with no sound and also warm boots with functioning sound. With this in 
mind, the provided numbers (16 good boots across 709 boots) are largely coming 
from reboots since the testing was scripted and driven by SSH.

> If the issue only happen to warm boot, please try reverting commit
> 9d3fcb28f9b9 "Revert "PM: ACPI: reboot: Use S5 for reboot"".
> Many HP systems requires it to have a functional reboot.

Interesting. I haven't noticed anything breaking with reboots on this 
particular system (at least so far).
