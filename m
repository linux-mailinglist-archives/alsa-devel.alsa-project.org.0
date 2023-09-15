Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DED777A2707
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 21:15:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D2AB852;
	Fri, 15 Sep 2023 21:15:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D2AB852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694805354;
	bh=aGgvjLEKvewyQkvuY+jgyoBjoLcaKdWh0/9k96EaLMg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=J/EaaE+bwk/fw1lPrykQ7l2/XQRH8mdgZioyjMn/qQr2inTza30FDrsoyeFO+xC5Q
	 1hq+A72WUPBE4uhOwrx5ZX1H7Mc69iYV6FyZvALkngP/7wNcBr5Jvn91xWS8JtDPsM
	 NL30kPDYPamOinv8/C7aMaQAdQa2bX+9eOQU7aoE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B348EF80549; Fri, 15 Sep 2023 21:15:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 09911F80246;
	Fri, 15 Sep 2023 21:15:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9B0ABF80431; Fri, 15 Sep 2023 21:14:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5BAC7F80141
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 21:14:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BAC7F80141
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=ek9OIx2i
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1c0c6d4d650so22515245ad.0
        for <alsa-devel@alsa-project.org>;
 Fri, 15 Sep 2023 12:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694805292; x=1695410092;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ulb4D/RfTw95NwPXZDQfJ0u+pE9nYsbQ05jt6iMwqE4=;
        b=ek9OIx2ic6d2w6lWSN4dtvumeB0RdZ/J/2yXze82Dl6/thPT7702lgz+Dv3KduvVWS
         IhJ9/mjsy3cxW3R9yINf4ylu3w2/Q6DWGD2TzblDj32tJ6VPR0eQPEhGmk0FFN09VwMC
         rySTGoSOQMJ96TcADzNbpATxs8HWh/1UbHU5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694805292; x=1695410092;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ulb4D/RfTw95NwPXZDQfJ0u+pE9nYsbQ05jt6iMwqE4=;
        b=kYg0uBMtKzFVUF4caqxkhB0mcML7IUhFCiqV5X/sWcecBRJE4PBFsKbSCNmx9s4J8o
         KBLT73SDL/HMBGi0wd2VehbhLk7gvggZI75Ls9WEjM9OcYTGFMILOvKy2t8iPJxpwSpJ
         29w/mU8tDzBIpJinzcWBJglxqpjQyiqrMXIWCeYuw1apoklQp0lFjGU6x2pQvwbv8MYp
         3PxRM5A+gHcQdAaxZLwypk4ZRFplzTOXymTiON/Rm8GsYE5h3dz2b6NkKplVSuuoFhN3
         WvCihf99jAVhbvtb53vtQJSaWUOXn5LJaTL7gZQBGgbLlWvfWu77+LRvLk/RZWv4HH4k
         Nt3g==
X-Gm-Message-State: AOJu0YzkIbCgbTa5hKPNZCkVUK8RUNU3Y1NW3HCM4M0GKh6dWQZz0rsy
	HtlsBRMQPwb5fp4CF3nmPdtZ/CDIlWyErZyKttM=
X-Google-Smtp-Source: 
 AGHT+IH4N3+Xu1Uefg79mNbOwJYMqeiP7kEfkNp2+6B8KJWA9QuKAybdahEdCuad1CgiTtfKTAJcsQ==
X-Received: by 2002:a17:902:cec2:b0:1bc:7001:6e5e with SMTP id
 d2-20020a170902cec200b001bc70016e5emr2944191plg.32.1694805291925;
        Fri, 15 Sep 2023 12:14:51 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id
 c9-20020a170903234900b001a5260a6e6csm3824381plh.206.2023.09.15.12.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 12:14:51 -0700 (PDT)
Date: Fri, 15 Sep 2023 12:14:50 -0700
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, sound-open-firmware@alsa-project.org,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] ASoC: SOF: ipc4-topology: Use size_add() in call
 to struct_size()
Message-ID: <202309151214.0A0D6AA1F5@keescook>
References: <ZQSr15AYJpDpipg6@work>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZQSr15AYJpDpipg6@work>
Message-ID-Hash: V6O4FNOXEUHDW227DFITZDXRKCHHX4AK
X-Message-ID-Hash: V6O4FNOXEUHDW227DFITZDXRKCHHX4AK
X-MailFrom: keescook@chromium.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V6O4FNOXEUHDW227DFITZDXRKCHHX4AK/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Sep 15, 2023 at 01:09:11PM -0600, Gustavo A. R. Silva wrote:
> If, for any reason, the open-coded arithmetic causes a wraparound,
> the protection that `struct_size()` adds against potential integer
> overflows is defeated. Fix this by hardening call to `struct_size()`
> with `size_add()`.
> 
> Fixes: f9efae954905 ("ASoC: SOF: ipc4-topology: Add support for base config extension")
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
