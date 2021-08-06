Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B3E3E31DD
	for <lists+alsa-devel@lfdr.de>; Sat,  7 Aug 2021 00:43:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C80E7167B;
	Sat,  7 Aug 2021 00:42:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C80E7167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628289819;
	bh=Zx1Yj4ucnS33KRgDk+UjZH0DAgNrHWdjqumj+kIKIbE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NcVp0425/a6CfKFbq2LqraXM7Vbll07TPZ9bEsRhk/hwHiFZCUMhTSVXWuKR85RQs
	 f5w0x4kJrj+a49KbJSpN1Ooh9bqB2fZpeZpeBOOiJCgy7SAb8OjkvxfDf0r4JdaiQu
	 eN5RkTyXQK0kV48kie/zCNB5a0QjIh5kIfxTP4Is=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30B36F80268;
	Sat,  7 Aug 2021 00:42:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66D74F8025F; Sat,  7 Aug 2021 00:42:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id DC336F80108
 for <alsa-devel@alsa-project.org>; Sat,  7 Aug 2021 00:42:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC336F80108
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1628289724952759027-webhooks-bot@alsa-project.org>
References: <1628289724952759027-webhooks-bot@alsa-project.org>
Subject: UCM SectionModifier doesn't like 'Comment'
Message-Id: <20210806224210.66D74F8025F@alsa1.perex.cz>
Date: Sat,  7 Aug 2021 00:42:10 +0200 (CEST)
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

alsa-project/alsa-lib issue #167 was opened from plbossart:

Adding the following patch generates a crash with alsaucm

````
alsaucm -c sof-soundwire set _verb HiFi set _enadev Headphones
alsaucm: conf.c:4355: snd_config_iterator_first: Assertion `config->type == SND_CONFIG_TYPE_COMPOUND' failed.
Aborted (core dumped)
````

````diff
diff --git a/ucm2/sof-soundwire/HiFi.conf b/ucm2/sof-soundwire/HiFi.conf
index e780ea4..fbadb65 100644
--- a/ucm2/sof-soundwire/HiFi.conf
+++ b/ucm2/sof-soundwire/HiFi.conf
@@ -29,3 +29,12 @@ If.hsdev {
 }
 
 <sof-soundwire/Hdmi.conf>
+
+SectionModifier."PlayMusic" {
+       # this works fine
+}
+
+SectionModifier."PlayRadio" {
+       # this doesn't
+       Comment "Play Radio"
+}

I am not sure if anyone ever used the SectionModifier, if it's a bug in alsa-lib or alsaucm.

SectionModifiers are part of the current proposal in PipeWire according to the documentation for "stream endpoints". https://docs.pipewire.org/page_objects_design.html 

"The available UCM modifiers for each UCM device will be added as streams, plus one "default" stream for accessing the device with no modifiers."

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/167
Repository URL: https://github.com/alsa-project/alsa-lib
