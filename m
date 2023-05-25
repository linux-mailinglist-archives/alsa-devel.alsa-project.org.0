Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A26711472
	for <lists+alsa-devel@lfdr.de>; Thu, 25 May 2023 20:39:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED556DED;
	Thu, 25 May 2023 20:38:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED556DED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685039948;
	bh=q7vcfc16PjA+NkG7H7TNTKpVXqNCV7v7kYLgjKHgNIU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vZHbTnAlvf5J7GwKVdynGJsNQ+0UnpG/X1wydWMpSOMmGgOYFfSrWOWa+55Pjwyoh
	 uidQCK0CJ5nQ2PYCCezsQXl4VVvIoQyt55nGL/XI7hObX6mq1oTXd14fBoEcrgpNY+
	 7+lgypJzNOKX65eZCo1KXw8Gv+IgD7tYWYM3ROng=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 990D7F80579; Thu, 25 May 2023 20:37:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 15098F8026A;
	Thu, 25 May 2023 20:37:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20EDAF80557; Thu, 25 May 2023 20:37:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3D224F8024E;
	Thu, 25 May 2023 20:37:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D224F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=aP+LjEe4
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D4B1464906;
	Thu, 25 May 2023 18:37:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7F6FC4339E;
	Thu, 25 May 2023 18:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685039863;
	bh=q7vcfc16PjA+NkG7H7TNTKpVXqNCV7v7kYLgjKHgNIU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aP+LjEe4jj1ZdO9YVwcjOy3eK98RpDFGojDUF5gfsfodd5+WsGI9O+cl8sh7K1X1G
	 1fYZYFjp696Rtupdsyv0EDRdcNam7NeR0xURUQIs1cJVAjFIsnkFNA0C/GfqvyUdnf
	 QhSmTuIjlSUvYORqadkvEMfZNulMd4vEScMYDY7t0CYZSyc/DBblc7UCWhWsPkLqJY
	 uPqtO6k4NkTXdLKX/QfneCnF4qkO8R3gC0TmSuC+O7Z6jUQlrFGcGVoRK0KSDpsM0x
	 mN2vFEcT5/4LETdpGXdRW0dkpX7PJAaZVESxcaNcaXSC0K3QzI932FaK1QqwnJ2GyP
	 mLIbeJJWsa6RA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sasha Levin <sashal@kernel.org>,
	lgirdwood@gmail.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	daniel.baluta@nxp.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	sound-open-firmware@alsa-project.org,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 6.1 27/57] ASoC: SOF: pcm: fix pm_runtime imbalance in
 error handling
Date: Thu, 25 May 2023 14:35:37 -0400
Message-Id: <20230525183607.1793983-27-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230525183607.1793983-1-sashal@kernel.org>
References: <20230525183607.1793983-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SZLZOXN7BICZOYBSQFTZL3NL3DBBANZB
X-Message-ID-Hash: SZLZOXN7BICZOYBSQFTZL3NL3DBBANZB
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SZLZOXN7BICZOYBSQFTZL3NL3DBBANZB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

[ Upstream commit da0fe8fd515a471d373acc3682bfb5522cca4d55 ]

When an error occurs, we need to make sure the device can pm_runtime
suspend instead of keeping it active.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com
Link: https://lore.kernel.org/r/20230512103315.8921-3-peter.ujfalusi@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/sof/pcm.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 14571b821ecac..be6f38af37b5d 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -619,16 +619,17 @@ static int sof_pcm_probe(struct snd_soc_component *component)
 				       "%s/%s",
 				       plat_data->tplg_filename_prefix,
 				       plat_data->tplg_filename);
-	if (!tplg_filename)
-		return -ENOMEM;
+	if (!tplg_filename) {
+		ret = -ENOMEM;
+		goto pm_error;
+	}
 
 	ret = snd_sof_load_topology(component, tplg_filename);
-	if (ret < 0) {
+	if (ret < 0)
 		dev_err(component->dev, "error: failed to load DSP topology %d\n",
 			ret);
-		return ret;
-	}
 
+pm_error:
 	pm_runtime_mark_last_busy(component->dev);
 	pm_runtime_put_autosuspend(component->dev);
 
-- 
2.39.2

