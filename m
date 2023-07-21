Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FE475BF82
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 09:22:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9BB01F7;
	Fri, 21 Jul 2023 09:21:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9BB01F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689924140;
	bh=qL7QxbxFCaP4mZldKskbjYppg/qkhneHem+jWoW6wbY=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=nRNdfiYrXpE5kbTEWvAU49vqqu3nYItrnEX7EBwh6zYxu91DMASe2GefyE2tGittc
	 3PTpC11LdIzdg7cmt8fhC7AUKRR37XuTpBCAcBQ5X8MnBuwDOnLkib3LwrEzC2dMED
	 Q9w/H5Ch/iAhD0joWfBAUgWMcqOGjT8YoYIL0zWU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6EA61F80588; Fri, 21 Jul 2023 09:20:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 281D2F80563;
	Fri, 21 Jul 2023 09:20:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C7D9F8032D; Fri, 21 Jul 2023 09:17:23 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id E4A3AF8007E
	for <alsa-devel@alsa-project.org>; Fri, 21 Jul 2023 09:17:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4A3AF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=ZQjZBNAn;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=3zPZt7zv
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B68131FFDE;
	Fri, 21 Jul 2023 07:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689923827; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=IUxv/KVtFCYVsCs/qDEXGCMMwfd55CTKjVbLFhIukf0=;
	b=ZQjZBNAnJ4i6TqdDjBNIAhh61KyWji9zmh/F9ChUrHPvkAbzkstSUbOS43mBjDjYwQi4Gg
	74KJRGd8rTcv83KO+BYKECPirf+y4xaEm6GvpWWJ0OR0hdKtlJkJ5YpIW34eniG80bWLn6
	ewflh5+nQLoU6c/p9RW68zAXMfZeLA0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689923827;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=IUxv/KVtFCYVsCs/qDEXGCMMwfd55CTKjVbLFhIukf0=;
	b=3zPZt7zvpF1NUNcUHYnXRMBM7m5oH+XgK/gFYhgeF2rq3lrdSj71h/V7JhOXEiyXLgS4ja
	fOEfslCnTebcDUCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 98DCA134B0;
	Fri, 21 Jul 2023 07:17:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id emJBJPMwumRdLgAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 21 Jul 2023 07:17:07 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 0/4] ALSA: Cleanup with snd_ctl_add_followers()
Date: Fri, 21 Jul 2023 09:16:39 +0200
Message-Id: <20230721071643.3631-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 43SXV2N3KWZBEASJ2CZOWE7LATR7YKZX
X-Message-ID-Hash: 43SXV2N3KWZBEASJ2CZOWE7LATR7YKZX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/43SXV2N3KWZBEASJ2CZOWE7LATR7YKZX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This is another set of cleanup patches: introduce a new standard
helper for adding vmaster control elements, and replace the open code
in a few drivers with it.


Takashi

===

v1->v2: Cleanup of ac97 patch to drop unnecessary check of the error
        condition

===

Takashi Iwai (4):
  ALSA: vmaster: Add snd_ctl_add_followers() helper
  ALSA: ac97: Use the standard snd_ctl_add_followers() helper
  ALSA: ca0106: Use the standard snd_ctl_add_followers() helper
  ALSA: ice1712: Use the standard snd_ctl_add_followers() helper

 include/sound/control.h         |  3 +++
 sound/core/vmaster.c            | 28 ++++++++++++++++++++++++++++
 sound/pci/ac97/ac97_patch.c     | 16 +---------------
 sound/pci/ca0106/ca0106_mixer.c | 19 ++++++-------------
 sound/pci/ice1712/juli.c        | 19 +++----------------
 sound/pci/ice1712/quartet.c     | 15 +++------------
 6 files changed, 44 insertions(+), 56 deletions(-)

-- 
2.35.3

