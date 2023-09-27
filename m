Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3717B3F03
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Sep 2023 10:10:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F517E94;
	Sat, 30 Sep 2023 10:09:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F517E94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696061411;
	bh=r1S8zuj5RE0h20wGs3X3w42cEbms3UFCaW0sq0bq254=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IVd9uC1IHU0H485RdQZvs3yJ+VW0yTPKQc+BFVXzjttSKm2HBlvyPKhMG5M5KHrV9
	 TcvrIAHdY7IhmpwN4OvzdkOll69vH3yANdIKVU5ADr3jRu9ok83wNsTGw9LWrzp67Q
	 TpVZ0CCySQpNxggzXzQqAcYgow9EA3jkTkTYIyzs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0ED19F80681; Sat, 30 Sep 2023 10:07:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A8C4F805F0;
	Sat, 30 Sep 2023 10:07:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 12748F80166; Wed, 27 Sep 2023 15:13:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EF296F8007C
	for <alsa-devel@alsa-project.org>; Wed, 27 Sep 2023 15:13:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF296F8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=FumfOgr8
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40572aeb6d0so75965165e9.1
        for <alsa-devel@alsa-project.org>;
 Wed, 27 Sep 2023 06:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695820381; x=1696425181;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LjEJIhDS4gJpPQVa0J4l2zKN5/ndNnbpVlOxJdWLqKM=;
        b=FumfOgr82Hf1NfQMH22KGeJ0CQHxDoFH5vtxKCmSRvcRUccqGXxFlvykaMw+EKWRi2
         zAorQTzJElwns8JRAqCB8gqbMSql7AL0cAjlnXKH1cvzYA5CyYO3iNPM1wY3oy6zveVj
         1CkbJ61+40fofhxz9GhNM6qLZEQ9JJ5NL/Jst8DyLmn9WWlZDrc0vNVYhC2ZqhpmRE5Z
         ccI33GoEgI9BqAwf+eH7QBSoWHaGC0KRwyUV/F4QQVjQ/dcYC6+lw/2f1Py6A4f2ADmq
         Wqn+NIGupke6VQsUfSZoqIK3hDM0G755oOY6wWsfMSP1V9SYVbufJSH5HV8btBRcWetJ
         uKmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695820381; x=1696425181;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LjEJIhDS4gJpPQVa0J4l2zKN5/ndNnbpVlOxJdWLqKM=;
        b=ZEE5a9s256Px5jiJ48aSjpMCQjMc74Ams3Wgn1oWzDQbX3aebjhoW/Lf1lH2S7W0Vo
         JD6fkFy3x3bErBDoYFxBAHfL54WvYP6wWOVyzinnpeYgqwTzRI4lt08X9h/tEm0yNPax
         Muv7544YmT8vkedoEz7m8kBQALg1QARnn+RvCPwSp9w4HzXCNRX4gUicOfqO+VvmRC95
         1YaC8Om2ZyQIX3jsVDD06C3b7zE141uLuVYmDdRfsvdTiJ6S9pT0ClkUQnvj+SJPcUIU
         iMmxM2s8fm0iVINccIBx20q+Y75Z4+g7AEltYs7lhj1HJ+dD0GWLnpxBi/uEiP5J18y6
         fakQ==
X-Gm-Message-State: AOJu0YxhzRadU0l9C8ssZJtGcsMlKLOtbsckrWz/i1qng8wVGfn8V/UC
	Zg6JFL0Gx4Kdq4+c/lSjEnDiDw==
X-Google-Smtp-Source: 
 AGHT+IEwVtUCx/Tt513h6sD4GTqmeMlw1bFudbkMznlk83J31/qYCbn5yBepxFngnTxWI51kMnSPpA==
X-Received: by 2002:a05:600c:2604:b0:3fe:d1e9:e6b8 with SMTP id
 h4-20020a05600c260400b003fed1e9e6b8mr2086160wma.12.1695820381191;
        Wed, 27 Sep 2023 06:13:01 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id
 y1-20020a05600c364100b003fefe70ec9csm1865074wmq.10.2023.09.27.06.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 06:13:00 -0700 (PDT)
Date: Wed, 27 Sep 2023 16:12:50 +0300
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
Subject: Re: [PATCH V5 3/8] ASoC: codecs: Modify the code related to the
 property
Message-ID: <c442a175-f04f-44ea-b7ee-a6de81963f4c@kadam.mountain>
References: <20230927121634.94822-1-wangweidong.a@awinic.com>
 <20230927121634.94822-4-wangweidong.a@awinic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230927121634.94822-4-wangweidong.a@awinic.com>
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 3WID5NGKQVUG73UA2LC2MFWKAXPYYWMZ
X-Message-ID-Hash: 3WID5NGKQVUG73UA2LC2MFWKAXPYYWMZ
X-Mailman-Approved-At: Sat, 30 Sep 2023 08:07:26 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3WID5NGKQVUG73UA2LC2MFWKAXPYYWMZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Sep 27, 2023 at 08:16:29PM +0800, wangweidong.a@awinic.com wrote:
> From: Weidong Wang <wangweidong.a@awinic.com>
> 
> Remove the "fade-enable" property because other properties
> already implement this functionality.
> Rename "sound-channel" to "awinic,audio-channel",
> this is to be consistent with the "awinic,aw88395.yaml" file

This feels like it should be split into two patches.

patch 4/9: remove the "fade-enable property".
Btw, which other properties implement this.  Can you add that to the
commit message?

patch 5/9: Rename "sound-channel" to "awinic,audio-channel".

regards,
dan carpenter

