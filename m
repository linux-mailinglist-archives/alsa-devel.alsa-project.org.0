Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BE42AF7F5
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Nov 2020 19:33:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D870B1777;
	Wed, 11 Nov 2020 19:32:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D870B1777
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605119606;
	bh=WDMc2G1B2hgterHFZFY+onie5LOKYC599uTW4DaZHRs=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SEPNhlQpR9GzO32ee16BWggF/usVWmsCZ5dLGwLYMas8RjUrWFbPHOwuCSSJ6yDIA
	 gxxCNVpJx1PWFjGv9jzaEws9s5p8rRHs64Im0IT21uqOheJxpEnwfRx9LqYnE7Eruw
	 ad8VjNnrzMxZ/+Hlzcw+i36SvkUySeuq3PjVITps=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39929F8022B;
	Wed, 11 Nov 2020 19:31:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 015B2F8020C; Wed, 11 Nov 2020 19:31:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 1B570F800AE
 for <alsa-devel@alsa-project.org>; Wed, 11 Nov 2020 19:31:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B570F800AE
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1605119504853399038-webhooks-bot@alsa-project.org>
References: <1605119504853399038-webhooks-bot@alsa-project.org>
Subject: Alsa Utils + Lib 1.2.2-1ubuntu2,
 1.2.2-2.1ubuntu2.1 breaks sound on HP Envy x360 (Mint 20)
Message-Id: <20201111183152.015B2F8020C@alsa1.perex.cz>
Date: Wed, 11 Nov 2020 19:31:51 +0100 (CET)
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

alsa-project/alsa-utils issue #71 was opened from kingkode1337:

After update, sound no longer works and does not pick up my sound card. ```
Advanced Micro Devices, Inc. [AMD] Family 17h (Models 10h-1fh) HD Audio Controller
	Subsystem: Hewlett-Packard Company Family 17h (Models 10h-1fh) HD Audio 
Kernel driver in use: snd_hda_intel
	Kernel modules: snd_hda_intel

```
It now shows as a Dummy Device, under the upgrade so I have abstained from doing so.

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/71
Repository URL: https://github.com/alsa-project/alsa-utils
