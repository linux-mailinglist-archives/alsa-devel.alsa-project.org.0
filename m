Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD141186769
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Mar 2020 10:06:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 573B318B5;
	Mon, 16 Mar 2020 10:06:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 573B318B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584349614;
	bh=K7JHcllETSF0PNuTzDIttijSNxY58x/PN9W+Jzt9ZYw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VElrusI4t198AO3rqF4lJK2mABmcCf3HVsaa5VY3cnz9HfihHByx+X3ulmYFhgo9T
	 Khgyg561ySwyQRubb95yH5bzE4gZltQWsoCa1+5gJZ627mw/u9h/DdMKG1Hi5/EjiD
	 pmishJL4YbSwGmklHvFHNEjCV6qNaTj91KAza6QQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37615F801DB;
	Mon, 16 Mar 2020 10:05:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12707F801DB; Mon, 16 Mar 2020 10:05:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64DBCF800CD
 for <alsa-devel@alsa-project.org>; Mon, 16 Mar 2020 10:05:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64DBCF800CD
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 19E61AE84;
 Mon, 16 Mar 2020 09:05:08 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/2] ALSA: seq: virmidi: Fix running status after receiving
 sysex
Date: Mon, 16 Mar 2020 10:05:05 +0100
Message-Id: <20200316090506.23966-2-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200316090506.23966-1-tiwai@suse.de>
References: <20200316090506.23966-1-tiwai@suse.de>
Cc: Andreas Steinmetz <ast@domdv.de>
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

The virmidi driver handles sysex event exceptionally in a short-cut
snd_seq_dump_var_event() call, but this missed the reset of the
running status.  As a result, it may lead to an incomplete command
right after the sysex when an event with the same running status was
queued.

Fix it by clearing the running status properly via alling
snd_midi_event_reset_decode() for that code path.

Reported-by: Andreas Steinmetz <ast@domdv.de>
Cc: <stable@vger.kernel.org>
Link: https://lore.kernel.org/r/3b4a4e0f232b7afbaf0a843f63d0e538e3029bfd.camel@domdv.de
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_virmidi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/core/seq/seq_virmidi.c b/sound/core/seq/seq_virmidi.c
index 626d87c1539b..77d7037d1476 100644
--- a/sound/core/seq/seq_virmidi.c
+++ b/sound/core/seq/seq_virmidi.c
@@ -81,6 +81,7 @@ static int snd_virmidi_dev_receive_event(struct snd_virmidi_dev *rdev,
 			if ((ev->flags & SNDRV_SEQ_EVENT_LENGTH_MASK) != SNDRV_SEQ_EVENT_LENGTH_VARIABLE)
 				continue;
 			snd_seq_dump_var_event(ev, (snd_seq_dump_func_t)snd_rawmidi_receive, vmidi->substream);
+			snd_midi_event_reset_decode(vmidi->parser);
 		} else {
 			len = snd_midi_event_decode(vmidi->parser, msg, sizeof(msg), ev);
 			if (len > 0)
-- 
2.16.4

