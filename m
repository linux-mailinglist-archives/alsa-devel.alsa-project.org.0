Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A13A77756
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Jul 2019 08:48:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C3812054;
	Sat, 27 Jul 2019 08:47:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C3812054
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564210123;
	bh=gvuD6IwnuHli+B4gFxnW3Lttsk1Xff4iv01cS4wl7X8=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XcufyobfnwNofp2PD/wRWkKj7DSuEU/KZdHc5t+x1RlNs8YCvDreywerTtouaBNEW
	 WUeZq2kti2pQXMfbLe2gk2UcjzA+QAyAy7WyCYwZUa2vYKe5e8iIxebo3GTJCV1liS
	 fgxOEX7rAfvkO/ue2ES6kgmBZ2mp7ppqH6a2p0aA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B031F80506;
	Sat, 27 Jul 2019 08:43:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F3EBF803D0; Thu, 25 Jul 2019 18:17:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,SPF_HELO_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from sonic308-47.consmr.mail.sg3.yahoo.com
 (sonic308-47.consmr.mail.sg3.yahoo.com [106.10.241.237])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BEDC7F800E8
 for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2019 18:17:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEDC7F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=yahoo.co.in header.i=@yahoo.co.in
 header.b="U044OhPI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.in; s=s2048;
 t=1564071443; bh=mBMjMFekX8oT/wq6llWk+pZzBmGOJ9UEMTdL+Cminx8=;
 h=From:To:Cc:Subject:Date:From:Subject;
 b=U044OhPIx0H47dmTnefhxXFj0Y5MQZQUYJjG0aGWM8rwtaTpi1ZFh30XtPblY68Pbo5zGrWez7BFmgWqOsbdxWnWrof1HETlvE0tIkgBix8NIMEyaXhcJuNxjQPSRfeIli9NhfmnOpMe69sp2Pf9X6aAKa8Hbb0aVkqTXYG452ZQmCimSzCifTbJxpN0bR9tAgxwBKL+aYGtTYsP3JBXHnhUm1F4fmf9E5uIVp1r3AsG/tkB+QRvGoBjZsSV2NAjjDARqoEzK8lRzPpH9cmcyoVkRByIx/yQ+fbNgf4gf1ePSoJFaE5uNAcrkEzXFXJSHT0xnmSpLnKXty6T8+KGmQ==
