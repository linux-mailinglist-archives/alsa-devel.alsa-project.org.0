Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3AE201959
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jun 2020 19:24:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A687167C;
	Fri, 19 Jun 2020 19:23:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A687167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592587441;
	bh=fga6MceDVJGFHbVBbatca2gOOAjJV1SWlMb+Rr8S4lk=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=e7mZCFaS3Cv2z6t8h1X+EmkMOMlqHr5iRxRkU8h8rr3OmLjizgFGGjY9V+dJabbGK
	 aYPXDveWze3XTaAsbsoD46QxDmW1UOVcd3v41l4UROlSS/Mun6ontbKX4iVEa+UHXn
	 uYlIUSr6ItbXbQ0hr/2dNQhCUWDjU4x0S6/Jo85Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF34FF80245;
	Fri, 19 Jun 2020 19:22:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08A60F80271; Fri, 19 Jun 2020 19:22:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 324C8F80245
 for <alsa-devel@alsa-project.org>; Fri, 19 Jun 2020 19:22:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 324C8F80245
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E33ADAB64
 for <alsa-devel@alsa-project.org>; Fri, 19 Jun 2020 17:22:12 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib] conf: Add /usr/etc to the default search paths
Date: Fri, 19 Jun 2020 19:22:12 +0200
Message-Id: <20200619172212.26735-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
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

There's been some recent action to move the distribution-default setup
from /etc to /usr/etc, and we should follow that, too.

This patch adds /usr/etc/alsa.conf.d and /usr/etc/alsa.conf to the
default search paths.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 src/conf/alsa.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/src/conf/alsa.conf b/src/conf/alsa.conf
index 18427ec6c4c6..aea1fe24f73c 100644
--- a/src/conf/alsa.conf
+++ b/src/conf/alsa.conf
@@ -8,6 +8,8 @@
 	{
 		func load
 		files [
+			"/usr/etc/alsa/conf.d"
+			"/usr/etc/asound.conf"
 			"/etc/alsa/conf.d"
 			"/etc/asound.conf"
 			"~/.asoundrc"
-- 
2.16.4

