Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6969B75A90F
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jul 2023 10:23:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5286846;
	Thu, 20 Jul 2023 10:22:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5286846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689841393;
	bh=qWWAfjfYAWWjfHE7lvDrsZ4cKZSbOMSGYBvBJmSj4+c=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=SzMmOwHfrAcYk2lSbTYB63F3AhRvMSksOlaNEhW9gJrVUMlXHCwFeuQpdt5FCdbVp
	 U9vkO/utdfu4dcey/1tYFe/lAAbjGNymqnK1z1DKMJd8iWPwO8VBOCVIcw4SNpkUra
	 4G+SuBdpCrUFE2SYz9l5gdOAWVab7nJ6fkJYVH9o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AECB8F805AF; Thu, 20 Jul 2023 10:21:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6ECDFF805A0;
	Thu, 20 Jul 2023 10:21:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4BF1F800D2; Thu, 20 Jul 2023 10:21:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7B485F80548
	for <alsa-devel@alsa-project.org>; Thu, 20 Jul 2023 10:21:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B485F80548
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=BUT21ZAP;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=ltpXXhk1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 918C320597;
	Thu, 20 Jul 2023 08:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689841275;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=SOR1WDKpCrctKzm8Jfg3ztcocUx3IwOhR5LpBe8LWdA=;
	b=BUT21ZAPq2m1gA/pm3FaH2mTYQUgddRNTPYA44PssGL7LRHF2x1u+Jf0Lxw1K7HGp6jNBD
	2uFb/OEf/2VzD1LJwKMkg4e/F1thXOx78kxaRdp0ByIvnuD4ZrnZPCgHJoeiFxO2Bp0hbf
	N2N8KC8IrmKDdNBpUH4vR5WykGS12Io=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689841275;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=SOR1WDKpCrctKzm8Jfg3ztcocUx3IwOhR5LpBe8LWdA=;
	b=ltpXXhk1iSplQ47OmpKuSbvpOiRkkftO6XrzM4Fmj6OzpinhXrhiTC9k5IuQ8JF+mT71SL
	xz2S7alKI7V+4BAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 746C2133DD;
	Thu, 20 Jul 2023 08:21:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id plCsG3vuuGQmIgAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 20 Jul 2023 08:21:15 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 00/11] ALSA: Cleanup with snd_ctl_find_id_mixer()
Date: Thu, 20 Jul 2023 10:20:57 +0200
Message-Id: <20230720082108.31346-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JJTDWTYCRXXCHUKKARNO7JMVKY32JWIK
X-Message-ID-Hash: JJTDWTYCRXXCHUKKARNO7JMVKY32JWIK
X-MailFrom: tiwai@suse.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JJTDWTYCRXXCHUKKARNO7JMVKY32JWIK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Quite a few drivers have the very same open code to find a control
element from the given name string.  Provide a standard helper and
replace with it for cleanup.


Takashi

===

Takashi Iwai (11):
  ALSA: control: Introduce snd_ctl_find_id_mixer()
  ALSA: ca0106: Simplify with snd_ctl_find_id_mixer()
  ALSA: cs46xx: Simplify with snd_ctl_find_id_mixer()
  ALSA: emu10k1: Simplify with snd_ctl_find_id_mixer()
  ALSA: es1968: Simplify with snd_ctl_find_id_mixer()
  ALSA: ice1712: Simplify with snd_ctl_find_id_mixer()
  ALSA: maestro3: Simplify with snd_ctl_find_id_mixer()
  ALSA: via82xx: Simplify with snd_ctl_find_id_mixer()
  ALSA: cmipci: Simplify with snd_ctl_find_id_mixer()
  ASoC: mediatek: mt8188: Simplify with snd_ctl_find_id_mixer()
  ALSA: ac97: Simplify with snd_ctl_find_id_mixer()

 include/sound/control.h                   | 22 ++++++++++++++++++++++
 sound/pci/ac97/ac97_patch.c               |  6 +-----
 sound/pci/ca0106/ca0106_mixer.c           | 15 +++------------
 sound/pci/cmipci.c                        |  6 +-----
 sound/pci/cs46xx/cs46xx_lib.c             |  7 ++-----
 sound/pci/emu10k1/emumixer.c              | 11 +----------
 sound/pci/es1968.c                        | 15 ++++-----------
 sound/pci/ice1712/juli.c                  | 13 ++-----------
 sound/pci/ice1712/psc724.c                | 19 ++++++++-----------
 sound/pci/ice1712/quartet.c               | 13 ++-----------
 sound/pci/ice1712/wm8776.c                |  6 +-----
 sound/pci/maestro3.c                      | 15 ++++-----------
 sound/pci/via82xx.c                       |  6 +-----
 sound/soc/mediatek/mt8188/mt8188-mt6359.c | 12 +-----------
 14 files changed, 53 insertions(+), 113 deletions(-)

-- 
2.35.3