X-YMail-OSG: IFYjrFkVM1l1ERITeT.UvbBi5HAW49Uu1Yreq6wf3vG3Zz4RZbaKR2OQywIjbn8
 2tnEcRA6KWUSctbkgOVs5pgQpx867A9x0JMQLSYjt71h3jlSlPTEj3Rw9ZdpmygRxDrTjiguITqX
 XQyFyyQtP10kD38IDcnr.nUlIFZstGNo3Nn8mK7Gl0GrN7ANkkpI6iSiH4M75eJhF5uXoNqca3Yt
 43SQg8G0K7w0M3YULuKKHm_iAHxF2M9pm8S7L6b80T_jXbfvC7Y4iIMp1yGXDW7dzCFENBNTdxQr
 4NKxA.d9eYXiZqTNW9mF2XRQi02aQfWIsx8wwSV3YOIgDvhglFAq6HveqlNQ5U9CTU.W5wIKlCmM
 RFSwGP2fjco9d_Kwuf.w68kfvby6ltZrpsFVsmR7.sfGCNVzWQUz.QEVUMaGoBaxduLaVSRFl_wJ
 pPUEAWhQmusy4qeNBbhCqZEJd4VxfLLqjgE6aI_RyYz4DK7LI9ishlJsmiAfMAfw3rn_2TG89fYX
 ONJWWnKVBFViv1x5SRwPS.H_Ddl.B8CxJETkmD5pnB8rEe2ZtEgrQnrz4d5r1.UxySBWJ4S4rBV_
 vu93KuMFh5gDffAZQtglr8nif8u32n1DSRHvo1lOUi.d7VaLQrLfqMJuEvb2ogrMLNoehca9lDog
 ECKv0ZP5HavaAYLYE6utaAeAcB4Jxr24qI64coeCbpUXTW3IIlEd7VVA06lAFnNObGceNDEVAKqM
 q5WVny7EW0VmL7KZxlbOWZf1oS3Qb5FWGNrfGyIOPLi9CX9TS29zNY1PbauaAVVdu6vN8xoxSGg0
 ZPHJGgTEaDNFdginklUnz7sHvA3JOCqYR9i6youRpDOqzH5x.WzGG__.bHliEWF_m5glzPxsFlOQ
 ZuiA8GhxU31OqUYN2hYbbwqWkB2LHNohPDvTp1cg6_mARqg9b80k_tefLy6CqsG0Bgiv0pMssExr
 SZS25GPwu9EmlIZ1pcqGhsAuMA0NTL9ccihfLJ6JIJ7XAAXslKINe8SDGQegp9Wyi3wTJ23A_DN4
 lUTEN1KIGykyLQ9rnYpbkO18EX83wKY99IkJRNVb.XBoqi6eRmfM8ANKiqCAxZvhz3tn4CglJoqT
 UGzs.EtjH9CeMwTkZ06x..GmZJPILB27R0uoyqPjdcijvBfkeprsW7.kxOLtG_aUd.GKeVcaMNEW
 1Z9.lvwJPmeNywwHa.E93vZA6RQfhiVjos3TedGfOJjWlW16fh4zl3P2oAG4iOQ8i7_i2roFKfDA
 42rPYvEi3UZ0MiRB2yhxor9gYFzSUbrrqjBhNHS8J_Bw31jyOfVmSS7Vwu7o-
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic308.consmr.mail.sg3.yahoo.com with HTTP; Thu, 25 Jul 2019 16:17:23 +0000
Received: by smtp403.mail.sg3.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
 ID 839729be7fe48bb1f76cfabaa341db74; 
 Thu, 25 Jul 2019 16:15:22 +0000 (UTC)
From: Satendra Singh Thakur <thakursatendra2003@yahoo.co.in>
To: 
Date: Thu, 25 Jul 2019 21:43:35 +0530
Message-Id: <20190725161335.4162-1-thakursatendra2003@yahoo.co.in>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Sat, 27 Jul 2019 08:43:36 +0200
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>,
 Satendra Singh Thakur <thakursatendra2003@yahoo.co.in>
Subject: [alsa-devel] [PATCH] [ASoC][soc-dapm] : memory leak in the func
	snd_soc_dapm_new_dai
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

In the func snd_soc_dapm_new_dai, if the inner func
snd_soc_dapm_alloc_kcontrol fails, there will be memory leak.
The label param_fail wont free memory which is allocated by
the func devm_kcalloc. Hence new label is created for this purpose.

Signed-off-by: Satendra Singh Thakur <thakursatendra2003@yahoo.co.in>
---
 sound/soc/soc-dapm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index f013b24c050a..f62d41ee6d68 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -4095,7 +4095,7 @@ snd_soc_dapm_new_dai(struct snd_soc_card *card, struct snd_soc_pcm_runtime *rtd,
 						w_param_text, &private_value);
 		if (!template.kcontrol_news) {
 			ret = -ENOMEM;
-			goto param_fail;
+			goto outfree_w_param;
 		}
 	} else {
 		w_param_text = NULL;
@@ -4114,6 +4114,7 @@ snd_soc_dapm_new_dai(struct snd_soc_card *card, struct snd_soc_pcm_runtime *rtd,
 
 outfree_kcontrol_news:
 	devm_kfree(card->dev, (void *)template.kcontrol_news);
+outfree_w_param:
 	snd_soc_dapm_free_kcontrol(card, &private_value,
 				   rtd->dai_link->num_params, w_param_text);
 param_fail:
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
