Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CE56D9823
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Apr 2023 15:26:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9264E7B;
	Thu,  6 Apr 2023 15:25:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9264E7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680787601;
	bh=sFtzOzpSwAGApuX8oia7T2QVZCGijJf4h3jM+2rNtfg=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=pudknZM5xQ+tRmiVvKuucFj81/FjQqACHMF0lwl6FYG8f1W4Kds9hr90j7sOhTKMr
	 lKD4R8DEAe57/+bK7hQxIxHCBb6G6Qi2kPlBuWWyafwYF/yvDcrmkDfB3B/TDME/yP
	 U943r9imBFT0jFaHjYl9vvyI6Q6ddlBMYwbOxA7s=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0EBC5F8052E;
	Thu,  6 Apr 2023 15:25:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC0E3F80533; Thu,  6 Apr 2023 15:25:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 37609F80524
	for <alsa-devel@alsa-project.org>; Thu,  6 Apr 2023 15:25:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37609F80524
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id ECCAB2418A
	for <alsa-devel@alsa-project.org>; Thu,  6 Apr 2023 09:25:21 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pkPc9-Rr2-00
	for <alsa-devel@alsa-project.org>; Thu, 06 Apr 2023 15:25:21 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2] ALSA: document that struct __snd_pcm_mmap_control64 is
 messed up
Date: Thu,  6 Apr 2023 15:25:21 +0200
Message-Id: <20230406132521.2252019-1-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: M7EMORH22C46TKS7I5ZDV2CF4A3C3IWD
X-Message-ID-Hash: M7EMORH22C46TKS7I5ZDV2CF4A3C3IWD
X-MailFrom: ossi@kde.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M7EMORH22C46TKS7I5ZDV2CF4A3C3IWD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

I'm not the first one to run into this, see e.g.
https://lore.kernel.org/all/29QBMJU8DE71E.2YZSH8IHT5HMH@mforney.org/

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 include/uapi/sound/asound.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
index de6810e94abe..7eecc99ddef7 100644
--- a/include/uapi/sound/asound.h
+++ b/include/uapi/sound/asound.h
@@ -570,7 +570,8 @@ struct __snd_pcm_mmap_status64 {
 struct __snd_pcm_mmap_control64 {
 	__pad_before_uframe __pad1;
 	snd_pcm_uframes_t appl_ptr;	 /* RW: appl ptr (0...boundary-1) */
-	__pad_before_uframe __pad2;
+	__pad_before_uframe __pad2;	 // This should be __pad_after_uframe, but binary
+					 // backwards compatibility constraints prevent a fix.
 
 	__pad_before_uframe __pad3;
 	snd_pcm_uframes_t  avail_min;	 /* RW: min available frames for wakeup */
-- 
2.40.0.152.g15d061e6df

