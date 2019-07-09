Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEF563A1A
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jul 2019 19:24:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4596B1678;
	Tue,  9 Jul 2019 19:23:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4596B1678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562693051;
	bh=4tLYM60eLJGasJ6txyzxcdRaS3cMqzJRbTEqZE3xOxI=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mEOafy0t+uqrsm3QwJb+IchK5qYfZrTSAbSaHH9n8eca8f67Bw0oCMWUsdkDhrh1R
	 OAYHALB/rfQWFWb4EKMiU6IOFgWOlR9aZpQF9NU5bpMyNkRJ1EnXVMqPUq3jwnXuMO
	 NK7zE2nTYE7ZeKHRmyk6Z//o8q9SPY9kQsWzgJFQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8314F80273;
	Tue,  9 Jul 2019 19:22:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DFE58F80274; Tue,  9 Jul 2019 19:22:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtprelay.hostedemail.com (smtprelay0215.hostedemail.com
 [216.40.44.215])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 39FDEF801A4
 for <alsa-devel@alsa-project.org>; Tue,  9 Jul 2019 19:22:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39FDEF801A4
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay04.hostedemail.com (Postfix) with ESMTP id D220D180A68B6;
 Tue,  9 Jul 2019 17:22:18 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: pin68_886ea01b22811
X-Filterd-Recvd-Size: 1239
Received: from XPS-9350 (cpe-23-242-196-136.socal.res.rr.com [23.242.196.136])
 (Authenticated sender: joe@perches.com)
 by omf05.hostedemail.com (Postfix) with ESMTPA;
 Tue,  9 Jul 2019 17:22:17 +0000 (UTC)
Message-ID: <d198a3e6ed3a0e9070afeb6aca69903c3e985149.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Derek Fang <derek.fang@realtek.com>, Mark Brown <broonie@kernel.org>
Date: Tue, 09 Jul 2019 10:22:16 -0700
User-Agent: Evolution 3.30.5-0ubuntu0.18.10.1 
MIME-Version: 1.0
Cc: Oder Chiou <oder_chiou@realtek.com>, Bard Liao <bardliao@realtek.com>,
 alsa-devel <alsa-devel@alsa-project.org>, LKML <linux-kernel@vger.kernel.org>
Subject: [alsa-devel] [PATCH] ASoC: rt1308: Remove executable attribute from
	source files
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

These are source files not executable.

Signed-off-by: Joe Perches <joe@perches.com>
---
 sound/soc/codecs/rt1308.c | 0
 sound/soc/codecs/rt1308.h | 0
 2 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/sound/soc/codecs/rt1308.c b/sound/soc/codecs/rt1308.c
old mode 100755
new mode 100644
diff --git a/sound/soc/codecs/rt1308.h b/sound/soc/codecs/rt1308.h
old mode 100755
new mode 100644

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
