Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FC311A4AC
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2019 07:45:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 389A3165F;
	Wed, 11 Dec 2019 07:44:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 389A3165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576046741;
	bh=DiFzNbF7Tei9U0dPtb97H8mKQUNrEHNiZeknPmMkW6c=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=X6odBUgXX5VIX0VxTcbPw+3gqfJQBEvjKAGuNWN0/H5Jsc6uSFSAEK7Fli7sdFjoX
	 KlNi9cPSz9gDrTVAkGvm/WqXjD/d6HQ7jlLGgtJ1KVf3HmDSIQIAziBLIZS7wyinv5
	 ww6UButa5FKu8i8lRy207YoIGKKOOEeEsnGpw45s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7940AF802A1;
	Wed, 11 Dec 2019 07:39:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 099C7F801F4; Wed, 11 Dec 2019 07:37:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 561BFF800F3
 for <alsa-devel@alsa-project.org>; Wed, 11 Dec 2019 07:37:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 561BFF800F3
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Dec 2019 22:36:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,301,1571727600"; d="scan'208";a="245127326"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga002.fm.intel.com with ESMTP; 10 Dec 2019 22:36:58 -0800
Received: from younglee-svr.sh.intel.com (younglee-svr.sh.intel.com
 [10.239.159.31])
 by linux.intel.com (Postfix) with ESMTP id 43DB4580297;
 Tue, 10 Dec 2019 22:36:58 -0800 (PST)
From: libin.yang@linux.intel.com
To: alsa-devel@alsa-project.org
Date: Wed, 11 Dec 2019 14:07:19 +0800
Message-Id: <1576044439-2158-1-git-send-email-libin.yang@linux.intel.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Wed, 11 Dec 2019 07:38:39 +0100
Cc: Libin Yang <libin.yang@linux.intel.com>
Subject: [alsa-devel] [alsa-lib][PATCH] ucm: setup conf_format after getting
	ALSA_CONFIG_UCM_VAR successfully
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Libin Yang <libin.yang@linux.intel.com>

Set the conf_format to 1 after getting ALSA_CONFIG_UCM_VAR successfully.
Otherwise, the conf_format is not set in this scenario.

Signed-off-by: Libin Yang <libin.yang@linux.intel.com>
---
 src/ucm/parser.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/src/ucm/parser.c b/src/ucm/parser.c
index ba50027..d61124a 100644
--- a/src/ucm/parser.c
+++ b/src/ucm/parser.c
@@ -89,6 +89,8 @@ static void configuration_filename(snd_use_case_mgr_t *uc_mgr,
 		env = getenv(ALSA_CONFIG_UCM2_VAR);
 		if (env == NULL) {
 			env = getenv(ALSA_CONFIG_UCM_VAR);
+			if (env)
+				uc_mgr->conf_format = 1;
 		} else {
 			uc_mgr->conf_format = 2;
 		}
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
