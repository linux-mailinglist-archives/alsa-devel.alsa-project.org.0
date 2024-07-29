Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D2593F75B
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jul 2024 16:13:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 973B9843;
	Mon, 29 Jul 2024 16:12:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 973B9843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722262379;
	bh=55XENsnNCk84FLNa+lraTuZ6bEgW732leOZMMeH2J88=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=fflX6VnZuGrkfAqa4Q6aA+S89AEeTg1ZVRlJJtycPXk8GZ8Ec372Fx9yql5f5T+n7
	 Ih7Lgeosl9KGEDRaTYSMOzEy2GDz1pudU746ECFUu9QRA15NU0ilUBGkuzjpb4RMp3
	 Sa7DWtx3hYOuEOuqk50m1BSJ8dRaqZ7L1U+oCEsI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19863F80579; Mon, 29 Jul 2024 16:12:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 715F8F805AF;
	Mon, 29 Jul 2024 16:12:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0CCC0F802DB; Mon, 29 Jul 2024 16:07:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DF18DF800E3
	for <alsa-devel@alsa-project.org>; Mon, 29 Jul 2024 16:02:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF18DF800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=YwBWa9pc
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4280bbdad3dso17416145e9.0
        for <alsa-devel@alsa-project.org>;
 Mon, 29 Jul 2024 07:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722261733; x=1722866533;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BmtHBomoMa6GjrD4GHzO5YGBhc3NcYaKKlfZd4lImTc=;
        b=YwBWa9pcoBgF9/OeijHBLhWXMmQmcGeHLpzNP6Qqg2bObP60tgiBMyysYyo7m2pwvb
         R8CId5+Drw5h9XzjZqFOQzUeOM3SBmBwMmkzqeQu6v+l8SvSoGAVQbc3k6QoLNY4N3gX
         t/hh9JDLBN3L9gqM8lF4AblqwphZtQ8kZ39PmLPHhuejRm29pInAODc5VIVxJiVVDKY/
         mzO+WggQh/eypwuU93ivM8vw9KaxpbgOpwqdExa5lYenJySzASyYvp1TpkmukqoT1AKe
         p6CHTLY50utvC2SZI1dbE3drB7Ea3BZL85f0WqFAd7lZWxncLm9RwFOXcRCJW4zbejFu
         ckpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722261733; x=1722866533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BmtHBomoMa6GjrD4GHzO5YGBhc3NcYaKKlfZd4lImTc=;
        b=C0YK5mRiMEye5kM/1/2EJ3NIqsslC1acdlRNHHu0bN/3s7EQNgtpfHZ57naNT1SLTP
         j4hAFZZU3GxaxhEUX0NaYJbDCxWW2sTzg4kXR7XzyCuAllwxJ33PX4XtNKePAe0ticYm
         otT5dEzsA/djWgN2s0P0sJcwoR2stYprQswrp5KSCiEE2kfYHV0E6qfv47SYwH8X3TP6
         pRbgwX4cV8ETk8Cg8eia8k77o+7+NAMBe6cBebqSFDxawXkg5ICqqzfNh+D/KWUIbH5n
         +H18UH+ieWtp2krvHB8cu/af9KRb/0CMqnHu+wEbPSiy3no6siBaesPjPW3Kb6TkbUAd
         DsGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQOe26BY1HJFk1aTBKbZHjmeXtUZfKqc1ZWjkAgEc7nRaHtcqiEbfOhzmQETbRiBS3XMdx+0N7Tu6RrXkOX6mtBNAjq3irqNqzECA=
X-Gm-Message-State: AOJu0YzSZYUZg8wa6pwiG5xtOsWA8aN2opDZLGt+NNs+Ax+u4VUk+n2U
	rImeEpL2OV3JRLbpYjwajW2bWUi5co3OLELQQbNe6AfYNGII9EV8bPE34f5AypI=
X-Google-Smtp-Source: 
 AGHT+IGV0v4M42FoTYGpDxA/2lFq7kTxKgkZ753sgQBpfRFo1ZH43NSLN1QY9dJKGrzBR6PmH5CHCw==
X-Received: by 2002:adf:fa0f:0:b0:368:3717:10c7 with SMTP id
 ffacd0b85a97d-36b5cee324fmr4444568f8f.4.1722261721007;
        Mon, 29 Jul 2024 07:02:01 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36b368709fdsm12283163f8f.116.2024.07.29.07.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 07:02:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	Shreyas NC <shreyas.nc@intel.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH] soundwire: stream: fix programming slave ports for
 non-continous port maps
Date: Mon, 29 Jul 2024 16:01:57 +0200
Message-ID: <20240729140157.326450-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: O6C7Z5VYNQX66JTQL2XWEEKCMAOEXVT4
X-Message-ID-Hash: O6C7Z5VYNQX66JTQL2XWEEKCMAOEXVT4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O6C7Z5VYNQX66JTQL2XWEEKCMAOEXVT4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Two bitmasks in 'struct sdw_slave_prop' - 'source_ports' and
'sink_ports' - define which ports to program in
sdw_program_slave_port_params().  The masks are used to get the
appropriate data port properties ('struct sdw_get_slave_dpn_prop') from
an array.

Bitmasks can be non-continuous or can start from index different than 0,
thus when looking for matching port property for given port, we must
iterate over mask bits, not from 0 up to number of ports.

This fixes allocation and programming slave ports, when a source or sink
masks start from further index.

Fixes: f8101c74aa54 ("soundwire: Add Master and Slave port programming")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soundwire/stream.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index 7aa4900dcf31..f275143d7b18 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1291,18 +1291,18 @@ struct sdw_dpn_prop *sdw_get_slave_dpn_prop(struct sdw_slave *slave,
 					    unsigned int port_num)
 {
 	struct sdw_dpn_prop *dpn_prop;
-	u8 num_ports;
+	unsigned long mask;
 	int i;
 
 	if (direction == SDW_DATA_DIR_TX) {
-		num_ports = hweight32(slave->prop.source_ports);
+		mask = slave->prop.source_ports;
 		dpn_prop = slave->prop.src_dpn_prop;
 	} else {
-		num_ports = hweight32(slave->prop.sink_ports);
+		mask = slave->prop.sink_ports;
 		dpn_prop = slave->prop.sink_dpn_prop;
 	}
 
-	for (i = 0; i < num_ports; i++) {
+	for_each_set_bit(i, &mask, 32) {
 		if (dpn_prop[i].num == port_num)
 			return &dpn_prop[i];
 	}
-- 
2.43.0

