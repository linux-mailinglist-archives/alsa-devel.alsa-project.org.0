Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC65017D08A
	for <lists+alsa-devel@lfdr.de>; Sun,  8 Mar 2020 00:19:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54A721660;
	Sun,  8 Mar 2020 00:18:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54A721660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583623151;
	bh=YGDHXYagiFWZlrWFdwsAuY4JWWfI6mAT7mrgIjHyIIA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AE5E/Lz22UuTIg+QX3P1PiqXUAblsDzOsj49IPGpWc71BxNyNh4yOK2Gpg9bXIj1O
	 pKnQDnomHDpBJxzCsPByTeqUsgDwlxrZeEKbZ5QcFbo5PoCdTxC5oznbEypV7C2jg5
	 9L6IOEyXmFoUtvJeQw/jozsjQHtJLvU9FAhVFFpM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 447BAF8012D;
	Sun,  8 Mar 2020 00:17:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 117CFF8025F; Sun,  8 Mar 2020 00:17:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 07B57F8012D
 for <alsa-devel@alsa-project.org>; Sun,  8 Mar 2020 00:17:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07B57F8012D
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1583623027269628048-webhooks-bot@alsa-project.org>
References: <1583623027269628048-webhooks-bot@alsa-project.org>
Subject: alsaucm could not open configuration
Message-Id: <20200307231711.117CFF8025F@alsa1.perex.cz>
Date: Sun,  8 Mar 2020 00:17:11 +0100 (CET)
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

alsa-project/alsa-ucm-conf issue #16 was opened from nicolasfella:

When I run `alsaucm listcards` on my system I get:
```
ALSA lib utils.c:261:(uc_mgr_config_load) could not open configuration file /usr/share/alsa/ucm2/HDA-Intel/HDA-Intel.conf  
alsaucm: error failed to get card list: No such file or directory
```
happ
My audio card is a `HDA Intel PCH`

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/16
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
