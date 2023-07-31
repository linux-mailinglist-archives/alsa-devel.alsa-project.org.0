Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 701EA769B73
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 17:55:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B145DDF9;
	Mon, 31 Jul 2023 17:54:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B145DDF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690818932;
	bh=u+pgaen+Zes8+Ry4gyHAQ42kBH6Zl2OOctsLBTBWTpM=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=U728FhfgjJcakMWp40NvLQEn6JMUa8R6fdFVaJDJj/s2xk3B/cXVQGdJgUWTLBq2/
	 NfTeQDhlaipQBYW7CRUfIbAyG9URgS9GQsozzOADyVaTSl3MrVI3Y26175vqzNzD8B
	 Om6KGyMNBLTcaEOMX8ldKoPg81ZmsJwJcmhDrhi0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C86EDF80681; Mon, 31 Jul 2023 17:50:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 484AEF80679;
	Mon, 31 Jul 2023 17:50:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4D4E0F805BD; Mon, 31 Jul 2023 17:49:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9D7A4F80520
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 17:47:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D7A4F80520
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=rhCV7DQX;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=1hce7oJg
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B35B21F385;
	Mon, 31 Jul 2023 15:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1690818443;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=t3IBo6+Xh2NmTnvBSm+b5LtxORuubw5R26/pUdx5lvQ=;
	b=rhCV7DQXwa+unzKT3opzFC6boo5uZYaa4z9NwGfSq4Io7QBHD2ni5op4Z1RNLHOiDDEa2k
	+KCCws2BT0O1mIOTeJytKqi6Lxmp3k4vkcz4+h9PPq8cwb+RTErNbVqgfUD1hnldMRn4u/
	Znq7cvbGgSupFudpbC7mCtTWfLq4Oic=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1690818443;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=t3IBo6+Xh2NmTnvBSm+b5LtxORuubw5R26/pUdx5lvQ=;
	b=1hce7oJgp7vNPcAZisDxdfNeDXcXTojPVPAnbeD684LHbINwF/3jcXav44ynQXxRXqVRWa
	K9EYUuceH80eoDCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 555E51322C;
	Mon, 31 Jul 2023 15:47:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id aoTYE4vXx2Q3fwAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 31 Jul 2023 15:47:23 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Andrey Utkin <andrey_utkin@fastmail.com>,
	Anton Sviridenko <anton@corp.bluecherry.net>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Bluecherry Maintainers <maintainers@bluecherrydvr.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Ismael Luceno <ismael@iodev.co.uk>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Mark Brown <broonie@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	linux-media@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH 00/24] ALSA: Generic PCM copy ops using sockptr_t
Date: Mon, 31 Jul 2023 17:46:54 +0200
Message-Id: <20230731154718.31048-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZJT7NRVL5ZADLHIZP2N6ORKJ22Y7IBKS
X-Message-ID-Hash: ZJT7NRVL5ZADLHIZP2N6ORKJ22Y7IBKS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZJT7NRVL5ZADLHIZP2N6ORKJ22Y7IBKS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

this is a patch set to clean up the PCM copy ops using sockptr_t as a
"universal" pointer, inspired by the recent patch from Andy
Shevchenko:
  https://lore.kernel.org/r/20230721100146.67293-1-andriy.shevchenko@linux.intel.com

Even though it sounds a bit weird, sockptr_t is a generic type that is
used already in wide ranges, and it can fit our purpose, too.  With
sockptr_t, the former split of copy_user and copy_kernel PCM ops can
be unified again gracefully.

The patch set introduces the new PCM ops, converting users, and drops
the old PCM ops.  Most of conversions are straightforward, simply
replacing copy_*_user() with copy_*_sockptr() variants.

Note that the conversion in ASoC will fix a potential problem of ASoC
PCM that has been for long time.  Since ASoC component takes care of
only copy_user, the conversion form/to kernel space might have been
missing.  With this patch set, both cases are handled with sockptr_t
by a single callback.

The patches are lightly tested (with a faked PCM copy implementation
on HD-audio), while most of patches are only compile-tested.


Takashi

