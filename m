Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B8F3D323D
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Jul 2021 05:31:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BDA716ED;
	Fri, 23 Jul 2021 05:31:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BDA716ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627011115;
	bh=OW3HVwzvJcnCkUNybqsFTlT/PEYWV8Yx9+je4Qnn8wY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZLTqeZ055/4quSUWqiw5Z+qsUYgx362FIaQd1J3bjhekbJGxAD1dXYdMSKK0PLIm1
	 eQEwIiKMNgg3jHeKcOG5Q8aRx31t4AdEhHfBtNSr9Ul5YNf1+auZgWwTEmmEKyIm0C
	 m3Dr0E6vVZmT8vEDFROkCZKzKbIT6ccSizqjBM34=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE4F5F8016C;
	Fri, 23 Jul 2021 05:30:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B367AF8016C; Fri, 23 Jul 2021 05:30:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id DA3D3F800DA
 for <alsa-devel@alsa-project.org>; Fri, 23 Jul 2021 05:30:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA3D3F800DA
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1627011009456574917-webhooks-bot@alsa-project.org>
References: <1627011009456574917-webhooks-bot@alsa-project.org>
Subject: sof-hda-dsp: Set Capture Switch on in the BootSequence
Message-Id: <20210723033024.B367AF8016C@alsa1.perex.cz>
Date: Fri, 23 Jul 2021 05:30:24 +0200 (CEST)
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

alsa-project/alsa-ucm-conf pull request #107 was opened from jason77-wang:

We found an issue that the PA source of Mic2/Headset and Mic2 is
muted by default after newly install an OS, the root cause is the
'Capture Switch' is set to off in the kernel.

Without ucm, the /usr/share/alsa/init/default will set the 'Capture
Switch' to on, similarly we set it to on in the BootSequence of ucm.

Signed-off-by: Hui Wang <hui.wang@canonical.com>

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/107
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/107.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
