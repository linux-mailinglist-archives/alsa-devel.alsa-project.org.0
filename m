Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 507182037C7
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jun 2020 15:20:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EEDD716E5;
	Mon, 22 Jun 2020 15:19:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EEDD716E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592832031;
	bh=LHZ0tA8UNHuJFyKfvqyo+ofVZWN9X7ggyGU2y1i9WKw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XEamq2/wPj9Ep5mmnJtCL+svQQfAdk99QFg/p/Dxyujxk4wEiCnS70MUecWFyHbb+
	 wXqV+cQsIyzoSX/zhpP7eg+ZDAoEwNJ4qCVc7xxeseLKQH6AmyWT/SEogEnih/ZWAi
	 egI2NLogNNUtQAzebA82WEaJyiJWP3Q3gdpOVPJc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3B59F802E8;
	Mon, 22 Jun 2020 15:16:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 140D2F802F8; Mon, 22 Jun 2020 15:16:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from jazz.pogo.org.uk (jazz.pogo.org.uk [213.138.114.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A13FAF8015A
 for <alsa-devel@alsa-project.org>; Mon, 22 Jun 2020 15:15:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A13FAF8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=pogo.org.uk header.i=@pogo.org.uk
 header.b="FglQj2Nu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pogo.org.uk
 ; s=a;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:
 Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=K7i/GaZFHcvhTiY7K+bVMkKcwiS3a1ggjaJlZurhtOs=; b=FglQj2NuzOfINuReyh81RJORWy
 l30RL250yEDDTCRN1SBrsp9bgRsaTLGSUNE9yta7Sy3p6zcdU+0Se3lfKFWmzUuc6DddE3QRLOl0Z
 ZbzxgohDIvQ3M8LayVeHHxlndgWiK1kbKKvr9Pa+fiZavr+fUxdQBw9H8NLrQ0B4WrsVUx21Rg3jC
 rff8OAqg14qwozdUMNkZuYgqB6k+l0yW4uVT8f+dNJEFYVMnVppNzdqaOjtpvO6j+Ujqw1NOz/2Vl
 5qtN8WBHLtMvrQpQ4jpgBDrWQDAUsgyqbns90T9GVwyBX0oQsXK2M6cNhgDVnM61E+jpaabzP8tI0
 vipkXoYQ==;
Received: from cpc1-hari17-2-0-cust102.20-2.cable.virginm.net ([86.18.4.103]
 helo=stax.localdomain) by jazz.pogo.org.uk with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94 (FreeBSD))
 (envelope-from <mark@xwax.org>)
 id 1jnMI7-000BwI-FB; Mon, 22 Jun 2020 14:15:15 +0100
Received: from mark by stax.localdomain with local (Exim 4.84)
 (envelope-from <mark@stax.localdomain>)
 id 1jnMI7-00065q-3S; Mon, 22 Jun 2020 14:15:15 +0100
From: Mark Hills <mark@xwax.org>
To: Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 1/9] control: Fix typos in the namehint example
Date: Mon, 22 Jun 2020 14:15:07 +0100
Message-Id: <20200622131515.23385-1-mark@xwax.org>
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

Ths "namehint" is a list, and there doesn't seem to have been any
history where the separator would be a colon.

Signed-off-by: Mark Hills <mark@xwax.org>
---
 src/control/namehint.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/src/control/namehint.c b/src/control/namehint.c
index ecd470f3..d81d3a7e 100644
--- a/src/control/namehint.c
+++ b/src/control/namehint.c
@@ -543,10 +543,10 @@ static int add_software_devices(snd_config_t *config, snd_config_t *rw_config,
  * User-defined hints are gathered from namehint.IFACE tree like:
  *
  * <code>
- * namehint.pcm {<br>
+ * namehint.pcm [<br>
  *   myfile "file:FILE=/tmp/soundwave.raw|Save sound output to /tmp/soundwave.raw"<br>
- *   myplug "plug:front:Do all conversions for front speakers"<br>
- * }
+ *   myplug "plug:front|Do all conversions for front speakers"<br>
+ * ]
  * </code>
  *
  * Note: The device description is separated with '|' char.
-- 
2.17.5

