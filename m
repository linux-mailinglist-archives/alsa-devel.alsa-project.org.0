Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4524271246A
	for <lists+alsa-devel@lfdr.de>; Fri, 26 May 2023 12:19:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E03A83E;
	Fri, 26 May 2023 12:18:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E03A83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685096364;
	bh=is9iqdGnFYokUrQg6z1zqIAOIFX4cSxtTRc4F+mlH5s=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=uDzucqL/X6JdI/SlDPLu3kSfWFvGYpeo3rZqRKYhQ+TS8+sK2kfbbj+Uf/p7LwnCy
	 rG0FbrU5dOKvCq7YQgQp10axwam1SJUfXNBkR/LrngaxzEWfAmtLo22GVHEaebCR/b
	 8Fk+EEdkLD3mw8VDwtNM49W7dsaUofAwi9DebeUM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 558AEF805AA; Fri, 26 May 2023 12:17:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C2937F80589;
	Fri, 26 May 2023 12:17:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C4C8F80568; Fri, 26 May 2023 12:17:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 60175F80548
	for <alsa-devel@alsa-project.org>; Fri, 26 May 2023 12:17:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60175F80548
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id BF13220010;
	Fri, 26 May 2023 06:16:59 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1q2UVH-pwG-00; Fri, 26 May 2023 12:16:59 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 0/6] ALSA: emu10k1: improvements related to the driver's
 procfs
Date: Fri, 26 May 2023 12:16:53 +0200
Message-Id: <20230526101659.437969-1-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LVNR2SNFFVLDJBLTQSZYBAMOLEWBQNJC
X-Message-ID-Hash: LVNR2SNFFVLDJBLTQSZYBAMOLEWBQNJC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LVNR2SNFFVLDJBLTQSZYBAMOLEWBQNJC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

FIXME: the last commit is still being tested; something appears fishy.

Oswald Buddenhagen (6):
  ALSA: emu10k1: hide absent 2nd pointer-offset register set from /proc
  ALSA: emu10k1: fix writing 1st pointer-offset register set through
    /proc
  ALSA: emu10k1: actually disassemble DSP instructions in /proc
  ALSA: emu10k1: include FX send amounts in /proc output
  ALSA: emu10k1: make E-MU FPGA register dump in /proc more useful
  ALSA: emu10k1: vastly improve usefulness of info in /proc

 include/sound/emu10k1.h     |  11 +
 sound/pci/emu10k1/emufx.c   |  87 ++++---
 sound/pci/emu10k1/emuproc.c | 440 ++++++++++++++++++++++--------------
 sound/pci/emu10k1/io.c      |  28 ++-
 4 files changed, 362 insertions(+), 204 deletions(-)

-- 
2.40.0.152.g15d061e6df

