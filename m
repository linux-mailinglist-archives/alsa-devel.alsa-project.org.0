Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAD65BFB0F
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Sep 2022 11:34:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FC5D857;
	Wed, 21 Sep 2022 11:33:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FC5D857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663752877;
	bh=cDYgxt6d9m7saKFCJeRSNNnqSUUfRNu1nLTtqBgnWfo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=e7sbmXyhai0QQuvC+py5ad/7u1xFyQB6MjK4tIgR5M9rlgajcui2ci7OUzR/C4rim
	 v/hF3n1eFI6V9hUHfnm9Vzt3maoDBhmpdUp/t3UJ9zRZtM10j43evuAJT937ILKI0h
	 Ccs+B28exuSR3NMr9qq4OhUlJ05z9hxumm0DtKkQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CADAF800C9;
	Wed, 21 Sep 2022 11:33:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C448CF800C9; Wed, 21 Sep 2022 11:33:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A790BF800C9
 for <alsa-devel@alsa-project.org>; Wed, 21 Sep 2022 11:33:29 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 54817A003F;
 Wed, 21 Sep 2022 11:33:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 54817A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1663752809; bh=wgoml0GqFmReXn/XAl8JMlk1wSjcsTQ3VI5gtAdDVDM=;
 h=From:To:Cc:Subject:Date:From;
 b=ExL3ORkoAsQF+l2+3v6oEYRykdodbWGnXEVMBX4OLlK+slOj+/L2nTIfaZGj6JTdu
 jz0dnH8VASkCQPdPzlezPMHwS+eSwXj9LDnoLU1P3dvTWQidu24c1jDsqdLs9Muo7s
 aNE4gLerzKOpYDsF/BZEUmEmNRvBxvzBE0BQjpmo=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed, 21 Sep 2022 11:33:26 +0200 (CEST)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Subject: [PATCH] ALSA: hda/hdmi: Simplify the pcm_idx condition in
 hdmi_pcm_setup_pin()
Date: Wed, 21 Sep 2022 11:33:22 +0200
Message-Id: <20220921093322.82609-1-perex@perex.cz>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>
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

Make the code more readable.

Signed-off-by: Jaroslav Kysela <perex@perex.cz>
---
 sound/pci/hda/patch_hdmi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index dc36af2928b7..e20e0ed759f6 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -1461,10 +1461,9 @@ static void hdmi_pcm_setup_pin(struct hdmi_spec *spec,
 	int mux_idx;
 	bool non_pcm;
 
-	if (per_pin->pcm_idx >= 0 && per_pin->pcm_idx < spec->pcm_used)
-		pcm = get_pcm_rec(spec, per_pin->pcm_idx);
-	else
+	if (per_pin->pcm_idx < 0 || per_pin->pcm_idx >= spec->pcm_used)
 		return;
+	pcm = get_pcm_rec(spec, per_pin->pcm_idx);
 	if (!pcm->pcm)
 		return;
 	if (!test_bit(per_pin->pcm_idx, &spec->pcm_in_use))
-- 
2.35.3
