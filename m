Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD003D7403
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Jul 2021 13:05:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA7091EEA;
	Tue, 27 Jul 2021 13:04:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA7091EEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627383922;
	bh=T8TbQzBd3fu42OpfPC1h9MDe5L3RhcM5YtHBVWBjby4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oDKHC2w3KEOxJGU7evb/E6N5GrIh9H0ZDA5I+UeGvs0F0inQJs8uV2AfXwo24bvwa
	 sjmk16oBqlNAHyrnuSmEYFQ264L0psY1Ee/rxnQdJnlYdwJcpeeVRqynEypUjauf9c
	 i43YPGHBQdO8ZQvT3qEPhkfSW+9MiqEP0fvRcSiM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5AA4CF80159;
	Tue, 27 Jul 2021 13:03:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B682BF8026C; Tue, 27 Jul 2021 13:03:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id B89A5F8020D
 for <alsa-devel@alsa-project.org>; Tue, 27 Jul 2021 13:03:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B89A5F8020D
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1627383820290263891-webhooks-bot@alsa-project.org>
References: <1627383820290263891-webhooks-bot@alsa-project.org>
Subject: Pulseaudio craches on start with SegFault error
Message-Id: <20210727110351.B682BF8026C@alsa1.perex.cz>
Date: Tue, 27 Jul 2021 13:03:51 +0200 (CEST)
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

alsa-project/alsa-plugins issue #31 was opened from jmtrivial:

Dear alsa-project developers,

I am using a debian (testing) on my computer, together with deb-multimedia.org repository. As some other users with external USB audio devices, I recently discovered a segfault:
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=991337
I discussed withe Christian Marillat (maintainer of the deb-multimedia repository) and we tried a couple of alsa versions, but the bug is still present if I'm using a recent libasound2-plugins such as this one:
https://www.deb-multimedia.org/tests/libasound2-plugins_1.2.2+git4219f4b-dmo1_amd64.deb
It does not crash with libasound2-plugins 1.2.2-2 from debian testing.

You will found attached the log file from pulseaudio -vvv.

[pulseaudio.log](https://github.com/alsa-project/alsa-plugins/files/6884875/pulseaudio.log)

Issue URL     : https://github.com/alsa-project/alsa-plugins/issues/31
Repository URL: https://github.com/alsa-project/alsa-plugins
