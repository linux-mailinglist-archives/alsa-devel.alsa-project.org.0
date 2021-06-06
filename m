Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B20FC39CF6F
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Jun 2021 16:01:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFE6216C9;
	Sun,  6 Jun 2021 16:00:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFE6216C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622988063;
	bh=XKRCBAP5T56B0jbpkkiQkQ+pjzRiwgzBBi9EZ2jWPH4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W1TOQhpopNhwV+f0E7SyPenHJTjmRem6uXxyfSwpYzWDcAgy0NFRR2JiYTqQCvpYD
	 l5/1P3OunJ2xQzlUd2R4gSNUzM2F7o5ce/IfkJC0FTdj6mXnG5/XQkkK8+GMFDtN1M
	 dv6hEj36KAN2GyhY27Lv3vfOgcyKrtMXE8ad150o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64151F80227;
	Sun,  6 Jun 2021 15:59:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58E0AF80218; Sun,  6 Jun 2021 15:59:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 80949F800C8
 for <alsa-devel@alsa-project.org>; Sun,  6 Jun 2021 15:59:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80949F800C8
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1622987957407522917-webhooks-bot@alsa-project.org>
References: <1622987957407522917-webhooks-bot@alsa-project.org>
Subject: a52: not compatible with recent avcodec
Message-Id: <20210606135931.58E0AF80218@alsa1.perex.cz>
Date: Sun,  6 Jun 2021 15:59:31 +0200 (CEST)
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

alsa-project/alsa-plugins issue #22 was opened from manio:

Hi!
Current a52 plugin is not compatible with recent changes in the FFmpeg lib.
The symptom is that using newest FFmpeg the a52 plugin produces silent in the speakers. During the weekend I was able to bisect the problem and shed some light on this, and here is what I found out:
1. The a52 plugin is working fine before commit: https://github.com/FFmpeg/FFmpeg/commit/93016f5d1d280f9cb7856883af287fa66affc04c
2. Above commit is wrapping avcodec_encode_audio2(), which a52 plugin is using, into new API internally inside the avcodec
3. All applications should move to new so called ["avcodec_send_frame() API"](https://ffmpeg.org/doxygen/3.4/group__lavc__encdec.html)
4. After the commit in point 1 the a52 output plugin is not working anymore

I was asking the commit author @jamrial about the commit and he said that the main culprit could rather be the commit:
https://github.com/FFmpeg/FFmpeg/commit/2d85e6e7230406e33e61d903b9c29ab562e158bd
which is changing the S16 to S32 for ac3_fixed encoder while the a52 plugin _"is ignoring the kind of format the encoder takes as input (Starting from the aforementioned commit, ac3_fixed takes S32 planar audio), and unconditionally feeding it S16 planar audio."_

I was trying to change the a52 from S16 to S32 but I think some more work is needed on this...
I was also try to change the do_encode() function from avcodec_encode_audio2 to avcodec_send_frame() with no luck...

Issue URL     : https://github.com/alsa-project/alsa-plugins/issues/22
Repository URL: https://github.com/alsa-project/alsa-plugins
