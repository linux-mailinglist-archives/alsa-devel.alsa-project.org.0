Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 980A97D869B
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Oct 2023 18:21:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D21DDEC;
	Thu, 26 Oct 2023 18:20:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D21DDEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698337284;
	bh=j53gyq5/O0q+C879emt9O9cfheSmFNM6O7Ui/tJQl+o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hmjJ9zT4SVWDbRyY/w8pgnj+gSOuyBLX1sAr+Jl/hhurYinzyDiIlkoJq11xMatlE
	 ClMCoYcxECa7l6HpCt6rUNIEneWIO5kCd56tRfLfI8kjkGbaSx5tq53eyIHLqWFd2f
	 3XTfjRJzZEyhAPfICLBecAWtR/H/VHdiMe2ZIpIo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F266F80579; Thu, 26 Oct 2023 18:20:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A74D2F80579;
	Thu, 26 Oct 2023 18:20:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E769F80165; Wed, 25 Oct 2023 06:53:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 11419F8012B
	for <alsa-devel@alsa-project.org>; Wed, 25 Oct 2023 06:53:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11419F8012B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ClWK8dnQ
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4083740f92dso42906715e9.3
        for <alsa-devel@alsa-project.org>;
 Tue, 24 Oct 2023 21:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698209614; x=1698814414;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zaFfZaeMrOrqsZ1V0ZdeNxl6PLQt0XTbArkRbtCUiGo=;
        b=ClWK8dnQwJkB+anTBphqKdMR0ZhcxTa50BhaLAJO7vpchawFPWwn5aiQ7xus29blWX
         LpvtC2xi7nFFhLLDF9Yl93cgkxcXEI28dO9J3SeE5kkDz52ikOFUlA5WD5wDU3bR6eWM
         QYWzhDcelulxasll8P49kBgay6e5waKhWT+xrSmXd+tTQlrYFXdtYohziLvT23hwk2Jn
         MwSNVpKACJS+d7ThO5dOJ/HEJi6S3UQRGOf9EpE2SLvgiGmQdFz8s6WpPoXHJHOIGa4s
         s6C1sfNMJJjSoAtPcMWm9rULHog4RrVNa50cBHz+dreANaEuww95+Lgp1jBSBvIJwGri
         V6dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698209614; x=1698814414;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zaFfZaeMrOrqsZ1V0ZdeNxl6PLQt0XTbArkRbtCUiGo=;
        b=LkdQ+Q+z+52MxAgXZSzyuL07ixHdoiTrc3SPYwHpMxlBHxX4R6cNBvvdyPRLplDNyF
         LBCUXAseVhyYJdE+Dqjqph1bNs5rkFacHVlYPPVMSkcnPV6z5Y6QIRB7UHGhLvS5u/QS
         PyqCjOChDLGIH1I1xrHpl/iShic4XTbnpA8rSf/xy9doekeQIXZatctfGVGEePqaSnNE
         S4Q2iClYvrvuJnFk7iVHNzQQkbTSO+ulMq4n+MNMh3IjXgTJJ/xrkjm7E7c2djAQTWYs
         3/w/sg+Syz+HxKp/fCnjh2xymTHVYyu6jphppXM1qe3rYB3ScRtM1N/YFYE6QiuxBWja
         wyqQ==
X-Gm-Message-State: AOJu0YwRG04C/xVCeNzj0VfNMBRXMZdIMFO/eOL06Oysg1Zp7/z0PM88
	cT4lgalEdzuf5eNZFMVhKlu8Fw==
X-Google-Smtp-Source: 
 AGHT+IFXVzgaWky+CaOs5ETvH8rKVTQIFtqsbm3nYu6XYEq4R12UFVKb4cBcG+dJ4/fYuiW8zkkTYQ==
X-Received: by 2002:a5d:4989:0:b0:32c:a930:fe0e with SMTP id
 r9-20020a5d4989000000b0032ca930fe0emr9732988wrq.14.1698209613822;
        Tue, 24 Oct 2023 21:53:33 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id
 k17-20020a5d4291000000b0032da87e32e2sm11286132wrq.4.2023.10.24.21.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 21:53:33 -0700 (PDT)
Date: Wed, 25 Oct 2023 07:53:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org
Subject: Re: [bug report] ASoC: mediatek: mt8186_mt6366_rt1019_rt5682s: add
 rt5650 support
Message-ID: <4ccc2a1e-2704-400a-953a-9f6659b274f4@kadam.mountain>
References: <de95f385-3eb0-44c0-bb71-c9bc993b55be@moroto.mountain>
 <CADYyEwSMB9QQCZVuTC=+m8wZJFxkXzzZPhV6wv2-TsZAXa1j8A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CADYyEwSMB9QQCZVuTC=+m8wZJFxkXzzZPhV6wv2-TsZAXa1j8A@mail.gmail.com>
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: AGCM7OTYJ2U6GHKCUDQ6QRVNTISBDBSG
X-Message-ID-Hash: AGCM7OTYJ2U6GHKCUDQ6QRVNTISBDBSG
X-Mailman-Approved-At: Thu, 26 Oct 2023 16:20:25 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AGCM7OTYJ2U6GHKCUDQ6QRVNTISBDBSG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Thanks so much.  This is usefull.

regards,
dan carpenter

