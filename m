Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A6D7B3F04
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Sep 2023 10:10:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B798F03;
	Sat, 30 Sep 2023 10:09:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B798F03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696061419;
	bh=7Zu5+rrjIgZXep26yxYN3xwqD7tt1l+JMA7tC971x/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Z06e/MnWvUTV99Ck08LgbCia4zwkl4zpdRB0dRhU4HXpEO5GCbmxYd2aEUzrBWx08
	 VsVkG29uzG/fG/Bcr+CruX+x3Y1uPWSMmg7ajFW/oXBvlt0bMPWxZW0JKRaBwzdde+
	 w/7qO7Qlf+i21c1HHk3/OrixTymMDN/U2FGNFzVw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98FD2F80686; Sat, 30 Sep 2023 10:07:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A8ABF805F2;
	Sat, 30 Sep 2023 10:07:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 49795F8016A; Wed, 27 Sep 2023 15:22:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7D891F80130
	for <alsa-devel@alsa-project.org>; Wed, 27 Sep 2023 15:22:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D891F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=LyvMaL8A
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3247cefa13aso791545f8f.1
        for <alsa-devel@alsa-project.org>;
 Wed, 27 Sep 2023 06:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695820936; x=1696425736;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B4t8SMIb+aaRBITzGumRvFCVICUhpBpI6WIpWYOA324=;
        b=LyvMaL8AdlC6+/72kjtK/rPHdN6txNHSVqCxT3wHOgANr3pGTFsNItVSSs+dSIdrYq
         IopmDUips10zrk2dIB7pOPMD5ZyZoBrRHFR9x1NRGPLDodGkHmaypZjmaS+UPZ9njqSj
         WewEZg6cvkKkzJnblxvwH3wvImjoSAJnVZA3qylOvyhTdPk99v0Q39yFK544RTpyVyP3
         EClYctEBbOR73BQ2O4T3MOAHCai6DWASPDhvucfWIkJ+UyhdYu2qpjKzXtofLoVTONJe
         KPbZCqNDz+pRxsyQ6qgZ7AIu2zNApKQp+E2biFKIg1ZkDRSExaKzbmeAtI67PIoz/6XV
         kDiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695820936; x=1696425736;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B4t8SMIb+aaRBITzGumRvFCVICUhpBpI6WIpWYOA324=;
        b=pQ9ERxclhWD+quH3ZsTs2jlCSLmGuOD+FQDnMSuDHFcVcGHczvbzNy6ZydNkttQA8Y
         l0KA/0z77RJ58nD4QRhsqgOgwwYL0TUdRDM+TsyU4/iHm88lFIgobB6lbmvcKucW0PxC
         KEU7RmXSEMNWOwsUal0y+nAk221s/4siE/TOmn29wBOVzZIvi+0Jp5CrI8E+Kcrz5K9b
         UVPX9QGNIFPJao4giHPyYBlZsitfDD7vV/edr+bBPutBYB4NIb5LqyVQK9tWaboJMrVg
         LtwGNpA3V9p5SxUrmO/R8hYNwrob9nU1wMp1Bh54dgiRYebEUBzeRECb5PYkWvqKJIC3
         xgEA==
X-Gm-Message-State: AOJu0YxALtIZd383y8rdTKgp8oL9JMZn34SWklff4LbjWkAV2zoMBlSK
	QOt++8xVlkYgtWns7a2ryYdGCA==
X-Google-Smtp-Source: 
 AGHT+IFqrcn5hr4kRIJXh34PCTleWf76T9zn8n1G+X6t7JwnKWOk356wLHy7eTKPvvtXc9qvv9gXFw==
X-Received: by 2002:a5d:6388:0:b0:321:3c37:ec81 with SMTP id
 p8-20020a5d6388000000b003213c37ec81mr1765749wru.10.1695820935706;
        Wed, 27 Sep 2023 06:22:15 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id
 d29-20020adfa41d000000b003197869bcd7sm12045469wra.13.2023.09.27.06.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 06:22:15 -0700 (PDT)
Date: Wed, 27 Sep 2023 16:22:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: wangweidong.a@awinic.com
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	perex@perex.cz, tiwai@suse.com, shumingf@realtek.com,
	rf@opensource.cirrus.com, herve.codina@bootlin.com, arnd@arndb.de,
	13916275206@139.com, ryans.lee@analog.com, linus.walleij@linaro.org,
	ckeepax@opensource.cirrus.com, doug@schmorgal.com,
	fido_max@inbox.ru, harshit.m.mogalapalli@oracle.com,
	liweilei@awinic.com, yang.lee@linux.alibaba.com,
	u.kleine-koenig@pengutronix.de, yijiangtao@awinic.com,
	colin.i.king@gmail.com, trix@redhat.com,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V5 6/8] ASoC: codecs: Modify the code related to the
 property
Message-ID: <ce82d523-dc8a-4d04-8762-6cc6d5d3478a@kadam.mountain>
References: <20230927121634.94822-1-wangweidong.a@awinic.com>
 <20230927121634.94822-7-wangweidong.a@awinic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230927121634.94822-7-wangweidong.a@awinic.com>
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 4GVNTEY672VM5FT5X7RID5ZZ76KZOTW6
X-Message-ID-Hash: 4GVNTEY672VM5FT5X7RID5ZZ76KZOTW6
X-Mailman-Approved-At: Sat, 30 Sep 2023 08:07:27 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4GVNTEY672VM5FT5X7RID5ZZ76KZOTW6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Sep 27, 2023 at 08:16:32PM +0800, wangweidong.a@awinic.com wrote:
> From: Weidong Wang <wangweidong.a@awinic.com>
> 
> Change "sound-channel" to "awinic,audio-channel".

I'm not super happy that we are doing part of the sound-channel rename
as part of this patch instead of all at once in the same patch.

> Change "aw88261_smartpa" to "aw88261".
> Change "sync-flag" to "awinic,sync-flag".
> These changes are made to align with yaml files.
> 
> Signed-off-by: Weidong Wang <wangweidong.a@awinic.com>

regards,
dan carpenter

