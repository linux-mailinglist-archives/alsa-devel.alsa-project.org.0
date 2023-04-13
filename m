Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D18E6E04AD
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Apr 2023 04:40:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AD8CF7B;
	Thu, 13 Apr 2023 04:40:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AD8CF7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681353657;
	bh=FpoEUek0nZ6/rYxZO9/HhmSNRaGbRNVJv/IpvTq6BKk=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=aup5s69Rb3bi4U6vl5moBEJ5MQSwN4yJLEcMk0aeHV6KXXEL5rrP5LTTIrrg8/tZV
	 Amf5Rbuq7OadxTuLn0O0qyw+LeCigK/TU4FTYfJwyQkzA8iQhaxuBMBUhi9DIywPOb
	 +ucrkETZbWnkb6RgqfbVSSixt1tCXnCP+4Q9qt9M=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D3211F805AD;
	Thu, 13 Apr 2023 04:37:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 451F6F805AE; Thu, 13 Apr 2023 04:37:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 824F4F8023A
	for <alsa-devel@alsa-project.org>; Thu, 13 Apr 2023 04:37:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 824F4F8023A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=lpLC76pI
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6F74563A9B;
	Thu, 13 Apr 2023 02:37:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24299C433D2;
	Thu, 13 Apr 2023 02:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681353450;
	bh=FpoEUek0nZ6/rYxZO9/HhmSNRaGbRNVJv/IpvTq6BKk=;
	h=From:To:Cc:Subject:Date:From;
	b=lpLC76pIMCbCA4sfh6jPwYb1jv5EevO3bA3x37JRAsWx8TXFjJ+rRf60qrSnPb8AR
	 LikdTJrQHQUT26AbGY4MAZEQjcpGwlAsiIZxmddNnWyAoIJ/jLS4wDu5GjHxIE+uRG
	 9zDcvLVcByr38gvosDHFoBxBswQTjw+hm0M8EaYZ6qrX6tWcts0l+CiVHagn/mqKzT
	 HrR7qrc2xtCpiRVd3efA+NHewxcHuwT0noNWnJFbUrfOTMZdEYfKh3U2QTr9MDUm62
	 AiHmF2g5xQeHQkqqt/pP+zGr9MuWuW6lAbrke6dBUjSp5M1KIKXgFHEJrXW3FUUR4S
	 PjldeEbu+FfTg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 1/8] ASOC: Intel: sof_sdw: add quirk for Intel
 'Rooks County' NUC M15
Date: Wed, 12 Apr 2023 22:37:18 -0400
Message-Id: <20230413023727.74875-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: E37KOQ2LFPAGKDRVVSKQWBLZWLQLJ7S7
X-Message-ID-Hash: E37KOQ2LFPAGKDRVVSKQWBLZWLQLJ7S7
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Eugene Huang <eugene.huang99@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Mark Brown <broonie@kernel.org>,
 Sasha Levin <sashal@kernel.org>, cezary.rojewski@intel.com,
 liam.r.girdwood@linux.intel.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, tiwai@suse.com, gongjun.song@intel.com,
 shumingf@realtek.com, yong.zhi@intel.com, alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E37KOQ2LFPAGKDRVVSKQWBLZWLQLJ7S7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Eugene Huang <eugene.huang99@gmail.com>

[ Upstream commit 3c728b1bc5b99c5275ac5c7788ef814c0e51ef54 ]

Same quirks as the 'Bishop County' NUC M15, except the rt711 is in the
'JD2 100K' jack detection mode.

Link: https://github.com/thesofproject/linux/issues/4088
Signed-off-by: Eugene Huang <eugene.huang99@gmail.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Link: https://lore.kernel.org/r/20230314090553.498664-2-yung-chuan.liao@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/boards/sof_sdw.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 2d53a707aff9c..089b6c7994f9a 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -212,6 +212,17 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 					SOF_SDW_PCH_DMIC |
 					RT711_JD1),
 	},
+	{
+		/* NUC15 'Rooks County' LAPRC510 and LAPRC710 skews */
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Intel(R) Client Systems"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "LAPRC"),
+		},
+		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
+					SOF_SDW_PCH_DMIC |
+					RT711_JD2_100K),
+	},
 	/* TigerLake-SDCA devices */
 	{
 		.callback = sof_sdw_quirk_cb,
-- 
2.39.2

