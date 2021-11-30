Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F817463151
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Nov 2021 11:42:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04E061FBB;
	Tue, 30 Nov 2021 11:41:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04E061FBB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638268948;
	bh=OvyDFqGcfb14+NhJl8YaPAaT/QVhbo05jVvHVYDkzSQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P6yr3lUYTRebY9En4a9zQVQT7Kb7jO++HiKxYp6nCAfNuJMPHMjesajFdRUf5Fu9i
	 Oy4WKEu/47fqODWMss/Xy03eFQ2F7wVAm/FbPqk0O6HN72p6vQH9FEew6HdSI3sluf
	 N3IxGpF3ziQ5W5DgTRbwxyV9/8LdDw5hqFQZrMYo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 719C4F800EE;
	Tue, 30 Nov 2021 11:41:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8FB3F80290; Tue, 30 Nov 2021 11:41:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 4576EF80113
 for <alsa-devel@alsa-project.org>; Tue, 30 Nov 2021 11:41:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4576EF80113
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1638268865471919060-webhooks-bot@alsa-project.org>
References: <1638268865471919060-webhooks-bot@alsa-project.org>
Subject: Channel distortion when converting S16_LE -> S32_LE ('plug' plugin)
Message-Id: <20211130104108.E8FB3F80290@alsa1.perex.cz>
Date: Tue, 30 Nov 2021 11:41:08 +0100 (CET)
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

alsa-project/alsa-lib issue #195 was opened from dh1dm:

When using a Terretec EWX2496 (ICE1712) a sample format conversion
is required in some cases as S32_LE is the only supported format.
This can be done by using the 'plug' plugin (e.g. 'plughw:0,0').
However, the left audio channel is distorted in a varying intensity,
it sounds like a resolution loss in the lower bits.
Applications with native S32_LE support (e.g. Audacity) do not show this
effect.
I'd suppose that the responsible code is in 'alsa-lib/src/pcm/pcm_plug.c',
but up to now I could not track down this issue.

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/195
Repository URL: https://github.com/alsa-project/alsa-lib
