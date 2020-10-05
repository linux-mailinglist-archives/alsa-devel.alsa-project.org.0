Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CDA283F68
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Oct 2020 21:15:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B36E17CE;
	Mon,  5 Oct 2020 21:14:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B36E17CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601925318;
	bh=I49HOJRUJBNxCcUVCM2xvqWJQVEWUGsbYQDl0pcHxUU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ij7TxH4TnfGSvUjjowzMRKQdsvcssOqqfOYj6l1cNjg9MRaImS4T4stJb20DI4Wd6
	 GKQPkxSfkRvQh12ijWpo3gLxLdjayjANxuDKqTKrGl25k0SBzqrrRqEUUoJHA/S5Tk
	 Rv4DYlychvzlmTr1LDo9MDs1KRWGmwUwt6HAhgh4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4860BF802DB;
	Mon,  5 Oct 2020 21:12:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0D96F802D2; Mon,  5 Oct 2020 21:12:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9492DF80269
 for <alsa-devel@alsa-project.org>; Mon,  5 Oct 2020 21:12:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9492DF80269
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="wsbqVU22"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=4qwGoWMDW+eDJ7rMkFSl3AojjjIn6fVSxG9MxGWKgck=; b=wsbqVU22bJNIPJDvhKodU7Rc7y
 zrzunvZlJaCrlf+a7WJGeh7HLvIXiJ8+nbMvUB4Um9dx8JIi5tyG5rFRcJxALEC5IetzhmKs3UPzy
 1Y0BRMlZ7avfz8/2A4xFr4gYlzdraCBQWqd4+lzYfG2rJ+Vt2T4aRlhRvEeG19nu4KdYTt9Ed/CpR
 Sl24wJSyxL8iP9ZZkPgskIa1qLRhvLM7GGiJAavf7KH6tDRHxHP9YRvsgcW46VWQXHAXfhKVdfBbv
 lOGeLm9UnnNrS5oyxKKchzT3uoL8k7p2u73qUh3ZMhNOk4h2dT/ZgIPzQGAdO2I4lr3PEcFoJQB7u
 nWe2/CAQ==;
Received: from [2601:1c0:6280:3f0::2c9a] (helo=smtpauth.infradead.org)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPVui-0007AD-Mg; Mon, 05 Oct 2020 19:12:49 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] sound: usb: endpoint.c: fix repeated word 'there'
Date: Mon,  5 Oct 2020 12:12:44 -0700
Message-Id: <20201005191244.23902-1-rdunlap@infradead.org>
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

Drop the duplicated word "there".

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
---
 sound/usb/endpoint.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- lnx-59-rc8.orig/sound/usb/endpoint.c
+++ lnx-59-rc8/sound/usb/endpoint.c
@@ -318,7 +318,7 @@ static inline void prepare_inbound_urb(s
 
 /*
  * Send output urbs that have been prepared previously. URBs are dequeued
- * from ep->ready_playback_urbs and in case there there aren't any available
+ * from ep->ready_playback_urbs and in case there aren't any available
  * or there are no packets that have been prepared, this function does
  * nothing.
  *
