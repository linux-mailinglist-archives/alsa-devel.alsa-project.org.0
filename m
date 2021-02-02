Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD9A30BFE2
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Feb 2021 14:46:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD8161753;
	Tue,  2 Feb 2021 14:45:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD8161753
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612273569;
	bh=8KebdTneO5/XgZfb3trB3qJdZJ+pMqP3wJSzZ9KM0yI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OKq9s5Sz/xvlowOKek2/PqP9ItNweETbtnTFIZWgbr8jyHuj3Z1LyGq7oi8tW3AZe
	 DzllYYtIuruA06ndW2aGwTgRNjvf+lFNtYDbeUzEf1xvzrQ6VbiJ2zJmk5qnuwnrFL
	 lEsxJWfDcBZqRwT0Fm0yWPWQrX2911r++WLEC36s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34E93F801F7;
	Tue,  2 Feb 2021 14:44:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6EB2DF80171; Tue,  2 Feb 2021 14:44:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from hellmouth.base.nu (hellmouth.base.nu [192.248.168.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 07AA8F800E1
 for <alsa-devel@alsa-project.org>; Tue,  2 Feb 2021 14:44:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07AA8F800E1
Received: from baphomet.hell (<unknown> [192.168.179.1])
 by hellmouth.base.nu (OpenSMTPD) with ESMTP id 1adfc2a4;
 Tue, 2 Feb 2021 13:44:29 +0000 (UTC)
Received: from baphomet.hell (localhost [127.0.0.1])
 by baphomet.hell (OpenSMTPD) with ESMTP id d4478c1c;
 Tue, 2 Feb 2021 13:42:57 +0000 (GMT)
Received: from localhost.localdomain ([192.168.178.2])
 by baphomet.hell with ESMTPSA id a9LhLt9WGWC6IgAAnQSWfg
 (envelope-from <livvy@base.nu>); Tue, 02 Feb 2021 13:42:50 +0000
From: Olivia Mackintosh <livvy@base.nu>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 0/2] ALSA: usb-audio: Add Pioneer DJM-450 support
Date: Tue,  2 Feb 2021 13:42:24 +0000
Message-Id: <20210202134225.3217-1-livvy@base.nu>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Olivia Mackintosh <livvy@base.nu>
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

Re-roll of this patchset to fix the following:
	1. Missing 'Signed-of-by:' line
	2. Spaces around operators
	3. Test that I'm threading submissions correctly

Apologies for the clumsiness on my part.

Olivia

Olivia Mackintosh (2):
  ALSA: usb-audio: Add DJM450 to Pioneer format quirk
  ALSA: usb-audio: Add DJM-450 to the quirks table

 sound/usb/quirks-table.h | 57 ++++++++++++++++++++++++++++++++++++++++
 sound/usb/quirks.c       | 20 ++++++++++++++
 2 files changed, 77 insertions(+)

-- 
2.30.0

