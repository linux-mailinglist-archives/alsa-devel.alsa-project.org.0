Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AC5586F18
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Aug 2022 18:58:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A333C84D;
	Mon,  1 Aug 2022 18:57:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A333C84D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659373095;
	bh=7WhqoNVMbv6/8vfQ5O10vvAbDbGN10EcX5x+WQReOVQ=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UFbckPbmZ5q6/ehLLu4kTQrzs8dmIbxgfB9J6hSpNIO3kJfkV1WmRhcUrAAPdeBH4
	 dkuYqINwe9e+AJRMS9sJBfECL3pnuuKtHJdXPlol/kHZqjvJ78m2idcGS4SVZMtLbx
	 8N3T70mdqNrSkeFRpkpOTOLD7byycFZfXww6P85w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E04AF80246;
	Mon,  1 Aug 2022 18:56:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 937AEF80548; Mon,  1 Aug 2022 18:56:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 216BBF8013D
 for <alsa-devel@alsa-project.org>; Mon,  1 Aug 2022 18:56:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 216BBF8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="peEGv+HA"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="LQDD5O6F"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AC8EE2034C;
 Mon,  1 Aug 2022 16:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1659373002; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Ox+NX2UumkPRUJQlb9xJJ3UDWIZq8aMhYEoGy7jyqH0=;
 b=peEGv+HAbc8nKZDUb8hevQNqvZiyjsrqj5OroJsExkoT97mQibtnP8o8cOOOxd2GxS77yu
 CZCgHFA0sfNvKkZWPm6X/DrnplVPbY6alKBXPytlS5cPHYXYvznyDJ0DE0YNhpsV8zY976
 MlyXWxz6JCr1HxE015h6+rcAGSA6ID8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1659373002;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Ox+NX2UumkPRUJQlb9xJJ3UDWIZq8aMhYEoGy7jyqH0=;
 b=LQDD5O6Fbl6k1qR8iKuzEQxVYcHjrUbkShpRTKYxTVSnLPHt86s+s225ckgSzYfZwi/aTe
 CWkZXCpRT3fN7tAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8EE6113AAE;
 Mon,  1 Aug 2022 16:56:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sl/CIcoF6GLXGgAAMHmgww
 (envelope-from <tiwai@suse.de>); Mon, 01 Aug 2022 16:56:42 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/7] ALSA: Replace sprintf() with sysfs_emit()
Date: Mon,  1 Aug 2022 18:56:32 +0200
Message-Id: <20220801165639.26030-1-tiwai@suse.de>
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

this is a patch set for rather simple conversions from the plain
sprintf() & co to the new helpers, sysfs_emit() and sysfs_emit_at().
No functional changes are expected.


Takashi

===

Takashi Iwai (7):
  ALSA: ac97: Replace sprintf() with sysfs_emit()
  ALSA: aoa: Replace sprintf() with sysfs_emit()
  ALSA: control-led: Replace sprintf() with sysfs_emit()
  ALSA: core: Replace scnprintf() with sysfs_emit()
  ALSA: pcm: Replace sprintf() with sysfs_emit()
  ALSA: hda: Replace sprintf() with sysfs_emit()
  ALSA: line6: Replace sprintf() with sysfs_emit()

 sound/ac97/bus.c           |  2 +-
 sound/aoa/soundbus/sysfs.c | 22 ++++++++------------
 sound/core/control_led.c   | 29 +++++++++++---------------
 sound/core/init.c          |  4 ++--
 sound/core/pcm.c           |  2 +-
 sound/hda/hdac_sysfs.c     | 42 +++++++++++++++++++-------------------
 sound/pci/hda/hda_sysfs.c  | 23 ++++++++++-----------
 sound/usb/line6/pod.c      |  8 ++++----
 sound/usb/line6/podhd.c    |  4 ++--
 9 files changed, 62 insertions(+), 74 deletions(-)

-- 
2.35.3

