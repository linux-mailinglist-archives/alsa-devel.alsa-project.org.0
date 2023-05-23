Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8178470E646
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 22:10:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BB92843;
	Tue, 23 May 2023 22:09:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BB92843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684872640;
	bh=LSeTmt4D4HxqY7on+/B2lGzsdaKF6ymdlrTaLv1WD6k=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=LsFJXJivuDdWMffDqblnU4EDeMBwawQWnJsZAVUIxJ+nqG6VXwN5l+QVdL5Li2L2P
	 XkjFxz3vz07S5H4Ygn3YNKMSaFA+d2YC9YTQQ0/L/RNflvFkFvTB9puzZLzNH+BwCv
	 dknzJ3BTKehfvp+rzKQArcaUQKZFBTA8NVzN4POk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11EDAF80553; Tue, 23 May 2023 22:07:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 52281F805D6;
	Tue, 23 May 2023 22:07:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D936EF805B4; Tue, 23 May 2023 22:07:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org
 [IPv6:2001:470:142:8::100])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A6E24F80425
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 22:07:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6E24F80425
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 3E20F241F5;
	Tue, 23 May 2023 16:07:10 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1q1YHl-zPc-00; Tue, 23 May 2023 22:07:09 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 0/4] ALSA: emu10k1: capture-related improvements
Date: Tue, 23 May 2023 22:07:05 +0200
Message-Id: <20230523200709.236059-1-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6HLJ6QXNV5GSC55EZAGJSGYGTM3JNMFA
X-Message-ID-Hash: 6HLJ6QXNV5GSC55EZAGJSGYGTM3JNMFA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6HLJ6QXNV5GSC55EZAGJSGYGTM3JNMFA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Oswald Buddenhagen (4):
  ALSA: emu10k1: fix capture buffer size confusion
  ALSA: emu10k1: fix support for 24 kHz capture
  ALSA: emu10k1: don't restrict capture channel count to powers of two
  ALSA: emu10k1: fix multi-channel capture config for E-MU cards

 sound/pci/emu10k1/emupcm.c | 122 +++++++++++++++++++------------------
 1 file changed, 62 insertions(+), 60 deletions(-)

-- 
2.40.0.152.g15d061e6df

