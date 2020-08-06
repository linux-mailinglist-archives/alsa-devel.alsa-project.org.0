Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C5D23D55F
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Aug 2020 04:21:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12A161669;
	Thu,  6 Aug 2020 04:20:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12A161669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596680480;
	bh=VzL+Tm53e53uAOygKMK60tSm+TKwy9hnX+jajSROpQ0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vtL/FKec2Jb+/ocedzuCW9r9/Zoknlo9o24OyHtGgxmHuPhk3kUzAbLvdMhCjk9mR
	 FB8X/Ew90HPM8TcJ/cclgFJ2VZ3JaMvbXe1kAUJ1CpJ2C9be+jaWpYl34tB4102L2y
	 wmpyaQMeo29KcJbdG/wEPc4MPjgUlusBEsxrGRdo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31554F800B7;
	Thu,  6 Aug 2020 04:19:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A87AF8015A; Thu,  6 Aug 2020 04:19:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 631BBF800B7
 for <alsa-devel@alsa-project.org>; Thu,  6 Aug 2020 04:19:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 631BBF800B7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="K7iPfpeN"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=d/5tYSPx//jC7rHKuQ0NrtE7qKrw9QWpaF47ZBatM8M=; b=K7iPfpeNTS9MaFHtB8NSVvGfRa
 onCs1gncN4P/rxe+/QT4j1Uo5iwfFpySmBsgwiE/xRGgMmfJCio2CUAVu2llg35ftp2KfWFN4AYZy
 nQ45K0/hIjT7b4PLikl8n/ce8k/uzGXdDJ9/pwSh+C/BeLAmFgBe3IkpkmEMo8VTj3leq6oqyBPXX
 kugyLbn1z8vHYRFfMu6g7ZwKvML8LfBsqN1t2QXVV+EwQ34EQ4PZVO8NI70amI95+F9JXF29F4qfH
 kqJalyJ7gtsmVd1M8riAT9tRUTtLT+mkx+m3jaey0Ld+tu7Wi6qsiUsxCgekdtmZhV1kDnB6yJmUJ
 CaiORaug==;
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3VV1-0007tP-OS; Thu, 06 Aug 2020 02:19:21 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] sound: isa: delete repeated words in comments
Date: Wed,  5 Aug 2020 19:19:16 -0700
Message-Id: <20200806021916.32369-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Randy Dunlap <rdunlap@infradead.org>,
 Takashi Iwai <tiwai@suse.com>
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

Drop duplicated words in sound/isa/.
{be, bit}

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
---
 sound/isa/cs423x/cs4236_lib.c |    2 +-
 sound/isa/es18xx.c            |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

--- linux-next-20200805.orig/sound/isa/cs423x/cs4236_lib.c
+++ linux-next-20200805/sound/isa/cs423x/cs4236_lib.c
@@ -39,7 +39,7 @@
  *     D7: consumer serial port enable (CS4237B,CS4238B)
  *     D6: channels status block reset (CS4237B,CS4238B)
  *     D5: user bit in sub-frame of digital audio data (CS4237B,CS4238B)
- *     D4: validity bit bit in sub-frame of digital audio data (CS4237B,CS4238B)
+ *     D4: validity bit in sub-frame of digital audio data (CS4237B,CS4238B)
  * 
  *  C5  lower channel status (digital serial data description) (CS4237B,CS4238B)
  *     D7-D6: first two bits of category code
--- linux-next-20200805.orig/sound/isa/es18xx.c
+++ linux-next-20200805/sound/isa/es18xx.c
@@ -955,7 +955,7 @@ static int snd_es18xx_info_mux(struct sn
 	case 0x1887:
 	case 0x1888:
 		return snd_ctl_enum_info(uinfo, 1, 5, texts5Source);
-	case 0x1869: /* DS somewhat contradictory for 1869: could be be 5 or 8 */
+	case 0x1869: /* DS somewhat contradictory for 1869: could be 5 or 8 */
 	case 0x1879:
 		return snd_ctl_enum_info(uinfo, 1, 8, texts8Source);
 	default:
