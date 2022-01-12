Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1041848C8BD
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jan 2022 17:47:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7A281B4A;
	Wed, 12 Jan 2022 17:46:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7A281B4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642006056;
	bh=4/J6LvXFsHwF/3USSXTPW515EQd1EEN7HKbBv/O/5IM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pVoFRI+Y2hCAj7bio3gplupoDgK8ufhYlFGpFl3LXMAyW2yibHHf5OqvSydho0dYI
	 7zyD0oxePawUhrLwpKSR9KxVRHxl4BXKnKMOwbOFUUFC+X2LzxwOrWK+lbPQF+PyfY
	 z+N/AAhxiTzWDRq8+bPnH4hEIQXyPuSwnA/0Zkf0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07FFFF80516;
	Wed, 12 Jan 2022 17:45:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67793F8026A; Wed, 12 Jan 2022 11:07:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2A6FF80236
 for <alsa-devel@alsa-project.org>; Wed, 12 Jan 2022 11:07:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2A6FF80236
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="g51pKtYy"
Received: by mail-lf1-x136.google.com with SMTP id e3so3488039lfc.9
 for <alsa-devel@alsa-project.org>; Wed, 12 Jan 2022 02:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:user-agent:references
 :mime-version:content-disposition:in-reply-to;
 bh=GerQkM1D1/dtyEjqZ2IhcUhmklKFjm+Rp3i7RHnixt4=;
 b=g51pKtYy3n2X3cjA0vkZhWSvlnGSr9kigKTQ7qDEnhQho7zpS/e8HgntFCIy1VpWs5
 pphSrcDFAZnc/+UE9nFNJOQnDKVl+QEq/u9+7V5knHCzY1/elsE3sF789w8px7d5vPGj
 ef7BWooEl5EftaecqIhFZndwc6OSyIwh6plZcoQLBqmLDiyMTy8zJD18+fUX8F83POez
 z45rvIjiiEkss8wAI+EBNbnDLN53jZq4WmX1oyqawvVdL9vt0kzza+i247MTNyz2yep0
 H15V/GeT+ko4K2V+beHSWAZZ+F3s86XpPAgLk9F3TgXt5fEDIOcSquKzK0GPocRCJMnO
 bI5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:user-agent
 :references:mime-version:content-disposition:in-reply-to;
 bh=GerQkM1D1/dtyEjqZ2IhcUhmklKFjm+Rp3i7RHnixt4=;
 b=DmWpDLQW2wXIQjN4HcaQskIAbBsl/l3gcO7YHixstFj7Tzfj5WGqTMdRVGh0hmPNLB
 KVnG1520+LE/epY3ejSo64DTC3hwhynanJbRV7VytTmGHzU+hIk4I3x9d8sHlRGUUyO5
 LzZwU3VRwRxILN9JuqhjJ7tMKsGmHHOcKsFSgKbiGTa6XxdlSgmvRuD1BKYT+5cx85Y8
 9Vz9AF5bKM2RvYIbzH7f8gUNVdvnl5Cra6zj6IZD7cOl2KA63kHSdKz8fAjnt2Zu9W9F
 Gzk0nsA9O/H8rtTkBWBBtttEB7WBlZbI1Yc6OXNQkNyTZPTmdP2HfcPkUyVn9h2Poeic
 1gSg==
X-Gm-Message-State: AOAM531BXdJ2jYnznunV/oJvq1GzBk6ow0lMT6DJg5M2a8kTYTx9/bUP
 4U545245dPvGazXh6CqGRlQ=
X-Google-Smtp-Source: ABdhPJxVOClSrkFNSsDrkgnpv3GX6Jm5wp4/8uESYtlYdOwFu5Gi1NwJ6uTENYE6lOF4O+As6PzVdw==
X-Received: by 2002:a05:6512:114e:: with SMTP id
 m14mr6662011lfg.414.1641982029764; 
 Wed, 12 Jan 2022 02:07:09 -0800 (PST)
Received: from localhost.localdomain (ntd06459.static.corbina.ru.
 [95.31.14.149])
 by smtp.gmail.com with ESMTPSA id y9sm1597964lfl.235.2022.01.12.02.07.08
 (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
 Wed, 12 Jan 2022 02:07:09 -0800 (PST)
Date: Wed, 12 Jan 2022 13:12:49 +0300
From: Alexander Sergeyev <sergeev917@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 1/4] ALSA: hda/realtek: fix mute/micmute LEDs for HP 855 G8
Message-ID: <20220112101249.ya73jvpmqmeh4ggg@localhost.localdomain>
User-Agent: mtt
References: <20210519170357.58410-1-jeremy.szu@canonical.com>
 <20220111195229.a77wrpjclqwrx4bx@localhost.localdomain>
 <s5ho84h9tit.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <s5ho84h9tit.wl-tiwai@suse.de>
X-Mailman-Approved-At: Wed, 12 Jan 2022 17:45:04 +0100
Cc: "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Kailang Yang <kailang@realtek.com>, Jeremy Szu <jeremy.szu@canonical.com>,
 Huacai Chen <chenhuacai@kernel.org>, open list <linux-kernel@vger.kernel.org>,
 tiwai@suse.com, Hui Wang <hui.wang@canonical.com>,
 PeiSen Hou <pshou@realtek.com>, Jian-Hong Pan <jhp@endlessos.org>
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

On Wed, Jan 12, 2022 at 10:45:46AM +0100, Takashi Iwai wrote:
>The problem is about the built-in drivers, or do you see the very same 
>problem even with modules?

The problem is definitely there for the built-in drivers which I've tested 
quite a lot. It's the primary usecase for me, as I tend to build minimal 
device-specific and self-contained kernels in Gentoo.

For builds with modules things are not very consistent. Live Ubuntu with an 
older (and probably vendor-patched) kernel works just fine, but when I pull 
Ubuntu kernel sources and build it with the mostly same config (including 
modules) it boots with no sound in Gentoo. Mostly same -- because I need nvme 
drivers to be built-in as I don't use initrd.

>AFAIK, quite a few AMD platforms tend to have some issues with various devices 
>showing initialization problems at the early boot. Just reloading / rebinding 
>the device later often helps.

Is it possible to do with the built-in drivers?
