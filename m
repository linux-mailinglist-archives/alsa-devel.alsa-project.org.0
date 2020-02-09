Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7D4156B46
	for <lists+alsa-devel@lfdr.de>; Sun,  9 Feb 2020 16:55:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31FEE16A0;
	Sun,  9 Feb 2020 16:54:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31FEE16A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581263727;
	bh=W0nSiXJaRVcsu7HDqbSUNgeG5Xk83vJEDg6PALqMpTk=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fovYP68QYGVeYXixm7qiNjH5VNi28XFyUsxfIcKsw3xqtdYzMxpIq3tGrAtfGhDTV
	 QoiwaSjTGd2YNNAsy2qekWc36CUZ5bD6HNBdu9nGuLE34R697FZEt81GA9xzF8g5FQ
	 FJRLM8tsBErIlbnQ3rFA/RRKx6AdiQiO94hAoL7k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E22DF800ED;
	Sun,  9 Feb 2020 16:53:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2CF5F80145; Sun,  9 Feb 2020 16:53:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id A2A9CF800E7
 for <alsa-devel@alsa-project.org>; Sun,  9 Feb 2020 16:53:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2A9CF800E7
MIME-Version: 1.0
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1581263609837609053-webhooks-bot@alsa-project.org>
References: <1581263609837609053-webhooks-bot@alsa-project.org>
Message-Id: <20200209155333.B2CF5F80145@alsa1.perex.cz>
Date: Sun,  9 Feb 2020 16:53:33 +0100 (CET)
Subject: [alsa-devel] broadwell-rt286: more conformance and other fixes
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #12 was opened from dpward:

Remove JackHWMute, because the hardware does not forcibly shut off
the internal speakers or microphone when the jack is in use.

Set either PlaybackPriority or CapturePriority for each device.

For capture devices, the "ADC0 Capture Switch" was never enabled.
CaptureMixerElem and CaptureMasterElem were swapped.

Correct "Handset" to "Headset". Apply maximum gain to the headset
microphone ("AMIC Volume") when in use, based on testing.

Signed-off-by: David Ward <david.ward@ll.mit.edu>

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/12
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/12.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
