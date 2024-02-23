Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 899FB861AA4
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Feb 2024 18:52:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B956A82C;
	Fri, 23 Feb 2024 18:52:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B956A82C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708710762;
	bh=cyobtDdfcGLm9EgpUOeJh0auXLdMupXD09HbMz5DS7E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HE82md4fmaQxFYE5MyH3Fmks58lAi+Tv7p7M1NtDNdx4PH28sLG5pMMs1CCvfoZuh
	 ibHIOnh/XrVA8dxdtcpIGUOGkfq2YuCVZrH1604sM/Fo3DVi4ZjA35YWqJxxemfoRj
	 PNHJRbH1L3sGkB2glrQTPbszYWvlum6DDjErG2ig=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EC924F805F5; Fri, 23 Feb 2024 18:51:46 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E7B42F805EC;
	Fri, 23 Feb 2024 18:51:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4CD7F80568; Fri, 23 Feb 2024 18:51:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C6C5AF800EE
	for <alsa-devel@alsa-project.org>; Fri, 23 Feb 2024 18:51:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6C5AF800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=qTjQF6RH
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-33d36736d4eso452034f8f.1
        for <alsa-devel@alsa-project.org>;
 Fri, 23 Feb 2024 09:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708710682;
 x=1709315482; darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x5asXBXhtOZ8krhmeWknGrfpLZd9XvhtRWxv+IOZLPY=;
        b=qTjQF6RH3WdraZCVoqNem0dImnGSvO4y3H6wyXC7UWgpOPUMfNXPL5ge6mtVZNed7i
         bYsF2MYbWd17cbrTvaSnHtya8wOZ42jib/ejtQ2kzR8woQRa8wA2q5X/5RZ4sK6oYcfD
         puPYJvvrY2x/fsXEuLqinCv3fgcAq9mtAqtk0n6JMJJU+lRkc0dvLzBthRVSubIm6JpY
         0KO98BicIfCDJApQJXVybZQaFDnhWZWcs+qUInWklC2DuTlYfLRoN2x/KzO5lUkAXsRC
         am9AdrU7ApNHdhq9TNrujZtmimpto5EE/7IjGqodFov1X51JiEJt6dpC1ZFigFEKqCMv
         TuUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708710682; x=1709315482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x5asXBXhtOZ8krhmeWknGrfpLZd9XvhtRWxv+IOZLPY=;
        b=uhWkpwWCJUZ9uV4furw2uDNAkNE/7UGxty55fFnBwiZon32Devefzb088/0tJKwPR0
         vbLqx+F7aMJrOS3b77K1ZqYehsJt9J4RwDuS3dSPbLK/F9p5IQuM9jaVcCSL2QCTyraZ
         ct8XIZNOBpqSJAmeFVDuBIOL4jyG164em+1l7mEOs4Cd10cFe++lq6Z387nbxK9g4gWg
         fOU/5TLFnP5rgU7AdV8T4510FHnJaM+V4vaWbRWtqRcGu0Uqg3UfRMPWBcmP1OVEgnZH
         7SroAmathju3M6YWO1y700877wBz8iu8idAGa8KiZ7lI+XcMD0ADVfLEyWCxMnxf+fjf
         AtfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNuX3YdcAJTnUAgS8pmhWdaNNxNM8tqQ+iJc6LQNmbfZraCh1keWn5RUfgbHyoJEGFhtQImxZVzc1rd8WwxoTblU3ZuPbI6CZfQdU=
X-Gm-Message-State: AOJu0YylkRNsMd1cf1WHRIZWM50XhORz/C5r9bmy4xa29Aw0Uhdbxhrp
	53nxxEVXmMZl0U+63qNaYOcCCQe5IQqjeVol+SFBOvMqDILhoby5AxMKNc4wAnM=
X-Google-Smtp-Source: 
 AGHT+IF55hUqrzLd0OS4Msf5Z4g1J7M8Fx2otOvbUPa75llthqZMYU+z/HGqcEn63wo2SAVnVI/2FQ==
X-Received: by 2002:a5d:6445:0:b0:33d:a440:636c with SMTP id
 d5-20020a5d6445000000b0033da440636cmr343739wrw.49.1708710682467;
        Fri, 23 Feb 2024 09:51:22 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:e8a0:25a6:d4ec:a7ff])
        by smtp.googlemail.com with ESMTPSA id
 bo10-20020a056000068a00b0033cddadde6esm3711524wrb.80.2024.02.23.09.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 09:51:22 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 1/6] ASoC: meson: axg-tdm-interface: fix mclk setup without
 mclk-fs
Date: Fri, 23 Feb 2024 18:51:07 +0100
Message-ID: <20240223175116.2005407-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240223175116.2005407-1-jbrunet@baylibre.com>
References: <20240223175116.2005407-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ITRSFI7UVHCA2JYYWHMVJLXQWOFPLTY2
X-Message-ID-Hash: ITRSFI7UVHCA2JYYWHMVJLXQWOFPLTY2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ITRSFI7UVHCA2JYYWHMVJLXQWOFPLTY2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

By default, when mclk-fs is not provided, the tdm-interface driver
requests an MCLK that is 4x the bit clock, SCLK.

However there is no justification for this:

* If the codec needs MCLK for its operation, mclk-fs is expected to be set
  according to the codec requirements.
* If the codec does not need MCLK the minimum is 2 * SCLK, because this is
  minimum the divider between SCLK and MCLK can do.

Multiplying by 4 may cause problems because the PLL limit may be reached
sooner than it should, so use 2x instead.

Fixes: d60e4f1e4be5 ("ASoC: meson: add tdm interface driver")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-tdm-interface.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/meson/axg-tdm-interface.c b/sound/soc/meson/axg-tdm-interface.c
index 1c3d433cefd2..cd5168e826df 100644
--- a/sound/soc/meson/axg-tdm-interface.c
+++ b/sound/soc/meson/axg-tdm-interface.c
@@ -264,8 +264,8 @@ static int axg_tdm_iface_set_sclk(struct snd_soc_dai *dai,
 	srate = iface->slots * iface->slot_width * params_rate(params);
 
 	if (!iface->mclk_rate) {
-		/* If no specific mclk is requested, default to bit clock * 4 */
-		clk_set_rate(iface->mclk, 4 * srate);
+		/* If no specific mclk is requested, default to bit clock * 2 */
+		clk_set_rate(iface->mclk, 2 * srate);
 	} else {
 		/* Check if we can actually get the bit clock from mclk */
 		if (iface->mclk_rate % srate) {
-- 
2.43.0

