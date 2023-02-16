Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F567699167
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Feb 2023 11:34:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8FB4AEA;
	Thu, 16 Feb 2023 11:33:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8FB4AEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676543669;
	bh=bK0Y7TabcwBh5BhbefahWr62u6QwIrNoSLywiOTb1E8=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=I/GkCjyHZO6AWrydplry7y+NqBDL2sp+9lLdeyLer5LP97uAuprthQKqEfLjsngqC
	 a6Gk0Ce7fDAPMO9zJ2So9Wex77VRNz6sbe2PBBEJZSqcOOgAfGzrG16ZRbFWKsNsv8
	 HlliQITSZhmgmaGeTY2ALXuDL9aEEBR0LNLpa20o=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 22565F80525;
	Thu, 16 Feb 2023 11:33:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A00A6F80526; Thu, 16 Feb 2023 11:33:30 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 53387F80083
	for <alsa-devel@alsa-project.org>; Thu, 16 Feb 2023 11:33:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53387F80083
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=WoGjTDIc
Received: from cryzen.lan (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net
 [82.11.51.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: tanureal)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BBC01660087C;
	Thu, 16 Feb 2023 10:33:15 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676543596;
	bh=bK0Y7TabcwBh5BhbefahWr62u6QwIrNoSLywiOTb1E8=;
	h=From:To:Cc:Subject:Date:From;
	b=WoGjTDIcjHbz6QR37ZypbCE0JttQj5M7mowncgwKOjvxhY4WzLq0U+fjXqwoFUBuM
	 MzVG21m03wQ8CHXstLcU2uUWn2I7G7BF0kAenT+w//ZWiqw1c2QRePucwlzsyB3vih
	 fY7ZRjFJ2EGlNu8OLK/0nhGI/0ChC2hIxibSkhpVIrLuiLt2/hLtQtkq8VK4tL2uIA
	 pKoGdSw/CC4yjAjmt82Zzc4HLoEQ6wUPS4+I+mFyZiwQxFGM4V8/dAJ7I6560xpQaK
	 eHTaeaO5SrEznV1ygmwJF3MgmDlSJZmc0QR65EmHyB5IIYoGHN3WWQWL9FTm/jZ0PU
	 CLtY+4e92oNIQ==
From: Lucas Tanure <lucas.tanure@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 0/9] Refactor Vangogh acp5x machine driver
Date: Thu, 16 Feb 2023 10:32:51 +0000
Message-Id: <20230216103300.360016-1-lucas.tanure@collabora.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TJRV5KZMXEDPCS25GCRD4ATVSHJFLYBO
X-Message-ID-Hash: TJRV5KZMXEDPCS25GCRD4ATVSHJFLYBO
X-MailFrom: lucas.tanure@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Lucas Tanure <lucas.tanure@collabora.com>, kernel@collabora.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Provide small fixes and refactor the code for easier insertion of a new
platform using the same acp5x machine driver.

Lucas Tanure (9):
  ASoC: amd: vangogh: Remove unnecessary init function
  ASoC: amd: vangogh: Update code indentation
  ASoC: amd: vangogh: use sizeof of variable instead of struct type
  ASoC: amd: vangogh: remove unnecessarily included headers
  ASoC: amd: vangogh: use for_each_rtd_components instead of for
  ASoC: amd: vangogh: Check Bit Clock rate before snd_soc_dai_set_pll
  ASoC: amd: vangogh: Move nau8821 and CPU side code up for future
    platform
  ASoC: amd: vangogh: Centralize strings definition
  ASoC: amd: vangogh: Include cs35l41 in structs names

 sound/soc/amd/vangogh/acp5x-mach.c | 313 +++++++++++++----------------
 1 file changed, 141 insertions(+), 172 deletions(-)

-- 
2.39.2

