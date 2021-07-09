Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE793C1D85
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Jul 2021 04:35:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEFEA15F2;
	Fri,  9 Jul 2021 04:34:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEFEA15F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625798133;
	bh=p2Iit6OoPiLXEDcLgNH62DkmlhtH6LxdXBNfCvG1xbg=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ui+7NOBO0kvclK6CVwdSCSatnMmexqZIeS/0O18SLSCzkq+S3Gk4bxvXzMJQSF3zX
	 K++qUDrtoJo9g3jwWwqHlkcx+oEhSRca1ywIuXxXpcK2BFeMk2HGCj1vL+SIhsmvlp
	 WNUhZW5Yt47lFPK1ISWKbswCTW5Z+Cf9QnEAs8xg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 389CBF8025C;
	Fri,  9 Jul 2021 04:34:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69DE0F80224; Fri,  9 Jul 2021 04:34:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A44CAF80107
 for <alsa-devel@alsa-project.org>; Fri,  9 Jul 2021 04:33:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A44CAF80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="sbl5Caa1"
Received: from localhost.localdomain (unknown [123.112.64.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 3F4AF40234; 
 Fri,  9 Jul 2021 02:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1625798034;
 bh=gsxFMTeqZnRRc9iXmfiIjhRa/gczix9H+dZe3fMdQvM=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=sbl5Caa1H/eFHUnRNA+DnTb1V+XXSeGh2t663QzlcfFwq6zi4Ee5ZycFeXLh0w31+
 QEO38bPxOB5HASbmIr11IeuuNZtsyQpHhQZ+0Zfz+Xf+S/Vgn2aMrSGeGkVkeOVLPR
 adNAY7fLja5opCXnIGWDdHm8PXMrirfcwR49aA4UQk85HstE50AnNkJk9aY25ZV4sX
 lmZ/iLOCoLZXnVE21gaGDHOjt9i+zC+wqVytXQFqMkNqz6R8g4+Y0cgjkHwuknU5kj
 fPv642e+5FFSaypLbbH//v92A0PN7DUCy+Eyuva6SoE6qyweOPom0ouxH7GwXO0AP6
 f98PdyHebnz1g==
From: Hui Wang <hui.wang@canonical.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Subject: [PATCH] ALSA: hda/proc - dump the coeff with the capital letters
Date: Fri,  9 Jul 2021 10:33:45 +0800
Message-Id: <20210709023345.6359-1-hui.wang@canonical.com>
X-Mailer: git-send-email 2.25.1
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

Sometimes we need to dump the coeff to debug the audio issues, and
need to compare it with the log of RTHDDump.exe under Windows, this is
the coeff under Windows and Linux:
Vendor widget coefficient value under Windows
Index 0x00  0x0002
Index 0x01  0xAAAA
Index 0x02  0x8AAA

Processing caps: benign=0, ncoeff=91 under Linux
Coeff 0x00: 0x0002
Coeff 0x01: 0xaaaa
Coeff 0x02: 0x8aaa

Windows prints the hex number with capital letter while Linux prints
the hex number with lower case letter, it adds the trouble when
comparing them. Let us change it to use capital letter.

Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 sound/pci/hda/hda_proc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/hda_proc.c b/sound/pci/hda/hda_proc.c
index 00c2eeb2c472..9037c87665b6 100644
--- a/sound/pci/hda/hda_proc.c
+++ b/sound/pci/hda/hda_proc.c
@@ -590,7 +590,7 @@ static void print_proc_caps(struct snd_info_buffer *buffer,
 		snd_hda_codec_write(codec, nid, 0, AC_VERB_SET_COEF_INDEX, i);
 		val = snd_hda_codec_read(codec, nid, 0, AC_VERB_GET_PROC_COEF,
 					 0);
-		snd_iprintf(buffer, "    Coeff 0x%02x: 0x%04x\n", i, val);
+		snd_iprintf(buffer, "    Coeff 0x%02X: 0x%04X\n", i, val);
 	}
 	snd_hda_codec_write(codec, nid, 0, AC_VERB_SET_COEF_INDEX, oldindex);
 }
-- 
2.25.1

