Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9F369416B
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Feb 2023 10:39:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63836825;
	Mon, 13 Feb 2023 10:38:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63836825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676281142;
	bh=Tzyp9ZK1WEddWL/ysmPFF2ZBy5FIU97Ouva6h8DrHHM=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=l0sypPbNYPWB3Nr6pKQwAXZL1uLoNPua4MPOVP0Uk9UiK3NpRJVIbHPz4UIltiqQk
	 tsvpu7TWpKAsjqauszwPDd7WY87x8IZL68Ql9hZgkmS1plIIGSyNalp1EibZ5x66wg
	 0Ff9uY3PR8VMvOubHTXSk4gjNxoguMVWP6OcTLHI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 39A5AF804F2;
	Mon, 13 Feb 2023 10:37:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AEF5FF804B4; Mon, 13 Feb 2023 10:37:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from out28-197.mail.aliyun.com (out28-197.mail.aliyun.com
 [115.124.28.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7F243F800B0
	for <alsa-devel@alsa-project.org>; Mon, 13 Feb 2023 10:37:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F243F800B0
X-Alimail-AntiSpam: 
 AC=CONTINUE;BC=0.09901703|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0186795-0.00496536-0.976355;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047205;MF=wangweidong.a@awinic.com;NM=1;PH=DS;RN=21;RT=21;SR=0;TI=SMTPD_---.RKjcWil_1676281013;
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com
 fp:SMTPD_---.RKjcWil_1676281013)
          by smtp.aliyun-inc.com;
          Mon, 13 Feb 2023 17:36:55 +0800
From: wangweidong.a@awinic.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	krzysztof.kozlowski@linaro.org,
	rf@opensource.cirrus.com,
	pierre-louis.bossart@linux.intel.com,
	ckeepax@opensource.cirrus.com,
	shumingf@realtek.com,
	herve.codina@bootlin.com,
	james.schulman@cirrus.com,
	doug@schmorgal.com,
	yang.lee@linux.alibaba.com,
	trix@redhat.com,
	colin.i.king@gmail.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3][next] ASoC: codecs: Fixed a spelling error in the
 function name
Date: Mon, 13 Feb 2023 17:36:47 +0800
Message-Id: <20230213093649.22928-2-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213093649.22928-1-wangweidong.a@awinic.com>
References: <20230213093649.22928-1-wangweidong.a@awinic.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XXUR2WU4JM2BPMBITXMWQXQB4CFL2ZQS
X-Message-ID-Hash: XXUR2WU4JM2BPMBITXMWQXQB4CFL2ZQS
X-MailFrom: wangweidong.a@awinic.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: wangweidong.a@awinic.com, liweilei@awinic.com, zhaolei@awinic.com,
 yijiangtao@awinic.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XXUR2WU4JM2BPMBITXMWQXQB4CFL2ZQS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Weidong Wang <wangweidong.a@awinic.com>

Change the function name aw88395_plack_event to aw88395_playback_event

Signed-off-by: Ben Yi <yijiangtao@awinic.com>
Signed-off-by: Weidong Wang <wangweidong.a@awinic.com>
---
 sound/soc/codecs/aw88395/aw88395.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/aw88395/aw88395.c b/sound/soc/codecs/aw88395/aw88395.c
index 16ca7ac5ad28..afdce6b7fa26 100644
--- a/sound/soc/codecs/aw88395/aw88395.c
+++ b/sound/soc/codecs/aw88395/aw88395.c
@@ -363,7 +363,7 @@ static const struct snd_kcontrol_new aw88395_controls[] = {
 		aw88395_profile_get, aw88395_profile_set),
 };
 
-static int aw88395_plack_event(struct snd_soc_dapm_widget *w,
+static int aw88395_playback_event(struct snd_soc_dapm_widget *w,
 				struct snd_kcontrol *k, int event)
 {
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
@@ -388,7 +388,7 @@ static int aw88395_plack_event(struct snd_soc_dapm_widget *w,
 static const struct snd_soc_dapm_widget aw88395_dapm_widgets[] = {
 	 /* playback */
 	SND_SOC_DAPM_AIF_IN_E("AIF_RX", "Speaker_Playback", 0, 0, 0, 0,
-					aw88395_plack_event,
+					aw88395_playback_event,
 					SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
 	SND_SOC_DAPM_OUTPUT("DAC Output"),
 
-- 
2.39.1

