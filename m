Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BAA922B5F6
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jul 2020 20:42:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DFF51697;
	Thu, 23 Jul 2020 20:42:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DFF51697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595529776;
	bh=mQ29JLiAw60p+t4rIQBhIE8368ix5vUu4lav9WfPve8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bRJoXoc4iuVOJdDYpIfAbhaSgHLGoc7mnngOCk46+6caAGznx0vglU9dkbWOP4hvu
	 THLrzU7ksmi3qcWRig45OmiPmTrH47p4Kc0CmlfvDVcHfGi+/PfZ2kxurwmYaXLbBL
	 b175o0CeAac2oWxoTZ4mvSjA6BDQa1prWDlglNY0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8AF6FF80290;
	Thu, 23 Jul 2020 20:39:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4DBAAF802C2; Thu, 23 Jul 2020 20:39:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C37A1F8024A
 for <alsa-devel@alsa-project.org>; Thu, 23 Jul 2020 20:39:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C37A1F8024A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="oDcqNVB3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1595529561;
 s=strato-dkim-0002; d=gerhold.net;
 h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=v1yVh4iHi7IW1XLpexzzhD1Rm1YzVZkNHiOXYJIuxiU=;
 b=oDcqNVB3QKwZxw+jj6nXGyQSLicgr8UVYsZrQMUuHFj3T/T25Egv32wF91fy1OzsxJ
 noP1WFIhMmsteEl80g5LogYdKxolGjl9E9iRht0SIPi1307yJ9LjQJWjhOMaLS4GMCAP
 MaM7yincPqe+uf3ERBL2gfOVj0ye5EQM65jP0NizMgDbRL87f6E/e+5VQsi3QRAVceBc
 U15JNPxdf0lP8fHUiUj8ztF18ukwa+UOdnxfD6xkKDHWl1arJZLy+OYLA6Scnk6N8kz3
 PT79XW3Oncv7ev4GCsJWfujzA53mg+VsuLON1Jso8IyLOLbDs+pV8rqKCBCMqwecG2XW
 Y/GA==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB4W6OBfnv"
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
 by smtp.strato.de (RZmta 46.10.5 DYNA|AUTH)
 with ESMTPSA id Y0939ew6NIdH5IF
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 23 Jul 2020 20:39:17 +0200 (CEST)
From: Stephan Gerhold <stephan@gerhold.net>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/7] ASoC: qcom: Use qcom_snd_parse_of() for apq8016_sbc
Date: Thu, 23 Jul 2020 20:38:57 +0200
Message-Id: <20200723183904.321040-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Stephan Gerhold <stephan@gerhold.net>, Patrick Lai <plai@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Cheng-Yi Chiang <cychiang@chromium.org>
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

At the moment we have two separate functions to parse the sound card
properties from the device tree: qcom_snd_parse_of() for DPCM and
apq8016_sbc_parse_of() without DPCM. These functions are almost identical
except for a few minor differences.

This patch set extends qcom_snd_parse_of() to handle links without DPCM,
so that we can use one common function for all (qcom) machine drivers.

Stephan Gerhold (7):
  ASoC: qcom: Use devm for resource management
  ASoC: qcom: common: Use snd_soc_dai_link_set_capabilities()
  ASoC: q6afe: Remove unused q6afe_is_rx_port() function
  ASoC: qcom: common: Support parsing links without DPCM
  ASoC: qcom: common: Parse properties with "qcom," prefix
  ASoC: qcom: apq8016_sbc: Use qcom_snd_parse_of()
  ASoC: qcom: common: Avoid printing errors for -EPROBE_DEFER

 sound/soc/qcom/Kconfig       |   1 +
 sound/soc/qcom/apq8016_sbc.c | 120 ++++-------------------------------
 sound/soc/qcom/apq8096.c     |  28 +-------
 sound/soc/qcom/common.c      |  58 ++++++++++-------
 sound/soc/qcom/qdsp6/q6afe.c |   8 ---
 sound/soc/qcom/qdsp6/q6afe.h |   1 -
 sound/soc/qcom/sdm845.c      |  40 ++----------
 7 files changed, 59 insertions(+), 197 deletions(-)

-- 
2.27.0

