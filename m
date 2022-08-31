Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F26555A8570
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Aug 2022 20:24:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27ACF16E5;
	Wed, 31 Aug 2022 20:23:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27ACF16E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661970281;
	bh=DL1soLHbqQK3RZYV6ouLJrh1mfkV93TTvC1fjnPdb1M=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OM2RSrulA5typ+PlPyeejaAYaCfxpcRWBLDBWv+CYtkctHfYJ6LInqg4KQxxt4Eb/
	 loYo/MECezBktEm6ggaKY8RoJRKuvwuRw3T4t9cf+S4QMxd6/GP0h78JAy6ylbWbxF
	 IwYbsBE+tQB4MxI0X9badCwuzszjAowCvQSdkqzE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F2E1F80448;
	Wed, 31 Aug 2022 20:23:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A0ADF8012A; Wed, 31 Aug 2022 20:23:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 3152FF8012A
 for <alsa-devel@alsa-project.org>; Wed, 31 Aug 2022 20:23:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3152FF8012A
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1661970215632067919-webhooks-bot@alsa-project.org>
References: <1661970215632067919-webhooks-bot@alsa-project.org>
Subject: Support MSI MPG Z690 EDGE WIFI DDR4 (ALC4080)
Message-Id: <20220831182338.8A0ADF8012A@alsa1.perex.cz>
Date: Wed, 31 Aug 2022 20:23:38 +0200 (CEST)
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

alsa-project/alsa-ucm-conf issue #210 was edited from tekstryder:

Per @perexg request, filing a new issue after testing git master branch changes for the ALC4080 and finding any profile(s) to be missing/nonfunctional.   

USB ID: `0db0:1feb`   

In version 1.2.7.2 of .../ucm2/USB-Audio/Realtek/ALC4080-HiFi.conf I need to change:

- Define.SPDIFIndex "3" to Define.SPDIFIndex "2"

For proper playback via S/PDIF. After that change the release version is working great as far as I could test.

Please let me know if I can provide any other useful information.

Attaching the output of `alsaucm -c hw:2 dump text`   
Attaching the output of `pactl list sinks`

[ucm-dump.txt](https://github.com/alsa-project/alsa-ucm-conf/files/9463734/ucm-dump.txt)

[sinks.txt](https://github.com/alsa-project/alsa-ucm-conf/files/9463784/sinks.txt)

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/210
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
