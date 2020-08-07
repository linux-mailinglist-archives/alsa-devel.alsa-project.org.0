Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B19F123F0C9
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Aug 2020 18:15:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E5651607;
	Fri,  7 Aug 2020 18:14:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E5651607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596816901;
	bh=JMHvolNqS04mSSddCSkH4LHdokHB2fsgvkqjLY7Pnio=;
	h=Subject:References:To:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KZBaB4kBnhovdp4j8sasxEUgOZ0md0P2JJFqxLF5m6VCp6RXVHfQnJKE22dgAYFWx
	 +HPtesr0GNjJvB5gin7btaKP6TvyR9XkTR/hTpNVag7irB955TLmO9sgCi9lvcHyK3
	 975aoT/Qc69mbY3ku25ZaGEidvOvBKDoZ74t5sNQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3518EF80234;
	Fri,  7 Aug 2020 18:13:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 292A1F80218; Fri,  7 Aug 2020 18:13:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94C1CF800AB
 for <alsa-devel@alsa-project.org>; Fri,  7 Aug 2020 18:13:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94C1CF800AB
IronPort-SDR: h7h4wSgHR8RmhffQSUhelA+G8u4IkzETpViaVHLKw43jQcY08H9F/1dwd5Mm2gr29tZvw9K03J
 PkBsBKAv/8Nw==
X-IronPort-AV: E=McAfee;i="6000,8403,9706"; a="140998578"
X-IronPort-AV: E=Sophos;i="5.75,446,1589266800"; d="scan'208";a="140998578"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2020 09:12:36 -0700
IronPort-SDR: OlBg9zGVni4/9KCuF1bpKjkpngtbcWbWC/GtoRwEMSUgIIeX0q5vEWwCMQQ/Fs1DmmoCLwO5Yf
 HhTUtE3ItwyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,446,1589266800"; d="scan'208";a="276710129"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga008.fm.intel.com with ESMTP; 07 Aug 2020 09:12:36 -0700
Received: from [10.213.30.220] (mrajwa-mobl1.ger.corp.intel.com
 [10.213.30.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 8583058066D;
 Fri,  7 Aug 2020 09:12:35 -0700 (PDT)
Subject: [PATCH] Aplay: pcm_read(): return read samples instead of requested
 upon abort
References: <c6f45adf-776d-4ce5-783f-1be1b8d7eb29@linux.intel.com>
To: alsa-devel@alsa-project.org
From: "Rajwa, Marcin" <marcin.rajwa@linux.intel.com>
X-Forwarded-Message-Id: <c6f45adf-776d-4ce5-783f-1be1b8d7eb29@linux.intel.com>
Message-ID: <67dc575e-0309-e087-92d2-a468684be5fd@linux.intel.com>
Date: Fri, 7 Aug 2020 18:12:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <c6f45adf-776d-4ce5-783f-1be1b8d7eb29@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Cc: broonie@kernel.org, pierre-louis.bossart@linux.intel.com
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

aplay: pcm_read(): return read samples instead of requested upon abort

     This patch changes the logic of pcm_read() when abort signal has been
     detected. During such condition we should return the amount of frames
     actually read instead of the size requested by caller.

     Signed-off-by: Marcin Rajwa <marcin.rajwa@linux.intel.com>

diff --git a/aplay/aplay.c b/aplay/aplay.c
index 5d4b56e..6836558 100644
--- a/aplay/aplay.c
+++ b/aplay/aplay.c
@@ -2135,7 +2135,9 @@ static ssize_t pcm_read(u_char *data, size_t rcount)
                 count = chunk_size;
         }

-       while (count > 0 && !in_aborting) {
+       while (count > 0) {
+               if (in_aborting)
+                       return result;
                 if (test_position)
                         do_test_position();
                 check_stdin();

