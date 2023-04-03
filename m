Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4176D4C13
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Apr 2023 17:38:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C2DC207;
	Mon,  3 Apr 2023 17:37:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C2DC207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680536310;
	bh=hh3vAscHWpZnzPhRcAJYbxE3AGHW60OkGwov+/gsjEk=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CZLwnPtlJW2OrrQhNTCNBKKjqJCaaReVhdDPRYMDBzLH7ZxjPXI2wBopoRuVSZ9pP
	 THEX7CtQZc6ac9R3YTa7hfcaUZIrq6DyX/m4QdzlYvnLgmdYVYxzxVB8uOJ0AYUYXU
	 EKZUxOulfRuZtO5U9p/A4fBA5Gj3dGp3ugteagEg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F745F8026D;
	Mon,  3 Apr 2023 17:36:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22648F80563; Mon,  3 Apr 2023 17:36:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EA23BF80557
	for <alsa-devel@alsa-project.org>; Mon,  3 Apr 2023 17:36:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA23BF80557
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=BwhoJqaL
Received: by mail-wm1-x329.google.com with SMTP id m8so6458518wmq.5
        for <alsa-devel@alsa-project.org>;
 Mon, 03 Apr 2023 08:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680536201;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=36U2ODXozF5pK2igNm59zmr3WO0Khg7qUSKHoeCIVWg=;
        b=BwhoJqaLNoSSLvyTTvqW2nbcAZCdpTdsmovvaVb46KV8S92dsIpcEftkCQPkVmRicT
         di3DThQ76Jz7UWmuKb2Z+xmLg8C7CINouWrhKwmNiyT/3pwEFnaOyhwb2jA7W3kOHCqi
         XNcKS5fu7J91yI0Mbbd0Wep/f27+bMZHv9bn08qHAye7QpYEEOCyANigbqe4PAea7qav
         gK3mRThCvxzYVnP1otso0mwRZjXIyGIjYi0XX8RPiytPzBvNRe8GrWNBY+jV4vmOk7Y6
         RFlY9NLj9xZYbh96VHzvCpUk7nQE5E9szTOdziOjDrG+a05ijkuPPzur2hzRlOY3oZ8o
         sQUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680536201;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=36U2ODXozF5pK2igNm59zmr3WO0Khg7qUSKHoeCIVWg=;
        b=VBTYebZbH/CE2UoWjLWGEpE1dDdpZxJwxJg8TXon+bNgb8xyF/SvG/ym7RiIZWaxmU
         GJczsTp/MHsxXn543hH6mOtNHKtV7CZ52WYuHQYcYhiMfLgbWf06U6I0YSKgxLHVPHNl
         IzUuCZVfL7M2s83x9mkZwt9KesSBwWbVEn1bglXrriHP2eP5QU/O2UODAvoaq9dylF74
         DWxObWUolilk2MrsJW0oEat09WG19tXwe7+PuuvzWf2sG3na+f7QXF8pNfeK8Ld+i3cS
         ubKlCi6zn1TNsseim8nRsb3vSMEVEet8+oGt6MEfgsOOvnS8POoOQbckYph7PYiHFqG2
         yTFg==
X-Gm-Message-State: AO0yUKW4vb6VPKZfpA2O9qV/DuqCS7GwLKkeY+vqSBYIlK0oakoNB+3J
	1mBldUmUDAAHCbzGloYvoao=
X-Google-Smtp-Source: 
 AK7set8/sU4cta/hloqerAxo76VH1Rd5+pxr7aQzErcOpUbbqvbepfu9Plu/0J3se17SDrn0HIgzvQ==
X-Received: by 2002:a05:600c:22cd:b0:3eb:29fe:7343 with SMTP id
 13-20020a05600c22cd00b003eb29fe7343mr25598754wmg.33.1680536200817;
        Mon, 03 Apr 2023 08:36:40 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id
 p1-20020a7bcc81000000b003ef5b011b30sm12426240wma.8.2023.04.03.08.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 08:36:40 -0700 (PDT)
Date: Mon, 3 Apr 2023 18:36:36 +0300
From: Dan Carpenter <error27@gmail.com>
To: Liliang Ye <yll@hust.edu.cn>
Subject: Re: [PATCH 1/2] ASoC: fsl_mqs: move of_node_put() to the correct
 location
Message-ID: <a256ab25-bafa-4600-ab90-522bf90103fb@kili.mountain>
References: <20230403152647.17638-1-yll@hust.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230403152647.17638-1-yll@hust.edu.cn>
Message-ID-Hash: 2XGFV4RC3JOEADAPKBPSMVFV6HEY7GPR
X-Message-ID-Hash: 2XGFV4RC3JOEADAPKBPSMVFV6HEY7GPR
X-MailFrom: error27@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, hust-os-kernel-patches@googlegroups.com,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2XGFV4RC3JOEADAPKBPSMVFV6HEY7GPR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Apr 03, 2023 at 11:26:47PM +0800, Liliang Ye wrote:
> of_node_put() should have been done directly after
> mqs_priv->regmap = syscon_node_to_regmap(gpr_np);
> otherwise it creates a reference leak on the success path.
> 
> To fix this, of_node_put() is moved to the correct location, and change
> all the gotos to direct returns.
> 
> Fixes: a9d273671440 ("ASoC: fsl_mqs: Fix error handling in probe")
> Signed-off-by: Liliang Ye <yll@hust.edu.cn>
> Reviewed-by: Dan Carpenter <error27@gmail.com>
> ---

These patches are from a university.  I think this patch was based on
manual review rather than static analysis.  They have not been tested
and this one affects the success path so that's always extra risky.

However I do believe the patch is correct and reviewed it before it was
sent publically.

regards,
dan carpenter

