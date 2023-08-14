Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7B377B813
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Aug 2023 13:59:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F328AE9;
	Mon, 14 Aug 2023 13:58:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F328AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692014389;
	bh=U4U8YhdUsJgaRVhVT3weiIh6+BvQ1DJpCndEehIWqag=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=MasqqNtmIOw/WwtJpnOT4Uy546gY3cNJXDzTV+c/dauBSacOGu0uFKmlhQB8Xhk8r
	 16laUBvMfmea5sBeKgt2JBi2PSuO5Xz5x2vbgWHj7ajSnCLA90/KEbNoyNRE+5HT7y
	 ppv19mS1bSg6ATEIdZZJKGe7gN8+S5qUCggfCrkw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 096E0F805BA; Mon, 14 Aug 2023 13:57:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4186FF805BB;
	Mon, 14 Aug 2023 13:57:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 321A5F80549; Mon, 14 Aug 2023 13:56:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0E1D8F80290
	for <alsa-devel@alsa-project.org>; Mon, 14 Aug 2023 13:55:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E1D8F80290
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=kFp/+CRC;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=J0FDoDKg
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 17ED721995;
	Mon, 14 Aug 2023 11:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692014141;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=XQeGJoZiwS+WxYkVBoqLRdA0cljITB4QdfMyE6lbFFs=;
	b=kFp/+CRCPGtee7m/HHJG6RlkE9iBkGLiItLiaZXJaSHCOFJVefxmV49Io8esHULi2dSTmx
	dkZvny408ZbpCYDNUxDK9iduT8PasgOnmWZQrRNzDBf6v/T2EKwgDtULSDfIPCePUN7veC
	W7/6+AabVtw/UyAbvOPTJ0Q5KJVfFP0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692014141;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=XQeGJoZiwS+WxYkVBoqLRdA0cljITB4QdfMyE6lbFFs=;
	b=J0FDoDKgkoTfK6W8B1m8B3Sq8+mKHrYih3FmIaCWeumyUMJoNkdmZeZPdu1jqCS3GM1WoU
	/fQKa10s4LX6IjCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A12A1138EE;
	Mon, 14 Aug 2023 11:55:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id POobJjwW2mRnMAAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 14 Aug 2023 11:55:40 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
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
Subject: [PATCH 00/25] ALSA: Generic PCM copy ops using iov_iter
Date: Mon, 14 Aug 2023 13:54:58 +0200
Message-Id: <20230814115523.15279-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LE2QVTY3T73VBATPG5V3QWKAK77CET33
X-Message-ID-Hash: LE2QVTY3T73VBATPG5V3QWKAK77CET33
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LE2QVTY3T73VBATPG5V3QWKAK77CET33/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

this is a revised patch set for cleaning up the PCM copy ops using
iov_iter to deal with kernel / user-space pointers consistently.

The previous patch set was based on sockptr_t:
  https://lore.kernel.org/r/20230731154718.31048-1-tiwai@suse.de
But this approach was NAK'ed as iov_iter is a preferred way for
achieving the purpose:
  https://lore.kernel.org/r/87edkce118.wl-tiwai@suse.de

The patch set starts with the missing export of import_ubuf()
function, followed by the new copy_ops using iov_iter, extensions of
some helpers and replacements of the existing code.  It resulted in a
good amount of code reduction.


Takashi

===

Cc: Alexander Viro <viro@zeniv.linux.org.uk>
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

Takashi Iwai (25):
  iov_iter: Export import_ubuf()
  ALSA: pcm: Add copy ops with iov_iter
  ALSA: core: Add memory copy helpers between iov_iter and iomem
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
  ASoC: dmaengine: Use iov_iter for process callback, too
  ALSA: doc: Update description for the new PCM copy ops
  ASoC: pcm: Drop obsoleted PCM copy_user ops
  ALSA: pcm: Drop obsoleted PCM copy_user and copy_kernel ops

 .../kernel-api/writing-an-alsa-driver.rst     | 58 ++++-------
 drivers/media/pci/solo6x10/solo6x10-g723.c    | 38 +-------
 include/sound/dmaengine_pcm.h                 |  2 +-
 include/sound/pcm.h                           | 13 ++-
 include/sound/soc-component.h                 | 14 +--
 lib/iov_iter.c                                |  1 +
 sound/core/memory.c                           | 56 +++++++++--
 sound/core/pcm_lib.c                          | 95 ++++++++++---------
 sound/core/pcm_native.c                       |  2 +-
 sound/drivers/dummy.c                         | 12 +--
 sound/drivers/pcmtest.c                       |  2 +-
 sound/isa/gus/gus_pcm.c                       | 23 +----
 sound/isa/sb/emu8000_pcm.c                    | 74 ++++-----------
 sound/pci/es1938.c                            | 30 +-----
 sound/pci/korg1212/korg1212.c                 | 50 +++-------
 sound/pci/nm256/nm256.c                       | 42 ++------
 sound/pci/rme32.c                             | 50 +++-------
 sound/pci/rme96.c                             | 42 ++------
 sound/pci/rme9652/hdsp.c                      | 42 ++------
 sound/pci/rme9652/rme9652.c                   | 46 ++-------
 sound/sh/sh_dac_audio.c                       | 25 +----
 sound/soc/atmel/mchp-pdmc.c                   |  2 +-
 sound/soc/mediatek/common/mtk-btcvsd.c        | 23 ++---
 sound/soc/qcom/lpass-platform.c               | 13 +--
 sound/soc/soc-component.c                     | 10 +-
 sound/soc/soc-generic-dmaengine-pcm.c         | 18 ++--
 sound/soc/soc-pcm.c                           |  4 +-
 sound/soc/stm/stm32_sai_sub.c                 |  2 +-
 sound/xen/xen_snd_front_alsa.c                | 55 ++---------
 29 files changed, 263 insertions(+), 581 deletions(-)

-- 
2.35.3

