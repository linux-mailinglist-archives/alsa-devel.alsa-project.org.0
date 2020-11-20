Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD702BB242
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Nov 2020 19:17:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6DC791728;
	Fri, 20 Nov 2020 19:16:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6DC791728
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605896242;
	bh=QYf+eEclZnRa5HwARVW77K3bT/hojgGsgxeezor0fdE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qrxAnGL6VU6xHkWdPTW9wxL34VuAjlyVsRWzEkCaqY0eyQPAXRQJbo9/P/yEWAlcq
	 DlMXkbiWngSVXempjzMUqSr3RBOlezaIPsq8tgmxh79C6iXvuzh3gKrZwszdDIP4JN
	 U4bL/QnByFkpvzKTdOzvUSEJg30xxdygb4wFQ2Ic=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B829F80166;
	Fri, 20 Nov 2020 19:15:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18F6DF8016C; Fri, 20 Nov 2020 19:15:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id BDE0CF80166
 for <alsa-devel@alsa-project.org>; Fri, 20 Nov 2020 19:15:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDE0CF80166
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1605896143622390032-webhooks-bot@alsa-project.org>
References: <1605896143622390032-webhooks-bot@alsa-project.org>
Subject: Sm8250 v1
Message-Id: <20201120181548.18F6DF8016C@alsa1.perex.cz>
Date: Fri, 20 Nov 2020 19:15:48 +0100 (CET)
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

alsa-project/alsa-ucm-conf pull request #62 was opened from Srinivas-Kandagatla:

This patchset adds support to The Qualcomm Robotics RB5 Platform Audio ports.
RB5 has 2 WSA881X smart speakers attached via Soundwire, HDMI and a DMIC0 on the board.
All the audio related patches are merged in ASoC tree.

Also to note that the driver name and long card names are fixed properly on all new and old machine drivers so that we can organise the ucm2 directories correctly. That is the reason for moving sm8250 out of Qualcomm folder.
Thanks,
srini

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/62
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/62.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
