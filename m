Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BA38C464B
	for <lists+alsa-devel@lfdr.de>; Mon, 13 May 2024 19:39:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C71EB6A;
	Mon, 13 May 2024 19:39:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C71EB6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715621964;
	bh=5NI70CwdCr6ds3UXpAse5bSY/w2S2qX7EJ/03/SHaBA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MIn82WOO0aqfSo1zzssMc9QBdhTZNXGGIz3Q7wEaPRsP2bWb4/HbhXu2V/i8BFe8P
	 eCAUdSySTx8CgaukM2kgba3qSf0Xn4EP/Kbud0ZN1vqXRUO6DYE7eVlttFnhe9WDdS
	 DWslSCyxUKQ5aKZQTm7YOlTcVfHGfxiaoYAec3+E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C15BF8065A; Mon, 13 May 2024 19:38:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 852D7F80659;
	Mon, 13 May 2024 19:38:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66F7EF805A1; Mon, 13 May 2024 19:37:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from msa.smtpout.orange.fr (smtp-76.smtpout.orange.fr
 [80.12.242.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4E1DDF801F5;
	Mon, 13 May 2024 19:37:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E1DDF801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256
 header.s=t20230301 header.b=XWQayaUl
Received: from localhost.localdomain ([86.243.17.157])
	by smtp.orange.fr with ESMTPA
	id 6ZcDs0lh7ME2z6ZcNsL821; Mon, 13 May 2024 19:37:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1715621864;
	bh=tArMz3CXGARffdI7GxCeEXs4RlHzAXyCNuBRtNfPV0w=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=XWQayaUl7WTsSQ5YM4kr8gQgm3qMIo2et81SM55AGN8EHTknUjJSUpj7xQgEorIfj
	 DZZKp+bwgM9AZ1sZbI6vdNeIVUpfeq1TdYFqCuAWrzGTfnHxSIndH6ykKyqmx49ZQv
	 jRWlYChvnRad263+ngdk3IM+02SqNMmSmYz3vyvVxVuCrDCQpDf9O3vLAk/xsZHCBE
	 RbH2p5/tC5iwGfuJTqWO7WMCcAHiX6jS4LxkAiu6mEWGSJJa2G9U/td4xAI46ONVCA
	 UrqCRtoobwviGkpEGdSt3fdbiEQjYrRa/2NJOCX/8pR6OioW5xKWtQTRE8S1h0ngfF
	 0PWWuO4oLY+KQ==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 13 May 2024 19:37:44 +0200
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
Subject: [PATCH 5/6] ASoC: SOF: topology: Constify struct snd_soc_tplg_ops
Date: Mon, 13 May 2024 19:37:24 +0200
Message-ID: 
 <2d9f5b75e979eb38b6f3baf85dfa1f0fdb3447ef.1715526069.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.0
In-Reply-To: 
 <f2f983e791d7f941a95556bb147f426a345d84d4.1715526069.git.christophe.jaillet@wanadoo.fr>
References: 
 <f2f983e791d7f941a95556bb147f426a345d84d4.1715526069.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Z7Z65WGVGBEALCMIKHGXK323J4K6YUTE
X-Message-ID-Hash: Z7Z65WGVGBEALCMIKHGXK323J4K6YUTE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z7Z65WGVGBEALCMIKHGXK323J4K6YUTE/>
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
  44519	   2888	     48	  47455	   b95f	sound/soc/sof/topology.o

After:
   text	   data	    bss	    dec	    hex	filename
  44839	   2552	     48	  47439	   b94f	sound/soc/sof/topology.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested-only.
---
 sound/soc/sof/topology.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index da182314aa87..b54382131991 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -2278,7 +2278,7 @@ static const struct snd_soc_tplg_bytes_ext_ops sof_bytes_ext_ops[] = {
 	{SOF_TPLG_KCTL_BYTES_VOLATILE_RO, snd_sof_bytes_ext_volatile_get},
 };
 
-static struct snd_soc_tplg_ops sof_tplg_ops = {
+static const struct snd_soc_tplg_ops sof_tplg_ops = {
 	/* external kcontrol init - used for any driver specific init */
 	.control_load	= sof_control_load,
 	.control_unload	= sof_control_unload,
@@ -2433,7 +2433,7 @@ static int sof_dspless_link_load(struct snd_soc_component *scomp, int index,
 	return 0;
 }
 
-static struct snd_soc_tplg_ops sof_dspless_tplg_ops = {
+static const struct snd_soc_tplg_ops sof_dspless_tplg_ops = {
 	/* external widget init - used for any driver specific init */
 	.widget_ready	= sof_dspless_widget_ready,
 	.widget_unload	= sof_dspless_widget_unload,
-- 
2.45.0

