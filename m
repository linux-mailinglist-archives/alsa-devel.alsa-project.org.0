Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E5261D9E
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Jul 2019 13:07:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DDFB166F;
	Mon,  8 Jul 2019 13:06:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DDFB166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562584019;
	bh=sDc+sRRZskafydrWd9d1YfRs9cP4vfHHAmi6OjY8K1w=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EtmbwV3sGeWdNkmJGC3VIak3FSLbX9boE5I3vCJYWhXyV0mSnlsIbcO26/IVG0oma
	 Lnl562gElAtsp1zS9xjZrMbGXO9k3d2bkhn4I4U9bdu4ALwRXkY+w+z4a6ie9Z5uOv
	 cWwm7stwn87Kvskv9k5q1PFWQgqvNUvXxuN30jPw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB5B4F801D8;
	Mon,  8 Jul 2019 13:05:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F680F8026A; Mon,  8 Jul 2019 13:05:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp1.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02665F801D8;
 Mon,  8 Jul 2019 13:05:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02665F801D8
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
 by smtp1.de.adit-jv.com (Postfix) with ESMTP id 41EDD3C058B;
 Mon,  8 Jul 2019 13:05:05 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
 by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s1TlJmSTdueV; Mon,  8 Jul 2019 13:04:56 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 71AA13C00BA;
 Mon,  8 Jul 2019 13:04:56 +0200 (CEST)
Received: from vmlxhi-082.adit-jv.com (10.72.93.164) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.439.0;
 Mon, 8 Jul 2019 13:04:55 +0200
From: Adam Miartus <amiartus@de.adit-jv.com>
To: <patch@alsa-project.org>
Date: Mon, 8 Jul 2019 13:04:47 +0200
Message-ID: <1562583889-2109-1-git-send-email-amiartus@de.adit-jv.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.72.93.164]
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 0/2] expand dshare to allow audio clock when
	not streaming data
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

The general idea of these changes is to be able to open the device without
defined bindings. This would start the audio clock without blocking a channel.

This might be useful for hardware that requires running clock early at
system start and to be available even without application streaming
audio data.

Andreas Pape (2):
  alsa: pcm: add unsupported OPS
  alsa: dshare: allow missing bindings

 src/pcm/Makefile.am       |   4 +-
 src/pcm/pcm_dshare.c      |  72 +++++++++++--
 src/pcm/pcm_unsupported.c | 265 ++++++++++++++++++++++++++++++++++++++++++++++
 src/pcm/pcm_unsupported.h | 167 +++++++++++++++++++++++++++++
 4 files changed, 495 insertions(+), 13 deletions(-)
 create mode 100644 src/pcm/pcm_unsupported.c
 create mode 100644 src/pcm/pcm_unsupported.h

-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
