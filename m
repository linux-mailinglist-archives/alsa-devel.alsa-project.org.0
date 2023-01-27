Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC1267E95E
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jan 2023 16:23:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3107B851;
	Fri, 27 Jan 2023 16:22:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3107B851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674832984;
	bh=YSs0oOsQ/NH2mTZnpOGtGzWdUOno0vJ3kX9ri4wiCLI=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=otD5d7OohGsb/vdkeu1qJYARFHqcRNpYI6Ncr7rf+mBQHxLYzytRn1Oi+8Ac0hUe7
	 DZBiok3RDa1tqwcCaTeSIcKJ83QfCvlMTT/kDc7BijCJRcwbxoCM/NrN3IOfh486WJ
	 Rfk7Gp0Vu98OuVL9JlpsfdGS6RQv8yF2WBj0dPeA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83B1AF80074;
	Fri, 27 Jan 2023 16:22:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3DDEF80272; Fri, 27 Jan 2023 16:22:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF5FDF80074
 for <alsa-devel@alsa-project.org>; Fri, 27 Jan 2023 16:22:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF5FDF80074
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=axis.com header.i=@axis.com header.a=rsa-sha256
 header.s=axis-central1 header.b=RywIjBDV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1674832922;
 x=1706368922;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6Q91g8T6M+YzmuNxLYBbMPtHrQedE/kL3Km94pCgc7w=;
 b=RywIjBDVBn8iDaEg9CwMbm86zQpf5H0PAlRWfj5XEs3ZLIdrwQ3w3vKn
 kjeY8BlNX7+QFySdqhlJfe5hIoRyiNtFvjGlgsVUoTUQJE9PlxpXcTnWf
 rFYRUr94s03yjlYhqCSIBN5VqArzkNMLbiBR+UKpmwFolydANF/VoNmVQ
 Lh00UjvMQndTLjcKgyFQm+KmdqmA0qnY5o4KH9hteI8wldUcWx0Mtp6bf
 Vsj5WGAc394BWiXOz8qsWXrlVbqv8S0+kS1r+oYcrgdA7/e47JXfPcgwR
 m/D9yPvGzRriEwRzlnjYcHACu92NnKg3BjhRanMBGv0tM9MbeUBiKQ20n w==;
From: Jonas Holmberg <jonashg@axis.com>
To: <alsa-devel@alsa-project.org>
Subject: [PATCH] pcm: hw: fix rate regression
Date: Fri, 27 Jan 2023 16:21:59 +0100
Message-ID: <20230127152159.1552851-1-jonashg@axis.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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

Add a line that seems to have been removed by mistake in commit
7f2d6c3aac3505ceee4b0d3e8b3ca423ce29b070.

Signed-off-by: Jonas Holmberg <jonashg@axis.com>
---
 src/pcm/pcm_hw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/pcm/pcm_hw.c b/src/pcm/pcm_hw.c
index 0588ce5e..daa3e1ff 100644
--- a/src/pcm/pcm_hw.c
+++ b/src/pcm/pcm_hw.c
@@ -356,7 +356,7 @@ static int snd_pcm_hw_hw_refine(snd_pcm_t *pcm, snd_pcm_hw_params_t *params)
 	if (hw->rates.min > 0) {
 		err = _snd_pcm_hw_param_set_minmax(params, SND_PCM_HW_PARAM_RATE,
 						   hw->rates.min, 0, hw->rates.max + 1, -1);
-
+		if (err < 0)
 			return err;
 	}
 
-- 
2.39.1

