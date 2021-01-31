Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 293B1309940
	for <lists+alsa-devel@lfdr.de>; Sun, 31 Jan 2021 01:14:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC9F01765;
	Sun, 31 Jan 2021 01:14:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC9F01765
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612052098;
	bh=xJ0iGDQw1D2wj6UNx9gkJLrAByGWLZgknB3ivM4r6Cs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=N67ETH7z+1SEhcbQwwX2ad6h9Vqex8VyBsSpVLtnLf1TcAcPHtcRB4zMuuHTqz6n1
	 Ez64oglkgPaUdE774p7Rj/opzrKjxVFxjuQDS/NpksykrkJQbLzprW7sF40n2p7VXw
	 uCAy8nbPeJhNcVPsD3sVAP7g4EQNdSx3oEqJoy4g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ECA11F801D8;
	Sun, 31 Jan 2021 01:13:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE2C8F801ED; Sun, 31 Jan 2021 01:12:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 337D5F80143
 for <alsa-devel@alsa-project.org>; Sun, 31 Jan 2021 01:12:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 337D5F80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="sYFfAQxs"
Received: by mail-lf1-x130.google.com with SMTP id u25so17745473lfc.2
 for <alsa-devel@alsa-project.org>; Sat, 30 Jan 2021 16:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MQhP8eD8DaUVEdOJdM5E7OMw7FrTyZO6tdMoNlRzA5U=;
 b=sYFfAQxsoTC49Rlqs6y5EXQpiTeknGNAYT8hiHx7fEwpMsmQ6k2njNgAeBZp28Yn1t
 Do42/MyMbEdDiGiBMATiK8ZRrQaG27v516VvQALMmKm5nOCemDoQK2vrL2izpqLZ937b
 /sLF9F/MEt1CBj7ZozjW3WNCz7ome8xZ7/dPkwDcpweY+1AWs1kvrfw+iDx4+qyU+rqC
 hN56K+QlR9Hx6B+I2J6K/hzWjncF8kXTDz58hS+CHH3VZqLWj8cSY2H9h69zhKOp/56T
 MRjMIc4knkoIsaI87iGa9pOmnCio60D333FYtd2kSspPd/Fpp7w87/OEPWV1X2Vbjz+Q
 VdvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MQhP8eD8DaUVEdOJdM5E7OMw7FrTyZO6tdMoNlRzA5U=;
 b=F98kab1S2e/baDI6nXVEbhW/WYGm2L84+xxgGjnfIApBIxkAq/Bl+DMS6qfNRaOaZ+
 XIDw3yOO2SnB/h8DK3/S0yCGJqVyfIHfueS50l2fWYgBR2qMLficCx0R/mGVzisTMxgB
 yFPxRtYjv3X/FJCez/7k3ADzth9t6GbrIfkDJ4jpoRLnKktwkbwDkyAyvOGq+rJCmAzg
 0eoapPSozpyCHjmntCS76JcYci9ehIdcPkfXOph1QQDjFPkU3tp+hd1FU/eSLrZcH8QP
 mcKE04N4DH+NvL65PvEJMITRKj0haX00biOcxKPfjc4wKnNNo3Cz8tfpbLsRlvfaeJQV
 BOdQ==
X-Gm-Message-State: AOAM533yXTgDqQaFFO/BKAws/Uf1XcSW9GqaHLMnJyLW2kS2ZMvha2bV
 G2I6vc4crVdOdemKq8yfHFc=
X-Google-Smtp-Source: ABdhPJxDlcB+JAsLzS+r+RYiFQzSQTx48+aXya8sc/tHfZj4f3URdOOn9/cCbW0W//3Cuwj+0QRpsQ==
X-Received: by 2002:ac2:5f41:: with SMTP id 1mr5563045lfz.65.1612051968840;
 Sat, 30 Jan 2021 16:12:48 -0800 (PST)
Received: from localhost.localdomain (h-158-174-22-164.NA.cust.bahnhof.se.
 [158.174.22.164])
 by smtp.gmail.com with ESMTPSA id t2sm2503716lfl.141.2021.01.30.16.12.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jan 2021 16:12:48 -0800 (PST)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 0/2] ALSA: Constify static attribute_group structs
Date: Sun, 31 Jan 2021 01:12:39 +0100
Message-Id: <20210131001241.2278-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.30.0
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

Constify two static attribute_group structs that are never modified.
These two were the only static non-const ones in sound/.

Rikard Falkeborn (2):
  ALSA: ac97: Constify static struct attribute_group
  ALSA: hda: Constify static attribute_group

 sound/ac97/bus.c       | 2 +-
 sound/hda/hdac_sysfs.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.30.0

