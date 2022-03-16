Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCEA4DB618
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Mar 2022 17:25:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F64A1731;
	Wed, 16 Mar 2022 17:24:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F64A1731
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647447946;
	bh=+7YC5aDGwhtRWoMZUYkqX734FkNhSARdZ/rlJhGeyOo=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=En988Hu8fWpp7wFlp3ePcqKNKRrFNIS0J1BR6Nh6YOFQARxusEto8oVOHnclgye7A
	 s/A3Y0LTE6O1zbQ/++U9QioPt95Dk/4JNs0y75RwS8cy1A1CGBSvu/vpqQ+q4ZehAb
	 +E/MpQQVAvwtD4Y6utqaIUT1GI3jiIu6oaTPrOK8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BF7FF801F5;
	Wed, 16 Mar 2022 17:24:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA0C2F8019D; Wed, 16 Mar 2022 17:24:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id B7AACF80087
 for <alsa-devel@alsa-project.org>; Wed, 16 Mar 2022 17:24:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7AACF80087
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1647447872594178915-webhooks-bot@alsa-project.org>
References: <1647447872594178915-webhooks-bot@alsa-project.org>
Subject: Realtek ALC886: missing analog output sink in PulseAudio since
 alsa-ucm-conf v1.2.6
Message-Id: <20220316162436.EA0C2F8019D@alsa1.perex.cz>
Date: Wed, 16 Mar 2022 17:24:36 +0100 (CET)
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

alsa-project/alsa-ucm-conf issue #141 was opened from mbey-mw:

Running a small system with NixOS resulted in a missing analog output sink in PulseAudio after upgrading the system. When using an older version (1.2.5.1) of alsa-ucm-conf and leaving all other packets identical everything is ok again. Switching to version 1.2.6.3 brings back the missing analog audio sink in PulseAudio. Seems like something changed in alsa-ucm-conf.

[alsa-info and more for v1.2.5.1](https://gist.github.com/mbey-mw/53a1911a16277f10778df8e2ea2b8960)
[alsa-info and more for v1.2.6.3](https://gist.github.com/mbey-mw/79ecbcd564236e661b05d30212e10330)

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/141
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
