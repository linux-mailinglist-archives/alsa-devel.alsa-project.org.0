Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F269D6D94E1
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Apr 2023 13:16:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8ACDD84B;
	Thu,  6 Apr 2023 13:16:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8ACDD84B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680779810;
	bh=DyDygsb+h99EtrpY3AtUcbxj+Be+lsF77AFe+UFGC1A=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=k78CxD4MOzPm6CmNwMslH0snShGhekNxsJoj4DlbswpIO1GMPGxKKtElgVQ5wSYIp
	 n6al3Wu8z+k05ZP4HbQPrZcLgflEqeoQQWUvJmeSWZ4MwdWT0sypNTZMxCodvxnf+8
	 UG28EtMydvZ46Ggi1ebdSvck5sTKnI5A30ZAoV/I=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D1C2EF80171;
	Thu,  6 Apr 2023 13:15:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85E33F80246; Thu,  6 Apr 2023 13:15:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EC350F80149
	for <alsa-devel@alsa-project.org>; Thu,  6 Apr 2023 13:15:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC350F80149
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 796FC24193
	for <alsa-devel@alsa-project.org>; Thu,  6 Apr 2023 07:15:45 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pkNaj-Owv-00
	for <alsa-devel@alsa-project.org>; Thu, 06 Apr 2023 13:15:45 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2] ALSA: document that struct __snd_pcm_mmap_control64 is
 messed up
Date: Thu,  6 Apr 2023 13:15:45 +0200
Message-Id: <20230406111545.2240797-1-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <87h6ttv4br.wl-tiwai@suse.de>
References: <87h6ttv4br.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6WPAPBQZQC3VXTOLQ5QMCD4LOKIQ5TP5
X-Message-ID-Hash: 6WPAPBQZQC3VXTOLQ5QMCD4LOKIQ5TP5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6WPAPBQZQC3VXTOLQ5QMCD4LOKIQ5TP5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Apr 06, 2023 at 09:48:40AM +0200, Takashi Iwai wrote:
>The "BUG:" suffix should be dropped.  This would catch eyes of (badly)
>trained kernel programmers as if it were a kernel panic message :)
>
done

>Also the term "binary compatibility" is ambiguous in this context --
>especially because we're dealing with the code that treats the
>32/64bit binary compatibility.
>
i wasn't sure what to make of that. how about this:

-- >8 --

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

