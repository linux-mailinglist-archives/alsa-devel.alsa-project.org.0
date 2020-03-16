Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D89B518676E
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Mar 2020 10:07:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D49918BF;
	Mon, 16 Mar 2020 10:06:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D49918BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584349658;
	bh=QMUpo3JBQkgNd+U8L9kiuLyFxsod4iVHnQAD/oP3Iq8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=H3mmcwzBnIerP1NR/NjGwBDwiZHipghmtMCD/pAqq9zd2TJ1tH/W7TyiHxS+ARUZ6
	 fZvT7cR+CUq9s9y2FRDiSMN1nTDjWos+/IP2DfqGRb+3sm05uRzaT9Xk2R4j+3Vk9H
	 RaQhr0Y4adsQQDDNIiSGz8IF2cmdLFwio6qMY1cA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BE33F801F9;
	Mon, 16 Mar 2020 10:05:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D7B7F80162; Mon, 16 Mar 2020 10:05:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BF6AFF80058
 for <alsa-devel@alsa-project.org>; Mon, 16 Mar 2020 10:05:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF6AFF80058
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0C35DAC44;
 Mon, 16 Mar 2020 09:05:08 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/2] ALSA: seq: Fix running status after receiving sysex
Date: Mon, 16 Mar 2020 10:05:04 +0100
Message-Id: <20200316090506.23966-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Cc: Andreas Steinmetz <ast@domdv.de>
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

here are two small fixes for correcting the behavior of sequencer core
wrt the event decoding after receiving a sysex message.


Takashi

===

Takashi Iwai (2):
  ALSA: seq: virmidi: Fix running status after receiving sysex
  ALSA: seq: oss: Fix running status after receiving sysex

 sound/core/seq/oss/seq_oss_midi.c | 1 +
 sound/core/seq/seq_virmidi.c      | 1 +
 2 files changed, 2 insertions(+)

-- 
2.16.4

