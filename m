Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3973AB0DA
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Jun 2021 12:04:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E1251701;
	Thu, 17 Jun 2021 12:03:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E1251701
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623924243;
	bh=c5+Gb2YiwjAmqR7d5uw0KN60skSpvUGDT8d74f1w9fA=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=T98zdJVGkdGb7J7nnRUlmo623V8D+Hn7SoCpX6sC+HS16TQm5HV1oAEP14nhWxkk4
	 XRgX2ocE2kuRHqXPQo3IqYSqOasHHI02E5e7WBQJ/rj5bhqbdS8n/MpiwksWsQNkPk
	 GFgfYlGtTfwN/2gV3mWDJrZaS6QMXXD4jHiVv8GM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC313F804D2;
	Thu, 17 Jun 2021 12:01:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89A61F804CF; Thu, 17 Jun 2021 12:01:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2A4EBF80148
 for <alsa-devel@alsa-project.org>; Thu, 17 Jun 2021 12:01:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A4EBF80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="zJ62H+yu"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="zJfIcRzW"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id DE9CB219C7
 for <alsa-devel@alsa-project.org>; Thu, 17 Jun 2021 10:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623924094; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=3R/4Ws5i+Lj23TYk9eGQ6cMaPIZovda9FIVlFniQjXw=;
 b=zJ62H+yuN0dwypXdUpVPhSC8De+xJEX9wAQAwPAKgcUAVFGE6bpVlq5bGryVkDodbTQBW6
 O3SdsQTvbNW9qjj+3YuC7Mzp1jPKOyCgpIdEeM/jplgE+HOwiYkM3hrCkWPPmAsS1zI0/q
 VPNBLvhpNmRWC5gtUuZ3Q0Y309mEH3U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623924094;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=3R/4Ws5i+Lj23TYk9eGQ6cMaPIZovda9FIVlFniQjXw=;
 b=zJfIcRzWjYgY5KjHSN5HMrA7nZs+/RZxrXRhrXqP7GKqKjgsflqU708RNhWcDPTZIfOu4f
 sGwk+AnVNZn4ApCw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id CFD67A3BB7;
 Thu, 17 Jun 2021 10:01:34 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib 0/2] Allow multiple formats for PCM rate plugin
Date: Thu, 17 Jun 2021 12:01:25 +0200
Message-Id: <20210617100127.12068-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi,

this is a patch set for alsa-lib to extend the PCM rate plugin for
allowing multiple formats for its converter plugins.  This optimizes
and improves the quality (skips the unnecessary buffer and conversion)
when the converter supports the source and/or the target format
natively.

The patches for libswresample and libsamplerate will follow.


Takashi

===

Takashi Iwai (2):
  pcm: rate: Refactoring temporary buffer allocations
  pcm: rate: Improve the support multiple formats

 include/pcm_rate.h |  36 +++-
 src/pcm/pcm_rate.c | 424 +++++++++++++++++++++++++++------------------
 2 files changed, 293 insertions(+), 167 deletions(-)

-- 
2.26.2

