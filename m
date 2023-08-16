Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0C477E5FF
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Aug 2023 18:06:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14A4084B;
	Wed, 16 Aug 2023 18:05:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14A4084B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692201998;
	bh=S/SBHzWgOzqdjqUxd6gLITTcImpziyTRvr/kPbR0ad4=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=kbI6NRXXjn8r0q+IZUsDEcKmlrtj6niXQdRKQTj036cBznhiouvp/3KMWj/V8P8L3
	 1h44gAQHdV6py/kWqryROvnU5XxgxLtookShEGO1P5i3eAEi8M2ZIhKNcBCxNttfRk
	 y7ocmFb1KxZHmUEsZeEnvyV/9hqr6iwPe17kjmVQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F2148F8055A; Wed, 16 Aug 2023 18:05:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E1235F80553;
	Wed, 16 Aug 2023 18:05:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77332F80254; Wed, 16 Aug 2023 18:05:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 40B1EF801EB
	for <alsa-devel@alsa-project.org>; Wed, 16 Aug 2023 18:02:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40B1EF801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=iTJ+menf;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=jSTlwPIs
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1BAB41F855;
	Wed, 16 Aug 2023 16:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692201775;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=KF70rsWeN6Q8YcwKBfznUm/6zh5XJXAjgopizp+b8Jc=;
	b=iTJ+menfv+dbukdHpz2jnEe794f4bLfT+m6y3hHOjLBudZC66c5xBoZJIQAE4A/Mz8HZ5A
	vZ9JoHqDcV4UPjert5xPvpJmbu/Ai8240tOApvT3fdIS0fFaqB2F1OUB7/P9NMT5pBcLfo
	2VRlL/fd/MZuooxXcgs8isHeNHTtQSY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692201775;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=KF70rsWeN6Q8YcwKBfznUm/6zh5XJXAjgopizp+b8Jc=;
	b=jSTlwPIsJaznzpCf6TB/oE8Zp2MsnhaVXpoNi6E0FkhiTTDnuHjJ0EL2gnVxNgW3kMgRFv
	HrdLYAj8MI7QU3BA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ECF6E133F2;
	Wed, 16 Aug 2023 16:02:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id ICyzOC7z3GSNKQAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 16 Aug 2023 16:02:54 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Curtis Malainey <cujomalainey@google.com>
Subject: [PATCH RFC 0/9] ALSA: Don't embed struct devices
Date: Wed, 16 Aug 2023 18:02:43 +0200
Message-Id: <20230816160252.23396-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JZIPB4OIC3OK6YAGTPMAEKXMLUWM5PTA
X-Message-ID-Hash: JZIPB4OIC3OK6YAGTPMAEKXMLUWM5PTA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JZIPB4OIC3OK6YAGTPMAEKXMLUWM5PTA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

this is another set of patches to attempt papering over the UAF
problems that are seen when the delayed kobject release is enabled, as
initially reported by Curtis:
  https://lore.kernel.org/r/20230801171928.1460120-1-cujomalainey@chromium.org

There was a previous patch set with a different approach (using the
device refcount dependencies), but this is a sort of step-back to the
old way.
  https://lore.kernel.org/r/20230807135207.17708-1-tiwai@suse.de

After discussions and evaluations, we agreed that decoupling the
struct device from each sound component object is the safest (and
easiest) way as of now.  For applying the changes more consistently, I
introduced a new helper for the struct device allocation and
initialization, and applied all components.

A couple of more changes for card_dev refcount managed aren't included
in this patch set, though.  They might be good to have, but this patch
set should suffice for the currently seen UAF problems.

For a long-term solution, we may restructure the device management,
then the struct devices may be embedded again in each object.  But,
it'll need lots of other changes and cleanups, a big TODO.

The latest patches are found in topic/dev-split branch of sound.git
tree.


Takashi

===

Takashi Iwai (9):
  ALSA: core: Introduce snd_device_alloc()
  ALSA: control: Don't embed ctl_dev
  ALSA: pcm: Don't embed device
  ALSA: hwdep: Don't embed device
  ALSA: rawmidi: Don't embed device
  ALSA: compress: Don't embed device
  ALSA: timer: Create device with snd_device_alloc()
  ALSA: seq: Create device with snd_device_alloc()
  ALSA: core: Drop snd_device_initialize()

 include/sound/compress_driver.h |  2 +-
 include/sound/core.h            |  4 ++--
 include/sound/hwdep.h           |  2 +-
 include/sound/pcm.h             |  2 +-
 include/sound/rawmidi.h         |  2 +-
 sound/aoa/soundbus/i2sbus/pcm.c |  4 ++--
 sound/core/compress_offload.c   | 16 ++++++++------
 sound/core/control.c            | 14 ++++++------
 sound/core/control_led.c        |  4 ++--
 sound/core/hwdep.c              | 38 ++++++++++++++++++---------------
 sound/core/init.c               | 28 +++++++++++++++---------
 sound/core/pcm.c                | 22 +++++++++++--------
 sound/core/rawmidi.c            | 29 +++++++++++--------------
 sound/core/seq/seq_clientmgr.c  | 16 ++++++++------
 sound/core/timer.c              | 16 ++++++++------
 sound/core/ump.c                |  8 +++----
 sound/pci/hda/hda_hwdep.c       |  4 ++--
 sound/usb/media.c               |  4 ++--
 18 files changed, 119 insertions(+), 96 deletions(-)

-- 
2.35.3

