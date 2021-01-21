Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 042542FF27D
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jan 2021 18:53:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 511111917;
	Thu, 21 Jan 2021 18:52:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 511111917
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611251626;
	bh=LW8JzvZJKts5o//cmTHYQ6uPD7CX1c5Y7XKfjIOE1Jk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Jg5Im2Q1QXr9qBZXBDf5BviWH2vsfVLmfkhdwqaJhRad4bFdX/cWWqfMvrOKD8Qs2
	 uQPXelQhStQey07rnNgI3AF0GxH4E6gOaJvr3BoDQdu1NWVILEmBUauG7IaGKYYOm0
	 NWDI1Hnbnx9+HzpdFS6tL9Y4QSWY6jDiMO+wBuy8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 385A1F804B2;
	Thu, 21 Jan 2021 18:52:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A216AF80257; Thu, 21 Jan 2021 18:52:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01AD7F80125
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 18:51:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01AD7F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="H5RbvKJz"
Received: by mail-ej1-x636.google.com with SMTP id ox12so3893913ejb.2
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 09:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=51VcyZ0wcuGuW2m213F8YE94gBtxdpp+DVm+1XUV/kc=;
 b=H5RbvKJzOAZSzZttqk+4D6J5otSROP5TEODNUwb21iPJKfP+Ab3VInvWrEmmIXc51D
 kT4vXcIGucGm/xDXGd5766NQhpstAG53Q8NLEmg4cvuF7NJn7NI2aqKPPNarNCatpphL
 n04UttoRPSTulyYrFLysFiGhqiFnUg2Vsf0CI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=51VcyZ0wcuGuW2m213F8YE94gBtxdpp+DVm+1XUV/kc=;
 b=fHiZF1qVqDvVNkBSnOm1GKnmWPRR2sEOQqeg7Ro5bmdLtjpJBT3vMqxtg0WwKghh3t
 jd0RvjpHckLG3fKCmlI3Yi+I5P0j4sVKrJc3/6zT/U3V/iqAKNmkwxGtKmZvpPRbcRjk
 T/hqJz+SAJAUb6zi57Ekbq8+mgnCnFie6M7f/y7bznBFpIoBJytsuKEUHeZyWdMkchBW
 6eYJE3v6QmofXk8ucOf5DO7E0vOU1kWO9ZN6ZekvQ7miBCVtZQkEQ53RyS5uHEZ//ADb
 HxLTul3x1Xgvfa7+TnRW9onwgl3IzEijJRXoySYndLYkobSzAFeJg+3kBVDugRWcpwQo
 /3jg==
X-Gm-Message-State: AOAM53123ituFLdGDh79yxfZ58a2fzZAoWvJzd3jpCA/+bjTiCDsvrwg
 mDxw9WM90zUcOoX1tlwtpX0KwA==
X-Google-Smtp-Source: ABdhPJx+D8/Miw7niFfErjOQWn8sH7EaMNhkJL7TJSDo4zIFgNNDjogLT0p7KxD+/CzpFUu1z+e5Lw==
X-Received: by 2002:a17:906:4893:: with SMTP id
 v19mr421764ejq.454.1611251513363; 
 Thu, 21 Jan 2021 09:51:53 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
 by smtp.gmail.com with ESMTPSA id w16sm3232349edv.4.2021.01.21.09.51.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 09:51:52 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Mateusz Gorski <mateusz.gorski@linux.intel.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Lukasz Majczak <lma@semihalf.com>
Subject: [PATCH v3 1/2] ASoC: Intel: Skylake: skl-topology: Fix OOPs ib
 skl_tplg_complete
Date: Thu, 21 Jan 2021 18:51:50 +0100
Message-Id: <20210121175151.139111-1-ribalda@chromium.org>
X-Mailer: git-send-email 2.30.0.296.g2bfb1c46d8-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: stable@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
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

Cc: <stable@vger.kernel.org>
Fixes: 2d744ecf2b98 ("ASoC: Intel: Skylake: Automatic DMIC format configuration according to information from NHL")
Tested-by: Lukasz Majczak <lma@semihalf.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
v3: order local variables by length

 sound/soc/intel/skylake/skl-topology.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/sound/soc/intel/skylake/skl-topology.c b/sound/soc/intel/skylake/skl-topology.c
index ae466cd59292..ffd37aaecdf1 100644
--- a/sound/soc/intel/skylake/skl-topology.c
+++ b/sound/soc/intel/skylake/skl-topology.c
@@ -3619,15 +3619,16 @@ static void skl_tplg_complete(struct snd_soc_component *component)
 
 	list_for_each_entry(dobj, &component->dobj_list, list) {
 		struct snd_kcontrol *kcontrol = dobj->control.kcontrol;
-		struct soc_enum *se =
-			(struct soc_enum *)kcontrol->private_value;
-		char **texts = dobj->control.dtexts;
+		struct soc_enum *se;
 		char chan_text[4];
+		char **texts;
 
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
-- 
2.30.0.296.g2bfb1c46d8-goog

