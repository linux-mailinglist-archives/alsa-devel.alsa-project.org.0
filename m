Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E33793E78F
	for <lists+alsa-devel@lfdr.de>; Sun, 28 Jul 2024 18:11:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 167FBE9D;
	Sun, 28 Jul 2024 18:11:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 167FBE9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722183096;
	bh=5a30SfJIZmq7iTMLZ4NkwPdCwdreEiJp3iMfcFRfd7E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VI7ffZEGYGySnmvFOE0uxxqlvlRkP4pQaObaZkxJ5X04JpANrRJoEIq3qOp4Gcy7v
	 1kqRXy4SI+46xDVGnu2+jLEyIGbT3pkY2QGk6Yu0rLuJdGQBb+loVxgW4Y2/eL8wZS
	 fH+ORiufziLnwcNOj5M6llMCAv6sNYw0ZMFyZLyU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C8C0F806BF; Sun, 28 Jul 2024 18:09:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 112B9F806B7;
	Sun, 28 Jul 2024 18:09:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96CF1F80579; Sun, 28 Jul 2024 18:09:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 44C9EF80580
	for <alsa-devel@alsa-project.org>; Sun, 28 Jul 2024 18:09:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44C9EF80580
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jt07ItmH
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AAAD861221;
	Sun, 28 Jul 2024 16:09:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D162C4AF0B;
	Sun, 28 Jul 2024 16:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722182971;
	bh=5a30SfJIZmq7iTMLZ4NkwPdCwdreEiJp3iMfcFRfd7E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jt07ItmHJeCxiBf7gD2Uyvny+IUjHLcZrVDgHNAsN19RRkDzRRWJzw9aCQnP0UEQW
	 z1092sdvYvxYE9p7PK9FXv0yBidosWVuJ1oWtW1sD+QCLM8lL2IX8T9n96wamwARIz
	 GrNp47wEzJK64SdPbKl26dDyxJpPzeM0m0SXeUqzqnQJJkkocTf+3x+OeTsDe6yA8R
	 sWrC0BAqGrCmtiIZnYcnoIe6PEmdjjL15LM9tcxJkTTw5tmlevwZQtd8dGJhesCQ8F
	 Sp79+JXod+dZ3/J6sUeXvEzNhX821KRj54ttOp/MvWPCy5g4gMXDYVN9uFf8Zf5cAL
	 Js/k0HPjEeRzA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	cezary.rojewski@intel.com,
	liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	perex@perex.cz,
	tiwai@suse.com,
	ckeepax@opensource.cirrus.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 09/13] ASoC: Intel: sof_sdw: fix jack detection
 on ADL-N variant RVP
Date: Sun, 28 Jul 2024 12:08:51 -0400
Message-ID: <20240728160907.2053634-9-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240728160907.2053634-1-sashal@kernel.org>
References: <20240728160907.2053634-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.164
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CYEQVGKZ66BOGN33LLGEECELRDPGZG4H
X-Message-ID-Hash: CYEQVGKZ66BOGN33LLGEECELRDPGZG4H
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CYEQVGKZ66BOGN33LLGEECELRDPGZG4H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

[ Upstream commit 65c90df918205bc84f5448550cde76a54dae5f52 ]

Experimental tests show that JD2_100K is required, otherwise the jack
is detected always even with nothing plugged-in.

To avoid matching with other known quirks the SKU information is used.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://patch.msgid.link/20240624121119.91552-2-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/boards/sof_sdw.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 089b6c7994f9a..cfa0c3eaffea7 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -258,6 +258,15 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 					SOF_BT_OFFLOAD_SSP(2) |
 					SOF_SSP_BT_OFFLOAD_PRESENT),
 	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Intel Corporation"),
+			DMI_MATCH(DMI_PRODUCT_SKU, "0000000000070000"),
+		},
+		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
+					RT711_JD2_100K),
+	},
 	{
 		.callback = sof_sdw_quirk_cb,
 		.matches = {
-- 
2.43.0

