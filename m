Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 391FC102250
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Nov 2019 11:51:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA0071667;
	Tue, 19 Nov 2019 11:51:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA0071667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574160711;
	bh=RaSd1ZGRSD53QrWuHM4+HQ8aQG9r1gsU5nE5rMPjdBI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WPGTwI9O1gWAzJaUf8rD7/1ANvPD9QagJoFG/9FG9Itd1qEMuBM5TWqrRHAVFbcYr
	 7AL+1lJ33+LpH+BdbrkIoIo0lzZCR/X8ybBd3Y7fC6a/38orO6XCzkF5vaVOwhS6HQ
	 /tp2JfOoVEB5fOpqo0XHqJ+wntflc+3SunkV3XQ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B87C4F8014E;
	Tue, 19 Nov 2019 11:49:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8BD1F8014C; Tue, 19 Nov 2019 11:49:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D115F800FF
 for <alsa-devel@alsa-project.org>; Tue, 19 Nov 2019 11:49:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D115F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="YpooBti3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574160552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fGb0QJQCBg+zGDWOQ0Ocms47mh1FoGoqn8rNtypyb0I=;
 b=YpooBti33QJboG5lCfmC4AZaNDNe67AyWiVydY0t6er7lJ9lpd2YW4gOZgjMXAySbQkQrz
 oYv1Al6MUtLOMY/vlToDz/FPkczxoG12xj6HGMHg8VIMpi1zqz9fQ0n1zRQLorNrtZ9cDa
 CYUM88aD4BoLcl5wtWlpJlDRNvbVQoM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-G1ZEMUWAOZ2LtZ0b8y4p0A-1; Tue, 19 Nov 2019 05:48:30 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9959D1883521;
 Tue, 19 Nov 2019 10:48:29 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-117-49.ams2.redhat.com
 [10.36.117.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 822B99302;
 Tue, 19 Nov 2019 10:48:28 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jaroslav Kysela <perex@perex.cz>
Date: Tue, 19 Nov 2019 11:48:21 +0100
Message-Id: <20191119104822.15053-3-hdegoede@redhat.com>
In-Reply-To: <20191119104822.15053-1-hdegoede@redhat.com>
References: <20191119104822.15053-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: G1ZEMUWAOZ2LtZ0b8y4p0A-1
X-Mimecast-Spam-Score: 0
Cc: Takashi Iwai <tiwai@suse.de>, Hans de Goede <hdegoede@redhat.com>,
 alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH alsa-lib 3/4] ucm: Only look in ucm[1] or ucm2
	dir once we've found a config file in one
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

Unless environment variables are set, then configuration_filename()
when initially called by load_master_config() will first try to find
the requested master-config under <prefix>/alsa/ucm2 and then under
<prefix>/alsa/ucm.

Once a master-config is found this way, we should set conf_format to
match, so that subsequent lookups only look under the same directory
as where the master-config was found.

This fixes 2 problems:
1. uc_mgr_config_load() looking under <prefix>/alsa/ucm for includes for
   UCM2 profiles because it is called with uc_mgr->conf_format as format
   and before this commit that would stay 0 when autodetecion is used.

2. parse_verb_file() possibly loading an UCM2 verb-file for an UCM1 profile,
   the chance of this happening is small as this means that even though
   there is no UCM2 master-config there is an UCM2 profile dir matching
   uc_mgr->conf_file_name, which would be weird.

Fixes: aba2260ae7b5 ("ucm: switch to ucm2 directory and v2 format, keep backward compatibility")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 src/ucm/parser.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/src/ucm/parser.c b/src/ucm/parser.c
index a7e80de3..319e3c1a 100644
--- a/src/ucm/parser.c
+++ b/src/ucm/parser.c
@@ -107,12 +107,18 @@ static void configuration_filename(snd_use_case_mgr_t *uc_mgr,
 	}
 
 	configuration_filename2(fn, fn_len, 2, dir, file, suffix);
-	if (access(fn, R_OK) == 0)
+	if (access(fn, R_OK) == 0) {
+		/* Found an ucm2 file, only look in the ucm2 dir from now on */
+		uc_mgr->conf_format = 2;
 		return;
+	}
 
 	configuration_filename2(fn, fn_len, 0, dir, file, suffix);
-	if (access(fn, R_OK) == 0)
+	if (access(fn, R_OK) == 0) {
+		/* Found an ucm1 file, only look in the ucm dir from now on */
+		uc_mgr->conf_format = 1;
 		return;
+	}
 
 	/* make sure that the error message refers to the new path */
 	configuration_filename2(fn, fn_len, 2, dir, file, suffix);
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
