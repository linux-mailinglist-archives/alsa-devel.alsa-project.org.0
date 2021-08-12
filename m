Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD05A3EA706
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Aug 2021 17:01:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3BB841917;
	Thu, 12 Aug 2021 17:00:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3BB841917
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628780490;
	bh=aRKNoV+jtL22hZ7nue0Gh7dUJNgcz7KFLyJNcb2mGFQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AXVP3sDWr8bq6Vqylx4sxOwV+UErOVVqIQhXZs+WE8gBGV8+1Ffcs9zeZPggbQu1p
	 /djWhJqv2aXFyktSwvcfoXIk+pa+OzMutvfq3vYKy1yb/n5fxi/97CJRLJcyFGvZdq
	 e5q5xkCz/pPuV/Hfh469M3HxSyeOF2TQV7SCh0nw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94FFDF80279;
	Thu, 12 Aug 2021 17:00:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F177DF8025D; Thu, 12 Aug 2021 16:59:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id A6EEEF800AF
 for <alsa-devel@alsa-project.org>; Thu, 12 Aug 2021 16:59:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6EEEF800AF
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1628780392718550920-webhooks-bot@alsa-project.org>
References: <1628780392718550920-webhooks-bot@alsa-project.org>
Subject: pulseaudio: a52 sink doesn't stream audio from bluez source
Message-Id: <20210812145959.F177DF8025D@alsa1.perex.cz>
Date: Thu, 12 Aug 2021 16:59:59 +0200 (CEST)
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

alsa-project/alsa-plugins issue #32 was opened from quequotion:

Sorry to beat a dead horse, and double if this is in fact a pulseaudio issue.

I recently configured bluez and pulseaudio to receive streams from devices over bluetooth (eg, to play audio from a phone over the PC's speaker system).

This works when the PC's sound card is set to profiles *other than* the A52 plugin (ie, pulseaudio's provided digital stereo output and also the [DTS alsa plugin](https://github.com/darealshinji/dcaenc)).

Only when set to use the AC3 output profile, audio from the bluez source is not produced.

pavucontrol shows the bluez source is producing sound (the level bounces appropriately), but no audio comes out of the sink (no level bounce in pavucontrol either).

Any ideas?

Issue URL     : https://github.com/alsa-project/alsa-plugins/issues/32
Repository URL: https://github.com/alsa-project/alsa-plugins
