Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66229791E2E
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Sep 2023 22:23:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1801A7F1;
	Mon,  4 Sep 2023 22:22:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1801A7F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693858981;
	bh=fIdGcDEg2RFpVY8/WSXPv+0h5xxmY9R8V3wRWCGVCYQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=it6BeamW+U/UAgCeEhv/RnV3QYnNhXFQ3CNiULeGVpCEjB0hjPcX/QB9nbYjSoRIZ
	 CQOGeXC9cwAMIQluSwpH+aqOOg0P8tQ4+6gtwvpsF5iShVCwAURtp88K+GBYb3XNJQ
	 0XqYW/XRFdRdz67Y2DShVmTVbIHvKMIFiJILzO34=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 88F37F800AA; Mon,  4 Sep 2023 22:22:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1580BF80431;
	Mon,  4 Sep 2023 22:22:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6A5FFF8047D; Mon,  4 Sep 2023 22:21:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9FB58F80141
	for <alsa-devel@alsa-project.org>; Mon,  4 Sep 2023 22:21:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FB58F80141
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=DHXBU29B
Received: by mail-yb1-xb36.google.com with SMTP id
 3f1490d57ef6-d7d15e6884dso1374697276.0
        for <alsa-devel@alsa-project.org>;
 Mon, 04 Sep 2023 13:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693858904; x=1694463704;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fIdGcDEg2RFpVY8/WSXPv+0h5xxmY9R8V3wRWCGVCYQ=;
        b=DHXBU29B3hwg1Ha07pq8QBrhrcodoCqXMFC5LYqm5eKMPKMZ3HrZm2LqN0jb/LRPow
         /roDXuHcI3CVbifOTP1N8YWv3zrK7SfRJjVyunhdntFATl7eeWPKWCPkOvppt3/ztB67
         NTOmUMR/30OSLsmkptKNwvsSSXXAFWaJP0qYGxFSB5ChyR50rLA1nDzn+sFDXRvDa1tf
         7vaWiZeHDVLvfp8li3KR7biWSj8255Pv/hkW1rykbsm2d9Ye6+GcyMSyid4t+R5BiI9h
         XBAXqTG9u/8xPFYSRfqIBm+fUnFHDm1qAGLxQaIHwsarFP0ckrY3wXVVy4cBFvHYM58t
         7HFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693858904; x=1694463704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fIdGcDEg2RFpVY8/WSXPv+0h5xxmY9R8V3wRWCGVCYQ=;
        b=hKVASuoiJwAUWfHZ8rTILvE+EtPIYRdsT7pds3Efccsf9sUvd8QugOzaaE2yYvJhxG
         3yXhOJSvWnyEmwOLdn+mgX0FYwwrqkl+yOiT4LEdg/1QwXJRnhiLsXKKizUZQX1UzrS8
         1Xw4jcwEJHToJtCOD+DAhBL7fCUKKJ4xe5g9wtshoGE0KuoUrcL86ufOufAotUkWO7p8
         b+Ih/FFn4g74QVaTgLtLKpkyPr8tottZikntCvRMazD+QMSOZbeaj4u1Iy4DRmJ1WiB3
         tgnAyRdhjx5a8CRrtPafzegqtHr8hZvsVXuy7RTA0JsOFIb7X32zjOuvZDuc0JMQQRGV
         e2bQ==
X-Gm-Message-State: AOJu0Yw77VVbJ1AK5nLwzsvztgI8ZcLc5CpXPWAN0KavTijnFJcORH6K
	JIQL82KKAeC7IuLNu5UI8ZBFkUtOtmEQbJu9lyrODw==
X-Google-Smtp-Source: 
 AGHT+IEzdDqxXs9QZDSllPejOTay+Awx9NDl2MJSCZD3I3yUhS5JtosXX53OvrRtmVX5RO7qxnOT9Utgiiu/XFH+ve0=
X-Received: by 2002:a25:e6c4:0:b0:d4e:3ffe:79d4 with SMTP id
 d187-20020a25e6c4000000b00d4e3ffe79d4mr10203380ybh.61.1693858903883; Mon, 04
 Sep 2023 13:21:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230904114621.4457-1-wangweidong.a@awinic.com>
 <20230904114621.4457-4-wangweidong.a@awinic.com>
In-Reply-To: <20230904114621.4457-4-wangweidong.a@awinic.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 4 Sep 2023 22:21:31 +0200
Message-ID: 
 <CACRpkdZ8Q0hWx5GLsJR+kmnkF6cMwY-ZJjePX5WO3qmXv8uJzQ@mail.gmail.com>
Subject: Re: [PATCH V1 3/3] ASoC: codecs: Add aw87390 amplifier driver
To: wangweidong.a@awinic.com
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, perex@perex.cz,
	tiwai@suse.com, rf@opensource.cirrus.com, herve.codina@bootlin.com,
	shumingf@realtek.com, rdunlap@infradead.org, 13916275206@139.com,
	ryans.lee@analog.com, ckeepax@opensource.cirrus.com, yijiangtao@awinic.com,
	liweilei@awinic.com, colin.i.king@gmail.com, trix@redhat.com,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, zhangjianming@awinic.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: AQV4O4DI7ZDDUZDYG4JSJHARZNXQIQRE
X-Message-ID-Hash: AQV4O4DI7ZDDUZDYG4JSJHARZNXQIQRE
X-MailFrom: linus.walleij@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AQV4O4DI7ZDDUZDYG4JSJHARZNXQIQRE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Weidong,

thanks for your patch!

On Mon, Sep 4, 2023 at 1:47=E2=80=AFPM <wangweidong.a@awinic.com> wrote:

> From: Weidong Wang <wangweidong.a@awinic.com>
>
> Add i2c and amplifier registration for aw87390 and
> their associated operation functions.
>
> Signed-off-by: Weidong Wang <wangweidong.a@awinic.com>
(...)
> +#include <linux/of_gpio.h>

Please do not include this deprecated header.

Also: it seems you do not even use it so it's unnecessary.

Yours,
Linus Walleij
