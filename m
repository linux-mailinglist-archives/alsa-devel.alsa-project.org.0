Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E027993E794
	for <lists+alsa-devel@lfdr.de>; Sun, 28 Jul 2024 18:11:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D4B6EF2;
	Sun, 28 Jul 2024 18:11:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D4B6EF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722183119;
	bh=ZKrtN/ztZKHxME0bLtjP87f6YS3aHEf/izl9OPV/7s0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FDxtC0nczKNsrTviZFIhPiSTqmYyNoBl9Jn2wAmrzKNMZzrjaxqN5BbMYxuDtmK54
	 Z/aQcuheG1KvHbzJCubbVaFrq4Rnwmqz6/oaEAiSjsA90uPUR2Wy4NM3IwYSldWj2f
	 sw6QaTku4181FCQWJUufwMkw1wBg1QCUPGOd2Pfk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6AB71F805D5; Sun, 28 Jul 2024 18:10:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D1971F805C4;
	Sun, 28 Jul 2024 18:10:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 946F2F80448; Sun, 28 Jul 2024 18:10:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8FD1EF800C9
	for <alsa-devel@alsa-project.org>; Sun, 28 Jul 2024 18:10:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FD1EF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=nTL/RXA4
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F241B6121F;
	Sun, 28 Jul 2024 16:10:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CFE3C4AF0F;
	Sun, 28 Jul 2024 16:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722183001;
	bh=ZKrtN/ztZKHxME0bLtjP87f6YS3aHEf/izl9OPV/7s0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nTL/RXA4ECipN769puQtklsXGq/wreRweAWYVJNFCx41n1cUrx+Ve/Wr2T8RFGP+f
	 ngW0od40rekXuYfjDe2DgkYYDDl90/xlt2Cd91UVHRgh8bJbsLEWhEYCQC1jBNZmi0
	 U2mq4yH7UG08XrSlwgm19U80Gk3gxktF6KtDDQeh7f0m3f0UrwAgwaeiyQgnnKmLJC
	 Oiqbz4TX/DYbtDUrA1QWQBtoxQB4eRGp9zLnaKIMK+1P7/ytcVZwr3S5o72vetYC+P
	 u4fQBf8ZHnB4Sh2g0eaP3peCxicW10lM/oR0lNH0XRjRl0ylS3vEEWZX/kWDz6bm9C
	 CrEnDHCO73T6g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	cezary.rojewski@intel.com,
	liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 02/11] ASoC: Intel: sof_sdw: Add quirks for some
 new Dell laptops
Date: Sun, 28 Jul 2024 12:09:35 -0400
Message-ID: <20240728160954.2054068-2-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240728160954.2054068-1-sashal@kernel.org>
References: <20240728160954.2054068-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.223
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CWLLG55NSNC3RQDAIP4I7H25LISP3QVV
X-Message-ID-Hash: CWLLG55NSNC3RQDAIP4I7H25LISP3QVV
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CWLLG55NSNC3RQDAIP4I7H25LISP3QVV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Charles Keepax <ckeepax@opensource.cirrus.com>

[ Upstream commit 91cdecaba791c74df6da0650e797fe1192cf2700 ]

Add quirks for some new Dell laptops using Cirrus amplifiers in a bridge
configuration.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://msgid.link/r/20240527193552.165567-11-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/boards/sof_sdw.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 25bf73a7e7bfa..ad3694d36d969 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -234,6 +234,22 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 		},
 		.driver_data = (void *)(RT711_JD2_100K),
 	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0CE3")
+		},
+		.driver_data = (void *)(SOF_SIDECAR_AMPS),
+	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0CE4")
+		},
+		.driver_data = (void *)(SOF_SIDECAR_AMPS),
+	},
 	{}
 };
 
-- 
2.43.0

