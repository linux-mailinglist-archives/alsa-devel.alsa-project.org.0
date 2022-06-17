Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 135E054F960
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jun 2022 16:42:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A77181F1C;
	Fri, 17 Jun 2022 16:41:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A77181F1C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655476921;
	bh=lFM+2XtqsneTZUw86cqqYScAS5RRp/8RcVfijttbRJA=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=c1roL158wfNDck9Nvx1zoxtBO2I5LZ7pO0WEjTFY2KSc4i975LgZqKrkcIAoXeZRQ
	 YClBpkIii4lfoLiqDWHYFTDZukGrGviJn3pTaVepkY3odQhaWRNo4GmXtV9LujBHzk
	 jcFrTX8EKhtkXessc0D3ux6qY8ZQtfFxTuNDo9LU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2565CF8052E;
	Fri, 17 Jun 2022 16:41:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1EA7EF80529; Fri, 17 Jun 2022 16:40:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7157F804BC
 for <alsa-devel@alsa-project.org>; Fri, 17 Jun 2022 16:40:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7157F804BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="2R1mtCzW"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="qFTENe8H"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7D6AB21D3B;
 Fri, 17 Jun 2022 14:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1655476855; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=vtZdOP7JpuBTxiFwOTKIu97MTlORDOzM3Lik64dB0KQ=;
 b=2R1mtCzWRjREaegiCzCJJDQvCPbt+JNF1n3VfzJ3K9RP/IuXbZ5AsDAYcU6WG4B9f5cSLw
 6BoSp/ik+cbk4ik5sa6RtBJy9APrMgMdpxgfRBX7mL30vAoI9IFgFltU6ZZOuUQ9LKnHuf
 pxOiriPniqP2d0scgy59kKKlLxbco+A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1655476855;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=vtZdOP7JpuBTxiFwOTKIu97MTlORDOzM3Lik64dB0KQ=;
 b=qFTENe8H4+8Z/0HkBFiwS3zLu55PlNAYiapbsJqDfGm07Vq4iQ4BNDqQ+/+GKK33cLIuAB
 4YGwWxDJUeCMioBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6202B1348E;
 Fri, 17 Jun 2022 14:40:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id vV8vF3eSrGIYNQAAMHmgww
 (envelope-from <tiwai@suse.de>); Fri, 17 Jun 2022 14:40:55 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/5] ALSA: rawmidi: Make code robust for external calls
Date: Fri, 17 Jun 2022 16:40:46 +0200
Message-Id: <20220617144051.18985-1-tiwai@suse.de>
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

here is a small patch set for ALSA core rawmidi code to make the code
a bit more robust, especially for the case where the exported
functions get called from the external drivers.  Currently most of
those functions assume naively that they aren't called at a wrong
timing.  With the patch set, it tries to harden a bit not to hit
serious breakage.


Takashi

===

Takashi Iwai (5):
  ALSA: rawmidi: Make internal functions local static
  ALSA: rawmidi: Move lock to snd_rawmidi_substream
  ALSA: rawmidi: Take open_mutex around parameter changes
  ALSA: rawmidi: Check stream state at exported functions
  ALSA: rawmidi: Take buffer refcount while draining output

 include/sound/rawmidi.h |   6 +-
 sound/core/rawmidi.c    | 274 +++++++++++++++++++++++++---------------
 2 files changed, 170 insertions(+), 110 deletions(-)

-- 
2.35.3

