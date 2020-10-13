Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC5028CD0D
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Oct 2020 13:56:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DEBC51689;
	Tue, 13 Oct 2020 13:55:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DEBC51689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602590195;
	bh=78BG9Iu2yAlND/COH/HKK6//gm3h8RbYRE58LCuOyj4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=toX3gktk8+EOFXGJd7SFAMglGyM3QDzdbMzm0/WyglZpNMQgBYJ483OJ/rukn0Qgd
	 c03E4bkcjWJKEjAbAF+bdlhJvb2lGu3rLIopyFJINA9T4YeeXFpGFFI7Hqv/HDT6fR
	 yERlduKHBKJOgl0jMPlbmfEJkQ7bUQKB4OGMvGtA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44869F8016F;
	Tue, 13 Oct 2020 13:54:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0969F80255; Tue, 13 Oct 2020 13:54:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9DBAF800F6
 for <alsa-devel@alsa-project.org>; Tue, 13 Oct 2020 13:54:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9DBAF800F6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="AsK7hZKt"
Received: from mail.kernel.org (ip5f5ad5b2.dynamic.kabel-deutschland.de
 [95.90.213.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DEBB122404;
 Tue, 13 Oct 2020 11:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602590081;
 bh=78BG9Iu2yAlND/COH/HKK6//gm3h8RbYRE58LCuOyj4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AsK7hZKtJHTp+v/vQK7XgM0QCL3nZxAgSJGWungnQzL/zeI6v/B32acVF1enJu+A9
 IRprqu9BkcwN4dzKVUpjjIYEAtgjJJPbBEVgieSPRbCuk+VUU8v322xh1wkbfjKvrM
 cwkig0bWKbK+uTEmlbTrA2y5DEC6r1TBITVQkz5U=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1kSIt4-006CUx-PS; Tue, 13 Oct 2020 13:54:38 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH v6 39/80] docs: writing-an-alsa-driver.rst: fix some bad
 c:func: markups
Date: Tue, 13 Oct 2020 13:53:54 +0200
Message-Id: <d01b867cb61f9bcbd810ed31be080705fd31f0aa.1602589096.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1602589096.git.mchehab+huawei@kernel.org>
References: <cover.1602589096.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>,
 Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Julia Lawall <Julia.Lawall@inria.fr>, Takashi Iwai <tiwai@suse.de>
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

Some such markups are invalid, as reported by Sphinx:

	./Documentation/sound/kernel-api/writing-an-alsa-driver.rst:3317: WARNING: Unparseable C cross-reference: 'snd_rawmidi_transmit*'
	Invalid C declaration: Expected end of definition. [error at 20]
	  snd_rawmidi_transmit*
	  --------------------^
	./Documentation/sound/kernel-api/writing-an-alsa-driver.rst:3917: WARNING: Unparseable C cross-reference: 'copy_from/to_user'
	Invalid C declaration: Expected end of definition. [error at 9]
	  copy_from/to_user
	  ---------^

The first case seems to be better replaced by a literal.

For the second one, let's generate cross-references, by
spliting it in two.

Reviewed-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sound/kernel-api/writing-an-alsa-driver.rst | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/sound/kernel-api/writing-an-alsa-driver.rst b/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
index 85d6e9c643ef..73bbd59afc33 100644
--- a/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
+++ b/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
@@ -3315,8 +3315,7 @@ data and removes them from the buffer at once:
   }
 
 If you know beforehand how many bytes you can accept, you can use a
-buffer size greater than one with the
-:c:func:`snd_rawmidi_transmit\*()` functions.
+buffer size greater than one with the ``snd_rawmidi_transmit*()`` functions.
 
 The ``trigger`` callback must not sleep. If the hardware FIFO is full
 before the substream buffer has been emptied, you have to continue
@@ -3916,7 +3915,7 @@ the maximum size of the proc file access.
 
 The read/write callbacks of raw mode are more direct than the text mode.
 You need to use a low-level I/O functions such as
-:c:func:`copy_from/to_user()` to transfer the data.
+:c:func:`copy_from_user()` and :c:func:`copy_to_user()` to transfer the data.
 
 ::
 
-- 
2.26.2

