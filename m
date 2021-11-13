Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E554044F410
	for <lists+alsa-devel@lfdr.de>; Sat, 13 Nov 2021 17:07:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DBB11666;
	Sat, 13 Nov 2021 17:06:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DBB11666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636819620;
	bh=DdY2DZUgfUPyBKRAv3qHqs1PQz63bpfEslMO6akg7/k=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u0JHzJN+xC3Oj20IntLTU6gd6o4iSt8uuo1cdjTS4ORcOgTKlrxwOqqQVKIqW0F/u
	 KRtlnw2maNd7EEMJ6wuswU725/pcqiPfE2y8sTI3hza787d8dqksm4yGQf31kFc6mU
	 /zmpn6ZS5F2WILDOBQyqR++nftpgDuxyFyweWhTc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2262F802E3;
	Sat, 13 Nov 2021 17:05:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8407F802D2; Sat, 13 Nov 2021 17:05:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com
 [IPv6:2607:f8b0:4864:20::930])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F444F80086
 for <alsa-devel@alsa-project.org>; Sat, 13 Nov 2021 17:05:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F444F80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="TgwnacmL"
Received: by mail-ua1-x930.google.com with SMTP id i6so25308169uae.6
 for <alsa-devel@alsa-project.org>; Sat, 13 Nov 2021 08:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=o0U3gH8B9D/VbsgAVwtnXCUvS/Sl530bctFgmmTRN7Y=;
 b=TgwnacmL1ZxsfEPv2gSbn74icEL0CJyvnwhN2lw/bIolDmxvR0FXPNzQPPxibFDaaQ
 fB7q4IQ0mCm78CRFwQNXtsx0NwcdwUfnnLG7w0zrjW6G5nad5myU3R6pqqv7A8NHnNyA
 Oo+Vlnp7hrF4Cn2QzA8lHmfDqaYZnMLSuG8wHDTGN+XnAa1trjfwfYDZseqmHqSlTkhI
 JM3/nkrFxwxLfU6CDF3P1QE+zHsjRE7JMTXo5Sficf42ag4n30ZjSRKlayy44/+5WGmD
 HYJW+JgMCz6wmbAdd14grpjZyqVdEREDsGg+A/JOasxfys/KUNyX5a584axfN5SsFaM6
 OSEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=o0U3gH8B9D/VbsgAVwtnXCUvS/Sl530bctFgmmTRN7Y=;
 b=Y9MJ+/y0vjWl0732TP3A5+umVcXfDo1GYR/LflLEpKyIjEZq0vbd+tpZvTev9kkPlY
 bZXq2tyRU1udwv3RHwHPYMZwyKzosILujEm06SNE5Agg+Jt2Wawa0uQleoI0hm5makGN
 zgnaqrCcUcMRATOrhzak2T5Aqxh2S+CHoCE+M1QrWzR+AoHF3g2pXIdjRDV1oaPsKFg7
 wpF4GhL5WqZznjNsMTbV3ZwLploRDCUj3a6SlOfcCHfMLYJ9f8eVixtte+BQT2VCYr8O
 /KMkDj6h1KvNOo4DGrQzCex8pZn0M4x+ppNEAqlB4pz9E2TNbgVgTxSC2gpiHlk/ZGTG
 7W3w==
X-Gm-Message-State: AOAM530C4UPioJrGGGrZzS4ftpZ5HOAA3i3X2rGDvoE1KoCMQ7RTal1L
 KkeWNN9ATfX12G5C97Lo4gs=
X-Google-Smtp-Source: ABdhPJy9/PLI/+QQD8/4A+BxH6vlFszsHSziffmUDxR5rQEWgyWW+84JBdahyxh8PMqn8rtVHNpBwg==
X-Received: by 2002:ab0:6cea:: with SMTP id l10mr35551946uai.27.1636819525565; 
 Sat, 13 Nov 2021 08:05:25 -0800 (PST)
Received: from geday ([2804:7f2:8006:e23b:6c99:83cc:541f:b3a3])
 by smtp.gmail.com with ESMTPSA id 128sm5800393vsx.19.2021.11.13.08.05.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Nov 2021 08:05:24 -0800 (PST)
Date: Sat, 13 Nov 2021 13:05:23 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Ramon Fried <rfried.dev@gmail.com>
Subject: Re: Possible issue with Intel 200 PCH HD on X299 AORUS Gaming 7
Message-ID: <YY/iQzxPoM+eWPgb@geday>
References: <CAGi-RUJxadzSjuZoVPFKoW_jg+9=k8Onm9eo8W0R160Sjz-C6Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGi-RUJxadzSjuZoVPFKoW_jg+9=k8Onm9eo8W0R160Sjz-C6Q@mail.gmail.com>
Cc: alsa-devel@alsa-project.org
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

On Fri, Nov 12, 2021 at 09:26:58PM +0200, Ramon Fried wrote:
> Hi all.

Hello Ramon,

> Apparently on Linux Headphones and Line are switched.
> Dual booting Windows on the same machine proves that it's indeed
> connected correctly.

That's too bad.

> I initially thought it was related to Pulseaudio, but together with
> Pulseaudio guys help we figured it's probably in ALSA.
> 
> http://alsa-project.org/db/?f=535021978814678ea328b0d3a053ba3cbd39b709
> 
> Where should I open a bug ? Is it kernel related, if user-space, to
> which ALSA component should I open a bug to ?

Bugzilla is the right place for this. This will most likely require a quirk,
probably inside sound/pci/hda/patch_realtek.c so it's kernel-side.

> Thanks,
> Ramon
