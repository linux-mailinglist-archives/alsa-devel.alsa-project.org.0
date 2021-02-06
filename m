Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3642C311FF1
	for <lists+alsa-devel@lfdr.de>; Sat,  6 Feb 2021 21:33:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CE7C850;
	Sat,  6 Feb 2021 21:33:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CE7C850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612643632;
	bh=OgLHQDxEjuZ0S/Tq2esdJQRcD/VrQ683nxs77luqyhs=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=afTRtJpyeYkYNn7UGrxF708CSNAmgIGNC1ygqZ5m0TlQdsNGOVuXTq1v3P0OC/zCJ
	 1xbEa7oKWrt9Z5SMQs4ZrDaWHdipOkj5KihfXdj2rK2ipSgWonXBfsglRqt+ScE6h9
	 SER7TLnHFxCAO0yfBLg/vGwOFlbh10OSAIwxaVc0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FD64F80264;
	Sat,  6 Feb 2021 21:31:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C10BF80171; Sat,  6 Feb 2021 21:31:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2EEE8F80139
 for <alsa-devel@alsa-project.org>; Sat,  6 Feb 2021 21:30:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2EEE8F80139
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BDBDFABD5
 for <alsa-devel@alsa-project.org>; Sat,  6 Feb 2021 20:30:53 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/3] ALSA: a few more USB-audio fixes
Date: Sat,  6 Feb 2021 21:30:49 +0100
Message-Id: <20210206203052.15606-1-tiwai@suse.de>
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

here is a small patch set for USB-audio.  The goal of this patch set
is to cover a small race window at the endpoint state transition, and
the preparation for the upcoming patch set for PCM sync_stop fixes.


Takashi

===

Takashi Iwai (3):
  ALSA: usb-audio: Handle invalid running state at releasing EP
  ALSA: usb-audio: More strict state change in EP
  ALSA: usb-audio: Don't avoid stopping the stream at disconnection

 sound/usb/card.h     |  2 +-
 sound/usb/endpoint.c | 85 +++++++++++++++++++++++++-------------------
 sound/usb/pcm.c      |  5 +--
 3 files changed, 51 insertions(+), 41 deletions(-)

-- 
2.26.2

