Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C4A1105B9
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Dec 2019 21:14:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CCD6166C;
	Tue,  3 Dec 2019 21:13:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CCD6166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575404047;
	bh=/ctK8Cu7XQLBslQyNz5PLBc9wGT8upG3XjmoEwnt0AQ=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tPFjMgLojw6btCRxXX4fgH6kmjvx5MGw6NVyzgCgxq/5sg5aRlwb4GqMnN443Oi87
	 lKnR4zVhqMoT6QK9yyUfPwyubqBxU+8jyEOCoe1Fm0OVDtW7MDtBn/eVugpvNrxfLE
	 6nePWlQ5kfoVRHnWnHzB+FEs382blgtcRU+VLhUA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0BD8F8015A;
	Tue,  3 Dec 2019 21:12:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74BF4F80227; Tue,  3 Dec 2019 21:12:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from anquietas.harting.hosting (anquietas.harting.hosting
 [IPv6:2a01:4f8:a0:61f7::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69FE0F800B4
 for <alsa-devel@alsa-project.org>; Tue,  3 Dec 2019 21:12:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69FE0F800B4
Authentication-Results: alsa1.perex.cz;
 dkim=fail reason="key not found in DNS" (0-bit key) header.d=idlegandalf.com
 header.i=@idlegandalf.com header.b="ITx5H7fQ"
To: alsa-devel@alsa-project.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=idlegandalf.com;
 s=mail; t=1575403936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TA+ipIojQByPfMPDmyAh6RRvgZqWlqYeeVSju2hjBO0=;
 b=ITx5H7fQFP6BmC2aSwYWJr2MM+eHLkfuAuojUZNfruqS5/hM/o6Ko94U06ef2hRVG1l/DK
 IuROy4Jq+jkuzJEt7MSHQ4NEfYNCOwPRDRJzCcwBczGX96nmLZftlbs00ah6v9gtIQCOm/
 bOQ2oEyT894qWgn0vh/enOCuIJ7yH+o=
From: Giovanni Harting <539@idlegandalf.com>
Message-ID: <822e0fa2-3075-7447-8c37-34dbe4e211b9@idlegandalf.com>
Date: Tue, 3 Dec 2019 21:12:14 +0100
MIME-Version: 1.0
Content-Language: en-GB
Subject: [alsa-devel] a52 plugin + ffmpeg with libswresample
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hello,

I'm working on restoring functionality to the a52 plugin.
ALSA build with ffmpeg without (deprecated) libavresample does not build 
this plugin, since libavresample is missing. Archlinux for example does 
not build with libavresample anymore [1], therefore a52 is missing in 
alsa-plugins builds since that change happened.

I ported rate-lav to libswresample, which seems to work well after a 
month of daily use.

The oddity is that a config file (asoundrc, [2]), that worked fine with 
alsa-lib 1.1.6, does not work with 1.1.7+. I could not find a change 
that causes this.

I traced it down to _snd_pcm_rate_open() in pcm/pcm_rate.c, where 
keywords from within pcm {} are passed into, where it fails with 
"Unknown field card" (for example).

I worked around it by filtering out all keywords [3], but that feels a 
little unclean. Is there a proper way to fix this? I'm not familiar with 
ALSA's config parsing.

I'll submit patches for both once I figured out how to fix this.

[1] https://bugs.archlinux.org/task/60586
[2]
pcm.a52 {
     @args [CARD]
     @args.CARD {
         type string
     }
     type rate
     slave {
         pcm {
             type a52
             bitrate 640
             channels 6
             card $CARD
         }
         rate 48000
         format S16_LE
     }
}

[3]
if (strcmp(id, "bitrate") == 0 || strcmp(id, "rate") == 0 || strcmp(id, 
"card") == 0 || strcmp(id, "channels") == 0 || strcmp(id, "format") == 0) {
     continue;
}
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
