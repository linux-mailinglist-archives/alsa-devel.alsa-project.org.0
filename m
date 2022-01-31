Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6154B4A5269
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jan 2022 23:31:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5649163F;
	Mon, 31 Jan 2022 23:30:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5649163F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643668301;
	bh=Jzqhd0mrCTwJXhLqgFYZuTVuQ9pLYFyipZDkQnbM97Q=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=seb1zVfpIM48YwaUzg3u8STe34B3hPmOzdxRZPv/jSKovAkgHIOojMC9xHQT0i0kQ
	 cPlxkrmsiti+oeq9CZTpGSrGHDotMSjBM5wIV5oVaPHwKhuSm/vZSTCxfBz01sEFMe
	 a/lFIbyZPKX3Wf8q8fq44CrwqBXTOgPwEduabE9c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3ED24F80302;
	Mon, 31 Jan 2022 23:30:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7516BF8028B; Mon, 31 Jan 2022 23:30:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mout-y-111.mailbox.org (mout-y-111.mailbox.org [91.198.250.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB9DFF80095
 for <alsa-devel@alsa-project.org>; Mon, 31 Jan 2022 23:30:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB9DFF80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org
 header.b="xo8H44BG"
Received: from smtp202.mailbox.org (unknown [91.198.250.118])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-y-111.mailbox.org (Postfix) with ESMTPS id 4JnjSG6XzZz9sRJ;
 Mon, 31 Jan 2022 23:30:22 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1643668222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=FSgwgUdLocijzgTLpqFeo9oLYF96EeX1MIVS0VYYoRw=;
 b=xo8H44BGjAcav34XfpSKoaAjkNULdguOxgvIdSrFyVPtQT+fkUREQ5VH7AtyRBAWP2g/u8
 P/SZhTiq+yV9ytE99IldOZNUWTKPCG1XtsHpQxjCqqGjrUu/hiNjNU9hRHIFJuEGJuWM/1
 FZ4j+Q4FfMTeyzAf6dAQQnq2rCXeyTWB59GeZXyF+4nrq2+FeRbU/yhSH/s5bexFYsF1OT
 4TwVspmk2IOM7TBQ5ElocOxZuXSj1cny0Fgo/zkJQ31li2eTtn+2G8a8F7R6SqBQCHwtLy
 utPZyCB5IiggCMNzbEtVDejoiiryRGEP3IrD1KSBYPYhJbxsUsY8WgBIXbbQmQ==
From: Sebastian Berger <sebastian.berger@mailbox.org>
To: alsa-devel@alsa-project.org
Subject: [PATCH] conf: fix memory leaks in parse_def()
Date: Mon, 31 Jan 2022 23:29:07 +0100
Message-Id: <20220131222906.82279-1-sebastian.berger@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Sebastian Berger <sebastian.berger@mailbox.org>
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

For all execution paths in parse_def(), free the id string before returning.

Previous implementations fail to do this if the configuration:

    (1) tries to reference the child of a non-compound node, or
    (2) does not provide a valid argument after an assignment ('=') operator.

For example, the invocations:

    (1) snd_config_load_string(&conf, "foo 0 foo.a 1", 0)
    (2) snd_config_load_string(&conf, "bar =", 0)

would leak the strings "foo" or "bar", respectively.

Signed-off-by: Sebastian Berger <sebastian.berger@mailbox.org>
---
 src/conf.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/src/conf.c b/src/conf.c
index 70f0e773..8a09505b 100644
--- a/src/conf.c
+++ b/src/conf.c
@@ -1403,7 +1403,8 @@ static int parse_def(snd_config_t *parent, input_t *input, int skip, int overrid
 			if (mode != OVERRIDE) {
 				if (n->type != SND_CONFIG_TYPE_COMPOUND) {
 					SNDERR("%s is not a compound", id);
-					return -EINVAL;
+					err = -EINVAL;
+					goto __end;
 				}
 				n->u.compound.join = true;
 				parent = n;
@@ -1425,8 +1426,10 @@ static int parse_def(snd_config_t *parent, input_t *input, int skip, int overrid
 	}
 	if (c == '=') {
 		c = get_nonwhite(input);
-		if (c < 0)
-			return c;
+		if (c < 0) {
+			err = c;
+			goto __end;
+		}
 	}
 	if (!skip) {
 		if (_snd_config_search(parent, id, -1, &n) == 0) {
-- 
2.35.1

