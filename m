Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA991563FB1
	for <lists+alsa-devel@lfdr.de>; Sat,  2 Jul 2022 13:08:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E52A615E0;
	Sat,  2 Jul 2022 13:08:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E52A615E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656760136;
	bh=Jzw0fXE90LTUqdwEmGdDANbmLnU3nO//vKmbl/WQ7m4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DtRKtjnsyJo9TZntVszmgUf1gDfoesHGtn20FGl6QO6CqOWjYetkia8+Ji6HZkKJa
	 3Hf8hsA9U9LU/k5A7cUvp4kQIE8ICVoOvnfI7wbyAS42WHHw6sWSZ1elvdLOiVPcfK
	 iAemcpcx91D1jJegCEmCo7RXBglii0eWqGUJDqHs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 51EFCF80424;
	Sat,  2 Jul 2022 13:07:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F1C4F80424; Sat,  2 Jul 2022 13:07:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15FD7F80107
 for <alsa-devel@alsa-project.org>; Sat,  2 Jul 2022 13:07:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15FD7F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="g+wAhT1D"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0162AB81DFD;
 Sat,  2 Jul 2022 11:07:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 154D1C385A2;
 Sat,  2 Jul 2022 11:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656760068;
 bh=Jzw0fXE90LTUqdwEmGdDANbmLnU3nO//vKmbl/WQ7m4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=g+wAhT1D3Vaiq9Gz6DvG6+u4eoTHxpAF8VIjCg7mDw5FvSxwI3DIlBdPU6KGUUsiA
 /aCbbIoCJupqNCTyQfLOdUmfYbl3amEm4gacdcqnedSY/s0e6KIG5O9ctaOMMwdmNE
 M2ux8LF0YzjX0cIfBs+Jyr8zIfRcSTAPvcM33lvI2KCdT1Gh5vYkczdXsUcLbPf28d
 2GU4BUscZ/Ed5qR+f9Md+4239kNfJc91dNNta2fG/LYVBLGtj3E6ve5hBs1sBEcEKo
 nsZUAXOBANwy2InfavKDJu9oSIJQTjOm1z2/4IuFVJwQFjgPFIAn4Q6JLUKCnpQp1H
 H9wYN6fu44GAQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1o7ayX-007gsI-QN;
 Sat, 02 Jul 2022 12:07:45 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH 10/12] docs: alsa: alsa-driver-api.rst: remove a kernel-doc
 file
Date: Sat,  2 Jul 2022 12:07:42 +0100
Message-Id: <3cd6b93b36b32ad6ae160931aaa00b20688e241a.1656759989.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1656759988.git.mchehab@kernel.org>
References: <cover.1656759988.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
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

This file:
	sound/core/compress_offload.c

Doesn't define any docs, as everything is inside the header
file. So, drop it, in order to remove a Sphinx warning.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/12] at: https://lore.kernel.org/all/cover.1656759988.git.mchehab@kernel.org/

 Documentation/sound/kernel-api/alsa-driver-api.rst | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/sound/kernel-api/alsa-driver-api.rst b/Documentation/sound/kernel-api/alsa-driver-api.rst
index d24c64df7069..3cf8eb4ecaf4 100644
--- a/Documentation/sound/kernel-api/alsa-driver-api.rst
+++ b/Documentation/sound/kernel-api/alsa-driver-api.rst
@@ -86,7 +86,6 @@ Compress Offload
 
 Compress Offload API
 --------------------
-.. kernel-doc:: sound/core/compress_offload.c
 .. kernel-doc:: include/uapi/sound/compress_offload.h
 .. kernel-doc:: include/uapi/sound/compress_params.h
 .. kernel-doc:: include/sound/compress_driver.h
-- 
2.36.1

