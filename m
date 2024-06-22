Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F23C91340A
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Jun 2024 14:51:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39B64200;
	Sat, 22 Jun 2024 14:51:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39B64200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719060675;
	bh=j5hoJYoMKSeN68PQ+0IMQBerfpAUDkUHtQ+qPa7GUp8=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=vQ7ZDrozYf25E7RTTI5e3t19xDvvg+4m2mX0YgTZe1wk9IQIXIVJUeQhJVrShhYdJ
	 Vx92fO9OQgLrRRY08bN2MwPuZejGoYQheABIedDXaROzAzC3D26pDUXvF5kT4/ZS2O
	 IDxAl7cVboAd652F4adfqDYgOO4j3r95/ZbX9VtY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4A48F80587; Sat, 22 Jun 2024 14:50:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1AABFF805AE;
	Sat, 22 Jun 2024 14:50:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47D5EF80269; Sat, 22 Jun 2024 14:46:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6A434F80154
	for <alsa-devel@alsa-project.org>; Sat, 22 Jun 2024 14:46:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A434F80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Lr7kgi17
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-57cfe600cbeso3414843a12.2
        for <alsa-devel@alsa-project.org>;
 Sat, 22 Jun 2024 05:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719060368; x=1719665168;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=uHeugCYvp8fzC+q2GNZHm0YL0KES8S+qA5+Z5NcvAl0=;
        b=Lr7kgi17wl4pWvTZFnn8wwEDI/xK5iEPqLZmXwAbQQY4h6NCy76KElC3eJiRwj912u
         /MsOyT8RLt3x/8LgOfwTDIuVR1X9ZYPBVHaZ6rkNJVsxxCOcsx0gRiojDw1JauSrJxAh
         Q7A5/ARCKKTQ5fEdpczCJNusx5zE/OqUZtx0VwuNW35Es4mHsq8WEWvbjVrGavj//6R2
         Kv7fyhE1Ddj6czjorx32z8aLIUyALPI0EClzxfOfn+vQCnIm5SJTZWBVzrhcgoXbhoG5
         KDSBTXQa5hEkNJshuizgTzVo4Loo1S5MobP4mjxDOScyYKHSQEfSYwSHNndp53T3ZBO1
         0qEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719060368; x=1719665168;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uHeugCYvp8fzC+q2GNZHm0YL0KES8S+qA5+Z5NcvAl0=;
        b=BZjR5WwXM0TMbmwcrZqjhn9WUvh+YHiw5XlpKu5xtZNxJf4Z7eYspMqcFR8H5wYxo0
         Rqk0kCjF+MRNiGqJX0sjiYerNd4eXTqyvEUs6WblgdWQlnLR4weGygpWs3Gh76ZUAtTG
         HXWb83FxnObyYj6dSBBhuRQ5fV3YQ7HUvJZp5NlR+hNoJVY14f5g7qWcyMtw0YhUHYYD
         L5Z7Kr9t98spYXYVQs7op5EP3cUZ9qTpZ80SzJSmdy/Iox5GwgTSqvDJbqWPWiPbOAWw
         OLpSVAQitDd4l0fQTdnrqybvxDYRNFhi1mqLdIIbCEXu/b58mui1Meqt5zSXUJmm5lsz
         5tVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWE9pUVSlb1i6tJeV8QF0eC6cpAZVmH3/ApGeTnCToaUHsTc4rV8prbcqUeg8jv0GdFpquZht8rWsjjw2919bGZJcqp2IIcDlP/oM=
X-Gm-Message-State: AOJu0YxU7prGoRRsgxx4SKWWy+dtQaznxFtnHfshnT4jiEEh+eQxUWhy
	WClsel4FeWORHV3bbM5hXgHNnXfeViz+L4Bmq0u2uppuJC+ofEEl
X-Google-Smtp-Source: 
 AGHT+IHhU0OmigKaPH5wvUVtPVqpNMfKaC2dTNLFNkgOjpiCVtyhuqi+ngksHV8C90I/5T0QQAt0Wg==
X-Received: by 2002:a50:9f66:0:b0:575:954:7ef with SMTP id
 4fb4d7f45d1cf-57d4bd56636mr9334a12.3.1719060367739;
        Sat, 22 Jun 2024 05:46:07 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57d31f33086sm2122853a12.61.2024.06.22.05.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jun 2024 05:46:07 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH 0/2] ASoC: add compatible for ti,pcm5242
Date: Sat, 22 Jun 2024 12:46:01 +0000
Message-Id: <20240622124603.2606770-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QKYWUR6MOBYE33Y33EDUIVM75MONZ5YE
X-Message-ID-Hash: QKYWUR6MOBYE33Y33EDUIVM75MONZ5YE
X-MailFrom: christianshewitt@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QKYWUR6MOBYE33Y33EDUIVM75MONZ5YE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Update bindings and add a driver compatible for the pcm5242
chip used on the Odroid HiFi-Shield2 i2c mezzanine board.

Christian Hewitt (2):
  dt-bindings: sound: add ti,pcm5424 to pcm512x
  ASoC: Add support for ti,pcm5242 to the pcm512x driver

 Documentation/devicetree/bindings/sound/pcm512x.txt | 2 +-
 sound/soc/codecs/pcm512x-i2c.c                      | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

-- 
2.34.1

