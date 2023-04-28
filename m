Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E036F14EF
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Apr 2023 12:04:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9915E12A6;
	Fri, 28 Apr 2023 12:04:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9915E12A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682676298;
	bh=Cae39/E7r/oW9G5MrRJaNnjFL9qRivm/dOCRESOz2Ts=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZgZv0ypXAaw0uaa9ZpiFXgdH91VcVKD5e9MoKrK5n7+beu1my/4g2cxEz83DAG25/
	 rBNR4s0gGCua8WZF9hqQ4FJuQtCKdjqCGUMohDOV73ZGK8Yn5cT2ruT+3HXeQnEoem
	 CTwmkhxGnHn2w82wliyZ9wcu6Oio2WJdX6YkERog=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 483E8F8042F;
	Fri, 28 Apr 2023 12:03:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53874F8025E; Fri, 28 Apr 2023 12:03:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6A277F800AC
	for <alsa-devel@alsa-project.org>; Fri, 28 Apr 2023 11:59:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A277F800AC
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id DD11724269;
	Fri, 28 Apr 2023 05:59:41 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1psKtB-9tL-00; Fri, 28 Apr 2023 11:59:41 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 5/6] ALSA: core: update comment on snd_card.controls_rwsem
Date: Fri, 28 Apr 2023 11:59:40 +0200
Message-Id: <20230428095941.1706278-6-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230428095941.1706278-1-oswald.buddenhagen@gmx.de>
References: <20230428095941.1706278-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SEMNKIWEY7SMZWBV262MNZKHD766CGSB
X-Message-ID-Hash: SEMNKIWEY7SMZWBV262MNZKHD766CGSB
X-MailFrom: ossi@kde.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Takashi Iwai <tiwai@suse.de>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SEMNKIWEY7SMZWBV262MNZKHD766CGSB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Since commit 5bbb1ab5bd ("control: use counting semaphore as write lock
for ELEM_WRITE operation"), this has been locking the controls including
their values, not just the list of controls.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 include/sound/core.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sound/core.h b/include/sound/core.h
index 3edc4ab08774..4ea5f66b59d7 100644
--- a/include/sound/core.h
+++ b/include/sound/core.h
@@ -98,7 +98,7 @@ struct snd_card {
 
 	struct device ctl_dev;		/* control device */
 	unsigned int last_numid;	/* last used numeric ID */
-	struct rw_semaphore controls_rwsem;	/* controls list lock */
+	struct rw_semaphore controls_rwsem;	/* controls lock (list and values) */
 	rwlock_t ctl_files_rwlock;	/* ctl_files list lock */
 	int controls_count;		/* count of all controls */
 	size_t user_ctl_alloc_size;	// current memory allocation by user controls.
-- 
2.40.0.152.g15d061e6df

