Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7693A7B46
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Jun 2021 11:56:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7996316A0;
	Tue, 15 Jun 2021 11:55:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7996316A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623750997;
	bh=YFM9eIqoSXVmyFoUt+mbV0LdMzfgA1iE+lanwIqgLO4=;
	h=Resent-From:Resent-Date:Resent-To:From:To:Date:In-Reply-To:
	 References:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FUmCTAizUJMTGsvQ/q14qYbG7k+iH/N3ssp5azeZ0g7O2r5MRR7qX99ds7dsdJGhl
	 Te9EQY4wS2EoTqk0Rins3Jb/2VjB3ue1iCe5PxFJTbk2KrPphJqXWml59obCBN5dmu
	 oL1D5966VaUmvLMerpxHyPM2hQTIHek/FlPAH5wA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9EDB2F80508;
	Tue, 15 Jun 2021 11:52:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D5B6F80424; Mon, 14 Jun 2021 22:12:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1E54F800F7
 for <alsa-devel@alsa-project.org>; Mon, 14 Jun 2021 22:12:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1E54F800F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org
 header.b="IysqAgcw"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4C8026128A
 for <alsa-devel@alsa-project.org>; Mon, 14 Jun 2021 20:12:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org
 header.b="IysqAgcw"
Resent-From: Mark Brown <broonie@sirena.org.uk>
Resent-Date: Mon, 14 Jun 2021 21:12:31 +0100
Resent-Message-ID: <20210614201231.GG5646@sirena.org.uk>
Resent-To: alsa-devel@alsa-project.org
Envelope-to: broonie@sirena.co.uk
Delivery-date: Sat, 05 Jun 2021 03:29:43 +0100
Received: from mail.kernel.org ([198.145.29.99])
 by cassiel.sirena.org.uk with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <SRS0=4y+g=K7=disroot.org=ultracoolguy@kernel.org>)
 id 1lpM4D-004Jhd-1r
 for broonie@sirena.co.uk; Sat, 05 Jun 2021 03:29:43 +0100
Received: by mail.kernel.org (Postfix)
 id 7ADE0613F4; Sat,  5 Jun 2021 02:29:39 +0000 (UTC)
X-Greylist: delayed 379 seconds by postgrey-1.34 at mail.kernel.org;
 Sat, 05 Jun 2021 02:29:38 UTC
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC40D613E7
Authentication-Results: mail.kernel.org; dmarc=pass (p=quarantine dis=none)
 header.from=disroot.org
Authentication-Results: mail.kernel.org;
 spf=pass smtp.mailfrom=ultracoolguy@disroot.org
Received: by mail.kernel.org (Postfix) with ESMTPS id AC40D613E7
 for <broonie@kernel.org>; Sat,  5 Jun 2021 02:29:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 7A8755BDC4;
 Sat,  5 Jun 2021 04:23:22 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at disroot.org
Received: from knopi.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7YbUFVdgOOeZ; Sat,  5 Jun 2021 04:23:21 +0200 (CEST)
From: Gabriel David <ultracoolguy@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1622859801; bh=YFM9eIqoSXVmyFoUt+mbV0LdMzfgA1iE+lanwIqgLO4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=IysqAgcwG92MIB22oh+HeLDu0I6N0T4t2lgwgJmpxqUTCseZodeVNZJG1jJQnx7Fq
 95Q7128Hb+aA7cFIQ843q2/kuYTBr8uCVDOUyvekGfz2tnU82FrdX8Qx9DJ5MELZpE
 CUHAv5RSx1Rk13w5xxhlcbwYVCjdNVbrOa0RJU/O+w8PHER1QN3w2lrsAUuMUJTsEl
 gsrqOdDJtWmzle75QU9j/FXZLAb1gzjoFOavKG1JwkdjAgHm72R3YZc5eMcVEYWxN2
 8gZdcwnl61sQ1OirL5FsG6+4r/YVYDF9+lkCbwbBIbScydS++smz2aCpzrOav/cOIk
 V04X9iqN3Ydcg==
To: broonie@kernel.org,
	srinivas.kandagatla@linaro.org
