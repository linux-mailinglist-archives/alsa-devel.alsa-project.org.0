Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 695C5434A11
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Oct 2021 13:30:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 680D216E8;
	Wed, 20 Oct 2021 13:30:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 680D216E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634729452;
	bh=Fz3ygdUJ934kcDuzg8knHQVm/YPyNYRvm3+6oI8rmo4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jwT3mO5+QqeCqh0GWJYYUY1ixYS9acUH3wmOinZRnL03oK4q+4nEm+vfllgc3k17T
	 3yPsxh+Hzno0koI6dSX08e1UvLipuInfJKAkmCPH7moxKKWl3PUAVf7jcRuLpMa0S3
	 mp7hfXHSgkO29FV+dTDXWFmAnaETuyBfxrTkGL7c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B65C7F800ED;
	Wed, 20 Oct 2021 13:29:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 044B8F80224; Wed, 20 Oct 2021 13:28:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 9290FF800ED
 for <alsa-devel@alsa-project.org>; Wed, 20 Oct 2021 13:28:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9290FF800ED
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1634729304180670023-webhooks-bot@alsa-project.org>
References: <1634729304180670023-webhooks-bot@alsa-project.org>
Subject: No output for AC3
Message-Id: <20211020112841.044B8F80224@alsa1.perex.cz>
Date: Wed, 20 Oct 2021 13:28:40 +0200 (CEST)
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

alsa-project/alsa-plugins issue #36 was opened from mizapf:

Sorry if this is not the proper place to ask, I'm gratefully taking any other suggestions.

I use a toslink table from my computer to a Logitech z906 system, which can decode AC3 (as proven in Windows which is installed in parallel). If I select "Digital Stereo (IEC958)", I'm getting stereo output. Also, I can play a special AC3 test file (avi) via VLC and get a proper decoding of 5.1 (obviously passed thru).

I assume that if I select "Digital Surround 5.1 (IEC958/AC3)", the A52 plugin is used. However, I get nothing but silence from the 6 speakers when I do the test, and when I try any other application. I am using pulseaudio (probably as in most installations today); I don't know whether this is important.

I thought that the A52 plugin must be configured in .asoundrc before I learned that this is already done in /etc/alsa/conf.d/60-a52-encoder.conf. Moreover, the manuals for A52 and configuration do not reveal a lot, in particular for troubleshooting.

Issue URL     : https://github.com/alsa-project/alsa-plugins/issues/36
Repository URL: https://github.com/alsa-project/alsa-plugins
