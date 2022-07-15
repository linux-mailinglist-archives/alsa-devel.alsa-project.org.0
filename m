Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4A4575F6A
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jul 2022 12:32:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A79E18E1;
	Fri, 15 Jul 2022 12:31:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A79E18E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657881141;
	bh=DGcQmCbuhzsWEiJYVi+RzpkjhouCyhi6DIHJOjUgvXU=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PFfuF/83mNIIX/dZDcLuhTHmtLYo53j5HW6KrNmFWNKBCp+P3OGNfP0cdWFsspXAE
	 +VXU6X/vsrxEc2WSX1jFwJSOzIXmYVsK05CfeZTLykAJFCUNcAhCIbLCC6eFtUlooF
	 e/f6WA9uoFiWKc+O4Hs6z9vCOB0Pud6l2bOJ9XPI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 252A7F8055A;
	Fri, 15 Jul 2022 12:30:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E4AEF80566; Fri, 15 Jul 2022 12:29:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A206DF80212
 for <alsa-devel@alsa-project.org>; Fri, 15 Jul 2022 12:29:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A206DF80212
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="VAuyPn7I"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="pXlbCfXx"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3044A3410C;
 Fri, 15 Jul 2022 10:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1657880978; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=8nYTSwW25/b/m69kBE7dy50+tcFxUtZRzrCmdMNBIgQ=;
 b=VAuyPn7IUPLd1YgNysKaQz6o4cxynQupOD0rlrAztMlWewt/Fy3zrM7UjLyxiosCHoeU3+
 vGBz0Ed6DWK5tIJf0Fwnjqh/JMUq8I/Z/6S1dL3hQa5+deCsVwTmLeQaoxuAKuH0MuXmHf
 QjaUXl6OUA6lZGGc9zI9FQiR1d+hw9o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1657880978;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=8nYTSwW25/b/m69kBE7dy50+tcFxUtZRzrCmdMNBIgQ=;
 b=pXlbCfXxENGv/b9f3HANerd/lrWwaIXij8yZ3dJ5r+IsbOI1rAndH0K6L+Ns6khnrV4uMv
 4QCt1UlCJmEeJgAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 18C7213AC3;
 Fri, 15 Jul 2022 10:29:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id fbfUBJJB0WI+WwAAMHmgww
 (envelope-from <tiwai@suse.de>); Fri, 15 Jul 2022 10:29:38 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/5] ALSA: Drop async signal support
Date: Fri, 15 Jul 2022 12:29:30 +0200
Message-Id: <20220715102935.4695-1-tiwai@suse.de>
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

this is a patch series to drop one of unused features, the async
signal support, from ALSA core.  The async signal itself is very
difficult to use properly due to various restrictions (e.g. you cannot
perform any I/O in the context), hence it's a feature that has been
never used by real applications.

OTOH, the real problem is that there have been quite a few syzcaller
reports indicating that fasync code path may lead to some potential
deadlocks for long time.  Dropping the feature is the easiest
solution, obviously.

The corresponding update for alsa-lib will follow once when we agree
with this approach.


thanks,

Takashi

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
 sound/core/pcm_lib.c                           |  4 +---
 sound/core/pcm_native.c                        | 18 ------------------
 sound/core/timer.c                             | 13 -------------
 8 files changed, 2 insertions(+), 58 deletions(-)

-- 
2.35.3

