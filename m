Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01AA42999AB
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Oct 2020 23:29:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8043F16B1;
	Mon, 26 Oct 2020 23:28:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8043F16B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603751368;
	bh=rXrl5PqEZUtyeRn93aIo7UrIZECW0ReT9a6oTvnjWjI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GD7CQxQY58CnZaZzJUu0m1QA12PWA+gM5rVqL+FLX6x2zPNOOi/Mp8j91P/mgc9zD
	 pPnZg6DJSfx4Af0+UTNlKra9qRx5bJGtPg8NwmxpANTl+F5+YZCUMXBBUYoo0cr+Ts
	 MykXYl80FFcMlhvicfkMvX/E3WrVqzznC4+aRLpk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BCD00F801D8;
	Mon, 26 Oct 2020 23:27:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06775F80212; Mon, 26 Oct 2020 23:27:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3770AF801D5
 for <alsa-devel@alsa-project.org>; Mon, 26 Oct 2020 23:27:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3770AF801D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="V6y8gYz2"
Received: by mail-wr1-x441.google.com with SMTP id n18so14720147wrs.5
 for <alsa-devel@alsa-project.org>; Mon, 26 Oct 2020 15:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=WMbMX3sYFZTiJxDi6iVMxqXLQXyV4ObR+OkEErhzWA4=;
 b=V6y8gYz2uGh3oaHY97GwUW2s1K/w8PS0UsgPgXbieiH1dISczKtT5DxdG6OL70eZpw
 CQE3lwb/M0LbX9jLqdrNgyLQG0Y99JNuZvlXCqzICU8GviVnmC+xoOK9Phx1MkU80zvX
 sekY8eEravQlxRqhh8NAGEJt/iFxEZnfSXOH4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WMbMX3sYFZTiJxDi6iVMxqXLQXyV4ObR+OkEErhzWA4=;
 b=kjDXM5a+q+/UGxhPXxOJbaJC3WLgG0Joh7j7prY739N1+zWVLOfOYFM1JMz7MfYhdd
 HlFU/kZafIY2vWEhZL2YLDnuRdUhAMlObdME56vy4ynda2cZqulUBgzcQ2lhws3aMb/O
 oLQ2P7amQwl1No+LmSJh3xuaLQp1o0IdB6FcapbFgMF0blsOZbt/J8OtPtPC9mOpllq4
 CUnthU8lh8eaLSdntLZfzUIIRJoiIyo6B6mgJy1lAJkpEmzsjU5BHybLhJ8I0YZ5a7xi
 cTOkyltlUY8cI9LHrbJtR8cGTYNYnm3QLkkgsHpEVSvkC0IXUPfcVL4fmXDVQO06BewG
 jIuQ==
X-Gm-Message-State: AOAM5329XsvIu1GM3SIncg+qHzsJOMUW9yEYyDkZtnRiyVH2/kzU8scI
 o5KKDOJKVjorTHqwqLmwHuwtHg==
X-Google-Smtp-Source: ABdhPJyzFE0ncLcgFAJvvEYWHlsKTBfl+UVWKA2K4j/MUCo1aOoPDSIeht7MXSnGCzK8nfdetUXT2w==
X-Received: by 2002:adf:bbcb:: with SMTP id z11mr19957431wrg.130.1603751269585; 
 Mon, 26 Oct 2020 15:27:49 -0700 (PDT)
Received: from chromium.org (216.131.76.34.bc.googleusercontent.com.
 [34.76.131.216])
 by smtp.gmail.com with ESMTPSA id o5sm23230396wrw.76.2020.10.26.15.27.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 15:27:49 -0700 (PDT)
Date: Mon, 26 Oct 2020 22:27:47 +0000
From: Tomasz Figa <tfiga@chromium.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: Intel: kbl_rt5663_max98927: Fix kabylake_ssp_fixup
 function
Message-ID: <20201026222747.GD2802004@chromium.org>
References: <20201014141624.4143453-1-tfiga@chromium.org>
 <20201014190226.GE4580@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201014190226.GE4580@sirena.org.uk>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, Takashi Iwai <tiwai@suse.com>,
 Jie Yang <yang.jie@linux.intel.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 =?utf-8?Q?=C5=81ukasz?= Majczak <lmajczak@google.com>,
 cujomalainey@chromium.org
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

On Wed, Oct 14, 2020 at 08:02:26PM +0100, Mark Brown wrote:
> On Wed, Oct 14, 2020 at 02:16:24PM +0000, Tomasz Figa wrote:
> 
> > Fixes a boot crash on a HP Chromebook x2:
> > 
> > [   16.582225] BUG: kernel NULL pointer dereference, address: 0000000000000050
> > [   16.582231] #PF: supervisor read access in kernel mode
> > [   16.582233] #PF: error_code(0x0000) - not-present page
> > [   16.582234] PGD 0 P4D 0
> > [   16.582238] Oops: 0000 [#1] PREEMPT SMP PTI
> > [   16.582241] CPU: 0 PID: 1980 Comm: cras Tainted: G         C        5.4.58 #1
> > [   16.582243] Hardware name: HP Soraka/Soraka, BIOS Google_Soraka.10431.75.0 08/30/2018
> 
> Please think hard before including complete backtraces in upstream
> reports, they are very large and contain almost no useful information
> relative to their size so often obscure the relevant content in your
> message. If part of the backtrace is usefully illustrative (it often is
> for search engines if nothing else) then it's usually better to pull out
> the relevant sections.

Okay, I'll trim things down next time. Somehow I was convinced it's a
common practice.

Best regards,
Tomasz
