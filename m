Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80382471F59
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Dec 2021 03:37:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E7BC18AA;
	Mon, 13 Dec 2021 03:37:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E7BC18AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639363076;
	bh=EljqXRj+hm2bwvChHID/jrv9xV1NmEj9uik1axttjKM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WdkaK6j+jehhSZO7R8nhm0muKuJBNOP8+LnMgu7voyZts0ZKG1SVE/TWvBOHoyATU
	 RoyKBw88hP1Bxvh7ITRUmvi/S+OR0Ec+BXR74jVU2KPqg7QVsJjqqx0fVbHheeCSTy
	 wiV9IQx0tPHi8QDfT3y9yF/jQcpEsTwQHBmZzpIM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 627F8F80161;
	Mon, 13 Dec 2021 03:36:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6DF9F80229; Mon, 13 Dec 2021 03:36:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AA765F80161
 for <alsa-devel@alsa-project.org>; Mon, 13 Dec 2021 03:36:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA765F80161
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="d+fB4mRE"
Received: by mail-pf1-x433.google.com with SMTP id n26so13696789pff.3
 for <alsa-devel@alsa-project.org>; Sun, 12 Dec 2021 18:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0eGpjRTIP8qpbTlDU+W5IxnYYFEbazG3/WvSvG64SbY=;
 b=d+fB4mREgTBzUf4Z9dFsrcew+QdCLjO1S5SnVbfZtKQ/874Tw0pD9aZON8/hNsbBMA
 mbk3JtnGzTypSPLqHakybnBn7roMWN61Df0HjxFyxWb1KpSttOCafZxQjRsrUtKZUy9j
 oC1FSTGTyCpXrXIrF0duoKt+uh8ttPG/CWreM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0eGpjRTIP8qpbTlDU+W5IxnYYFEbazG3/WvSvG64SbY=;
 b=BYD2EdQ7Ke95XizQrWh4URaeEgr58k6FjuwFq/w0ehSf1RawTo3jnEN2ySrmpoPdqq
 vU/kQ4J/1TkBFmhiPNx7nIBjihUVHMQOKi3/lBb5PyTeJXcSVuwyN2ilYoFt3zFRdcWx
 WY+rZlDqWQ17tIHAFVPc9vyF8BAP2HkJSeczv203XrXYtjP3jOFIP7zGEy056tYe5wyx
 fZbBsE5+/rmk37IySKv88njn4wvQtjn0hRf7OxzZh5htlNZEz/WnNGMot5L+LHMrKVze
 V9SG+FbADfNopTsBYE4l56jgTTJbyaUL2HL6Zfd/cU41XQ4zsNOyWldZox46DZInXncY
 kOQQ==
X-Gm-Message-State: AOAM532H8kPy4fnyW4tSxawfYciB2BXxTHt9yYq+2RDkGHaFJmDHLLP1
 wsTr7tVMMyWpq/EviP6VjdubIQ==
X-Google-Smtp-Source: ABdhPJw42hvVIex26E9A8al5w6XIMNezym+bf8FY/TihY8Zzop3YBNQewE7sGpZXTNKtHwSxJpmsYQ==
X-Received: by 2002:a05:6a00:1744:b0:4a4:f4e6:1cc0 with SMTP id
 j4-20020a056a00174400b004a4f4e61cc0mr30856823pfc.15.1639362994108; 
 Sun, 12 Dec 2021 18:36:34 -0800 (PST)
Received: from judyhsiao-p920.tpe.corp.google.com
 ([2401:fa00:1:10:f443:6b46:47e0:4f53])
 by smtp.gmail.com with ESMTPSA id c21sm10156927pfl.138.2021.12.12.18.36.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Dec 2021 18:36:33 -0800 (PST)
From: Judy Hsiao <judyhsiao@chromium.org>
To: broonie@kernel.org
Subject: [v2] SoC: qcom: Distinguish headset codec by codec_dai->name
Date: Mon, 13 Dec 2021 10:36:26 +0800
Message-Id: <20211213023626.673323-1-judyhsiao@chromium.org>
X-Mailer: git-send-email 2.34.1.173.g76aa8bc2d0-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: judyhsiao@google.com, Banajit Goswami <bgoswami@codeaurora.org>,
 cychiang@google.com, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-arm-msm@vger.kernel.org,
 swboyd@chromium.org, dianders@chromium.org, Takashi Iwai <tiwai@suse.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Judy Hsiao <judyhsiao@chromium.org>, yuhsuan@chromium.org
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

Distinguish which headset codec is on the board by codec_dai->name
instead of card->name.

It fixes the crash of being unable to handle kernel paging requests
at virtual address ADDR by initializing the correct audio codec on
the board.

