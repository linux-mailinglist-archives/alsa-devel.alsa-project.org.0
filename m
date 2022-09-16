Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9095BAEA7
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Sep 2022 15:55:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 737221AB8;
	Fri, 16 Sep 2022 15:54:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 737221AB8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663336530;
	bh=aZgMtGIFDgmRj641FdMcyIo0pbiDWgkyFSGaMkG+Vak=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IvSADir+KneM5v5EQrAyy319bxj5ujZXYYxVvJnZISoY0Lcss7cJ3QxgsIfA8BsqQ
	 R3iryBuKadG1DlRKE9hQ+h/ETBJAvQtsbdoVu3xKQ1gFXum19hiYwm3w24YPerL8ch
	 ij+O8kHXVziNqECvW0V9kYI7/+ek62YtFTOD9FII=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B40F7F80533;
	Fri, 16 Sep 2022 15:54:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3FBCFF802BE; Fri, 16 Sep 2022 15:54:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F190BF8024C
 for <alsa-devel@alsa-project.org>; Fri, 16 Sep 2022 15:53:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F190BF8024C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="V4KuezOG"
Received: by mail-wr1-x42e.google.com with SMTP id k9so36202846wri.0
 for <alsa-devel@alsa-project.org>; Fri, 16 Sep 2022 06:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=F/++3j5vzbiWV6wQtfbpT+br4B/s5dtmbh359iA+BUU=;
 b=V4KuezOGi/JTNn5/6GMcwwzbP1cwJ2jYRWRJqXnawM1eJBg+CmGdlw+x/wMldl/++/
 N55q6J+zmIVsAFrJBtOukfYyPJiCztuNyWmfSVyg3xOZdEINJUhviurCMeII9AD6hKgG
 l6Z6u8H6TZDX5tcZ0l5GKRI3F1ar0BoCQMfN2kslNgSV8Ym8h+0hcQWpSJ7ECL/H9myy
 jlLEjswffFwIK4QG5lFLZGkrrJRJlu5z7qqDkdgCzK6uns9MYg6j6xqgHj+/MJliqaLD
 KPSjgPUkO1l9tdt/zAKVoXiw/NCGHwlL75BH1hin0QqMHw9d2xXeKi8OMMs0usfbhyhO
 ds1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=F/++3j5vzbiWV6wQtfbpT+br4B/s5dtmbh359iA+BUU=;
 b=k0oz4mRkEmYHfYjstb1SXn0ME/lgXhDtg1eH6zqtpnvePngSOBWpDVlFvhuKSdcNVq
 93K7C1HQHph74n0QsHxUe1gNlrxAbvcxoe7OFHTaCR78k8ikdwnj5Po9vyMvQqsOTsce
 h6L0scrcPh5AyFaaESuh6NoXX+w7WQ54326sXJLRISWE+w/+hYnZ65wIoC7NP3R68ujx
 R1o1/iFM90dZJr8yQ5zb3UnPl1PQ0dhWpw4QK9ckPnUZH7jwwfO9kttzeZGnRvedTPqS
 VB+KKC/RB6vMjj02JB5CG7776eQbaflCaVv1IfAOsNGze2tWd3oO7Y3yHhU8VX2Qrv6t
 aW0w==
X-Gm-Message-State: ACrzQf1Ubc+t3NgKaB9Qo7zbPPlRbbLJgcNIMS4pQV77RchLJ19WNXQM
 KBGRtmoSwchSQ4QPsrCaUaea5A==
X-Google-Smtp-Source: AMsMyM66mtWTrSH2i+OwN4eD0KuYmUQ7/S2/uesxpJ8irrIeofU4OyeQ3mLggy7e1a3yQyB+/AAIHQ==
X-Received: by 2002:a05:6000:1ace:b0:22a:c9a6:e203 with SMTP id
 i14-20020a0560001ace00b0022ac9a6e203mr3048283wry.694.1663336435835; 
 Fri, 16 Sep 2022 06:53:55 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 m2-20020a7bce02000000b003b483000583sm2084767wmc.48.2022.09.16.06.53.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Sep 2022 06:53:55 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org
Subject: [PATCH v2 2/2] soundwire: qcom: do not send status of device 0 during
 alert
Date: Fri, 16 Sep 2022 14:53:52 +0100
Message-Id: <20220916135352.19114-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220916135352.19114-1-srinivas.kandagatla@linaro.org>
References: <20220916135352.19114-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, sanyog.r.kale@intel.com,
 yung-chuan.liao@linux.intel.com, quic_srivasam@quicinc.com
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

Device0 can not be in alter status. And for consistency reasons do not
send status of device0 to core.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/qcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index d3ce580cdeaf..a04a8863b228 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -428,7 +428,7 @@ static int qcom_swrm_get_alert_slave_dev_num(struct qcom_swrm_ctrl *ctrl)
 
 	ctrl->reg_read(ctrl, SWRM_MCP_SLV_STATUS, &val);
 
-	for (dev_num = 0; dev_num <= SDW_MAX_DEVICES; dev_num++) {
+	for (dev_num = 1; dev_num <= SDW_MAX_DEVICES; dev_num++) {
 		status = (val >> (dev_num * SWRM_MCP_SLV_STATUS_SZ));
 
 		if ((status & SWRM_MCP_SLV_STATUS_MASK) == SDW_SLAVE_ALERT) {
-- 
2.21.0

