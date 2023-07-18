Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14627757F29
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jul 2023 16:14:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8557883E;
	Tue, 18 Jul 2023 16:14:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8557883E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689689691;
	bh=OV6kPaSYfbyC+YaxYbb64GRGpUp4BGjSqM7wRG7lWPM=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=L628oZUNzWpt7TJuVVSMYo4JebiFsnLHbFSUj/7+jB6ikr6skhERnJqJrAPgt2TZF
	 0Snx5Zb5xHb2zRICMmp9aihAR2tInX9xVvRXvVhbkR6lxxXjE1dlXaT+8q09+FVWyL
	 hg5roJDo2BpEAWJLwfUccxK71g0v2deyeDPTmgZQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6CB24F8058C; Tue, 18 Jul 2023 16:13:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BD006F80527;
	Tue, 18 Jul 2023 16:13:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E3E5BF80587; Tue, 18 Jul 2023 16:13:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EFA0EF8053B
	for <alsa-devel@alsa-project.org>; Tue, 18 Jul 2023 16:13:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EFA0EF8053B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=JzNN3Nm2;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=puSiuL4M
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D35362190B;
	Tue, 18 Jul 2023 14:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689689594;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jYz0yKW28gmyrJl6b360seloo2D1rNdugsefOjCWxHs=;
	b=JzNN3Nm2P0wESOvaptWZuuJKIQXgrSBnkDOO9v+xaEV+b4jFeXEZsHCP6NDrAQ0Ka/PGVk
	PBFy9B3RFRS8SiL0jsvBOzzDG5LbsXCeE+0BVzGTG6wFCgqbUDjY/X3w6xVhxLOypSsd2s
	LoP2ZUfv34+OZN72GKW8/Mct58VlC9Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689689594;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jYz0yKW28gmyrJl6b360seloo2D1rNdugsefOjCWxHs=;
	b=puSiuL4MJh0OB5f28b9iYQ47y6AOaroe7EZp2zw7VqRHnWC8fEE1W5iquqiC3Lxhd6Dnqf
	szbRoCvNHkjuUOAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 93123134B0;
	Tue, 18 Jul 2023 14:13:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id EcgAI/qdtmQ8AQAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 18 Jul 2023 14:13:14 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Alex Elder <elder@kernel.org>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Mark Brown <broonie@kernel.org>,
	Mark Greer <mgreer@animalcreek.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	greybus-dev@lists.linaro.org
Subject: [PATCH 00/11] ALSA: Make control API taking controls_rwsem
 consistently
Date: Tue, 18 Jul 2023 16:12:53 +0200
Message-Id: <20230718141304.1032-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TSDC4XIEAX5RWBLIFM4Q6QBR74WKI4QK
X-Message-ID-Hash: TSDC4XIEAX5RWBLIFM4Q6QBR74WKI4QK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TSDC4XIEAX5RWBLIFM4Q6QBR74WKI4QK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

A few ALSA control API helpers like snd_ctl_rename(), snd_ctl_remove()
and snd_ctl_find_*() suppose the callers taking card->controls_rwsem.
But it's error-prone and fragile.  This patch set tries to change
those API functions to take the card->controls>rwsem internally by
themselves, so that the drivers don't need to take care of lockings.

After applying this patch set, only a couple of places still touch
card->controls_rwsem (which are OK-ish as they need for traversing the
control linked list).


Takashi

===

Takashi Iwai (11):
  ALSA: control: Take card->controls_rwsem in snd_ctl_rename()
  staging: greybus: audio_helper: Use snd_ctl_remove_id()
  ASoC: atmel: mchp-pdmc: Use snd_ctl_remove_id()
  ALSA: control: Take controls_rwsem lock in snd_ctl_remove()
  ALSA: control: Add lockdep warning to internal functions
  ASoC: sigmadsp: Simplify with snd_ctl_activate_id()
  staging: greybus: Avoid abusing controls_rwsem
  ALSA: control: Make snd_ctl_find_id() argument const
  ALSA: control: Introduce unlocked version for snd_ctl_find_*() helpers
  ALSA: control: Take lock in snd_ctl_find_id() and snd_ctl_find_numid()
  ALSA: emu10k1: Go back and simplify with snd_ctl_find_id()

 drivers/staging/greybus/audio_codec.c  |  18 ++--
 drivers/staging/greybus/audio_codec.h  |   1 +
 drivers/staging/greybus/audio_helper.c |  20 +---
 include/sound/control.h                |   6 +-
 sound/core/control.c                   | 126 ++++++++++++++++++++-----
 sound/core/control_compat.c            |   2 +-
 sound/core/control_led.c               |   2 +-
 sound/core/jack.c                      |   2 -
 sound/core/oss/mixer_oss.c             |  10 +-
 sound/core/pcm.c                       |   2 -
 sound/isa/sb/emu8000.c                 |   2 -
 sound/isa/sb/sb16_csp.c                |   2 -
 sound/pci/emu10k1/emufx.c              |   5 -
 sound/pci/hda/hda_codec.c              |   2 -
 sound/soc/atmel/mchp-pdmc.c            |  12 +--
 sound/soc/codecs/sigmadsp.c            |  25 +----
 sound/soc/soc-topology.c               |   3 -
 17 files changed, 129 insertions(+), 111 deletions(-)

-- 
2.35.3

