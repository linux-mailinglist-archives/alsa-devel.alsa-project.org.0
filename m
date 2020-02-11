Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D773158947
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Feb 2020 05:53:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50493166E;
	Tue, 11 Feb 2020 05:53:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50493166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581396835;
	bh=prKM+0GjWc94I63kk0ihNWlXQEahsL2h84jyA0BY7Os=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UEbD819YfavXoL9lMK3gNSY+lFlvcd8ySaIrgxQL9qXUMen2S4oZ7TlBAG2q91CMB
	 IRNkojkoxUWU6tel1WBStQ0DUX8U0C4WvE+UIX+ONr9pflaFr/H9adC3JoGpGgnQiS
	 5elyP/wO+i5EBLokegIESk9LC6c+i1qOunXH2OW8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F31EFF800F0;
	Tue, 11 Feb 2020 05:52:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A5A6F80145; Tue, 11 Feb 2020 05:52:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 2CF87F8013D
 for <alsa-devel@alsa-project.org>; Tue, 11 Feb 2020 05:52:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CF87F8013D
MIME-Version: 1.0
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1581396726165577888-webhooks-bot@alsa-project.org>
References: <1581396726165577888-webhooks-bot@alsa-project.org>
Message-Id: <20200211045210.7A5A6F80145@alsa1.perex.cz>
Date: Tue, 11 Feb 2020 05:52:10 +0100 (CET)
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

alsa-project/alsa-ucm-conf pull request #12 was edited from dpward:

Remove JackHWMute, because the hardware does not forcibly shut off the internal speakers or microphone when the jack is in use.

Leave the "ADC0 Capture Switch" enabled after a capture devices is disabled. The CaptureMixerElem and CaptureMasterElem were swapped.

Correct "Handset" to "Headset". Apply maximum gain to the headset microphone ("AMIC Volume") when in use, based on testing.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/12
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/12.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
