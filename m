Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4746F8A45
	for <lists+alsa-devel@lfdr.de>; Fri,  5 May 2023 22:39:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 918D12BAC;
	Fri,  5 May 2023 22:38:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 918D12BAC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683319179;
	bh=b3CE/V8TQenqSh7NE+inf/ijcS6yg1yHI0dvetaLrF0=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bC1UzddChkR0ciyu/BblVEdrijK4n7zAll/72Wu0Tvh/VuLQscAcQKogobw1POTFa
	 72XEtTDJSxk+DAJEoHaudPwLhKhmHWWx64ClpG1gh+810VxZN6AyrGYYh9arpgC+Jg
	 kV1wZZA2Bo3PDCuhzztxtcXj8M+J76WPOYy1U198=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 83720F80529;
	Fri,  5 May 2023 22:38:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E0D8F8052D; Fri,  5 May 2023 22:38:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4FE68F80087;
	Fri,  5 May 2023 22:38:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4FE68F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=goDdGu9k
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-192cd5579faso1914376fac.1;
        Fri, 05 May 2023 13:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683319113; x=1685911113;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B/9Pv9GD3bRPuWx/fbnz86Vp95f4PmUu+4iR/1CRaf4=;
        b=goDdGu9kDZj9vHqLSul8dj2tMHtYncgeFjDy4Ih9Co12xwlNk79SAXfabnV/I8BhCn
         O2zpkxB39wUNVPS0PgV6zrD/TrqNWrMT9VIq2M2uh3fbb57YtQwC4X9n152CXKGl+UV6
         CbEfdwzj31dcOxoMi6gGw+dSULaNODcJI0RpApLI0SRpFpRkuIsdmFBMvvpk4MAbgbvS
         i7YyZQoSXUnVKij9t8p1Y098ZYYnQZCCfQ1DNT9v3VXC2D88LjoV1EVmKJeyjIxoocqS
         qaPZg64lC05hh9mFUvLr5hyW/cjl53MDRDHjdtOVFAO201xj1LDm7xWdmAjSOodLdPCq
         sDHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683319113; x=1685911113;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B/9Pv9GD3bRPuWx/fbnz86Vp95f4PmUu+4iR/1CRaf4=;
        b=a1CnHnKVjDnjkDVFu2aUNF6GkJeIZAukqxmjsDgIS8T/SG/JRSICZDqxGPUH2qKhbL
         SePfAVDdrvg92kgDlPJaccuUsebnjQQaRMgWgVFVY4Qmmc4eaMtNQn9g79WkBMuTENX1
         6LeIweFizDZUAKkTZg57+I2devqG3irLlu8Qz0plbR4mLucIPSlLjLLMqCSdDADV9DFZ
         Yqa4k/Jk8nd8e7WMlX7OjmuVROelKm6lexb5HC9fjxPCDN4t+3HEognWwCTR0tjVWn7v
         Hnjko+4AdJWmVRgPGJkmIHPIqUOHVriCJIeCwcNBSk+wgaafCFZvSJxxMOfG/g9S1M7a
         +xVQ==
X-Gm-Message-State: AC+VfDzLJsG2HoMtevISu5z1nwjZAQ1d6BUFObxqofEjilUEi9/mRHn6
	ws0MNWSYyBj5u/Ex/atz54Y=
X-Google-Smtp-Source: 
 ACHHUZ43KR0D/CnThPvLyRqYUzzs0Bu6roC8bV+8+jZlakhbyt50txdtmlCKtQTrvSPYxU/uICDKiQ==
X-Received: by 2002:a05:6870:9571:b0:18b:2238:5abe with SMTP id
 v49-20020a056870957100b0018b22385abemr1705929oal.9.1683319112962;
        Fri, 05 May 2023 13:38:32 -0700 (PDT)
Received: from geday ([2804:7f2:8006:8886:6ce0:2667:545a:2a1])
        by smtp.gmail.com with ESMTPSA id
 s4-20020a4ac804000000b005255e556399sm1381958ooq.43.2023.05.05.13.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 13:38:32 -0700 (PDT)
Date: Fri, 5 May 2023 17:38:28 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel@alsa-project.org: [PATCH 3/5] ASoC: mediatek:
 mt8195-afe-pcm: Simplify runtime PM during probe]
Message-ID: <ZFVpRKM5vxpWWaI9@geday>
References: <ZFMF2cD3nPgpZOpa@finisterre.sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZFMF2cD3nPgpZOpa@finisterre.sirena.org.uk>
Message-ID-Hash: RVEYMSYHPROVSXEWTIWR2GXPFTZRA3XX
X-Message-ID-Hash: RVEYMSYHPROVSXEWTIWR2GXPFTZRA3XX
X-MailFrom: geraldogabriel@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: postmaster@alsa-project.org, sound-open-firmware-owner@alsa-project.org,
 tiwai@suse.de, alsa-devel@alsa-project.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 sound-open-firmware@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RVEYMSYHPROVSXEWTIWR2GXPFTZRA3XX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, May 04, 2023 at 10:09:45AM +0900, Mark Brown wrote:
> Hi,
> 
> Here's another mail (one of several in this series) that got completely
> mangled by the alsa-project.org mailman to the point of unusability.  I
> didn't see any response to my last mail about this, is there any news on
> fixing mailman to not do this?  It's extremely disruptive to working
> with lore.

Hi Mark,

Are you complaining about the added headers in the message? Because the
patch itself didn't look mangled from my side. From my understanding,
Jaroslav had to start mangling mail addresses due to strict DMARC rules
which make some servers reject the message from alsa-devel.

Thanks,
Geraldo Nascimento

> 
> Thanks,
> Mark

