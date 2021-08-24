Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7063F6F63
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Aug 2021 08:21:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C4D91681;
	Wed, 25 Aug 2021 08:20:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C4D91681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629872500;
	bh=b1CL/x6T3N/7S4yZIgyD6v8AQXO300eSVO4jjVfBhZ4=;
	h=To:From:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pAZesO3kYEyyNTzah4CIchaFfe8gopxt+CGS6IbzLOWuP56N9sAIyRYm/xqEaJ/C5
	 /jMGFgMU7y3QvKKrNLV1mdsmfZAPprVsWyte5vI3pR/igw6WdoSUEkvZbe/iCy84ta
	 SOB71GFh2ER6flWQV2tL/JWrWBRujahquPRltQ8c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B10EF804F3;
	Wed, 25 Aug 2021 08:18:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D1AEF801D8; Tue, 24 Aug 2021 19:38:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BAB2FF800AE
 for <alsa-devel@alsa-project.org>; Tue, 24 Aug 2021 19:38:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BAB2FF800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel-dk.20150623.gappssmtp.com
 header.i=@kernel-dk.20150623.gappssmtp.com header.b="LjHsHmrK"
Received: by mail-pf1-x435.google.com with SMTP id 2so4944117pfo.8
 for <alsa-devel@alsa-project.org>; Tue, 24 Aug 2021 10:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=bTwPGiPrmmG9vkO1MvG9NW7lrY95iGeBIYpG7r1OLBE=;
 b=LjHsHmrKp5UosBxw8l7mYybkmczjicLWKytjHBeRT9dGo5OiaboFWUeGBkPI3lRKwz
 hphVfgvfY9bq62xbk/QT0oRUq9MC3ESI8fShW6bPGaICHWTU8xzD0LrSlnQUUz8/6etz
 F/k/zqzs6LC52v8P6jUdpkk9zkJSMHJOHdTh9FxDYLxsjCaS0T1K0UvdEecXnzF9tohL
 pPTh4s+2NHADwC6KCK9GzVHpqkD6+rXZenkkVW3iyxOex2+VZOQ1wLtM1DaofHslCVOf
 jTA27BsbjlUfnYBBYJJVzaVCCraYGEwigNVzLYrr4f08ZZ7w62IE4oO4l3BR/O4v3rIy
 7saw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=bTwPGiPrmmG9vkO1MvG9NW7lrY95iGeBIYpG7r1OLBE=;
 b=ZHrEozk+qEIeMESqHHjqWjey7BxipmCvNVPx8LM8Pg5zOPPEI5vHHaqQ8IabfSXZJ+
 Wq2ZCzsJPZga9P/VT+mUpv9lhYavb2hCZ0M6iQvTFyGiqT/auD0VAx+ckFhUk1r6BjLQ
 8XJQe+x5RiDZ4vliSINIs2WagQlY+djB76WiiaxioED3S55ZLtBiqwM6BwSp1gLwx6TH
 GoZLJK6PlpJ7mJJV9DhgJ2i990BSIikVHG1Edy4HIBwOvBGUmJzmQ7MoO9+O6AWVCGSE
 gfBpuXQ80tkuC74tA+U+yTkm60GEGNe4oLUtniq9KKzbOL+IcqieAdEpSK5M9cB1kndA
 O09w==
X-Gm-Message-State: AOAM533AZjpyF6nD5uX/t7tNx96f8bs4B2W+yS9AKmRPpC9HoXtXYyQN
 xCVtCdbZCe3ir+ZMXn9/2bM2MADNOheu/NDN
X-Google-Smtp-Source: ABdhPJw//PkDvfVfGMn4mMDdcZK10nEWh5zo+1KZzVKn4e+bPgzy2AcwUJ/w+y86qdF9mq39XtiKrQ==
X-Received: by 2002:a63:3245:: with SMTP id y66mr37626941pgy.443.1629826690490; 
 Tue, 24 Aug 2021 10:38:10 -0700 (PDT)
Received: from ?IPv6:2600:380:4960:2a4d:1b63:8a6c:25bc:6edc?
 ([2600:380:4960:2a4d:1b63:8a6c:25bc:6edc])
 by smtp.gmail.com with ESMTPSA id l11sm3090520pjg.22.2021.08.24.10.38.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Aug 2021 10:38:10 -0700 (PDT)
To: perex@perex.cz, tiwai@suse.com, kai.vehmanen@linux.intel.com,
 alsa-devel@alsa-project.org
From: Jens Axboe <axboe@kernel.dk>
Subject: azx_get_pos_skl() induced system slowness
Message-ID: <402d5952-3bf6-5c0d-5276-8367bfe1542a@kernel.dk>
Date: Tue, 24 Aug 2021 11:38:08 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 25 Aug 2021 08:18:36 +0200
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

Hi,

Got a new notebook recently, it's a Lenovo X1 Carbon 9th gen. Sound
works fine, but sometimes I get really stuttering playback from nestopia
and I finally decided to look into it. When this happens,
azx_get_pos_skl() is seemingly called a lot, at least it uses a ton of
CPU cycles. This comes and goes, sometimes 1 minute in between,
sometimes 2, and sometimes 30 seconds.

If I comment out the udelay() in that function it does seems to be
noticeably better, though it's not a complete fix. I guess it just
reduces the pain of calling it so many times?

This is running 5.14-rc7, but it's not a recent regression.

Any clues as to what this might be?

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 470753b36c8a..3c1f233e463f 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -878,7 +878,9 @@ static unsigned int azx_get_pos_skl(struct azx *chip, struct azx_dev *azx_dev)
 	 * for the possible boundary overlap; the read of DPIB fetches the
 	 * actual posbuf
 	 */
+#if 0
 	udelay(20);
+#endif
 	azx_skl_get_dpib_pos(chip, azx_dev);
 	return azx_get_pos_posbuf(chip, azx_dev);
 }

-- 
Jens Axboe

