Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C10DA2799F
	for <lists+alsa-devel@lfdr.de>; Thu, 23 May 2019 11:46:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 588EA1668;
	Thu, 23 May 2019 11:45:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 588EA1668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558604797;
	bh=jypsC/tKSpB4Lbpoayj4xwrASGRdFrARpMcK6Rx8p3k=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VXlzWewqIi44mQfgI449gBDIao+sLSjqN8H+Sme3x1SUmpl7r/Vjy5tHww+piStkk
	 jfspMBgx70yzBB+0ASlfCal3FF+nSMMhBtLH4KvvoooXXqGrlQnfMIvTDODADDIAlV
	 5R1tZ2Fk5P575ozWbDik7gWCU/VWEk7q6Om+AglQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0528F89674;
	Thu, 23 May 2019 11:44:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67958F89707; Thu, 23 May 2019 11:44:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from smtp1.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33620F80C0F;
 Thu, 23 May 2019 11:44:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33620F80C0F
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
 by smtp1.de.adit-jv.com (Postfix) with ESMTP id 4B5CE3C005E;
 Thu, 23 May 2019 11:44:42 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
 by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VGpreGaRcmOZ; Thu, 23 May 2019 11:44:35 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 8FF4C3C00D1;
 Thu, 23 May 2019 11:44:35 +0200 (CEST)
Received: from vmlxhi-082.adit-jv.com (10.72.93.164) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.439.0;
 Thu, 23 May 2019 11:44:35 +0200
From: Adam Miartus <amiartus@de.adit-jv.com>
To: <patch@alsa-project.org>
Date: Thu, 23 May 2019 11:44:29 +0200
Message-ID: <1558604670-4180-1-git-send-email-amiartus@de.adit-jv.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.72.93.164]
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH - alsa-lib 0/1] pcm_file add missing unlock
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

previous patches:
	pcm: file: add support for infile reading in non interleaved mode
	pcm: file: use snd_pcm_file_areas_read_infile for readi

introduced an issue where pcm would not be unlocked on early return

Adam Miartus (1):
  pcm_file: add missing unlock on early return

 src/pcm/pcm_file.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
