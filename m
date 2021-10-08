Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C516D427FE7
	for <lists+alsa-devel@lfdr.de>; Sun, 10 Oct 2021 09:52:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 620B41689;
	Sun, 10 Oct 2021 09:52:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 620B41689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633852374;
	bh=3BD8DpnbWiTDBJW7Hb/mDfGVtpYiiH0sftymSD2bGEg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TqOVQp33RjMKkPkhxzbQPGOKXPeUrQgIOprn5aydAWlv1Mj464YYaVmQMbp1Z/ijl
	 3TcwcSnny3YftZhnqOkMJVpDeooQHHI380bjR1gJhexaNQWCt/pgi4biLvP+d61o44
	 zx/EQ7jFx6IpN0nnnW+HB/Rdr+PyIPgQy5H1by4Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED337F804FE;
	Sun, 10 Oct 2021 09:49:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F28BF80246; Fri,  8 Oct 2021 06:50:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4202F800F0
 for <alsa-devel@alsa-project.org>; Fri,  8 Oct 2021 06:50:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4202F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Ovb1m3oo"
Received: by mail-pl1-x62e.google.com with SMTP id l6so5341163plh.9
 for <alsa-devel@alsa-project.org>; Thu, 07 Oct 2021 21:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=dQvWqpd/3Ixk1BH86MpPJQ+yUHdjySlHvST/lPNe1C4=;
 b=Ovb1m3ooLxAOlI2LIrwDmKVAwwXTG6aBjZAiOM+hiYh4fqDEycaymEZckvxCWQuHkN
 TnIK6ZbmLZ29EsbQtZuyfMOuNymobir8U6J+kNpyqQs+mJnr8km9Csn5eLcs/rjlRfpm
 qlWEw4nyPi0JacVXycf0T+MWz/rONcs3OXCy1jjSUcQSY4E9lAbDZYs0RjnsUnb7Q4d6
 kxtwNT1KQDDIIDwxZwDgngKYCVE3n6faSBbvlG3jwf9cg+SmZQFh32WKhDrnwdox3F04
 PL6ptx+Hq/iuPKrIWE03IGjBHr7QxYU5fZOA51qGLXtfZfdwv9s6ZWC9FPf88SI525bt
 xPtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=dQvWqpd/3Ixk1BH86MpPJQ+yUHdjySlHvST/lPNe1C4=;
 b=JugWdSvXo59C0IZ6cSZ+SG4rfOsSmDTEJw7kYUPJYgYVycbWgP9//kt9INqtboArHO
 aq055V6K7g3hO5/YL6ByuEuPjdhXo6BWAi2Q5dm5JbhZ9mvowVumeo20b2l16jn5IUUt
 kWr/IAD+Mv76cLKruRSjAQFcB/EBc9F8IYwFcxatOBJ0Blujw6dWzH/9vh2e6Aj42ySD
 BIjzmdV0j3CC1NsvxJQlFV9WZ/oVWmHrp7a84W+KV/wpbowkBSyId3z9sRVn4uCPa/AI
 l7BDK9PtXvosrebRNNmgqFbBIlyjqa8EnKUwy3xa4L4J1n6/nxKlYb4sp9ZWuNedO5j/
 YCEQ==
X-Gm-Message-State: AOAM532mBp3dr0QIeLtmX8oRJQK6YRH6qRa68N0EX/aNAFtEeP8rGzqR
 saW1DQ6fEHCPrvSNsIbvDv0=
X-Google-Smtp-Source: ABdhPJwycbw3qKJr4+vydLE2ml1mi+Dz7Kz6aNk7DU0X0uJ1eTEIvOZGy26o6/zBY3MpcJLLRx8YOA==
X-Received: by 2002:a17:90a:19d2:: with SMTP id
 18mr9715941pjj.62.1633668624447; 
 Thu, 07 Oct 2021 21:50:24 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:479:5014:1d07:e136:b921:8d67])
 by smtp.gmail.com with ESMTPSA id f4sm885182pgn.93.2021.10.07.21.50.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 07 Oct 2021 21:50:23 -0700 (PDT)
From: cy_huang <u0084500@gmail.com>
To: oder_chiou@realtek.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 robh+dt@kernel.org
Subject: [PATCH v3 0/2] ASoC: rt9120: Add Richtek RT9120 supprot
Date: Fri,  8 Oct 2021 12:50:10 +0800
Message-Id: <1633668612-25524-1-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Sun, 10 Oct 2021 09:49:29 +0200
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, cy_huang@richtek.com,
 allen_lin@richtek.com
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

From: ChiYuan Huang <cy_huang@richtek.com>

This patch series Add the Richtek RT9120 support.

In v3:
- Add dvdd regulator binding to check the dvdd voltage domain.
- Refine sdo_select_text.
- Use switch case in 'internal_power_event' function.
- Remove the volume and mute initially write in component probe.
- Remove the mute API. It's no need by HW design.

In v2:
- Add missing #sound-dai-cells property.

ChiYuan Huang (2):
  ASoC: dt-bindings: rt9120: Add initial bindings
  ASoC: rt9120: Add rt9210 audio amplifier support

 .../devicetree/bindings/sound/richtek,rt9120.yaml  |  59 +++
 sound/soc/codecs/Kconfig                           |  10 +
 sound/soc/codecs/Makefile                          |   2 +
 sound/soc/codecs/rt9120.c                          | 489 +++++++++++++++++++++
 4 files changed, 560 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/richtek,rt9120.yaml
 create mode 100644 sound/soc/codecs/rt9120.c

-- 
2.7.4

