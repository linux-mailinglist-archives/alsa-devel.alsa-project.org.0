Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 096F97909B1
	for <lists+alsa-devel@lfdr.de>; Sat,  2 Sep 2023 23:07:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44FA4203;
	Sat,  2 Sep 2023 23:07:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44FA4203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693688875;
	bh=OwodNzQow81cioZ/x0NFsPD4e4UBN2L+BF3m/k/eTjY=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=NfRz1+Kq3nHMdlDfwZifC4YDjd0+fRils6toqSzrXez6ym5XQYKjkO30PhN3yXnEo
	 lRks7OTye8CaaVWl5bvsHifuYgFqpg6Y/WZhSvyjHXTHs5DM63ib0ft7wIiNCokLiO
	 I81BkRNAeS1De9+NBF9WcroqQA48CgTfXT21MdgQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC57AF8055B; Sat,  2 Sep 2023 23:07:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E56AF804F3;
	Sat,  2 Sep 2023 23:07:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D0D4F804F3; Sat,  2 Sep 2023 23:06:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AEE1DF80249
	for <alsa-devel@alsa-project.org>; Sat,  2 Sep 2023 23:06:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AEE1DF80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=IuNe7fdR
Received: from localhost (unknown [81.18.92.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9EF9B6607285;
	Sat,  2 Sep 2023 22:06:25 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1693688785;
	bh=OwodNzQow81cioZ/x0NFsPD4e4UBN2L+BF3m/k/eTjY=;
	h=From:To:Cc:Subject:Date:From;
	b=IuNe7fdRvYqd600PCKP9mxCOAAYRUEXAC9kmN9WRd3HtS/cl/gi7nOaLX0tEgnjvi
	 V4b1wpNzZOKpHS3iMBK87N8LUFSObzRIh/LyAT3mHbYyy96jd4FDKZr5qSFMMbQP3n
	 gwyKEyxpiH6g/i/0dLvgui10KydGZOR2v7QIQXSMjHp+BB8guBkNMhkQi9PDKc1YF0
	 7P7ynyUi4Mun29FBQOv9KyPTPusDwD07eNMNGb6X70GqqziexbMGNtAniodCiZEk7A
	 uoGKYG8RjeMmsP9/2uoYxDxhVAvdpDnLr/W85TV/GKVO/3TEBJ0BEFqTJKEVDZnYYu
	 MLOB46NUBChvQ==
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Stefan Binding <sbinding@opensource.cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH 0/9] Improve CS35l41 ALSA SoC audio driver
Date: Sun,  3 Sep 2023 00:06:12 +0300
Message-ID: <20230902210621.1184693-1-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: B75TBY7R2JOL7BALQ2GXYFQLYCRDI6HP
X-Message-ID-Hash: B75TBY7R2JOL7BALQ2GXYFQLYCRDI6HP
X-MailFrom: cristian.ciocaltea@collabora.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B75TBY7R2JOL7BALQ2GXYFQLYCRDI6HP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch series contains several fixes and improvements to 
the CS35l41 audio codec driver.

It has been verified on Valve's Steam Deck.

Cristian Ciocaltea (9):
  ASoC: cs35l41: Handle mdsync_down reg write errors
  ASoC: cs35l41: Handle mdsync_up reg write errors
  ASoC: cs35l41: Initialize completion object before requesting IRQ
  ASoC: cs35l41: Fix broken shared boost activation
  ASoC: cs35l41: Rename pll_lock to pll_lock_done
  ASoC: cs35l41: Make use of dev_err_probe()
  ASoC: cs35l41: Verify PM runtime resume errors in IRQ handler
  ASoC: cs35l41: Use modern pm_ops
  ASoC: cs35l41: Use devm_pm_runtime_enable()

 include/sound/cs35l41.h        |   5 +-
 sound/soc/codecs/cs35l41-i2c.c |  11 ++-
 sound/soc/codecs/cs35l41-lib.c |  83 ++++++++++++++++------
 sound/soc/codecs/cs35l41-spi.c |  11 ++-
 sound/soc/codecs/cs35l41.c     | 121 ++++++++++++++++++++++-----------
 sound/soc/codecs/cs35l41.h     |   4 +-
 6 files changed, 158 insertions(+), 77 deletions(-)

-- 
2.41.0

