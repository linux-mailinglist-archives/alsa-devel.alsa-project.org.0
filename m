Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB7334EB02
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Mar 2021 16:50:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94698168E;
	Tue, 30 Mar 2021 16:49:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94698168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617115830;
	bh=S42vYhzsxXee7rbXTVUe6WDeCLLWNPeuGscYrpl8zLc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b2I4Syj3IWS/jaAEYgG3QcdH9HUwtqFd6Za4N1yMAI8RaJC0fUpVAae9I3bPBFehM
	 J2ZYfIYkOxAaxcJPDGn19l3nShqjChb6MBTdBoBo8YxXMb9fHJvogXMbLYmxwNlqYZ
	 /k5ABCmauhPD0Tb3wl/xRdAXpFbM6FFwWfdiG9yE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E152F804AC;
	Tue, 30 Mar 2021 16:47:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8DE30F804AB; Tue, 30 Mar 2021 16:47:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6DB6AF802C8
 for <alsa-devel@alsa-project.org>; Tue, 30 Mar 2021 16:47:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DB6AF802C8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="mH8sSvUf"
Received: by mail-ed1-x52c.google.com with SMTP id h13so18519211eds.5
 for <alsa-devel@alsa-project.org>; Tue, 30 Mar 2021 07:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4+hsU/8RBl6lSSICk7jMUthsu/0q86iC66VLDGyTgJc=;
 b=mH8sSvUfDbRY2Ewaz01LJDF0WZ94V4hv2vB5u1PRwCMZi/Qi4FQOm6yXvQBoKfYBny
 i/w2jpGrJLqgFcKE0xqHPRDA1fZXPvwJAGiTzi+M5jil4xxxJDYfSp6OhQl+bZ0igZmP
 Tc6aYUaCdje9jiRHOH4gslmlnUEoAYkcl1VvNtEu8f09wkXZJM+rHjBvIbrg+Jthtf1y
 DO1zcxRnE5RJPNF6eRDDGgUu9+ykJloerxZuAjoGtoXhCuHZ1mu45E1LGobWOeI5qeTZ
 HHiUZbp1gnS3sFTlo/14WbAdeLxDlz3FNmCBNnb6dti2QGr/yohV13wCFK8FkLM6NQpM
 AKjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4+hsU/8RBl6lSSICk7jMUthsu/0q86iC66VLDGyTgJc=;
 b=HUZAwphrtnlUN3mXJrgp8V4t4EorPCEWwOeCluQlVGZmeeW36vSO61F9kdXg8383vR
 fUiElBC8Se5q3iDrjDnH+RL4VippbgpVobkJVh/q7veXjdh9KvEqFBg/PEdgZjitnVRV
 6hD7KDXMmonQjvzdwPIXR/yRAIRV/tSqQr50GiRHAgoMEIErjiNMrj7UqsCygMdtDgud
 TWtwLU+4+VRoAjJuS1kxaO8kKI1FBei42hk1Uh1KqzmKPQeZj6uA6zJPrpv1dnxFZadl
 yP9BhG41TWsI15+VoWK5FE+Z2YjggAPvVbym6cn9aCIX3JQsgC6DbKm0yt+rTjYd6TuK
 q5ag==
X-Gm-Message-State: AOAM5333gpJlzi4umcLegrEqx2UWQekUjS2CJGQxUGl9+ugaU7YQZpOM
 hCdI56nob6CjNNVotpuOtWTpiA==
X-Google-Smtp-Source: ABdhPJzZtrp0nXWtzFD7izW2b00Mdx3rC1VWphOPFbdHQLuZm9EWmnGSeJoLAonV70iSjo+tBKLhgw==
X-Received: by 2002:a05:6402:35cd:: with SMTP id
 z13mr34346153edc.21.1617115653480; 
 Tue, 30 Mar 2021 07:47:33 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id n16sm11520383edr.42.2021.03.30.07.47.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 07:47:33 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org
Subject: [PATCH v6 4/9] soundwire: qcom: start the clock during initialization
Date: Tue, 30 Mar 2021 15:47:14 +0100
Message-Id: <20210330144719.13284-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210330144719.13284-1-srinivas.kandagatla@linaro.org>
References: <20210330144719.13284-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 sanyog.r.kale@intel.com, yung-chuan.liao@linux.intel.com
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

Start the clock during initialization, doing this explicitly
will add more clarity when we are adding clock stop feature.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/qcom.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index edc77d18c245..0f2167433d2f 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -47,6 +47,8 @@
 #define SWRM_MCP_FRAME_CTRL_BANK_ADDR(m)		(0x101C + 0x40 * (m))
 #define SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_BMSK			GENMASK(2, 0)
 #define SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_BMSK			GENMASK(7, 3)
+#define SWRM_MCP_BUS_CTRL					0x1044
+#define SWRM_MCP_BUS_CLK_START					BIT(1)
 #define SWRM_MCP_CFG_ADDR					0x1048
 #define SWRM_MCP_CFG_MAX_NUM_OF_CMD_NO_PINGS_BMSK		GENMASK(21, 17)
 #define SWRM_DEF_CMD_NO_PINGS					0x1f
@@ -343,6 +345,7 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 	u32p_replace_bits(&val, SWRM_DEF_CMD_NO_PINGS, SWRM_MCP_CFG_MAX_NUM_OF_CMD_NO_PINGS_BMSK);
 	ctrl->reg_write(ctrl, SWRM_MCP_CFG_ADDR, val);
 
+	ctrl->reg_write(ctrl, SWRM_MCP_BUS_CTRL, SWRM_MCP_BUS_CLK_START);
 	/* Configure number of retries of a read/write cmd */
 	if (ctrl->version > 0x01050001) {
 		/* Only for versions >= 1.5.1 */
-- 
2.21.0