Call stack of the crash:
```
 Unable to handle kernel paging request at virtual address ffffffbfe7bba9ce
 Mem abort info:
   ESR = 0x96000005
   EC = 0x25: DABT (current EL), IL = 32 bits
   SET = 0, FnV = 0
   EA = 0, S1PTW = 0
 Data abort info:
   ISV = 0, ISS = 0x00000005
   CM = 0, WnR = 0
 swapper pgtable: 4k pages, 39-bit VAs, pgdp=000000008379a000
 [ffffffbfe7bba9ce] pgd=0000000000000000, pud=0000000000000000
 Internal error: Oops: 96000005 [#1] PREEMPT SMP
 Modules linked in: ip6table_nat fuse uvcvideo videobuf2_vmalloc [trimmed]
 CPU: 7 PID: 2168 Comm: cras Not tainted 5.4.163-lockdep-17364-gfe3d4f499cf1 #1
 Hardware name: Google Pompom (rev2) with LTE (DT)
 pstate: 00400009 (nzcv daif +PAN -UAO)
 pc : rt5682_set_component_pll+0xcc/0xb78 [snd_soc_rt5682]
 lr : rt5682_set_component_pll+0xbc/0xb78 [snd_soc_rt5682]
 sp : ffffff808ed7f320
 x29: ffffff808ed7f390 x28: dfffffd000000000
 x27: ffffff80b1409550 x26: 00000000aaaaaaaa
 x25: ffffff80d0a0b820 x24: ffffff80bc1f7098
 x23: ffffff809332a080 x22: 00000000aaaaaaaa
 x21: 1ffffff01783ee13 x20: 00000000aaaaaaaa
 x19: 00000000aaaaaaaa x18: 1ffffff011dafe18
 x17: 0000000000000000 x16: 0000000000000201
 x15: 0000000000000000 x14: 0000000062f77d15
 x13: dfffffd000000000 x12: ffffffd01302ed7c
 x11: 0000000000000000 x10: ffffff7f3ddd4e74
 x9 : 0000000000000000 x8 : 1fffffefe7bba9ce
 x7 : aaaaaaaaaaaaaaaa x6 : 0000000000000000
 x5 : 0000000000000000 x4 : 0000000000000008
 x3 : 0000000000000000 x2 : 0000000000000008
 x1 : 00000000000000aa x0 : ffffff808ed7f358
 Call trace:
  rt5682_set_component_pll+0xcc/0xb78 [snd_soc_rt5682]
  snd_soc_component_set_pll+0x90/0x154
  snd_soc_dai_set_pll+0xf4/0x1ac
  sc7180_snd_startup+0x268/0x3c0 [snd_soc_sc7180]
  snd_soc_link_startup+0xa4/0x180
  soc_pcm_open+0x35c/0x15c8
  snd_pcm_open_substream+0xa90/0x13b0
  snd_pcm_open+0x1a4/0x55c
  snd_pcm_capture_open+0x7c/0xe8
  snd_open+0x2b8/0x2e4
  chrdev_open+0x364/0x3d4
  do_dentry_open+0x66c/0xc58
  vfs_open+0x7c/0x8c
  path_openat+0x108c/0x2bbc
  do_filp_open+0x15c/0x258
  do_sys_open+0x278/0x62c
  __arm64_compat_sys_openat+0x9c/0xb0
  el0_svc_common+0x1c0/0x3dc
  el0_svc_compat_handler+0x88/0xd4
  el0_svc_compat+0x8/0x2c
 Code: 8b3acae8 910d310a d343fd48 a9012be8 (38fc6908)
```

Fixes: 425c5fce8a03 ("ASoC: qcom: Add support for ALC5682I-VS codec")
Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
---
 sound/soc/qcom/sc7180.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/sc7180.c b/sound/soc/qcom/sc7180.c
index 2fff764a00a7..37225ef2563a 100644
--- a/sound/soc/qcom/sc7180.c
+++ b/sound/soc/qcom/sc7180.c
@@ -131,13 +131,13 @@ static int sc7180_snd_startup(struct snd_pcm_substream *substream)
 	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	int pll_id, pll_source, pll_in, pll_out, clk_id, ret;
 
-	if (!(strcmp(card->name, "sc7180-rt5682-max98357a-1mic"))) {
+	if (!strcmp(codec_dai->name, "rt5682-aif1")) {
 		pll_source = RT5682_PLL1_S_MCLK;
 		pll_id = 0;
 		clk_id = RT5682_SCLK_S_PLL1;
 		pll_out = RT5682_PLL1_FREQ;
 		pll_in = DEFAULT_MCLK_RATE;
-	} else if (!(strcmp(card->name, "sc7180-rt5682s-max98357a-1mic"))) {
+	} else if (!strcmp(codec_dai->name, "rt5682s-aif1")) {
 		pll_source = RT5682S_PLL_S_MCLK;
 		pll_id = RT5682S_PLL2;
 		clk_id = RT5682S_SCLK_S_PLL2;
-- 
2.31.0

