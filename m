Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C1F91DEF7
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 14:21:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20A202355;
	Mon,  1 Jul 2024 14:21:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20A202355
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719836490;
	bh=UpeE/DXkO/iG0fuoDqe54X/XOy1qooPFONL7bavexrw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LrOwjfAMiK0dwEJshjV7Zk27BjTLW6TtbBC/sMh/8tEvje4ChfMnEEpIsb6naVvCh
	 sRWS0zJlxaXLpA7sJCD/+Xvz2OjfyDMP+gH1u85W4+Dg2spWzI9EVp4L/9Y3kK5VgN
	 wWtR1HVIsXDnbvvtD3kUbiOSkr8+nRo4x1NXBPWY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36898F80654; Mon,  1 Jul 2024 14:20:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 39846F8065A;
	Mon,  1 Jul 2024 14:20:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 864F3F8023A; Thu, 20 Jun 2024 14:30:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 82343F800ED
	for <alsa-devel@alsa-project.org>; Thu, 20 Jun 2024 14:30:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82343F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256
 header.s=2024 header.b=aXp0SCno
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-7064afd7011so100120b3a.1
        for <alsa-devel@alsa-project.org>;
 Thu, 20 Jun 2024 05:30:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718886613; x=1719491413;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oHMzHVKWhLHFRTFoXNvAkGLFcNNzxK81u0mLsBL7Zsw=;
        b=Ck6uEeVrZC7aocbD/9UIWm606knf/mMulwCeovkeRnQPCOuOJ6LU94ug8T5OneVYWn
         mzSKG1FInEXcWxxLGt8WaCKAgH4iqq4j8MubcBoMKce3bMzDL7oWefyTA5V6zAghVQKc
         JnYjWP9vVg7trHjbrz/xlKpenJ5fF8ABeK+/aKKLrhAS0/MewPMDXX8yqjCJ9tjgmrxm
         xqU1HGIIVXXRgnjmCcjIfRf1eHR9gQsKFXaGKaOxZnWHqLr+zWvBJ/x5l+Y4eZHpiv4R
         +77JX3SWmoN2LjzfH9QkWP7yyK+QCENcZWX4ubquYNYo9Us9ZY16NXUcJNRvSDJFpiSL
         9+tg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfULh4vhAyIXuW5E3lNqbw+//2iaoAwFz/FjzV/Jr7KkwX3zZBqoSx5qFYLj4zEkofZpS8H9Hcx9AU9z2junMEZwy/hnFk57Js5xc=
X-Gm-Message-State: AOJu0Yyci+r+KDRVP0Ybrdl/JUckmNWGqGLeA4cUiL/ey5Kbj1kPv5r5
	HgiiWoR9vGQCw2iVyIcwzHbjp65mL3HGNTnn5b8WWZKTUUtniZ4Dpqh/Dy61
X-Google-Smtp-Source: 
 AGHT+IG2sObKQlJRXnm0zIOzZdnUzQkHNGXDXN4ljr7fpHYK1vVZLwAZQXoaLia921hIfW/T+oFYXA==
X-Received: by 2002:a05:6a20:3ca8:b0:1af:f8bd:1e4e with SMTP id
 adf61e73a8af0-1bcbb621263mr6188164637.62.1718886612218;
        Thu, 20 Jun 2024 05:30:12 -0700 (PDT)
Received: from mail.marliere.net (marliere.net. [24.199.118.162])
        by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f9ce93deafsm12346665ad.74.2024.06.20.05.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 05:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marliere.net; s=2024;
	t=1718886610; bh=UpeE/DXkO/iG0fuoDqe54X/XOy1qooPFONL7bavexrw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aXp0SCnogf1kctICBTqw7Z8wi6UuwmLy9v+eiQO0w9gmS8JLoACVhp0mBfR7v4iT5
	 bmEmeXw/RPFdoNoagxpXuY+dklCEBgsHq++DNTFYlEFnZEgzcTVRlP+J9TlhQ5PJ8s
	 KevqhZDdguQkINjtGu47lua2VPPVb2/EachWZQa6Dod4vUDuDb83t0nuDSRyzvV/18
	 ELp/w2Wp6wO+ewKae2r7fSouIbEJDRs1otLKuv937IRlgNR06ElV+eRW+gXkVlF+6M
	 AR1Z9s1pHpSPZcrp/jaDL8jjYfSj9rxnG2iXb7VLS35Jg3k7bQBwYucnbmS6nMNxiL
	 AxU2ybJSP1AiQ==
Date: Thu, 20 Jun 2024 09:30:01 -0300
From: "Ricardo B. Marliere" <ricardo@marliere.net>
To: Amit Vadhavana <av2082000@gmail.com>
Cc: srinivas.kandagatla@linaro.org, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, rbmarliere@gmail.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v2] slimbus: Fix struct and documentation alignment in
 stream.c
Message-ID: <f64523f0-db39-4e3a-85a6-1a3cb07e2d08@marliere.net>
References: <20240616203231.43724-1-av2082000@gmail.com>
 <d6cd7441-53f2-4c88-a361-729e3abe81c1@marliere.net>
 <CAPMW_r+sPGF5=+=edLY81X+Cd4bMWKFJw3sDd0mzaZEM9b75BQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CAPMW_r+sPGF5=+=edLY81X+Cd4bMWKFJw3sDd0mzaZEM9b75BQ@mail.gmail.com>
X-MailFrom: rbmarliere@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: VJLKDC7RDAKNIGS5PIJG3XNVOA3LV67C
X-Message-ID-Hash: VJLKDC7RDAKNIGS5PIJG3XNVOA3LV67C
X-Mailman-Approved-At: Mon, 01 Jul 2024 12:20:06 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VJLKDC7RDAKNIGS5PIJG3XNVOA3LV67C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Amit,

On 19 Jun 24 23:28, Amit Vadhavana wrote:
> Hi Ricardo,
> 
> I have rebuilt it again, and there are no any warnings or errors.

Thanks for checking, FWIW:

Reviewed-by: Ricardo B. Marliere <ricardo@marliere.net>

BTW, I received this message plus another two empty ones. Please check
your settings. Also, make sure not to top-post [1].

Best regards,
-	Ricardo.


[1] https://en.wikipedia.org/wiki/Posting_style#Top-posting



> 
> Thanks
> Amit v
