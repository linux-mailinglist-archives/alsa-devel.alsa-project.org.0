Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EDC10342C
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Nov 2019 07:10:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD4C81690;
	Wed, 20 Nov 2019 07:09:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD4C81690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574230244;
	bh=2BHr5jYsr0YsCEyQU4tOuY82YFRTHRQiCLOrBUKpexQ=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dTnWyW+mi9GLRbMz8Naad+vv+SgEaiL54XprKlf9oBTVhTNdB3p9CfUGpvGePtTe9
	 uyy6RrWOiTd5gdwI4KY6YPBNIM5vG9u7cevUwRPJOTEUWY7dPgZKZtg/x+X1+q0lZp
	 0vQGyI8d/p6qjb88CuF87YeyGjTxbD2CdEhS2Zmg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0309F800FF;
	Wed, 20 Nov 2019 07:09:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71B69F8013D; Wed, 20 Nov 2019 07:08:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com
 [IPv6:2607:f8b0:4864:20::749])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2D88F800F0
 for <alsa-devel@alsa-project.org>; Wed, 20 Nov 2019 07:08:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2D88F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="gUW5jgxO"
Received: by mail-qk1-x749.google.com with SMTP id a16so15166420qka.10
 for <alsa-devel@alsa-project.org>; Tue, 19 Nov 2019 22:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=Mh/Jzx/3XeUzJcp/939e/n749twiQJPzP7FFF2Vj0Yk=;
 b=gUW5jgxOyU4pmGrzuU1+deF0wyROHylMft6VXGMny1KNcdI1g9xYbHo663IZDMptCx
 av4vpRa6eb6DNmb5JmB3PsuL9GzeU3QPNmlvjiAdJ1RqlrhvRRMEgdqxy/xr+Tfq/gKh
 8XftprgWWw2/1eXpBf71qUu8j7oiuxx6cVwggyOfqIsHN4Or+s46niiMlBbOrfThv8Jb
 Ta+o3hKOGWzCig1aurtY4SUYEw5BbE45+rOHqwv1OnXu/Bc7Ccp04zh49p9msL12ESDS
 AIIyuOia3orTfgHw0iA8PLd7Gm/hUYuTfl6HfLe99F0p8MVTG+0ujtdEkyX49Yd5+tHR
 DCsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=Mh/Jzx/3XeUzJcp/939e/n749twiQJPzP7FFF2Vj0Yk=;
 b=PRltCpy4J7LsV2B1me5PDwcfoDdnVBaQQY7hJw8Fo3iveNQB8n/UWQJu0455e/RBhd
 zbP78zHvvbcFOfWxJ3qu4w/6v0RYpZtOGvRZ9Gdfd6aUmGD6MPVSx9nqelfYWDjyGfgi
 KhGtvxWa2iRIfuwOo01BvwgHgg1O1OKUXIXGllSPQTBJgXWVAYkW4+1scz9b3ttGMT40
 USjqf3t5jfmo/Oq5ESmN6UYZmGxuvcNGIlbQSgGFHVHuuKZf2VmZtDaR1eg07yK8mPQC
 ZLWffak9DF+8+vDl4kZu7fvBlpc6p5ZcgbuHkFCl5HAAGr7XhlYRS3jzQfmEVMUMQiwI
 qY8w==
X-Gm-Message-State: APjAAAXlqFLyUVhwGY+BtUGCbsBj9QAh3IACkFjV9AGV1AhXLadUltEn
 KV5xlPGZ8dOn5X3GUjRrwUDkeCsdZ0Co
X-Google-Smtp-Source: APXvYqxQWAVD3DehSEAZyphMnkKCO+rrAZ2GN7TdUUgAV8ysQp7MFFWuUsrEGOY3Avx5ufKC/XIEhgJA0DOp
X-Received: by 2002:ae9:ec0a:: with SMTP id h10mr902678qkg.334.1574230133348; 
 Tue, 19 Nov 2019 22:08:53 -0800 (PST)
Date: Wed, 20 Nov 2019 14:08:42 +0800
Message-Id: <20191120060844.224607-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.24.0.432.g9d3f5f5b63-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Cc: tzungbi@google.com, alsa-devel@alsa-project.org, dgreid@google.com,
 cychiang@google.com
Subject: [alsa-devel] [PATCH 0/2] ASoC: max98090: make sure SHDN is 0 when
 changing sensitive registers
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

This series is a follow up fix for the question:
https://mailman.alsa-project.org/pipermail/alsa-devel/2019-October/157364.html

This series should apply after the series:
https://mailman.alsa-project.org/pipermail/alsa-devel/2019-November/158850.html
(in terms of line numbers).

Tzung-Bi Shih (2):
  ASoC: core: add SND_SOC_BYTES_E
  ASoC: max98090: save and restore SHDN when changing sensitive
    registers

 include/sound/soc.h         |   6 +
 sound/soc/codecs/max98090.c | 433 ++++++++++++++++++++++++++----------
 sound/soc/codecs/max98090.h |   3 +-
 3 files changed, 318 insertions(+), 124 deletions(-)

-- 
2.24.0.432.g9d3f5f5b63-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
