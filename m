Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F40C954545
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Aug 2024 11:14:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B1602BD0;
	Fri, 16 Aug 2024 11:14:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B1602BD0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723799670;
	bh=uvPfs/sxceMFOcpt6ca5ZNnxd1WJmw0aOuCls/fF4tk=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=LWDPf0eDFlIDrwWl7fiphkPPLMWoh/g2jgJgUPBewA+WTE1V1RdvTNKmPaNf3nj3x
	 EYknmbghRwVMhjhrrlvEi/nf0R2CTuKCCT4WxbP23ra3SSRn9biUelzv7Bg3tNLrvl
	 d16oGVsy24lLEN4HkLlcUuibrrRtF50sGGIwSVsU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04020F805A1; Fri, 16 Aug 2024 11:13:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7706DF805AD;
	Fri, 16 Aug 2024 11:13:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03B48F80517; Fri, 16 Aug 2024 11:12:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ADDF6F8016E
	for <alsa-devel@alsa-project.org>; Fri, 16 Aug 2024 11:12:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADDF6F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=hpS16x0R
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4281faefea9so12103225e9.2
        for <alsa-devel@alsa-project.org>;
 Fri, 16 Aug 2024 02:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723799541; x=1724404341;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WllYCtmCZzHsMxTLdu431wvQusgsnPG7xw41l1l/SJI=;
        b=hpS16x0RJdf1b+KyhTrih0RitLtOZpAnZjQlIH/ZI3pCItc3LkSmrGDPiWsoly7qVV
         euhd/Ykyz+DQ/hPb4VTQu40Q8XlS/DUISfcSGm43+7sLS5ZWQSB9OOa5/ekS+buBfYjE
         9U8SH5zHSgj8cJHyfXBRIVU6Z3iRFPXDM1NfGywfPdout8Zd9mrP+yEdOssPPoe4+ep+
         /odzIWllskIksHpmqngLjlDCRlvFgzQUkgnFPNhZ1oWZoSOx8KqSqg9hebswz2y0Po/F
         ssYWkmxwZK83UAEod8s3I5b9q0pkD0K4dOzzu2ilOQKhwcS/rEZL8ZLjADP72XPByOM5
         KapA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723799541; x=1724404341;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WllYCtmCZzHsMxTLdu431wvQusgsnPG7xw41l1l/SJI=;
        b=eNLaZnOnW/NNmGZpmYATuR4MvUJKf4GWOQjvU1I4o6yY97JRG+hiCWjt36HhIhp0nz
         +W4WtqShDRQ/H/qrnT8NkpAX/brMZPDBrMViObaWk1k9LwScHpoYWm5S2lyMz3vV92g9
         d6XT7dv445ESIptm5EwW+algMehDAZl9ZwzUOX2rPLtwbMo17JS2hPdHbYgYq5Fs/+kZ
         PmrGGbVZeo1XJ3xMkgTIwrvPGGidObEsSmHApAa+By7oxgcDAqC2K9GqItFih9SuUH9z
         4e73R6Q8any2yLC4IBs6NxN/U07tvKZBRfsUb2MPpIXhuQ7mjDCPkCoYb3QNytjmaOVs
         G74w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvK22jUB/G/51riIdTVFtL8NeQs0D/jEz6HdpVIEV0z3dpJ7t4AK6JDneNynSRrdr+mmi6ZE8x2PlzgZ46+wXSgUZ0Sl/7KpShp5I=
X-Gm-Message-State: AOJu0Yyz/0VcH7whupoNYV3AXOrsqbSLtnCv2W7zjE6JhjU/QJAjzX9U
	VS8lIWn2n9Lr/TWfq2K/CxHoZ6yi+r4nzW99Ve+H5nkzX3kjmYUg7A7xdwOItqA=
X-Google-Smtp-Source: 
 AGHT+IGvQ9bU4HwT1y0LssYKgZiF6iaa0214ap/5xVyvjFPYigK5l5fFUuG/x6CX2HWGTdPrbEznbA==
X-Received: by 2002:a05:600c:3550:b0:428:fb96:e94a with SMTP id
 5b1f17b1804b1-429ed788f3amr15403345e9.9.1723799540837;
        Fri, 16 Aug 2024 02:12:20 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429ed6507c4sm17525635e9.15.2024.08.16.02.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 02:12:20 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	amit.pundir@linaro.org,
	dmitry.baryshkov@linaro.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2] ASoC: codecs: lpass-va-macro: set the default codec
 version for sm8250
Date: Fri, 16 Aug 2024 10:12:10 +0100
Message-Id: <20240816091210.50172-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TI3COSCMOOHFP5MPBMJFZASY24QC7JWT
X-Message-ID-Hash: TI3COSCMOOHFP5MPBMJFZASY24QC7JWT
X-MailFrom: srinivas.kandagatla@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TI3COSCMOOHFP5MPBMJFZASY24QC7JWT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

sm8250 and sc7280 have lpass codec version 1.0, as these are very old
platforms, they do not have a reliable way to get the codec version
from core_id registers.

On codec versions below 2.0, even though the core_id registers are
available to read, the values of these registers are not unique to be
able to determine the version of the codec dynamically.

Add the version info into of_data, so that driver does not need to use
core_id registers to get version number for such situations.

Fixes: 378918d59181 ("ASoC: codecs: lpass-macro: add helpers to get codec version")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
Changes since v1:
	- updated commit text to add more details

 sound/soc/codecs/lpass-va-macro.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index 8454193ed22a..e95d1f29ef18 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -228,11 +228,13 @@ struct va_macro {
 struct va_macro_data {
 	bool has_swr_master;
 	bool has_npl_clk;
+	int version;
 };
 
 static const struct va_macro_data sm8250_va_data = {
 	.has_swr_master = false,
 	.has_npl_clk = false,
+	.version = LPASS_CODEC_VERSION_1_0,
 };
 
 static const struct va_macro_data sm8450_va_data = {
@@ -1587,7 +1589,14 @@ static int va_macro_probe(struct platform_device *pdev)
 			goto err_npl;
 	}
 
-	va_macro_set_lpass_codec_version(va);
+	/**
+	 * old version of codecs do not have a reliable way to determine the
+	 * version from registers, get them from soc specific data
+	 */
+	if (data->version)
+		lpass_macro_set_codec_version(data->version);
+	else /* read version from register */
+		va_macro_set_lpass_codec_version(va);
 
 	if (va->has_swr_master) {
 		/* Set default CLK div to 1 */
-- 
2.25.1

