Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93521445126
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Nov 2021 10:32:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03053167D;
	Thu,  4 Nov 2021 10:31:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03053167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636018333;
	bh=eazuPM/F46s4H3v2ebLfsUhrrPzRPoGTJDyHhPBgO8A=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mBYIMZ0m7wvUyMk6cnAC39UwHLuhpYWQEACx5cOWmuh57WPBzuFH7CG1EgOKWfTny
	 yZbmZYpfWq0K+RS1ZaBLgomeOrImi+6LG4186Mpm3seEXo8YBN06Rgwqrl4vks+NCs
	 05V5z0lGFlwQRJ3aCcbnYB4sqyb8lG1PwqWrYNo0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CFD90F80224;
	Thu,  4 Nov 2021 10:31:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96B76F80229; Thu,  4 Nov 2021 10:31:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id EFC80F80125
 for <alsa-devel@alsa-project.org>; Thu,  4 Nov 2021 10:31:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EFC80F80125
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1636018273714946032-webhooks-bot@alsa-project.org>
References: <1636018273714946032-webhooks-bot@alsa-project.org>
Subject: Intel SOF HDA: Lenovo m920sff support (Realtek ALC 233)
Message-Id: <20211104093120.96B76F80229@alsa1.perex.cz>
Date: Thu,  4 Nov 2021 10:31:20 +0100 (CET)
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

alsa-project/alsa-ucm-conf issue #114 was edited from perexg:

Description: An issue with the headphone detection (Speaker/Headphone auto-mute).

More info: https://github.com/thesofproject/linux/issues/3088 and https://bugzilla.suse.com/show_bug.cgi?id=1188685

Mixer:
```
Simple mixer control 'Master',0
Simple mixer control 'Headphone',0       # Switch only
Simple mixer control 'Headphone+LO',0    # Volume only
Simple mixer control 'Speaker',0
Simple mixer control 'Front Mic',0
Simple mixer control 'Front Mic Boost',0
Simple mixer control 'Line Out',0        # Switch only
Simple mixer control 'Mic',0
Simple mixer control 'Mic Boost',0
Simple mixer control 'IEC958',0
Simple mixer control 'IEC958',1
Simple mixer control 'IEC958',2
Simple mixer control 'Capture',0
Simple mixer control 'Auto-Mute Mode',0
Simple mixer control 'Dmic0',0
Simple mixer control 'Dmic1 2nd',0
Simple mixer control 'Loopback Mixing',0
Simple mixer control 'PGA1.0 1 Master',0
Simple mixer control 'PGA2.0 2 Master',0
Simple mixer control 'PGA3.0 3 Master',0
Simple mixer control 'PGA4.0 4 Master',0
Simple mixer control 'PGA7.0 7 Master',0
Simple mixer control 'PGA8.0 8 Master',0
Simple mixer control 'PGA9.0 9 Master',0
```

Jacks:
```
name 'Mic Jack'
name 'Front Mic Jack'
name 'Line Out Jack'
name 'Front Headphone Jack'
name 'Speaker Phantom Jack'
name 'HDMI/DP,pcm=3 Jack'
name 'HDMI/DP,pcm=4 Jack'
name 'HDMI/DP,pcm=5 Jack'
```

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/114
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
