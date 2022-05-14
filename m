Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE2C527F43
	for <lists+alsa-devel@lfdr.de>; Mon, 16 May 2022 10:08:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A95BD8;
	Mon, 16 May 2022 10:07:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A95BD8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652688529;
	bh=b95trXIrY+9CXxkhYFoRe5TnKYwhCf1UaETU0ut4au4=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Oapt5CjY54YQeqKtfwyTVOhLz23Mj+yP35aWn7cAH1p03okWJtyCN5xI8OdAGjsZw
	 4zh3+KpRdhpyaaUXGjM+VBpUqbHSfFoUBMEXvbNls2MWonx9CyQt496H5OMIXLrCBo
	 yTpxp+gGd5Y4j88+5gVt0TdtOob7FY5SBKbzfPVs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A61EAF8056F;
	Mon, 16 May 2022 10:04:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C1FAF80163; Sat, 14 May 2022 03:48:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.thepaulodoom.com (www.thepaulodoom.com [45.77.108.202])
 by alsa1.perex.cz (Postfix) with ESMTP id 3936FF800BB
 for <alsa-devel@alsa-project.org>; Sat, 14 May 2022 03:48:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3936FF800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (4096-bit key) header.d=thepaulodoom.com header.i=@thepaulodoom.com
 header.b="o848X1A8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thepaulodoom.com;
 s=mail; t=1652492926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=4drBsrduYyDq5E9ctWf2Hiho5x1IUZsixAHhbApmnLM=;
 b=o848X1A8X1BMnR2/sDbvCQYjOrl65v2jlY5bk98oJ8V4T3JOjDLNWw/SOQ6gFReo7wGWzu
 QMofnl53SsltcnK+G4xiLRaUqcAuK7IlgWScHKusvThDyUbz3YgMivVjYP4zZrIkPAPzaQ
 iozf+nOpKqXY8lCabjjKwlqTyR5fTdKzlK8NHjY0/Y31U6MkI/SMvRHUCxf6CeDcnNPbnf
 Yifb2otanzyMztyosNa0wwxjXOWZHIwYvqnI55Kw3LxQFDu4D+zXLusg7xWAjguARiBY4a
 AIG/ckoY/8SnjDdTjvDXO1UZ90p1HHy+IizCTMbwacohOHI1gTUOaLPKs0GaZdN4SE10iB
 iNDt5qFpesl5tOBLm6Y1wfzc4/xTmsI2F8LOMV3iEbpwzQZqk/wArcRTC7LyyZs2Qfq4Tl
 HeZjeQMOk+rzfRNbwPSq1TwbEwAMy+MoDGkYwkDjKx6sz1zCJPEdm3KolkdXnEsPGVwsmD
 pIgov2hsaTooQp/uwrPJHKMik/QNBFWoAFyC1pTZvx7qo9HLwRnRq2wgqZAIzT8+rwJ0Ih
 n6HyjeDfbPiFIIP5VigSmZmfC5IIp1ZNDXBlbiCNkKKI9lCzqSg+BHl6QEfiMBcDu/SkWc
 fhew4NXZoB5TaIZIz4J5kUB83Mv3D4LOltP2o/1aGkAq8KwenHRxA=
Received: from paul-debian-hp (c-98-240-189-147.hsd1.mn.comcast.net
 [98.240.189.147]) by vultr.guest (OpenSMTPD) with ESMTPSA id 4351477a
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Sat, 14 May 2022 01:48:46 +0000 (UTC)
Date: Fri, 13 May 2022 20:48:44 -0500
From: Paul Lemmermann <thepaulodoom@thepaulodoom.com>
To: perex@perex.cz
Subject: [PATCH] sound: sound_core: changed spaces to tabs
Message-ID: <Yn8KfFXUfWlGw+Bw@paul-debian-hp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailman-Approved-At: Mon, 16 May 2022 10:03:52 +0200
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 notify@kernel.org
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

changed spaces to tabs in sound_core.c according to kernel styling
guidelines. found using checkpatch.pl.

Signed-off-by: Paul Lemmermann <thepaulodoom@thepaulodoom.com>
---
 sound/sound_core.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/sound_core.c b/sound/sound_core.c
index 3332fe321..28bc038dc 100644
--- a/sound/sound_core.c
+++ b/sound/sound_core.c
@@ -290,7 +290,7 @@ static int sound_insert_unit(struct sound_unit **list, const struct file_operati
  *	completed the removal before their file operations become
  *	invalid.
  */
- 	
+
 static void sound_remove_unit(struct sound_unit **list, int unit)
 {
 	struct sound_unit *p;
@@ -395,12 +395,12 @@ int register_sound_special_device(const struct file_operations *fops, int unit,
 		name = "admmidi";
 		break;
 	    default:
-	    	{
+		{
 		    __unknown:
 			sprintf(_name, "unknown%d", chain);
-		    	if (unit >= SOUND_STEP)
-		    		strcat(_name, "-");
-		    	name = _name;
+			if (unit >= SOUND_STEP)
+				strcat(_name, "-");
+			name = _name;
 		}
 		break;
 	}
-- 
2.35.1

