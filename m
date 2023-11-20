Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0EF57F1B6F
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Nov 2023 18:48:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCB7F84A;
	Mon, 20 Nov 2023 18:48:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCB7F84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700502535;
	bh=vljxMOrOmtyosDAZx/I/ZbkJAQpLMWEmm0IyrhtqB18=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=FwiT4dOGMsoyJvNiz+O7g9kS7ZaycYE4QBNuJ7LJ9tgG1nyWdiK1hK+e0sIok2DxE
	 DbeKL1HZ4JahDOU6dclRuhmhpt3k1TQ+cunxKT7DSVijnlWodFmTyMmJDjWKzU5P/E
	 NJf9GDoS7fiObr6rk3oJOgV2DrxPlHQxMrFKgaPk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8B4FFF80549; Mon, 20 Nov 2023 18:47:44 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 091D1F80246;
	Mon, 20 Nov 2023 18:47:43 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 84772F80254; Mon, 20 Nov 2023 18:47:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CAC5FF80114
	for <alsa-devel@alsa-project.org>; Mon, 20 Nov 2023 18:47:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CAC5FF80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=qjwYLliK
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40a5a444c3eso15454435e9.2
        for <alsa-devel@alsa-project.org>;
 Mon, 20 Nov 2023 09:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700502446; x=1701107246;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BPwJyVhhexCZzbUP41lTNUU8tlh1YKVSoA80AxKe1yA=;
        b=qjwYLliKZCttpHyPAKxjcb6ZfHCRZMLyEuIQPGx4OOQLj6OKazgcMA9sqyqfbku6hV
         nBxe+Aau7nZnDsObHijQJF+6DLnny2LTG0dMe7W7L56qxP6gyIDhxsE5NYc9g6d54DER
         eQLfW07IpFyxY2Zzn2RzfpGAJc+aFXO2/dyAhB2aCjQXRpu0KHXHK1DNtn2UX0X6uMxD
         m37JogJ4vkLGAPdnn78W4T7QtWPIpq26UG1GpfPNR0T0Oatc15dqvyIluhLHHaf+8c2M
         NDuCzgE+gP5A/5//gbPBRRwtaB9lYkv3Az8S1boqnP2/bRdIurmxKyzUXp8Oa1nAXdyi
         Lgdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700502446; x=1701107246;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BPwJyVhhexCZzbUP41lTNUU8tlh1YKVSoA80AxKe1yA=;
        b=TmpCANXOXVuY/4paaCdSA1yENDA8LwpwJstnrxSvZWurkLwUE270z2O7aN9mSk2Xcf
         st+y5h/D0qwrJE3DfegAYHZJwaLcZCJGHlKc+LeVjzNJz3FD7ojDrzY8jEOoJyjBEy3w
         +SluPQcbCJCFRKi2pDabTOdaqOz2cy2ccJ22RFpqbU/eK49kQZ5l+xM7Cm50jMFLDrwU
         oJINBIGHzvX5iXWrItdyPVYJBFXdarW1Ubn989pxe2unXczf+swxaqFh5DndqydOvaNa
         FJHTu55HcOuA0pk9c9o7/8F+xhOCxJcOdsg7faezuKzB4pkxY9GXYngvsfoQk1IUqFua
         nGwQ==
X-Gm-Message-State: AOJu0YxGfmvc+/VvMKkFN94WzXfgvvF+BlDXu6qGtemyvlWrYUwRJTB5
	cVMRMah0aet5sgXhiN/v0ZEJxw==
X-Google-Smtp-Source: 
 AGHT+IHvLU3AHYInt84F0JGn0xDDQmY4uHZG9iBWciPCO/udT9tvcgKRsOjlRVTFcDKUl91guEtcHw==
X-Received: by 2002:a05:600c:4707:b0:40a:6239:39b with SMTP id
 v7-20020a05600c470700b0040a6239039bmr6589583wmo.21.1700502445681;
        Mon, 20 Nov 2023 09:47:25 -0800 (PST)
Received: from krzk-bin.. ([178.197.222.11])
        by smtp.gmail.com with ESMTPSA id
 d19-20020adf9b93000000b003316eb9db40sm9595734wrc.51.2023.11.20.09.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 09:47:24 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] soundwire: stream: constify sdw_port_config when adding
 devices
