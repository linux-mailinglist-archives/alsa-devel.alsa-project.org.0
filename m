Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2813E381E65
	for <lists+alsa-devel@lfdr.de>; Sun, 16 May 2021 13:01:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A7E916AC;
	Sun, 16 May 2021 13:00:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A7E916AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621162878;
	bh=NaKCo3cvEd2Vzbel/pGGkJh5gcqTEUZ0t8adAJDQ6Ec=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k5TduMRLFxdo6VTdkt9TyaRMylyL2vZfUHwenbuuBRR6zFzJCO87+3k/A4F4IlLek
	 8+W6Wx0UZi/SFH93k1qjx01PmS0/JNR/nyMSuMW1HbQ+6szr1Yt1WjM/q35c5p+bLQ
	 N2wt45dj1I46myKPCQW6jsw5RLNUbRosforBRP9U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1FEDF80229;
	Sun, 16 May 2021 12:59:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 511FCF80217; Sun, 16 May 2021 12:59:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0C0EF8016E
 for <alsa-devel@alsa-project.org>; Sun, 16 May 2021 12:59:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0C0EF8016E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="Cpy1ZhzN"
Received: by mail-pf1-x434.google.com with SMTP id h127so3040502pfe.9
 for <alsa-devel@alsa-project.org>; Sun, 16 May 2021 03:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=4GxSFPpWStKHjj7EXT1jNvKcDZSOJF70aqfxoCB02kY=;
 b=Cpy1ZhzNx1aXXw3LdrNWLhQV74sEFSo4yuPbZKep5yiUfJ7jFrzsL2A7fwWfhE6lWS
 /KSnKu0QTHLxD3kyOFX9a2EalkBpWDdhslf7K6x7qt3tcIXgOqFK4uChKM+J4xhZrLnS
 bYcuqmCK/DTMUUwmoOFvd80zHMnPJlCBJp5jw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4GxSFPpWStKHjj7EXT1jNvKcDZSOJF70aqfxoCB02kY=;
 b=CmvInCTHUgjM1F0/bry4VpLy7eOpirojDJ290xOR8vRk8BJZ8FcC4A/OO+EpWgm0zL
 2ipiRK4V/O07QVK3qUQxcWM5fxi7jFwCF+BWORMqxPQc2RiK1h8C/IRsJjnLNmX0cEcC
 Idd6kRsNnCzj6KXE8nhBiHw+PGB9kbLdUbtxj0uySfhBm/H+OX/pMS8AO/RcR9nq4AOq
 FnHBgROIjkeyWsSfR8piopVLsIECbb7Ds9IpsT1WRb0StCD7KZ2n/YgtKeCoeVtKH0/R
 TvfX0PdqMBgT8PvqsrAuNrNRv2z9VByjxVQuzPjSuAW7Yv8PI+Ay7yZvd07gN5Hg/00H
 lvaQ==
X-Gm-Message-State: AOAM532vCX+JN9JZaC7l/sudcuWxey+yzwwKrq7Ja1pm5fHaUNRP5TmG
 JR8tDOZtOEKtjTuUXQlWRJR10A==
X-Google-Smtp-Source: ABdhPJzQJp5Q3my2xZ7H1eLd22WRM8iYd4u+a0Zh7oLI6yZH3geaz4ojkhR6TlZ63R3BXwn99le9yA==
X-Received: by 2002:aa7:88c9:0:b029:2ab:aea7:e761 with SMTP id
 k9-20020aa788c90000b02902abaea7e761mr45338082pff.71.1621162776789; 
 Sun, 16 May 2021 03:59:36 -0700 (PDT)
Received: from google.com ([2409:10:2e40:5100:4596:acad:c782:2f52])
 by smtp.gmail.com with ESMTPSA id z5sm5077648pfa.172.2021.05.16.03.59.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 03:59:36 -0700 (PDT)
Date: Sun, 16 May 2021 19:59:31 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: ALSA: intel8x0: div by zero in snd_intel8x0_update()
Message-ID: <YKD7E/VEwE7Dmx3s@google.com>
References: <YJ4yBmIV6RJCo42U@google.com> <s5hk0o18tio.wl-tiwai@suse.de>
 <YJ5cHdv6MVmAKD3b@google.com> <YKDYQfDf7GiMfGCN@google.com>
 <YKDYbaprE3K2QpCe@google.com> <s5hbl9b6mah.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5hbl9b6mah.wl-tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Leon Romanovsky <leon@kernel.org>,
 linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Sergey Senozhatsky <senozhatsky@chromium.org>
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

On (21/05/16 11:49), Takashi Iwai wrote:
> Subject: [PATCH] ALSA: intel8x0: Don't update period unless prepared
> 
> The interrupt handler of intel8x0 calls snd_intel8x0_update() whenever
> the hardware sets the corresponding status bit for each stream.  This
> works fine for most cases as long as the hardware behaves properly.
> But when the hardware gives a wrong bit set, this leads to a NULL
> dereference Oops, and reportedly, this seems what happened on a VM.
> 
> For fixing the crash, this patch adds a internal flag indicating that
> the stream is ready to be updated, and check it (as well as the flag
> being in suspended) to ignore such spurious update.
> 
> Cc: <stable@vger.kernel.org>
> Reported-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

I kicked the tests. Will let you know.
