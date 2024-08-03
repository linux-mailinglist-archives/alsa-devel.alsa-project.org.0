Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C6E946921
	for <lists+alsa-devel@lfdr.de>; Sat,  3 Aug 2024 12:48:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8606647C9;
	Sat,  3 Aug 2024 12:47:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8606647C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722682085;
	bh=8swDYCKlHMm/RjEDI1jjvRnoWAi33eYa7CllXV/57qw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sevkQ1WLoVOsc+1dzXPjWCp7FvH/6kI0hW0/a1p33SF/Bo08MXSJXwL1s4my28tHx
	 2yOdpB2DGhemN8gFxmDpdCH+nbSgEwgiiEkba//wIPirKZdCgnqkdo5nJYK9eR/G7p
	 A4xUdvCXw1nw3sQRCczLIsb+AC4Va6WpRpfWnTgQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 79778F80448; Sat,  3 Aug 2024 12:47:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EB4CCF805D6;
	Sat,  3 Aug 2024 12:47:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C5A8F8026A; Sat,  3 Aug 2024 12:42:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 92FBDF801C0
	for <alsa-devel@alsa-project.org>; Sat,  3 Aug 2024 12:41:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92FBDF801C0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Aqq5fypB
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a7a843bef98so941684566b.2
        for <alsa-devel@alsa-project.org>;
 Sat, 03 Aug 2024 03:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722681707; x=1723286507;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h2P5CUm71nRXIdibIz1zY1EQPaX8kSIUbjLIcJ8FN4Y=;
        b=Aqq5fypBDZc1c2jmta3B86PLBdD/Kfy8QRA7PIiBwHU+dB1zUXkam82bcHZLGDge+g
         mUTnyYugbSaFLekpBV1X8cv/5hW/vS5AwFzl/F3S+1BZ43oYqjHqqa/zBtzSQAYNn5V4
         lm3O5s1y16bOduLM23jO9/zII8AdFGLh+LwetmzTzZuoCc9WIcN+beQIEhGFpU6cnrDq
         H38CNh54ULwXNvedslAOVQyK7prqRerEL9HPaeBC/nkoEpf3AyiUR4cD3MCDJQvU54ls
         qonUHs6eG9uyL4082qKQ8xGNQzCcsCbJzVQ3JUxCrv55FvLvxgsUHC6gdQgNwayLLjlP
         hqhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722681707; x=1723286507;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h2P5CUm71nRXIdibIz1zY1EQPaX8kSIUbjLIcJ8FN4Y=;
        b=QIhR3RiuBmbDajUSHK4jUTJj4P+K9jGltv/L/P4MTsCof8GuDAjzwWr6yXoanKZitP
         4PdbciDcLOeb7I08P4LAvJZsUhgilAuD6UVWokFXgS51M2MpoBIwnKP6f10L5DRrcLZo
         /Exp83s+mhPD0vtmT/dtKxhrIcsESB3LqwKAzP8ZZElfp4O+O6eWqugBX9Sk4AO2V7dN
         +nrsV6JLAmVu+rMceBPehncpJGn7cdut0jNQNKlOj/JxXQq5OfodLftppxEkHblWGkIc
         4PnIYPB3tkDhnZPeHQZWgpAv7Uy6h2d++37ALf6pyJX4Df2I3He0lLEXzmWCdAEroh2Q
         QOFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVekL18oHaXcTzmAkOatiwnA47Pr0wljzKUIRQpC7v8xfWI5gurkjmfs1mHbJgmVDo6VrZsOWIX27Box6sOhLmKYawhr7EAF9hS5DM=
X-Gm-Message-State: AOJu0YywFeRlJgrTplTf0jYXmY8JHNu1e+H6RoMHhaSHQ/kU5tRDxckO
	NXAKHy5F7RsOgG10dwVeFil7CDBxDSOwG78gcoUiUFJUHMlQ/2cmykfIKYFbe7U=
X-Google-Smtp-Source: 
 AGHT+IGx8JIglmqEtvVOloITy2p1V5U6PesAEG1DHceXHVPF+dkLXz1ocl5KFlVXTMxUWNwK3835aA==
X-Received: by 2002:a17:907:6093:b0:a7a:a7b8:ada7 with SMTP id
 a640c23a62f3a-a7dc4df97f8mr402428566b.24.1722681706827;
        Sat, 03 Aug 2024 03:41:46 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9e7feecsm202086366b.176.2024.08.03.03.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Aug 2024 03:41:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 03 Aug 2024 13:41:41 +0300
Subject: [PATCH 2/2] ASoC: codecs: lpass-va-macro: warn on unknown version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240803-codec-version-v1-2-bc29baa5e417@linaro.org>
References: <20240803-codec-version-v1-0-bc29baa5e417@linaro.org>
In-Reply-To: <20240803-codec-version-v1-0-bc29baa5e417@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1126;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=8swDYCKlHMm/RjEDI1jjvRnoWAi33eYa7CllXV/57qw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmrglnQf2eSPxhCPoW50YyCE1b+UmchLkcoNa1+
 dvwTlj910+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZq4JZwAKCRCLPIo+Aiko
 1VfsCACUeTsaUC8cUzv19Lh7pPQnhShgpW6Nj2314n5dvpeCHe4zpggfLbi8sxpB6rdB/mz6e9H
 ILm68xJuIZXE+HtM5m0JwHucNwU7sNeTWqPL/vhcgNKyH4jZeoyAHwMYutMqkeXoIuspg36KcU4
 nMqEIszCdROdPeJ7pzaXs7pP05lW67SDv9bJi6u4YTCPIJuhlMVcpEl7nEWKHJ8xbRsDghHhf0T
 sQM/WWIddmjWKwEG298mvWjM6wsDDjfMLlSMkmH65C+EZctbnxD+EijiFMdjHhpRN6wJ0qUDUMr
 OhV4HE4+/VdZBtnQLKlXKDH9paR4HGoCR8FGMNvgSJPsfQxN
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
Message-ID-Hash: 5A6HO4WYA6VNDKO25OW3RW26JJVMCUQV
X-Message-ID-Hash: 5A6HO4WYA6VNDKO25OW3RW26JJVMCUQV
X-MailFrom: dmitry.baryshkov@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5A6HO4WYA6VNDKO25OW3RW26JJVMCUQV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Warn the users if the driver doesn't know the codec version. This helps
in debugging the issues with other codec not detecting the correct
version.

va_macro 3370000.codec: Unknown VA Codec version, ID: 00 / 0f / 00

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 sound/soc/codecs/lpass-va-macro.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index b852cc7ffad9..cdc090418d74 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -1483,6 +1483,10 @@ static void va_macro_set_lpass_codec_version(struct va_macro *va)
 	if ((core_id_0 == 0x02) && (core_id_1 == 0x0F) && (core_id_2 == 0x80 || core_id_2 == 0x81))
 		version = LPASS_CODEC_VERSION_2_8;
 
+	if (version == LPASS_CODEC_VERSION_UNKNOWN)
+		dev_warn(va->dev, "Unknown Codec version, ID: %02x / %02x / %02x\n",
+			 core_id_0, core_id_1, core_id_2);
+
 	lpass_macro_set_codec_version(version);
 
 	dev_dbg(va->dev, "LPASS Codec Version %s\n", lpass_macro_get_codec_version_string(version));

-- 
2.39.2