Date: Mon, 20 Nov 2023 18:47:20 +0100
Message-Id: <20231120174720.239610-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TAFCRCKZ5A6HRXPDTT6ARI4RDYVVMUQL
X-Message-ID-Hash: TAFCRCKZ5A6HRXPDTT6ARI4RDYVVMUQL
X-MailFrom: krzysztof.kozlowski@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TAFCRCKZ5A6HRXPDTT6ARI4RDYVVMUQL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

sdw_stream_add_master() and sdw_stream_add_slave() do not modify
contents of passed sdw_port_config, so it can be made const for code
safety and as documentation of expected usage.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soundwire/stream.c    | 10 +++++-----
 include/linux/soundwire/sdw.h |  6 +++---
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index 69719b335bcb..9dc6399f206a 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -897,7 +897,7 @@ static struct sdw_port_runtime *sdw_port_alloc(struct list_head *port_list)
 }
 
 static int sdw_port_config(struct sdw_port_runtime *p_rt,
-			   struct sdw_port_config *port_config,
+			   const struct sdw_port_config *port_config,
 			   int port_index)
 {
 	p_rt->ch_mask = port_config[port_index].ch_mask;
@@ -970,7 +970,7 @@ static int sdw_slave_port_is_valid_range(struct device *dev, int num)
 
 static int sdw_slave_port_config(struct sdw_slave *slave,
 				 struct sdw_slave_runtime *s_rt,
-				 struct sdw_port_config *port_config)
+				 const struct sdw_port_config *port_config)
 {
 	struct sdw_port_runtime *p_rt;
 	int ret;
@@ -1026,7 +1026,7 @@ static int sdw_master_port_alloc(struct sdw_master_runtime *m_rt,
 }
 
 static int sdw_master_port_config(struct sdw_master_runtime *m_rt,
-				  struct sdw_port_config *port_config)
+				  const struct sdw_port_config *port_config)
 {
 	struct sdw_port_runtime *p_rt;
 	int ret;
@@ -1861,7 +1861,7 @@ EXPORT_SYMBOL(sdw_release_stream);
  */
 int sdw_stream_add_master(struct sdw_bus *bus,
 			  struct sdw_stream_config *stream_config,
-			  struct sdw_port_config *port_config,
+			  const struct sdw_port_config *port_config,
 			  unsigned int num_ports,
 			  struct sdw_stream_runtime *stream)
 {
@@ -1981,7 +1981,7 @@ EXPORT_SYMBOL(sdw_stream_remove_master);
  */
 int sdw_stream_add_slave(struct sdw_slave *slave,
 			 struct sdw_stream_config *stream_config,
-			 struct sdw_port_config *port_config,
+			 const struct sdw_port_config *port_config,
 			 unsigned int num_ports,
 			 struct sdw_stream_runtime *stream)
 {
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 4f3d14bb1538..904004d8b562 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -1040,7 +1040,7 @@ int sdw_compute_params(struct sdw_bus *bus);
 
 int sdw_stream_add_master(struct sdw_bus *bus,
 		struct sdw_stream_config *stream_config,
-		struct sdw_port_config *port_config,
+		const struct sdw_port_config *port_config,
 		unsigned int num_ports,
 		struct sdw_stream_runtime *stream);
 int sdw_stream_remove_master(struct sdw_bus *bus,
@@ -1062,7 +1062,7 @@ void sdw_extract_slave_id(struct sdw_bus *bus, u64 addr, struct sdw_slave_id *id
 
 int sdw_stream_add_slave(struct sdw_slave *slave,
 			 struct sdw_stream_config *stream_config,
-			 struct sdw_port_config *port_config,
+			 const struct sdw_port_config *port_config,
 			 unsigned int num_ports,
 			 struct sdw_stream_runtime *stream);
 int sdw_stream_remove_slave(struct sdw_slave *slave,
@@ -1084,7 +1084,7 @@ int sdw_update_no_pm(struct sdw_slave *slave, u32 addr, u8 mask, u8 val);
 
 static inline int sdw_stream_add_slave(struct sdw_slave *slave,
 				       struct sdw_stream_config *stream_config,
-				       struct sdw_port_config *port_config,
+				       const struct sdw_port_config *port_config,
 				       unsigned int num_ports,
 				       struct sdw_stream_runtime *stream)
 {
-- 
2.34.1

