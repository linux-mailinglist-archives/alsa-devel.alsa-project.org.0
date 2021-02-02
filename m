Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEAC430B3C8
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Feb 2021 01:04:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59E321731;
	Tue,  2 Feb 2021 01:03:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59E321731
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612224248;
	bh=KtkeQEH5WnpdsI8/Ie9vUZu6GdeaueYsLnJHY2/7b6A=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qgFCITIlSJnvyz9ecQQ3oU+m/FpY0VT+C5kMoWAmey4VBg/OqbVuaRiEY2JrXw2Ti
	 x46bd9S8XLLbCGshLq+RKyZLbic2POjOBKh0dgAUcgBj86k0ZhHfcLQ6mQGwQHlehz
	 pQjfpipQY3QDUJFE6oWj6BywgXug99BGtFuVQVfs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE050F80154;
	Tue,  2 Feb 2021 01:02:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99C10F80153; Tue,  2 Feb 2021 01:02:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from hellmouth.base.nu (hellmouth.base.nu [192.248.168.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E354F80151
 for <alsa-devel@alsa-project.org>; Tue,  2 Feb 2021 01:02:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E354F80151
Received: from baphomet.hell (<unknown> [192.168.179.1])
 by hellmouth.base.nu (OpenSMTPD) with ESMTP id 28437bb8;
 Tue, 2 Feb 2021 00:02:26 +0000 (UTC)
Received: from baphomet.hell (localhost [127.0.0.1])
 by baphomet.hell (OpenSMTPD) with ESMTP id fb26d32b;
 Tue, 2 Feb 2021 00:02:12 +0000 (GMT)
Received: from base.nu ([192.168.178.2]) by baphomet.hell with ESMTPSA
 id t2s2KXOWGGA7QgEAnQSWfg
 (envelope-from <livvy@base.nu>); Tue, 02 Feb 2021 00:01:47 +0000
Date: Tue, 2 Feb 2021 00:01:22 +0000
From: Olivia Mackintosh <livvy@base.nu>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/2] ALSA: usb-audio: Add Pioneer DJM-450 support
Message-ID: <20210202000122.5riso3tlhvwhqyqg@base.nu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: Takashi Iwai <tiwai@suse.de>
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

Here are a couple of patches to support the DJM-450. Un-suprisingly, a
device quirk is required just like the other DJM models. Testing was
done by "xfz" from #xwax on Freenode. Perhaps this is useful for
reference or if anyone requires information about this device. They were
hesitant to have their full details in the commit log.

Olivia Mackintosh (2):
  ALSA: usb-audio: Add DJM450 to Pioneer format quirk
  ALSA: usb-audio: Add DJM-450 to the quirks table

 sound/usb/quirks-table.h | 57 ++++++++++++++++++++++++++++++++++++++++
 sound/usb/quirks.c       | 20 ++++++++++++++
 2 files changed, 77 insertions(+)

-- 
2.30.0