Date: Fri,  4 Jun 2021 22:22:04 -0400
Message-Id: <20210605022206.13226-3-ultracoolguy@disroot.org>
In-Reply-To: <20210605022206.13226-1-ultracoolguy@disroot.org>
References: <20210605022206.13226-1-ultracoolguy@disroot.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 198.145.29.99
X-SA-Exim-Mail-From: SRS0=4y+g=K7=disroot.org=ultracoolguy@kernel.org
Subject: [PATCH 2/4] ASoC: qdsp6: q6afe: Add Quinary MI2S ports
X-SA-Exim-Version: 4.2.1 (built Sat, 13 Feb 2021 17:57:42 +0000)
X-SA-Exim-Scanned: No (on cassiel.sirena.org.uk); Unknown failure
X-TUID: BWF8WtIq/XiR
X-Mailman-Approved-At: Tue, 15 Jun 2021 11:51:53 +0200
Cc: alsa-devel@alsa-project.org, Gabriel David <ultracoolguy@disroot.org>
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

This patch adds support for the Quinary MI2S ports on LPASS.

Signed-off-by: Gabriel David <ultracoolguy@disroot.org>
---
 sound/soc/qcom/qdsp6/q6afe.c | 8 ++++++++
 sound/soc/qcom/qdsp6/q6afe.h | 2 +-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
index 729d27da0447..625724852a7f 100644
--- a/sound/soc/qcom/qdsp6/q6afe.c
+++ b/sound/soc/qcom/qdsp6/q6afe.c
@@ -120,6 +120,8 @@
 #define AFE_PORT_ID_TERTIARY_MI2S_TX        0x1005
 #define AFE_PORT_ID_QUATERNARY_MI2S_RX      0x1006
 #define AFE_PORT_ID_QUATERNARY_MI2S_TX      0x1007
+#define AFE_PORT_ID_QUINARY_MI2S_RX	    0x1016
+#define AFE_PORT_ID_QUINARY_MI2S_TX	    0x1017
 
 /* Start of the range of port IDs for TDM devices. */
 #define AFE_PORT_ID_TDM_PORT_RANGE_START	0x9000
@@ -620,6 +622,10 @@ static struct afe_port_map port_maps[AFE_PORT_MAX] = {
 				QUATERNARY_MI2S_RX, 1, 1},
 	[QUATERNARY_MI2S_TX] = { AFE_PORT_ID_QUATERNARY_MI2S_TX,
 				QUATERNARY_MI2S_TX, 0, 1},
+	[QUINARY_MI2S_RX]  =  { AFE_PORT_ID_QUINARY_MI2S_RX,
+				QUINARY_MI2S_RX, 1, 1},
+	[QUINARY_MI2S_TX] =   { AFE_PORT_ID_QUINARY_MI2S_TX,
+				QUINARY_MI2S_TX, 0, 1},
 	[PRIMARY_TDM_RX_0] =  { AFE_PORT_ID_PRIMARY_TDM_RX,
 				PRIMARY_TDM_RX_0, 1, 1},
 	[PRIMARY_TDM_TX_0] =  { AFE_PORT_ID_PRIMARY_TDM_TX,
@@ -1596,6 +1602,8 @@ struct q6afe_port *q6afe_port_get_from_id(struct device *dev, int id)
 	case AFE_PORT_ID_TERTIARY_MI2S_TX:
 	case AFE_PORT_ID_QUATERNARY_MI2S_RX:
 	case AFE_PORT_ID_QUATERNARY_MI2S_TX:
+	case AFE_PORT_ID_QUINARY_MI2S_RX:
+	case AFE_PORT_ID_QUINARY_MI2S_TX:
 		cfg_type = AFE_PARAM_ID_I2S_CONFIG;
 		break;
 	case AFE_PORT_ID_PRIMARY_TDM_RX ... AFE_PORT_ID_QUINARY_TDM_TX_7:
diff --git a/sound/soc/qcom/qdsp6/q6afe.h b/sound/soc/qcom/qdsp6/q6afe.h
index f9a1c04e38c2..30fd77e2f458 100644
--- a/sound/soc/qcom/qdsp6/q6afe.h
+++ b/sound/soc/qcom/qdsp6/q6afe.h
@@ -5,7 +5,7 @@
 
 #include <dt-bindings/sound/qcom,q6afe.h>
 
-#define AFE_PORT_MAX		127
+#define AFE_PORT_MAX		129
 
 #define MSM_AFE_PORT_TYPE_RX 0
 #define MSM_AFE_PORT_TYPE_TX 1
-- 
2.31.1

