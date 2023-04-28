Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C456F14E7
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Apr 2023 12:02:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 291C312B7;
	Fri, 28 Apr 2023 12:01:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 291C312B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682676129;
	bh=ks7xfQ9rRIqXMbRTqYsFyv30O1v8XGxdCI9VNaJ4Yjk=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=EMTVsQV6rnGctBu9JCyyRMPrNAe6kM56c4UF+3/5xI03EnPmOwP4cQ1c7TVMfPq7z
	 3iNhFHnjJU78Zl2HY8MRgY28w6Q3o6N4AZJaCXcpBAXNrG9fUmy7QJ0qlsF9A4tl06
	 PAHLZKIO9NHgm9kHNRe1aa/JSjipcRdPe6t0tHC4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 237B9F80553;
	Fri, 28 Apr 2023 12:00:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2BBE3F80548; Fri, 28 Apr 2023 12:00:14 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 92543F8052D
	for <alsa-devel@alsa-project.org>; Fri, 28 Apr 2023 11:59:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92543F8052D
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id C10E62420A;
	Fri, 28 Apr 2023 05:59:41 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1psKtB-9sr-00; Fri, 28 Apr 2023 11:59:41 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/6] ALSA: emu10k1: Various improvements related to locking
Date: Fri, 28 Apr 2023 11:59:35 +0200
Message-Id: <20230428095941.1706278-1-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: G3NEETTBJURVFKK4P25DZVHJJ57PPFJX
X-Message-ID-Hash: G3NEETTBJURVFKK4P25DZVHJJ57PPFJX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G3NEETTBJURVFKK4P25DZVHJJ57PPFJX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

---

This patch series needs to be applied on top of the patch titled "ALSA:
emu10k1: use more existing defines instead of open-coded numbers".

Oswald Buddenhagen (6):
  ALSA: emu10k1: remove pointless locks from timer code
  ALSA: emu10k1: remove pointless locks from /proc code
  ALSA: emu10k1: use the right lock in snd_emu10k1_shared_spdif_put()
  ALSA: emu10k1: fix locking in snd_emu1010_fpga_link_dst_src_write()
  ALSA: core: update comment on snd_card.controls_rwsem
  ALSA: emu10k1: remove now superfluous mixer locking

 include/sound/core.h         |  2 +-
 sound/pci/emu10k1/emufx.c    |  7 -------
 sound/pci/emu10k1/emumixer.c | 32 ++------------------------------
 sound/pci/emu10k1/emupcm.c   |  2 --
 sound/pci/emu10k1/emuproc.c  |  6 ------
 sound/pci/emu10k1/io.c       | 25 +++++++++++++++++--------
 sound/pci/emu10k1/timer.c    |  6 ------
 7 files changed, 20 insertions(+), 60 deletions(-)

-- 
2.40.0.152.g15d061e6df

