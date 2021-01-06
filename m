Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7752EC247
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Jan 2021 18:33:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6CCA016A3;
	Wed,  6 Jan 2021 18:32:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6CCA016A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609954380;
	bh=pN1xJPqtf5kg/AcOhH3OarNRrC9XbbvhtfzYDHrqyyU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IBlfK/QMkiR2sixm7G8+9XE0Q1aehhTMLUknZ1E02HgbVOyKHeqsBRSSdwuaSS+Bu
	 /V9SHWFvHC6DQifMDtgsnhdtSgtWUkOXxDFj0LrcSeODYnXWYYRh5Jf/gJwu9tmn7a
	 aOYTgzSa1Fata/Di0/dRskmqC3f2gpaKUqT0hEIc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4C92F80167;
	Wed,  6 Jan 2021 18:31:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8DC2FF80166; Wed,  6 Jan 2021 18:31:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 1542FF800FD
 for <alsa-devel@alsa-project.org>; Wed,  6 Jan 2021 18:31:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1542FF800FD
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1609954281179683924-webhooks-bot@alsa-project.org>
References: <1609954281179683924-webhooks-bot@alsa-project.org>
Subject: dmix + dshare and changes of period_size buffer_size
Message-Id: <20210106173126.8DC2FF80166@alsa1.perex.cz>
Date: Wed,  6 Jan 2021 18:31:26 +0100 (CET)
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

alsa-project/alsa-lib issue #109 was opened from pietercardoen:

Dear

I'm trying to create my audio configuration using dmix or dshare plugins but i'm facing some issues.

Currently, if I don't use dmix or dshare, I'm able to specify the period_size using aplay and changes are populated to the hardware. However if I include a dmix/dshare plugin, I'm  not able to configure the period_time anymore.

To configure dmix, one needs to specify this:
slave {			# Slave definition
  pcm STR		# slave PCM name
  # or
  pcm { }		# slave PCM definition
  format STR	# format definition
  rate INT	# rate definition
  channels INT
  period_time INT	# in usec
  # or
  period_size INT	# in frames
  buffer_time INT	# in usec
  # or
  buffer_size INT # in frames
  periods INT	# when buffer_size or buffer_time is not specified
}

Is it possible in any way to avoid the need to specify buffer_size/periods/... and to avoid the system to fall back on defaults?

Kind regards
Pieter Cardoen

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/109
Repository URL: https://github.com/alsa-project/alsa-lib
