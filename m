Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDE75EA7BE
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Sep 2022 15:57:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5037082C;
	Mon, 26 Sep 2022 15:57:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5037082C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664200676;
	bh=YYBWPLvo/VwIs/lw0RAzmn+t3Ya1eiu3Jkc8CLnAaV4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vgB5VofGWwUX4S6ne8Mckvru1y2r8XqRMDTPK+30VEuIMucputk3pqZIZVnYHWVH3
	 Sf3lzkFOHtHb1qAZfdv3ZOEeXD9y1fUJdCbrT91Bih1TYGb1fIBFZ1gAEtLs71F3ds
	 sErDgovXK14/2vpN3v6Xq2M4PeSkRPX1u4oDkoQw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56BA8F8055A;
	Mon, 26 Sep 2022 15:56:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7A1CF8053B; Mon, 26 Sep 2022 15:56:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ACB2CF80424
 for <alsa-devel@alsa-project.org>; Mon, 26 Sep 2022 15:56:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACB2CF80424
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="Lqjmq5Uc"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="4E2AXupy"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2B62B1F899;
 Mon, 26 Sep 2022 13:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1664200570; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=llDzVwvZPxmefr0CGC8YZJjqNlgLrJ2Iya8C7OcAWFI=;
 b=Lqjmq5UcgWoSjv/lflZbccDpEjmI3v9HlJ5M72IHaLL5JUIJDM+C8SBJnzmisb4cgRfUb8
 nMxCO3UgMath/ql9MttUH+oZ0ylMooOUmgWO1gW2dzUGZkIDl0+OCzlJEBg2TuBvTzOIcx
 2y7pRKepR1JvPGpwZCQvj4lWmTnSSzc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1664200570;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=llDzVwvZPxmefr0CGC8YZJjqNlgLrJ2Iya8C7OcAWFI=;
 b=4E2AXupyyKS7iTF4Vj0FY0COMFhqtVixUYbX4sJrLrrUz/0Pm45QLElKK6xRnacp9gEZOK
 xLMiIBsS/Dr2xAAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 06027139BD;
 Mon, 26 Sep 2022 13:56:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id aBXDAHqvMWPxegAAMHmgww
 (envelope-from <tiwai@suse.de>); Mon, 26 Sep 2022 13:56:10 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 02/11] ALSA: pcm: Make mmap status read-only
Date: Mon, 26 Sep 2022 15:55:49 +0200
Message-Id: <20220926135558.26580-3-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220926135558.26580-1-tiwai@suse.de>
References: <20220926135558.26580-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>
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

The mmap status record should be read-only.  Modifying it from
user-space may screw up things unexpectedly, so let's clear the write
bits at exposing it.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/pcm_native.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index d9485b1ab719..33769ca78cc8 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -3668,6 +3668,7 @@ static int snd_pcm_mmap_status(struct snd_pcm_substream *substream, struct file
 	area->vm_ops = &snd_pcm_vm_ops_status;
 	area->vm_private_data = substream;
 	area->vm_flags |= VM_DONTEXPAND | VM_DONTDUMP;
+	area->vm_flags &= ~(VM_WRITE | VM_MAYWRITE);
 	return 0;
 }
 
-- 
2.35.3

