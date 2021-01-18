Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 752512F9AE2
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Jan 2021 09:00:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1149B17BA;
	Mon, 18 Jan 2021 08:59:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1149B17BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610956803;
	bh=+wJlwOAAlNTxZ0D9Z3UZmvB0g1wIluPO3GBD9kA8Kos=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RiQeoyieWZVSQu6htVvOVbcciM+JB1fbtpxValJPuWK6PZFAVVIWiSnPmgwBaklO5
	 WIi2nOej527RU9IlY9Squ9slxV3v+1xjZ6591/pKqrMdgG95ziapkKc0tLWfOAdpcQ
	 C89Cuz4/amBeO9DkSYs+yOyJ7OlxF+2MXJp21jA8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7B3DF80218;
	Mon, 18 Jan 2021 08:58:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4252AF80227; Mon, 18 Jan 2021 08:58:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D629F8016E
 for <alsa-devel@alsa-project.org>; Mon, 18 Jan 2021 08:58:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D629F8016E
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 740C3AB7A;
 Mon, 18 Jan 2021 07:58:19 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/3] ALSA: usb-audio: Yet more fixes for Pioneer devices
Date: Mon, 18 Jan 2021 08:58:13 +0100
Message-Id: <20210118075816.25068-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: =?UTF-8?q?Franti=C5=A1ek=20Ku=C4=8Dera?= <konference@frantovo.cz>,
 Geraldo <geraldogabriel@gmail.com>
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

the Pioneer UAC1 devices still didn't work with the recent changes,
and after debugging sessions, a few issues were discovered.  Below are
the patches to cover those errors.


Takashi

===

Takashi Iwai (3):
  ALSA: usb-audio: Fix UAC1 rate setup for secondary endpoints
  ALSA: usb-audio: Set sample rate for all sharing EPs on UAC1
  ALSA: usb-audio: Avoid implicit feedback on Pioneer devices

 sound/usb/clock.c    | 21 ++++++---------------
 sound/usb/endpoint.c |  9 +++++++++
 sound/usb/implicit.c | 17 +++++++++--------
 sound/usb/quirks.c   | 28 ----------------------------
 4 files changed, 24 insertions(+), 51 deletions(-)

-- 
2.26.2

