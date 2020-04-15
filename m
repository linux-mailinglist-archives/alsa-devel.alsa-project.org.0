Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5E31AAB39
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Apr 2020 17:03:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8962A950;
	Wed, 15 Apr 2020 17:02:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8962A950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586962983;
	bh=J7HEXdDp90oZCA/EXpRap9kq3sQyOa4ONYntpNLKVwg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IVCYejYEuvs45DxgnBaVlsEcc57lrjbEgJkoKgQggn6FtBc55uTIn+zyyJesRYjOk
	 MPY64tmFKKHNSYAxOh0mFZT+5gPNT3Jbe/Lj7RywyhFV2TKGwGl5POhCnJ/8DFt0gx
	 XTz/xlGqYBU9IZL+4GvhQttlLmrKHuOcg54VmRmI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2F13F802E1;
	Wed, 15 Apr 2020 16:58:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 063D6F80124; Wed, 15 Apr 2020 16:11:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C641EF80124
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 16:11:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C641EF80124
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1Md76B-1iopto2yJ9-00aCVS; Wed, 15 Apr 2020 16:10:43 +0200
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
 by mail.cetitecgmbh.com (Postfix) with ESMTP id 7C05D650ECB;
 Wed, 15 Apr 2020 14:10:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
 by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com
 [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k87RMMoqYIEv; Wed, 15 Apr 2020 16:10:42 +0200 (CEST)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
 by mail.cetitecgmbh.com (Postfix) with ESMTPS id 2A57C64C0D9;
 Wed, 15 Apr 2020 16:10:42 +0200 (CEST)
Received: from pflmmbl.corp.cetitec.com (10.8.5.60) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Wed, 15 Apr 2020 16:10:41 +0200
From: Matthias Blankertz <matthias.blankertz@cetitec.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/2] ASoC: rsnd: Fix parent SSI start/stop in multi-SSI mode
Date: Wed, 15 Apr 2020 16:10:16 +0200
Message-ID: <20200415141017.384017-2-matthias.blankertz@cetitec.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200415141017.384017-1-matthias.blankertz@cetitec.com>
References: <20200415141017.384017-1-matthias.blankertz@cetitec.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.8.5.60]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536B647460
X-Provags-ID: V03:K1:Dg6FDtPdZsmgRsmMhlYWEnuKvaX3qALipIH+tGzjN+bZlhcIpLG
 Cjm71wsq+PDb5HVHH7otRr0JdxVQxqQVAD4vQbSjTodxSb3ZxgezV7S8TNoMO7GFhyljKwK
 bfc28VW2hC2+0v8epqcVvmc0ND+s9PDElcpyYXOqmJX55YoNYFRjdX8A4nXBKacLQDL+Q+v
 5FOcztZ3beD7MT7/i3LDQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:XuLeWtvK6/Q=:nA3Lgcclveqc8WDV4TER4Y
 N6WNnNU0eLJ1AQhNnVf+SvDq9fpE6OyVTjAl0XBU4TfNf60bjJbNMaztkqQsCbTBrFs9xmvr1
 F7o66/kKj65TZMdDEMN41rrEgdXAm4QkfkuLreDnq0O4bFX5poIhvTBq7+/a6+wbNMdDbwbjz
 lqD8FPeTx7RpymGUDVYrmUG0THbC5Kd3+8AYv5Vo1mlx14eShhj/55uk2lAvf4k79KF7WT8xZ
 QfhVHmyjhqXuotHOAIhauiDjU/WDQWsia9Vidw6xyPTcr8FMyEZHWNKcDxY4+8qsMnADSjAnW
 T7naX8LpNBT6n37/mULKBXFstq4aG1vTcPkH4HPrDFCotR10jl7mNGUf+7XTEGjie3W3sUM8P
 4S9vUjh+HaeMNsW9QCtBA7/PuVB29wPaeowm02Ds1noKPsIbX9xOECUXsKIC4JCQjyR56DPzW
 nqHHAMBMYyLoPcHvJLcK2ea5UNfj1oeanHeyzgvBa5B6E6sUWF6BjtrImKdLkWADMp0cLHKqL
 GUI6LNkA3aHpqKMocXCFiEJwLp3WA5oEY/hDNdjU8nLtlCjfaDTKnwhf8stJO0s7/iC+M2/UR
 F32v5hzm4caVzWzAV6uIgOPfe23usQEpRTtZlu0V/9MfwUk0HLsH0+XSA33VV4y931XzVIck6
 +SsMX3yYEUUvZD/FPrK8S4UlDC2Xj9HTD/y6hdps2lKo6Hnp2aHGy2SyYSSwnM6BH5Cz1Lm3R
 ps/qHh7Q0Biof/0yFu2Xgbl0JfgfLHSQgQJhqmxc8IbA786EhxAra/a+bjNwkOPWcj9ogdUki
 Y/4jGpBXIE2ZCIihl0lVbV4gglu9AJnLUuexLk4WbUGMMvw9SLvWAIEzBbYH6vfa+4pTOZqOM
 TsrtSHQSbdMJR7m+Y2QQ==
