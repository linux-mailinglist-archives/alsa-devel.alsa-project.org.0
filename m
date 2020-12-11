Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E20FB2D7D24
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Dec 2020 18:40:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26BBD1753;
	Fri, 11 Dec 2020 18:39:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26BBD1753
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607708449;
	bh=EVeP3jEKGJ2nnb0wSUWPREzRRR+Uxi+evhpQQdxIjVg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KuTROTVpAN7xPixLQZZW6gCyj5o2md2Y46Q5uhrA0bR/Rp6sbVtiwEP7QKopVyhuk
	 uqrr6Lj3jgpcL6qxcH2HzbAIx0txyl5QCqMCmj+ndZzKGCxA9XetvJNRqnIcOQzYrl
	 UVhddOZ+7CadCeAUv0bGT3oFC2nv3k9Avd8qG2Vs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B0C6F8021D;
	Fri, 11 Dec 2020 18:39:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A85A7F8020D; Fri, 11 Dec 2020 18:06:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9AADAF8014E
 for <alsa-devel@alsa-project.org>; Fri, 11 Dec 2020 18:06:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9AADAF8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="QPdgAmqa"
Received: by mail-wr1-x444.google.com with SMTP id t4so9721353wrr.12
 for <alsa-devel@alsa-project.org>; Fri, 11 Dec 2020 09:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g8zX5fIH9uKJS0RZzLnoP4TzFB+P9VHxAQFkUoP/67o=;
 b=QPdgAmqayhSJPmy887Ad16AJkqcIS/QoRc1rogbiRUibbD7IewVil7Fbq0GrqbKdsM
 PfomXTQRE678qiS0L3z3u8hW33MVPEN5uwT0FR9Oo/je/6HVEuf/lh3VNMnfK7S62lEF
 7xgRmfSXLJPEEDiHxDplLx8DDAtjH6LOds3+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g8zX5fIH9uKJS0RZzLnoP4TzFB+P9VHxAQFkUoP/67o=;
 b=fFLqGLuy+vqvWeQedZgFy0/q1SIoSdok+XBqUVYw7ySLRK2S6rwarrm2R8tJtBy0Kp
 36iBKpfhObGTeYILuax2p+QaWPEzhdga6RjciyEPsJ5laVdRWPCkx+MhF5CCP1olod1K
 +2BIzavRV8/C7I3KdnrtVicucY5Zw7ABpjaXNwcFI2ld8YShvo1w4QZE0buZo0gc9mVp
 ldzsc4Sprld3zoRSdn1XAfM/1qEUOqsmfuHZA+imi+d8M1f+zPIbOr3/CA2EQKxQZt3D
 4f5OXv88aldFWCZTxHubipqmAXNQt9V+1bB6bT4XNkb5JyUAxjFJ0hw7TaX4SmkcCuah
 sMdA==
X-Gm-Message-State: AOAM530yjvxUETMYm67HJk/OBvxsmRm/Ey+tJduZ085KGLnfAWwlYa4j
 7zcrtafKloyT6yNuPww5ozH81Q==
X-Google-Smtp-Source: ABdhPJyiv3j7K0H57fwiqhv5UkIV7W1Xa/63zhYkYCDfy2XnWY6xMQhBE6ef4VHZ7yxsWz1RrF49Sw==
X-Received: by 2002:adf:81a2:: with SMTP id 31mr14851609wra.381.1607706391726; 
 Fri, 11 Dec 2020 09:06:31 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
 by smtp.gmail.com with ESMTPSA id h98sm17797100wrh.69.2020.12.11.09.06.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Dec 2020 09:06:31 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Mateusz Gorski <mateusz.gorski@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: Intel: Skylake: skl-topology: Fix OOPs ib
 skl_tplg_complete
Date: Fri, 11 Dec 2020 18:06:29 +0100
Message-Id: <20201211170629.871085-1-ribalda@chromium.org>
X-Mailer: git-send-email 2.29.2.576.ga3fc446d84-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 11 Dec 2020 18:39:03 +0100
Cc: Ricardo Ribalda <ribalda@chromium.org>
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

If dobj->control is not initialized we end up in an OOPs during
skl_tplg_complete:

[   26.553358] BUG: kernel NULL pointer dereference, address:
0000000000000078
[   26.561151] #PF: supervisor read access in kernel mode
[   26.566897] #PF: error_code(0x0000) - not-present page
[   26.572642] PGD 0 P4D 0
[   26.575479] Oops: 0000 [#1] PREEMPT SMP PTI
[   26.580158] CPU: 2 PID: 2082 Comm: udevd Tainted: G         C
5.4.81 #4
[   26.588232] Hardware name: HP Soraka/Soraka, BIOS
Google_Soraka.10431.106.0 12/03/2019
[   26.597082] RIP: 0010:skl_tplg_complete+0x70/0x144 [snd_soc_skl]

Fixes: 2d744ecf2b98 ("ASoC: Intel: Skylake: Automatic DMIC format configuration according to information from NHL")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 sound/soc/intel/skylake/skl-topology.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/sound/soc/intel/skylake/skl-topology.c b/sound/soc/intel/skylake/skl-topology.c
index 40bee10b0c65..0955cbb4e918 100644
--- a/sound/soc/intel/skylake/skl-topology.c
+++ b/sound/soc/intel/skylake/skl-topology.c
@@ -3619,19 +3619,20 @@ static void skl_tplg_complete(struct snd_soc_component *component)
 
 	list_for_each_entry(dobj, &component->dobj_list, list) {
 		struct snd_kcontrol *kcontrol = dobj->control.kcontrol;
-		struct soc_enum *se =
-			(struct soc_enum *)kcontrol->private_value;
-		char **texts = dobj->control.dtexts;
+		struct soc_enum *se;
+		char **texts;
 		char chan_text[4];
 
-		if (dobj->type != SND_SOC_DOBJ_ENUM ||
-		    dobj->control.kcontrol->put !=
-		    skl_tplg_multi_config_set_dmic)
+		if (dobj->type != SND_SOC_DOBJ_ENUM || !kcontrol ||
+		    kcontrol->put != skl_tplg_multi_config_set_dmic)
 			continue;
+
+		se = (struct soc_enum *)kcontrol->private_value;
+		texts = dobj->control.dtexts;
 		sprintf(chan_text, "c%d", mach->mach_params.dmic_num);
 
 		for (i = 0; i < se->items; i++) {
-			struct snd_ctl_elem_value val;
+			struct snd_ctl_elem_value val = {};
 
 			if (strstr(texts[i], chan_text)) {
 				val.value.enumerated.item[0] = i;
-- 
2.29.2.576.ga3fc446d84-goog

