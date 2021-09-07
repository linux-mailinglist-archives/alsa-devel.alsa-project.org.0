Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B171B4021D7
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Sep 2021 03:49:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40B371734;
	Tue,  7 Sep 2021 03:48:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40B371734
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630979363;
	bh=V4AKR7YVZD1riZ67xyADgLgZQxtArLpVaz53tAgzJ3g=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EtMaBLNqIpZyOnQGH0QRYVSDdBEZ2nXVd6OOmn3Mc/mCOJDDNXvBz2DWzco8nafN9
	 nSc4TDxNXT31czqIHm09y3QTqAN5QgzhzdQIwR4/69vAsmAPxBp5SpyJKgWpOPzIPs
	 740Il0yIUoXpFXeuNqvP9uS21HlnnwjkiI33xjY8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7591F800C7;
	Tue,  7 Sep 2021 03:48:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1DFBF80224; Tue,  7 Sep 2021 03:48:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD4B3F800BC
 for <alsa-devel@alsa-project.org>; Tue,  7 Sep 2021 03:47:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD4B3F800BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="oC0DtrPv"
Received: by mail-pf1-x42d.google.com with SMTP id x7so5959666pfa.8
 for <alsa-devel@alsa-project.org>; Mon, 06 Sep 2021 18:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6mc027pv6u15MDfXa8/3uliAGB1haKo3X34nc3V5v00=;
 b=oC0DtrPvwGiND0GVCJXzXX+dI34T4Zqz0WDJq566WiviOsRcoCp10XRByr4+cjaegm
 Mz4YmBM2xfPwYdcc8pL7u6265hJfeL8l5wVMS2lthiuR+gOihgA5sYWpjxMGbSxCy/eY
 xgZAKIx3setTGWmKAiD4FzZo+dksYXs9e3yMhTRteSmu5D0SgwEUrM86yYzSkE1x1Ny8
 +CSLi6GoRIUNdcdUsKhUEN31ciH0rSqnIZcFtgJtJOGX6aoeF1I35Ea+QMrPftKVUZAG
 nvlr9rkU84SzeChGIDD1xlTQmn/7j7CEWx8PHH/wj0vavyzZEmNN8JqwU2+w8b8ZVpgG
 h3AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6mc027pv6u15MDfXa8/3uliAGB1haKo3X34nc3V5v00=;
 b=WckF8qF+UL8dlvI2VpSYR/Hv47LqQ4dGG0u/vbVFOOZKP5mVUrenuw+M91/JRtJUwE
 DFMiif9DG9bInHFUAoXr0NpgSCGTv7R/cxBHWNu/NoV0ar2GaUvBcTkopVahDlSe9f0+
 UzO2m8u+eZa8NiWC8NweK5ZGOHRJ/ekNq8qK14ravbSzgLXehVQHxscVDYjpo8ViUWTF
 Y6tP+XWA7snLP83UHuzEu/omhtxDWPLkqvzSYb8I9ONfs4RGajN8r1aYv/xBLhZs0ENw
 X9ip0pNaw5X2QwcvEVb6+RiDlzQKZdMb30VJkfw+SXShd/h73pr66iQeINyCRfU5sdf/
 uXpw==
X-Gm-Message-State: AOAM533477dUEbNxRjVbmLKzKvkmZDE99WEqMw5TOlLWWNGJGCsiNpiD
 U8Z9CiHAjK3n/FaA3xd+eFc=
X-Google-Smtp-Source: ABdhPJxUQ+t24jfciNyfQu1gi3O+qJsmIQ4TWAwZD7uUI8KaPuNkV7ME7C8E94lysZjNFushXSkUuQ==
X-Received: by 2002:a62:36c3:0:b0:3fd:52ea:bd70 with SMTP id
 d186-20020a6236c3000000b003fd52eabd70mr14379411pfa.38.1630979272172; 
 Mon, 06 Sep 2021 18:47:52 -0700 (PDT)
Received: from tong-desktop.local
 (99-105-211-126.lightspeed.sntcca.sbcglobal.net. [99.105.211.126])
 by smtp.googlemail.com with ESMTPSA id p16sm545172pjz.44.2021.09.06.18.47.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 18:47:51 -0700 (PDT)
From: Tong Zhang <ztong0001@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Leon Romanovsky <leon@kernel.org>, Tong Zhang <ztong0001@gmail.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1] ALSA: vx222: fix null-ptr-deref
Date: Mon,  6 Sep 2021 18:47:45 -0700
Message-Id: <20210907014746.1445278-1-ztong0001@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

a recent refactor created a null pointer vx in snd_vx222_probe().
The vx pointer should have been populated in snd_vx222_create() as
suggested in earlier version, otherwise vx->core.ibl.size will throw an
error.

[    1.298398] BUG: kernel NULL pointer dereference, address: 00000000000001d8
[    1.316799] RIP: 0010:snd_vx222_probe+0x155/0x290 [snd_vx222]

Fixes: 3bde3359aa16 ("ALSA: vx222: Allocate resources with device-managed APIs")
Signed-off-by: Tong Zhang <ztong0001@gmail.com>
---
 sound/pci/vx222/vx222.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/vx222/vx222.c b/sound/pci/vx222/vx222.c
index f48cc20b9e8a..468a6a20dc1e 100644
--- a/sound/pci/vx222/vx222.c
+++ b/sound/pci/vx222/vx222.c
@@ -137,6 +137,7 @@ static int snd_vx222_create(struct snd_card *card, struct pci_dev *pci,
 	}
 	chip->irq = pci->irq;
 	card->sync_irq = chip->irq;
+	*rchip = vx;
 
 	return 0;
 }
-- 
2.25.1

