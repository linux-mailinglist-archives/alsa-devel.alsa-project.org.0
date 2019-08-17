Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5807590CF7
	for <lists+alsa-devel@lfdr.de>; Sat, 17 Aug 2019 06:34:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2F0E1661;
	Sat, 17 Aug 2019 06:33:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2F0E1661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566016453;
	bh=AICxfMoFESrWztqVak4rOuxWzzoeJa9D4xRqNIYS3u4=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KYhJTh3fytfHt5HOsS3jOtF6/YfhpoKni5sMD3z/ubWTDBpGwYpBN+UbVt/Ylz5jn
	 sCJsoahg9wxeZZ4vxFhXQ/5Dc0zM5me/E7gLdIQxWqJYWCf/ln509tWnQhL2j1rJ3M
	 2zc2MPKwn/vOg9V/OAJUy7C3VPb14YOg+4lJayao=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34ACDF8044C;
	Sat, 17 Aug 2019 06:32:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A941CF8044C; Sat, 17 Aug 2019 06:32:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2AD9FF8011F
 for <alsa-devel@alsa-project.org>; Sat, 17 Aug 2019 06:32:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2AD9FF8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="mqntU7Qd"
Received: by mail-io1-xd42.google.com with SMTP id s21so10375555ioa.1
 for <alsa-devel@alsa-project.org>; Fri, 16 Aug 2019 21:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3ZgzZCpDIRuYNI4rsUcoYKrHpCVfBSnxQC5KIpwxRrk=;
 b=mqntU7QdosCf34NpRFUhRvfJTPenC0urzJszWL8hgX+lez+r/0/VnstICJ1lHhOFB3
 36bXJUhUmAB0nApDJFFEqJ6GL73czg3U34yhSv6gjK6vH+N4uXYSDapt1+poh4oBG0Na
 geW2TddD+7AlnuJQlIGN4MPMI4VrCr8m3l8JGRJvz8ZmfCk7xoIkZLq6zT4Y7xJe/7md
 vjAyZ4+/kjpXz6xx04FhRQ7N0E51SZibeANTQcu8BQ7XZcBJSvxilCc+jRGhDvo0u+iG
 Ykpn7Lw4O72tWVc1itxClv7iDmn8NjDmw2RiVDGi11xKUia5xRuotzyl3BewiQstqykJ
 XhQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3ZgzZCpDIRuYNI4rsUcoYKrHpCVfBSnxQC5KIpwxRrk=;
 b=Y0HwiaQWPgk0gbUQB6Rx89i2Pl2ATP/f/md4qalCRL1KcqxgUZQuNvyt+yE/9wjPwP
 osoIabH8ewzjG/0XY3xo1iReH6McjCe29yPElgEonGAfTkmgsMuY+b2p2VPJaIshZhTQ
 bMj45z+WWVhMx1dDHCyZ6pZHdOdUnPzllVpDrPiKc9WM3WlTpHpMawTL1X8dpneYpIiR
 wpOEnY8LV1y1Eu1pX0QNTs13Zk4HjCyQDLbevDWfLEm7TamIQZRg6s3qu7c3Xa2Co4ii
 d53tEKgQSj8wFHSxhD//G1g41JqYBCD2lJz5z1YCRMsK0LQcJlrCD/qquFli4dGkhhs+
 L8tQ==
X-Gm-Message-State: APjAAAUnXn6SIKkFL3K65Fum7dJubCbGgRIqVZLcTDVn1evpwZdUC5dP
 tvjqWSiXHVmuu3myDKYfFe8=
X-Google-Smtp-Source: APXvYqxZ4v+ooEvYx6XqCPFcFfUXrei6ZbQ3InDv2xx+UX4w0j2LaJk6s4+n2vyT+l1L95YnNrZWyg==
X-Received: by 2002:a02:a492:: with SMTP id d18mr15323165jam.27.1566016338760; 
 Fri, 16 Aug 2019 21:32:18 -0700 (PDT)
Received: from peng.science.purdue.edu (cos-128-210-107-27.science.purdue.edu.
 [128.210.107.27])
 by smtp.googlemail.com with ESMTPSA id q12sm4294754ioh.8.2019.08.16.21.32.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Aug 2019 21:32:17 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: security@kernel.org
Date: Sat, 17 Aug 2019 00:32:07 -0400
Message-Id: <20190817043208.12433-1-benquike@gmail.com>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
Cc: Mathias Payer <mathias.payer@nebelwelt.net>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Wenwen Wang <wang6495@umn.edu>,
 YueHaibing <yuehaibing@huawei.com>, Takashi Iwai <tiwai@suse.com>,
 Thomas Gleixner <tglx@linutronix.de>, Hui Peng <benquike@gmail.com>
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
