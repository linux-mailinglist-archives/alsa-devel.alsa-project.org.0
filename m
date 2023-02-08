Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5ED68F098
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 15:19:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9FDB42;
	Wed,  8 Feb 2023 15:18:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9FDB42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675865985;
	bh=jMasCdl9yyyie/Tih/oiOYUJw0OxzU1n9Bub9TdVQjs=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=UI1sHN+EVrcTfBjLuMEGedagpotuZje/w8A7YHVYpjO6SI5v5bW1BzHFgBaJxgqCS
	 1kyDsUQ1Ygi6HJbCkD7cvDLiAZ+xBkev9Tdri4TLoB/4rtHAlr80bbaOVebuhJSYON
	 D7Kbk0gcylMWsCxoXz8Vh+5FlDRwxsU2huLbkyMI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EAC26F800AA;
	Wed,  8 Feb 2023 15:18:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5602EF8051D; Wed,  8 Feb 2023 15:18:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D4A29F800AA
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 15:18:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4A29F800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=K9cMVr7H
Received: from cryzen.lan (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net
 [82.11.51.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: tanureal)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B5B9F66020AE;
	Wed,  8 Feb 2023 14:18:42 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675865923;
	bh=jMasCdl9yyyie/Tih/oiOYUJw0OxzU1n9Bub9TdVQjs=;
	h=From:To:Cc:Subject:Date:From;
	b=K9cMVr7HmZpwa30ytjo/8PoLFe41PTEIHOPMCbd0TqAvM28XaJQfJCaCO9tGzRJ9L
	 6AI7/eaNrRsWY+nsWr6St4tUkkOXAZDw0IIFnAzqIX7K1L67qknRHS82YbtD9kPNIa
	 yc/kX5Fan3rZbF2rwANzSdsyjD+Tb+9p2D04p+NraVeCGac7UR0n2s/8SnuOtALvLb
	 8lZWQWRh9e8z/gZydWnGF15ZQ3Y3grVjDIdAwR58QLiccZIki00wZJiMiO2KjGq/H5
	 KM6iw3d6RnXyyrZCcGyHKbW6cquamS9K5rHNkeryeKS5Qh7pRX/P6lb9YCcWHMXbBl
	 ynE7uY2Dg5FXA==
From: Lucas Tanure <lucas.tanure@collabora.com>
To: David Rhodes <david.rhodes@cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v3 0/4] Add CS35L41 shared boost feature
Date: Wed,  8 Feb 2023 14:18:35 +0000
Message-Id: <20230208141839.1097377-1-lucas.tanure@collabora.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TATVI2CTT24WPHFA4773CN7WQDBRKMU7
X-Message-ID-Hash: TATVI2CTT24WPHFA4773CN7WQDBRKMU7
X-MailFrom: lucas.tanure@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 kernel@collabora.com, Lucas Tanure <lucas.tanure@collabora.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TATVI2CTT24WPHFA4773CN7WQDBRKMU7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Valve's Steam Deck uses CS35L41 in shared boost mode, where both speakers
share the boost circuit.
Add this support in the shared lib, but for now, shared boost is not
supported in HDA systems as would require BIOS changes.

Based on David Rhodes shared boost patches.

Also, fix boost config overwriting in IRQ found in the review and do a
small refactor of the code.

Changes from V2:
 - Drop External boost without VSPK Documentation
 - Move Shared boost to use values 2 and 3
 - Revert back to reg_sequence but reading the value first and only update
the necessary bits
 - Fix bug found by Intel kernel Test Robot

Changes from V1:
 - Fix Documentation patch subject
 - New patch for External boost without VSPK Documentation
 - New patch to fix boost IRQ overwriting issue
 - New patch to refactor IRQ release error code
 - reinit_completion on pcm_startup
 - fix DRE switch overwriting
 - return IRQ_HANDLED in PLL_LOCK case

Lucas Tanure (4):
  ASoC: cs35l41: Only disable internal boost
  ASoC: cs35l41: Refactor error release code
  ALSA: cs35l41: Add shared boost feature
  ASoC: cs35l41: Document CS35l41 shared boost

 .../bindings/sound/cirrus,cs35l41.yaml        |  10 +-
 include/sound/cs35l41.h                       |  13 +-
 sound/pci/hda/cs35l41_hda.c                   |   6 +-
 sound/soc/codecs/cs35l41-lib.c                |  69 +++++++++-
 sound/soc/codecs/cs35l41.c                    | 125 +++++++++---------
 sound/soc/codecs/cs35l41.h                    |   1 +
 6 files changed, 153 insertions(+), 71 deletions(-)

-- 
2.39.1

