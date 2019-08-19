Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9979508C
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2019 00:12:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A95D4166F;
	Tue, 20 Aug 2019 00:11:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A95D4166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566252752;
	bh=AICxfMoFESrWztqVak4rOuxWzzoeJa9D4xRqNIYS3u4=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QsuS0JHPGK0xj9PlH1mEx56YgwpczNIeD8xcANzhRdbowpJvUd+Kh6fLUvDWu8x+T
	 3aIpABdNerSM/RXB89tIaRSHBq0rTQGLvz5AHUgtkOfalGJyMkFbkvyYRbbrPtViym
	 /JIkzmJFd5pZW58H6TKqdLvqN/XO1n80L3fYJ7nY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9A09F802E0;
	Tue, 20 Aug 2019 00:10:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2DF90F802E0; Tue, 20 Aug 2019 00:10:46 +0200 (CEST)
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A585F800BF
 for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2019 00:00:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A585F800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="a2Sj2DY/"
Received: by mail-io1-xd42.google.com with SMTP id q22so7763905iog.4
 for <alsa-devel@alsa-project.org>; Mon, 19 Aug 2019 15:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3ZgzZCpDIRuYNI4rsUcoYKrHpCVfBSnxQC5KIpwxRrk=;
 b=a2Sj2DY/hIiVjiyTeltsCTax6Jr86BvQ1q20cGy89ezNAuCsp4oGSbglZYJmpvmlAR
 5XYEPUBp752xX3OqexzfWN1hPfOMiOC23tVax7ZJ/Mj4BzZy8MJw9vPxI+b/OtMO1TPD
 gAgbZP1u6kOn8hfc1CU44U5trPwTiUIZcnewTQDkKWe+urYKFH1JTGVUDCw3zcmUXUpK
 mqD2NDEZl2vpqUArI4lxwtIItziAmaYSzInQF0Qse4Ramd9mh5oWIPiOUE1xisFsnyrr
 DM5rw1+vQcfoqWXSszdg4pHo4koi80/6CQb4ud1BOXTGjuuACa3nnSFjNkKyGD4FfKYS
 LnUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3ZgzZCpDIRuYNI4rsUcoYKrHpCVfBSnxQC5KIpwxRrk=;
 b=kjbBLt51ysUYK48wO2OiZaVE0+NWOJQieQZ17sbR/fYKyoV0JjlAY+53CG/rdY+jDN
 OWcVhfuw+JOInK3FZPLGH2hDAsNKQOq3rF6b2pwOvgIftKLHJAcx1AFbpkm0hKQbIMAQ
 7h5RbqZR3PktsppdAfyThbANYk099GNC2+3rpH9FfA89isY36QP1VQl7EFzv9QyMZx1m
 0HH82rPLcr3U6A0274P/ZTsBkzs0LsvsexbNS1ncg75CdDOXQKEdhZe8NV6l04yYVkb5
 uRg7yslceVmGHzx3q4AWF60J6w1sbrfgGJTLnkWCLBm9JH5bWSic2/9Bq6VwUgCZU9Eh
 NoMg==
X-Gm-Message-State: APjAAAXQeq7N6HQE9OO+xqujfpljozlbb++w5YA2Gf5lFOQFVTCExtDO
 Wuw/wYAWee/Ta7PbpOhYa3Q=
X-Google-Smtp-Source: APXvYqyG6NoGLRNEmVz2lcQZxyJZfbnX3rJ3md+y4qEuCVLPqPQSoH2ZWTbShl1IYRPtzZPeMieQDw==
X-Received: by 2002:a02:a405:: with SMTP id c5mr6601jal.54.1566252042119;
 Mon, 19 Aug 2019 15:00:42 -0700 (PDT)
Received: from peng.science.purdue.edu (cos-128-210-107-27.science.purdue.edu.
 [128.210.107.27])
 by smtp.googlemail.com with ESMTPSA id f1sm19353759ioh.73.2019.08.19.15.00.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 15:00:41 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: security@kernel.org
Date: Mon, 19 Aug 2019 18:00:04 -0400
Message-Id: <20190819220005.10178-1-benquike@gmail.com>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
Cc: Mathias Payer <mathias.payer@nebelwelt.net>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Hui Peng <benquike@gmail.com>
Subject: [alsa-devel] [PATCH] Fix an OOB bug in uac_mixer_unit_bmControls
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

`uac_mixer_unit_get_channels` calls `uac_mixer_unit_bmControls`
to get pointer to bmControls field. The current implementation of
`uac_mixer_unit_get_channels` does properly check the size of
uac_mixer_unit_descriptor descriptor and may allow OOB access
in `uac_mixer_unit_bmControls`.

Reported-by: Hui Peng <benquike@gmail.com>
Reported-by: Mathias Payer <mathias.payer@nebelwelt.net>
Signed-off-by: Hui Peng <benquike@gmail.com>
---
 sound/usb/mixer.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index b5927c3d5bc0..00e6274a63c3 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -738,28 +738,39 @@ static int get_cluster_channels_v3(struct mixer_build *state, unsigned int clust
 static int uac_mixer_unit_get_channels(struct mixer_build *state,
 				       struct uac_mixer_unit_descriptor *desc)
 {
-	int mu_channels;
+	int mu_channels = 0;
 	void *c;
 
-	if (desc->bLength < sizeof(*desc))
-		return -EINVAL;
 	if (!desc->bNrInPins)
 		return -EINVAL;
-	if (desc->bLength < sizeof(*desc) + desc->bNrInPins)
-		return -EINVAL;
 
 	switch (state->mixer->protocol) {
 	case UAC_VERSION_1:
+		// limit derived from uac_mixer_unit_bmControls
+		if (desc->bLength < sizeof(*desc) + desc->bNrInPins + 4)
+			return 0;
+
+		mu_channels = uac_mixer_unit_bNrChannels(desc);
+		break;
+
 	case UAC_VERSION_2:
-	default:
-		if (desc->bLength < sizeof(*desc) + desc->bNrInPins + 1)
+		// limit derived from uac_mixer_unit_bmControls
+		if (desc->bLength < sizeof(*desc) + desc->bNrInPins + 6)
 			return 0; /* no bmControls -> skip */
+
 		mu_channels = uac_mixer_unit_bNrChannels(desc);
 		break;
 	case UAC_VERSION_3:
+		// limit derived from uac_mixer_unit_bmControls
+		if (desc->bLength < sizeof(*desc) + desc->bNrInPins + 2)
+			return 0; /* no bmControls -> skip */
+
 		mu_channels = get_cluster_channels_v3(state,
 				uac3_mixer_unit_wClusterDescrID(desc));
 		break;
+
+	default:
+		break;
 	}
 
 	if (!mu_channels)
-- 
2.22.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
