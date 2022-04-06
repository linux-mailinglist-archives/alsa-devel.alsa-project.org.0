Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC644F6B3D
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Apr 2022 22:20:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1DD8582C;
	Wed,  6 Apr 2022 22:19:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1DD8582C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649276428;
	bh=Lf/3oiDQxIjrJslaU4hDBu7sK/Kpd4Up096TW4VK1+8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=E7C33yb3O9LkaL1sPSvvU9KUAGYmcHuvLsSA1LVIE4KmshDhJBJMO7eEV4iT2NSEj
	 p+n9q2Q9Szz0H7SnG04Sy+n1UyTu8niIQjlPucGSLDLRqVnWu8CmcpLlI3ednbfdIc
	 lH2I8LJSKB+RpKdCb0oFSL2rFJrtdYyYboJ1jgRs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B712F80475;
	Wed,  6 Apr 2022 22:19:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E227F8020C; Wed,  6 Apr 2022 22:19:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 068F3F800D2
 for <alsa-devel@alsa-project.org>; Wed,  6 Apr 2022 22:19:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 068F3F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pn+coB4Y"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 588A861265;
 Wed,  6 Apr 2022 20:19:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C138C385AA;
 Wed,  6 Apr 2022 20:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649276363;
 bh=Lf/3oiDQxIjrJslaU4hDBu7sK/Kpd4Up096TW4VK1+8=;
 h=From:To:Cc:Subject:Date:From;
 b=pn+coB4YtR7Vx5Rgy46/4lZm6ZODHkcZrx1Y5uN2zIc5xyazhq2VDeix3XlEUu/h0
 eP2tPVdRHpCEXIrkN0eICnBUml0ibYGSstHWZVJ5gAxLGCGxrCMRxoTo4j76i+hOja
 UuMwuC16hKemHL+1S5OfGm8gv2yW0GPTz8zFM/yaOJzpSsgtpBp+GOwdD9GAoEkzv3
 ueSL40lr0cGiKUihXBB60HdrbanVqtpdcYNKYVPclW1CNaQHhXglJA9ReYn3NLbB3S
 s2gjy11N2wbmhbPoeGDnHhWpKJqq7HVbTHF51TYdhA/DDT1R9JdZxnn538RzJuu2TZ
 4H4B5hFG4BRKA==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1ncC7c-00GGaG-Fy; Wed, 06 Apr 2022 22:19:20 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: alsa-devel@alsa-project.org
Subject: [PATCH v4 0/4] Make headphone work on Huawei Matebook D15
Date: Wed,  6 Apr 2022 22:19:14 +0200
Message-Id: <cover.1649275618.git.mchehab@kernel.org>
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

 sound/soc/intel/boards/sof_es8336.c | 122 +++++++++++++++++++++-------
 1 file changed, 94 insertions(+), 28 deletions(-)

-- 
2.35.1


