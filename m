Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1832E5774DD
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Jul 2022 09:07:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A34318C0;
	Sun, 17 Jul 2022 09:06:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A34318C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658041621;
	bh=KrIdsxXukDuSn334+OO9WF3UK52qdZHc8icCr3QYke0=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qVgEnH7prCFE53WDzQbUb9VWmhTHVf2WBEM6o4sKs36Y6W3li97zfq+AuZbzxwZYu
	 FIs15aEocJx9FM5P08XzsnrYFDazOhR0nRfqmpCPESnMFNh8WAcDmI4PwnGd8V3Zcy
	 t66EfRPSPA66IAkogZzTkgBxMadoKCUkF8dqdVLc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08E93F80543;
	Sun, 17 Jul 2022 09:06:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0394BF804D2; Sun, 17 Jul 2022 09:05:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ABAF6F800FB
 for <alsa-devel@alsa-project.org>; Sun, 17 Jul 2022 09:05:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABAF6F800FB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="0FSGd77v"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="sZ55YAwt"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 321B01F952;
 Sun, 17 Jul 2022 07:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1658041552; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=IUw18PvQemOwnIL4BRaYR45aIQ/7JkmUqCP1j5PfJJM=;
 b=0FSGd77vXBcsJmSGBWDWogdw5kRIgLiwee3AzcLWjfT0iAcQY97ky3y071YUiuQYE3Uz5c
 a6WnmifNPA3RyX6JLkaEB438OVXKbuEQjKk6etmBvyJLviA8qkpGA4gayFpeH7YxQ6309z
 rQoCymKskVmUJAi1llgzR0E+kECgPFs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1658041552;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=IUw18PvQemOwnIL4BRaYR45aIQ/7JkmUqCP1j5PfJJM=;
 b=sZ55YAwtPJMw9Y5Caa+5UVfi2rHlg8Mhz3DSKeFZlHUzU8l80nql+PUcaHA3EE5VBhdJK2
 0aPAug2NV4RVLlCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0FDE413A89;
 Sun, 17 Jul 2022 07:05:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id AodjAtC002LDawAAMHmgww
 (envelope-from <tiwai@suse.de>); Sun, 17 Jul 2022 07:05:52 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 0/5] ALSA: Drop async signal support
Date: Sun, 17 Jul 2022 09:05:44 +0200
Message-Id: <20220717070549.5993-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

this is a revised patch set for dropping fasync support from ALSA
core.

The async signal itself is very difficult to use properly due to
various restrictions (e.g. you cannot perform any I/O in the context),
hence it's a feature that has been never used by real applications.

OTOH, the real problem is that there have been quite a few syzcaller
reports indicating that fasync code path may lead to some potential
deadlocks for long time.  Dropping the feature is the easiest
solution, obviously.

The corresponding update for alsa-lib will follow once when we agree
with this approach.


thanks,

Takashi

===

v1: https://lore.kernel.org/r/20220715102935.4695-1-tiwai@suse.de
v1->v2: Fix unused variable warning in patch 2

===

Takashi Iwai (5):
  ALSA: timer: Drop async signal support
  ALSA: pcm: Drop async signal support
  ALSA: control: Drop async signal support
  ALSA: core: Drop async signal support
  ALSA: doc: Drop stale fasync entry

 .../kernel-api/writing-an-alsa-driver.rst      |  1 -
 include/sound/control.h                        |  1 -
 include/sound/pcm.h                            |  1 -
 sound/core/control.c                           | 11 -----------
 sound/core/init.c                              | 11 +----------
 sound/core/pcm_lib.c                           |  8 +-------
 sound/core/pcm_native.c                        | 18 ------------------
 sound/core/timer.c                             | 13 -------------
 8 files changed, 2 insertions(+), 62 deletions(-)

-- 
2.35.3

