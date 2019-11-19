Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B91102247
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Nov 2019 11:51:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 372BB1668;
	Tue, 19 Nov 2019 11:50:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 372BB1668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574160665;
	bh=QJRToZrT/PD4B7Qeas5GbElSzn30NEkRGIK9AfpYo4Y=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=inwGUmHp9pyG8I05rjSUCFXxH07QRLwJtv8qeKDUM+Ojzh6g5bZ7TQ3pvqhy8BXXd
	 GtgaeClgDGDHEoDM87fDcyIasxIYcli9bKTAct4fKthRqcc0JWLAWlcTb1NkmD7nU0
	 4et+zDGVg8uOo1mNt8qzWmaaRvVLt8z43C3ZxBD0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BBA9F80147;
	Tue, 19 Nov 2019 11:48:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0CA0F80147; Tue, 19 Nov 2019 11:48:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2400EF80119
 for <alsa-devel@alsa-project.org>; Tue, 19 Nov 2019 11:48:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2400EF80119
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="jMXln4U4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574160512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WtIW8ZVhduUzIQaAfyKPTppFpnE7X5TEImYzrJZLTGw=;
 b=jMXln4U488RR7dtctjUdFQ+DkFauEqSTeyJEmPcXzuJBl9bvyTU8S+Muo4STaXNYBmTMGE
 mIZyKoGlueF8K6wqx34NH6GbEexQwnrPEbv7apslGDkdqlkY/x0+QEfH1/uMKzQBuRCmWN
 5/p6YT4UfQL13KbpIA/0he/G+p2Tc7c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-TxdUejcYNsKwgkb_9Zm5xg-1; Tue, 19 Nov 2019 05:48:29 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7544DB60;
 Tue, 19 Nov 2019 10:48:27 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-117-49.ams2.redhat.com
 [10.36.117.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 14C682935B;
 Tue, 19 Nov 2019 10:48:25 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jaroslav Kysela <perex@perex.cz>
Date: Tue, 19 Nov 2019 11:48:20 +0100
Message-Id: <20191119104822.15053-2-hdegoede@redhat.com>
In-Reply-To: <20191119104822.15053-1-hdegoede@redhat.com>
References: <20191119104822.15053-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: TxdUejcYNsKwgkb_9Zm5xg-1
X-Mimecast-Spam-Score: 0
Cc: Takashi Iwai <tiwai@suse.de>, Hans de Goede <hdegoede@redhat.com>,
 alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH alsa-lib 2/4] ucm: Fix fallback to card_name
	(shortname) config for ucm1 profiles
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

uc_mgr_import_master_config() first calls load_master_config()
with the card's longname and if that fails then calls it again with the
card_name.

Before this commit configuration_filename() would force conf_format to 2
when it the access(fn, R_OK) test failed for the ucm1 longname
master-config filename.

This would cause configuration_filename() to blindly return a filename
under <prefix>/ucm2 without seeing if that is actually there and without
trying to fallback to the old profiles under <prefix>/ucm, breaking the
loading of UCM1 profiles by card_name.

This commit fixes this by modifying configuration_filename() to not set
conf_format when checking for the UCM1 config filename fails.
Instead, to make sure that any errors about opening the file still report
the new path, configuration_filename() now resets the filename to the UCM2
path if the access() check has failed for both the UCM2 and UCM1 paths,
without touching conf_format.

Fixes: aba2260ae7b5 ("ucm: switch to ucm2 directory and v2 format, keep backward compatibility")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 src/ucm/parser.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/src/ucm/parser.c b/src/ucm/parser.c
index 17aab054..a7e80de3 100644
--- a/src/ucm/parser.c
+++ b/src/ucm/parser.c
@@ -101,7 +101,6 @@ static void configuration_filename(snd_use_case_mgr_t *uc_mgr,
 	}
 
 	if (uc_mgr->conf_format > 0) {
-__format:
 		configuration_filename2(fn, fn_len, uc_mgr->conf_format,
 					dir, file, suffix);
 		return;
@@ -112,11 +111,11 @@ __format:
 		return;
 
 	configuration_filename2(fn, fn_len, 0, dir, file, suffix);
-	if (access(fn, R_OK)) {
-		/* make sure that the error message refers to the new path */
-		uc_mgr->conf_format = 2;
-		goto __format;
-	}
+	if (access(fn, R_OK) == 0)
+		return;
+
+	/* make sure that the error message refers to the new path */
+	configuration_filename2(fn, fn_len, 2, dir, file, suffix);
 }
 
 /*
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
