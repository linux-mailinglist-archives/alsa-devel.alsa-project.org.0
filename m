Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6853723DE5
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Jun 2023 11:40:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CDF0774C;
	Tue,  6 Jun 2023 11:39:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CDF0774C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686044411;
	bh=Rq9AaRXDuRlWUf2x4+tGhBdxhm+biBK0j+Myd4nW8tQ=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=tmEOTkbUA1eC7BU1w/sUcLnJV8dl6iUj+mEQ7+6KFN8cChBhz3rP4U4j5eNM33Pdc
	 N3AgXYUXgbh9shWaewN0TMKyVf4BzuVndKgUehl7rbyAwHdoEI7gOA4dO4AaQ6zBsV
	 tDBK80cjDEjjJJ9QQ0ExUFMLbG9ua/J2MNmZZpqk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35581F80544; Tue,  6 Jun 2023 11:39:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D746F8016C;
	Tue,  6 Jun 2023 11:39:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2BB5F804DA; Tue,  6 Jun 2023 11:39:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1963DF80155
	for <alsa-devel@alsa-project.org>; Tue,  6 Jun 2023 11:38:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1963DF80155
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=OKFyEHeN;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=yPmjwlHK
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 58C821FD63;
	Tue,  6 Jun 2023 09:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1686044339;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=5aAHWP2Z3Pd28CxD0s43v2ci0A56RSIhk2O7M/CsCb4=;
	b=OKFyEHeNm4lUyxXZ34/0Vwb+yVjoEDETUC4dtC0V6lVJ23kSKfQJXepJalO0rOfxKIcqTB
	Gjz34/XIAFzykcmdv4tEbjruzdnOHur4IbJQYQbacr6NYVxPLf4RInpD6SLVlqgSOaBSPs
	ASRYiZeXZAQvwJdk0deVqPizRbjUwG4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1686044339;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=5aAHWP2Z3Pd28CxD0s43v2ci0A56RSIhk2O7M/CsCb4=;
	b=yPmjwlHKnNOHKbz8gi+GZ/hMF72vULJn6srtdkn8BbyTfCtMPqicLMB0iiguVn9ALHcOEB
	057HWweTMVLKr/BA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2DB3E13519;
	Tue,  6 Jun 2023 09:38:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 2gRjCbP+fmTiVwAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 06 Jun 2023 09:38:59 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 0/4] ALSA: Fix kctl->id initialization
Date: Tue,  6 Jun 2023 11:38:51 +0200
Message-Id: <20230606093855.14685-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: D3ISOKPAWF5WILY5BWFALFCDJWHRZFSI
X-Message-ID-Hash: D3ISOKPAWF5WILY5BWFALFCDJWHRZFSI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D3ISOKPAWF5WILY5BWFALFCDJWHRZFSI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Inspired by the recent Jaroslav's fix patch, I skimmed over the tree
and found that there are a few other similar bugs.  Here is a patch
set to address them.  Most of them are just shuffling the call order,
while the one in HD-audio is changed to use snd_ctl_replace_id()
helper.


Takashi

===

Takashi Iwai (4):
  ALSA: ymfpci: Fix kctl->id initialization
  ALSA: cmipci: Fix kctl->id initialization
  ALSA: gus: Fix kctl->id initialization
  ALSA: hda: Fix kctl->id initialization

 sound/isa/gus/gus_pcm.c        | 2 +-
 sound/pci/cmipci.c             | 6 +++---
 sound/pci/hda/hda_codec.c      | 6 +++++-
 sound/pci/ymfpci/ymfpci_main.c | 6 +++---
 4 files changed, 12 insertions(+), 8 deletions(-)

-- 
2.35.3

