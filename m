Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB316C6006
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 07:53:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC709EC6;
	Thu, 23 Mar 2023 07:52:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC709EC6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679554419;
	bh=z8f7CIFGQMwt6qOGQrdL0LHO+pMChyKJW7Omth7/xN8=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=acQzMelCEiO0xCNLluUEKuqVqvjHvqcuOuAJ17fk3kKPxv8XKPUXduDVx0lzdSjCL
	 AARikOm648PPriPOrox6q70ryC6N6g09GhLpP8stqnUpWYBkfH52ncVKbnltyJrtuK
	 krorZQINackEp2gRWr/+sCqIB+hOn/OQu//au5Pw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E5351F8027B;
	Thu, 23 Mar 2023 07:52:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4673AF804B1; Thu, 23 Mar 2023 07:52:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6FC2EF80093
	for <alsa-devel@alsa-project.org>; Thu, 23 Mar 2023 07:52:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6FC2EF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=t3jW/3Ej;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=ewR/LcgA
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E5243343D6;
	Thu, 23 Mar 2023 06:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1679554359; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=jRGacNTiET8nizH2FLH1O6FoKyLFYOUv/4r48pM33p4=;
	b=t3jW/3EjiI4rNLwr4lR5OMQsfxhAkoLVBZwiUfh6rXBLLDQoBZ4oFqF5u9sVlzbRdVwgDl
	TzF3Oe9dl/PpawxNlzMVgbl7OPN4qu1hn51gB5ke5HSCckEhiKDn0kOYvWtazX5kMSIbJR
	KaTaF0cZuratedGhDNR3iIL5xT0orIs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1679554359;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=jRGacNTiET8nizH2FLH1O6FoKyLFYOUv/4r48pM33p4=;
	b=ewR/LcgAv2U9PiWKvkl/GLJh5yom66LYdhnMd66kfX4U0T6g53QZm+LwjDvkPcZHLE5n5V
	NBFDIRDMzEYVhnBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C2F8E13596;
	Thu, 23 Mar 2023 06:52:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 0jvPLjf3G2QJcQAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 23 Mar 2023 06:52:39 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/3] ALSA: More PCM and documentation updates
Date: Thu, 23 Mar 2023 07:52:34 +0100
Message-Id: <20230323065237.5062-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NO6ADPVLLELJYG7D67SANTGITSGLL6J7
X-Message-ID-Hash: NO6ADPVLLELJYG7D67SANTGITSGLL6J7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NO6ADPVLLELJYG7D67SANTGITSGLL6J7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

this is a patch set following my change to the PCM core for adding
the -EPIPE handling to ack ops.


Takashi

===

Takashi Iwai (3):
  ALSA: pcm: Improved XRUN handling for indirect PCM helpers
  ALSA: docs: Add description about ack callback -EPIPE error handling
  ALSA: docs: A few more words for PCM XRUN handling and stream locks

 .../kernel-api/writing-an-alsa-driver.rst     | 22 +++++++++++++++++--
 include/sound/pcm-indirect.h                  | 22 ++++++++++++++-----
 2 files changed, 36 insertions(+), 8 deletions(-)

-- 
2.35.3

