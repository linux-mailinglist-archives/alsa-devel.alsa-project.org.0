Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C8769F6F6
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Feb 2023 15:46:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 232E6EAB;
	Wed, 22 Feb 2023 15:45:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 232E6EAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677077166;
	bh=SFVZCWV5Nizy+BnperqerGPPr1gZ/h+zpD8klxC8cvM=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bhVq56fh2asVVl7mmz5DKvSX+KLL/OZ5hUCDbpXRfw6fOmO8tkmq4CLZ90mpuZQJ+
	 4G6rJZQFyFXLTD0Zb7w2GlIrILGw99Ngiysptl6Uq5rlNOw83vs6GM16EHfezAauQj
	 7H3gzOlHNh7L7c+b8XHruAM9WD15o+uBmYRHWiyk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E3C8CF80496;
	Wed, 22 Feb 2023 15:44:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7526AF80266; Wed, 22 Feb 2023 15:44:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AA2A8F80125
	for <alsa-devel@alsa-project.org>; Wed, 22 Feb 2023 15:44:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA2A8F80125
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=hFa4NWrU
Received: by mail-wm1-x32b.google.com with SMTP id
 l7-20020a05600c4f0700b003e79fa98ce1so3654345wmq.2
        for <alsa-devel@alsa-project.org>;
 Wed, 22 Feb 2023 06:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9dadzXX6cbudRfVYbEzwbLwspwzii5vVla/610fZmbs=;
        b=hFa4NWrU8gOj2iDh8IhqNZ/4xMtzeGQqR8dqpkeBWFrz/hEsxZCy+6AuAIYpIctTTP
         el3LjzRGeFJgFUmu3gJRQcxvYGQYQTx3J2hobKOfwc2re0fGryrolzPKrr1CrO1JYRGU
         i7Pwac0yeyVnCLqaJ9dE+sWKfEGAYowY69uPjHxsgxji61WFQj1JYGeXv1tPqUj5DU9e
         +65vUzuULmLf53iyjWDJ0n6Ii0bVUKaKzu1rRHxN5+LhsKjcqiKi+hScJAjzhMaqgV8J
         djTit/6lD3amGDUwE/v7Lkr3onwLnLwo1tnhQ0Fz+kEdpyAyf8zRdzO3Q3cG4fYaNfJU
         IxpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9dadzXX6cbudRfVYbEzwbLwspwzii5vVla/610fZmbs=;
        b=wy+YvZ7mI8ZrVtRnastuRNIBjRIWD6qZ2yZtPb7wau9HpXhBZ8E52ExykD3Ptc8M9Y
         QaA3dNHusWd0okRmRrBdm7gj3fwejgZVrxSUpRynfdTea/0/O/oQL1GsbO3LrgyeEP4r
         9jNu4LDh/dLSY+gmmrWUdfsTDDxWYlGKIgB/MHO6KrRH7GxlLqd0zCgAwINoDFCas4ax
         QE+zbYp7pGOPXG56QQXg3NtnMoe592LIqO/GekvOpkAMHvhsxjowKFX3CL/5QEAgkT/k
         80sKabTq+H5M6kY4URB9yybcuFSfdyvxSIUhVgZSFdfY1tN6+UfDLIDRrNOQ8z4mtQPf
         9zyA==
X-Gm-Message-State: AO0yUKUDqdMIIV6ldw0lRYEFXDg31g/vbD9eqhUqgzWURgrYSdGrB6iS
	TxblkMdhwU7P9WWPsaxGSTpxaw==
X-Google-Smtp-Source: 
 AK7set8DsU6sjRtMpPuWcz637xtbFugsLw0KdwPWGJIsjraqjYs2Eqm7QtVUEpsfQcLT1xvcIGs5tA==
X-Received: by 2002:a05:600c:4495:b0:3df:b5ae:5289 with SMTP id
 e21-20020a05600c449500b003dfb5ae5289mr6368054wmo.8.1677077057306;
        Wed, 22 Feb 2023 06:44:17 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id
 o10-20020a1c750a000000b003e7c89b3514sm5059776wmc.23.2023.02.22.06.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 06:44:16 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] soundwire: qcom: gracefully handle too many ports in DT
Date: Wed, 22 Feb 2023 15:44:12 +0100
Message-Id: <20230222144412.237832-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230222144412.237832-1-krzysztof.kozlowski@linaro.org>
References: <20230222144412.237832-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Y5AXB3VKNRKM5ZNUVQNTF4YUSXIDP5DG
X-Message-ID-Hash: Y5AXB3VKNRKM5ZNUVQNTF4YUSXIDP5DG
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y5AXB3VKNRKM5ZNUVQNTF4YUSXIDP5DG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There are two issues related to the number of ports coming from
Devicetree when exceeding in total QCOM_SDW_MAX_PORTS.  Both lead to
incorrect memory accesses:
1. With DTS having too big value of input or output ports, the driver,
   when copying port parameters from local/stack arrays into 'pconfig'
   array in 'struct qcom_swrm_ctrl', will iterate over their sizes.

2. If DTS also has too many parameters for these ports (e.g.
   qcom,ports-sinterval-low), the driver will overflow buffers on the
   stack when reading these properties from DTS.

Add a sanity check so incorrect DTS will not cause kernel memory
corruption.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soundwire/qcom.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 79bebcecde6d..c296e0bf897b 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -1218,6 +1218,9 @@ static int qcom_swrm_get_port_config(struct qcom_swrm_ctrl *ctrl)
 	ctrl->num_dout_ports = val;
 
 	nports = ctrl->num_dout_ports + ctrl->num_din_ports;
+	if (nports > QCOM_SDW_MAX_PORTS)
+		return -EINVAL;
+
 	/* Valid port numbers are from 1-14, so mask out port 0 explicitly */
 	set_bit(0, &ctrl->dout_port_mask);
 	set_bit(0, &ctrl->din_port_mask);
-- 
2.34.1

