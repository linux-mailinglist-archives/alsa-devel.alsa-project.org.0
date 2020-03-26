Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2644D196BC5
	for <lists+alsa-devel@lfdr.de>; Sun, 29 Mar 2020 10:00:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C180B85D;
	Sun, 29 Mar 2020 09:59:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C180B85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585468804;
	bh=h9Jy0s5TqM35mGK/veybcZfxHp0/kXL4NzqWnGZzu5o=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=h4QUPCNrJXDozNjOwwZPAYDViNBbYyZuO51VDoPCZURaOJovZlkyGMf47sHIZHk/E
	 U3Q5pKLdC8isvkOTohi/sU+dYM8YS0YF7bM41b0czUn4w4LRtMr7IZsw4qNyv2PYuL
	 yUSh/uvyd21BiFbvx7PoW5ju7mlDo7OPGKSlXaOU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1673F802BD;
	Sun, 29 Mar 2020 09:54:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4284EF8011E; Thu, 26 Mar 2020 20:46:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23E7FF8011E;
 Thu, 26 Mar 2020 20:46:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23E7FF8011E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="QuxEoKPs"
Received: by mail-lj1-x22a.google.com with SMTP id n17so7751726lji.8;
 Thu, 26 Mar 2020 12:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qJdEQQZ/s1TBJRmxk5i4hPbqxTv+Qj33opk2QH1duvw=;
 b=QuxEoKPslLr/GvFr+4xX/puV7I/aE9Oz0O4hbFZ6HhPDbiAJfnv5la7JKTCaM5Y1kX
 hMUPgNthHt6kAUgN81gvVf1jU/lPx+yb03Vevgoj43zHgJQ5rS4l9V9LroXyoCeGGlmE
 FCUql6SmRXUcNWdFB8tYEbwZg4S3xp2w6as31y+WBfj6wSYd211Dy1zBanNxP32V56+I
 Cnzwx2J9uV7o9h/vHeOIkBsSbauUeQjX5rRRZkFliUOkMSLCryfp1wTnUb5JqOBwUEfO
 9zbVlb+ZcTvPW2Cz8oreay4EUQENjZcR76zGjal4OlH6CZyrxFfwXm40oso7edbBWMPK
 sMMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qJdEQQZ/s1TBJRmxk5i4hPbqxTv+Qj33opk2QH1duvw=;
 b=PDzRUdtE9uQaxV9H6ncikEHyM9v9I2fzJdquCIBCY/oUVuhmsnJ2RdrvBM9R0FoN0n
 lWpGm3yc8NdHUTwMfkHlXvX4h7/FdZ4UzxTj46d4ehsSIQK9I/MBn1xK126iYHNbuF10
 O2ByVLHwWvkbZ4kmeLuNsgqRZFsZ51dTs2kbcKt0Ox8cdhFdb6TbtAnav6enuADQHctI
 y6bOpsQ+37mmbjDuLkVelt7tCAqTyvpDLAAdLXyiSlAdppVUuEMAj2k++re1pBe1bo7W
 CCKM/Nm0QOgFFLCHREPjTKFJAAhCbO5ZgNefnjHeaA/1frhgroKh809UDCpWbrOs0t1E
 kYag==
X-Gm-Message-State: AGi0PubDhFLMUtRrzKcVvqhLo7KpSd6neJ3IfZkukaKcZ2jCxm6ukgOZ
 +LBa9yb5jSXcM4WNPhbzlRCXO/pUFaA=
X-Google-Smtp-Source: ADFU+vvhbKf4xqce1MiGgWmCAYWnhIaR1unmHoRBLY6oZSkCteKyu8+yVDpXQ642m1GOPbCbUN7nnQ==
X-Received: by 2002:a2e:9e16:: with SMTP id e22mr6534221ljk.220.1585252008706; 
 Thu, 26 Mar 2020 12:46:48 -0700 (PDT)
Received: from localhost (pool-109-191-189-39.is74.ru. [109.191.189.39])
 by smtp.gmail.com with ESMTPSA id d27sm2048966lfq.19.2020.03.26.12.46.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Mar 2020 12:46:47 -0700 (PDT)
From: Ivan Mironov <mironov.ivan@gmail.com>
To: patch@alsa-project.org
Subject: [PATCH alsa-lib] conf: USB-Audio: Fix S/PDIF output of ASUS Xonar AE
Date: Fri, 27 Mar 2020 00:46:45 +0500
Message-Id: <20200326194645.164265-1-mironov.ivan@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 29 Mar 2020 09:54:17 +0200
Cc: alsa-devel@alsa-project.org, Ivan Mironov <mironov.ivan@gmail.com>
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

ASUS Xonar AE is a PCI-Express card containing USB controller:

	USB controller [0c03]: ASMedia Technology Inc. ASM1042A USB 3.0 Host Controller [1b21:1142]

and the actual USB sound card:

	ID 0b05:180f ASUSTek Computer, Inc. XONAR SOUND CARD

As other Xonar USB sound cards, it uses second device for digital
output.

Signed-off-by: Ivan Mironov <mironov.ivan@gmail.com>

diff --git a/src/conf/cards/USB-Audio.conf b/src/conf/cards/USB-Audio.conf
index 89811086db1d..3f4c421b7e2c 100644
--- a/src/conf/cards/USB-Audio.conf
+++ b/src/conf/cards/USB-Audio.conf
@@ -40,6 +40,7 @@ USB-Audio.pcm.iec958_device {
 	"USB Sound Blaster HD" 1
 	"Xonar U7" 1
 	"ASUS XONAR U5" 1
+	"XONAR SOUND CARD" 1
 	
 	# The below don't have digital in/out, so prevent them from being opened.
 	"Andrea PureAudio USB-SA Headset" 999
-- 
2.25.1

