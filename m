Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A17861A9D
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Feb 2024 18:52:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7CD393A;
	Fri, 23 Feb 2024 18:52:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7CD393A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708710730;
	bh=9iTKsLd2naG6/LuO6Oah0bN0yvaYH3+/7aYFeVuI/cs=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=VXalQpRd6aUmK+8d6zhISTZCLd7mxnk+UduUn97DBUnTIZbIxAPmtNWRXTRkT1ZI8
	 6ikLzFbM1Hi7530hvhI22eQXG3oSN3BDVn1/5+ztrp+tUFlPlyeKFZxQ79466fLCYB
	 wChEfZkvKwTYRCJ29SEXuEwHE6/8/pkcmK9VGips=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4AB84F805AF; Fri, 23 Feb 2024 18:51:37 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EE4FEF805AA;
	Fri, 23 Feb 2024 18:51:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C354BF80570; Fri, 23 Feb 2024 18:51:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 010EBF80104
	for <alsa-devel@alsa-project.org>; Fri, 23 Feb 2024 18:51:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 010EBF80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=I/krR7iD
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4129015c31eso7909935e9.2
        for <alsa-devel@alsa-project.org>;
 Fri, 23 Feb 2024 09:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708710681;
 x=1709315481; darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yu1bwk/GIByUriwvGbqNE3H0ftJWcJoKT333Tzyi/Co=;
        b=I/krR7iDhLeSzg2PKveEU6qJpwH30a7OcIDEs50EeraNNCp+/IsmTd3KNoIldVlfcy
         QrBwLV4HE/u9kqdw4q23vuDnThDPL0379FxqUldjgTDbwFJABWtO6bTw+3iaSPVw3HJ0
         xq2DgQyf8OJLOgJDUNPqrVouehe+onIqnJuVqcd8Ilm/BbEBMvLpaGVNC6+VwpbHoEaa
         kPBEcg/Jk5n4ujwI27wFElN1kNJ777lqx6VqZm242oMzUcZVUygy3hXqhihAo4LEcPPD
         SgswnnbHtMQbH3TUk4cGlqgbmrjijdmJ8UXGluO30IB0NCJRASgvuDw7UXFAYWuVjfiR
         zH1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708710681; x=1709315481;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yu1bwk/GIByUriwvGbqNE3H0ftJWcJoKT333Tzyi/Co=;
        b=euZ87RlNQkrUt5rqAkPCx3G2i0bG8FcGWOzdwYK0P6GtXDLcDLiDojLGhkNrd1QfO3
         rR4xbmlrxdHpC8HT3QdRZqmfFDuvRb2iyhTfvVDYkzdhDeFdMur66bQZjHLS12L+ZPZt
         icDlgdL5CjZTrGbV8UB85Y/rJWxNUzH3riBHG1kIeAV6Y29BPkddf2aGXhl+uuV2v+ys
         HM8RqLDTImbO9hn+OkAQ6YVFYODHLHKTifOp3T+ySuFliaZ0m+CGPpjOcxQPXmIrRa9W
         8VQVcXEsWdMXZYuRBoWOHSFw4tFNG40wQmSqVBWf2HMfcvbm54W83Dwu8DuQ0bXgyinI
         YdcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQqmrBQTxv37DosHEIdo0MWaHQJLcPeeDzhRYQ9C8xwZD7HGcBUm2JepQg/nGTBC7SFyhO6uknrPt9d6EG7frhZcWir49Cljq58Rs=
X-Gm-Message-State: AOJu0YwPczDY2OSnbvnAmLfRIq5NEgmwBooAuEU1lXRJurJDmz+KkHks
	+9ad9mSBZyUADFe5VV8iSWXGEWOCe9lhzohbdXICVZRvdRkdzqgYKAv25xmRW2Q=
X-Google-Smtp-Source: 
 AGHT+IFkYJrBJtukK9q7sO/gOkuklYt7sfbCdKw6TBDgo/yenxFPlAQU3wk00xs7vV/eLiTHDjjHeA==
X-Received: by 2002:a05:600c:1e13:b0:412:94b6:bb75 with SMTP id
 ay19-20020a05600c1e1300b0041294b6bb75mr362379wmb.30.1708710681574;
        Fri, 23 Feb 2024 09:51:21 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:e8a0:25a6:d4ec:a7ff])
        by smtp.googlemail.com with ESMTPSA id
 bo10-20020a056000068a00b0033cddadde6esm3711524wrb.80.2024.02.23.09.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 09:51:21 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 0/6] ASoC: meson: axg fixes and clean-up
Date: Fri, 23 Feb 2024 18:51:06 +0100
Message-ID: <20240223175116.2005407-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6AIVBUDDUOHD4G6XP5BB7SKNV6W34SAW
X-Message-ID-Hash: 6AIVBUDDUOHD4G6XP5BB7SKNV6W34SAW
X-MailFrom: jbrunet@baylibre.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6AIVBUDDUOHD4G6XP5BB7SKNV6W34SAW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This are various fixes and clean up gathered while working on Amlogic audio
support. These help better handle higher and unusual clock configuration
for TDM, SPDIF or PDM.

Jerome Brunet (6):
  ASoC: meson: axg-tdm-interface: fix mclk setup without mclk-fs
  ASoC: meson: axg-tdm-interface: add frame rate constraint
  ASoC: meson: axg-tdm-interface: update error format error traces
  ASoC: meson: axg-spdifin: use max width for rate detection
  ASoC: meson: axg-fifo: take continuous rates
  ASoC: meson: axg-fifo: use FIELD helpers

 sound/soc/meson/axg-fifo.c          | 24 +++++++++++-----------
 sound/soc/meson/axg-fifo.h          | 14 +++++--------
 sound/soc/meson/axg-frddr.c         | 12 +++++++----
 sound/soc/meson/axg-spdifin.c       |  6 +++---
 sound/soc/meson/axg-tdm-interface.c | 31 +++++++++++++++++++----------
 sound/soc/meson/axg-toddr.c         | 29 ++++++++++++++-------------
 6 files changed, 64 insertions(+), 52 deletions(-)

-- 
2.43.0

