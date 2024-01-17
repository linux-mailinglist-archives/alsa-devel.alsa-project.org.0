Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94533830A5D
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jan 2024 17:07:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C368F1F8;
	Wed, 17 Jan 2024 17:07:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C368F1F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705507644;
	bh=YV0Yd1DxtJ1hOcg0HiwZFSRu7k0ypqXImHkV65MOPAg=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=WZNXaPowio4r3BM7IpxGg6NCtIvBxVpKSDDaJk8cQAM1vNAGtgu/IuQTAHxscmaLU
	 07hmo3oCnK1OTqFvEICOgCtum8cJ++1Px93nmc4qTUPkfgQkaccfjz5irmOUZCf7h0
	 N9Vqu6SUPPLSbK3BvCoDXyc4ulpplqzupwvmezdo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 621B3F8058C; Wed, 17 Jan 2024 17:06:53 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F0003F80236;
	Wed, 17 Jan 2024 17:06:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E064F8014B; Wed, 17 Jan 2024 17:06:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 67723F800F5
	for <alsa-devel@alsa-project.org>; Wed, 17 Jan 2024 17:06:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67723F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=J7CTQiSc
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-559d0ef3fb5so1120582a12.3
        for <alsa-devel@alsa-project.org>;
 Wed, 17 Jan 2024 08:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705507603; x=1706112403;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=n6CX3qh7iRcLJLpXEmtL3DIIxLfD0lORaTLC26UZMxQ=;
        b=J7CTQiSc/uv5p8bBK/g95vVqaVjWJGazyjT4j2Xum6EN6S0KRfLo5mY3gBrAptJtHi
         3EynxuivIybRv7JIfFI+iZf1vgZ8eW41tzb2H5avBFtoph8GIsOrPjFuC4dU/BuvJOtn
         31b11IKdRJ2/eiU4f9jZaMX8XmoKQwQu4mhNysI/1qq6ifcrXmgWfQkOp9olDBdZYEBO
         WKJRljAG7iAlCktLL3iwlL5XOzUKeGcxOzqqd2rKdxkIR981MTfw9hE/7l5E5K3Lak4H
         5AYg1m+tygxB+9AGg5qMUHl6PnM1JKLBKC2HelzUp+GcaKOMkgWR0v8h3Jk3ZpEkZrIQ
         M8NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705507603; x=1706112403;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n6CX3qh7iRcLJLpXEmtL3DIIxLfD0lORaTLC26UZMxQ=;
        b=O0rI9im6J1HWKXZGLySvHbOSt/UeRHNfm1FdrIbiQywBjD0OPYSOs3Z5U92xbbouxl
         PmlxRZmr3d5m3Y9yQcRW2hzMC9idvLt/w89uneSWysz3+pBNyHbNrcv6zqv4CLlYcSTd
         q8EJwS8gtlQZw51cGpdhHiBUQ6vlsMrbxYMaP1/Pj36OmHOzbkFAiX/yIUZv1ER5i/U1
         gMmi4ngaA6R8HMHkhzLCRDZ5bSkSQUDggY3AikLRoVjxG/w2OpiaNTCuqEFdkAnE6HPb
         fonWJ20hH6M4XyeOdcK3V5KxSsq1DPXg1wupmXTtEWXZQUr2xat7FhzZ46odc3THsiLO
         DdOw==
X-Gm-Message-State: AOJu0Yzyc1aHVYEnnzP/ugZjo8uDksLLLcY25QU6GQjKNw/rtlhcosXj
	rLbs+JeZxfnqwCqICFmUEUb/lOioxLtl1g==
X-Google-Smtp-Source: 
 AGHT+IFwpZvKcUOKMboA7WR7jIqj/NeK3WUTgEGUp8+qVlKnmMvG9sTJso6R7D2Eszsi9Oc7CByCXA==
X-Received: by 2002:a05:6402:134f:b0:559:43aa:4b83 with SMTP id
 y15-20020a056402134f00b0055943aa4b83mr2750053edw.64.1705507603171;
        Wed, 17 Jan 2024 08:06:43 -0800 (PST)
Received: from krzk-bin.. ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id
 h9-20020a0564020e0900b00559736b84ffsm3012063edh.89.2024.01.17.08.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 08:06:42 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	alsa-devel@alsa-project.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] soundwire: stream: add missing const to Documentation
Date: Wed, 17 Jan 2024 17:06:39 +0100
Message-Id: <20240117160639.1327266-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 22JYUZDK4IRHWPO5EKL4Q3YEI3PUKHSA
X-Message-ID-Hash: 22JYUZDK4IRHWPO5EKL4Q3YEI3PUKHSA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/22JYUZDK4IRHWPO5EKL4Q3YEI3PUKHSA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Commit 21f4c443731f ("soundwire: stream: constify sdw_port_config when
adding devices") added const to sdw_port_config argument, but forgot
documentation.

Fixes: 21f4c443731f ("soundwire: stream: constify sdw_port_config when adding devices")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/driver-api/soundwire/stream.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/driver-api/soundwire/stream.rst b/Documentation/driver-api/soundwire/stream.rst
index b432a2de45d3..2a794484f62c 100644
--- a/Documentation/driver-api/soundwire/stream.rst
+++ b/Documentation/driver-api/soundwire/stream.rst
@@ -324,12 +324,12 @@ framework, this stream state is linked to .hw_params() operation.
 
   int sdw_stream_add_master(struct sdw_bus * bus,
 		struct sdw_stream_config * stream_config,
-		struct sdw_ports_config * ports_config,
+		const struct sdw_ports_config * ports_config,
 		struct sdw_stream_runtime * stream);
 
   int sdw_stream_add_slave(struct sdw_slave * slave,
 		struct sdw_stream_config * stream_config,
-		struct sdw_ports_config * ports_config,
+		const struct sdw_ports_config * ports_config,
 		struct sdw_stream_runtime * stream);
 
 
-- 
2.34.1

