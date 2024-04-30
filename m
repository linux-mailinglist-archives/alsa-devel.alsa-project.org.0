Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E90398B74F8
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Apr 2024 13:55:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C0A9DEE;
	Tue, 30 Apr 2024 13:55:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C0A9DEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714478125;
	bh=uLSlj939XV8NBcLkdHeM4WkD/CoBnFZy5OTyuh04CxY=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=bq4qj5AXQNVnO4mjsgnu/z0K01EERZa5u8fD2h63Eg+nwllziElFtBcvDuFtWkK2m
	 D92b02QBrKUSiaLBo+vwMHwb0EYRyV4oVB63gGT8b0Mn7gWo4X+e3YFDeD2RiPRuSo
	 pf5is8PIptlGF189wXUlpbsK0xpi/OY3rkq2xtAo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8BDCF80579; Tue, 30 Apr 2024 13:54:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 87544F805A8;
	Tue, 30 Apr 2024 13:54:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7956DF804F2; Tue, 30 Apr 2024 13:54:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DA314F8003C
	for <alsa-devel@alsa-project.org>; Tue, 30 Apr 2024 13:54:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA314F8003C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com
 header.a=rsa-sha256 header.s=k1 header.b=Ehtc5jzT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=wu/qhcWtV7OY0J
	N4E7D/iNzNkQ/EkgfsbfNGnSZA7Go=; b=Ehtc5jzTSgAhzTN+5VDaHzhJ3CIZkf
	yjvF+nachfocPY+LnBFurXN11ZR28tr1kUdMMiuQp96tvCdxCiyr6SQRNKVIdTfa
	+rG0KknZdCgD0cVxwGgBRktJehHz1JnyFzRegOO0YMb+JF4cRRzKGdkaRFXZdti0
	HG+BF1Lzt/+PLw8+Q3yVa5OPZUNGV44vRXIWY2CA+ZD4XHbhH/jKD7L+gedFGX+z
	3HH6p4vFWQCLqQ8LSm7jA0hOkumEZspJhI3nhWUu0ax/xw4D3C9ko9zd3Tdonj+D
	4+iTCQcKS0zgMwulq4rWfOMl3y9QM3R9k7cVPl+V9f7s5h/Dgmt32aRQ==
Received: (qmail 2621450 invoked from network); 30 Apr 2024 13:54:38 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 30 Apr 2024 13:54:38 +0200
X-UD-Smtp-Session: l3s3148p1@b+DXCE8XMKtehhrb
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: alsa-devel@alsa-project.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	patches@opensource.cirrus.com,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 0/4] ASoC: use 'time_left' instead of 'timeout' with
 wait_for_*() functions
Date: Tue, 30 Apr 2024 13:54:33 +0200
Message-ID: <20240430115438.29134-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BY2H6TWMSHPTG37Z47ZDWKSFO4R4EXTI
X-Message-ID-Hash: BY2H6TWMSHPTG37Z47ZDWKSFO4R4EXTI
X-MailFrom: wsa+renesas@sang-engineering.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BY2H6TWMSHPTG37Z47ZDWKSFO4R4EXTI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There is a confusing pattern in the kernel to use a variable named 'timeout' to
store the result of wait_for_*() functions causing patterns like:

        timeout = wait_for_completion_timeout(...)
        if (!timeout) return -ETIMEDOUT;

with all kinds of permutations. Use 'time_left' as a variable to make the code
obvious and self explaining.

This is part of a tree-wide series. The rest of the patches can be found here
(some parts may still be WIP):

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/time_left

Because these patches are generated, I audit them before sending. This is why I
will send series step by step. Build bot is happy with these patches, though.
No functional changes intended.

Wolfram Sang (4):
  ASoC: codecs: wm8962: use 'time_left' variable with
    wait_for_completion_timeout()
  ASoC: codecs: wm8993: use 'time_left' variable with
    wait_for_completion_timeout()
  ASoC: codecs: wm8994: use 'time_left' variable with
    wait_for_completion_timeout()
  ASoC: codecs: wm8996: use 'time_left' variable with
    wait_for_completion_timeout()

 sound/soc/codecs/wm8962.c | 12 ++++++------
 sound/soc/codecs/wm8993.c | 12 ++++++------
 sound/soc/codecs/wm8994.c |  8 ++++----
 sound/soc/codecs/wm8996.c | 14 +++++++-------
 4 files changed, 23 insertions(+), 23 deletions(-)

-- 
2.43.0

