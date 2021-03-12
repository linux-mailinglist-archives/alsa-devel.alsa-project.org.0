Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C40433968A
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Mar 2021 19:31:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 326CD175F;
	Fri, 12 Mar 2021 19:30:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 326CD175F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615573893;
	bh=jIxmqOuVPc7Z0o1IBOAR8DABChtJYEXCzAOzg0Nqtxk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SPlmf/kXXr8OwBfUC3rZHuIl3OMrpCX2KRZpSGe9Aj3ZmFd0uZScUvdWqfW8YSFDO
	 eLRp8DVB11ouyussFRYZHGCboupqtppw+lDUNAbEvNy85QDfbXzNW5oLmy8pXfK2gt
	 bkxl3sH82iFUzGPmYqJPIxHXVxylfPfBrPHDdjso=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CEC2FF80535;
	Fri, 12 Mar 2021 19:24:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16795F8052D; Fri, 12 Mar 2021 19:24:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E253F804E3
 for <alsa-devel@alsa-project.org>; Fri, 12 Mar 2021 19:23:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E253F804E3
IronPort-SDR: AIkKtUwujdNPJvx7WoqbHP3QToeztNJdl4QzqwC2uAF8lEBRI7mlL4mSJcudbybttDTRb+eWYK
 XQ/cICNMj0fg==
X-IronPort-AV: E=McAfee;i="6000,8403,9921"; a="188236479"
X-IronPort-AV: E=Sophos;i="5.81,244,1610438400"; d="scan'208";a="188236479"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 10:23:46 -0800
IronPort-SDR: T0I19Xpl7umOcexnSGDoG5Dw8vQZRch9lFDKeZUhhxsuf9Tpm/OHz0k3+B1cu9XkBVgZU0Z6vk
 sxg63zRIWgIA==
X-IronPort-AV: E=Sophos;i="5.81,244,1610438400"; d="scan'208";a="377792045"
Received: from amiteshs-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.37.30])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 10:23:45 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 17/23] ASoC: sigmadsp: align function prototype
Date: Fri, 12 Mar 2021 12:22:40 -0600
Message-Id: <20210312182246.5153-18-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210312182246.5153-1-pierre-louis.bossart@linux.intel.com>
References: <20210312182246.5153-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Liam Girdwood <lgirdwood@gmail.com>,
 tiwai@suse.de, Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>, broonie@kernel.org
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

cppcheck warning:

sound/soc/codecs/sigmadsp.c:736:60: style:inconclusive: Function
'sigmadsp_setup' argument 2 names different: declaration 'rate'
definition 'samplerate'. [funcArgNamesDifferent]
int sigmadsp_setup(struct sigmadsp *sigmadsp, unsigned int samplerate)
                                                           ^

sound/soc/codecs/sigmadsp.h:62:60: note: Function 'sigmadsp_setup'
argument 2 names different: declaration 'rate' definition
'samplerate'.
int sigmadsp_setup(struct sigmadsp *sigmadsp, unsigned int rate);
                                                           ^

sound/soc/codecs/sigmadsp.c:736:60: note: Function 'sigmadsp_setup'
argument 2 names different: declaration 'rate' definition
'samplerate'.
int sigmadsp_setup(struct sigmadsp *sigmadsp, unsigned int samplerate)
                                                           ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/sigmadsp.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/sigmadsp.h b/sound/soc/codecs/sigmadsp.h
index e3c9656e006d..d63b8c366efb 100644
--- a/sound/soc/codecs/sigmadsp.h
+++ b/sound/soc/codecs/sigmadsp.h
@@ -59,7 +59,7 @@ struct sigmadsp *devm_sigmadsp_init_i2c(struct i2c_client *client,
 
 int sigmadsp_attach(struct sigmadsp *sigmadsp,
 	struct snd_soc_component *component);
-int sigmadsp_setup(struct sigmadsp *sigmadsp, unsigned int rate);
+int sigmadsp_setup(struct sigmadsp *sigmadsp, unsigned int samplerate);
 void sigmadsp_reset(struct sigmadsp *sigmadsp);
 
 #endif
-- 
2.25.1

