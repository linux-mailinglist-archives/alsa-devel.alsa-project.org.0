Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4893E40C4
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Aug 2021 09:21:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDA0F1687;
	Mon,  9 Aug 2021 09:20:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDA0F1687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628493659;
	bh=rodwL1eaNRDDZu2z/cS6wnwjlfoqf0qWWhCGohfFANc=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lG8fL64BapABRNzmrLOYJduGczWV8FrohKmMtESTqJW6QfdtOorYZf/4yOHfXeJ01
	 oSkamXl7kEgGCa5gPh6E3nCaLMHijCN5wIomAN9OpfqyI5Mv/E9rCukSDGi9lmNEqy
	 2kmcMUl59qVAhI1GgTuow+HagfTPF1NP+A75LqOs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04B46F804E1;
	Mon,  9 Aug 2021 09:19:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3891F804E2; Mon,  9 Aug 2021 09:19:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41FB0F800C8
 for <alsa-devel@alsa-project.org>; Mon,  9 Aug 2021 09:18:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41FB0F800C8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="F7Fg9r7f"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="CgIgq366"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id B33AD1FD96
 for <alsa-devel@alsa-project.org>; Mon,  9 Aug 2021 07:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1628493510; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=KBRIBjj9uJlH18zN8F41JVv0TcezVk/2ptOAXR35+pw=;
 b=F7Fg9r7fRlQKB/8QHQJDDWBQbClXiipNXA+Qt8ZHK2kIO9I/mN123SiUjHELRcBIcbBlFC
 Z/2rLgG6UOQZR7UDN1CiGOTYwJeQkJEtR42JvGl5KCR5na3RuCkiyZacQsPkD75cPiMsgE
 WkoQZSyBuEZwkJmWl2BTe5rYhZkthOA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1628493510;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=KBRIBjj9uJlH18zN8F41JVv0TcezVk/2ptOAXR35+pw=;
 b=CgIgq366OT2qPE+DZ8DwSysE/QISjp3KzRdqerAWVrMpfkm6TDVyRZPrG/jU573maGM3Nc
 aTxDuqsBkv9WItBg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id A267FA3B81;
 Mon,  9 Aug 2021 07:18:30 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/3] ALSA: pcm: More mmap coverages
Date: Mon,  9 Aug 2021 09:18:26 +0200
Message-Id: <20210809071829.22238-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi,

the recent regression fix enlightened the potentially missing pieces
in a couple of drivers for mmap on non-x86 architectures.  This patch
series tries to cover those.


Takashi

===

Takashi Iwai (3):
  ALSA: pcm: Check mmap capability of runtime dma buffer at first
  ALSA: pci: rme: Set up buffer type properly
  ALSA: pci: cs46xx: Fix set up buffer type properly

 sound/core/pcm_native.c       |  9 +++++++--
 sound/pci/cs46xx/cs46xx_lib.c | 30 ++++++++----------------------
 sound/pci/rme9652/hdsp.c      |  6 ++----
 sound/pci/rme9652/rme9652.c   |  6 ++----
 4 files changed, 19 insertions(+), 32 deletions(-)

-- 
2.26.2

