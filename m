Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CB470498B
	for <lists+alsa-devel@lfdr.de>; Tue, 16 May 2023 11:41:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A0771E7;
	Tue, 16 May 2023 11:41:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A0771E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684230112;
	bh=KVWNJw1/kc+/sJF3rkbSWT6NHRnoMIJp3lr8NGyJdqE=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=K3AFBxssfdd7BDtD1Sb891PwWBnDcMcFvcbfyyxBsLFBpRf1TkNaZ3oLbl1ZR1r2r
	 nCJECeUSwUDTAlU5dCyGbnwNcArSBoN7IFbNGv5PgY0/JqY1iIRrwZHmIBhxz5Qltw
	 Q44m2aFC931xHt7wAaPW5jcR04s6/mMUweBWfucQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94106F80542; Tue, 16 May 2023 11:37:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0344CF80544;
	Tue, 16 May 2023 11:37:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 911BCF8059F; Tue, 16 May 2023 11:37:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org
 [IPv6:2001:470:142:8::100])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DDB6AF80542
	for <alsa-devel@alsa-project.org>; Tue, 16 May 2023 11:36:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDB6AF80542
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 1579224293;
	Tue, 16 May 2023 05:36:13 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pyr6K-q0l-00; Tue, 16 May 2023 11:36:12 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 00/10] ALSA: emu10k1: improvements mostly to the I/O routing
 mixers for E-MU cards
Date: Tue, 16 May 2023 11:36:02 +0200
Message-Id: <20230516093612.3536508-1-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WOH6YKFRTYNPYZPCW6NLX2ZFF2NMBZI7
X-Message-ID-Hash: WOH6YKFRTYNPYZPCW6NLX2ZFF2NMBZI7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WOH6YKFRTYNPYZPCW6NLX2ZFF2NMBZI7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Oswald Buddenhagen (10):
  ALSA: emu10k1: make some initializer arrays less wasteful
  ALSA: emu10k1: compactize E-MU routing source arrays
  ALSA: emu10k1: make mixer control mass creation less wasteful
  ALSA: emu10k1: un-hardcode E-MU mixer control callbacks somewhat
  ALSA: emu10k1: fix return value of snd_emu1010_dac_pads_put()
  ALSA: emu10k1: make E-MU I/O routing init data-driven
  ALSA: emu10k1: make E-MU mixer control creation more data-driven
  ALSA: emu10k1: improve mixer controls for E-MU 1010 rev2 card
  ALSA: emu10k1: add explicit support for E-MU 0404
  ALSA: emu10k1: make struct snd_emu1010 less wasteful

 include/sound/emu10k1.h          |   47 +-
 sound/pci/emu10k1/emu10k1_main.c |  268 +------
 sound/pci/emu10k1/emumixer.c     | 1242 +++++++++++++++++-------------
 sound/pci/emu10k1/emuproc.c      |   18 +-
 4 files changed, 759 insertions(+), 816 deletions(-)

-- 
2.40.0.152.g15d061e6df

