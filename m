Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 555DD6FF9B1
	for <lists+alsa-devel@lfdr.de>; Thu, 11 May 2023 20:57:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 768A01DD;
	Thu, 11 May 2023 20:56:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 768A01DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683831452;
	bh=zfCHa7i9QyCFbh1cpkUjXaCW+hOJFm5MW/4bdohqefo=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qzSnGgb53PuV345fAb0/E1EEh3ke45wT3s4Y8GAkPXFmapdRP7v46rO7wlrEZCBXF
	 sG93pHZeakN3cw6XtZ342y6hsSHTJon2Ehwp4HnnV9kVoEp7BvVdogN66Il9fHn+4N
	 lYWo8kUkaVRhmiMj2zF2eK2gy5BbrMACtlse3CS4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54781F805C5; Thu, 11 May 2023 20:54:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CD87F805C0;
	Thu, 11 May 2023 20:54:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41008F804B1; Thu, 11 May 2023 14:09:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 49006F80310
	for <alsa-devel@alsa-project.org>; Thu, 11 May 2023 14:09:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49006F80310
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20221208 header.b=wS6sSkP9
Received: by mail-yb1-xb49.google.com with SMTP id
 3f1490d57ef6-ba2d0b391d3so10603807276.2
        for <alsa-devel@alsa-project.org>;
 Thu, 11 May 2023 05:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683806984; x=1686398984;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DFFdKRwDpDILumhyLuLJOTrk05DbXLc6wTGy62C/3Mw=;
        b=wS6sSkP9YPrEQci5WRw3K0xUtOK5+0/bwAebx2k91pqCIj0EfYjinxZrDO4ajIZjGM
         93t//KRpj0A5F6J4KjOlKV1y+Lm/ePEWG+KQn/cR4aakq3zES0kTJ5K9FNJ38y837AN0
         zBdhJGmHaQva80CE20d2I7pxXjrPjUcICIIMWKC+WwF8uB15gtNLv/4ImBvcL36KXmeB
         lqIS0virSRAaqSbuFnvycK3dKd0Kl7oqzEVb5PehKYMtdlLdGF42nsRcfsVhiU5qg+8j
         RWNR0gNjin97dZ3upG8fYJP+RPue2YJLbFd3/VCnCJqCjLsUh1T1O2t+pQCpgrkHV8vM
         z1/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683806984; x=1686398984;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DFFdKRwDpDILumhyLuLJOTrk05DbXLc6wTGy62C/3Mw=;
        b=FrIb21e6J/Kp8fyEaLNENzYu4f+DbIcRAcYWL9FJ/9euaMOzP4vtfiIMIafCCRYOMJ
         GjkPxjOFV0p1PDzIEul+c7IvFgMyBfzDm1FFMBXo+iEsw58hZetxEd08KtCMMsvfmoRJ
         x0M770AYjWl43O23h1B2456wtGOTM6aAR7+ddGMWuELv85zzGliJTV/IPIIs/ON9tex5
         6WblA52O2yYSncstPSIunF89sIBD6hvr+Mo/SJ4p84/VJFaQP5Uf8u0LKqfqZa2ZNYuj
         j/cDKwtk4znnGWjKHZXAm/jC/0Jf1q0t9H/I32O9eqZoygAenWyKPa5POk/zsOyQgtob
         Gyaw==
X-Gm-Message-State: AC+VfDw061Nc8AmyTgs/wG5X4oCFEXYfL5sF4CI3IurEcArX/2vkoMai
	y8RczjirceOCVrDFm3ph7Omj7N6fMRZ0gN964w==
X-Google-Smtp-Source: 
 ACHHUZ6WNFGb++Bi1s3+Qljz7xPC8nDjrsTQIYeDWQxaajEyJ9TDJ4kJ1ngdN74pybDKr5utVuVJdeHDE4xVvgjKyw==
