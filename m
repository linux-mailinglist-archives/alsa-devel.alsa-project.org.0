Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6DF69024D
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 09:40:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0786DE;
	Thu,  9 Feb 2023 09:39:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0786DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675932014;
	bh=i1JlebRdfvjtPYpGWrkORFgqL1KTDHUIWHRch2IPV2g=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=rjqs63fdt1Zb08umCx1Dhzu3MZLbWJDGKhPYW+LuGDyH7EMXN7vEkmdLb4n9E143k
	 xEaTBzMOUB2xKslTB7G4gWN0KLjcROBrkKMHMFG6tzUVDdtXztD1hSNir17fc66qAS
	 kBZ2DTtNoOUeu74tIG8Cql0N78PS1Vlgu6SJMV7o=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 51B8FF8053D;
	Thu,  9 Feb 2023 09:38:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C3D9F80534; Thu,  9 Feb 2023 09:37:56 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id CB566F80086
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 09:37:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB566F80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=lEuC+l0G
Received: from cryzen.lan (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net
 [82.11.51.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: tanureal)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A665066020B9;
	Thu,  9 Feb 2023 08:37:30 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675931850;
	bh=i1JlebRdfvjtPYpGWrkORFgqL1KTDHUIWHRch2IPV2g=;
	h=From:To:Cc:Subject:Date:From;
	b=lEuC+l0Gd9iUjwyIouDp2TRfXK4SQadLKVZyPT9EizOYzYc6WFYqLK8KK82fbR+iw
	 KtspcEarrHXGk2eBaJ2SpeB1EUI0IoqSd6FVt80+1KfduyvIsVnCjA9Cqjmo8Pwys7
	 qpMGoFv564+Txpe4UUvuV9xhPlfM6mOR1nPZGCG0leoZZdArMeWNLktCosmQ5sMEjX
	 L2Soe5EJ5XBQVWejYFs36jYwxm4m66sZF/d9boS2/MhGrE3xJWCUfTFAEdBM0O+BA6
	 rouR/D2ZwDRKzH7O2DShWNPq42BPoH7etr6Squuq5IZ53R1DOXVQaKRNX4EYkP5n9q
	 A/cPUtIHBqHSg==
From: Lucas Tanure <lucas.tanure@collabora.com>
To: David Rhodes <david.rhodes@cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v4 0/4] Add CS35L41 shared boost feature
Date: Thu,  9 Feb 2023 08:37:22 +0000
Message-Id: <20230209083726.1337150-1-lucas.tanure@collabora.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CPLPTSGGXHDT2YXII6WQ6IZFUI5ZZGPM
X-Message-ID-Hash: CPLPTSGGXHDT2YXII6WQ6IZFUI5ZZGPM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CPLPTSGGXHDT2YXII6WQ6IZFUI5ZZGPM/>
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

Changes from V3:
 - Fix wrong code sent
 - Fix ISO C90 mixed declarations and code 

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
 sound/soc/codecs/cs35l41-lib.c                |  73 +++++++++-
 sound/soc/codecs/cs35l41.c                    | 125 +++++++++---------
 sound/soc/codecs/cs35l41.h                    |   1 +
 6 files changed, 157 insertions(+), 71 deletions(-)

-- 
2.39.1

