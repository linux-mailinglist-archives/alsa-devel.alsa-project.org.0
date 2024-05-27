Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 372148D06DC
	for <lists+alsa-devel@lfdr.de>; Mon, 27 May 2024 17:55:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B28084D;
	Mon, 27 May 2024 17:55:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B28084D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716825321;
	bh=JBD5uyXOg5U5QC3/XSHMViSJs+yiNdm94tuokjSd038=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tTZRi8dsiVr72hq727MQjNfTgVHfC2LL2j4SjCJvjdO+kimf/EFK0EXDLgmR1GCLg
	 2chkfVUTp02otvcQ293i9INzSv65llyRgADEfFmpjuL730smwDZEz+rEU48Mbujx2u
	 TkTK2All8MkmgpvNarfHtXq/dTmUY5OWMh7v/bCg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9BC13F805C9; Mon, 27 May 2024 17:54:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 30DA7F805B6;
	Mon, 27 May 2024 17:54:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6109F805B0; Mon, 27 May 2024 17:54:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5C25AF805A1
	for <alsa-devel@alsa-project.org>; Mon, 27 May 2024 17:54:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C25AF805A1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=FGgsn+MF
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3BA57CE0FEA;
	Mon, 27 May 2024 15:54:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25B97C32789;
	Mon, 27 May 2024 15:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716825262;
	bh=JBD5uyXOg5U5QC3/XSHMViSJs+yiNdm94tuokjSd038=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FGgsn+MFx2GxrD2JgROhOvlKIXh7l/lGEi7FZz0q7UwZVIrqzOEb3VfGr3wwj8JC4
	 a9dIP7t2vg9tGQ3pFRhNyCYkVyHh6/3npwnsqi0pn1JWc0EcFZI2dJ7h4MiR5XL7Hq
	 iqUywWDBkcR5iQ2+0cjcvn1+85gsOIAbBVVTo4o0YOBban2sEkIfVIdsjGY0Ssznto
	 MRmdH+k6gbdU77QphnTuPzeIseeDXuHI0x13FPbpWIc1OeycskVwtkzcOz1rNZ9/v0
	 cEqNJ3qDHHL3YJlHnwXWhK/MT7kaja14R/LRtz/B1mek05MABDji0qTK2jQpVtiWkt
	 CPrBqn7OyytgA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	cezary.rojewski@intel.com,
	liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	perex@perex.cz,
	tiwai@suse.com,
	ckeepax@opensource.cirrus.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH AUTOSEL 6.8 08/20] ASoC: Intel: sof_sdw: add quirk for Dell
 SKU 0C0F
Date: Mon, 27 May 2024 11:52:51 -0400
Message-ID: <20240527155349.3864778-8-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240527155349.3864778-1-sashal@kernel.org>
References: <20240527155349.3864778-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.8.11
Content-Transfer-Encoding: 8bit
Message-ID-Hash: C4IMIOBKO62M3X5IUEKELI7FM2FHKRUP
X-Message-ID-Hash: C4IMIOBKO62M3X5IUEKELI7FM2FHKRUP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C4IMIOBKO62M3X5IUEKELI7FM2FHKRUP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

[ Upstream commit b10cb955c6c0b8dbd9a768166d71cc12680b7fdf ]

The JD1 jack detection doesn't seem to work, use JD2.
Also use the 4 speaker configuration.

Link: https://github.com/thesofproject/linux/issues/4900
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Link: https://lore.kernel.org/r/20240411220347.131267-5-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/boards/sof_sdw.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 9a4f801be93d1..468724ccde10e 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -429,6 +429,16 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 					RT711_JD2 |
 					SOF_SDW_FOUR_SPK),
 	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0C0F")
+		},
+		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
+					RT711_JD2 |
+					SOF_SDW_FOUR_SPK),
+	},
 	{
 		.callback = sof_sdw_quirk_cb,
 		.matches = {
-- 
2.43.0

