Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E7F6772D2
	for <lists+alsa-devel@lfdr.de>; Sun, 22 Jan 2023 22:38:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A33341F7;
	Sun, 22 Jan 2023 22:37:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A33341F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674423513;
	bh=ZUIDqsXYDWng6KDCJdrB2KTu4/airR/GrI1+yJu4p2s=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=cBqUxcQrT7FmBhS+VGHaWr4O4lQWkkXI4lvXyZ42QlUEthNg0iDGGKvjAjwPPmsZA
	 pv96z8yFgtUFgJDnQ5ggd1KllGgcw2sRjKUUIhx/aCIREPgeCSTwwBnRUJtP5x1wU1
	 YFOATdkNuy3JCt1e9lQM36cpyCIrL842zuk7GwuE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CF14BF80132;
	Sun, 22 Jan 2023 22:37:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D446F803DC; Sun, 22 Jan 2023 22:37:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B852F8030F
 for <alsa-devel@alsa-project.org>; Sun, 22 Jan 2023 22:37:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B852F8030F
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=XsrsXrKI
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BBF7F60C14;
 Sun, 22 Jan 2023 21:37:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A919FC433A0;
 Sun, 22 Jan 2023 21:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674423421;
 bh=ZUIDqsXYDWng6KDCJdrB2KTu4/airR/GrI1+yJu4p2s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XsrsXrKIAUtZmAAMreBA5zeu9qGmaIvptQd7BHSUVq3oZ/dBinIaw/laDwuNGtxCk
 V8jLuMzBCJRH8j4EHUHJ7B/DhbmQPERpsNPiqYGOet2oMlXP9rfILrnX5riPIEQ/MC
 jJ4CHWE5psudgqzE936x5NsC3Mv3rYsO0ioeuBnRJdLTVTl3a4M4hYVjVkK8Pk0qfA
 Nv3yUdMwhOhdlytomyynx1raLjLjMd3TPixFv/Q/WZLWm62BfhCGibjqNlSW43C8mY
 9O0x6RnIAVlNSgLiy4AXLlb6Yxb0T21TDYwX4RGAp/h+fmj8PJeRivKq6vtb71PtQm
 ERx5nm3QuhOBQ==
From: SeongJae Park <sj@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v2 8/8] Docs/sound/index: Add missing SPDX License Identifier
Date: Sun, 22 Jan 2023 21:36:50 +0000
Message-Id: <20230122213650.187710-9-sj@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230122213650.187710-1-sj@kernel.org>
References: <20230122213650.187710-1-sj@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, SeongJae Park <sj@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add missing SPDX License Identifier for sound documentation index file.

Signed-off-by: SeongJae Park <sj@kernel.org>
---
 Documentation/sound/index.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/sound/index.rst b/Documentation/sound/index.rst
index 5abed5fc6485..7e67e12730d3 100644
--- a/Documentation/sound/index.rst
+++ b/Documentation/sound/index.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 =============================
 Sound Subsystem Documentation
 =============================
-- 
2.25.1

