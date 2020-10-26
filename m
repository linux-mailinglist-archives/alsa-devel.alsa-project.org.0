Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E16829CECF
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Oct 2020 09:08:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E80D1676;
	Wed, 28 Oct 2020 09:07:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E80D1676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603872486;
	bh=KJYE8gFCxcABOu+mEh1/geb/uvls5Kdzq9bEPy3r3WA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pKQIUBptMLKkLisEzTILOmCegEl2ezrS70HRXN/icH2WAsu92LeIZIXL+b/4ILH8j
	 5BbISExvLdv0auRkKRbsFJqDUgSl86t/Q7CTYY+be96AnCua53KceHdmN2nXzES9dL
	 vLtGflbgG+uDYOLPfwGDR0L1MEg5nnpXdWKQJHrk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BAA28F801D5;
	Wed, 28 Oct 2020 09:06:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CDA8AF800CC; Mon, 26 Oct 2020 17:57:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92C63F800CC
 for <alsa-devel@alsa-project.org>; Mon, 26 Oct 2020 17:57:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92C63F800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mwTgG+gh"
Received: from localhost.localdomain (unknown [192.30.34.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A6CE52224A;
 Mon, 26 Oct 2020 16:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603731442;
 bh=KJYE8gFCxcABOu+mEh1/geb/uvls5Kdzq9bEPy3r3WA=;
 h=From:To:Cc:Subject:Date:From;
 b=mwTgG+ghrS6T6iSLk4o3A1Hvrlvx5MPbBTjN2iUiafRZQfdvqPlnxkZ8Z0xcC3188
 Eej8oZZx9Il5aXSINQD6i5Rzj6f2zBZrcRuJhE+niebQA4k52ngNOlat02e12LuFIt
 SktXasRb5POhEX2YkF2Y9meQRuhVvgcmUxwfA88M=
From: Arnd Bergmann <arnd@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ALSA: make snd_kcontrol_new name a normal string
Date: Mon, 26 Oct 2020 17:52:18 +0100
Message-Id: <20201026165715.3723704-1-arnd@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 28 Oct 2020 09:06:29 +0100
Cc: alsa-devel@alsa-project.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
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

From: Arnd Bergmann <arnd@arndb.de>

When building with W=2, there are lots of warnings about the
snd_kcontrol_new name field being an array of 'unsigned char'
but initialized to a string:

include/sound/soc.h:93:48: warning: pointer targets in initialization of 'const unsigned char *' from 'char *' differ in signedness [-Wpointer-sign]

Make it a regular 'char *' to avoid flooding the build log with this.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/sound/control.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sound/control.h b/include/sound/control.h
index e128cff10dfa..77d9fa10812d 100644
--- a/include/sound/control.h
+++ b/include/sound/control.h
@@ -42,7 +42,7 @@ struct snd_kcontrol_new {
 	snd_ctl_elem_iface_t iface;	/* interface identifier */
 	unsigned int device;		/* device/client number */
 	unsigned int subdevice;		/* subdevice (substream) number */
-	const unsigned char *name;	/* ASCII name of item */
+	const char *name;		/* ASCII name of item */
 	unsigned int index;		/* index of item */
 	unsigned int access;		/* access rights */
 	unsigned int count;		/* count of same elements */
-- 
2.27.0

