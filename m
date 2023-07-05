Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1735D74902C
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jul 2023 23:49:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3CE973E8;
	Wed,  5 Jul 2023 23:48:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3CE973E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688593766;
	bh=X4jBCjEotkAu/UwZyifyK18UpJoKiAqALQAD8kiDayU=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=XlWInd1cE+DQwTijeP5fh8TVFWrYCQpqMbwjiyojLUht2fNqCsKiKRqaShN5eP8FE
	 GzG+zqB+lyhClJNFFKdjF6ewQ/Rx//3tGqgntF9lAqVGpSmTSTcQLoV/H/oznnm5Lo
	 tyousE4L2IsEwkG+afJYveH+6pZd/8MgLwCOWK3s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2EA44F80125; Wed,  5 Jul 2023 23:48:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 678F2F80125;
	Wed,  5 Jul 2023 23:48:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60278F80132; Wed,  5 Jul 2023 23:48:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A807DF80104
	for <alsa-devel@alsa-project.org>; Wed,  5 Jul 2023 23:48:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A807DF80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=PVOMhYla
Received: from localhost (unknown [188.24.137.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CAD0C6600B9D;
	Wed,  5 Jul 2023 22:48:04 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1688593685;
	bh=X4jBCjEotkAu/UwZyifyK18UpJoKiAqALQAD8kiDayU=;
	h=From:To:Cc:Subject:Date:From;
	b=PVOMhYlaWetjlWsJLadfVSwt3pZfTmynd2X90/laNnM/kG4oDAEGKBCxhe68J9ltT
	 mCSaW9RqEljCBwxlS5CikQZ/vnprYZ9fhgWuOR8dS9WOKzTyCu+wtXCaw8IlRc+wGd
	 5r5N4dXrqaThPQvBYv5nlVnFgYKZVrjjzkrt+fX08Zgl59haLGx+JNAHEj7muxCNLv
	 odO1ykHA7H0qnhGQD37xMvwT0D/LbFsuHSmsrQdKsVnKIAnoiW6x2mjk7hOZAP9qy0
	 99m1eqvFp4IFdojEYdXRTxp5uAHKWXTvId4aiHEkgyg7HJfqPUhSJQil1W3iozr1hh
	 XEhE9Ybh970uw==
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Syed Saba Kareem <Syed.SabaKareem@amd.com>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Randy Dunlap <rdunlap@infradead.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v3 0/3] AMD Vangogh support for NAU8821/MAX98388
Date: Thu,  6 Jul 2023 00:47:57 +0300
Message-ID: <20230705214800.193244-1-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XVJ67NRJZYD3SBXJUW37SPHJYN6O2MXE
X-Message-ID-Hash: XVJ67NRJZYD3SBXJUW37SPHJYN6O2MXE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XVJ67NRJZYD3SBXJUW37SPHJYN6O2MXE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch series extends the Vangogh machine driver to support a variant
based on the Nuvoton NAU88L21 Codec and the Analog Devices MAX98388 
Speaker Amplifier.

Changes in v3:
 * Dropped acp5x_max98388_hw_params() in PATCH 3/3 and rely on dai_link
   to set format, according to Mark's review
 * v2: https://lore.kernel.org/all/20230705134341.175889-1-cristian.ciocaltea@collabora.com/

Changes in v2:
 * Reworked series to ensure the existing devices based on the CS35L41 
   codec continue to work fine
 * Rebased onto next-20230703

Cristian Ciocaltea (3):
  ASoC: amd: vangogh: Make use of DRV_NAME
  ASoC: amd: vangogh: Use dmi_first_match() for DMI quirk handling
  ASoC: amd: vangogh: Add support for NAU8821/MAX98388 variant

 sound/soc/amd/Kconfig              |   5 +-
 sound/soc/amd/vangogh/acp5x-mach.c | 149 +++++++++++++++++++++++++----
 2 files changed, 131 insertions(+), 23 deletions(-)

-- 
2.41.0

