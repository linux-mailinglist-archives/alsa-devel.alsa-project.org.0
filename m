Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EF6756503
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jul 2023 15:30:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4248AE8;
	Mon, 17 Jul 2023 15:29:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4248AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689600633;
	bh=7QzGGyHSA/0YtKNPtjPzmoyjoQvC6XfRyZCTB1+jA5A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=b8mC8PxPU9kkyED108SdUBAb7NtSVlvHVQuiB1/2KmMy/3k92xw/yL4zEQoanHhJa
	 05bL9TNZP1QUfoQ9hJFt/2skHPRdMNmuyQ49QRiLWDloSVrPNLbK8Zzzgoo4+2f/Kt
	 f/rSAcoZvfJ4vhrA5HpzD8pAzOpyegWt4gBREAyQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 449CBF804DA; Mon, 17 Jul 2023 15:29:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BCE6EF8032D;
	Mon, 17 Jul 2023 15:29:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 487B1F8047D; Mon, 17 Jul 2023 15:29:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E795DF8027B
	for <alsa-devel@alsa-project.org>; Mon, 17 Jul 2023 15:29:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E795DF8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=su28WUHt
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-1b06da65bdbso3377185fac.1
        for <alsa-devel@alsa-project.org>;
 Mon, 17 Jul 2023 06:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689600567; x=1692192567;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BlOZsND84SciXvANY0CY+bWfRMfFwSqDhQDkgMJyHW4=;
        b=su28WUHted4y2Oj1pXVgib331DwEKro8z6itNDd1Gm7nZ7vM4mFGUgtCZ6hjaFA1r/
         rPdTUuAEI+TjHhMPJKU1aBdFopNIKdPu6iynDtH/E5kYJQ+MSHq4qafbcAKzHVreO/wW
         Bh+yaNL9wGR+5ps8uqFyk9qfcKSDCclbqZyILiq04EvOqQcOmNZKV+9SOSmXXIf5GVYe
         ETLudOUUrfVDc2rnQZO0nxKOlKo8sC1b36Q/AVOuJ+ti4WRM1xpkrB7Z5L/N9tassJB8
         uHlOfUWNJI5TLHM3m3orCV59FMoxoYLwuaTZinupE+IufuDDWA9q6GS/WjmC/pil9MvC
         vOgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689600567; x=1692192567;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BlOZsND84SciXvANY0CY+bWfRMfFwSqDhQDkgMJyHW4=;
        b=Zwl7LCLzV5w4Y4FBac3M06eDv2+3wciZ6817UXcQ8Wlvolo0MI2wFiSyFnzffysNp6
         hiQ7+AmKbQNy0JCqjzPz3W3HPMjRcJpztLxCbP81q6D2wEF0ZWKIVBfLhEHjqUMrmk1N
         4232VivU1ZexNhixoXoCbtOYx0pEebrDGBAjbpSFQPNJRZStKkr/VCwMZF6YA8SoVsz8
         qQF+UDxlXaex0IEbw4YTmzcxi+W51bERA7h/2kOQTcFWMmftOBai8eor/3WtDilzsmCW
         zPYOrER4Ue7oc2lh3eDrj8XXpcZbiPDEQ8bQJGy5lwh4kKfK4EPF+V/DAC7nwiK7T9+X
         mAmw==
X-Gm-Message-State: ABy/qLZxYR7tZj4Rn9jlEDgWIsbNyo8TbZc0i85uc9KDzy0QrpaUcL9x
	voc2kSg+12x9IlruS0jzrRQ=
X-Google-Smtp-Source: 
 APBJJlHa1ZtqPyW2vqUQ0hrrWHDJPQkicBRVi7Xdr6CGCwyTOreQeweeePubn5yzkH8ZlyomftM08w==
X-Received: by 2002:a05:6870:1494:b0:1b0:3b98:50e4 with SMTP id
 k20-20020a056870149400b001b03b9850e4mr13065013oab.58.1689600566997;
        Mon, 17 Jul 2023 06:29:26 -0700 (PDT)
Received: from geday ([2804:7f2:8006:9379:516e:42c5:d582:55d9])
        by smtp.gmail.com with ESMTPSA id
 g8-20020a9d6488000000b006b9cb784553sm2127424otl.36.2023.07.17.06.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 06:29:26 -0700 (PDT)
Date: Mon, 17 Jul 2023 10:29:22 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: syzbot <syzbot+cf8e7fa4eeec59b3d485@syzkaller.appspotmail.com>,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	perex@perex.cz, syzkaller-bugs@googlegroups.com, tiwai@suse.com
Subject: Re: [syzbot] [alsa?] memory leak in snd_seq_create_port
Message-ID: <ZLVCMoC0nLAXCMUS@geday>
References: <00000000000098ed3a0600965f89@google.com>
 <87v8ekattg.wl-tiwai@suse.de>
 <ZLQ/zKgTGMHy/6Jn@geday>
 <87y1jfjbmj.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y1jfjbmj.wl-tiwai@suse.de>
Message-ID-Hash: PIX5C2BUCLH3MCU3BLGV672XEN6OPLL2
X-Message-ID-Hash: PIX5C2BUCLH3MCU3BLGV672XEN6OPLL2
X-MailFrom: geraldogabriel@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PIX5C2BUCLH3MCU3BLGV672XEN6OPLL2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Jul 17, 2023 at 08:27:48AM +0200, Takashi Iwai wrote:
> 
> It's a bug that happened only on 6.5-rc1, so no need to bother too
> much with security issue fiasco for distros.

Thanks Takashi. I tried to create a DoS to exhaust all memory through
this bug but ran on other unrelated issues with 6.5-rc1. Glad syzbot
caught this. Thanks!

Geraldo Nascimento

> 
> 
> Takashi
