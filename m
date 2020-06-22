Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 026FD2037BD
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jun 2020 15:18:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A460B16D7;
	Mon, 22 Jun 2020 15:17:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A460B16D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592831928;
	bh=1Y4/67d0NLl7+EZBvJVn3CAsDOhqAtvYelMBFg9kpPE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fiukQpftf6hR6kDgE3+1mlhknsnzhGXsuHqT1cbXkLx8t5QrDrmm59+JvGLQD4dVx
	 yHnmh7jsqe1ngY2zoZoP9VQAHCNEV2V6XFxtK+aD0j5VzQfxOrHrDE3F+7qyt0eHQx
	 YFcSZNDycYwPtimd+1hIDBhXDNsUVv11bhtlQBms=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6A30F802C2;
	Mon, 22 Jun 2020 15:15:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9638FF802A2; Mon, 22 Jun 2020 15:15:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from jazz.pogo.org.uk (jazz.pogo.org.uk [213.138.114.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AFC43F801DB
 for <alsa-devel@alsa-project.org>; Mon, 22 Jun 2020 15:15:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFC43F801DB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=pogo.org.uk header.i=@pogo.org.uk
 header.b="e2Tjt3gl"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pogo.org.uk
 ; s=a;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:
 Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=G2ZSecEV9yRIX2+CzLsc2Yn8PQgso1L4Xx3ldhEqeX0=; b=e2Tjt3glcAer9B+xpOW/khpGPg
 TGK3E8JxXYWSOuufwnPRmgN2mCPJOOUe4aGXIdg4vtYqKBAw1EUDlO8W2+MX0ZnYmBLHF/Gi/UJhC
 6VZqHtDeozdp1V2+aAah8bFTbzeZd6ADkzR/SLZXBYVcM91v1hmy9Gg677XBxdgZ/eK1JYvt2uSgM
 epDD12kGje27AmAfeu2oboM8skLUG1VSUmGWq49sGJWo6iO5yuTbphhn6ETWpz6e9IT33glOnhqmT
 d44giXGgTBAQo8/Hbs1U4bB6ow/QDW3ix5Wv5uao7UZgrwAxDxo+V2dvSVkMXs7SPwk7FrCCOeeiQ
 K7x509Eg==;
Received: from cpc1-hari17-2-0-cust102.20-2.cable.virginm.net ([86.18.4.103]
 helo=stax.localdomain) by jazz.pogo.org.uk with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94 (FreeBSD))
 (envelope-from <mark@xwax.org>)
 id 1jnMI7-000BwJ-Ez; Mon, 22 Jun 2020 14:15:15 +0100
Received: from mark by stax.localdomain with local (Exim 4.84)
 (envelope-from <mark@stax.localdomain>)
 id 1jnMI7-00065t-3l; Mon, 22 Jun 2020 14:15:15 +0100
From: Mark Hills <mark@xwax.org>
To: Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 2/9] control: Fix a bug that prevented namehint behaviour
Date: Mon, 22 Jun 2020 14:15:08 +0100
Message-Id: <20200622131515.23385-2-mark@xwax.org>
X-Mailer: git-send-email 2.17.5
In-Reply-To: <2006221356390.20421@stax.localdomain>
References: <2006221356390.20421@stax.localdomain>
Cc: alsa-devel@alsa-project.org
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

Looks like the documented behaviour was broken in commit 1ba513f9 in
2006, with the introduction of multiple fields.

I've chosen to match the described behaviour. Prior to this patch,
using namehint could be made to work by exploiting the lack of escaping
of the "name", populating the other fields:

  "plug:front|DESCDo all conversions for front speakers"

rather than that which is documented and presumed to be the intention
for asoundrc files:

  "plug:front|Do all conversions for front speakers"

Everything seems to strongly suggest nobody is using this feature; I can
find no working examples through a web search and probably someone
would have hit this bug. It's not documented in configuration, only in
the snd_device_name_hint() call. So it would probably clutter things to
provide compatibility for the old behaviour.

I have found it to be very useful since working in Chromium, where it is
the only way to expose chosen ALSA devices to web applications.

A temporary buffer is required to null-terminate the string.  I see no
use of alloca() in the code, presumably to avoid unbounded stack size.
So memory is allocated on the heap.

Signed-off-by: Mark Hills <mark@xwax.org>
---
 src/control/namehint.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/src/control/namehint.c b/src/control/namehint.c
index d81d3a7e..e4f696ad 100644
--- a/src/control/namehint.c
+++ b/src/control/namehint.c
@@ -78,6 +78,31 @@ static int hint_list_add(struct hint_list *list,
 	return 0;
 }
 
+/**
+ * Add a namehint from string given in a user configuration file
+ */
+static int hint_list_add_custom(struct hint_list *list,
+				const char *entry)
+{
+	int err;
+	const char *sep;
+	char *name;
+
+	assert(entry);
+
+	sep = strchr(entry, '|');
+	if (sep == NULL)
+		return hint_list_add(list, entry, NULL);
+
+	name = strndup(entry, sep - entry);
+	if (name == NULL)
+		return -ENOMEM;
+
+	err = hint_list_add(list, name, sep + 1);
+	free(name);
+	return err;
+}
+
 static void zero_handler(const char *file ATTRIBUTE_UNUSED,
 			 int line ATTRIBUTE_UNUSED,
 			 const char *function ATTRIBUTE_UNUSED,
@@ -626,7 +651,7 @@ int snd_device_name_hint(int card, const char *iface, void ***hints)
 			if (snd_config_get_string(snd_config_iterator_entry(i),
 						  &str) < 0)
 				continue;
-			err = hint_list_add(&list, str, NULL);
+			err = hint_list_add_custom(&list, str);
 			if (err < 0)
 				goto __error;
 		}
-- 
2.17.5

