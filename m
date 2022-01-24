Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E12C04983A9
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jan 2022 16:36:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C05A28CC;
	Mon, 24 Jan 2022 16:35:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C05A28CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643038570;
	bh=jkhjis8H6JqAp1zJ1gh7YAG/4kx66gcS8datCwYFgUU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j8QCqFWNeGEIfrBZgwfySZoKmssbfETlJLt/U4MViyIqpicToS2hAAcnAvdjIlNoQ
	 J63E3DeUweuscSk7Yu/Ya0EwwQ9cvHQRxTj+gG5KBMt5jcMzRsVM9/dN6JQqiIkDbl
	 kFTJNLMvUhHw5iQCUPxo6DjRXarDRrZYwi8FD0uI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 729BFF80516;
	Mon, 24 Jan 2022 16:34:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75120F80508; Mon, 24 Jan 2022 16:34:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2A0AF80424
 for <alsa-devel@alsa-project.org>; Mon, 24 Jan 2022 16:33:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2A0AF80424
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="NF9JisuH"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 81362B810E0;
 Mon, 24 Jan 2022 15:33:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31603C340E7;
 Mon, 24 Jan 2022 15:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643038436;
 bh=jkhjis8H6JqAp1zJ1gh7YAG/4kx66gcS8datCwYFgUU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NF9JisuHo2ZCNe3U38f3R4mDx/1hyTFPO8bRzd9LPn2FvdP6QP3qolR8dHHB22c3A
 C0JeglThuxvyUSa0iTaT7YMFlZOCCSPDGsZ1Ilq7Y3nnNPVfqiYtE/uEkkI0u+AsKo
 D5mdcY79vZ1OZA6TBgDhcPXjiQnzxvYSx09FkBSLOYuSrwxSinSdeO8lgEg+S10iuU
 AgWLoyNkznRU1/G23BVk6iUtUdkBuZG9CUMY8DgsZ67cSMjlNhmfjUnAG6BER9vkO/
 cTj51zb4srg0d8XFK8odwhPtE7Q9/IFWzojYOErYe3bKn258o5EWTH/Ah9/SB0mKZk
 zB5BXU1egV82A==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v1 3/3] ASoC: ops: Reject out of bounds values in
 snd_soc_put_xr_sx()
Date: Mon, 24 Jan 2022 15:32:53 +0000
Message-Id: <20220124153253.3548853-4-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220124153253.3548853-1-broonie@kernel.org>
References: <20220124153253.3548853-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=739; h=from:subject;
 bh=jkhjis8H6JqAp1zJ1gh7YAG/4kx66gcS8datCwYFgUU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBh7sakWbsihUi6ivlHyc+XDsV04Zi7JuDjensfPO4K
 IJ8b9UeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYe7GpAAKCRAk1otyXVSH0DJIB/
 96C0pXVD2VI++KwpJCPmOEZH7OklDsEyIV++4ozRLs6NggCnOdvVfFSP2FFPntTDvO27bLrkNk+gH8
 FPmc8QUTKpJjEO9r/G2i0XrZM618h8rsIzrqAvzapM8/Z9vi2OJczP2BisdQ9w4pu1Ok9+kXiWbBWt
 ubXmxDDVrQ3ZQsv+qNZQqB1mDE4+gZJVQGIhK2ezPpxgQWWLFb1LkltvX9WSdcjuxoT7vhjTBpqJkf
 DcxrVQuoTDP8PoLqSH/I2ZYutH3TOXAJCTi3vMcGl8u+1XZJ95NOldqMcAaFU1DN5I3g/vVJqbnB/p
 wEpqaYNJymuor3+GM1Ub9Iye1wCHZE
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 stable@vger.kernel.org
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

We don't currently validate that the values being set are within the range
we advertised to userspace as being valid, do so and reject any values
that are out of range.

Signed-off-by: Mark Brown <broonie@kernel.org>
Cc: stable@vger.kernel.org
---
 sound/soc/soc-ops.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index c31e63b27193..dc0e7c8d31f3 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -879,6 +879,8 @@ int snd_soc_put_xr_sx(struct snd_kcontrol *kcontrol,
 	long val = ucontrol->value.integer.value[0];
 	unsigned int i;
 
+	if (val < mc->min || val > mc->max)
+		return -EINVAL;
 	if (invert)
 		val = max - val;
 	val &= mask;
-- 
2.30.2

