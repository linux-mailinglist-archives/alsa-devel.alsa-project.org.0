Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD358520251
	for <lists+alsa-devel@lfdr.de>; Mon,  9 May 2022 18:25:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B8C8190E;
	Mon,  9 May 2022 18:24:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B8C8190E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652113530;
	bh=iC3L1mwdxdRv4+yqapYKlvqm98z/iTnxl7TCxRZjCrg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VuGqRj0cDSxlE3KOYKEqStjrIqBH7telx6NSTerPyXSjr4YYSHZqVIAD6YFL6fuRC
	 RUKOG4inzlRig25PkdHWRdTPOmwLqSd/3vNE4E1MhgLzVtxcnaLRBUEOfMt7+xBcea
	 H3CcXM3MnRYMh8oKmmCYbFF2PTOVtpt967lk128I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 426D6F8014C;
	Mon,  9 May 2022 18:23:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E079FF80515; Mon,  9 May 2022 18:23:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4341CF8014C
 for <alsa-devel@alsa-project.org>; Mon,  9 May 2022 18:23:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4341CF8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Lwh+hBiF"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 41A3761414;
 Mon,  9 May 2022 16:23:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CE30C385AE;
 Mon,  9 May 2022 16:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652113423;
 bh=iC3L1mwdxdRv4+yqapYKlvqm98z/iTnxl7TCxRZjCrg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Lwh+hBiFGkXkVN4r2Q1e+8TZCAw15j7jVUgfyAoUe9I/Xr+kIzFp+Lo0kv7e6RSCr
 OndQHjDXKARhmXni1Z7t3v24nNMx9PkIrY17uBfy8TO6hoepb8YR7D5f6QNR9druaI
 ADuNSRBkty0MvAuAt67PNWekCzNNGvLiQkziHUX2pdWQc4xKYDPOiY8/K1lQQSnQLX
 M4VyWca/fgTaFwUX78XaFgYhqC01rdsDe/xnzaDpPwQYjBsALRTDXc3/RrE//o6SBh
 4PLolukSm0di4QANaIqBKXxgpd0s5LLWrzZrFUsMkB1kplX6CXcfZSIoXKbmVOO2mZ
 9gKUUvOJgYqnQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1no6Ae-006xVP-FW; Mon, 09 May 2022 18:23:40 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Subject: [PATCH v6 1/4] module: drop prototype for non-existing
 __symbol_get_gpl()
Date: Mon,  9 May 2022 18:23:36 +0200
Message-Id: <5f001015990a76c0da35a4c3cf08e457ec353ab2.1652113087.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.1652113087.git.mchehab@kernel.org>
References: <cover.1652113087.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, mauro.chehab@linux.intel.com,
 David Airlie <airlied@linux.ie>, Greg KH <gregkh@linuxfoundation.org>,
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 Takashi Iwai <tiwai@suse.com>, dri-devel@lists.freedesktop.org,
 Kai Vehmanen <kai.vehmanen@intel.com>, linux-modules@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@intel.com>
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

There's no such function, and __symbol_get() is already declared
as GPL. So, this is likely a left-over.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

See [PATCH v6 0/4] at: https://lore.kernel.org/all/cover.1652113087.git.mchehab@kernel.org/

 include/linux/module.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/module.h b/include/linux/module.h
index ccfbaec82790..77961f5773b6 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -299,7 +299,6 @@ struct notifier_block;
 extern int modules_disabled; /* for sysctl */
 /* Get/put a kernel symbol (calls must be symmetric) */
 void *__symbol_get(const char *symbol);
-void *__symbol_get_gpl(const char *symbol);
 #define symbol_get(x) ((typeof(&x))(__symbol_get(__stringify(x))))
 
 /* modules using other modules: kdb wants to see this. */
-- 
2.35.3

