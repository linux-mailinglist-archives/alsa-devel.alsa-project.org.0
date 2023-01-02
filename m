Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE7565B597
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Jan 2023 18:09:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FACBA323;
	Mon,  2 Jan 2023 18:08:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FACBA323
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672679350;
	bh=psyMVYItYUzp8y/djPNK+pe4pHP1hy42Uy8/1v6WnRM=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qVNYR5BOcGZuyC7R+ZtQWhnoOXD+8ob1DELHEwAmm1LRzvJ+Oy+0nNAswIBpCctmd
	 VVsCAJrHaskVyp/mRUR0ySAJhXTpXKjs5ZGCP0sRse9aNlZhGR0MOHUsgyOlcuC97w
	 peTHJnGKNkI+6EHKfgTr/cI1khU77il5veqCtExc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CBEE2F80240;
	Mon,  2 Jan 2023 18:08:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45674F8032D; Mon,  2 Jan 2023 18:08:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7DD2FF80238
 for <alsa-devel@alsa-project.org>; Mon,  2 Jan 2023 18:08:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DD2FF80238
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=QpcbhNak; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=XWTIImqv
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C21FA5C77D;
 Mon,  2 Jan 2023 17:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1672679286; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=mvhngejJzfexVLKA02m1eN9cGyfwiikmnB6xGwVydzo=;
 b=QpcbhNakOd9OWPDtvcGPgCG3qmmYLwBFqOwwKLxXC2+66rZZu/HptxyGURn4Rc23FnDN5+
 KrM9qK+nqVSNjuo5j28Sp0spltoeE5+1ryaWv+PznzKNMDqbcnx2yk+LkcFhKlfcloDPeN
 iD22vo6f4d4IDbOz4czvrDp0sTu5AmI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1672679286;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=mvhngejJzfexVLKA02m1eN9cGyfwiikmnB6xGwVydzo=;
 b=XWTIImqv3lKbxMydZb3xd0h0bZwN7Ox3LKvY7se8/FwGGMdz2zxUea+R15g6z32mIARHm7
 lBoxIli6tC/9ssDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A381813427;
 Mon,  2 Jan 2023 17:08:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Oyg6J3YPs2ODGAAAMHmgww
 (envelope-from <tiwai@suse.de>); Mon, 02 Jan 2023 17:08:06 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/3] ALSA: usb-audio: Fix a few implicit fb sync issues
Date: Mon,  2 Jan 2023 18:07:56 +0100
Message-Id: <20230102170759.29610-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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

this is a series of patches for addressing the remaining problem with
the implicit fb sync.  The first one is to cover the left over EP run
state at re-configuring PCM.  The second one is a workaround for a
regression with the hw constraints, and the last one is the
refactoring and fix for the multiple EPs assigned in the format list.


Takashi

===

Takashi Iwai (3):
  ALSA: usb-audio: Make sure to stop endpoints before closing EPs
  ALSA: usb-audio: Relax hw constraints for implicit fb sync
  ALSA: usb-audio: More refactoring of hw constraint rules

 sound/usb/pcm.c | 217 ++++++++++++++++++++++++++++++------------------
 1 file changed, 134 insertions(+), 83 deletions(-)

-- 
2.35.3

