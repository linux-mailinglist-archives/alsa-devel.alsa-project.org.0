Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D566FE583
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 22:50:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1D37FE9;
	Wed, 10 May 2023 22:49:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1D37FE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683751825;
	bh=YwAHb3c2fnvhtHgWSN5cGx9OZ3Pa0sDg8y7y4tvcDFQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tXjl9bU0bn7UqWYhbUttOXra3LnrphUg4OIJGiJlV9xd4790kC8mMK3+GwQSwzoJk
	 tevQvuge4y7/EYRiDIrXf/sK2nY9brQASq0m2OWL/1UuaI0NOtzKFobA/lrEAIaic5
	 YtE5T/IizOXC41cQnHdmcfM2ZedaxBM6JC2c58Fw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E756DF80310;
	Wed, 10 May 2023 22:49:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4A79F8052E; Wed, 10 May 2023 22:49:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 80464F80310
	for <alsa-devel@alsa-project.org>; Wed, 10 May 2023 22:49:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80464F80310
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ArxZnJ1V
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 238E564052;
	Wed, 10 May 2023 20:49:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52557C433D2;
	Wed, 10 May 2023 20:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683751758;
	bh=YwAHb3c2fnvhtHgWSN5cGx9OZ3Pa0sDg8y7y4tvcDFQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ArxZnJ1Vswcwhh/pbsQ2O4nH/djNbS5QgNgPqHYemJm+scczkxrTqGIXwqjEaZMlk
	 DI4aYEwqHqkqyBhXLnx+21aHxRc+Zn9qFRZLSndMqdyqIfDTVN/Qk/OYWui5b9ZJ5z
	 n7l1gQRwqIfK47YYdx9cdzAcruLix9rOj09wFiXQTAXfPGfUYwfW/YtpYHbLZuCn2M
	 vn7jo5txE1YiVCKt93YWeXG2yBPesl7ObiyB7/2n4gyi84yrRH702E3zeuXfTlc0cS
	 Z4QsDrKICy/ft2yWWz3JTnA7dP8Ceg4DwhjFblumD+V3sysWAHx7MmPL2t6JbAA39d
	 RbYJwT355ACCQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	agross@kernel.org,
	andersson@kernel.org,
	yung-chuan.liao@linux.intel.com,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 6.3 4/9] soundwire: qcom: gracefully handle too many
 ports in DT
Date: Wed, 10 May 2023 16:49:00 -0400
Message-Id: <20230510204905.104628-4-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230510204905.104628-1-sashal@kernel.org>
References: <20230510204905.104628-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RUP6NV26BG5FMVENVGMBH66CJI4UA3IX
X-Message-ID-Hash: RUP6NV26BG5FMVENVGMBH66CJI4UA3IX
X-MailFrom: sashal@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RUP6NV26BG5FMVENVGMBH66CJI4UA3IX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

[ Upstream commit 2367e0ecb498764e95cfda691ff0828f7d25f9a4 ]

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
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Link: https://lore.kernel.org/r/20230222144412.237832-2-krzysztof.kozlowski@linaro.org
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/soundwire/qcom.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 3354248702900..3e80a4d388cbb 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -1217,6 +1217,9 @@ static int qcom_swrm_get_port_config(struct qcom_swrm_ctrl *ctrl)
 	ctrl->num_dout_ports = val;
 
 	nports = ctrl->num_dout_ports + ctrl->num_din_ports;
+	if (nports > QCOM_SDW_MAX_PORTS)
+		return -EINVAL;
+
 	/* Valid port numbers are from 1-14, so mask out port 0 explicitly */
 	set_bit(0, &ctrl->dout_port_mask);
 	set_bit(0, &ctrl->din_port_mask);
-- 
2.39.2

