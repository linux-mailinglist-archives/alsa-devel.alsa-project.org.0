Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A8698BC36
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2024 14:38:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F965DF6;
	Tue,  1 Oct 2024 14:37:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F965DF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727786281;
	bh=xIfw0yRqU10+8BUYFKO706Rgt3ulp51hvcjuux3TZ3o=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Nkr6nZWudH3hsYsvEFn19curd8MfniRsYYRWC1HKqcfkG9mevUuF6N9ZBlkYCWC+l
	 uJUD/JvaDFclM4CQKD/ek+H7JGTWmiKRJwLLsBSf/zWIqnjtTjTkyxwPtMS4HZaGZj
	 Ypuj0Jn7naeYW8w54uMNIwkLXPczekETnskAmfRk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0672F80713; Tue,  1 Oct 2024 14:35:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3299DF805C9;
	Tue,  1 Oct 2024 14:35:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3856F802DB; Wed, 25 Sep 2024 10:00:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from ssh248.corpemail.net (ssh248.corpemail.net [210.51.61.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A8753F80107
	for <alsa-devel@alsa-project.org>; Wed, 25 Sep 2024 10:00:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8753F80107
Received: from ssh248.corpemail.net
        by ssh248.corpemail.net ((D)) with ASMTP (SSL) id WJA00132;
        Wed, 25 Sep 2024 16:00:32 +0800
Received: from localhost.localdomain (10.94.16.163) by
 jtjnmail201601.home.langchao.com (10.100.2.1) with Microsoft SMTP Server id
 15.1.2507.39; Wed, 25 Sep 2024 16:00:33 +0800
From: Charles Han <hanchunchao@inspur.com>
To: <yung-chuan.liao@linux.intel.com>, <ckeepax@opensource.cirrus.com>
CC: <alsa-devel@alsa-project.org>, <pierre-louis.bossart@linux.intel.com>,
	<liam.r.girdwood@linux.intel.com>, <peter.ujfalusi@linux.intel.com>,
	<broonie@kernel.org>, <tiwai@suse.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Charles Han <hanchunchao@inspur.com>
Subject: [PATCH] ASoC: intel: sof_sdw: Add check devm_kasprintf() returned
 value
Date: Wed, 25 Sep 2024 16:00:30 +0800
Message-ID: <20240925080030.11262-1-hanchunchao@inspur.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.94.16.163]
tUid: 2024925160032c5fe208e17589d9e2dc9fa15e5d58d53
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
X-MailFrom: hanchunchao@inspur.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: NQPZ6IMNNPXFAFU3HAPIOYD7YCI3XRKO
X-Message-ID-Hash: NQPZ6IMNNPXFAFU3HAPIOYD7YCI3XRKO
X-Mailman-Approved-At: Tue, 01 Oct 2024 12:35:33 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NQPZ6IMNNPXFAFU3HAPIOYD7YCI3XRKO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

devm_kasprintf() can return a NULL pointer on failure but this
returned value is not checked.

Fixes: b359760d95ee ("ASoC: intel: sof_sdw: Add simple DAI link creation helper")
Signed-off-by: Charles Han <hanchunchao@inspur.com>
---
 sound/soc/intel/boards/sof_sdw.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index d258728d64cf..26917f6f15cf 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -919,6 +919,9 @@ static int create_ssp_dailinks(struct snd_soc_card *card,
 		char *cpu_dai_name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d Pin", i);
 		char *codec_name = devm_kasprintf(dev, GFP_KERNEL, "i2c-%s:0%d",
 						  ssp_info->acpi_id, j++);
+		if (!name || !cpu_dai_name || !codec_name)
+			return -ENOMEM;
+
 		int playback = ssp_info->dais[0].direction[SNDRV_PCM_STREAM_PLAYBACK];
 		int capture = ssp_info->dais[0].direction[SNDRV_PCM_STREAM_CAPTURE];
 
@@ -985,6 +988,9 @@ static int create_hdmi_dailinks(struct snd_soc_card *card,
 	for (i = 0; i < hdmi_num; i++) {
 		char *name = devm_kasprintf(dev, GFP_KERNEL, "iDisp%d", i + 1);
 		char *cpu_dai_name = devm_kasprintf(dev, GFP_KERNEL, "iDisp%d Pin", i + 1);
+		if (!name || !cpu_dai_name)
+			return -ENOMEM;
+
 		char *codec_name, *codec_dai_name;
 
 		if (intel_ctx->hdmi.idisp_codec) {
@@ -996,6 +1002,9 @@ static int create_hdmi_dailinks(struct snd_soc_card *card,
 			codec_dai_name = "snd-soc-dummy-dai";
 		}
 
+		if (!codec_dai_name)
+			return -ENOMEM;
+
 		ret = asoc_sdw_init_simple_dai_link(dev, *dai_links, be_id, name,
 						    1, 0, // HDMI only supports playback
 						    cpu_dai_name, platform_component->name,
@@ -1019,6 +1028,9 @@ static int create_bt_dailinks(struct snd_soc_card *card,
 			SOF_BT_OFFLOAD_SSP_SHIFT;
 	char *name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-BT", port);
 	char *cpu_dai_name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d Pin", port);
+	if (!name || !cpu_dai_name)
+		return -ENOMEM;
+
 	int ret;
 
 	ret = asoc_sdw_init_simple_dai_link(dev, *dai_links, be_id, name,
-- 
2.31.1

