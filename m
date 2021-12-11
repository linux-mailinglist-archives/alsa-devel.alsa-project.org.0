Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3283470FEB
	for <lists+alsa-devel@lfdr.de>; Sat, 11 Dec 2021 02:38:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59A111EE8;
	Sat, 11 Dec 2021 02:37:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59A111EE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639186700;
	bh=bLCDZrzmpCX+bwS78J9tCVo+d4n5ZbtT1Qgh+RjOlEE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=is2ueipY/AnnVbPADQi82Y+OfmekNoACR/jkDvNHj6Y/bmwp4naaRoGELv5RfIeex
	 k1axAVRD5DsO4+ImN11wiIsVIN8k2u/n+xK8O4jZ7A7S8yGspghTOt2HI2/zKrWTXc
	 0coAh2fy7pufHcS+njeYGLiJH3KXHfZaq7cS4dGU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C31D2F804ED;
	Sat, 11 Dec 2021 02:37:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3626F804EC; Sat, 11 Dec 2021 02:37:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id DE25AF804E5
 for <alsa-devel@alsa-project.org>; Sat, 11 Dec 2021 02:37:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE25AF804E5
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1639186619512762070-webhooks-bot@alsa-project.org>
References: <1639186619512762070-webhooks-bot@alsa-project.org>
Subject: Audio output not working at all on Fedora all in alsa 1.2.6
Message-Id: <20211211013708.A3626F804EC@alsa1.perex.cz>
Date: Sat, 11 Dec 2021 02:37:08 +0100 (CET)
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

alsa-project/alsa-lib issue #202 was opened from sstraightea:

After upgrading to the newest version of alsa GNOME shows me I do not have any audio input device. 
The microphone seems to still be working for me. 
Downgrading solves the problem. 
I have been able to reproduce this problem on two different machines. Just install the newest Fedora and do a normal update. 

My system: 
Fedora 35
GNOME 41.2

>From dnf info alsa-lib: 
```
Name         : alsa-lib
Version      : 1.2.6
Release      : 1.fc35
Architecture : x86_64
Size         : 1.4 M
Source       : alsa-lib-1.2.6-1.fc35.src.rpm
Repository   : @System
>From repo    : updates
```

If you need any log files, configs, output of some command I am happy to provide that, but I am not sure what information you need.

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/202
Repository URL: https://github.com/alsa-project/alsa-lib
