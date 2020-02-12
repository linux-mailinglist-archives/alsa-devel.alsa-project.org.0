Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C85159EC8
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Feb 2020 02:54:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D58481662;
	Wed, 12 Feb 2020 02:53:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D58481662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581472474;
	bh=DHUjAjLGqyq80n3v9SAEtS/ij4d87CD+Y2xqqAchlcY=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vNpZXKFQvEo1AcUfe02G8nRwqPQ5JYxunJTuV7H6VFAZc6eljyjhuUTAeIMkpUO3K
	 5oKMxMykSYU7pYuUWustMOnvdDkx5B4N0kv3X97d9KyGvA6QBOoAu6kCUzsaX69Sp9
	 U26ziyx2+YNhSso+0mH1pb9k77sEz73GnvkbzbhA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02C48F80147;
	Wed, 12 Feb 2020 02:52:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6194F80145; Wed, 12 Feb 2020 02:52:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.serbinski.com (mail.serbinski.com [162.218.126.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F3F62F800F0
 for <alsa-devel@alsa-project.org>; Wed, 12 Feb 2020 02:52:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3F62F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=serbinski.com header.i=@serbinski.com
 header.b="e9o7LKEW"
Received: from localhost (unknown [127.0.0.1])
 by mail.serbinski.com (Postfix) with ESMTP id 9C5BCD00717;
 Wed, 12 Feb 2020 01:52:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at serbinski.com
Received: from mail.serbinski.com ([127.0.0.1])
 by localhost (mail.serbinski.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w6sI_TrmwMDz; Tue, 11 Feb 2020 20:52:32 -0500 (EST)
Received: from anet (23-233-80-73.cpe.pppoe.ca [23.233.80.73])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.serbinski.com (Postfix) with ESMTPSA id 3FDAAD00693;
 Tue, 11 Feb 2020 20:52:32 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.serbinski.com 3FDAAD00693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=serbinski.com;
 s=default; t=1581472352;
 bh=HeEXjb1mAS3JAt8AjmL+s+xV5zTwkyyh6B62a9LbWeQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=e9o7LKEWtXhjwswZEoVIu2hrsfGBwTXOHUenIb6M7a5su89PFfrYqZWsa2fsDi/gf
 0MStw4EAz9Vx14FpB/TuO4oI8UJaKtGZb38RR+V8sM7QIbw9e8Y41e6IP5xu4zUhDn
 +ZmTfwewWuYqkNHnX8EChG7sEQsMWi0grOZTN0CU=
From: Adam Serbinski <adam@serbinski.com>
To: Mark Brown <broonie@kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Date: Tue, 11 Feb 2020 20:52:22 -0500
Message-Id: <20200212015222.8229-7-adam@serbinski.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200212015222.8229-1-adam@serbinski.com>
References: <20200212015222.8229-1-adam@serbinski.com>
MIME-Version: 1.0
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, Patrick Lai <plai@codeaurora.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Andy Gross <agross@kernel.org>, Adam Serbinski <adam@serbinski.com>,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH v3 6/6] ASoC: qdsp6: dt-bindings: Add q6afe pcm
	dt binding documentation
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

This patch adds documentation of bindings required for PCM ports on AFE.

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
 .../devicetree/bindings/sound/qcom,q6afe.txt  | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6afe.txt b/Documentation/devicetree/bindings/sound/qcom,q6afe.txt
index d74888b9f1bb..6b1b17d31a2a 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6afe.txt
+++ b/Documentation/devicetree/bindings/sound/qcom,q6afe.txt
@@ -51,6 +51,24 @@ configuration of each dai. Must contain the following properties.
 	Definition: Must be list of serial data lines used by this dai.
 	should be one or more of the 0-3 sd lines.
 
+ - qcom,pcm-quantype
+	Usage: required for pcm interface
+	Value type: <u32>
+	Definition: PCM quantization type
+		0 - ALAW, no padding
+		1 - MULAW, no padding
+		2 - Linear, no padding
+		3 - ALAW, padding
+		4 - MULAW, padding
+		5 - Linear, padding
+
+ - qcom,pcm-slot-mapping
+	Usage: required for pcm interface
+	Value type: <prop-encoded-array>
+	Definition: Slot mapping for audio channels. Array size is the number
+		of slots, minimum 1, maximum 4. The value is 0 for no mapping
+		to the slot, or the channel number from 1 to 32.
+
  - qcom,tdm-sync-mode:
 	Usage: required for tdm interface
 	Value type: <prop-encoded-array>
@@ -174,5 +192,29 @@ q6afe@4 {
 			reg = <23>;
 			qcom,sd-lines = <1>;
 		};
+
+		pri-pcm-rx@105 {
+			reg = <105>;
+			qcom,pcm-quantype = <2>;
+			qcom,pcm-slot-mapping = <1>;
+		};
+
+		pri-pcm-tx@106 {
+			reg = <106>;
+			qcom,pcm-quantype = <2>;
+			qcom,pcm-slot-mapping = <1>;
+		};
+
+		quat-pcm-rx@111 {
+			reg = <111>;
+			qcom,pcm-quantype = <5>;
+			qcom,pcm-slot-mapping = <0 0 1>;
+		};
+
+		quat-pcm-tx@112 {
+			reg = <112>;
+			qcom,pcm-quantype = <5>;
+			qcom,pcm-slot-mapping = <0 0 1>;
+		};
 	};
 };
-- 
2.21.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
