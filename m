Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8440581F9A
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Jul 2022 07:42:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D074950;
	Wed, 27 Jul 2022 07:41:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D074950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658900528;
	bh=ZykHilbaIsVR1jGsFUV7J/1ZBCbkia6ZB2qmlDaIPTk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZcSimH+BssSpTw3Z4b9sr1LHf2maCFbLRhl+hlv29PpLIo6oIAx1ERXTxRm+IwR8I
	 jfoMJuQzrLA9/y5Yx9M5rp9VjaMPJ3wmsKNx4N9hcMAmeko9ynei5sWFgjCVUDONxT
	 cyf49+9dsVXcx/GPt9bTB8dJ0DRsMvx/wRb7APZ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E13DCF80171;
	Wed, 27 Jul 2022 07:41:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB376F80155; Mon, 25 Jul 2022 13:11:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from sender4-op-o18.zoho.com (sender4-op-o18.zoho.com
 [136.143.188.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EAC77F80088
 for <alsa-devel@alsa-project.org>; Mon, 25 Jul 2022 13:11:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EAC77F80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=icenowy.me header.i=uwu@icenowy.me
 header.b="IUt4JzvZ"
ARC-Seal: i=1; a=rsa-sha256; t=1658747415; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=fByinlQtj3jM8pGcdQhkBTz3yEYHgopvAsss8Fvbd1iNfVZL1SjjIWrKRmIUAxtngJT/GxkBIhv4VL1w95A2C1f3trDCyAkexJk/TAaLewo+jSfiC53UznPZ/XuTELDSdpIWTapKrBNF819937vW8Kzn7UuM6NXwgRR5HPkYwFg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1658747415;
 h=Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
 bh=Vw8o+PvqiksN2gP8/VvlaOtw5GwqSrnHaBqgfUiELlY=; 
 b=n7NI7C66JvDd8m+LljyeWkLLfom/IbMYRYG5kqpbfondXP3S7TIapce9R+Uc3couwN5GJ7tyYXOfe1joQ/BXf1WngNld91SYk6tJDDkQWkW0djWhaOP7iQ7xDUOn2o37w7C9YG9u05jotOuCxlTw31ZdUnpoodYZmCDbD+LqfuA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1658747415; 
 s=zmail; d=icenowy.me; i=uwu@icenowy.me;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
 bh=Vw8o+PvqiksN2gP8/VvlaOtw5GwqSrnHaBqgfUiELlY=;
 b=IUt4JzvZIwxHEvuj94kvZVinjoTDaWc8aiizDGKJV6kDZGzCmASJJhQ4HuMtdXnI
 aNfwfHm9/5KIucBttU/sqrYg7wb9h+i6E3gvWsgY5veBpyPHeH42uag9+ymBDQ+IOg0
 ZFWXkqvYErEBUFDR+BxXHjtQGoCIkfKF8c88OiSo=
Received: from edelgard.icenowy.me (59.41.162.230 [59.41.162.230]) by
 mx.zohomail.com with SMTPS id 1658747413181482.9075417342268;
 Mon, 25 Jul 2022 04:10:13 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 1/2] ASoC: Intel: Skylake: fix error message of NHLT blob
 selection
Date: Mon, 25 Jul 2022 19:10:01 +0800
Message-Id: <20220725111002.143765-1-uwu@icenowy.me>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-Mailman-Approved-At: Wed, 27 Jul 2022 07:41:04 +0200
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Icenowy Zheng <uwu@icenowy.me>
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

The query to select NHLT blob had been changed to use parameters of the
pipeline instead of PCM, however the error message returned when it fails
still uses PCM properties.

Fix this inconsistency.

Fixes: 87b265260046 ("ASoC: Intel: Skylake: Select proper format for NHLT blob")
Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 sound/soc/intel/skylake/skl-topology.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/skylake/skl-topology.c b/sound/soc/intel/skylake/skl-topology.c
index 9bdf020a2b64..19994ec8bba1 100644
--- a/sound/soc/intel/skylake/skl-topology.c
+++ b/sound/soc/intel/skylake/skl-topology.c
@@ -1864,7 +1864,8 @@ static int skl_tplg_be_fill_pipe_params(struct snd_soc_dai *dai,
 	} else {
 		dev_err(dai->dev, "Blob NULL for id:%d type:%d dirn:%d ch:%d, freq:%d, fmt:%d\n",
 			mconfig->vbus_id, link_type, params->stream,
-			params->ch, params->s_freq, params->s_fmt);
+			pipe_fmt->channels, pipe_fmt->freq,
+			pipe_fmt->bps);
 		return -EINVAL;
 	}
 
-- 
2.37.1

