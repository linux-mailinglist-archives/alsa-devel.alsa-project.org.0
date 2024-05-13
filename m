Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E338C4643
	for <lists+alsa-devel@lfdr.de>; Mon, 13 May 2024 19:38:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9124B829;
	Mon, 13 May 2024 19:38:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9124B829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715621935;
	bh=a0hGDqbnr8QfjOn4UWdQQVFTsm1YKoftP6R8ds04QtU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ClCTvqPKtBSKh9c0IVphkjzjaBoGOobYjCE7QpFienPRs/zSIaQr1EpaC2lANoyEu
	 sTogePGdDvSUlNWcDASPOZnibU/+s7QBqqiSMlETQDOVAWFQ6y9ylHz/zHji5Ksv8t
	 4noYCI5wTrRx0z9BCys7so29QKui+mIu0i1CkKgg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96FFEF805EC; Mon, 13 May 2024 19:37:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EB5D0F805FD;
	Mon, 13 May 2024 19:37:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C232DF804FB; Mon, 13 May 2024 19:37:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp.smtpout.orange.fr (smtp-23.smtpout.orange.fr
 [80.12.242.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 58D50F80224;
	Mon, 13 May 2024 19:37:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58D50F80224
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256
 header.s=t20230301 header.b=m90FUVvG
Received: from localhost.localdomain ([86.243.17.157])
	by smtp.orange.fr with ESMTPA
	id 6ZcDs0lh7ME2z6ZcKsL81A; Mon, 13 May 2024 19:37:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1715621860;
	bh=vPx09WkVDSPEOpN7HAXVn6S1kGIy/0oMa/odUP4ITxc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=m90FUVvGUYAng9KWUEjKYM1eIH1fEklPDwdWolN/ZVlGtl+EpR9oNiMZT/sXgwwhJ
	 oEH/6thb5Alo3o7a9uzF/JMtkmqmrnJm75rObyvke+qoOfymnHbV1IBuD2miuuY4UJ
	 +YzXUW56a9zUu0SMrd5qUoGnbk4iTh3qv6lLA1l6jz6TE5ipLRdqWkp64+byy34C22
	 yKngk6yqD/8ThHFwNaxSKJbUPiaYoGhj146tVS80EsfD2P3kWMJdHiT/7gOZrUvSKG
	 YDFbRkJkbW0qdW3Z0LbubPyPtgvp3qTmP0AjaUrCgXYh40/5PH7mDpr/wz1y+fW5nd
	 zc0rz5ydwA+ew==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 13 May 2024 19:37:40 +0200
X-ME-IP: 86.243.17.157
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	cezary.rojewski@intel.com,
	pierre-louis.bossart@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	srinivas.kandagatla@linaro.org,
	bgoswami@quicinc.com,
	daniel.baluta@nxp.com
Cc: linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org,
	sound-open-firmware@alsa-project.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 3/6] ASoC: qdsp6: audioreach: Constify struct snd_soc_tplg_ops
Date: Mon, 13 May 2024 19:37:22 +0200
Message-ID: 
 <a5ae843dd8aaacbc1148aea7a3b1d03f11495872.1715526069.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.0
In-Reply-To: 
 <f2f983e791d7f941a95556bb147f426a345d84d4.1715526069.git.christophe.jaillet@wanadoo.fr>
References: 
 <f2f983e791d7f941a95556bb147f426a345d84d4.1715526069.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VL7CDFUYVUCA3NKHEN4NHFEQSXFKKD22
X-Message-ID-Hash: VL7CDFUYVUCA3NKHEN4NHFEQSXFKKD22
X-MailFrom: christophe.jaillet@wanadoo.fr
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VL7CDFUYVUCA3NKHEN4NHFEQSXFKKD22/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Constifying "struct snd_soc_tplg_ops" moves some data to a read-only
section, so increase overall security.

On a x86_64, with allmodconfig:
Before:
   text	   data	    bss	    dec	    hex	filename
  19942	    832	      0	  20774	   5126	sound/soc/qcom/qdsp6/topology.o

After:
   text	   data	    bss	    dec	    hex	filename
  20102	    652	      0	  20754	   5112	sound/soc/qcom/qdsp6/topology.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested-only.
---
 sound/soc/qcom/qdsp6/topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
index 70572c83e101..c15d1a2b6dbf 100644
--- a/sound/soc/qcom/qdsp6/topology.c
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -1240,7 +1240,7 @@ static const struct snd_soc_tplg_kcontrol_ops audioreach_io_ops[] = {
 		audioreach_put_vol_ctrl_audio_mixer, snd_soc_info_volsw},
 };
 
-static struct snd_soc_tplg_ops audioreach_tplg_ops  = {
+static const struct snd_soc_tplg_ops audioreach_tplg_ops = {
 	.io_ops = audioreach_io_ops,
 	.io_ops_count = ARRAY_SIZE(audioreach_io_ops),
 
-- 
2.45.0

