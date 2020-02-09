Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE0F156B3B
	for <lists+alsa-devel@lfdr.de>; Sun,  9 Feb 2020 16:51:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C9CA1678;
	Sun,  9 Feb 2020 16:50:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C9CA1678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581263475;
	bh=PpyO3O9OBGZBZ1lP8jQfjDdtHmX0GaxVOElI7bi+WWo=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KLLj8o/WKozqc6T5zpyXTV5gJgpg3OWzmrgw9NTyvdLF1XmVWhyH75rP9jjN7p1dP
	 66mtcYZULmwsFJvlFsdg6CnDYWjA15Uoq07xZktsY48S7+1dndm5qsgI3hEy6FGBul
	 2CJP4IwTY0xJka1h+t8tKtUip3n6x0O1xjTeVdm0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A51D7F80277;
	Sun,  9 Feb 2020 16:48:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14935F80276; Sun,  9 Feb 2020 16:48:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.serbinski.com (mail.serbinski.com [162.218.126.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00C2FF800E7
 for <alsa-devel@alsa-project.org>; Sun,  9 Feb 2020 16:48:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00C2FF800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=serbinski.com header.i=@serbinski.com
 header.b="lmYxYZAO"
Received: from localhost (unknown [127.0.0.1])
 by mail.serbinski.com (Postfix) with ESMTP id 7ACEAD006FC;
 Sun,  9 Feb 2020 15:48:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at serbinski.com
Received: from mail.serbinski.com ([127.0.0.1])
 by localhost (mail.serbinski.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xo4SnI5uVEOu; Sun,  9 Feb 2020 10:48:17 -0500 (EST)
Received: from anet (23-233-80-73.cpe.pppoe.ca [23.233.80.73])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.serbinski.com (Postfix) with ESMTPSA id 27C4AD00715;
 Sun,  9 Feb 2020 10:48:09 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.serbinski.com 27C4AD00715
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=serbinski.com;
 s=default; t=1581263289;
 bh=UQULhBFsFv/7KduXszLvTWU0rPWyMPBaOu3wrDjbjjw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lmYxYZAOj8MMW1czRIaqj05/8zMgi28X2PT0HhS0wDLeEgMGnBtxDODssGs8ftJpZ
 SCIgrvkeNGm9IPSJSmu1VY34Z8toTqoaLFvoClrAH2k/ofRcqvowmNfKlt18rMygEj
 +hNajc5V2o1Mrbq5oBGxhTvLjP+VT49fDKPtbggU=
From: Adam Serbinski <adam@serbinski.com>
To: Mark Brown <broonie@kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Date: Sun,  9 Feb 2020 10:47:41 -0500
Message-Id: <20200209154748.3015-2-adam@serbinski.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200209154748.3015-1-adam@serbinski.com>
References: <20200207205013.12274-1-adam@serbinski.com>
 <20200209154748.3015-1-adam@serbinski.com>
MIME-Version: 1.0
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, Patrick Lai <plai@codeaurora.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Andy Gross <agross@kernel.org>, Adam Serbinski <adam@serbinski.com>,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH v2 1/8] ASoC: qdsp6: dt-bindings: Add q6afe pcm
	dt binding
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This patch adds bindings required for PCM ports on AFE.

Signed-off-by: Adam Serbinski <adam@serbinski.com>
CC: Andy Gross <agross@kernel.org>
CC: Mark Rutland <mark.rutland@arm.com>
CC: Liam Girdwood <lgirdwood@gmail.com>
CC: Patrick Lai <plai@codeaurora.org>
CC: Banajit Goswami <bgoswami@codeaurora.org>
CC: Jaroslav Kysela <perex@perex.cz>
CC: Takashi Iwai <tiwai@suse.com>
CC: alsa-devel@alsa-project.org
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
---
 include/dt-bindings/sound/qcom,q6afe.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/dt-bindings/sound/qcom,q6afe.h b/include/dt-bindings/sound/qcom,q6afe.h
index 1df06f8ad5c3..f3a435a112cb 100644
--- a/include/dt-bindings/sound/qcom,q6afe.h
+++ b/include/dt-bindings/sound/qcom,q6afe.h
@@ -107,6 +107,14 @@
 #define QUINARY_TDM_RX_7	102
 #define QUINARY_TDM_TX_7	103
 #define DISPLAY_PORT_RX		104
+#define PRIMARY_PCM_RX		105
+#define PRIMARY_PCM_TX		106
+#define SECONDARY_PCM_RX	107
+#define SECONDARY_PCM_TX	108
+#define TERTIARY_PCM_RX		109
+#define TERTIARY_PCM_TX		110
+#define QUATERNARY_PCM_RX	111
+#define QUATERNARY_PCM_TX	112
 
 #endif /* __DT_BINDINGS_Q6_AFE_H__ */
 
-- 
2.21.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
