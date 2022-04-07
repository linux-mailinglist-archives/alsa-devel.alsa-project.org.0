Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5D44F8762
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Apr 2022 20:51:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A863617E5;
	Thu,  7 Apr 2022 20:50:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A863617E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649357469;
	bh=TAbTE0lF5EexKN7OT4x7M57eBGM9nfMRRu7XhDuXa7Y=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YM2Ra5D0nFW4AxSSuZ3xziYEQ6sABwnvnv1BKvfKPPd1xwidIZnbRjd4enZzGlQI6
	 PuN5dAxGellT633Of4COrQAh4w6Bt4Yh7DGeMEFXWUTmt7isJr4b9QHgr6KnuL59Pd
	 /XTkesIZsIX8bEb98m69QNDESe6VW4k5kcUNjimM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22E62F804CF;
	Thu,  7 Apr 2022 20:50:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75F10F8026A; Thu,  7 Apr 2022 20:50:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4E19F80141
 for <alsa-devel@alsa-project.org>; Thu,  7 Apr 2022 20:50:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4E19F80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="CY7Npgnd"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2BC4161D98;
 Thu,  7 Apr 2022 18:50:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84832C385A0;
 Thu,  7 Apr 2022 18:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649357402;
 bh=TAbTE0lF5EexKN7OT4x7M57eBGM9nfMRRu7XhDuXa7Y=;
 h=From:To:Cc:Subject:Date:From;
 b=CY7Npgnd7FKGA3gbSEsqEtlyjwFcX4266dB0hKhe/xIimNF74mFoc1p5+ioGavU+o
 vNaGZ0+J5rsL+UnPXnZ4CMQsTjXTh0KRemNqxmafuX+fwVBdTMYd3GPO797hau7Jlo
 ZpKxsGinzrqtF/r4e1scLFiBjlA3puYz6RPWVE6sP0Qd9GcCFxCRO7UtYX6H3Rr91O
 nkxRQ/IFvWTBFVyBUQ3i1885FEOvlkkbxi/adnepTeCIQXQp1LWAfbSBMqztipnY3W
 IBO97sIZ1PlYuyF3wqwALgN6cNUkH85cv03E+ZdBmmGWzK1PMMPWUCEoJgDDlPncBh
 zkHpwyIlxTAZQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1ncXCi-000Rug-4j; Thu, 07 Apr 2022 20:50:00 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: alsa-devel@alsa-project.org
Subject: [PATCH v5 0/4] Make headphone work on Huawei Matebook D15
Date: Thu,  7 Apr 2022 20:49:55 +0200
Message-Id: <cover.1649357263.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 linux-kernel@vger.kernel.org
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

Huawei Matebook D15 uses two different GPIOs are used to control the output:

	- gpio0 controls the speaker output;
	- gpio1 controls the headphone output.

Changing both at the same time cause spurious events that are mis-interpreted
as input events, causing troubles on apps. So, a delay is needed before turning
on such gpios.

Also, the headset microphone is connected to MIC1, instead of MIC2 port.

With this patch, plugging a headphone causes a jack event to trigger the speaker
supply, powering down the speaker and powering up the headphone output.
Removing the headphone also triggers the power supply, powering up the speaker
and powering down the headphone.

The headset microphone also works. 

---

v5:
  - dropped an uneeded differential mux from the boards driver.

v4:
  - add support for headset microphone on MIC1 port.

v3:
  - add a patch changing GPIO quirk speaker naming. Patch 2 got rebased on the top of it.

Mauro Carvalho Chehab (3):
  ASoC: Intel: sof_es8336: support a separate gpio to control headphone
  ASoC: Intel: sof_es8336: add a quirk for headset at mic1 port
  ASoC: Intel: sof_es8336: Add a quirk for Huawei Matebook D15

Pierre-Louis Bossart (1):
  ASoC: Intel: sof_es8336: simplify speaker gpio naming

 sound/soc/intel/boards/sof_es8336.c | 117 +++++++++++++++++++++-------
 1 file changed, 89 insertions(+), 28 deletions(-)

-- 
2.35.1


