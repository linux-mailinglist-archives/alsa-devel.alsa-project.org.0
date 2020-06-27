Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F29F20C38B
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Jun 2020 20:32:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15FFA1678;
	Sat, 27 Jun 2020 20:32:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15FFA1678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593282770;
	bh=2eKHOShBx9Ba8o4P59DMd8+IjH/am3jT5ZVcZrpVQjU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=peTF1aT/bZmkA5UbNy/N5Gps6I0dxHh6q972CIFImn52uhCn2oxeC43KaArWB5k4k
	 InWIN6TBk9FZYjdaqvrn0DW+HY1Lt/7NlsSiEnhR4x2NXGaioWCmPXUG70379SQ4T7
	 SiOi6mkBqkWtwkvAk4ByXRW+UdLR3A08mmhsovv0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E0BDF8023E;
	Sat, 27 Jun 2020 20:31:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7CE03F80234; Sat, 27 Jun 2020 20:31:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16A63F80096
 for <alsa-devel@alsa-project.org>; Sat, 27 Jun 2020 20:31:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16A63F80096
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="KlH6ttEe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593282660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ocQ8ce/EgZoTX+gQk7QLb8yXb1HRDeg2hLqSrkNmPcg=;
 b=KlH6ttEeiFneO5FvtdSIcAuy4yiEbx6XunKUZClHDuSqyRdDiZrT/vbpFf+WQdLqqgudJt
 1VHkMAzZk+fFhlK1c7nxwVTXKQCg4R4cbc/a7efkCzCyBTj3WRn2eDNUNY7qoVsdFiPjr1
 5ZbWxkdn13/k0yR1sbtEERxik/teuRs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-_zoYSSpIM92N6z7Gexe8dQ-1; Sat, 27 Jun 2020 14:30:56 -0400
X-MC-Unique: _zoYSSpIM92N6z7Gexe8dQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 49D4718A8228;
 Sat, 27 Jun 2020 18:30:55 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-69.ams2.redhat.com [10.36.112.69])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0F8AE1001B07;
 Sat, 27 Jun 2020 18:30:53 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org
Subject: [PATCH] ucm: Allow empty strings in "${var:...}" substitutions
Date: Sat, 27 Jun 2020 20:30:52 +0200
Message-Id: <20200627183052.97118-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Cc: Hans de Goede <hdegoede@redhat.com>
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

Recent ucm-conf changes introduce checks like this one in various places:

If.mspk {
        Condition {
                Type String
                Empty "${var:MonoSpeaker}"
        }
        True ...
        False ...
}

The 'Empty "${var:MonoSpeaker}"' part can only every succeed if we do:

Define.MonoSpeaker ""

But so far that would result in an error like this one:

ALSA lib ucm_subs.c:367:(uc_mgr_get_substituted_value) variable '${var:MonoSpeaker}' is not defined in this context!
ALSA lib main.c:983:(snd_use_case_mgr_open) error: failed to import cht-bsw-rt5672 use case configuration -22
alsaucm: error failed to open sound card cht-bsw-rt5672: Invalid argument

This commit fixes this by allowing empty values for "${var:...}"
substitutions.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Note besides the mentioned error, this also fixes similar errors I have
been seeing on every board since alsa-ucm-conf commit d001c8de287f
("ucm.conf: add support for the kernel module name tree")
---
 src/ucm/ucm_subs.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/src/ucm/ucm_subs.c b/src/ucm/ucm_subs.c
index 293426f2..a154aa51 100644
--- a/src/ucm/ucm_subs.c
+++ b/src/ucm/ucm_subs.c
@@ -262,9 +262,10 @@ static char *rval_var(snd_use_case_mgr_t *uc_mgr, const char *id)
 		goto __rval;						\
 	}
 
-#define MATCH_VARIABLE2(name, id, fcn)					\
+#define MATCH_VARIABLE2(name, id, fcn, empty_ok)			\
 	if (strncmp((name), (id), sizeof(id) - 1) == 0) {		\
 		idsize = sizeof(id) - 1;				\
+		allow_empty = (empty_ok);				\
 		fcn2 = (fcn);						\
 		goto __match2;						\
 	}
@@ -314,11 +315,11 @@ __std:
 		MATCH_VARIABLE(value, "${CardName}", rval_card_name, false);
 		MATCH_VARIABLE(value, "${CardLongName}", rval_card_longname, false);
 		MATCH_VARIABLE(value, "${CardComponents}", rval_card_components, true);
-		MATCH_VARIABLE2(value, "${env:", rval_env);
-		MATCH_VARIABLE2(value, "${sys:", rval_sysfs);
-		MATCH_VARIABLE2(value, "${var:", rval_var);
-		MATCH_VARIABLE2(value, "${CardNumberByName:", rval_card_number_by_name);
-		MATCH_VARIABLE2(value, "${CardIdByName:", rval_card_id_by_name);
+		MATCH_VARIABLE2(value, "${env:", rval_env, false);
+		MATCH_VARIABLE2(value, "${sys:", rval_sysfs, false);
+		MATCH_VARIABLE2(value, "${var:", rval_var, true);
+		MATCH_VARIABLE2(value, "${CardNumberByName:", rval_card_number_by_name, false);
+		MATCH_VARIABLE2(value, "${CardIdByName:", rval_card_id_by_name, false);
 __merr:
 		err = -EINVAL;
 		tmp = strchr(value, '}');
-- 
2.26.2