===

Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Andrey Utkin <andrey_utkin@fastmail.com>
Cc: Anton Sviridenko <anton@corp.bluecherry.net>
Cc: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc: Banajit Goswami <bgoswami@quicinc.com>
Cc: Bluecherry Maintainers <maintainers@bluecherrydvr.com>
Cc: Claudiu Beznea <claudiu.beznea@microchip.com>
Cc: Ismael Luceno <ismael@iodev.co.uk>
Cc: Lars-Peter Clausen <lars@metafoo.de>
Cc: Mark Brown <broonie@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Cc: Olivier Moysan <olivier.moysan@foss.st.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-media@vger.kernel.org
Cc: xen-devel@lists.xenproject.org

===

Takashi Iwai (24):
  ALSA: pcm: Add copy ops with universal sockptr_t
  ALSA: core: Add memory copy helpers between sockptr and iomem
  ALSA: dummy: Convert to generic PCM copy ops
  ALSA: gus: Convert to generic PCM copy ops
  ALSA: emu8000: Convert to generic PCM copy ops
  ALSA: es1938: Convert to generic PCM copy ops
  ALSA: korg1212: Convert to generic PCM copy ops
  ALSA: nm256: Convert to generic PCM copy ops
  ALSA: rme32: Convert to generic PCM copy ops
  ALSA: rme96: Convert to generic PCM copy ops
  ALSA: hdsp: Convert to generic PCM copy ops
  ALSA: rme9652: Convert to generic PCM copy ops
  ALSA: sh: Convert to generic PCM copy ops
  ALSA: xen: Convert to generic PCM copy ops
  ALSA: pcmtest: Update comment about PCM copy ops
  media: solo6x10: Convert to generic PCM copy ops
  ASoC: component: Add generic PCM copy ops
  ASoC: mediatek: Convert to generic PCM copy ops
  ASoC: qcom: Convert to generic PCM copy ops
  ASoC: dmaengine: Convert to generic PCM copy ops
  ASoC: dmaengine: Use sockptr_t for process callback, too
  ALSA: doc: Update description for the new PCM copy ops
  ASoC: pcm: Drop obsoleted PCM copy_user ops
  ALSA: pcm: Drop obsoleted PCM copy_user and copy_kernel ops

 .../kernel-api/writing-an-alsa-driver.rst     | 59 +++++---------
 drivers/media/pci/solo6x10/solo6x10-g723.c    | 41 ++--------
 include/sound/dmaengine_pcm.h                 |  2 +-
 include/sound/pcm.h                           | 12 +--
 include/sound/soc-component.h                 | 14 ++--
 sound/core/memory.c                           | 39 +++++++++
 sound/core/pcm_lib.c                          | 81 +++++++++----------
 sound/core/pcm_native.c                       |  2 +-
 sound/drivers/dummy.c                         | 12 +--
 sound/drivers/pcmtest.c                       |  2 +-
 sound/isa/gus/gus_pcm.c                       | 23 +-----
 sound/isa/sb/emu8000_pcm.c                    | 79 +++++-------------
 sound/pci/es1938.c                            | 31 ++-----
 sound/pci/korg1212/korg1212.c                 | 46 +++--------
 sound/pci/nm256/nm256.c                       | 42 ++--------
 sound/pci/rme32.c                             | 50 +++---------
 sound/pci/rme96.c                             | 48 +++--------
 sound/pci/rme9652/hdsp.c                      | 42 ++--------
 sound/pci/rme9652/rme9652.c                   | 46 ++---------
 sound/sh/sh_dac_audio.c                       | 25 +-----
 sound/soc/atmel/mchp-pdmc.c                   |  2 +-
 sound/soc/mediatek/common/mtk-btcvsd.c        | 22 ++---
 sound/soc/qcom/lpass-platform.c               | 12 +--
 sound/soc/soc-component.c                     | 10 +--
 sound/soc/soc-generic-dmaengine-pcm.c         | 18 ++---
 sound/soc/soc-pcm.c                           |  4 +-
 sound/soc/stm/stm32_sai_sub.c                 |  2 +-
 sound/xen/xen_snd_front_alsa.c                | 55 +++----------
 28 files changed, 251 insertions(+), 570 deletions(-)

-- 
2.35.3

