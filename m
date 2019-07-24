Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B4472C31
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jul 2019 12:15:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18EF81944;
	Wed, 24 Jul 2019 12:14:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18EF81944
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563963308;
	bh=YFIBbxbmcTZ0GyizsnQBnNhZaxzTTqsaNxgvCQwdFo0=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XZFJVGpA/pkBWx3k+qB3G40uyErB2LjHhdlVKBHn9uDz7oYbagwaATWC/kmyIh514
	 o2u4Ag1ugZs8MVZnJ6v01T4NLkluY0ej/idjoydIsF+CoKMQY7LarGmXLN/7EAFDuq
	 +RltfzE0MhA4Upoyzmqky7cIXQ/eb+ByKKWgNkwk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C268F803D5;
	Wed, 24 Jul 2019 12:13:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1C5AF803D6; Wed, 24 Jul 2019 12:13:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from smtp1.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48EC0F80368;
 Wed, 24 Jul 2019 12:13:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48EC0F80368
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
 by smtp1.de.adit-jv.com (Postfix) with ESMTP id C4AB23C0585;
 Wed, 24 Jul 2019 12:13:12 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
 by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gsCj6Is2AJLq; Wed, 24 Jul 2019 12:13:06 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp1.de.adit-jv.com (Postfix) with ESMTPS id AF2963C0076;
 Wed, 24 Jul 2019 12:13:06 +0200 (CEST)
Received: from vmlxhi-082.adit-jv.com (10.72.93.164) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.439.0;
 Wed, 24 Jul 2019 12:13:06 +0200
From: Adam Miartus <amiartus@de.adit-jv.com>
To: <patch@alsa-project.org>
Date: Wed, 24 Jul 2019 12:12:58 +0200
Message-ID: <1563963180-416-1-git-send-email-amiartus@de.adit-jv.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.72.93.164]
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 0/2 v2] Open Alsa dshare without channel binding
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

The general idea of this patch is to be able to open the device without
defined bindings. As a result, it allows starting the audio clock of
underlying device without blocking a channel.

This might be useful for creating a dummy dsnoop pcm for hardware that
requires running clock early at system start. This clock is then present
even without application streaming audio data.

Patch n.1 is intended to check for null pointer of pcm callbacks,
it is not intended to alter any current functionality, properly defined
plugins should not suffer from this change

Patch n.2 is not intended to alter any current functionality, only
extend it

V2 of the patch, changes from V1:
  - instead of creating new "pcm_unsupported.c" with ops and fast_ops
    callbacks returning -ENOSYS, callback == NULL is checked directly
    in core implementation and error is returned when pcm has no
    callback defined

Adam Miartus (2):
  alsa: pcm: return -ENOSYS when ops or fast_ops callback is NULL
  alsa: dshare: allow missing bindings

 src/pcm/pcm.c        | 134 +++++++++++++++++++++++++++++++++++++++++----------
 src/pcm/pcm_dshare.c |  29 ++++++-----
 src/pcm/pcm_local.h  |  20 ++++++++
 src/pcm/pcm_mmap.c   |  15 ++++--
 src/pcm/pcm_params.c |  10 +++-
 5 files changed, 166 insertions(+), 42 deletions(-)

-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
