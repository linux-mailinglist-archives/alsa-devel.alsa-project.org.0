Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 334DB8C42AB
	for <lists+alsa-devel@lfdr.de>; Mon, 13 May 2024 15:57:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 732AD3E8;
	Mon, 13 May 2024 15:57:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 732AD3E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715608668;
	bh=+Ru4QZNBQKfH3yM4UOcLMhAWU/tf2NLGgtkBD/4wTls=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pHzNgIuEP2BeXdDAtAjXQDXEzlJ7AiVKh2qvZg/zka0QNMkB4ToftbCcH4fRML7hX
	 ILjwee5UV/ifK/PPF26dD7fe61JFaoGAHkqiQ5PXj4ykGQns4QBmEiuyn4nIREGn+L
	 c3qBPmHv204gATdfKZQq7Bbgnoo2n/jbNI+2rffg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F6E2F805B0; Mon, 13 May 2024 15:56:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AC71FF805C4;
	Mon, 13 May 2024 15:56:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 32205F8049C; Fri, 10 May 2024 09:49:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 255FAF8003A
	for <alsa-devel@alsa-project.org>; Fri, 10 May 2024 09:45:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 255FAF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=u4ZAOkBK
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a59a387fbc9so438248166b.1
        for <alsa-devel@alsa-project.org>;
 Fri, 10 May 2024 00:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715327137; x=1715931937;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YIgmt5OKshocSBCjXZCas2SFAKDLyamCgrbyJz4pkKo=;
        b=u4ZAOkBKmiu/UgCRDdnIunNBuaHXfPL4U6zcOUGOvNEpXAFe72QG9kNtGbQ4zXWyUt
         fGZDz9eVjG00QiMUmssEDo6t7z7r5MA+bJpZh12+IHQozG8Jbpe5uzDIn1fyfkoJINnb
         j1v36eNbE0hA8yWCXeGwMFySo+5j/E3LQEI9gLihZg01Zl1fVtPGuSkWPE+kjMk/rsiC
         gc1jtRlyn/vY1MGfKYosuDXcr2Gp/snhqUAzhF+mx9VKCzPyOXzQWfhur0MdA99I+xzL
         u6+88uMpsslYWXKk+q3PCZvJZnJALN4pB2YuVeQ7R2kugUCp57ao2cYUrR9bho4nmZZo
         6T6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715327137; x=1715931937;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YIgmt5OKshocSBCjXZCas2SFAKDLyamCgrbyJz4pkKo=;
        b=B9Pms9/LIkpCBEWIOMNB3I3845oZnkeyIsc2PL/eL1sPIrNrWzf+cEao2SuJLMHEN7
         RAZFKJmt9VMu0Srj2ita+fQtxt3Tf6eZifildDQle9zfEzUCkWrLLF4z6WG7HHTbqr2Q
         McPcadoHjJ6GVm6RL5Hqve6nM7yQLG41la8Hnnzd+Z445E4yWs5joRVK/EU85PtsRk0Y
         ZXHuQjCkMEQuM5TRtidG5nCozRkWfp14LDKdWhAm6N7dsQIKM+YTCnoIAMqDj74Vyo1k
         svx4xlvH7SHyDJY3rQpPEjO7zPaExZrq3IkQP534m5KtrfIDrbrOPIGg7u/jYA+8Lr5W
         C78w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX58HlH2EjTQpX2NvYZYj/Im+0bwN+7sMauHHIwcwOx/DgA5GGQvfDiVo5IR5FnJ84rkUh2WD+0WFKhHrgrsTezK74PWqB69yYFMZg=
X-Gm-Message-State: AOJu0YzN4H5ymaQ6ZmjMAiBI3pbRl1QYRXKTUtLs8nEdb60pDHjkxrux
	paQ9LOFCIzs2Zc8T3F+GbP0QQ6VX4MUegi3HpZuyorzMhy6HU7jLMYJygzzRbpY=
X-Google-Smtp-Source: 
 AGHT+IFu5FG79XOkaw+QjujszVIXR0deMk6TMVlhFYxpxotP09JVmeUdudhoqJE1AgUoIqsrJ/dq4Q==
X-Received: by 2002:a17:906:1c82:b0:a59:bfab:b254 with SMTP id
 a640c23a62f3a-a5a2d6808b2mr112243266b.64.1715327136810;
        Fri, 10 May 2024 00:45:36 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a1781d342sm155936666b.6.2024.05.10.00.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 00:45:36 -0700 (PDT)
Date: Fri, 10 May 2024 10:45:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>,
	Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [PATCH] ASoC: audio-graph-card2: call of_node_get() before
 of_get_next_child()
Message-ID: <fc2467c7-db9a-46fe-bb50-5bf0a7230654@moroto.mountain>
References: <875xvmqzs8.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <875xvmqzs8.wl-kuninori.morimoto.gx@renesas.com>
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: ZC7NDOEB7WL3VF7HYOOV6NUCGT6ZZLH6
X-Message-ID-Hash: ZC7NDOEB7WL3VF7HYOOV6NUCGT6ZZLH6
X-Mailman-Approved-At: Mon, 13 May 2024 13:56:54 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZC7NDOEB7WL3VF7HYOOV6NUCGT6ZZLH6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, May 10, 2024 at 12:24:55AM +0000, Kuninori Morimoto wrote:
> commit c6f597bc598a8 ("ASoC: audio-graph-card2: remove unneeded
> of_node_get()") removed of_node_get(), but it need to keep original
> reference, so of_node_get() itself is needed.
> 
> Because of_get_next_child() will call of_node_put() inside, if the
> reference count dropped to zero, then of_node_get() after that will be
> use afer free. Need to call of_node_get() *before* that.
> 
> Fixes: c6f597bc598a ("ASoC: audio-graph-card2: remove unneeded of_node_get()")
> Link: https://lore.kernel.org/r/f930862e-9d30-4ea3-b3e7-b4b4f411f6d1@moroto.mountain
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---

Thanks!

regards,
dan carpenter