X-Mailman-Approved-At: Wed, 15 Apr 2020 16:57:55 +0200
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-renesas-soc@vger.kernel.org
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

The parent SSI of a multi-SSI setup must be fully setup, started and
stopped since it is also part of the playback/capture setup. So only
skip the SSI (as per commit 203cdf51f288 ("ASoC: rsnd: SSI parent cares
SWSP bit") and commit 597b046f0d99 ("ASoC: rsnd: control SSICR::EN
correctly")) if the SSI is parent outside of a multi-SSI setup.

Signed-off-by: Matthias Blankertz <matthias.blankertz@cetitec.com>
---
 sound/soc/sh/rcar/ssi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sh/rcar/ssi.c b/sound/soc/sh/rcar/ssi.c
index fc5d089868df..d51fb3a39448 100644
--- a/sound/soc/sh/rcar/ssi.c
+++ b/sound/soc/sh/rcar/ssi.c
@@ -407,7 +407,7 @@ static void rsnd_ssi_config_init(struct rsnd_mod *mod,
 	 * We shouldn't exchange SWSP after running.
 	 * This means, parent needs to care it.
 	 */
-	if (rsnd_ssi_is_parent(mod, io))
+	if (rsnd_ssi_is_parent(mod, io) && !rsnd_ssi_multi_slaves(io))
 		goto init_end;
 
 	if (rsnd_io_is_play(io))
@@ -559,7 +559,7 @@ static int rsnd_ssi_start(struct rsnd_mod *mod,
 	 * EN is for data output.
 	 * SSI parent EN is not needed.
 	 */
-	if (rsnd_ssi_is_parent(mod, io))
+	if (rsnd_ssi_is_parent(mod, io) && !rsnd_ssi_multi_slaves(io))
 		return 0;
 
 	ssi->cr_en = EN;
@@ -582,7 +582,7 @@ static int rsnd_ssi_stop(struct rsnd_mod *mod,
 	if (!rsnd_ssi_is_run_mods(mod, io))
 		return 0;
 
-	if (rsnd_ssi_is_parent(mod, io))
+	if (rsnd_ssi_is_parent(mod, io) && !rsnd_ssi_multi_slaves(io))
 		return 0;
 
 	cr  =	ssi->cr_own	|
@@ -620,7 +620,7 @@ static int rsnd_ssi_irq(struct rsnd_mod *mod,
 	if (rsnd_is_gen1(priv))
 		return 0;
 
-	if (rsnd_ssi_is_parent(mod, io))
+	if (rsnd_ssi_is_parent(mod, io) && !rsnd_ssi_multi_slaves(io))
 		return 0;
 
 	if (!rsnd_ssi_is_run_mods(mod, io))
-- 
2.26.0

