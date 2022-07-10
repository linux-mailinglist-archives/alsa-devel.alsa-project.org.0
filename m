Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBB956D007
	for <lists+alsa-devel@lfdr.de>; Sun, 10 Jul 2022 18:29:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C2D542;
	Sun, 10 Jul 2022 18:28:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C2D542
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657470583;
	bh=1afUwxMZ5c1fC9IvudyMafHk9q0X4r2RtT14hcUuEpk=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L/PHrqLJKzMt0HCE8D+43aMTxjYCx0RzKBEzS5Gus0SBSLy7Mmsnr9Xr6Tc2kRlcw
	 CWO32ouKSxcqca53w2i3bOwoz8hzRjyJeKdl8GgHy5RPO0nojc2yd/f72YtGCjl2XK
	 7HStYZ/uKZtMCIW5yzoiQe+2Y1CSgiZsfqWUaSbo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 086FDF8027D;
	Sun, 10 Jul 2022 18:28:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5559BF80269; Sun, 10 Jul 2022 18:28:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 1FDDFF80163
 for <alsa-devel@alsa-project.org>; Sun, 10 Jul 2022 18:28:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FDDFF80163
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1657470507988857985-webhooks-bot@alsa-project.org>
References: <1657470507988857985-webhooks-bot@alsa-project.org>
Subject: Add correct support for Rane SL-1
Message-Id: <20220710162837.5559BF80269@alsa1.perex.cz>
Date: Sun, 10 Jul 2022 18:28:37 +0200 (CEST)
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

alsa-project/alsa-ucm-conf pull request #187 was opened from christophehenry:

Following [this ticket](https://bugzilla.kernel.org/show_bug.cgi?id=216082) on kernel bugzilla, I'm trying to add corect support for [Rane SL-1](https://cdn.korn.eu/pictures/product/400/040506_3.jpg), an old USB soundcard featuring 2 stereo inputs (RCA) and 3 stereo outputs (2 RCA, 1 6.3mm jack).

Currently, `alsa-info.sh` does show the correct number of inputs and outputs But neither `pavucontrol` nor Mixxx do. I was told complex hardware should be described via UCM but the syntax is unfortunately very poorly documented so I can get my head around it and get `pavucontrol` to show all the inputs and outputs.

Here's what I have so far which, to my disappointment, does not work. If I put only 1 `SectionDevice` section in the file, I can display 1 ouput under `pavucontrol`. With 2 `SectionDevice`, nothing shows.

Without any UCM file, `pavucontrol` shows 2 outputs, 1 intputs (instead of 3) and Mixxx shows 2 outputs and not input.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/187
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/187.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
