Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E8771F0CC
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Jun 2023 19:31:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76D4A207;
	Thu,  1 Jun 2023 19:30:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76D4A207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685640683;
	bh=RMEAphzv5SI4Uf4hnlQBzgxd/Z3ppGKtTQ5LM+Upek4=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=PJfqKKFfLzZqlnPluTlEvXXqcRjMkuJP9yNsJgjkkVbql+jsFghbYZX/Dk5SZk0KO
	 iA277yoI03rApxoA7Y2lrAV8/R1zaTitbX64hKmVXTe06SwZtUaehFdOTqHyqm8ajQ
	 HArONEJ9VcjQgK+VQBFadhjhlHudu6jzWdazcXyo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C7C77F8047D; Thu,  1 Jun 2023 19:30:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 66C1DF80132;
	Thu,  1 Jun 2023 19:30:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8B4EF80132; Thu,  1 Jun 2023 19:30:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp.smtpout.orange.fr (smtp-19.smtpout.orange.fr
 [80.12.242.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3B87EF800C1
	for <alsa-devel@alsa-project.org>; Thu,  1 Jun 2023 19:30:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B87EF800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256
 header.s=t20230301 header.b=hEQw/usF
Received: from pop-os.home ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id 4m7qqKkRYe9XV4m7qqJitg; Thu, 01 Jun 2023 19:30:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1685640618;
	bh=rhggJM25UscX66J1Ug1pJJ1oVkQChGg3ni6GqVZhFI0=;
	h=From:To:Cc:Subject:Date;
	b=hEQw/usFf5yS+y9l4ClFR8rgeZwr2277zC+d2Mk73yPZjHgov2C9HuWtcnxXuChk3
	 wD8vpbixpGVJtCJoCRO3FNPLN8dON09RpnfHLZbYdz8sheqbwP/nrdWgN1ERr2kIMx
	 LkrEFfXDsYMJmUDxGpbh3sfPP0cK5Lxe4hKUc0Br7+GXhSSe4WUjwFnwA18lEb9nXh
	 fYQCz1GoLvK946K59PwI7IAbtVItKflaWfb0yS6dsU3uK6k4uTe1mPyBwtkQ0A99cu
	 S0OphpjdSucfnF2u9NJ4wUzWLIVvUAaq08Xx8GayAB5iILrKzn7Xke+Ja+ZT/Ov3Yi
	 HcGfLUBumtO1A==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 01 Jun 2023 19:30:18 +0200
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	sound-open-firmware@alsa-project.org,
	alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: SOF: ipc4-topology: Use size_t for variable passed to
 kzalloc()
Date: Thu,  1 Jun 2023 19:30:12 +0200
Message-Id: 
 <a311e4ae83406f714c9d1f7f2f857284265e581c.1685640591.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WGV2APYAR5L2YDIJ2FNKQDUZNSJTN5AX
X-Message-ID-Hash: WGV2APYAR5L2YDIJ2FNKQDUZNSJTN5AX
X-MailFrom: christophe.jaillet@wanadoo.fr
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WGV2APYAR5L2YDIJ2FNKQDUZNSJTN5AX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

struct_size() checks for overflow, but assigning its result to just a u32
may still overflow after a successful check.

Use a size_t instead in order to be cleaner.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Based on analysis from Dan Carpenter on another patch (see [1]).

[1]: https://lore.kernel.org/all/00e84595-e2c9-48ea-8737-18da34eaafbf@kili.mountain/
---
 sound/soc/sof/ipc4-topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index db64e0cb8663..50faa4c88b97 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -881,7 +881,7 @@ static int sof_ipc4_widget_setup_comp_process(struct snd_sof_widget *swidget)
 	/* allocate memory for base config extension if needed */
 	if (process->init_config == SOF_IPC4_MODULE_INIT_CONFIG_TYPE_BASE_CFG_WITH_EXT) {
 		struct sof_ipc4_base_module_cfg_ext *base_cfg_ext;
-		u32 ext_size = struct_size(base_cfg_ext, pin_formats,
+		size_t ext_size = struct_size(base_cfg_ext, pin_formats,
 						swidget->num_input_pins + swidget->num_output_pins);
 
 		base_cfg_ext = kzalloc(ext_size, GFP_KERNEL);
-- 
2.34.1

