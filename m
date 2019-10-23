Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7DDE15AB
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Oct 2019 11:22:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 145BA1615;
	Wed, 23 Oct 2019 11:21:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 145BA1615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571822552;
	bh=AYgSJdbQJCEwuqZEj1UWVv1XiCB6gYBrfaieuWFq6/w=;
	h=References:From:To:In-reply-to:Date:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IWkEZId39Sg4N+gzhp92s/nSO0FrlZ0O0R6Gzse3pMoTmPumkwAKF1FmODfZLgc7Z
	 Z24fejzo5hlsmkGkuNxX4aTgfTHbesL+pXiMRMaJzmGfDsGuJsEm81VdGXabnRCxRS
	 HnkDPuQcFbINLMoVCtMlpSU6maPmawejUaJ0fPAM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8148AF80368;
	Wed, 23 Oct 2019 11:20:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C82D8F80368; Wed, 23 Oct 2019 11:20:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25499F80112
 for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2019 11:20:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25499F80112
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="xYs5P/Ol"
Received: by mail-wr1-x429.google.com with SMTP id a11so5135644wra.6
 for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2019 02:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=t7h9nEuq78jbasHWLHLtJfedWF7bqZzKfMRnZjNhmFQ=;
 b=xYs5P/Olp2KdBjpPg6Ifb2ABROnqdyB3H/iRKDD06RBqzt8onFQbwVMCf/WDJ4IhVP
 Enl5B0Tcr/Ob4XwlNHKWsOZ91Kf8Iv+QKvTihMPobVrElHFdOr2Md7XW2bz/GwvYnvy1
 NboJMBvQQnZOo1JNHSIE5f3O3gnBq5EsQsrwymRsAWgg/gmmMCrcAjFrrtVP9e8P4DpH
 LilJXlwt3yOwtGxjG6FlNg2hCh5YM3STzFSsdldLRS4l1Chm3r2H427oMU75VV3sipsq
 KqWoHzGlvGJ5s2auOZxtRGI8J17f6X/kv/Ed6P6u3sHeKF0yxTTmZS1bCJ2mPFXIniA4
 B9Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=t7h9nEuq78jbasHWLHLtJfedWF7bqZzKfMRnZjNhmFQ=;
 b=KQLn4UVtYac6UnvTyJsF+RzRCqOU4XlJ5A5qCP1rm5srKAEi+uVjhjIANctOHwTd12
 WB2fXXrvTqTp2tDbwrQOBa0A8mtMZvrIrvO4BH5A0L6uEsVtY1JF7lwA/xy1CnuviU6g
 8aieMk2lLHxjB8Ca6w0f/OeGBHyfOguueKsWPzX5HrtIHtykSO6LDob2AzhCGjnWU9ho
 JBiPGxi4iNDKV+Qs2cu5w4dnws2WpmzH3vKRxuY2IlpqI/BgDwiIqGjzP2jP96hC+7mJ
 2+SGqXR2pFmxc/PC0GurRrS7RUkl223NBV7jnSXtpJnoBSg7l5/PavROR6cVtuW7BdiI
 hb9A==
X-Gm-Message-State: APjAAAVtIKW4pzYFiqOPDe5GiqB+/ChXyDeVmiMxszi9mYX5iB7dhyWM
 PFJVjCOmmA05E6OHFZs5PJj6fQ==
X-Google-Smtp-Source: APXvYqwqw6U6kacrQa5HOQgek5LD/cHqVI9VvDNTbn7IPY+QxugPr8x649VRd7eICn+cb7FvwXjwlg==
X-Received: by 2002:a5d:498e:: with SMTP id r14mr7070234wrq.36.1571822441815; 
 Wed, 23 Oct 2019 02:20:41 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id p21sm11326410wmc.25.2019.10.23.02.20.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2019 02:20:41 -0700 (PDT)
References: <20191009181356.GO2036@sirena.org.uk>
 <20191022185906.GZ5554@sirena.co.uk>
User-agent: mu4e 1.3.3; emacs 26.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org
In-reply-to: <20191022185906.GZ5554@sirena.co.uk>
Date: Wed, 23 Oct 2019 11:20:40 +0200
Message-ID: <1j36fjvmvr.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Cc: Takashi Iwai <tiwai@suse.de>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Daniel Baluta <daniel.baluta@gmail.com>,
 Curtis Malainey <cujomalainey@google.com>
Subject: Re: [alsa-devel] [ANNOUNCE] 2019 Linux Audio miniconference
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


On Tue 22 Oct 2019 at 20:59, Mark Brown <broonie@kernel.org> wrote:

> Hi,
>
> As in previous years we're going to have an audio miniconference so we can
> get together and talk through issues, especially design decisions, face to
> face.  This year's event will be held on October 31st in Lyon, France,
> the day after ELC-E.  This will be held at the Lyon Convention Center (the
> ELC-E venue) and will be free of charge to attend, generously
> sponsored by Intel.
>
> Thus far for the agenda we have is:
>
>  - Use case management enhancements (Curtis)
>  - DSP framework integration (Liam)
>   - SOF integration with ACPI and DT (Daniel)
>   - SOF support for non-modular drivers (Daniel)
>  - Soundwire status (Liam?)
>   - Multi-CPU support
>   - Mixing with HDA/I2S in a single system
>  - Virtualization (Liam)
>  - Componentisation status/plans (Me)

I don't have a lot of experience with ASoC but I'd be happy to present
some of use cases I struggled with while adding support for the Amlogic
SoCs. Maybe this could serve as quick introduction to your part on
componentisation ?

>
> As with previous years let's pull together an agenda through a mailing
> list discussion - if people could reply to this mail with any topics
> they'd like to discuss we can take it from there.  Of course if we can
> sort things out more quickly via the mailing list that's even better!
>
> If you're planning to attend please fill out the form here:
>
>     https://docs.google.com/forms/d/e/1FAIpQLSd6FV-tWYZ1fHlCmyzQhG98OtYH9W9GX-1dQ88mnLxVRGyPww/viewform?usp=sf_link
>
> This event will be covered by the same code of conduct as ELC-E.
>
> Thanks again to Intel for supporting this event.
>
> Thanks,
> Mark
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
