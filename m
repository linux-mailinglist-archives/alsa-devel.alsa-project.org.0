Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A00615B7C6
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Feb 2020 04:31:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4459168D;
	Thu, 13 Feb 2020 04:30:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4459168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581564705;
	bh=DRvUtm41KEzUO5dUhHC6n5wpXcZyb24E/Aho6VnFhno=;
	h=Date:In-Reply-To:References:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vro70mqEG2gjWiXxXMV5pvo7eDib8FCIX3+PgH02SGitq6Xj/Cac8y3wwbE7NqfVG
	 iQc3zjRIgWvADI3yXstyblM8fr2yNwjhywX/Q4v7FR23+ALIlriPwrzPTB+wtSN2PW
	 WQJmwu5cWZkybRZyKEAMebf0gvhHXvOYglkSMG2s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB05AF8028D;
	Thu, 13 Feb 2020 04:28:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61290F8027C; Thu, 13 Feb 2020 04:28:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-qv1-xf49.google.com (mail-qv1-xf49.google.com
 [IPv6:2607:f8b0:4864:20::f49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A30C3F80277
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 04:28:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A30C3F80277
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="gUuOElcv"
Received: by mail-qv1-xf49.google.com with SMTP id dc2so2709850qvb.7
 for <alsa-devel@alsa-project.org>; Wed, 12 Feb 2020 19:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=YxsrroHX4WoK4wnjRbsIka200MhuwAMMClHApCYNJxE=;
 b=gUuOElcvztb9kTje3Rw1qFDOUqEzakzHnVMuteO/kv52iO5jYQ99NPKND6mdDLeVdT
 bnLx/wftoHIgQ6UcRRN+zMjePm/cD+3fpTDdRGdTXgObzGumUbxWu077UKu8PR1XZ/5p
 rAik3YnWo1/3ZabL+X18AMA3q352FrQ/ashqVfZxLdnG2IWMDhtDULX6gu324LRQvP1m
 oLt8LZC5CtxX/sY2gCUqmywjPi7jpoDUes99XjSxyzE17BQBY/GNQSddFJRRltRO4UZr
 i1JaZE/gNu3PtF5d43Tx1x9UKGe7+iCNe4awuQqJYafkr4Sv5/HeXG+U5J3YZMTXnIyj
 UKuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=YxsrroHX4WoK4wnjRbsIka200MhuwAMMClHApCYNJxE=;
 b=XTZvRrgfpvJpn7Z3LDCPT5I1ALYqAsTjTN30OFjdVzm8D2/GbwvjsaP4bCFmnTI1bs
 ygZCvpJMni0OxJCJoBj6nihSI87r+FzaMa93Xii9AvLQxHcfVTADZXW6ACpXCfWDxhw7
 C5DFNTukYFIvjtR5CmjmFjktTnTK2rUjObkYeysdeuEeNjtmIRdGRVMa81kmOasUwlEh
 Dj+Ro8FS+LaWcgO/EIeroiTH1t4SK0Qb8epQ7d/HgOivU0sER8fXH4sJanxHv188WbiT
 wqpxqK82lkia13heUT1Dp7e1gH0pEZx0oG9ZXKPZmJCEcdGjDHihf39XnvhDMI9gj4XY
 i4zw==
X-Gm-Message-State: APjAAAUNztWhFnhkiPI13jRazooOqm1PCXK7s9XqNAT4Synwm9QhhhlV
 5hOgRNFcna0aTv1UdEGgt3w+1bzsd1Yq
X-Google-Smtp-Source: APXvYqxknSwIuerIB61258ruOVURiB1Wnobfw7Of9qCIh4Ju3j1F+iRefyXQE35FWNQ+oByiGivoy2sys+pt
X-Received: by 2002:ac8:16ca:: with SMTP id y10mr10383973qtk.340.1581564496925; 
 Wed, 12 Feb 2020 19:28:16 -0800 (PST)
Date: Thu, 13 Feb 2020 11:27:27 +0800
In-Reply-To: <20200213032728.199462-1-tzungbi@google.com>
Message-Id: <20200213112003.3.I30f0b8c87d5ec2a0e5f1b0fabf0a8ccef374f5ea@changeid>
Mime-Version: 1.0
References: <20200213032728.199462-1-tzungbi@google.com>
X-Mailer: git-send-email 2.25.0.225.g125e21ebc7-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Cc: tzungbi@google.com, alsa-devel@alsa-project.org, dgreid@google.com,
 cychiang@google.com
Subject: [alsa-devel] [RESEND PATCH 3/4] ASoC: mediatek: mt8183-da7219:
 support TDM out and 8ch I2S out
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

Supports TDM out and 8ch I2S out.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
index d7685916a5cb..c7f766f24e44 100644
--- a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
@@ -450,6 +450,9 @@ static struct snd_soc_dai_link mt8183_da7219_max98357_dai_links[] = {
 	{
 		.name = "TDM",
 		.no_pcm = 1,
+		.dai_fmt = SND_SOC_DAIFMT_I2S |
+			   SND_SOC_DAIFMT_IB_IF |
+			   SND_SOC_DAIFMT_CBM_CFM,
 		.dpcm_playback = 1,
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = mt8183_i2s_hw_params_fixup,
-- 
2.25.0.225.g125e21ebc7-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
