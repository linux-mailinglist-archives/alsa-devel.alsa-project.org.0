Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BF66D9A5D
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Apr 2023 16:31:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3174EEC7;
	Thu,  6 Apr 2023 16:31:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3174EEC7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680791512;
	bh=CWvDPF4gZ0FTBGLwOtryBJByqkKokawWcU5SBdS/wok=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ViOfy7gcRaVJYN6+0khVfvUajhQBLamZAcdA2X5suBYyvGBBe+G7DTR0MVyeYJUQs
	 xiZbTDe6nOqfVaIFwF3gZMrp2wMNHBQOFtEn1EHxpyCCF/Fnjr+FBPrU3oprUq2g3v
	 mptsbUNBQGQ/NBFHuZjDoutyu+4cpNprwhNK1P1s=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AE14DF805D9;
	Thu,  6 Apr 2023 16:26:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06428F8052E; Thu,  6 Apr 2023 15:29:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=RCVD_IN_DNSWL_HI,RDNS_NONE,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from hust.edu.cn (unknown [202.114.0.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5D698F80529
	for <alsa-devel@alsa-project.org>; Thu,  6 Apr 2023 15:28:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D698F80529
Received: from ubuntu.localdomain ([120.202.201.62])
	(user=xubiang@hust.edu.cn mech=LOGIN bits=0)
	by mx1.hust.edu.cn  with ESMTP id 336DSdf0008114-336DSdf1008114
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
	Thu, 6 Apr 2023 21:28:44 +0800
From: Xu Biang <xubiang@hust.edu.cn>
To: Clemens Ladisch <clemens@ladisch.de>,
        Takashi Sakamoto <o-takashi@sakamocchi.jp>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ALSA: firewire-tascam: add missing unwind goto in
 snd_tscm_stream_start_duplex()
Date: Thu,  6 Apr 2023 06:28:01 -0700
Message-Id: <20230406132801.105108-1-xubiang@hust.edu.cn>
X-Mailer: git-send-email 2.17.1
X-FEAS-AUTH-USER: xubiang@hust.edu.cn
X-MailFrom: xubiang@hust.edu.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: N26AZFMZGQNPJYKUDGVGZGJRTKVLYH3P
X-Message-ID-Hash: N26AZFMZGQNPJYKUDGVGZGJRTKVLYH3P
X-Mailman-Approved-At: Thu, 06 Apr 2023 14:26:36 +0000
CC: dzm91@hust.edu.cn, error27@gmail.com,
 hust-os-kernel-patches@googlegroups.com, Xu Biang <xubiang@hust.edu.cn>,
 Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N26AZFMZGQNPJYKUDGVGZGJRTKVLYH3P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Smatch Warns:
sound/firewire/tascam/tascam-stream.c:493 snd_tscm_stream_start_duplex()
warn: missing unwind goto?

The direct return will cause the stream list of "&tscm->domain" unemptied
and the session in "tscm" unfinished if amdtp_domain_start() returns with
an error.

Fix this by changing the direct return to a goto which will empty the
stream list of "&tscm->domain" and finish the session in "tscm".

The snd_tscm_stream_start_duplex() function is called in the prepare
callback of PCM. According to "ALSA Kernel API Documentation", the prepare
callback of PCM will be called many times at each setup. So, if the
"&d->streams" list is not emptied, when the prepare callback is called
next time, snd_tscm_stream_start_duplex() will receive -EBUSY from
amdtp_domain_add_stream() that tries to add an existing stream to the
domain. The error handling code after the "error" label will be executed
in this case, and the "&d->streams" list will be emptied. So not emptying
the "&d->streams" list will not cause an issue. But it is more efficient
and readable to empty it on the first error by changing the direct return
to a goto statement.

The session in "tscm" has been begun before amdtp_domain_start(), so it
needs to be finished when amdtp_domain_start() fails.

Fixes: c281d46a51e3 ("ALSA: firewire-tascam: support AMDTP domain")
Signed-off-by: Xu Biang <xubiang@hust.edu.cn>
Reviewed-by: Dan Carpenter <error27@gmail.com>
---
Note that this finding is from static analysis and not tested.

 sound/firewire/tascam/tascam-stream.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/firewire/tascam/tascam-stream.c b/sound/firewire/tascam/tascam-stream.c
index 53e094cc411f..dfe783d01d7d 100644
--- a/sound/firewire/tascam/tascam-stream.c
+++ b/sound/firewire/tascam/tascam-stream.c
@@ -490,7 +490,7 @@ int snd_tscm_stream_start_duplex(struct snd_tscm *tscm, unsigned int rate)
 		// packet is important for media clock recovery.
 		err = amdtp_domain_start(&tscm->domain, tx_init_skip_cycles, true, true);
 		if (err < 0)
-			return err;
+			goto error;
 
 		if (!amdtp_domain_wait_ready(&tscm->domain, READY_TIMEOUT_MS)) {
 			err = -ETIMEDOUT;
-- 
2.17.1

