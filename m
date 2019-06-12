Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F52B434AE
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2019 11:30:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA62317F9;
	Thu, 13 Jun 2019 11:29:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA62317F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560418233;
	bh=ur7FFVO8+7IocqqlpYSLlRwk57PVS0kLF+uDxQdrg5c=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nIVXS2duTe5DptNBnszLqDVSCDNHFHDnZCaQIlnCaJQ6mi83TxYQdPNHMQ37BYT8m
	 9XU/VFgIKiEs4yAuAZfA52PaXeUYGXl0O4fPr8q7ljUpCLRizFlitv4VHE7ocbXOgs
	 Sl17hbfaxsV/m7Fd0HXdbLyWFT7yv4bGGMFpcJiw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7DA72F8972F;
	Thu, 13 Jun 2019 11:28:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C40FBF896E0; Thu, 13 Jun 2019 01:25:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-yw1-xc49.google.com (mail-yw1-xc49.google.com
 [IPv6:2607:f8b0:4864:20::c49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 687F1F80791
 for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2019 01:25:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 687F1F80791
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="ZX6h/m/C"
Received: by mail-yw1-xc49.google.com with SMTP id d135so11912733ywd.0
 for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2019 16:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=c4y2pZiaN2WhmN/OxTBjUr2bY3qKhiFt2vrnSnjnBeU=;
 b=ZX6h/m/Ccz3D08OR8zobi4ldZ1jS6PwWzVR/t+WFD6v0/Fss+beVWhFf3zeZ82ESbD
 JnDV0SUioVotRseLuOCQjBJLHc6Uk0pBrTXhoZGSLVaiSZdExpDDf2i2/rIyMYZlsF70
 qFSP5TrwsByiyXtw3w02BWlG1wBzSWk/vy0A0IrFOW0FYgFOCrryf7dyHBTlBJtuaKKG
 ERMoWPBQK1FwgW7tltk/GtzR+Be390NfVB6tt1uV6i3acZq1aasmD19TVthHF8qX8Rml
 6a5JDLxHclFpku0vjZ4XD/CW1AMslRend4jJ1Ln+Ot1bhEXU2bNv+/yI4qPlSB866sPf
 QLGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=c4y2pZiaN2WhmN/OxTBjUr2bY3qKhiFt2vrnSnjnBeU=;
 b=K6XA3PuexAt1/+P0/Xh7GxUK/sY44XwGNBibi7fS2uDyRtjMzD7CziIG3GcPzTbOgn
 6ZmlF7/plb+SEklzG2vbQLLEu85PKEhWBkQldriJXPSFKPAbDoU/QtoOGThlATE3CNhz
 HppUZ6mScy3Ha9MSqw00QTYFhkGi24rVrOQeEc7O7JGS1hcfbwkyJCiq5mfQlEKN/rOR
 yTd1aoHIB1fLoAFzWMh07+xrzdZL9w3cQ2s7CJiSkcn+MLQlyeC1r9llMcebptRjiw8w
 941ABoe2lNjm5crESTJc6ApuJvXCxF3QAYGP31uaSTDrPAavilg3tZgigPextIXCijgH
 VnmA==
X-Gm-Message-State: APjAAAVC+UZcRctDFQozf6gO6nSWSo3mra/bKzxy3B8mw1/WCRzSkztR
 6qc/8kkjOU816HeR2qUETH5w3RpFvg==
X-Google-Smtp-Source: APXvYqzXnzX8wpDiqygjRAk3N1+TcIw2/ksV0H9K5MlzkDv4+dJxv87avsDznM1QwBlHmYu3EINw3LGE/A==
X-Received: by 2002:a25:ef10:: with SMTP id g16mr40616532ybd.510.1560381942993; 
 Wed, 12 Jun 2019 16:25:42 -0700 (PDT)
Date: Wed, 12 Jun 2019 16:25:02 -0700
Message-Id: <20190612232502.256846-1-nhuck@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
From: Nathan Huckleberry <nhuck@google.com>
To: cernekee@chromium.org, lgirdwood@gmail.com, broonie@kernel.org, 
 perex@perex.cz, tiwai@suse.com
X-Mailman-Approved-At: Thu, 13 Jun 2019 11:27:56 +0200
Cc: clang-built-linux@googlegroups.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Nathan Huckleberry <nhuck@google.com>
Subject: [alsa-devel] [PATCH] ASoC: tas571x: Fix -Wunused-const-variable
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

Clang produces the following warning

sound/soc/codecs/tas571x.c:666:38: warning: unused variable
'tas5721_controls' [-Wunused-const-variable]

In the chip struct definition tas5711_controls is used rather than
tac5712_controls. Looks like a typo was made in the original commit.

Since tac5711_controls is identical to tas5721_controls we can just swap
them

Cc: clang-built-linux@googlegroups.com
Link: https://github.com/ClangBuiltLinux/linux/issues/522
Signed-off-by: Nathan Huckleberry <nhuck@google.com>
---
 sound/soc/codecs/tas571x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/tas571x.c b/sound/soc/codecs/tas571x.c
index 20798fa2988a..1554631cb397 100644
--- a/sound/soc/codecs/tas571x.c
+++ b/sound/soc/codecs/tas571x.c
@@ -721,8 +721,8 @@ static const struct regmap_config tas5721_regmap_config = {
 static const struct tas571x_chip tas5721_chip = {
 	.supply_names			= tas5721_supply_names,
 	.num_supply_names		= ARRAY_SIZE(tas5721_supply_names),
-	.controls			= tas5711_controls,
-	.num_controls			= ARRAY_SIZE(tas5711_controls),
+	.controls			= tas5721_controls,
+	.num_controls			= ARRAY_SIZE(tas5721_controls),
 	.regmap_config			= &tas5721_regmap_config,
 	.vol_reg_size			= 1,
 };
-- 
2.22.0.rc2.383.gf4fbbf30c2-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
