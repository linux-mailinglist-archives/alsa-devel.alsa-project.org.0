Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 826E0149718
	for <lists+alsa-devel@lfdr.de>; Sat, 25 Jan 2020 19:12:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 210AE166C;
	Sat, 25 Jan 2020 19:11:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 210AE166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579975951;
	bh=aDIwBF2ANF0PqCUl191fgEAV3ZO/Mgz5XClYiYkrfUc=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rTv91+Si8oCsOS5h9zQMTwlEEQIhBlCjIkc6GEok+kIwanc9hpqoFMgOxy+2zAUrP
	 W1dTppeuBfVSUDb4ifx5g3ualYw3bRGNl5UQHOY0s6A+oSdMxh2jFr3nQGwVivVRYK
	 6IukW9E9cVryYYpNZRfDsh3PeaGszdoS7vwZYbPE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 803B6F800BA;
	Sat, 25 Jan 2020 19:10:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26C20F801EC; Sat, 25 Jan 2020 19:10:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23E38F800BA
 for <alsa-devel@alsa-project.org>; Sat, 25 Jan 2020 19:10:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23E38F800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="VIcgFaCC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579975834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=l5BsgYdFO1ghceyovlDf/lBvRehsk4J2RDjUF7pfet8=;
 b=VIcgFaCCXhuHGfwdGkPd82tl7XHAY5TpMo6Pq1IcC+Uz2FHmOxVGmrzE5zMXBiEzN0wCpN
 dEzZ7G9yOqeS48NXu+WCB4o8dATgRwmodAjYOLMwB7Q+dfz0Oj6gNUrreaLwoJHJ5irUey
 +4joUF/xsLbFmgU5570RrHnz3U08wkQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-iimH4PKBM8u3Lqm5KX8HFw-1; Sat, 25 Jan 2020 13:10:31 -0500
X-MC-Unique: iimH4PKBM8u3Lqm5KX8HFw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76250107ACC4;
 Sat, 25 Jan 2020 18:10:29 +0000 (UTC)
Received: from dhcp-44-196.space.revspace.nl (unknown [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1112260BEC;
 Sat, 25 Jan 2020 18:10:26 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Date: Sat, 25 Jan 2020 19:10:21 +0100
Message-Id: <20200125181021.70446-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
 stable@vger.kernel.org
Subject: [alsa-devel] [PATCH] ALSA: hda: Add Clevo W65_67SB the power_save
	blacklist
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Using HDA power-saving on the Clevo W65_67SB causes the first 0.5
seconds of audio to be missing every time audio starts playing.

This commit adds the Clevo W65_67SB the power_save blacklist to avoid
this issue.

Cc: stable@vger.kernel.org
BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1525104
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/pci/hda/hda_intel.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 5b92f290cbb0..54d9ea1750f9 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -2185,6 +2185,8 @@ static struct snd_pci_quirk power_save_blacklist[] = {
 	/* https://bugzilla.redhat.com/show_bug.cgi?id=1581607 */
 	SND_PCI_QUIRK(0x1558, 0x3501, "Clevo W35xSS_370SS", 0),
 	/* https://bugzilla.redhat.com/show_bug.cgi?id=1525104 */
+	SND_PCI_QUIRK(0x1558, 0x6504, "Clevo W65_67SB", 0),
+	/* https://bugzilla.redhat.com/show_bug.cgi?id=1525104 */
 	SND_PCI_QUIRK(0x1028, 0x0497, "Dell Precision T3600", 0),
 	/* https://bugzilla.redhat.com/show_bug.cgi?id=1525104 */
 	/* Note the P55A-UD3 and Z87-D3HP share the subsys id for the HDA dev */
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
