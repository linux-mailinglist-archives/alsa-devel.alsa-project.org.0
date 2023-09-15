Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A44357A26EA
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 21:09:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF03084C;
	Fri, 15 Sep 2023 21:08:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF03084C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694804969;
	bh=MyIJinpQ9MRMn81ExQ9ajAd6WI7sU/Hkeyd+BcDwjgM=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=VVYIw5NSYjm8iFhtQyFgNtpJlmwxRzdLanKDPKm6T9FbTpIa/2o6O7ea8v4842Co1
	 vmi+BP2W5vbYMPu/i6ag0F78jFIKIhDpcG/HstC6g4yx+vWoIVSWU+iSZG58Paqpog
	 olJepi7lnB7h8DnfvnTwwV0IQmhr7dcr7N1dwyUA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 52E0EF80558; Fri, 15 Sep 2023 21:08:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D5CBFF80246;
	Fri, 15 Sep 2023 21:08:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9AB55F80425; Fri, 15 Sep 2023 21:08:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 668FEF80141;
	Fri, 15 Sep 2023 21:08:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 668FEF80141
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=gYy38NgD
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5E2A862162;
	Fri, 15 Sep 2023 19:08:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E4FFC433C9;
	Fri, 15 Sep 2023 19:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694804897;
	bh=MyIJinpQ9MRMn81ExQ9ajAd6WI7sU/Hkeyd+BcDwjgM=;
	h=Date:From:To:Cc:Subject:From;
	b=gYy38NgDEaxdxsygoAP+2/quW8rTNMyRpJP9ZV8TtK+g5Y5u0QXK1UTwRMjbwk8Gz
	 XANgzlbvILid7tntD8XrkILDhzG8La55yDL8I9VW2nMh0CAvBxKoCC72EJZlWuDfbS
	 R6P/JlkAL+PZbhxiQFlm3lBN/9NXAGye5UD+DJ1n0hdLE/CPGjDxAl6I1wNBmYwraW
	 Knm0vmboBjTLurGoatMl48Nr1+bWEfcPBBUw5Y5D6rLzt+U4fWGs8HzKHBzyvbUhU2
	 5IlYhZPOSckqWgsP3grA4OJE/G+1aO6xdYnq+rrEzHBEd/6WqK0AU5zPhLHxgr/8TJ
	 RNEs8sBPAwZGg==
Date: Fri, 15 Sep 2023 13:09:11 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-hardening@vger.kernel.org
Subject: [PATCH][next] ASoC: SOF: ipc4-topology: Use size_add() in call to
 struct_size()
Message-ID: <ZQSr15AYJpDpipg6@work>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: MRKOCZJ5FBPAK2CZ7SA7XO75MU4FLPQJ
X-Message-ID-Hash: MRKOCZJ5FBPAK2CZ7SA7XO75MU4FLPQJ
X-MailFrom: gustavoars@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MRKOCZJ5FBPAK2CZ7SA7XO75MU4FLPQJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

If, for any reason, the open-coded arithmetic causes a wraparound,
the protection that `struct_size()` adds against potential integer
overflows is defeated. Fix this by hardening call to `struct_size()`
with `size_add()`.

Fixes: f9efae954905 ("ASoC: SOF: ipc4-topology: Add support for base config extension")
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 sound/soc/sof/ipc4-topology.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index f2a30cd31378..2a19dd022aaf 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -895,7 +895,8 @@ static int sof_ipc4_widget_setup_comp_process(struct snd_sof_widget *swidget)
 	if (process->init_config == SOF_IPC4_MODULE_INIT_CONFIG_TYPE_BASE_CFG_WITH_EXT) {
 		struct sof_ipc4_base_module_cfg_ext *base_cfg_ext;
 		u32 ext_size = struct_size(base_cfg_ext, pin_formats,
-						swidget->num_input_pins + swidget->num_output_pins);
+					   size_add(swidget->num_input_pins,
+						    swidget->num_output_pins));
 
 		base_cfg_ext = kzalloc(ext_size, GFP_KERNEL);
 		if (!base_cfg_ext) {
-- 
2.34.1

