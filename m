Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 586834F3CB0
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 18:58:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E180E1760;
	Tue,  5 Apr 2022 18:58:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E180E1760
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649177932;
	bh=ms+BtckZ9MEqSCkK6doSJsbJF0vV+8oKpXtP6XAZwOU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=doVUFSDC9GxDIf3Kq/ye/mBzYr3xjilOaSjWJzxyJ/NP/1xX/fk99t4YcMfIF/th5
	 mocgL2eebPBQ4EpduQawT9Nvl9ExDCuAdWiexoI3ydXEHe4QEesT68x51brhAm85uY
	 JHmnZBV5BSXao1Y6/JYPz1exqRSZ4Ubm6Dpt0H54=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FBC2F8016E;
	Tue,  5 Apr 2022 18:57:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8945FF8016E; Tue,  5 Apr 2022 18:57:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE503F800D1
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 18:57:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE503F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="DID+z+a3"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E9B3DB81E92;
 Tue,  5 Apr 2022 16:57:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 008D4C385A7;
 Tue,  5 Apr 2022 16:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649177866;
 bh=ms+BtckZ9MEqSCkK6doSJsbJF0vV+8oKpXtP6XAZwOU=;
 h=From:To:Cc:Subject:Date:From;
 b=DID+z+a35JPU0wg3v8o+heAYAG3WEdKWMnjWMd5Ia/miFQsCgEW4juZf/3sDflrfk
 dKB3nrAMPQvQSJcb06MYXeA9ftNwL+KfSFpPgQEYU14IAkiFdEBWoq1FQkKz9YIvXF
 8YplWZ3k0ELG3Ggv1TfMAnX4qJRiWJ0gSGbkmpKJIdSoQKwZsljWvaO5fimjZK4Ksr
 B319re//ltbAenKSFo4oF02i3i85Ca1OJsmMPpW2/RIYVkSvKodqG7xl+YqTPYpZoE
 hrvQqSSOD5yL63ah7DH83U+Za/QvH3RAGFcBih3xcPrR79uAyFF5TjRdfxUNDSYS1V
 WZV29PSlQwIhQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1nbmUx-002uYM-BB; Tue, 05 Apr 2022 18:57:43 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: alsa-devel@alsa-project.org
Subject: [PATCH v3 0/3] Make headphone work on Huawei Matebook D15
Date: Tue,  5 Apr 2022 18:57:31 +0200
Message-Id: <cover.1649177516.git.mchehab@kernel.org>
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

At Huawei Matebook D15 two different GPIOs are used to control the output:
	- gpio0 controls the speaker output;
	- gpio1 controls the headphone output.

Changing both at the same time cause spurious events that are mis-interpreted
as input events, causing troubles on apps. So, a delay is needed before turning
on such gpios.

With this patch, plugging a headphone causes a jack event to trigger the speaker
supply, powering down the speaker and powering up the headphone output.
Removing the headphone also triggers the power supply, powering up the speaker
and powering down the headphone.

---

v3:
  - add a patch changing GPIO quirk speaker naming. Patch 2 got rebased on the top of it.

Mauro Carvalho Chehab (2):
  ASoC: Intel: sof_es8336: support a separate gpio to control headphone
  ASoC: Intel: sof_es8336: Huawei Matebook D15 uses a headphone gpio

Pierre-Louis Bossart (1):
  ASoC: Intel: sof_es8336: simplify speaker gpio naming

 sound/soc/intel/boards/sof_es8336.c | 97 +++++++++++++++++++++--------
 1 file changed, 72 insertions(+), 25 deletions(-)

-- 
2.35.1


