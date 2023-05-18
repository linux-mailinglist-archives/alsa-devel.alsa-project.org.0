Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF101708386
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 16:05:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1126C1FC;
	Thu, 18 May 2023 16:04:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1126C1FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684418749;
	bh=UuHx04hSE3nvvit+/BJGPN6bovsW2uIqsUMiqWF/WXo=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=el4vNpZUCpJ53tUgzqFpS0TgJSrKF84vaYZFGSqi3eZz25q0mtl3563VsSnQBD5vg
	 9fpDJUeonKjryExpVAoO/ocYjYyJsDRPoz3wE2FGE7EZoWJQrLZmy/2v+Y3/PY/smc
	 MR4hsvbzp1KThaQYh8Y7HzMpdky5/UY08rTzGhW4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4893AF80580; Thu, 18 May 2023 16:04:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A78EDF80580;
	Thu, 18 May 2023 16:03:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 564E4F80570; Thu, 18 May 2023 16:03:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org
 [IPv6:2001:470:142:8::100])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EA108F80431
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 16:03:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA108F80431
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 8009223F20;
	Thu, 18 May 2023 10:03:39 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pzeEF-cKw-00; Thu, 18 May 2023 16:03:39 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 0/2] ALSA: emu10k1: various improvements to the DSP-based
 mixer code
Date: Thu, 18 May 2023 16:03:37 +0200
Message-Id: <20230518140339.3722279-1-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3WK6OFZ7DT55X72HIDSO6SGU2UJCRAFP
X-Message-ID-Hash: 3WK6OFZ7DT55X72HIDSO6SGU2UJCRAFP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3WK6OFZ7DT55X72HIDSO6SGU2UJCRAFP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Oswald Buddenhagen (2):
  ALSA: emu10k1: enable bit-exact playback, part 3: pitch
  ALSA: emu10k1: enable bit-exact playback, part 4: send amounts

 include/sound/emu10k1.h    |  2 ++
 sound/pci/emu10k1/emupcm.c | 34 ++++++++++++++++++++++++++++++----
 2 files changed, 32 insertions(+), 4 deletions(-)

-- 
2.40.0.152.g15d061e6df

