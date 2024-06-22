Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6A1913426
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Jun 2024 15:13:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A166E93A;
	Sat, 22 Jun 2024 15:13:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A166E93A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719062012;
	bh=fMZOVwSkUO7k/6NzpVr+ymgny6UN69nrUxytY4/yDUs=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=S3OkHB67wQx2E8JdXKUy5dpd4x0Y1Ht2QwLeaM6pgCVs1MsPn3GsDoiXp167Ze2Zk
	 rQhywcnS85l00V1G/z45m6Zqa9zKt/tXVnSb4zHTSK8pVTfQJnew2O9qUYlTOImqtA
	 CvziEWNAw6uebrEpb7FVVP625qhkgpA1qipliApo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29591F80154; Sat, 22 Jun 2024 15:13:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4CDC1F805A8;
	Sat, 22 Jun 2024 15:13:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44789F8023A; Sat, 22 Jun 2024 15:12:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 23AC7F800ED
	for <alsa-devel@alsa-project.org>; Sat, 22 Jun 2024 15:12:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23AC7F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=C8IgvAzX
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-57d1d45ba34so3145904a12.3
        for <alsa-devel@alsa-project.org>;
 Sat, 22 Jun 2024 06:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719061971; x=1719666771;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=OTN5xRdMTo257fXeGJOwcxZkvaWjWVZcWAGIdTJL3eI=;
        b=C8IgvAzXYUkpxT85ZinHBiDKDiaG0IXwLm9fzW4eVoIqEToww/ZZRDRYCssXX9yAiV
         MIS9SHpbiuT4Y8CBlFRPNrndxmnvEoF25jH9mDt7HrcWZ5NuIl18a8Eba3JdszaKGxNB
         18hMtXF/VKqOxfF7qh7tj7ep0Hz3zQwffD7i9qN+9b2JLgKdKL+9ie3iExBRIK9Wr1Ak
         b/g15wSVEVon2OsJfYxKy5V8kYbvf4EzkTcua06Fo8dmh/f0dbBik+sAtfmliDABY1K2
         fOpG49xKFVd3luoHvY8xlyjkkDvRopRjAfwYgFtdT3hLpCgNrDzwVWaYIj+owheEGvCF
         ydUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719061971; x=1719666771;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OTN5xRdMTo257fXeGJOwcxZkvaWjWVZcWAGIdTJL3eI=;
        b=XUXHG94KmJfF/m4XmijSlRHVlVFvW4pbXNvRPGjS8yVnvwwKlyAZwCOmhVrj663wnK
         wVRINN0hjtl+ne3JbN+/7nOC9D3IX24hGYiKD/igHIQcAwyKIA9KRuTYSlcf8bcqNawq
         Sze7J1MAQhzRkfMe4/8P/mQMKr1pMpZshEnx+9RHEfpaZX9Y0fTVhtUU8Lq/Yf41XJGd
         EBvaVm/cThguh4lJUpSBjsPbEsbk0tykjJjzms0UTUOty8lPV6hW0rf8H2VMcAV58AyH
         6VjGjEKYhqIvK0TBrQK1CL1uKsL3PKs0BR49ZzfuT6VuHD35bJQq7jbsUo8SSlHg4ypf
         nlxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW65KUA2aTKjHzESRLMEkYyhIL5U4wrFpaC1sIwkh+qJoZXYZwD2Vnpacoe3exJC6S+GORiwy0oRYdeSeWkdWYu+rH75Id62dLEj/c=
X-Gm-Message-State: AOJu0YyH5w156DQAv3mM1I8GfIzE+mNGGn7+MoP37dPzECsJqaoSnj0s
	1kQPquaJzKeDgrio/UUudPUYePtjUwj+SQtn4HaFZfvkCe1MmBA9
X-Google-Smtp-Source: 
 AGHT+IHB5Bz3teh5Z84HK5+rxEUXquqMp40SWEfL2tioAgJRIcWmyz8qvStURlgdhynjRCjs5tO10g==
X-Received: by 2002:a17:906:d96d:b0:a72:440d:35ac with SMTP id
 a640c23a62f3a-a72440d3626mr8968366b.61.1719061970665;
        Sat, 22 Jun 2024 06:12:50 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6fcf42a724sm197708166b.16.2024.06.22.06.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jun 2024 06:12:50 -0700 (PDT)
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
Subject: [PATCH v2 0/2] ASoC: add compatible for ti,pcm5242
Date: Sat, 22 Jun 2024 13:12:43 +0000
Message-Id: <20240622131245.2607533-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: A45XU7TOJZ4XZ5ZODU5OV7GEF7Y6RZA6
X-Message-ID-Hash: A45XU7TOJZ4XZ5ZODU5OV7GEF7Y6RZA6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A45XU7TOJZ4XZ5ZODU5OV7GEF7Y6RZA6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Update bindings and add a driver compatible for the pcm5242
chip used on the Odroid HiFi-Shield2 i2c mezzanine board.

v2 adds a compatible to the SPI variant at Mark's suggestion
and fixes the binding patch title/description which I managed
to fat-finger in v1.

Christian Hewitt (2):
  dt-bindings: sound: add ti,pcm5242 to pcm512x
  ASoC: Add support for ti,pcm5242 to the pcm512x driver

 Documentation/devicetree/bindings/sound/pcm512x.txt | 2 +-
 sound/soc/codecs/pcm512x-i2c.c                      | 2 ++
 sound/soc/codecs/pcm512x-spi.c                      | 2 ++
 3 files changed, 5 insertions(+), 1 deletion(-)

-- 
2.34.1

