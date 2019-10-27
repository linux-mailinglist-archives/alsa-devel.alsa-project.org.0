Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3302EE6D50
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 08:37:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA5AC1EDA;
	Mon, 28 Oct 2019 08:36:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA5AC1EDA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572248256;
	bh=Wu1tM0qZVMdQag4917IMjzBVFRfpRnCm76CHZIrUB2k=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=P9zuVBfTjwbS6uRasbml/vK+qg7cYyuMMEXSZZdo8XksLEDV/FNi3HgQAvnjfn5o1
	 oH8X3fhqVwLQITiFcbY8s0IuGkLZAsRPROxjs+R8zk4ZOfhN6TrT3hSw1mn1MlwAZz
	 EdDQN+NhtwaRzl+Z/AybaksVFXbUmHvOqBitIkKM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A199F80635;
	Mon, 28 Oct 2019 08:33:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ADE22F80392; Sun, 27 Oct 2019 20:49:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E97C5F80228
 for <alsa-devel@alsa-project.org>; Sun, 27 Oct 2019 20:49:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E97C5F80228
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="G+PBpQRQ"
Received: by mail-il1-x144.google.com with SMTP id s75so6190283ilc.3
 for <alsa-devel@alsa-project.org>; Sun, 27 Oct 2019 12:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Fp8qbpwsPU5t44meEzV5unnuVBGj/STbs393t2jsMas=;
 b=G+PBpQRQbVt6Enherj5lZsb71SRxc4snjY5IQwTWS+e+Ft/hoAXpwjeKfYEGo83gVW
 Rsuu0XwD/5Chxlu65jRX13j0lZf0BThZnk8m/rz3A8ka4rE6A8NywUSzV6t8iNq4pjAC
 eUrMQnGFuVwgvHogudXxzbfoBnRc+9HEeU1VqO/Kxg0q33LSUt/8yMwBbcVr+gB8dlc7
 J2pWjuk/CYsBthAyl4QJjvOsccUypq3YMiu4amifZK1hmTHjhBfkw5mw9Aq8pnJ+kfOw
 3hlPyueJG17CIIdcV0gXqt0mCOiGJWtBxIZXQZkYStIO/Q2PTDNNCVUnFeL+cEv8oBvz
 R6ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Fp8qbpwsPU5t44meEzV5unnuVBGj/STbs393t2jsMas=;
 b=YBcvvWuEGkiNpCXjPH08tTCJMFoisacHFgNd+06TZqGldM5UobkdrJEJFmrsT7c9BV
 MvB4oVg4HkXh0cvXWUKx+pKkNFDPETy82R9YSV6w0vD5vq8KJtXNx4zxm+l66PVirA3u
 AOvfqf3fvnNygyArUjuMxEGlxYABHD6MY8kWCRuILW+gNEs392KeDeshKpJS7TvT7nyd
 65U54v9sCyhNVtWZkx5x/Xu1i11mtRUKle2WSGGTkdwiDmWmlgRmxxJG9yrv2gycVNpj
 ox3+NfoBYXHG7sPvh5BJC37omgH99ZcygT81UYPMNywEAX8kqcw51VxIIQ80yLTB5dpP
 vTDw==
X-Gm-Message-State: APjAAAWeaBieGkgV5zmiRy3lpDTNdSXIl6roTC1KpVRtpMt3nzsprnIk
 74Ktux/LuvQiGv+LwEz6iFo=
X-Google-Smtp-Source: APXvYqxB3deYkss+3cgHUIMyjARd3DX6Lwwi0mH+0eSz3n+olqnlOUOFQUkSUqZ+8nvlyYXil2QLLw==
X-Received: by 2002:a92:46c2:: with SMTP id d63mr16888139ilk.43.1572205753618; 
 Sun, 27 Oct 2019 12:49:13 -0700 (PDT)
Received: from cs-dulles.cs.umn.edu (cs-dulles.cs.umn.edu. [128.101.35.54])
 by smtp.googlemail.com with ESMTPSA id k4sm634726iof.61.2019.10.27.12.49.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2019 12:49:12 -0700 (PDT)
From: Navid Emamdoost <navid.emamdoost@gmail.com>
To: 
Date: Sun, 27 Oct 2019 14:48:47 -0500
Message-Id: <20191027194856.4056-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 28 Oct 2019 08:33:18 +0100
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Takashi Iwai <tiwai@suse.com>, kjlu@umn.edu,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Wei Yongjun <weiyongjun1@huawei.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, smccaman@umn.edu,
 Navid Emamdoost <navid.emamdoost@gmail.com>, linux-kernel@vger.kernel.org,
 emamd001@umn.edu
Subject: [alsa-devel] [PATCH] ASoC: SOF: Fix memory leak in
	sof_dfsentry_write
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

In the implementation of sof_dfsentry_write() memory allocated for
string is leaked in case of an error. Go to error handling path if the
d_name.name is not valid.

Fixes: 091c12e1f50c ("ASoC: SOF: debug: add new debugfs entries for IPC flood test")
Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
---
 sound/soc/sof/debug.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/debug.c b/sound/soc/sof/debug.c
index 54cd431faab7..5529e8eeca46 100644
--- a/sound/soc/sof/debug.c
+++ b/sound/soc/sof/debug.c
@@ -152,8 +152,10 @@ static ssize_t sof_dfsentry_write(struct file *file, const char __user *buffer,
 	 */
 	dentry = file->f_path.dentry;
 	if (strcmp(dentry->d_name.name, "ipc_flood_count") &&
-	    strcmp(dentry->d_name.name, "ipc_flood_duration_ms"))
-		return -EINVAL;
+	    strcmp(dentry->d_name.name, "ipc_flood_duration_ms")) {
+		ret = -EINVAL;
+		goto out;
+	}
 
 	if (!strcmp(dentry->d_name.name, "ipc_flood_duration_ms"))
 		flood_duration_test = true;
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
