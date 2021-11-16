Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D35AA453142
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Nov 2021 12:50:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44B4716BF;
	Tue, 16 Nov 2021 12:49:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44B4716BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637063424;
	bh=ID1BBrAzzgvXUQx7EvACVcfs6SPJNYyUyfYetVGRzlo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gDLt7qRJiDXHssIEU3TSjNyA0iCO7ZhaudYvbEO/kZqItTnYoKS38HNAqQBYDSrfB
	 u+mA5y/v9gbhqFR/APfHRB/VY7BsTkjyox78P+fhrXhFFxalTnHselIA1YSwwT2Oh5
	 vsMtDHDuiK0Qbbl4MFWuworZIwtug8CXvOrCm4hg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C6FFF80519;
	Tue, 16 Nov 2021 12:47:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29568F80518; Tue, 16 Nov 2021 12:47:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A55C7F802C4
 for <alsa-devel@alsa-project.org>; Tue, 16 Nov 2021 12:47:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A55C7F802C4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="tZeXA7T7"
Received: by mail-wm1-x331.google.com with SMTP id
 az33-20020a05600c602100b00333472fef04so1687252wmb.5
 for <alsa-devel@alsa-project.org>; Tue, 16 Nov 2021 03:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hiACY3RT/nmqVxVT6gUm+SJftE33Dn6ONZen5+wUKe4=;
 b=tZeXA7T7FxrH+wO2umeVX7gIv3IuM0a5aQVmrXuJ1OTHoFSzTTf2zrFF7KQtawbvWR
 B+VVnaU4/oqQolSpCmNu9yMal0+FxT7hUQ4DRQLI6TkkhCSmOh34qqWEJsm+ZIQuPRxs
 elS/Xtx+wP0nnsgT42M613bh2TG8nkgy9h9Q3AHyuxlD3CQUzIiTptq1pEbKTScRVT4l
 TDnwN8hENbR4CawWUtdQnyUw6cHcuiz5c5vAS046+mVeIhnfFbYRy24iN3ecN9huSA6u
 xNAgFo7vhyqmDasDHtr9I9K+6OaHoPr7hNQyhTKV0Laeo8cRntjfTzvE4DVdTbsGJOPK
 xQJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hiACY3RT/nmqVxVT6gUm+SJftE33Dn6ONZen5+wUKe4=;
 b=PszK7m6WLV9/tPMd4J0GfJUlwFpmwPMrc4PMTJ8N+ZU2cDStbUDy70ruAlAJsszWjc
 zhf3B+5faXn9RVEba8GZapmKxvNn1jUikqpP+ESOwObRkxsal6mjLcGPBg6LG8SE0JZ1
 IbWyfPx5++TG0YB4lzu1iyQIkQp0cVxicfpzXixfVysXppFiEGQGEHYtCpFYf/d+FS8H
 IP38bIkBuMJ7w347eeiefccXAqiw8NegRf9XvjMtCEViL2Q6qV0gi+YwYjjWfNFnrlaG
 eYzpKUD32fd7ybC2/J2ivkB6d+yEpD2LlApz//zea4gnM/v9WZpxiT+L8pTE128Rsc5s
 i9+w==
X-Gm-Message-State: AOAM533vRZUwDA0tJURmWssr2Pbh+TNApdnZpm5eLxTlkIxzSggt0ixs
 lN/f1f/kt5hbQsmmtrtiqb+U1w==
X-Google-Smtp-Source: ABdhPJyXMXt8SR0JdN8T3xvPScdTMbgiy4rZOsDKYHINmSSmOmu8w+Zjf+BXGplRetFG6okhaBxfkQ==
X-Received: by 2002:a05:600c:5125:: with SMTP id
 o37mr6995830wms.81.1637063263631; 
 Tue, 16 Nov 2021 03:47:43 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id l8sm2260523wmc.40.2021.11.16.03.47.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 03:47:43 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 4/5] ASoC: qdsp6: q6adm: improve error reporting
Date: Tue, 16 Nov 2021 11:47:20 +0000
Message-Id: <20211116114721.12517-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20211116114721.12517-1-srinivas.kandagatla@linaro.org>
References: <20211116114721.12517-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

reset value for port is -1 so printing an hex would not give us very
useful debug information, so use %d instead.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6adm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6adm.c b/sound/soc/qcom/qdsp6/q6adm.c
index 3d831b635524..72c5719f1d25 100644
--- a/sound/soc/qcom/qdsp6/q6adm.c
+++ b/sound/soc/qcom/qdsp6/q6adm.c
@@ -390,7 +390,7 @@ struct q6copp *q6adm_open(struct device *dev, int port_id, int path, int rate,
 	int ret = 0;
 
 	if (port_id < 0) {
-		dev_err(dev, "Invalid port_id 0x%x\n", port_id);
+		dev_err(dev, "Invalid port_id %d\n", port_id);
 		return ERR_PTR(-EINVAL);
 	}
 
@@ -508,7 +508,7 @@ int q6adm_matrix_map(struct device *dev, int path,
 		int port_idx = payload_map.port_id[i];
 
 		if (port_idx < 0) {
-			dev_err(dev, "Invalid port_id 0x%x\n",
+			dev_err(dev, "Invalid port_id %d\n",
 				payload_map.port_id[i]);
 			kfree(pkt);
 			return -EINVAL;
-- 
2.21.0

