Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A808949247
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Aug 2024 15:56:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 930B93BC2;
	Tue,  6 Aug 2024 15:56:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 930B93BC2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722952589;
	bh=5a1X9wFrWBvpAQTBrO/UprB7XAg2K7Y8ijJUSSEGM4M=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=KuzPcuj8C0AvuGKGIXLd6ddSHSJqYgwnxEL2Hx604kIEIHrjiQoFNlBPDQzIMsqko
	 FZrN3ISa8phwvWR6XwGNybsrAFhw28qduYrvNWGpZkjcS9Vn6DR0D6fdJLC2KGwOHm
	 vOjnS6y+tY8hqJFCVuNZSDyEKJH3NvduX8GeKA30=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4AEBF805AB; Tue,  6 Aug 2024 15:55:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C654EF805AA;
	Tue,  6 Aug 2024 15:55:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA5DCF802DB; Tue,  6 Aug 2024 15:43:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_PASS,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from msa.smtpout.orange.fr (msa-211.smtpout.orange.fr
 [193.252.23.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B3B5CF800E3
	for <alsa-devel@alsa-project.org>; Tue,  6 Aug 2024 15:43:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3B5CF800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256
 header.s=t20230301 header.b=Cdn64Utg
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id bKSxsQhrDrWkDbKSxsiUeV; Tue, 06 Aug 2024 15:43:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1722951789;
	bh=/3TrRDY1xrq9A6NvQnziOhi0PcSU3SG4UHNJJeoANis=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Cdn64UtgloRvBi5reaIPWOGLqOKXMxxD82CJboKK9NuwhH6HxHJvU8OqmvsP2jMDg
	 KR3gAPfsvJopnBlZpdNDtx6kSA0rLGRdr2sGBFELjcDDQeU+C9xVz/Z8ui0I+FukQJ
	 iWwAu7h4L010vJiLL75PmkB9tGYZgqoaXDIQSNW2L0gQ5FJzNL23bi6NcDx8nNrfTZ
	 D0tSL4t1XPVSAxqWUBKuAwWUq3Z4j6UAeQTumXnbYn3xDO4v2SZcradoPEiiKDYdyu
	 FXybXzG2rBk9sUDMBvYeQWIRr2x7y29zvPTdUteLSdpBOQtDbNEws4Eu3hXEuLv5E5
	 r7QWsiaGxjQXg==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 06 Aug 2024 15:43:08 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org
Subject: [PATCH] ASoC: cs43130: Constify struct reg_sequence and reg_sequences
Date: Tue,  6 Aug 2024 15:43:00 +0200
Message-ID: 
 <5b906a0cc9b7be15d0d6310069f54254a75ea767.1722951770.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: K6UY3LB3JQCVJ633COKBPSSYVXN4TUN3
X-Message-ID-Hash: K6UY3LB3JQCVJ633COKBPSSYVXN4TUN3
X-MailFrom: christophe.jaillet@wanadoo.fr
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K6UY3LB3JQCVJ633COKBPSSYVXN4TUN3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

'struct reg_sequence' and 'struct reg_sequences' are not modified in this
drivers.

Constifying these structures moves some data to a read-only section, so
increase overall security.

On a x86_64, with allmodconfig:
Before:
======
   text	   data	    bss	    dec	    hex	filename
  54409	   7881	     64	  62354	   f392	sound/soc/codecs/cs43130.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  55562	   6729	     64	  62355	   f393	sound/soc/codecs/cs43130.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested-only.
---
 sound/soc/codecs/cs43130.c | 40 +++++++++++++++++++-------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/sound/soc/codecs/cs43130.c b/sound/soc/codecs/cs43130.c
index cb4ca80f36d2..f8e2fb69ada2 100644
--- a/sound/soc/codecs/cs43130.c
+++ b/sound/soc/codecs/cs43130.c
@@ -1805,7 +1805,7 @@ static struct attribute *hpload_attrs[] = {
 };
 ATTRIBUTE_GROUPS(hpload);
 
-static struct reg_sequence hp_en_cal_seq[] = {
+static const struct reg_sequence hp_en_cal_seq[] = {
 	{CS43130_INT_MASK_4, CS43130_INT_MASK_ALL},
 	{CS43130_HP_MEAS_LOAD_1, 0},
 	{CS43130_HP_MEAS_LOAD_2, 0},
@@ -1820,7 +1820,7 @@ static struct reg_sequence hp_en_cal_seq[] = {
 	{CS43130_HP_LOAD_1, 0x80},
 };
 
-static struct reg_sequence hp_en_cal_seq2[] = {
+static const struct reg_sequence hp_en_cal_seq2[] = {
 	{CS43130_INT_MASK_4, CS43130_INT_MASK_ALL},
 	{CS43130_HP_MEAS_LOAD_1, 0},
 	{CS43130_HP_MEAS_LOAD_2, 0},
@@ -1828,7 +1828,7 @@ static struct reg_sequence hp_en_cal_seq2[] = {
 	{CS43130_HP_LOAD_1, 0x80},
 };
 
-static struct reg_sequence hp_dis_cal_seq[] = {
+static const struct reg_sequence hp_dis_cal_seq[] = {
 	{CS43130_HP_LOAD_1, 0x80},
 	{CS43130_DXD1, 0x99},
 	{CS43130_DXD12, 0},
@@ -1836,12 +1836,12 @@ static struct reg_sequence hp_dis_cal_seq[] = {
 	{CS43130_HP_LOAD_1, 0},
 };
 
-static struct reg_sequence hp_dis_cal_seq2[] = {
+static const struct reg_sequence hp_dis_cal_seq2[] = {
 	{CS43130_HP_LOAD_1, 0x80},
 	{CS43130_HP_LOAD_1, 0},
 };
 
-static struct reg_sequence hp_dc_ch_l_seq[] = {
+static const struct reg_sequence hp_dc_ch_l_seq[] = {
 	{CS43130_DXD1, 0x99},
 	{CS43130_DXD19, 0x0A},
 	{CS43130_DXD17, 0x93},
@@ -1851,12 +1851,12 @@ static struct reg_sequence hp_dc_ch_l_seq[] = {
 	{CS43130_HP_LOAD_1, 0x81},
 };
 
-static struct reg_sequence hp_dc_ch_l_seq2[] = {
+static const struct reg_sequence hp_dc_ch_l_seq2[] = {
 	{CS43130_HP_LOAD_1, 0x80},
 	{CS43130_HP_LOAD_1, 0x81},
 };
 
-static struct reg_sequence hp_dc_ch_r_seq[] = {
+static const struct reg_sequence hp_dc_ch_r_seq[] = {
 	{CS43130_DXD1, 0x99},
 	{CS43130_DXD19, 0x8A},
 	{CS43130_DXD17, 0x15},
@@ -1866,12 +1866,12 @@ static struct reg_sequence hp_dc_ch_r_seq[] = {
 	{CS43130_HP_LOAD_1, 0x91},
 };
 
-static struct reg_sequence hp_dc_ch_r_seq2[] = {
+static const struct reg_sequence hp_dc_ch_r_seq2[] = {
 	{CS43130_HP_LOAD_1, 0x90},
 	{CS43130_HP_LOAD_1, 0x91},
 };
 
-static struct reg_sequence hp_ac_ch_l_seq[] = {
+static const struct reg_sequence hp_ac_ch_l_seq[] = {
 	{CS43130_DXD1, 0x99},
 	{CS43130_DXD19, 0x0A},
 	{CS43130_DXD17, 0x93},
@@ -1881,12 +1881,12 @@ static struct reg_sequence hp_ac_ch_l_seq[] = {
 	{CS43130_HP_LOAD_1, 0x82},
 };
 
-static struct reg_sequence hp_ac_ch_l_seq2[] = {
+static const struct reg_sequence hp_ac_ch_l_seq2[] = {
 	{CS43130_HP_LOAD_1, 0x80},
 	{CS43130_HP_LOAD_1, 0x82},
 };
 
-static struct reg_sequence hp_ac_ch_r_seq[] = {
+static const struct reg_sequence hp_ac_ch_r_seq[] = {
 	{CS43130_DXD1, 0x99},
 	{CS43130_DXD19, 0x8A},
 	{CS43130_DXD17, 0x15},
@@ -1896,24 +1896,24 @@ static struct reg_sequence hp_ac_ch_r_seq[] = {
 	{CS43130_HP_LOAD_1, 0x92},
 };
 
-static struct reg_sequence hp_ac_ch_r_seq2[] = {
+static const struct reg_sequence hp_ac_ch_r_seq2[] = {
 	{CS43130_HP_LOAD_1, 0x90},
 	{CS43130_HP_LOAD_1, 0x92},
 };
 
-static struct reg_sequence hp_cln_seq[] = {
+static const struct reg_sequence hp_cln_seq[] = {
 	{CS43130_INT_MASK_4, CS43130_INT_MASK_ALL},
 	{CS43130_HP_MEAS_LOAD_1, 0},
 	{CS43130_HP_MEAS_LOAD_2, 0},
 };
 
 struct reg_sequences {
-	struct reg_sequence	*seq;
-	int			size;
-	unsigned int		msk;
+	const struct reg_sequence	*seq;
+	int				size;
+	unsigned int			msk;
 };
 
-static struct reg_sequences hpload_seq1[] = {
+static const struct reg_sequences hpload_seq1[] = {
 	{
 		.seq	= hp_en_cal_seq,
 		.size	= ARRAY_SIZE(hp_en_cal_seq),
@@ -1951,7 +1951,7 @@ static struct reg_sequences hpload_seq1[] = {
 	},
 };
 
-static struct reg_sequences hpload_seq2[] = {
+static const struct reg_sequences hpload_seq2[] = {
 	{
 		.seq	= hp_en_cal_seq2,
 		.size	= ARRAY_SIZE(hp_en_cal_seq2),
@@ -2041,7 +2041,7 @@ static int cs43130_update_hpload(unsigned int msk, int ac_idx,
 }
 
 static int cs43130_hpload_proc(struct cs43130_private *cs43130,
-			       struct reg_sequence *seq, int seq_size,
+			       const struct reg_sequence *seq, int seq_size,
 			       unsigned int rslt_msk, int ac_idx)
 {
 	int ret;
@@ -2122,7 +2122,7 @@ static void cs43130_imp_meas(struct work_struct *wk)
 	int i, ret, ac_idx;
 	struct cs43130_private *cs43130;
 	struct snd_soc_component *component;
-	struct reg_sequences *hpload_seq;
+	const struct reg_sequences *hpload_seq;
 
 	cs43130 = container_of(wk, struct cs43130_private, work);
 	component = cs43130->component;
-- 
2.45.2

