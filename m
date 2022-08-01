Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A62C586F43
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Aug 2022 19:06:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D84461622;
	Mon,  1 Aug 2022 19:05:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D84461622
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659373580;
	bh=Uo2LarJgcRxMyywBPq3QZOMxIPZ1N3xGnOd6Uz1oWso=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=O/Jkx5lpxQtsQ5lMNjVphHesaLgxqLl72qk8mOCYKJqP3NRKTcJIFapi8An0emDEa
	 LACahq+P0pY5+0W2aRm1tpB7gEd+mhL/RK6w5vTJ9rmu7dUOw3skVRKAcSbwiiiG06
	 WSbq2hBsgai5nTq8YdPK3bjcv6x9wq5jdhsAXx/M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68723F80246;
	Mon,  1 Aug 2022 19:05:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 634D2F8023B; Mon,  1 Aug 2022 19:05:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82149F8014B
 for <alsa-devel@alsa-project.org>; Mon,  1 Aug 2022 19:05:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82149F8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="MlP/QA71"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="J8iLdXPW"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E0E6633E75;
 Mon,  1 Aug 2022 17:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1659373515; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=j7k5WjULvgQS6YE+/h1lvN6IpP7jBtpoDLkaOLubwgk=;
 b=MlP/QA71p+7QSqtmZn3Bvuj4G6EFPac+aQvct2gIgBnGRaT2SUF/2oAQ8yCjaO6QzsfN2H
 VI23/L4et8tZdl/TX9AerFI5D2Cl6QdkQlgbvWCB/+mPEIfxQWlSXF+KxdwRrbXFS8bB+l
 eEiqs2qfGSvZJM9cR9amd83inc+bY7c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1659373515;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=j7k5WjULvgQS6YE+/h1lvN6IpP7jBtpoDLkaOLubwgk=;
 b=J8iLdXPWKPvuWyGC0IJNrZZO7rYg0S+KkLfPKkB8Hh4X5cvGr1hXpHfFRMhni8b29j/kaf
 W1mpi1fZWBFQtrBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A33C513AAE;
 Mon,  1 Aug 2022 17:05:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id FiywJssH6GICHgAAMHmgww
 (envelope-from <tiwai@suse.de>); Mon, 01 Aug 2022 17:05:15 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH resent] ASoC: DPCM: Don't pick up BE without substream
Date: Mon,  1 Aug 2022 19:05:10 +0200
Message-Id: <20220801170510.26582-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

When DPCM tries to add valid BE connections at dpcm_add_paths(), it
doesn't check whether the picked BE actually supports for the given
stream direction.  Due to that, when an asymmetric BE stream is
present, it picks up wrongly and this may result in a NULL dereference
at a later point where the code assumes the existence of a
corresponding BE substream.

This patch adds the check for the presence of the substream for the
target BE for avoiding the problem above.

Note that we have already some fix for non-existing BE substream at
commit 6246f283d5e0 ("ASoC: dpcm: skip missing substream while
applying symmetry").  But the code path we've hit recently is rather
happening before the previous fix.  So this patch tries to fix at
picking up a BE instead of parsing BE lists.

Fixes: bbf7d3b1c4f4 ("ASoC: soc-pcm: align BE 'atomicity' with that of the FE")
Reported-by: Alex Natalsson <harmoniesworlds@gmail.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Link: https://lore.kernel.org/r/CADs9LoPZH_D+eJ9qjTxSLE5jGyhKsjMN7g2NighZ16biVxsyKw@mail.gmail.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---

Seems that the previous submission was overlooked since I forgot to
put Cc to Mark.  Resubmitted...

 sound/soc/soc-pcm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index a827cc3c158a..0c1de5624842 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1318,6 +1318,9 @@ static struct snd_soc_pcm_runtime *dpcm_get_be(struct snd_soc_card *card,
 		if (!be->dai_link->no_pcm)
 			continue;
 
+		if (!snd_soc_dpcm_get_substream(be, stream))
+			continue;
+
 		for_each_rtd_dais(be, i, dai) {
 			w = snd_soc_dai_get_widget(dai, stream);
 
-- 
2.35.3

