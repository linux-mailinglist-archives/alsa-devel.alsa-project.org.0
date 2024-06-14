Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B7890C342
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2024 07:54:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BC6E86F;
	Tue, 18 Jun 2024 07:54:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BC6E86F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718690065;
	bh=LuXmN9tx1+9vM/aOgvWFhrlm3ooXyRad8K9vUy2MI7U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qqh9YaJen35W6PDDmzg2CvOKQUHB29tnzgcamS2557Q3rlWmtjM7L8L8tVTIO+rdd
	 XseiasqZi25Sy8Z6D0sIhVI4ELSQGujqAPzUH8I4IUOqas6btSPFR5oWKnLVZmL5hZ
	 g6GTEUbc6BDhYXvpi6OfZkjEk9FMVv1tmSaUUqw8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C69BF805B6; Tue, 18 Jun 2024 07:53:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1078CF805B4;
	Tue, 18 Jun 2024 07:53:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 50585F80448; Fri, 14 Jun 2024 18:35:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2438CF800E9
	for <alsa-devel@alsa-project.org>; Fri, 14 Jun 2024 18:35:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2438CF800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=timesys-com.20230601.gappssmtp.com
 header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=mx0ju5oX
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-57a44c2ce80so2798707a12.0
        for <alsa-devel@alsa-project.org>;
 Fri, 14 Jun 2024 09:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1718382916;
 x=1718987716; darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SYP4VucbC2/Jnuz/5Y5TpJxKEc0YEshxNGoLKrFr67Y=;
        b=mx0ju5oXE09xqEWB/XI77d33YSFHCidmEBequMFaFjI6k4ufMClW334n1rhG6X3ct0
         W1NLXfi5ZWsqEgkREiDTYMaNSBCXXsKToM2TOwVjlgtjz/IFg/nzDxbOUdgfPHObUOtn
         +6x6Ce8z6IuUZuoLlBkaNLq17Go7w5oVPdmCvrlKwJ29p+tz3K4iw7mn8fBCfXrO3m87
         hCuI3IEuMqgytMHmzall/wzS/ZBkSs4iIbZSuKMnALaPkVSHrNCRI5+wTQPVOordkYWQ
         wkU4BUBzCTfOs1Xq+/CEI+s/psRbQOeCnghHBsWYMhswyFhS7X6XSMfacGKf8vJbawOB
         TOdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718382916; x=1718987716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SYP4VucbC2/Jnuz/5Y5TpJxKEc0YEshxNGoLKrFr67Y=;
        b=s1akym0UeowS8K5xBRgsRihTouhcj1i9HBUolLaJvjEp30qVc9ExCQwpN2GNPyKM9L
         qZWBwg6e/t5Ctm2pHdyHv6cL07FN4Zzxw9ot+JG8kuk3hb0kCsMGOCbuiscSPHGXwO++
         Km8OdPpMl5nIlhlk61FHPrPzZN9YKImkGcFWPFreiIJuNME8bwdV4SGgXBsJLAFkD0TF
         3nlyXUUSM3vBW4GaQ55utEw/MzfkLalX5eRVm/4c/GwwoMeR4k5ozvihcVmllrov5pJg
         jZAzVH9BWCZFQAoPCOPb5XQsjZw+WPhJQZL4hr6lBE842L7+pzl51TK9YP8+rkCFU89N
         0JvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3/BSlzV0+nsAqlKB/HfeWI9i8JgGvMNzgGDDo8D9iGIgM2r8vodG1qvNEa3g7bIfMMPuKLALX4YMqszb7Ibf9KGKlRNbZcz7dHAo=
X-Gm-Message-State: AOJu0YzkcVdGU84ICOuYLb9f5ggrvsGsiExL/PihYqb9Ayqjv7Y4xrBG
	Zs8hmoYhOFxHdatxDcwt0sMR5wCllsOUHbVDqZ1Y30VfQkAl5BAkNgF0cKDXbF0=
X-Google-Smtp-Source: 
 AGHT+IFQDhA6L9B70v4e6G80Nc6QL8RMeX1jv/kC5wcXSX1xgpnIA6zLuA7OULi82c0Ut96o3OIgbQ==
X-Received: by 2002:a50:a6ca:0:b0:579:e7c5:1001 with SMTP id
 4fb4d7f45d1cf-57cbd68ffe3mr1913077a12.23.1718382915504;
        Fri, 14 Jun 2024 09:35:15 -0700 (PDT)
Received: from localhost.localdomain ([91.216.213.152])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57cb72da156sm2462893a12.22.2024.06.14.09.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 09:35:15 -0700 (PDT)
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
To: 
Cc: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Russell King <linux@armlinux.org.uk>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	"J.M.B. Downing" <jonathan.downing@nautel.com>,
	Chancel Liu <chancel.liu@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 0/4] Add audio support for LPC32XX CPUs
Date: Fri, 14 Jun 2024 18:34:48 +0200
Message-Id: <20240614163500.386747-1-piotr.wojtaszczyk@timesys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240611094810.27475-1-piotr.wojtaszczyk@timesys.com>
References: <20240611094810.27475-1-piotr.wojtaszczyk@timesys.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: piotr.wojtaszczyk@timesys.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: SEDQJU6DUKNODLAWIB6LTJDANYO6XBLN
X-Message-ID-Hash: SEDQJU6DUKNODLAWIB6LTJDANYO6XBLN
X-Mailman-Approved-At: Tue, 18 Jun 2024 05:28:24 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SEDQJU6DUKNODLAWIB6LTJDANYO6XBLN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This pach set is to bring back audio to machines with a LPC32XX CPU.
The legacy LPC32XX SoC used to have audio spport in linux 2.6.27.
The support was dropped due to lack of interest from mainaeners.

Piotr Wojtaszczyk (4):
  ASoC: dt-bindings: lpc32xx: Add lpc32xx i2s DT binding
  ARM: dts: lpc32xx: Add missing properties for the i2s interfaces
  ARM: lpc32xx: Add pl08x virtual dma channels for spi and i2s
  ASoC: fsl: Add i2s and pcm drivers for LPC32xx CPUs

 .../bindings/sound/nxp,lpc3220-i2s.yaml       |  69 +++
 MAINTAINERS                                   |   8 +
 arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi        |   8 +
 arch/arm/mach-lpc32xx/phy3250.c               | 111 ++++-
 sound/soc/fsl/Kconfig                         |   7 +
 sound/soc/fsl/Makefile                        |   2 +
 sound/soc/fsl/lpc3xxx-i2s.c                   | 393 ++++++++++++++++++
 sound/soc/fsl/lpc3xxx-i2s.h                   |  79 ++++
 sound/soc/fsl/lpc3xxx-pcm.c                   |  74 ++++
 9 files changed, 750 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/sound/nxp,lpc3220-i2s.yaml
 create mode 100644 sound/soc/fsl/lpc3xxx-i2s.c
 create mode 100644 sound/soc/fsl/lpc3xxx-i2s.h
 create mode 100644 sound/soc/fsl/lpc3xxx-pcm.c

-- 
2.25.1