X-Received: from yixuanjiang.ntc.corp.google.com
 ([2401:fa00:fc:202:6c9a:64c9:7e44:6b1d])
 (user=yixuanjiang job=sendgmr) by 2002:a25:6648:0:b0:b68:7a4a:5258 with SMTP
 id z8-20020a256648000000b00b687a4a5258mr12799183ybm.3.1683806984600; Thu, 11
 May 2023 05:09:44 -0700 (PDT)
Date: Thu, 11 May 2023 20:08:41 +0800
In-Reply-To: <20230511120841.2096524-1-yixuanjiang@google.com>
Mime-Version: 1.0
References: <20230511120841.2096524-1-yixuanjiang@google.com>
X-Mailer: git-send-email 2.40.1.521.gf1e218fcd8-goog
Message-ID: <20230511120841.2096524-7-yixuanjiang@google.com>
Subject: [PATCH 6/6] ASoC: soc-pcm: fix BE handling of PAUSE_RELEASE
From: yixuanjiang <yixuanjiang@google.com>
To: tiwai@suse.com, lgirdwood@gmail.com, broonie@kernel.org
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Bard Liao <bard.liao@intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Yixuan Jiang <yixuanjiang@google.com>,
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-MailFrom: 
 3CNtcZAsKClsRBQN3GCB3G99HH9E7.5HF3EL3-67O7E3EL3-IKHC75M.HK9@flex--yixuanjiang.bounces.google.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 2HSLSXGWJY3PQQXW77N6ZHAQU4RXI7YC
X-Message-ID-Hash: 2HSLSXGWJY3PQQXW77N6ZHAQU4RXI7YC
X-Mailman-Approved-At: Thu, 11 May 2023 18:54:31 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2HSLSXGWJY3PQQXW77N6ZHAQU4RXI7YC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

[ Upstream commit 3aa1e96a2b95e2ece198f8dd01e96818971b84df ]

A BE connected to more than one FE, e.g. in a mixer case, can go
through the following transitions.

play FE1    -> BE state is START
pause FE1   -> BE state is PAUSED
play FE2    -> BE state is START
stop FE2    -> BE state is STOP (see note [1] below)
release FE1 -> BE state is START
stop FE1    -> BE state is STOP

play FE1    -> BE state is START
pause FE1   -> BE state is PAUSED
play FE2    -> BE state is START
release FE1 -> BE state is START
stop FE2    -> BE state is START
stop FE1    -> BE state is STOP

play FE1    -> BE state is START
play FE2    -> BE state is START (no change)
pause FE1   -> BE state is START (no change)
pause FE2   -> BE state is PAUSED
release FE1 -> BE state is START
release FE2 -> BE state is START (no change)
stop FE1    -> BE state is START (no change)
stop FE2    -> BE state is STOP

The existing code for PAUSE_RELEASE only allows for the case where the
BE is paused, which clearly would not work in the sequences above.

Extend the allowed states to restart the BE when PAUSE_RELEASE is
received, and increase the refcount if the BE is already in START.

[1] the existing logic does not move the BE state back to PAUSED when
the FE2 is stopped. This patch does not change the logic; it would be
painful to keep a history of changes on the FE side, the state machine
is already rather complicated with transitions based on the last BE
state and the trigger type.

Reported-by: Bard Liao <bard.liao@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Link: https://lore.kernel.org/r/20211207173745.15850-7-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Fixes: aa9ff6a4955f ("ASoC: soc-compress: Reposition and add pcm_mutex")
Signed-off-by: Yixuan Jiang <yixuanjiang@google.com>
Cc: stable@vger.kernel.org # 5.15+
---
 sound/soc/soc-pcm.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index b6099d36518f5..6e589708b9338 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2151,7 +2151,10 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 			be->dpcm[stream].state = SND_SOC_DPCM_STATE_START;
 			break;
 		case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-			if ((be->dpcm[stream].state != SND_SOC_DPCM_STATE_PAUSED))
+			if (!be->dpcm[stream].be_start &&
+			    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_START) &&
+			    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_STOP) &&
+			    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_PAUSED))
 				goto next;
 
 			be->dpcm[stream].be_start++;
-- 
2.40.1.521.gf1e218fcd8-goog

