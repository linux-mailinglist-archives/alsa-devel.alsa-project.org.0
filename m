Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D03218AA45
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Mar 2020 02:19:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA63C174F;
	Thu, 19 Mar 2020 02:18:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA63C174F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584580759;
	bh=B1WPfO3fpyyTSTqbl4fUqPfLDBgaa20Y+5+D/eAlINc=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eyF7Awau3qt0+8gPnIXoIB0KzwJhtr3DGokqUYhLfS7jNb/4JBfj9Kw3VesRMsSx2
	 T8M2dFJB306XqpUwNCXgQ9ozb61hFo0Y39bgyucU+YXn16BAYiH7SRSNw52iZeGlHW
	 Nn6oFvE0tl38BI6F/qMoaUkub1BkCkDvsJSgpGGk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CDF72F8015B;
	Thu, 19 Mar 2020 02:17:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C901DF80139; Thu, 19 Mar 2020 02:17:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.8 required=5.0 tests=MISSING_DATE,MISSING_MID,
 PRX_BODY_64,SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 94261F800C0
 for <alsa-devel@alsa-project.org>; Thu, 19 Mar 2020 02:17:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94261F800C0
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1584580647081017971-webhooks-bot@alsa-project.org>
References: <1584580647081017971-webhooks-bot@alsa-project.org>
Subject: Corrections for pcm_a52 to work with pulseaudio
Message-Id: <20200319011731.C901DF80139@alsa1.perex.cz>
Date: Thu, 19 Mar 2020 02:17:31 +0100 (CET)
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

alsa-project/alsa-plugins pull request #8 was edited from amotzkau:

Hi there,

First this is my first contact with ALSA programming, so please forgive me for any obvious mistakes I made.

On my computer Pulseaudio didn't work with the pcm_a52 plugin (Digital Surround 5.1 profile in Pulseaudio), everything was played with 30x speed (approximately). So I looked into the cause of this. Pulseaudio uses the zero-copy mmap interface of ALSA and expects that snd_pcm_mmap_commit() will accept all frames that snd_pcm_mmap_begin() allowed to send. If snd_pcm_mmap_commit() accepts less frames or none (-EAGAIN) then Pulseaudio didn't remember that or even saved those frames. They were just discarded.

I thought that it would be a sound contract to guarantee that snd_pcm_mmap_commit() will always take those frames. Therefore I looked into pcm_a52, why it doesn't promise that, and changed the a52_pointer() function to offer such a guarantee.

These are my patches to make it work.

Best regards,
Alex

Request URL   : https://github.com/alsa-project/alsa-plugins/pull/8
Patch URL     : https://github.com/alsa-project/alsa-plugins/pull/8.patch
Repository URL: https://github.com/alsa-project/alsa-plugins
