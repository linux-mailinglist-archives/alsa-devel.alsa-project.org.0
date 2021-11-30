Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 703F1463734
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Nov 2021 15:49:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B628116D9;
	Tue, 30 Nov 2021 15:48:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B628116D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638283751;
	bh=C0wFLqsmgyh5IjHqFdH8crhMJ/X3jzHE4aKYxgjLFgc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JNrwXTby4sLtg+zY7j+E7cdqDXNd8Fqk70+LL2LBo1/js0QJKFhwQkZc3PYdDDitV
	 8Io8EpM3fUIG76NHp1SUWFe/5DzqYED9YgV3KB0aOfFe/Ow/Qb0eqy3/H+5Rl7GJ/R
	 3N7KDtlyfUUD7BvVSW9zrcPvWXFt1aAjNB9k5c3c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31E5DF8032D;
	Tue, 30 Nov 2021 15:47:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E26BF802A0; Tue, 30 Nov 2021 15:47:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 379A3F8028D
 for <alsa-devel@alsa-project.org>; Tue, 30 Nov 2021 15:47:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 379A3F8028D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="sNrl+mtf"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id E5F1ACE1A3B;
 Tue, 30 Nov 2021 14:47:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70322C53FC1;
 Tue, 30 Nov 2021 14:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638283634;
 bh=C0wFLqsmgyh5IjHqFdH8crhMJ/X3jzHE4aKYxgjLFgc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sNrl+mtfZmLr0o9rYXAPlgkZvstIyRAdZ7nC1NDqLsDIy30pQx/TVaN2qXDIiOtz0
 +ISUKsWqcqQ4NNIWIURqmtfnIuSYAtbVffL9YkwWvaiygM4mLG1cQPy00F5wFeTXmf
 hYei6X7JbqFvwosaS1nDuyTtWy7gbMUXhDxA5Ud3ZhsmA93fDTZu26l2vW1owTmX0R
 fuIUeexslw0/W1ekUzjSb5AzTwEAuZIMmIWdojEzzZJWQFvUr6NUDTjh5/YavlYYPr
 Bjyv2M4kjRPBZhA84izJuo8+Zh05yRfUkVpU6dj9mWRllfkfOYkI8NJdXW6ZYNIT6Z
 AzYLVj/iEwl4A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 02/68] ASoC: Intel: sof_sdw: Add support for SKU
 0AF3 product
Date: Tue, 30 Nov 2021 09:45:58 -0500
Message-Id: <20211130144707.944580-2-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211130144707.944580-1-sashal@kernel.org>
References: <20211130144707.944580-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, libin.yang@intel.com,
 cezary.rojewski@intel.com, kai.vehmanen@linux.intel.com,
 Gongjun Song <gongjun.song@intel.com>, tiwai@suse.com,
 yang.jie@linux.intel.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, liam.r.girdwood@linux.intel.com,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, vamshi.krishna.gopal@intel.com,
 yong.zhi@intel.com
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

From: Gongjun Song <gongjun.song@intel.com>

[ Upstream commit 8f4fa45982b3f2daf5b3626ca0f12bde735f31ff ]

This product supports SoundWire capture from local microphones
and two SoundWire amplifiers(no headset codec).

Signed-off-by: Gongjun Song <gongjun.song@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Link: https://lore.kernel.org/r/20211105022646.26305-2-yung-chuan.liao@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/boards/sof_sdw.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index f10496206ceed..584f9f2db2076 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -248,6 +248,16 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 					SOF_BT_OFFLOAD_SSP(2) |
 					SOF_SSP_BT_OFFLOAD_PRESENT),
 	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0AF3"),
+		},
+		/* No Jack */
+		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
+					SOF_SDW_FOUR_SPK),
+	},
 	{}
 };
 
-- 
2.33.0

