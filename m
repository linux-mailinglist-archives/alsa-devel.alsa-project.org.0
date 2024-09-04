Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E1196C14E
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Sep 2024 16:53:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDD08846;
	Wed,  4 Sep 2024 16:53:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDD08846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725461601;
	bh=voyOYZWjEblOB0Gzb74raxPK2rOaJWiesmUXjO3gSkg=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=bAar3jnOdHv0DciswyWCHUV3S+gTjU+a6zJgjVcMEXm3YYUO6PcIiR3hOb1FNotSA
	 SBH+j5uyqYrT2Pzq47t8cgunACL3ekJkWSTNQA9HwwPE1jgjGvnDa4wwe5v0UKvR+K
	 Qkb4Q6WhYAfJAhV3D/gMUVWAeljqPvK7Z5lSJ9Ws=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2B7FFF805A9; Wed,  4 Sep 2024 16:52:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 772E5F8059F;
	Wed,  4 Sep 2024 16:52:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2286FF80199; Wed,  4 Sep 2024 16:52:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4218BF800E9
	for <alsa-devel@alsa-project.org>; Wed,  4 Sep 2024 16:52:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4218BF800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=EvGT+svx
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-42bbd3bed1bso7464775e9.1
        for <alsa-devel@alsa-project.org>;
 Wed, 04 Sep 2024 07:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725461563; x=1726066363;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=MbOpSXNYVcQhcvwtIzrMQlGRTGRRC7rPZsCeaAArmmk=;
        b=EvGT+svx9ey/AfoKtelWXh1TJu7vFoC03rdBQbHw1+Dy7k9bpLBct2odMEJ2qRJCnq
         2LKf3qCUNcu2wc0DaxSsCcv37STCtb+uigIj0E2FZ6u+lS03Q6wJid72nQ4A+pNUDRsj
         gLlzQdYQLcRp7y4fb2wRFV40L0PhfCu4FDtPVB9fTiwbm2pN0xM7gIO3v2X89gdRnfs5
         rCwnK3qpuWWRzGkNgBTf+x64f1L8Dke549YHnjWDr6E/bRiVtBQhzomJKYq1T2Yse49M
         mcEqMI+JYogq8KheKQEj7JV4PTo99do9i11SN2I7r3GatvdNG0CqZh55S8kwmj7n3V0x
         K7SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725461563; x=1726066363;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MbOpSXNYVcQhcvwtIzrMQlGRTGRRC7rPZsCeaAArmmk=;
        b=TbBVcbElYBlzkPWGGEldJ/7CJTr4PeL4QonrnIlzCFWaJxqWRN3MG5lOYcW8cBi9MZ
         KWqb4r+AV/iLC4YCNhJlg2/60ZtZNv+NgUlPz8jMmU3EmlIP7FtYvikC5ow5tAP1qbyv
         +qw0TlhskojT2WKHpfn70bTtJVArgvjAlkuJGMZP6xTAFMLdkxM2l3xA8GPgMWEK5yPq
         kdyQdDMThQ5AR72vL45x12pFVp8BDoGSwCW09ENfL9Gy9cKsda6Q0parfZHS4jWOTJWS
         lQH2yCmBXbVDikbrCpmh8qhGsmJHfIdfUHI9el7x1I/Aw00pQrQknSJXv2TxorZPDN68
         9qMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWi6raEMHOuWvfVK/vpjllVtW7PdNgVSzJerqA36xAPVs2LDHiLcUs82EsWCwxNyW+fsRmpv7P4htd4@alsa-project.org
X-Gm-Message-State: AOJu0YxfaZYOI9d4sa4YoD6v0nEfrBSvkG96WdT3N/9fKGKd7uCfRbJO
	e9fAeurvt9AbjQxiAHM80xYIKNYzikaJyLpUyWWFMv4/lPtcvEdzYoAcDLwtUdE=
X-Google-Smtp-Source: 
 AGHT+IFigIDgeK0AYS1NHvcazhvwSBWTvpXPKjRSJmmszC2cebhtjsf44CObPbChB6ovhvnuWTp5LA==
X-Received: by 2002:a5d:64c8:0:b0:374:c800:dc3d with SMTP id
 ffacd0b85a97d-374c800df1amr4487507f8f.1.1725461562709;
        Wed, 04 Sep 2024 07:52:42 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374c03595fcsm11963357f8f.98.2024.09.04.07.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 07:52:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] soundwire: stream: Revert "soundwire: stream: fix programming
 slave ports for non-continous port maps"
Date: Wed,  4 Sep 2024 16:52:28 +0200
Message-ID: <20240904145228.289891-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3S2YJOQXT6R3ZEHR6NLUZWZRB42JNESM
X-Message-ID-Hash: 3S2YJOQXT6R3ZEHR6NLUZWZRB42JNESM
X-MailFrom: krzysztof.kozlowski@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3S2YJOQXT6R3ZEHR6NLUZWZRB42JNESM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This reverts commit ab8d66d132bc8f1992d3eb6cab8d32dda6733c84 because it
breaks codecs using non-continuous masks in source and sink ports.  The
commit missed the point that port numbers are not used as indices for
iterating over prop.sink_ports or prop.source_ports.

Soundwire core and existing codecs expect that the array passed as
prop.sink_ports and prop.source_ports is continuous.  The port mask still
might be non-continuous, but that's unrelated.

Reported-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Closes: https://lore.kernel.org/all/b6c75eee-761d-44c8-8413-2a5b34ee2f98@linux.intel.com/
Fixes: ab8d66d132bc ("soundwire: stream: fix programming slave ports for non-continous port maps")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

I will need to fix my codec drivers, but that's independent.
---
 drivers/soundwire/stream.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index f275143d7b18..7aa4900dcf31 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1291,18 +1291,18 @@ struct sdw_dpn_prop *sdw_get_slave_dpn_prop(struct sdw_slave *slave,
 					    unsigned int port_num)
 {
 	struct sdw_dpn_prop *dpn_prop;
-	unsigned long mask;
+	u8 num_ports;
 	int i;
 
 	if (direction == SDW_DATA_DIR_TX) {
-		mask = slave->prop.source_ports;
+		num_ports = hweight32(slave->prop.source_ports);
 		dpn_prop = slave->prop.src_dpn_prop;
 	} else {
-		mask = slave->prop.sink_ports;
+		num_ports = hweight32(slave->prop.sink_ports);
 		dpn_prop = slave->prop.sink_dpn_prop;
 	}
 
-	for_each_set_bit(i, &mask, 32) {
+	for (i = 0; i < num_ports; i++) {
 		if (dpn_prop[i].num == port_num)
 			return &dpn_prop[i];
 	}
-- 
2.43.0

