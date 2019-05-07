Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0B5161C5
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2019 12:14:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E0DC1886;
	Tue,  7 May 2019 12:13:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E0DC1886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557224081;
	bh=rmbF2nUJAOgKcWMJVsr3MzfOcicEFLIfgZW5evYENek=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kHdoo1v3ecHKXLJyHJpqZX8cIwOwXiH5kUpjlTPLjmz7gQ0o1MJzB3Y29w+b+S2w7
	 KEynxA3A/kU8uPNwv+jtvldNhJRf88ffHWN/lYACtgvOoQ2+w6I5Pg8HFnuRhWX7Ay
	 K+8Ci2UcsCopwNChjFQiseuN1PrENUzqtnaAvfL0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8EDC6F89671;
	Tue,  7 May 2019 12:12:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C963F89674; Tue,  7 May 2019 12:12:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, SPF_PASS, T_DKIMWL_WL_MED,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-yw1-xc4a.google.com (mail-yw1-xc4a.google.com
 [IPv6:2607:f8b0:4864:20::c4a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64799F89671
 for <alsa-devel@alsa-project.org>; Tue,  7 May 2019 12:12:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64799F89671
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="sAuK7ijJ"
Received: by mail-yw1-xc4a.google.com with SMTP id a70so27616363ywe.21
 for <alsa-devel@alsa-project.org>; Tue, 07 May 2019 03:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=WDoE9G2PwqfkiYm4BU59wFG6VzUDTTHStBhsHPdIFc0=;
 b=sAuK7ijJvJWorF+Xl3i7tdoo0EncoBKGSyjgqLTcU2DAhfcOcKL73lLqiWlm70H36G
 KOCqakhAB5cCsQpkrDY6vtvGqPwR7ACsjSNnhoUTBcusiVwHoRaL3v1OwJNxsRPYPNU0
 myZNilQzSFCXibLJCAdzs8ei9T01HcloZwcVzjaKY9KDJoW+eQVsFojLnRDjsn4RB/YF
 W3//5tuGcjgz+dNcri/oCYigaLzO6zcVktdrj9tG6Kw3mDFCDFbTE3HdF95v3scNmxWs
 g1BcXyLGfwufk2naga27ftMLCYphpoSYkdawu61p+WR+tjwIJXxPHSXwpsqwDQOBaM8N
 qxIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=WDoE9G2PwqfkiYm4BU59wFG6VzUDTTHStBhsHPdIFc0=;
 b=czSq1midknBM4fzaVacMyQ0UzxuWzJ1sn8XT0b8rgevu1omKOX+Hmm0R3IUbeAoIa0
 5vdAfwzIxNKeP1dYl5YLgJyR+SjdHT4xWbnbSUcXiGhxpK5p5n6SxqC5y03rfKdS+a3i
 Ys99p9yfsDCq6JEY1uri+i8/QykCCmMr3JNv7ZOgnOGY6Naj74wLY1vsDa7dv7F+LY1b
 +Li2XOy48GBJSGXhfxfDf7GwCZvbAn031HaPX9ea54FFsavlyue+zgJx8vQmNBish1H3
 0jr9/MXCBC4FBdsWc+bU04kuz8SXEqotRX+7C2KrDDrrHqbIPLSJLShH7KA6yY7xe+CB
 IbPg==
X-Gm-Message-State: APjAAAU4adjnUcgDTVVOTqcosN+yuEs8MtXDC+kWmb7zIepVO5kthUhN
 1Ac3iowVXey58Rkc5R9dCe6HkyYFWrmY
X-Google-Smtp-Source: APXvYqyc1Q/trIwbmrnrPNz5dr6NrX8zD/pA4kQ8oJfTgS2NT5fCAjbr/+hh1yuUeYngOo1gza+zhfu61GqT
X-Received: by 2002:a81:2245:: with SMTP id i66mr6651775ywi.307.1557223970333; 
 Tue, 07 May 2019 03:12:50 -0700 (PDT)
Date: Tue,  7 May 2019 18:12:17 +0800
Message-Id: <20190507101220.182466-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, tiwai@suse.com
Cc: tzungbi@google.com, alsa-devel@alsa-project.org, dgreid@google.com,
 cychiang@google.com
Subject: [alsa-devel] [PATCH 0/3] ASoC: mediatek: mt6358: fix mixer control
	issues
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

This series fixes the following mixer control related issues:
- "Headphone Volume" and "PGA Volume" have been reset after previous
  stream closed.
- Set "Headphone Volume" to the smallest value (-10dB) still get mute,
  because ramp from -10dB to -10dB is a NOP in original implementation.

"Lineout Volume" and "Handset Volume" are un-tested.  Fixing them by
applying similar logic with "Headphone Volume".

Tzung-Bi Shih (3):
  ASoC: mediatek: mt6358: initialize setting when ramping volume
  ASoC: mediatek: mt6358: save output volume for mixer controls
  ASoC: mediatek: mt6358: save PGA for mixer control

 sound/soc/codecs/mt6358.c | 131 ++++++++++++++++++++++++--------------
 1 file changed, 83 insertions(+), 48 deletions(-)

-- 
2.21.0.1020.gf2820cf01a-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
