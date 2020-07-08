Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34AE32184CE
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jul 2020 12:19:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50AA51686;
	Wed,  8 Jul 2020 12:19:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50AA51686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594203590;
	bh=0BOxeo0NsnXb+G5/X7MZvSietyacdEjKd06EfAWnF5M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qDH2deHPdyxIoFih7hqAbo3YAs8vOuhVLo83WfSLlf0DmRsTuc0KpLu6lfzzjrBp9
	 8EvIXmrT4QDi4REGN8swq69h+8OD8juNyCukT7sYNXqyVTTdxWmzSfeAKI3BP4nRI4
	 sKrRjLa98cmUtHW1+kaWm+NIxVVnnNACef21SxbY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75788F80269;
	Wed,  8 Jul 2020 12:18:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36193F80161; Wed,  8 Jul 2020 12:18:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from jazz.pogo.org.uk (jazz.pogo.org.uk [213.138.114.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A90B9F8011F
 for <alsa-devel@alsa-project.org>; Wed,  8 Jul 2020 12:18:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A90B9F8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=pogo.org.uk header.i=@pogo.org.uk
 header.b="K/jyssWS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pogo.org.uk
 ; s=a;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:
 Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ViH/Mvvn/vkw0THcuwQj+htjgooqeoV5+Xy8sjVDlkA=; b=K/jyssWScZL9if+uebPUiP9oFa
 /Qhod6AJdseQnQY9gMv9hCkD55tNgV7/u8GB4hAki2AmfBveJWTN7zyvO6yKCRFruV5jz2l/pbr07
 T6X6C8WXMthiBxVLqKy7fCUDifnv7vYAVPmhpnTB+iFVdV1XKZ73FRvK3ch49lFSn7ctIA6n5RFHK
 YsHPIcBHJj44utCYI9pDqJmGcH2RL/lmwzzqclUnpnH6kwHuzC9Jco0UlaiseGpWTlDE5nLfDVzAo
 qUD1YM2FkR6cM3f8s1ADm5PA7uYNqPhtY00UGlhhtYkPG8nLBldFRhL7NtALhfDYTr2wenVucGtKK
 t/nYTGzg==;
Received: from cpc1-hari17-2-0-cust102.20-2.cable.virginm.net ([86.18.4.103]
 helo=stax.localdomain) by jazz.pogo.org.uk with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94 (FreeBSD))
 (envelope-from <mark@xwax.org>)
 id 1jt7A8-0002Q4-Fy; Wed, 08 Jul 2020 11:18:48 +0100
Received: from mark by stax.localdomain with local (Exim 4.84)
 (envelope-from <mark@stax.localdomain>)
 id 1jt7A8-0000uQ-3r; Wed, 08 Jul 2020 11:18:48 +0100
From: Mark Hills <mark@xwax.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 1/5] echoaudio: Remove redundant check
Date: Wed,  8 Jul 2020 11:18:44 +0100
Message-Id: <20200708101848.3457-1-mark@xwax.org>
X-Mailer: git-send-email 2.17.5
In-Reply-To: <2007081115280.3085@stax.localdomain>
References: <2007081115280.3085@stax.localdomain>
Cc: alsa-devel@alsa-project.org
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

This check is always false, as it's not the responsibilty of the
device-specific code to make this check. It is already checked
in snd_echo_digital_mode_put.

I do not have a Mona interface to test this change.

This patch is in preparation for follow-up patch to modify the
behavior of "opencount".

Signed-off-by: Mark Hills <mark@xwax.org>
---
 sound/pci/echoaudio/mona_dsp.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/sound/pci/echoaudio/mona_dsp.c b/sound/pci/echoaudio/mona_dsp.c
index dce9e57d01c4..f77db83dd73d 100644
--- a/sound/pci/echoaudio/mona_dsp.c
+++ b/sound/pci/echoaudio/mona_dsp.c
@@ -300,11 +300,6 @@ static int set_input_clock(struct echoaudio *chip, u16 clock)
 	u32 control_reg, clocks_from_dsp;
 	int err;
 
-
-	/* Prevent two simultaneous calls to switch_asic() */
-	if (atomic_read(&chip->opencount))
-		return -EAGAIN;
-
 	/* Mask off the clock select bits */
 	control_reg = le32_to_cpu(chip->comm_page->control_register) &
 		GML_CLOCK_CLEAR_MASK;
-- 
2.17.5

