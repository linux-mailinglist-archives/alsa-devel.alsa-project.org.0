Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1005468AC6C
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Feb 2023 22:04:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C3F883A;
	Sat,  4 Feb 2023 22:03:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C3F883A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675544650;
	bh=7oW913Ys9KZ44C0uZCF6oZCYJ11B9NUpJ+MxzFb5g58=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=ENOYRbbdM6IlNnEeLCkTCrFg3GrOPlp6BCUIxue7xpm+YbU+CtU1CPHQ61B+9uy7u
	 UcaifZd7fVBN/4Q8xjW6QrrEClTEu7GRe3Y08MwWpNGxYmUsxMwNRGpLlctehUdm2I
	 I+fT8QvyzdKsP55NlDofN87Hx6N8ZBOdYouKqqug=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 748F6F80519;
	Sat,  4 Feb 2023 22:02:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0741F804E0; Sat,  4 Feb 2023 22:02:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=DATE_IN_PAST_12_24,
 DKIM_SIGNED,DKIM_VALID,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22ADBF800E3
 for <alsa-devel@alsa-project.org>; Sat,  4 Feb 2023 22:02:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22ADBF800E3
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=igorinstitute-com.20210112.gappssmtp.com
 header.i=@igorinstitute-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=atChnery
Received: by mail-pj1-x102d.google.com with SMTP id
 on9-20020a17090b1d0900b002300a96b358so7971282pjb.1
 for <alsa-devel@alsa-project.org>; Sat, 04 Feb 2023 13:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igorinstitute-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:date:from:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hB/Qps2n5FU8gGN0b/9Pv86YkLdPOFzR3ElFkAw9ORM=;
 b=atChneryxz9wx+iwqKLunyY0KcIBDHI7/1z66hyPf0P7ZV0LY5DTPGJZFTuBhqmqJy
 TWzH6IvVwDdmq/10vk82Stlpqv0nO/8jLzJF/sgkLWN8BLol2rd5BSVmzD8nUZO6BUg1
 DbjpfdQjbs8LzpZfuA4AtTntIbo42Tw3eAtbgeF8cdF11CbJj8BpI2LC7BlrDtikkDb8
 9LvGLdsGqrHOvWv0XgSX/rRXIcg4lbwO63IjufwT2TthzNBXev7Ir3RY9F7Xd1PdO0wU
 BfGgl0gZwx0ACjJng4MkJIimZDiGVhdSfR5nFTfqNZ8lrRXCVIrkjcVOFi9o9YyewpCB
 av7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:date:from:message-id:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hB/Qps2n5FU8gGN0b/9Pv86YkLdPOFzR3ElFkAw9ORM=;
 b=Dp4DI17HahzMp7u2EojGsxZZtlZiLhurzu5uUsLslBozY5f9L3YukdJMg8gb+7fpOH
 9nIEQlgWJQhOxYt4IDPm3GvpHahjTDUn82TR8AZ3wj4zOwQtAPJqQF2/B4IwWp9fQ5rv
 QVwvNMPmLka2DTFb4oN6VkiZyUzmY4OWZeMA2NXPwxdyMVT7Wenpt47CAqlQY0dKSqIP
 AHv+gI3qdd0wgrTBI0hfN6xlRE0DfjLgERvG/6x7AjBRvCOPoJyQ4FL9tQZ4Kg6cJVu4
 TMr/Gg/sP46J7WRLSxozuYdUFZVz/1HxkwGKDCCNmTW08T+yYVVn0bclTgMXJfY6Lc3L
 Mgrw==
X-Gm-Message-State: AO0yUKX8J7IMfVS+ugVh1jMfSa8Or7p1jtR2ZVpz13RO6IKc4CkxI3qn
 NcBsfr7LqwGz2X6J0ZAzf0VmaVWP/OCX8X70
X-Google-Smtp-Source: AK7set8x0p/1l1J51gXmKbQOso8ElQ9NZOWpp7DtCrK0HX3tD1Dih79HplrtTGDQEq4hU6v5zQ2Fyw==
X-Received: by 2002:a17:902:c702:b0:196:64bf:ed86 with SMTP id
 p2-20020a170902c70200b0019664bfed86mr11994768plp.62.1675544522155; 
 Sat, 04 Feb 2023 13:02:02 -0800 (PST)
Received: from localhost ([121.99.145.49]) by smtp.gmail.com with ESMTPSA id
 p1-20020a1709027ec100b001960cccc318sm3849534plb.121.2023.02.04.13.02.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Feb 2023 13:02:01 -0800 (PST)
Message-Id: <cover.1675497326.git.daniel.beer@igorinstitute.com>
From: Daniel Beer <daniel.beer@igorinstitute.com>
Date: Sat, 4 Feb 2023 20:55:26 +1300
Subject: [PATCH v3 0/2] Two bug fixes for tas5805m codec driver
To: alsa-devel@alsa-project.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Andy Liu <andy-liu@ti.com>, Mark Brown <broonie@kernel.org>,
 Daniel Beer <daniel.beer@igorinstitute.com>, linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This pair of patches fixes two issues which crept in while revising the
original submission, at a time when I no longer had access to test
hardware.

The fixes here have been tested and verified on hardware.

Changes v2 -> v3:
  - Resubmit with cover letter

Changes v1 -> v2:
  - Fix issue reported by kernel test robot

Daniel Beer (2):
  ASoC: tas5805m: rework to avoid scheduling while atomic.
  ASoC: tas5805m: add missing page switch.

 sound/soc/codecs/tas5805m.c | 131 +++++++++++++++++++++++++-----------
 1 file changed, 90 insertions(+), 41 deletions(-)

-- 
2.38.1

