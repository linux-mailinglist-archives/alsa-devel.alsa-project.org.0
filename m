Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F38C775A93F
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jul 2023 10:27:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09A66206;
	Thu, 20 Jul 2023 10:26:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09A66206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689841667;
	bh=duqcatkRNhH6j4aYUTaIzakDDrCnXDnRTFu6DdOR+Fo=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=oZhQLDDn6/S6Iw7nUSJBGP0uap+IgVnhERybFWvvpfq9ZcShnxfhfokjSQy6eCbHq
	 +597podaoDS4MbwU+rY90BqzxIitKdGpevV5mv5X2oe52Cu8j3mvuK3kFRj9vaquzo
	 g1EMOGMPjY3/R+DV58tlLEM+iFpgsbrOGYTtakcg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D51A7F80567; Thu, 20 Jul 2023 10:26:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E9BDEF80567;
	Thu, 20 Jul 2023 10:26:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 073ACF80494; Thu, 20 Jul 2023 10:26:01 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 8863AF804DA
	for <alsa-devel@alsa-project.org>; Thu, 20 Jul 2023 10:25:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8863AF804DA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=WP/8Yvb3;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=KYp4dSiM
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id ADFF522A20;
	Thu, 20 Jul 2023 08:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689841556;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=fgqTvDPRysettugJTBf1/exiUYXS5sDklMtMYkVndyY=;
	b=WP/8Yvb3UmJaYhHOJU5hCrVMiSz/XyoZJWsL1Ig7u7T2bokijNY2DllQVXgN+CLV0Mfsh7
	4N4bSTyvpUjWhomDIkEAKc0GdpMq0UxK10ixls9Euiqn/0k7r5A7UgHstG6TJUMOmEpAhk
	+9hQasxubOOnRYE9+M4jyo2Z8LoWsig=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689841556;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=fgqTvDPRysettugJTBf1/exiUYXS5sDklMtMYkVndyY=;
	b=KYp4dSiMYj55bDIpmeCqrVM40gVkHwDVbTAY5Lcg+vYdBlpqy3588l+y4Gb64f+sNqQm2S
	WmUy2DPm8wX3E7Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8E490133DD;
	Thu, 20 Jul 2023 08:25:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id Te3UIZTvuGRrJAAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 20 Jul 2023 08:25:56 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 0/4] ALSA: Cleanup with snd_ctl_add_followers()
Date: Thu, 20 Jul 2023 10:25:50 +0200
Message-Id: <20230720082554.31891-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XWDWDEQJ67RX7KYDEJVTZBL42RLEYVRM
X-Message-ID-Hash: XWDWDEQJ67RX7KYDEJVTZBL42RLEYVRM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XWDWDEQJ67RX7KYDEJVTZBL42RLEYVRM/>
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

Takashi Iwai (4):
  ALSA: vmaster: Add snd_ctl_add_followers() helper
  ALSA: ac97: Use the standard snd_ctl_add_followers() helper
  ALSA: ca0106: Use the standard snd_ctl_add_followers() helper
  ALSA: ice1712: Use the standard snd_ctl_add_followers() helper

 include/sound/control.h         |  3 +++
 sound/core/vmaster.c            | 28 ++++++++++++++++++++++++++++
 sound/pci/ac97/ac97_patch.c     | 16 +++-------------
 sound/pci/ca0106/ca0106_mixer.c | 19 ++++++-------------
 sound/pci/ice1712/juli.c        | 19 +++----------------
 sound/pci/ice1712/quartet.c     | 15 +++------------
 6 files changed, 46 insertions(+), 54 deletions(-)

-- 
2.35.3

