Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6E674892D
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jul 2023 18:27:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCE333E7;
	Wed,  5 Jul 2023 18:27:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCE333E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688574475;
	bh=zRngUswDDjUkAq0whRYB/BwUdgXkOveiuP3S4rNRLKg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WLi7PjUBaycQhgc4Ur/z5vFYvxSat9v4V5Bm1AWVVm5QjHrh/e91gSaNT+SVxSXn7
	 Hh6oDqzkULIv9ZsVsWYGqdLoIR+rw2/9/GfJIJ4V64uBXo1y6KHMXU/D8z2StZTSRl
	 cYkPGf+4zoVk84f7n0bTknmiuWnky2mR1423hedQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CE95EF8053B; Wed,  5 Jul 2023 18:27:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6EA9AF80124;
	Wed,  5 Jul 2023 18:27:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A9EEF80125; Wed,  5 Jul 2023 18:26:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 15DB1F80100
	for <alsa-devel@alsa-project.org>; Wed,  5 Jul 2023 18:26:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15DB1F80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=dACqdluA
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-1b012c3ce43so5969312fac.3
        for <alsa-devel@alsa-project.org>;
 Wed, 05 Jul 2023 09:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688574412; x=1691166412;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BNUN1LyDtrUudoc7yqfmzgIHsmmaYOYd/qCnPyCLiZY=;
        b=dACqdluAjxlZcLwqfbzoJBEK8v86zLgGo7Dij0qbplnSwW5xvS2UILpnyedymJarmj
         QtRYTpRGqt7qUCPp3xzYyTGrcCDz868vlxHB8eTpbwC5pxGV6BcLhrTKbGgajin98v3j
         JGKgQn47CUbe38MuBHKL72AmUxuVSw3cftb/GNic04d1EPcM5VfrZbE1w+8dBc+BKZxL
         1JYSTqnbQA51qEv0yYBawyzcR0SxP/BogEBPNGTNzCsze8QOyjBvQfBVusTAtBLJ35sk
         +6Un2iHgOCiEpcTdELFv2q8OIm4+srBVQWEAr0XEvkwNZvfRC59fx+Lfv8PUY7ql3g4E
         sFZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688574412; x=1691166412;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BNUN1LyDtrUudoc7yqfmzgIHsmmaYOYd/qCnPyCLiZY=;
        b=igREYdfRAl+8Vo60wQmdHvU2elsSnSfanc7fYrMkBSGyDtuJsqNYiWkO9M30cRRoqg
         vvC27cl0CcM5GRULLgyB6Radia6sdhbbM/d3g3YwRlzwm70f4OAlQEuX22ZeeULpqHzP
         BfggHrXw3Cr2aFw7KlOgvXYbfJtPf3hhk5J3Q2vY+uqIlILUA34B7v4FF/WBy2Nb3bqc
         yoPM+dgHRKX79nbUMnhoxMRCBSEhPhfc8Q4+jPnTme5s6AOiEynMUfsxkwnOpXXvLLOV
         enbpl2rkHy+zopC6nH54QvNe4lQTQYlFTKLtagpZdjzrGlemlKFDN0y1YUg6AjvoWoez
         L2Cg==
X-Gm-Message-State: AC+VfDwu2ZDpni8SoU6EndgUsBvj3SzFkfmF5dZF/wX2eJ7TSXwQJnyt
	iT96BQXoIxsgJCoEO0mX44Q=
X-Google-Smtp-Source: 
 ACHHUZ7KFqOaSAQQ+CzBwEtxbQDKAYOgWNyAYLimrEIB2wxYJy5c8zyqufbeIH7pRYPYxoG6RY0zNg==
X-Received: by 2002:a05:6870:3e04:b0:196:8dc3:4e16 with SMTP id
 lk4-20020a0568703e0400b001968dc34e16mr16781179oab.39.1688574411684;
        Wed, 05 Jul 2023 09:26:51 -0700 (PDT)
Received: from geday ([2804:7f2:8002:4e4c:85d7:6b16:f905:6cb0])
        by smtp.gmail.com with ESMTPSA id
 ma15-20020a056870fd8f00b001b011efb1ebsm2535697oab.0.2023.07.05.09.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 09:26:51 -0700 (PDT)
Date: Wed, 5 Jul 2023 13:27:02 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: =?utf-8?B?QXVyw6lsaWVu?= <aurelien@ap2c.com>
Cc: alsa-devel@alsa-project.org
Subject: Re: Garbage returned while reading unused S/PDIF, A CM106 like sound
 card
Message-ID: <ZKWZ1l+fIBlEHELJ@geday>
References: <5962046.lOV4Wx5bFT@antimony.ap2c.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5962046.lOV4Wx5bFT@antimony.ap2c.org>
Message-ID-Hash: CAUW4WTFSL6BIYL63Z6AGRWCGZMHGWWS
X-Message-ID-Hash: CAUW4WTFSL6BIYL63Z6AGRWCGZMHGWWS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CAUW4WTFSL6BIYL63Z6AGRWCGZMHGWWS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jul 04, 2023 at 08:06:04PM +0200, Aurélien wrote:
> Hello,

Hi Aurélien!

> 
> I encounter troubles while using S/PDIF input on an CM106 like sound card 
> (vendor 0x0d8c, device 0x0102) when the remote device which is connected by S/
> PDIF to the sound card is powered off.
> In that case garbage data are reading from the S/PDIF rather than.. nothing
> 
> It is really boring since this S/PDIF input is connected to the output 
> speakers and once the remote deviced is powered off it emits a really 
> disturbing sound.
> Since there is no input on the S/PDIF I guess that it could be a driver bug?
> If it's an hardware bug (I don't encounter the problem under windows..) is it 
> possible to make a hack in order to distinguish between real data and noise on 
> the S/PDIF input?
> 
> Unfortunately this test is performed on an embedded device which runs linux 
> 5.16.17-sun50iw6. I don't know if this problem still occurs with newer alsa 
> version.

This looks like a vendor (downstream) kernel. ALSA Project does not
accept bug reports for vendor kernels. You must try to reproduce your
issue with the latest mainline kernel.

Thanks,
Geraldo Nascimento

> 
> Thank you in advance for your help.
> Regards, 
> 
> Aurélien
> 
> 
