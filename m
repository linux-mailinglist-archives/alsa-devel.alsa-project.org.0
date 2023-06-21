Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C88A8737FC3
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jun 2023 13:04:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C91C82B;
	Wed, 21 Jun 2023 13:03:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C91C82B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687345477;
	bh=qCKs3/paHBtxowj1/1xs6UUzfMLrwZjUXQ/sKH3FAkI=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=PWxF4ksZCSU5ZmS7Q3MOjm8UEdgQ1PXmO6M9FNuQv6scdoAE9R2GZRswf2VDZJy2K
	 8AYY2tIYj0SUqg5QZR/psO9OE9uFwst4NgwkGU5MhbWWgb+DnwwbP7lFPUtWpfS8Vh
	 hFT0ow7CAN1BRxB9sUloVav9fGsY1xOV/Q9VH13w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F185FF8055B; Wed, 21 Jun 2023 13:02:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 69767F8055B;
	Wed, 21 Jun 2023 13:02:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60377F80549; Wed, 21 Jun 2023 13:02:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EB509F80093
	for <alsa-devel@alsa-project.org>; Wed, 21 Jun 2023 13:02:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB509F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=QdbJARIP;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=T4Lvm25f
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 73F781FDBB;
	Wed, 21 Jun 2023 11:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1687345363; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=2YJ9xx+aOBG1mcbyKIjlUqxzYp7Pz7GYn75jxNsK55g=;
	b=QdbJARIPFJrxCEpuw94jIwaMpuSKubEZ5he9vVHadqqCTgSdlUPylmmwt+camZHfGYyce8
	Fc/kDnAVOUdcfcI2a5rRMzkSAdTuZi9UGkYnYr0JopRvShZ+pd4jzenbP4NmCy8aHSDu5d
	KSNoY4FkW7G4zBTSxApPGVUrH+jfg1Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1687345363;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=2YJ9xx+aOBG1mcbyKIjlUqxzYp7Pz7GYn75jxNsK55g=;
	b=T4Lvm25fTGOZMnC8vtzANnCMrQu68EyCEPiaFbuz/sjXIVsHP3D+otiYZfHwH61u4k60FN
	FuemT4D0I/3+4ODA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5D5C9134B1;
	Wed, 21 Jun 2023 11:02:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 1adyFtPYkmTdHgAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 21 Jun 2023 11:02:43 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/3] ALSA: ump: Preliminary changes for gadget driver
Date: Wed, 21 Jun 2023 13:02:38 +0200
Message-Id: <20230621110241.4751-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QF5TAJ2YNPO5FFS6ZMWHOVPPDWBKDEB7
X-Message-ID-Hash: QF5TAJ2YNPO5FFS6ZMWHOVPPDWBKDEB7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QF5TAJ2YNPO5FFS6ZMWHOVPPDWBKDEB7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

this is a small patch set to change the UMP core for the upcoming
gadget driver support.  Basically exporting a couple of helper
functions and adding a flag to suppress the internal UMP handling.
No functional changes by those alone.


Takashi

===

Takashi Iwai (3):
  ALSA: ump: Add helper to change MIDI protocol
  ALSA: ump: Add no_process_stream flag
  ALSA: ump: Export snd_ump_receive_ump_val()

 include/sound/ump.h |  4 ++++
 sound/core/ump.c    | 46 +++++++++++++++++++++++++++++++++++----------
 2 files changed, 40 insertions(+), 10 deletions(-)

-- 
2.35.3

