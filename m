Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0BB88A088
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Mar 2024 13:57:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9171620C0;
	Mon, 25 Mar 2024 13:57:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9171620C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711371469;
	bh=RUllOB4kMGk0CFo8XwTIjMOO3T3GbHWi6dMwwwH6M9E=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Lzk8bVkivvyZ+kB9GXMnWrq9wXdnBbAthh+guDcIR0tekty7IMRsATvSxeyOi7LNP
	 k5CVY8gemcEgFc6WxQnluizisluy1pDmGPcMiXprkjIqx6hqxtTt+yGTPhwef0rxWJ
	 KXlaHsWwD1Gaj95n5/dKnlt35cOwsT++wFBYoqVk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51163F805D4; Mon, 25 Mar 2024 13:57:09 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B2876F8057E;
	Mon, 25 Mar 2024 13:57:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33409F802DB; Mon, 25 Mar 2024 13:57:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 54C78F801EB
	for <alsa-devel@alsa-project.org>; Mon, 25 Mar 2024 13:56:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54C78F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=BYwSrx7R
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42P3wbgC000927;
	Mon, 25 Mar 2024 07:56:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=xj2uHvx66aHHaH32S4duzTFa+mcPFLckOCA6lL3XaxE=; b=
	BYwSrx7RG1FXLgZH305/A63SWtbzmJ6uJBuLPZlf9zawx6UYuhy5mmplZaIAcnP1
	YJOgh7NY8n9OXwmMUnyC5d6E/MfIDpOFKYgbwiebrxwVqkUSRgd8OXUwF8hmlwhQ
	U44MWUUdPPKcte2SotUyMpIWUfqhLC896uTgOU+PO1MhTkiMMC7FbJupIHrSnjIq
	gs2ZCly7dqy3M4mmNyFzvXH+JA69EGNlSpQhGTnTlEnVYJZQYCTlzEYm1n9+pUJe
	ILzzfpqijw9fsvLMDctuRsFJU/vJtIlslgEowZZCqTBF7oG/IQ3eoe4Ec/b3/5+k
	/qxVn75v2TLMBcSJyRaMuw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3x1vfyba74-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Mar 2024 07:56:53 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 25 Mar
 2024 12:56:50 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.4 via Frontend Transport; Mon, 25 Mar 2024 12:56:50 +0000
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com
 [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 48FED82024D;
	Mon, 25 Mar 2024 12:56:50 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Richard
 Fitzgerald" <rf@opensource.cirrus.com>
Subject: [PATCH 2/3] ASoC: soc-card: Use snd_ctl_find_id_mixer() instead of
 open-coding
Date: Mon, 25 Mar 2024 12:56:49 +0000
Message-ID: <20240325125650.213913-3-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240325125650.213913-1-rf@opensource.cirrus.com>
References: <20240325125650.213913-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: YKNsErgc-SVE7LA5WL0DpKQBZVrZCXeo
X-Proofpoint-GUID: YKNsErgc-SVE7LA5WL0DpKQBZVrZCXeo
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 4KLVHHQAV2K7FD5BIGWQX5VN62EZNCNV
X-Message-ID-Hash: 4KLVHHQAV2K7FD5BIGWQX5VN62EZNCNV
X-MailFrom: prvs=081491209a=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4KLVHHQAV2K7FD5BIGWQX5VN62EZNCNV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use the snd_ctl_find_id_mixer[_locked]() wrapper in
snd_soc_card_get_kcontrol[_locked]() instead of open-coding a custom
list walk of the card controls list.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/soc-card.c | 21 ++++-----------------
 1 file changed, 4 insertions(+), 17 deletions(-)

diff --git a/sound/soc/soc-card.c b/sound/soc/soc-card.c
index 8a2f163da6bc..0a3104d4ad23 100644
--- a/sound/soc/soc-card.c
+++ b/sound/soc/soc-card.c
@@ -32,33 +32,20 @@ static inline int _soc_card_ret(struct snd_soc_card *card,
 struct snd_kcontrol *snd_soc_card_get_kcontrol_locked(struct snd_soc_card *soc_card,
 						      const char *name)
 {
-	struct snd_card *card = soc_card->snd_card;
-	struct snd_kcontrol *kctl;
-
-	/* must be held read or write */
-	lockdep_assert_held(&card->controls_rwsem);
-
 	if (unlikely(!name))
 		return NULL;
 
-	list_for_each_entry(kctl, &card->controls, list)
-		if (!strncmp(kctl->id.name, name, sizeof(kctl->id.name)))
-			return kctl;
-	return NULL;
+	return snd_ctl_find_id_mixer_locked(soc_card->snd_card, name);
 }
 EXPORT_SYMBOL_GPL(snd_soc_card_get_kcontrol_locked);
 
 struct snd_kcontrol *snd_soc_card_get_kcontrol(struct snd_soc_card *soc_card,
 					       const char *name)
 {
-	struct snd_card *card = soc_card->snd_card;
-	struct snd_kcontrol *kctl;
-
-	down_read(&card->controls_rwsem);
-	kctl = snd_soc_card_get_kcontrol_locked(soc_card, name);
-	up_read(&card->controls_rwsem);
+	if (unlikely(!name))
+		return NULL;
 
-	return kctl;
+	return snd_ctl_find_id_mixer(soc_card->snd_card, name);
 }
 EXPORT_SYMBOL_GPL(snd_soc_card_get_kcontrol);
 
-- 
2.39.2

