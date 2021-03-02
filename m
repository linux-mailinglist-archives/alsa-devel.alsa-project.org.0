Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCAF32959E
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 03:12:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05F1E1676;
	Tue,  2 Mar 2021 03:11:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05F1E1676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614651169;
	bh=vwyUtDxwiNKk+ynoP3q+QLEEjbm/rJVYSWUVbdibiKU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NBMN33X4gBbpKUorES9vEy4h3x4xmod+aKvK+7VKItoPC6fKuBEAlbkv50dT9KvMo
	 ES2efpZsei5+3tuhIyJTwMiHu30bGWJ1QrJwWvULsD5t8v9xcW3JaadXlfSsbBl0Tc
	 9+4uXO04aVyqtWqJoRXU9LlUPG/Ye4VuDlcEkLgQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52144F800E0;
	Tue,  2 Mar 2021 03:11:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63411F8025E; Tue,  2 Mar 2021 03:11:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E16EBF8010B
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 03:11:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E16EBF8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rbKRB3kU"
Received: by mail.kernel.org (Postfix) with ESMTPSA id B38D160234
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 02:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614651066;
 bh=vwyUtDxwiNKk+ynoP3q+QLEEjbm/rJVYSWUVbdibiKU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=rbKRB3kUrCgw5NeYHrpMgzimtGvCrWXkFsibJcBZjZ3NlolKoBurfLrbqEpwKjUg1
 R3kpc1bIDqVJCviwFqlDOItVDd9kydfT5xsVQkEk0lc2lrLKY+p1xjm8ZFzxe+eTRP
 Q6n4HpeWZb3ItmmT8bFNC92yxnAz55rcqxeuSqg/nQNGwuDbPBEkcXADYJjBS1GNDT
 WQUGO3AvpyeOexLYUTAqM5PzsT5mp9XBYjZj0ObV82NVE0m4hnm8OrBBTwrHwanDYW
 /BswQDCK3RgIBmWJkcrl7+5LM6xY7GGGfOiGwmtt84AF6Y9bizxyBs4Dle8/ap/xJd
 aMqiGN5Thv79w==
Received: by mail-ed1-f48.google.com with SMTP id d13so18307055edp.4
 for <alsa-devel@alsa-project.org>; Mon, 01 Mar 2021 18:11:05 -0800 (PST)
X-Gm-Message-State: AOAM532QnaANE+nVB8p9JZNpeWbMVlNyFa8dikOV5aLt10ft+etL5cXC
 +A91MMrbgJqfAme3qa5SVLi6IfjI9qeLiAz9pw==
X-Google-Smtp-Source: ABdhPJyWebOHWQP7njU4m2dvQglQXnk4r5eZJ4pcMx2WhPXBWc0SlmoYi4n8+GWICYKhfnpGtYXlrCdIRZMY5g5sG20=
X-Received: by 2002:aa7:c991:: with SMTP id c17mr18868381edt.165.1614651064202; 
 Mon, 01 Mar 2021 18:11:04 -0800 (PST)
MIME-Version: 1.0
References: <1614276364-13655-1-git-send-email-spujar@nvidia.com>
 <1614276364-13655-4-git-send-email-spujar@nvidia.com>
In-Reply-To: <1614276364-13655-4-git-send-email-spujar@nvidia.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 1 Mar 2021 20:10:52 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+9esDGw7ZCLnZS_KLmLUFyVenz83ohgNKFK3bdPD2ouQ@mail.gmail.com>
Message-ID: <CAL_Jsq+9esDGw7ZCLnZS_KLmLUFyVenz83ohgNKFK3bdPD2ouQ@mail.gmail.com>
Subject: Re: [RFC PATCH 3/5] ASoC: audio-graph-card: Add bindings for sysclk
 and pll
To: Sameer Pujar <spujar@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jon Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>
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

On Thu, Feb 25, 2021 at 12:06 PM Sameer Pujar <spujar@nvidia.com> wrote:
>
> ASoC core provides callbacks snd_soc_dai_set_sysclk() and
> snd_soc_dai_set_pll() for system clock (sysclk) and pll configurations
> respectively. Add bindings for flexible sysclk or pll configurations
> which can be driven from CPU/Codec DAI or endpoint subnode from DT.
> This in turn helps to avoid hard codings in driver and makes it more
> generic.
>
> Also add system-clock related bindings, "system-clock-direction-out"
> and "system-clock-frequency", which are already supported.

This all looks like duplication of what the clock binding can provide.
We don't need 2 ways to describe clocks in DT.

Rob
