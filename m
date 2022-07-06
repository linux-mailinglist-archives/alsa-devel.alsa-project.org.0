Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97EDB568463
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Jul 2022 11:58:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E87DFE0F;
	Wed,  6 Jul 2022 11:57:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E87DFE0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657101485;
	bh=GNydRqjUFil4bhSfWIBYbIUjRA6dHjr/6J2GRlE0dDc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Cu7XLSNRUeUwEaya5lw+SIg0oJFl2lgZRAW/h9prcXv1GmQsXI8J/AJkKucqu8YLc
	 zC78TLcNiDvVtp68ioZOXWU1NIaDzh8svnpx0JSRGwzwuFg9jD/r4WES6xKpAqOokQ
	 qpYDUGB627zrwu+5b1Uha1MDMD+G9/UUNsuLbX6Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B23DF8032B;
	Wed,  6 Jul 2022 11:57:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B9EDF8023A; Wed,  6 Jul 2022 11:57:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96031F800C5
 for <alsa-devel@alsa-project.org>; Wed,  6 Jul 2022 11:56:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96031F800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="xcHKPZCF"
Received: by mail-wm1-x331.google.com with SMTP id
 m6-20020a05600c3b0600b003a0489f412cso8529058wms.1
 for <alsa-devel@alsa-project.org>; Wed, 06 Jul 2022 02:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oQmMEm8R63yDBFMVBDKxeDcvs7uNNmm4G/6GcZxeIkg=;
 b=xcHKPZCFLH+4W4z7z/H/8MzyO4wHmtY3vAz2gkL5sf6QCFGE9oJDTPO/YnSyjqDqu3
 hFZHoSxsOVrkUgYG1IEuzZ1nmebOOkeJwH1hTDcWBRoS2dLx9I0T7BH/AuI60qMMIJ5+
 hho9Mb97ejPk8C8lUl+bZi7mfCMWZwPQ3KvuMUvrbCJHIXDKloFc1OmFiIQ0LgRy7OXK
 EPEw+rMKAxmgZc57xFDdWNQaTUVwb0h9hudbnlF+gqVLNaDUATveSyEcpYUsWDtEhyKP
 VFcSUtb4xRBx2rW5wo+h+kkQopISxtJlX/rh3TpNBt+6k5vLet1wwoaU+TNO8LCRfcz1
 YtVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oQmMEm8R63yDBFMVBDKxeDcvs7uNNmm4G/6GcZxeIkg=;
 b=DNTHWIFe8n2/IH8LOWAWvPBI06GuCJZ/e5LN8AegQ1j3FMRq6wW3ubAr4Q4KT5/V1c
 /1BgdTF9DgFfXjAcQdto4zCfXSNGgobXYhUH+Un9jgm+IvXuQwiozxxLL2qZqwfZPZ77
 rAf+bFSNpcd7q+xMY/cdOUASd1juIMHEQYTNECoDSFkhkXRLPPj2A2vv0j44UU3FvhlK
 djJODHlaW308JqlY+Ks98FioPr/DK/KLCmWrprQQa22oV1X3WymSF07jq3CUYywgeCGs
 3TlD7ClhzzCcmxdGpC39j/0CpnL20Jae5ufNgejoQ5YnuTZorx147xdEhNDvk3P7XX/3
 kBeg==
X-Gm-Message-State: AJIora9sqFnYBsZqR8hhHLnJbDBK+IWuquu7ICEb7Wj9GzD21odQ1tSY
 ftGQXcAArCASk0dcJN8QrfETAA==
X-Google-Smtp-Source: AGRyM1uU55Ngph1vNp6yKEA3e3ftMEDUT75j78jU8Ow98uLQ55SnXHsTE3ElD47QQ82ShMCXfG10NQ==
X-Received: by 2002:a05:600c:4f48:b0:3a0:45dd:8bd5 with SMTP id
 m8-20020a05600c4f4800b003a045dd8bd5mr43952822wmq.80.1657101417104; 
 Wed, 06 Jul 2022 02:56:57 -0700 (PDT)
Received: from srini-hackbase.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 u1-20020a5d6ac1000000b0021b95bcaf7fsm7723390wrw.59.2022.07.06.02.56.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 02:56:56 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org
Subject: [PATCH] soundwire: qcom: Check device status before reading devid
Date: Wed,  6 Jul 2022 10:56:44 +0100
Message-Id: <20220706095644.5852-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, stable@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 yung-chuan.liao@linux.intel.com
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

As per hardware datasheet its recommended that we check the device
status before reading devid assigned by auto-enumeration.

Without this patch we see SoundWire devices with invalid enumeration
addresses on the bus.

Cc: stable@vger.kernel.org
Fixes: a6e6581942ca ("soundwire: qcom: add auto enumeration support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/qcom.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index dbf793e7e5d7..9df970eeca45 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -480,6 +480,10 @@ static int qcom_swrm_enumerate(struct sdw_bus *bus)
 	char *buf1 = (char *)&val1, *buf2 = (char *)&val2;
 
 	for (i = 1; i <= SDW_MAX_DEVICES; i++) {
+		/* do not continue if the status is Not Present  */
+		if (!ctrl->status[i])
+			continue;
+
 		/*SCP_Devid5 - Devid 4*/
 		ctrl->reg_read(ctrl, SWRM_ENUMERATOR_SLAVE_DEV_ID_1(i), &val1);
 
-- 
2.25.1

