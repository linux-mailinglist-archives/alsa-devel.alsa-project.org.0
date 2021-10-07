Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B768B4250AA
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Oct 2021 12:06:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C4691661;
	Thu,  7 Oct 2021 12:05:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C4691661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633601164;
	bh=sVIdineeAMYdRUdlcwDeYTPTOFXAg6VtHflxLLASdp4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n6le9PIJQdm8YxCJ2+e+dxxcjc4KCogotLnlxL8HNm2i9zeMFySWixHH+FX/lAK+N
	 tQin8erC7PgjDFpSdBLToxUUAqLhxVj0uNN+FmZuwMjZX1OO/j36eXbg50IjjhR/be
	 yghg+5ZL76iMgKxvyqx7lpsWF2VDBXBVo0sNfLxc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AEA8AF800FE;
	Thu,  7 Oct 2021 12:04:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D78D6F8027D; Thu,  7 Oct 2021 12:04:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 51B1BF80130
 for <alsa-devel@alsa-project.org>; Thu,  7 Oct 2021 12:04:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51B1BF80130
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1633601079600691080-webhooks-bot@alsa-project.org>
References: <1633601079600691080-webhooks-bot@alsa-project.org>
Subject: Double snd_dlobj_unlock()
Message-Id: <20211007100445.D78D6F8027D@alsa1.perex.cz>
Date: Thu,  7 Oct 2021 12:04:45 +0200 (CEST)
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

alsa-project/alsa-lib issue #181 was opened from johado:

In dlmisc.c:snd_dlobj_cache_get0() there is a call to snd_dlobj_unlock() in the __err: path which should not be there.
All lock/unlock are done by the callers to this function.

--- a/src/dlmisc.c
+++ b/src/dlmisc.c
@@ -359,7 +359,6 @@ snd_dlobj_cache_get0(const char *lib, const char *name,
                free(c);
              __err:
                snd_dlclose(dlobj);
-               snd_dlobj_unlock();
                return NULL;
        }
        c->dlobj = dlobj;

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/181
Repository URL: https://github.com/alsa-project/alsa-lib
