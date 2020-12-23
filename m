Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1712E11FA
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Dec 2020 03:20:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5AE86177B;
	Wed, 23 Dec 2020 03:19:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5AE86177B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608690016;
	bh=07FJ94/JhhjeGtGooCgnuze+tKQIH5U96CHlFU0af00=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kLW/wkpwEz9Cgu19JCxdXXt6Om0wH3icSc+6KOxArqkLRQPrEJioiwx23oZDpPiCT
	 uXU6UYpUwHaHpPkoju8reL7owT8VR6dICEsGPOn6JdE35feakCiWbL2gxarX4/hcEq
	 vVcIlsnan/1uvkfjOVilw1o1N7xLscyoZkAfw91Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC064F801EC;
	Wed, 23 Dec 2020 03:19:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4A3EBF801EB; Wed, 23 Dec 2020 03:19:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EDF65F8013F
 for <alsa-devel@alsa-project.org>; Wed, 23 Dec 2020 03:19:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDF65F8013F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="kFa3GeVw"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 924DA22202;
 Wed, 23 Dec 2020 02:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608689959;
 bh=07FJ94/JhhjeGtGooCgnuze+tKQIH5U96CHlFU0af00=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kFa3GeVw3KSWYUEidErjZa2qej7snOtvL2FGGqjBAkvu+3IMgn/ezbWQ4oI9YbdKa
 XSkrt78/k8NVAP7Ecd8dOs3u2b85nRFiGU1NBkh0Gd2zgv4WbBAVRpCKNIWrqdtzxz
 RcCnogIF8/hLuUpM0gZf8bnF9xqcMj7yXjGX7JY28plQ03II4zJw/0Sh2GLljUItYK
 s44KbRvIEfR+MOjUA6SWNl+yZSBN7REu6NRCRV1uHQtiyeoJrSAd/GCzHSR6FSK3Q+
 meiaHcfOvb/zCQn6vFl1vDC74NT+BMwmfkTyG9ImI/doUrazwJMisl/ZrlS5iHBuTx
 o+5oJK6USxA5g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 051/130] ASoC: SOF: IPC: fix implicit type overflow
Date: Tue, 22 Dec 2020 21:16:54 -0500
Message-Id: <20201223021813.2791612-51-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201223021813.2791612-1-sashal@kernel.org>
References: <20201223021813.2791612-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Curtis Malainey <cujomalainey@chromium.org>
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

From: Curtis Malainey <cujomalainey@chromium.org>

[ Upstream commit 7c1d0e554a359cca77bfabd2a29b06f5322d172d ]

Implicit values may have a length of 15bits (s16) so we need to declare
the proper size so we don't get undefined behaviour. This appears to be
arch and compiler dependent. This commit is to keep the headers aligned
between the firmware and kernel. UBSan discovered this bug in the
firmware.

Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Link: https://lore.kernel.org/r/20201120144025.2166023-1-kai.vehmanen@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 include/sound/sof/header.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/sound/sof/header.h b/include/sound/sof/header.h
index 10f00c08dbb7a..aae673b2bb5e2 100644
--- a/include/sound/sof/header.h
+++ b/include/sound/sof/header.h
@@ -30,12 +30,12 @@
 
 /* Global Message - Generic */
 #define SOF_GLB_TYPE_SHIFT			28
-#define SOF_GLB_TYPE_MASK			(0xf << SOF_GLB_TYPE_SHIFT)
+#define SOF_GLB_TYPE_MASK			(0xfL << SOF_GLB_TYPE_SHIFT)
 #define SOF_GLB_TYPE(x)				((x) << SOF_GLB_TYPE_SHIFT)
 
 /* Command Message - Generic */
 #define SOF_CMD_TYPE_SHIFT			16
-#define SOF_CMD_TYPE_MASK			(0xfff << SOF_CMD_TYPE_SHIFT)
+#define SOF_CMD_TYPE_MASK			(0xfffL << SOF_CMD_TYPE_SHIFT)
 #define SOF_CMD_TYPE(x)				((x) << SOF_CMD_TYPE_SHIFT)
 
 /* Global Message Types */
-- 
2.27.0

