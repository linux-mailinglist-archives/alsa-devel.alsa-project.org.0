Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D67B176FDC1
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Aug 2023 11:47:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0B39E11;
	Fri,  4 Aug 2023 11:46:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0B39E11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691142438;
	bh=uC975p7J4pPCdddkPafbDAwaLOf/MMSypjNSDGwfV0I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=R+En3MCVJFN2e6usMs1M81L5w9sygl8QycVcd/hyVxKK3NTYcmAC1DG6sC44mxTwk
	 ztIhJl3/Tcek3LrM/VSu1ps+IGgumIACt8tWCAuLiKsppodWq/9xGVNaAX94DNiyJF
	 cxamJlfI3cB1IMcRH6tPQpUY24HrddQ+SIJus8GE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B7FEF805EF; Fri,  4 Aug 2023 11:44:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 79E17F80549;
	Fri,  4 Aug 2023 11:44:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65B23F8025A; Thu,  3 Aug 2023 11:49:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1C89CF8015B
	for <alsa-devel@alsa-project.org>; Thu,  3 Aug 2023 11:49:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C89CF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ozubu9q1
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5222bc916acso890650a12.3
        for <alsa-devel@alsa-project.org>;
 Thu, 03 Aug 2023 02:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691056153; x=1691660953;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jZI/STWDMBC7wrkz2uL4ijqJvFsQCoJSa3ao2cZw/Ic=;
        b=ozubu9q1fw+rj465b4k8J8NC0mxz9dNTjl6mFQ7W6tLk12j96Okccih8U9acaiYnr1
         KOujOkKaWCyo6+YFa/apcB5sjwRobru0tLna/7ycw0IKDMaY28snpbgvBL0mpaAjkwHw
         BRfGxSZeObNVAS+6mNx3LDc2tNeWiiOjZeG80NCEoNddPHVmXLnYMqAKK3VmCctsHW9L
         wJWvHL+Lq2ym/lfHQQiBJGUvXSMiXmzlBAjB87bUCcnHBRwS+Dm/So0dDA61Bq67Xzpa
         L/R9rE6pVT9wyLXEEuPmlhz68fmiBgmio58pnXXAFcPD6dRXqzCoPDZrAHf2b6bq2stv
         YkwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691056153; x=1691660953;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jZI/STWDMBC7wrkz2uL4ijqJvFsQCoJSa3ao2cZw/Ic=;
        b=Y0QN+dFV1DtbzDkTGgk1V1xFJjBdEbY8Gxt26f2NqGAzphocWpX7ldumPoTYrFzhts
         zR3N0uFavEBTFnExvXsM7U0luZDPBi8bMFtlMEmH9JsjoUlElaW2RGuYEVjanKjDv9mT
         v0fl/oymX/bWAoU51cG8+JHT1ploLjUcrFMDvjt440WiQigoMFczMi7Ywk9pQlraC/aU
         O8Jzxi0C+WDvs+EWeMlyx3aHE7vkQCngl9BphDN0vHenFFaXF010tLvPX7lA+nM13tEV
         qfATLjjGos3VStaSeLA+w5e6ZNbjeePlyu4YSWapZ1ZJM72fXwux6iWAfRvbCiIQkn/f
         V4cg==
X-Gm-Message-State: ABy/qLZ+lskthtmYkErOYXgCYn6VJ6nT4geKkY40Y5fXbTaQ8skNeAr0
	Q87/Q1Sn/FZAIZHlG6n0KonF/Q==
X-Google-Smtp-Source: 
 APBJJlE2qUmVoNFoaCuUxFvGcS08tb2tREHg8m78N9bZGHd4aC59P1DLdjSuyNzo65iaRoZ2FBAdyw==
X-Received: by 2002:aa7:c309:0:b0:522:6e3f:b65 with SMTP id
 l9-20020aa7c309000000b005226e3f0b65mr6960173edq.33.1691056152751;
        Thu, 03 Aug 2023 02:49:12 -0700 (PDT)
Received: from localhost (h3221.n1.ips.mtn.co.ug. [41.210.178.33])
        by smtp.gmail.com with ESMTPSA id
 k5-20020a05640212c500b005222c160464sm9889239edx.72.2023.08.03.02.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 02:49:12 -0700 (PDT)
Date: Thu, 3 Aug 2023 12:49:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Curtis Malainey <cujomalainey@google.com>
Cc: Takashi Iwai <tiwai@suse.de>, cujomalainey@chromium.org,
	alsa-devel@alsa-project.org, Doug Anderson <dianders@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Zheyu Ma <zheyuma97@gmail.com>, Dan Carpenter <error27@gmail.com>,
	"Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
	Clement Lecigne <clecigne@google.com>,
	Ivan Orlov <ivan.orlov0322@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] sound: core: fix device ownership model in card and pcm
Message-ID: <44888906-1f5b-45e9-91cc-21fb47a56d70@kadam.mountain>
References: <20230801171928.1460120-1-cujomalainey@chromium.org>
 <87cz06djxo.wl-tiwai@suse.de>
 <CAOReqxjNdczwPXQ76TdR3M1nEKg3ZxPE5DBrzHSDy6msFRCF7w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CAOReqxjNdczwPXQ76TdR3M1nEKg3ZxPE5DBrzHSDy6msFRCF7w@mail.gmail.com>
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: V6JSXQH3PB67CMPDVCLOHVAHNKIUJ76U
X-Message-ID-Hash: V6JSXQH3PB67CMPDVCLOHVAHNKIUJ76U
X-Mailman-Approved-At: Fri, 04 Aug 2023 09:44:31 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V6JSXQH3PB67CMPDVCLOHVAHNKIUJ76U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Oh, hm.  I read my email out of order.  This answers the questions I
had.  Hopefully we can include some of this into the commit message.

regards,
dan carpenter

