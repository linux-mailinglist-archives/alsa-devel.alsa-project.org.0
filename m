Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B887C7B65
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Oct 2023 04:01:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24BBB83B;
	Fri, 13 Oct 2023 04:00:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24BBB83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697162488;
	bh=jljMe7EqqbdJACHL04lgojNRrVpB5/+4pdJXp9NDGl0=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=kI0rDols9MHFczkrnqphVO0zd2WJd9qJx/a2Lx24l3pK9BCXr34om/Mu52SKPqNnp
	 /nC6cGQKpYb0qZv6dUxSKmTdECT98PKUcOoY3AeCJLb6WMa6XUU/A76Ugq5j/2M0zD
	 yydwt3WLJM94kVdF80uo0lCV1lxlT20Kj8qaUDXk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0163FF80536; Fri, 13 Oct 2023 04:00:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FB41F8027B;
	Fri, 13 Oct 2023 04:00:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6FD08F802BE; Fri, 13 Oct 2023 04:00:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9A0F5F8015B
	for <alsa-devel@alsa-project.org>; Fri, 13 Oct 2023 04:00:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A0F5F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=eHy2eMPy
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-6b24b784763so180079b3a.2
        for <alsa-devel@alsa-project.org>;
 Thu, 12 Oct 2023 19:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697162407; x=1697767207;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8LXDLb7hZVgUIIyJsZzS09H6+EPiYEBX3NhLtdzTmiM=;
        b=eHy2eMPyjIBDtgOSYzLH+OK6yZKUXVstBwoXe1LEszQEBmJpdQYFq2kOpkVctKk5qM
         isatPhHTzSIeL08sXcPKD3bvVFRYT8HdDvvzV3Sms7o5xwOLZXfu739HF0kR/ZsXQDmD
         7GZ/Wq5XU2vgjjDxzXTBIDE6Pjkl+NQRnmcT4a/FLIyK2nAgWmmZ+/dHB6PUl8tyMqEH
         4h92SaoW09xmnUKjtAgZlX0aa/oxQI5DoQhXYna0IveaH+8/ZxBuP8NHdd7gOKkIGhgE
         prMwH3fSec1RGrWTri7fVe2cqms8Cowe706zH1FuBnYzE3LM1PhoF8si4puaok+xetTn
         BpPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697162407; x=1697767207;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8LXDLb7hZVgUIIyJsZzS09H6+EPiYEBX3NhLtdzTmiM=;
        b=DxVQZc6oNvaeEd+laFrEvae8zB8MvelQdBU/lqxQkR0It4+NchoFnjMCAQaBNSB4Md
         Ki+p3nbsNsm2AYQ3CbtKRLqjkVUrIIM0yX2h71UIkccX4dwRRCXNCxDm3ITKNI1nOwqe
         GiG8lq8+ivAXv/aCCkBRAMkwZr4sqwXgXmCE9VXFuEoi4igPNIPow+wL5n/OW2+F69Hz
         gw+EnMZa2RaHzaLPyCLCMH7zKgYWLCUziH0i/esCsfUULQyKb9cJ9IzfRoqzOnTNR4mT
         /b1zWq4lQKFrRoiwXQa7AfQeL8cT5oGniDcTZ1GFzYjiCttUqbbgCeEoDjhBXsIcgKGn
         IqGQ==
X-Gm-Message-State: AOJu0YxIjhoh2vmP+DIrtbpaOhYOUeEl09h+TwRyonv3C7FZLZT41v2o
	4cEydPGDnU3I3HD0NSF+ndM=
X-Google-Smtp-Source: 
 AGHT+IE95yiqaM6y47Ls/ez+pfWl17G4U4EKJIdxmaQ9DdUseFD4IRzJJRYcteaopOkgtdcJyMEWHg==
X-Received: by 2002:a05:6a20:a110:b0:161:3013:b499 with SMTP id
 q16-20020a056a20a11000b001613013b499mr30784883pzk.60.1697162406075;
        Thu, 12 Oct 2023 19:00:06 -0700 (PDT)
Received: from localhost.localdomain
 ([2804:1b2:f182:ece3:38de:3ac4:3149:fe7b])
        by smtp.gmail.com with ESMTPSA id
 mv21-20020a17090b199500b00276e8e4f1fbsm2520416pjb.1.2023.10.12.19.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 19:00:05 -0700 (PDT)
From: Edson Juliano Drosdeck <edson.drosdeck@gmail.com>
To: tiwai@suse.com
Cc: perex@perex.cz,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	edson.drosdeck@gmail.com
Subject: [PATCH] ALSA: pci: Missing a blank line after declarations
Date: Thu, 12 Oct 2023 22:59:51 -0300
Message-Id: <20231013015951.16812-1-edson.drosdeck@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: K5PGTP4LRDE3D55JVY6CHOLKQ4U2GRFK
X-Message-ID-Hash: K5PGTP4LRDE3D55JVY6CHOLKQ4U2GRFK
X-MailFrom: edson.drosdeck@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K5PGTP4LRDE3D55JVY6CHOLKQ4U2GRFK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Warning found by checkpatch.pl script. Adding blank line after declarations.

Signed-off-by: Edson Juliano Drosdeck <edson.drosdeck@gmail.com>
---
 sound/pci/lola/lola_proc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/pci/lola/lola_proc.c b/sound/pci/lola/lola_proc.c
index a166672e22cb..1ee5997da3c9 100644
--- a/sound/pci/lola/lola_proc.c
+++ b/sound/pci/lola/lola_proc.c
@@ -137,6 +137,7 @@ static void lola_proc_codec_rw_write(struct snd_info_entry *entry,
 	struct lola *chip = entry->private_data;
 	char line[64];
 	unsigned int id, verb, data, extdata;
+
 	while (!snd_info_get_line(buffer, line, sizeof(line))) {
 		if (sscanf(line, "%u %u %u %u", &id, &verb, &data, &extdata) != 4)
 			continue;
@@ -150,6 +151,7 @@ static void lola_proc_codec_rw_read(struct snd_info_entry *entry,
 				    struct snd_info_buffer *buffer)
 {
 	struct lola *chip = entry->private_data;
+
 	snd_iprintf(buffer, "0x%x 0x%x\n", chip->debug_res, chip->debug_res_ex);
 }
 
-- 
2.39.2

