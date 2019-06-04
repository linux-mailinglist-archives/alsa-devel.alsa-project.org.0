Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 194CE34A20
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jun 2019 16:20:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29C05165D;
	Tue,  4 Jun 2019 16:19:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29C05165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559658002;
	bh=igQke9KDTYy9lBLdX0R2CDbwlwl01CjvqZ2T4ykHofM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f9hnNJnttUcae1mpHp61UEArr7mjDXaQek6LXhHdjBvxVLMXIGOCVgFKcouuHWNpi
	 PuNAXcrBpNGYVlBoGi/NVhxKsGiR+gBZtr80PFlC7Jne3jBPQYaOjS4OPGzizYRt+6
	 BFhxejLpW/A2MS7EZIcYtXswsLouCkRKdaZOBICk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72D01F896EF;
	Tue,  4 Jun 2019 16:18:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3F13F896F7; Tue,  4 Jun 2019 16:18:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D09F9F89673
 for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2019 16:18:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D09F9F89673
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="RzbftgXf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=86CajaIHJg8+BksH0RmyeOvwTcywacFuhQ+inbaD7cg=; b=RzbftgXfci4jLwFmKSktObcGnD
 0sqBHSfkX5vBRwfmdP8/DFk1B2t9v+GQKDIovJvRP/BHg9/R3w/lrGufSbgieZO0vBVGnd4BhjRSS
 j4zbx1orJemZ/AMBUOTgQeIyDpFdxhqMUvefIo+X/vFG0V96JOpTMyYs3/IT+DXF9fgc7O66C7qb+
 nj9d1PTQRM8PTEIWVbbeUXSheB/shHKUZL2uWuOy/Cxv/shqRLZgyJXY+AnpjuoH3MSxFQ2GK2jQZ
 +LFOJAVb2V1rUUUmRgeI1D5cIol7FwbAb67iirb/U6orU1neBmUps68esTQQ+OrC4IplcG2S8ylxo
 kkK9pJnA==;
Received: from [179.182.172.34] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYAGH-0001Rq-U2; Tue, 04 Jun 2019 14:18:01 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
 (envelope-from <mchehab@bombadil.infradead.org>)
 id 1hYAGE-0002lR-Qt; Tue, 04 Jun 2019 11:17:58 -0300
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Date: Tue,  4 Jun 2019 11:17:47 -0300
Message-Id: <0ea9c284f8db3867985c410d2764a2b68e5b35c1.1559656538.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1559656538.git.mchehab+samsung@kernel.org>
References: <cover.1559656538.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab@infradead.org>,
 Vinod Koul <vkoul@kernel.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: [alsa-devel] [PATCH v2 13/22] docs: soundwire: locking: fix tags
	for a code-block
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

There's an ascii artwork at Example 1 whose code-block is not properly
idented, causing those warnings.

    Documentation/driver-api/soundwire/locking.rst:50: WARNING: Inconsistent literal block quoting.
    Documentation/driver-api/soundwire/locking.rst:51: WARNING: Line block ends without a blank line.
    Documentation/driver-api/soundwire/locking.rst:55: WARNING: Inline substitution_reference start-string without end-string.
    Documentation/driver-api/soundwire/locking.rst:56: WARNING: Line block ends without a blank line.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/driver-api/soundwire/locking.rst | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/driver-api/soundwire/locking.rst b/Documentation/driver-api/soundwire/locking.rst
index 253f73555255..3a7ffb3d87f3 100644
--- a/Documentation/driver-api/soundwire/locking.rst
+++ b/Documentation/driver-api/soundwire/locking.rst
@@ -44,7 +44,9 @@ Message transfer.
      b. Transfer message (Read/Write) to Slave1 or broadcast message on
         Bus in case of bank switch.
 
-     c. Release Message lock ::
+     c. Release Message lock
+
+     ::
 
 	+----------+                    +---------+
 	|          |                    |         |
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
