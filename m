Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9D8103419
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Nov 2019 07:06:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6CAB916A0;
	Wed, 20 Nov 2019 07:05:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6CAB916A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574229981;
	bh=TLir7EbzxKPU5fan+Q2ALrOph1dQSAQLh/ZG9IS35Oo=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ftjnhhw9H+j6+T4uYrIDjPI3lCgwvHCw/2rlNh4nsPgfh7cXSjFMrLFFjiqEh/qMA
	 ICK2k1Pn+5OB+BI0R7Z8pqWjN2ihV6dhGIxihFNl0JxypAZYhxwBa8sU9ckAAyE0bj
	 BIIomiyuwF8cv/i3bovMRUSygAzSwxMKEv/wOhgo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B0E9F8014D;
	Wed, 20 Nov 2019 07:03:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52012F8013E; Wed, 20 Nov 2019 07:03:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID, DKIM_VALID_AU, SPF_HELO_NONE,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com
 [IPv6:2607:f8b0:4864:20::84a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D4E9F800F0
 for <alsa-devel@alsa-project.org>; Wed, 20 Nov 2019 07:03:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D4E9F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="bLwyLz6U"
Received: by mail-qt1-x84a.google.com with SMTP id e2so16333358qtq.11
 for <alsa-devel@alsa-project.org>; Tue, 19 Nov 2019 22:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=8MYuolI8aNoMSFCP1AwyHMmHRc0NA8RsCzdbjlIuoLk=;
 b=bLwyLz6UY1a8OncKVJSh4G/20yZzwdpJQ6jT5L1AOBa1MrwW/ov0yQAHtgsTF8u4YA
 RpGFHKNHFnA9/vhKJD796r2OLPZvEO3ZUp6PITcJVE3C1r2SfmkGR4GHGgJm261RqSdw
 Zh2LDCmYOtNFynb+jh/Kdvutig2NVB4CFMMl0NDH/Wm2LanHORhabbdktE2gOkVOtAg6
 ziNJCUvk76ZkR3dg43GOHLYiyZJVB9w/QHj5BHcIQMqXIP1fQJgWoS/j6X185uY167NP
 te1BKNYNS7K8Ch0j7kUKD2jIqRFl4mI820aqZ4bjD6uIs2JVZNktFYrxgu3jHHG8jf+/
 s8Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=8MYuolI8aNoMSFCP1AwyHMmHRc0NA8RsCzdbjlIuoLk=;
 b=EuGh6o+jDMhdLQbYr/xxVc+CZhTm9MMju//flUsLGSzf0eZyObeuMxye41oLrKK44K
 noBOso6sZG7yJc9HRVWcczXZJWl/YaXCvP3MS0GTS+3wtCdlJr/JwlEdCyD4K5LqGcRV
 EV5+32lB72bu6xYmrsJzU9W0LJHdfUJ4e35F8kRtMGSd8qhcGJyUx4jG5W2uCDUh9vdV
 9HYLzxr3B9Qt4ZPOMGu3f5y7kAVf9wSNmWG7rufQr9CgyPv9TuHNZWr+S4KA7kdkctA1
 vkAq07thrZej9Pyr/QIsAL1ruEm6JOsp2egsHwwRBlZQ6UuiTnnqylSB8dj3Udp842/q
 sWsw==
X-Gm-Message-State: APjAAAUEnMz6TuY0DekfwI+LHG9kOiHcE/OpVLeawrJxfcZ+BX/4b4mo
 uoA0fDv5zMPOEWm22icPR8I2+H/yo62J
X-Google-Smtp-Source: APXvYqzNWM8KxdMNI0JnW86UN+aL7oqTPc7kUntok3h3+1m+E1TCDzxJa1Zoe/9XFQwd+U8cnSGVVleL6xKr
X-Received: by 2002:ac8:424d:: with SMTP id r13mr1049178qtm.111.1574229789647; 
 Tue, 19 Nov 2019 22:03:09 -0800 (PST)
Date: Wed, 20 Nov 2019 14:02:53 +0800
Message-Id: <20191120060256.212818-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.24.0.432.g9d3f5f5b63-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Cc: tzungbi@google.com, alsa-devel@alsa-project.org, dgreid@google.com,
 cychiang@google.com
Subject: [alsa-devel] [PATCH 0/3] ASoC: max98090: fix PLL unlocked
	workaround-related
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

Tzung-Bi Shih (3):
  ASoC: max98090: remove msleep in PLL unlocked workaround
  ASoC: max98090: exit workaround earlier if PLL is locked
  ASoC: max98090: fix possible race conditions

 sound/soc/codecs/max98090.c | 23 ++++++++++++++---------
 sound/soc/codecs/max98090.h |  1 -
 2 files changed, 14 insertions(+), 10 deletions(-)

-- 
2.24.0.432.g9d3f5f5b63-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
