Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 526363A7B45
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Jun 2021 11:56:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DBAA21688;
	Tue, 15 Jun 2021 11:55:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DBAA21688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623750974;
	bh=mOTuzrNODoHvppronXQn2Qed+mKGnQO48IMScAnF73A=;
	h=Resent-From:Resent-Date:Resent-To:From:To:Date:In-Reply-To:
	 References:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kqJ0T1wiZwvjLRhQEM0zMPKgP3tuqTqQRAexk9EbEUlVFjm3Brw4QjgqGFnSN7A4B
	 2mfXbD4iP2XB7D/UCJTT7FLIiHUyxAkzXh1SkfXdahRRHmIkiYVAytCnEUszFQp6vm
	 0IGGzGXBTYva8KESoKEv2l1jelPrQTi4yoxGndko=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12BD3F804FE;
	Tue, 15 Jun 2021 11:52:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82540F80424; Mon, 14 Jun 2021 22:12:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28BF4F800F7
 for <alsa-devel@alsa-project.org>; Mon, 14 Jun 2021 22:12:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28BF4F800F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org
 header.b="XSHXoOvk"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 70EAF61078
 for <alsa-devel@alsa-project.org>; Mon, 14 Jun 2021 20:12:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org
 header.b="XSHXoOvk"
Resent-From: Mark Brown <broonie@sirena.org.uk>
Resent-Date: Mon, 14 Jun 2021 21:12:19 +0100
Resent-Message-ID: <20210614201219.GF5646@sirena.org.uk>
Resent-To: alsa-devel@alsa-project.org
Envelope-to: broonie@sirena.co.uk
Delivery-date: Sat, 05 Jun 2021 03:29:43 +0100
Received: from mail.kernel.org ([198.145.29.99])
 by cassiel.sirena.org.uk with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <SRS0=4y+g=K7=disroot.org=ultracoolguy@kernel.org>)
 id 1lpM4D-004Jhc-1a
 for broonie@sirena.co.uk; Sat, 05 Jun 2021 03:29:43 +0100
Received: by mail.kernel.org (Postfix)
 id 7912961418; Sat,  5 Jun 2021 02:29:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id AE951613F4
 for <broonie@kernel.org>; Sat,  5 Jun 2021 02:29:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE951613F4
Authentication-Results: mail.kernel.org; dmarc=pass (p=quarantine dis=none)
 header.from=disroot.org
Authentication-Results: mail.kernel.org;
 spf=pass smtp.mailfrom=ultracoolguy@disroot.org
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id ED3915BDBE;
 Sat,  5 Jun 2021 04:23:19 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at disroot.org
Received: from knopi.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AM_P3zjEn3b7; Sat,  5 Jun 2021 04:23:19 +0200 (CEST)
From: Gabriel David <ultracoolguy@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1622859799; bh=mOTuzrNODoHvppronXQn2Qed+mKGnQO48IMScAnF73A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=XSHXoOvkB/4V5O2zciwXkHEaYsjkdo3mIz7z/jvwnlEMR8ePy+zpuKj0lwk7Kgosl
 q26ZrNPGT8RLXXflGEyDxK7csHXpN+fs9XFCcQvTiGsHPLup2xPlS5x69jgJbjkO8D
 psWHT9UFYsLvknqD97/vGMzYfwG6lm1rZQIG41ydfQ73EQ8WWRGRrekWllJ190hop9
 sQOIuP4TUCAnEkpHUHwMx2F3I0F53/o3q3RQ8l8w7W36MfQpN/Nbytwx3m8lcBtXeA
 YHN1dh19GYdvnb2ozt3nrANBmrqyPDcCNSsMWKlPJcuk6xSoE9A43t5F+f4U9i3v0+
 9TQEwGcMdwTzg==
To: broonie@kernel.org,
	srinivas.kandagatla@linaro.org
Date: Fri,  4 Jun 2021 22:22:03 -0400
Message-Id: <20210605022206.13226-2-ultracoolguy@disroot.org>
In-Reply-To: <20210605022206.13226-1-ultracoolguy@disroot.org>
References: <20210605022206.13226-1-ultracoolguy@disroot.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 198.145.29.99
X-SA-Exim-Mail-From: SRS0=4y+g=K7=disroot.org=ultracoolguy@kernel.org
Subject: [PATCH 1/4] ASoC: q6afe: dt-bindings: Add QUIN_MI2S_RX/TX
X-SA-Exim-Version: 4.2.1 (built Sat, 13 Feb 2021 17:57:42 +0000)
X-SA-Exim-Scanned: No (on cassiel.sirena.org.uk); Unknown failure
X-TUID: Vch8kDEaDfuc
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

This patch adds bindings required for Quinary MI2S ports on AFE.

Signed-off-by: Gabriel David <ultracoolguy@disroot.org>
---
 include/dt-bindings/sound/qcom,q6afe.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/sound/qcom,q6afe.h b/include/dt-bindings/sound/qcom,q6afe.h
index f64b5d2e6efd..66c21ab03eef 100644
--- a/include/dt-bindings/sound/qcom,q6afe.h
+++ b/include/dt-bindings/sound/qcom,q6afe.h
@@ -129,6 +129,8 @@
 #define TX_CODEC_DMA_TX_5	124
 #define RX_CODEC_DMA_RX_6	125
 #define RX_CODEC_DMA_RX_7	126
+#define QUINARY_MI2S_RX		127
+#define QUINARY_MI2S_TX		128
 
 #define LPASS_CLK_ID_PRI_MI2S_IBIT	1
 #define LPASS_CLK_ID_PRI_MI2S_EBIT	2
-- 
2.31.1

