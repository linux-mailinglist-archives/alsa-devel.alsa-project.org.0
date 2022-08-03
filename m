Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6201E589370
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Aug 2022 22:45:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2497A1CF;
	Wed,  3 Aug 2022 22:45:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2497A1CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659559557;
	bh=ytvAuLA2sy/pLYqSIYPE8oOyDbtcqqJPIHs4sRmNJg8=;
	h=Date:Subject:From:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=r2eGZD0CyhVWWXOjUobOUSQzAeZV59R0GsiBbUEx3zpnsWVyG+Tla0OfaTjshtmQK
	 yZ5HQkHhZerCc+0IJTxkh80pXTiujnB3pvg9FgMtRpMdWS8nBzN10ybxN7BxuaEPX8
	 EM+mc1uniSDsEuRAsGmCAudoplNMTp+KPivtw2qA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63742F8025E;
	Wed,  3 Aug 2022 22:44:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23491F80166; Wed,  3 Aug 2022 22:44:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL autolearn=disabled
 version=3.4.0
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 710B9F80166
 for <alsa-devel@alsa-project.org>; Wed,  3 Aug 2022 22:44:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 710B9F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="ob5DwtSj"
Received: by mail-yb1-xb4a.google.com with SMTP id
 bu13-20020a056902090d00b00671743601f1so14129720ybb.0
 for <alsa-devel@alsa-project.org>; Wed, 03 Aug 2022 13:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=0sKogew4m6eCnkm9Qwz368UT9tOW4WxFrPuJ/tuZBLY=;
 b=ob5DwtSjNECtxnS+HT9qoDLpsMlGuD4A/DhuB8jtbj96zm7uzCWnWlX+AiA1OUjzWU
 aqQdI6op/b1qZn2enAIscsZCDTY3DK2dPQPyYuNp/w6zUr9V3sENZuk1TSMLDGjSu1QW
 5RqZgwgK+WcrVObpOSatpr5G0sPmzOo5mil/POxat7xjWKAmVE4ULVIguXSh5npxVwus
 HSOEaImyJF9jklYeGzL/yThSRIa8f7pW2sjf65LsLL8okLaK+39bR0XwEFTjHhpwEKyb
 11Yl+p7oJaiZduYb7i+ZhCdj40d+5JQpiijRq7tHU4Rnhzo1uQudKhmcal39TM8WCoBM
 KTVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=0sKogew4m6eCnkm9Qwz368UT9tOW4WxFrPuJ/tuZBLY=;
 b=H8+jdDWh0iyi+k8L0OtKVqDkSHnSTmGJ9zzny7VU5T9Z86Ejt/O7GOURL6fIJE8TSe
 1W0fFUA/GfyRtlnW3oIiEc8Dbo0O4yasd0txvGxpPQJ4VSMGrYkoG5NkIGb2fthf82zP
 KvQSDqSdsUcJySU8gPKujjPfvPuXn+XVaQHqkYlgrkszYVqh3Bz+4Xt7iJR6jKf76hGY
 2Lrg8hh0iHmhWMnlUIX57shhLDtnwCkilowZGQp+WgLcRgFZGM7RW+p+k3JslVe/2tqT
 u3LLx8EKGMsZqVpQGy1AFk70mbNZjYDAOPxISN1YpXZJkAtBRcg/LRUl/p9caaVx0/eT
 WcNA==
X-Gm-Message-State: ACgBeo08U2p9R2X6f2R1gdoMbWTwGSsZBGu8ekBKblkagq8F/Sn39Gho
 IxVw5zOnvrsRHvXPgthcFLAkm6cRYNz1OxIUYw==
X-Google-Smtp-Source: AA6agR5swAlRAG0PoXXTtzTzeRtGlfsuTK3cgLN3STV50CkZr1FuU63M63rJYJC1oNB2Odd/8z1DQzP4Zmk5hllYvg==
X-Received: from justinstitt.mtv.corp.google.com
 ([2620:15c:211:202:1bc6:4ec2:4609:dea0])
 (user=justinstitt job=sendgmr) by 2002:a81:5ca:0:b0:31f:38d6:f59f with SMTP
 id 193-20020a8105ca000000b0031f38d6f59fmr24401528ywf.324.1659559493505; Wed,
 03 Aug 2022 13:44:53 -0700 (PDT)
Date: Wed,  3 Aug 2022 13:44:42 -0700
Message-Id: <20220803204442.2996580-1-justinstitt@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.1.455.g008518b4e5-goog
Subject: [PATCH resend] ASoC: SOF: ipc3-topology: Fix clang -Wformat warning
From: Justin Stitt <justinstitt@google.com>
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Daniel Baluta <daniel.baluta@nxp.com>, alsa-devel@alsa-project.org,
 Justin Stitt <justinstitt@google.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, linux-kernel@vger.kernel.org,
 sound-open-firmware@alsa-project.org
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

When building with Clang we encounter these warnings:
| sound/soc/sof/ipc3-topology.c:2343:4: error: format specifies type
| 'unsigned char' but the argument has type 'int' [-Werror,-Wformat]
|                  SOF_ABI_MAJOR, SOF_ABI_MINOR, SOF_ABI_PATCH);
|                  ^~~~~~~~~~~~~~~^~~~~~~~~~~~~~~^~~~~~~~~~~~~

Use correct format specifier `%d` since args are of type int.

Link: https://github.com/ClangBuiltLinux/linux/issues/378
Reported-by: Nathan Chancellor <nathan@kernel.org>
Suggested-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Note: resending with the subject corrected, this patch fixes a build
warning that will break the Clang build when CONFIG_WERROR=y.

Original patch: https://lore.kernel.org/all/20220721211218.4039288-1-justinstitt@google.com/
Reported by Nathan here: https://lore.kernel.org/all/YtmrCJjQrSbv8Aj1@dev-arch.thelio-3990X/

 sound/soc/sof/ipc3-topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/ipc3-topology.c b/sound/soc/sof/ipc3-topology.c
index b2cc046b9f60..65923e7a5976 100644
--- a/sound/soc/sof/ipc3-topology.c
+++ b/sound/soc/sof/ipc3-topology.c
@@ -2338,7 +2338,7 @@ static int sof_ipc3_parse_manifest(struct snd_soc_component *scomp, int index,
 	}
 
 	dev_info(scomp->dev,
-		 "Topology: ABI %d:%d:%d Kernel ABI %hhu:%hhu:%hhu\n",
+		 "Topology: ABI %d:%d:%d Kernel ABI %d:%d:%d\n",
 		 man->priv.data[0], man->priv.data[1], man->priv.data[2],
 		 SOF_ABI_MAJOR, SOF_ABI_MINOR, SOF_ABI_PATCH);
 
-- 
2.37.1.359.gd136c6c3e2-goog

