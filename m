Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FB611037D
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Dec 2019 18:30:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA1601668;
	Tue,  3 Dec 2019 18:29:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA1601668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575394224;
	bh=WG1ZrYM68iKRQuEEujB9UhT4AFZe6MfpyNY/qtvWJ/I=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OsiycSUGF1Gkg9hlOIkwjSzKS+FCT6ri7JWDXz4g670vfr3Hlp3V01q2zL1MD0vMN
	 epK0X80/qfICUYUppr0QCG5BkfW5mTY0hRKg3t1csdCUmvj0y2cElNnKcKyridNNqF
	 oU9yJiVOgJ8csprxOsa2CGoEDl6qI03s9jxZ8XCQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E84DF80246;
	Tue,  3 Dec 2019 18:28:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0496DF80240; Tue,  3 Dec 2019 18:27:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 78C28F80233
 for <alsa-devel@alsa-project.org>; Tue,  3 Dec 2019 18:27:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78C28F80233
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="A7daLzPQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575394073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=BfITyVwph+IKU7Zs3olGdk9tyNURJJwuDU7iRKvQBKQ=;
 b=A7daLzPQfOD3xtR+ekq4PrKFHHhmeW68h0ltaBnSE4Hm3TnmLQk6PsFpbKvxN9z5QtDwP5
 xp5ajn5O8+Yk66xybRN82Y1NRoi2pCb5Y8acm90uebKMtfylSpwoWMXW+eNvnWGrDS3rIL
 rMgtCrHnDlWVQ45S5R8xqQIUyXnYW0A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-pFYtHyz4NQiGvkYdt5O-7A-1; Tue, 03 Dec 2019 12:27:48 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE5898024FE;
 Tue,  3 Dec 2019 17:27:46 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-197.ams2.redhat.com
 [10.36.116.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7A8D15DA2C;
 Tue,  3 Dec 2019 17:27:41 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jaroslav Kysela <perex@perex.cz>
Date: Tue,  3 Dec 2019 18:27:39 +0100
Message-Id: <20191203172739.105909-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: pFYtHyz4NQiGvkYdt5O-7A-1
X-Mimecast-Spam-Score: 0
Cc: Takashi Iwai <tiwai@suse.de>, Hans de Goede <hdegoede@redhat.com>,
 alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH alsa-lib] ucm: Do not fail to parse configs on
	cards with an empty CardComponents lists
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

Since the UCM profiles for all Bay- and Cherry-Trail SST cards have been
moved over to UCM2, parsing them fails with:

ALSA lib ucm_subs.c:220:(uc_mgr_get_substituted_value) variable '${CardComponents}' is not defined in this context!

This completely breaks audio support on all Bay- and Cherry-Trail devices.

This is caused by these non-SOF ASoC using cards having an empty
CardComponents list. Which in itself is fine, but is rejected by
the ucm_subs.c code. This commit changes the ucm_subs code to accept
an empty string as a valid value for CardComponents restoring audio
functionality on these boards.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 src/ucm/ucm_subs.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/src/ucm/ucm_subs.c b/src/ucm/ucm_subs.c
index 00afa9e3..90e395f0 100644
--- a/src/ucm/ucm_subs.c
+++ b/src/ucm/ucm_subs.c
@@ -25,6 +25,7 @@
  */
 
 #include "ucm_local.h"
+#include <stdbool.h>
 #include <sys/stat.h>
 #include <limits.h>
 
@@ -145,10 +146,11 @@ static char *rval_sysfs(snd_use_case_mgr_t *uc_mgr ATTRIBUTE_UNUSED, const char
 	return strdup(path);
 }
 
-#define MATCH_VARIABLE(name, id, fcn)					\
+#define MATCH_VARIABLE(name, id, fcn, empty_ok)				\
 	if (strncmp((name), (id), sizeof(id) - 1) == 0) { 		\
 		rval = fcn(uc_mgr);					\
 		idsize = sizeof(id) - 1;				\
+		allow_empty = (empty_ok);				\
 		goto __rval;						\
 	}
 
@@ -189,12 +191,14 @@ int uc_mgr_get_substituted_value(snd_use_case_mgr_t *uc_mgr,
 
 	while (*value) {
 		if (*value == '$' && *(value+1) == '{') {
-			MATCH_VARIABLE(value, "${ConfName}", rval_conf_name);
-			MATCH_VARIABLE(value, "${CardId}", rval_card_id);
-			MATCH_VARIABLE(value, "${CardDriver}", rval_card_driver);
-			MATCH_VARIABLE(value, "${CardName}", rval_card_name);
-			MATCH_VARIABLE(value, "${CardLongName}", rval_card_longname);
-			MATCH_VARIABLE(value, "${CardComponents}", rval_card_components);
+			bool allow_empty = false;
+
+			MATCH_VARIABLE(value, "${ConfName}", rval_conf_name, false);
+			MATCH_VARIABLE(value, "${CardId}", rval_card_id, false);
+			MATCH_VARIABLE(value, "${CardDriver}", rval_card_driver, false);
+			MATCH_VARIABLE(value, "${CardName}", rval_card_name, false);
+			MATCH_VARIABLE(value, "${CardLongName}", rval_card_longname, false);
+			MATCH_VARIABLE(value, "${CardComponents}", rval_card_components, true);
 			MATCH_VARIABLE2(value, "${env:", rval_env);
 			MATCH_VARIABLE2(value, "${sys:", rval_sysfs);
 			err = -EINVAL;
@@ -208,7 +212,7 @@ int uc_mgr_get_substituted_value(snd_use_case_mgr_t *uc_mgr,
 			}
 			goto __error;
 __rval:
-			if (rval == NULL || rval[0] == '\0') {
+			if (rval == NULL || (!allow_empty && rval[0] == '\0')) {
 				free(rval);
 				strncpy(r, value, idsize);
 				r[idsize] = '\0';
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
