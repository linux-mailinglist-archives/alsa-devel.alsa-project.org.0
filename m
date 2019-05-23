Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 188B527D7E
	for <lists+alsa-devel@lfdr.de>; Thu, 23 May 2019 15:02:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 995A91677;
	Thu, 23 May 2019 15:01:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 995A91677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558616569;
	bh=OFdsN2vdc7HcMQg7qkOTjyJUBrKn0RrBcjr8DRVBS7Q=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KJFKzDslI9/HCEeH593dSgywjFhAX05KedgBRjRl4Jf07+27VaJjpI1MMYQUIsP1C
	 4cZULc5j9MPQq45uVn5jXbDN1vSoYDhBCbIXbFA425R9KLshWw6pfIk8x5AFZzGB52
	 uyinXZPsCTodkmIQC2hLHrHAJ9qXrx3jneO2wgSE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10E56F89674;
	Thu, 23 May 2019 15:01:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88689F89707; Thu, 23 May 2019 15:01:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from smtp1.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 070ABF8079B;
 Thu, 23 May 2019 15:00:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 070ABF8079B
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
 by smtp1.de.adit-jv.com (Postfix) with ESMTP id 1DE3A3C013A;
 Thu, 23 May 2019 15:00:55 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
 by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6iCJjjvwwO4k; Thu, 23 May 2019 15:00:48 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 601D23C005E;
 Thu, 23 May 2019 15:00:48 +0200 (CEST)
Received: from vmlxhi-082.adit-jv.com (10.72.93.164) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.439.0;
 Thu, 23 May 2019 15:00:47 +0200
From: Adam Miartus <amiartus@de.adit-jv.com>
To: <patch@alsa-project.org>
Date: Thu, 23 May 2019 15:00:38 +0200
Message-ID: <1558616440-21044-1-git-send-email-amiartus@de.adit-jv.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.72.93.164]
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 0/2] add pcm_file support in MMAP read access
	mode
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

adds support for overwritting input buffer in MMAP access mode for
in pcm_file plugin

new api pcm_fast_ops callback mmap_begin is introduced to ease the
operation needed to overwrite mmaped buffer. this allows to modify
only the next continuous part of data in ring buffer.

Adam Miartus (2):
  pcm: add mmap_begin callback to snd_pcm_fast_ops_t api
  pcm_file: add infile read support for mmap mode

 src/pcm/pcm.c       |  6 ++++++
 src/pcm/pcm_file.c  | 31 +++++++++++++++++++++++++++++++
 src/pcm/pcm_local.h |  1 +
 3 files changed, 38 insertions(+)

-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
