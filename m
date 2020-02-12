Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BD715A0EC
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Feb 2020 06:57:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21D68166C;
	Wed, 12 Feb 2020 06:56:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21D68166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581487047;
	bh=Yw70hAjHJYCG0rYxKxlNsnrDOAHmH0gC/52HEUSSvws=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=e3v88sFPqG6SKgVOVanYMDgHvn2cROek+0cjysUqthNtYeTgZV75e2jahUadN/jtQ
	 PgKT8I6i45UQVqXlQ7IIyzbCyNj/fz0kCr+sJvEtenCzBEdBL2zwQDrza8pBlmItPw
	 ugq11T2gF977RTndluVxXvrIyK3EoC5gapyfoix4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07341F80158;
	Wed, 12 Feb 2020 06:55:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96E7EF8014F; Wed, 12 Feb 2020 06:55:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com
 [IPv6:2607:f8b0:4864:20::74a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E047F800F0
 for <alsa-devel@alsa-project.org>; Wed, 12 Feb 2020 06:55:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E047F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="tEOI3lDb"
Received: by mail-qk1-x74a.google.com with SMTP id z1so667729qkl.15
 for <alsa-devel@alsa-project.org>; Tue, 11 Feb 2020 21:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=i3GJFghNJWgAJT5Q8U3z/189MiDHBS2gQdYNGGe6NtY=;
 b=tEOI3lDbPfJlI/TgyojqHCpjuldER2VFfw4ibEL4aMEbniWS3fHDxtfu9C3NPiVWS2
 8+naHFOzs9U/efdrYNvsSVWFXgB5fG4WARQdOtFIKV1WFaGYKhYfZNChy6K6MB9GYiyK
 62z5AvB7mPXwSsKd0D/b8SyPYnuOshTYoNYAUvu/7x/eGTm9uNndTZPNxtCidyZbQQB/
 H+4P8ElMqk0ZlffakUZ0S5qqqMRG1h/7p/ax/puzYAB4aLnGppASfn75f1ey38ZPCFa4
 XIYMf6j+QbQEO5eXg+SMi0XoS3JBekpxTdlGVyaYuhrAGmspRe4J/yHdjakx4oraCvBU
 49NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=i3GJFghNJWgAJT5Q8U3z/189MiDHBS2gQdYNGGe6NtY=;
 b=Pq/Tk8i+1o8t+G9mw+KCCjkjqNd1R2zicbQVedIwLWIMqez+9lpmIHj6FcQVOMynvC
 xeKUIrXHe1FqzAymgFUzfzEWLX05e8/sgoPfAawNXUHYgE0gXqTQpUXt7d8VahNtmWZF
 JlyUVNLY/2zxcI2vrb9QmZqm7lVTT30Kz/y9AOQjgQADTsZ2j2k86Hl+9G/Mm0xduUT7
 kkAMpSJcCmcYGxf0Ok/maJX6SqL4nV9KUtX+0hqdO3XCZk0Sd2pGgzWYKLw8su920oYY
 CY/umHO4mxsD05RnLUXkLhEawrEIMQ1yFUEzt4e2NwXvhP801XoL0y+Wd/f5dQ+9Lfj3
 yZ2Q==
X-Gm-Message-State: APjAAAXSEjwJT0LcXHkJpbT+GygleorTSIeSBsalXYfInFKlLx5UFzBI
 Pt7ifxnXiaauYKHpfMI5a/dbn3FjlAU/
X-Google-Smtp-Source: APXvYqwBNiKLy842XAPRZCFZ//s6cI4+v7kI7yrqn3P8zf6+pwNqgRWAH3Gp9L1qNbgfmYBphS6nvTvaJBeH
X-Received: by 2002:ac8:38e6:: with SMTP id g35mr18331256qtc.120.1581486933272; 
 Tue, 11 Feb 2020 21:55:33 -0800 (PST)
Date: Wed, 12 Feb 2020 13:55:15 +0800
Message-Id: <20200212055517.122728-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.0.225.g125e21ebc7-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Cc: tzungbi@google.com, alsa-devel@alsa-project.org, dgreid@google.com,
 cychiang@google.com, jiaxin.yu@mediatek.com
Subject: [alsa-devel] [PATCH 0/2] ASoC: mediatek: mt8183-da7219: add
	separate speaker switch
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

Per previous discussion[1], the patch moves control of SD_MODE from
PCM trigger to DAPM (i.e. set SD_MODE earilier if playback).

Possible drawback: may generate pop noise when BCLK=on but LRCLK=off.
As the datasheet[2] mentioned:
> Do not remove LRCLK while BCLK is present.
> Removing LRCLK while BCLK is present can cause unexpected output behavior
> including a large DC output voltage.

That is also the original purpose of sdmode-delay: to make sure SD_MODE
is the last one to be set.

[1]: https://patchwork.kernel.org/patch/11363953/
[2]: https://datasheets.maximintegrated.com/en/ds/MAX98357A-MAX98357B.pdf

Tzung-Bi Shih (2):
  ASoC: max98357a: move control of SD_MODE to DAPM
  ASoC: mediatek: mt8183-da7219: add speaker switch

 sound/soc/codecs/max98357a.c                  | 36 +++++++++----------
 .../mediatek/mt8183/mt8183-da7219-max98357.c  | 19 ++++++++++
 2 files changed, 36 insertions(+), 19 deletions(-)

-- 
2.25.0.225.g125e21ebc7-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
