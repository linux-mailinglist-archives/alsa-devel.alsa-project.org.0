Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1597823B74
	for <lists+alsa-devel@lfdr.de>; Mon, 20 May 2019 17:02:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 969F91657;
	Mon, 20 May 2019 17:01:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 969F91657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558364520;
	bh=cG1y6auaBcVs2loBT2o3UX++xyRUOqcLOcACGHTevXc=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gzTOAqKIxqcDNubxeTeuSdQYcg7vUhW7hMqoqYmeTtGOanERz7EkB/EEk3wUguCKa
	 83EqXzDdBbH7WTFiKrZXOwQf0OC/H1ToT+AfZApFygUyn/Qm160r/F6XIQ0ppQs8Cf
	 xHvQBwIwh8CYmXP+tx6IXPNk0K6OPjXtCPE/53mw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E608EF8961D;
	Mon, 20 May 2019 17:00:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94170F8968A; Fri, 17 May 2019 08:33:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60EFEF80759
 for <alsa-devel@alsa-project.org>; Fri, 17 May 2019 08:33:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60EFEF80759
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="kmcGs7Fu"
Received: by mail-pg1-x542.google.com with SMTP id d30so2803808pgm.7
 for <alsa-devel@alsa-project.org>; Thu, 16 May 2019 23:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=bb7Nb+AcbwIXHUOUSIxjLWvCQysIpMmSZQ55rBSyD7c=;
 b=kmcGs7FucekfoRndFFOul65z4dL19N2BqPypshL0hr0Q+9BFBRZ7Gh4vR+y/GwpGi2
 qQfNAQBWCIa0xTNp4BxRz23bTCPuumdjOM2J/xQjFnMlVrRr5G40/wPP/eXUG2J+HAvz
 6fOYeETAcc6J2V0CpIJQ0NWgYbyUOjBuUWM7bhCW610za3Y6R3yoWSjJThMluYWoN2eb
 RQgGYZ8B3sR2eXi/6mMCirwQvnNEXlB7MH99cXloqJdDzhop6ViEhd/Kberlcy9s8rDG
 g8bVQA8PduVwOFinlWsGndF7PlEEaYT5KXiHw7FfZH1Fe9g+WOx+5FOz5QczzmjapUwe
 2HWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=bb7Nb+AcbwIXHUOUSIxjLWvCQysIpMmSZQ55rBSyD7c=;
 b=JMn8CmyDKgrliv0Unj4Aj4ekwZyOMiBuKSgM0J3ZFvgkxxBFf5t5JNC+EjL/GzKnWY
 F1TkY9AC94zWA1QS6ymaO/mQZxqQ+SI5a98hgm3qWF/XIedp/BKnU4jhk+rcAhYe2CVP
 DeTubydlHcDlVIf5nbshjR3iVJ7xhq2krGIrVKrfk4MhX5rIWgmuBsUHBDDcGVTOYy96
 YCMqLY8+PrEcqT5BCUYFLm3rPxvMgD8beic5hqVOJCzjMqPw8fxer4v/REC6hOQPqaSU
 IzYwbJUHMN2Qmf3K6UN9t73NxzbzsHmj9DQwOcBhvucqrfWbitTFUjkZOig1g/5jlatC
 eE7A==
X-Gm-Message-State: APjAAAUQFXO6Ski2Sz8jkBqnBfLhb9n2E0/V2CM6MMwRgzHojvbZIorg
 HtAoJAEhTGzbpGDdSz/n/xg=
X-Google-Smtp-Source: APXvYqwbIwGH3Zd/XBNcH3jkrsyPtR2Jd9SP/u1Fma1//sQIHCTphFBe1bEEZJcz5VXI0mdZDoN0YA==
X-Received: by 2002:a63:18e:: with SMTP id 136mr26308725pgb.277.1558074825154; 
 Thu, 16 May 2019 23:33:45 -0700 (PDT)
Received: from hydra-Latitude-E5440.qualcomm.com
 (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com. [103.229.18.19])
 by smtp.gmail.com with ESMTPSA id d15sm22666897pfm.186.2019.05.16.23.33.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 16 May 2019 23:33:44 -0700 (PDT)
From: parna.naveenkumar@gmail.com
To: perex@perex.cz,
	tiwai@suse.com
Date: Fri, 17 May 2019 12:03:28 +0530
Message-Id: <20190517063328.21512-1-parna.naveenkumar@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 20 May 2019 17:00:11 +0200
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Naveen Kumar Parna <parna.naveenkumar@gmail.com>
Subject: [alsa-devel] [PATCH] sound: open brace should be on the previous
	line
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Naveen Kumar Parna <parna.naveenkumar@gmail.com>

Resolved open brace { should be on the previous line checkpatch.pl
error. While addressing this error, also corrected the affected code
for below mentioned checkpatch errors.

ERROR: spaces required around that '<' (ctx:VxV)
ERROR: spaces required around that '==' (ctx:VxV)
ERROR: space required before the open parenthesis '('

Signed-off-by: Naveen Kumar Parna <parna.naveenkumar@gmail.com>
---
 sound/sound_core.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/sound/sound_core.c b/sound/sound_core.c
index 40ad000c2e3c..ce794a2afc6b 100644
--- a/sound/sound_core.c
+++ b/sound/sound_core.c
@@ -111,8 +111,7 @@ module_exit(cleanup_soundcore);
 
 #define SOUND_STEP 16
 
-struct sound_unit
-{
+struct sound_unit {
 	int unit_minor;
 	const struct file_operations *unit_fops;
 	struct sound_unit *next;
@@ -151,8 +150,7 @@ module_param(preclaim_oss, int, 0444);
 
 static int soundcore_open(struct inode *, struct file *);
 
-static const struct file_operations soundcore_fops =
-{
+static const struct file_operations soundcore_fops = {
 	/* We must have an owner or the module locking fails */
 	.owner	= THIS_MODULE,
 	.open	= soundcore_open,
@@ -173,8 +171,7 @@ static int __sound_insert_unit(struct sound_unit * s, struct sound_unit **list,
 		while (*list && (*list)->unit_minor<n)
 			list=&((*list)->next);
 
-		while(n<top)
-		{
+		while (n < top) {
 			/* Found a hole ? */
 			if(*list==NULL || (*list)->unit_minor>n)
 				break;
@@ -219,11 +216,9 @@ static int __sound_insert_unit(struct sound_unit * s, struct sound_unit **list,
  
 static struct sound_unit *__sound_remove_unit(struct sound_unit **list, int unit)
 {
-	while(*list)
-	{
+	while (*list) {
 		struct sound_unit *p=*list;
-		if(p->unit_minor==unit)
-		{
+		if (p->unit_minor == unit) {
 			*list=p->next;
 			return p;
 		}
@@ -528,8 +523,7 @@ static struct sound_unit *__look_for_unit(int chain, int unit)
 	struct sound_unit *s;
 	
 	s=chains[chain];
-	while(s && s->unit_minor <= unit)
-	{
+	while (s && s->unit_minor <= unit) {
 		if(s->unit_minor==unit)
 			return s;
 		s=s->next;
@@ -545,8 +539,7 @@ static int soundcore_open(struct inode *inode, struct file *file)
 	const struct file_operations *new_fops = NULL;
 
 	chain=unit&0x0F;
-	if(chain==4 || chain==5)	/* dsp/audio/dsp16 */
-	{
+	if (chain == 4 || chain == 5) {	/* dsp/audio/dsp16 */
 		unit&=0xF0;
 		unit|=3;
 		chain=3;
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
