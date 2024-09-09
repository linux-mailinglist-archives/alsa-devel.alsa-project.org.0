Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E5E971F82
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Sep 2024 18:48:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C87E7845;
	Mon,  9 Sep 2024 18:48:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C87E7845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725900507;
	bh=gvrrOqdVgjpm5u/np2uh2v/a16iqFEZtpyJE9eQIzfk=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=mXjZFCIq5GSPFTlfxTh8Ta70tELch1iXIxl8zrQVblg+sTdStxioavFDiF1/I+0Ka
	 84j5yCfRz4KdiJ6Zz3nakolUyORA2i5kCJnE4TrrJET/gWtmVOI9iPXnE+N+CS+c0Y
	 CHc7YWgkARAitCSV35KkeXVoNmCHeDqYszO+LBTI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 84D8EF805B1; Mon,  9 Sep 2024 18:47:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 14328F805AE;
	Mon,  9 Sep 2024 18:47:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 861D8F8019B; Mon,  9 Sep 2024 18:47:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C6F2DF800E9
	for <alsa-devel@alsa-project.org>; Mon,  9 Sep 2024 18:47:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6F2DF800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=IzLxEKWS
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-42ca5447142so4744965e9.2
        for <alsa-devel@alsa-project.org>;
 Mon, 09 Sep 2024 09:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725900470; x=1726505270;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9K+ClSg80/aj3+WNRq1JEXBhsSt9yh+XEQ9PiBAm4KU=;
        b=IzLxEKWS4ScpLb8noemM6qd1+CkOx/gTjY8GIlfihG4nrY7P/yhVgSGHEXN/oJPCT7
         UsE//j7c5ch/0dIw5dFrordL1HuVojQqZDf/7uE10MB129BdtzQV7cUF6rV8Pv8z+UkL
         hTiV8k06mQ2A3QmoZa49ihVoS7fZlzzdzTJpWDM6heUYhlkZLUiHkaPCw/usoojEC+nM
         m35w8nrZIHTOsWlERLxqlYKbzxJA7n2xsUQ5POZhK99qgn2Uf4O4h2wAA2fWoN8nkaoQ
         FplleB3kn/DyFeHWIPZRIDDGTWnFMiOrRtCOxx/wKJ/T3h0vK7bSLsgV6gHoXQ6MDbUT
         iEvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725900470; x=1726505270;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9K+ClSg80/aj3+WNRq1JEXBhsSt9yh+XEQ9PiBAm4KU=;
        b=EMheYvrAFRMDjIUFr5HMU8LzZCMV2BtEs8WkWF+tQehLJ/8jWSaU4SZaRBmnO0EQh9
         Y9TAru8zn8GcgEKtNSFxQX1gb2GTnza+RUfxA/EAW2dUtLOxWULYG3NmtSAmM131Ncas
         0hGsV60okIhKJO3k4Ir8GTKYVaJKUAvqxI5Z5urq01Koi2jLqk+EahGCmhg3JAE26HSM
         M1IdfGsWoPgTSBfCf6zLCc7OFbXoKBhf0HAvdmFt/dCzH0AGyimBwG2Uy/bzmJRkepIn
         Z8i8pIqyxN+7G5u3ixx3jak6YdXqVMFjNwaJ5HWUr8uU7YO6j8j8ouL5olDmxrsLChCJ
         chcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHr5RMcmBZMiSVt95Q+E9QEWiHCFnghG4uNd/5cuJFa6bl/oWbcSyD28MbZRqaFAvfYJxH/6/nx8Ak@alsa-project.org
X-Gm-Message-State: AOJu0Yy71Atg+ojGkd15ZUwANBc2nemGrw8yfFIsr0oiLIpd42IU6mBq
	qqoAGQb0aI3XdJSRhZkXZnSVgaD/RIVRggEF35ekdU2d/OdQzqL+/lNFcEcU9fw=
X-Google-Smtp-Source: 
 AGHT+IHPy2hYIJH4VPnE2BBNfbfOtDSs5NB3RmCrLWeX29JP0Q3CX1Vj8YTy0TBPiP+DHMOrbTjUcQ==
X-Received: by 2002:a05:600c:510a:b0:42c:aeee:80a with SMTP id
 5b1f17b1804b1-42caeee0847mr25402795e9.7.1725900469366;
        Mon, 09 Sep 2024 09:47:49 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37895675c1dsm6470822f8f.58.2024.09.09.09.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 09:47:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>,
	stable@vger.kernel.org
Subject: [PATCH RESEND] soundwire: stream: Revert "soundwire: stream: fix
 programming slave ports for non-continous port maps"
Date: Mon,  9 Sep 2024 18:47:46 +0200
Message-ID: <20240909164746.136629-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2OU75OPLQJRWNTMFHYGVT5R5JVRQDWB5
X-Message-ID-Hash: 2OU75OPLQJRWNTMFHYGVT5R5JVRQDWB5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2OU75OPLQJRWNTMFHYGVT5R5JVRQDWB5/>
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
Acked-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Resending with Ack/Rb tags and missing Cc-stable.
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

