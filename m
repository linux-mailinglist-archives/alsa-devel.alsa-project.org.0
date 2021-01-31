Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FAA309944
	for <lists+alsa-devel@lfdr.de>; Sun, 31 Jan 2021 01:15:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11ABE1770;
	Sun, 31 Jan 2021 01:14:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11ABE1770
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612052110;
	bh=FYBClFVODkmK5At+DBGbTm1eUTvqwZHVh/lb5Sd0sbA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HpdOZ6GnxweYZkgwji+alXqD8dVERQYilsWDNNdxhk1rqDUFEve1DT9S9ij6y5aci
	 vPG6RU3PVwPj1rDBUGisrtOj13SYZrQVcsfTx8uKaWfwQo2ZjM/z7X+O8ODgzc69Du
	 +FfeZuiwmWbvKyvrxm8q2kfK7ME0JRkmaYtVWUvU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F5BDF80217;
	Sun, 31 Jan 2021 01:13:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1806F801D8; Sun, 31 Jan 2021 01:12:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0EFDF8015B
 for <alsa-devel@alsa-project.org>; Sun, 31 Jan 2021 01:12:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0EFDF8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="N0Vw6MDT"
Received: by mail-lj1-x233.google.com with SMTP id r14so15044210ljc.2
 for <alsa-devel@alsa-project.org>; Sat, 30 Jan 2021 16:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=batmuya7co49qkeSt7rrFXuUKreU4NnJ2KEEv73JYWE=;
 b=N0Vw6MDTg3MmEUEM+hsk5w+E42bPcuteYfxeiCXtQlJhfysYBf6F1bwNX6K2/ol9lr
 B0dvXiBwRWcYze3Z8zbQLJWoiqu2tcI48i/Hprge8E/0JSEwXILtznma+VmymPNiqkM7
 IXlLDS86Hkhup1wFZEchkUUFQQlHDfH9oadUWwQD/VhYSMrBGHZzx3/3UH1Vl6CcL7Qd
 CIo9JoTeTwUJubikMXXp1EeDoBPogYAbJ7e99aeXUJjvsK3fR2NVQIZXXEdBiKmwcFDp
 CHVz2APc8Y3Q5/w6ZOIOpsNNcqWXJe6SDNurmfiJEcoyhE2CzzTyAkDXsQkUFnMq8Zea
 rZBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=batmuya7co49qkeSt7rrFXuUKreU4NnJ2KEEv73JYWE=;
 b=XiSh6VhYVIZaqfJ6vx/sCkTW4xatrpKXStyMDu/V5PMjivGdUeEJvG3v5Pn/HfMIEE
 7PXc8OtMuY/6uRtfk5VmH4sqdbT8UB6j6bPFkkPUuglb3wKn23UJUwiRYMgD04R55QKf
 7k1lbTda04KqyxTUl7ERlwNni1ZXPCXmDY3ty5uCgTcsNdieHCYJJmCAmHzoirwZZZYP
 LLLacjBDTk5yp6+tdFJHdnOBsznH/P0k/WjIGy0MSgt9b+MKVXkWCoEPK3ugH+W/O9g0
 aqnng2PIOMb3ALdf+0S+/rfKeJI1hHpOV09a6XsxUFKFBD5eg+YVexxtGVpGZLxOc9Cp
 PmUQ==
X-Gm-Message-State: AOAM530Wo4JQqEzAO60bQGutpTmjSHM0vvoa1rka7obFbgK6JEG7gzU2
 KPthl9K4Gkq3OpsRDaVPtrw=
X-Google-Smtp-Source: ABdhPJzqdfGT0I5FjeX+bddT2YdZRIrkK9noae0FfxIJ5yXOyUWdWRzU5toIGWdCbQFzZHTJ6XJRSg==
X-Received: by 2002:a2e:86d0:: with SMTP id n16mr6250660ljj.51.1612051970975; 
 Sat, 30 Jan 2021 16:12:50 -0800 (PST)
Received: from localhost.localdomain (h-158-174-22-164.NA.cust.bahnhof.se.
 [158.174.22.164])
 by smtp.gmail.com with ESMTPSA id t2sm2503716lfl.141.2021.01.30.16.12.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jan 2021 16:12:50 -0800 (PST)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 2/2] ALSA: hda: Constify static attribute_group
Date: Sun, 31 Jan 2021 01:12:41 +0100
Message-Id: <20210131001241.2278-3-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210131001241.2278-1-rikard.falkeborn@gmail.com>
References: <20210131001241.2278-1-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>
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

The only usage of hdac_dev_attr_group is to put its address in an array
of pointers to const attribute_group structs. Make it const to allow the
compiler to put it in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 sound/hda/hdac_sysfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/hda/hdac_sysfs.c b/sound/hda/hdac_sysfs.c
index e56e83325903..0d7771fca9f0 100644
--- a/sound/hda/hdac_sysfs.c
+++ b/sound/hda/hdac_sysfs.c
@@ -66,7 +66,7 @@ static struct attribute *hdac_dev_attrs[] = {
 	NULL
 };
 
-static struct attribute_group hdac_dev_attr_group = {
+static const struct attribute_group hdac_dev_attr_group = {
 	.attrs	= hdac_dev_attrs,
 };
 
-- 
2.30.0

