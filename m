Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EBF21262E
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 16:24:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7166416DA;
	Thu,  2 Jul 2020 16:23:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7166416DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593699877;
	bh=JbkAinTcSpMspFvTYcjt12vE107ZbRutV7D+mnbOMFM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QtVNhL/+zMeN7+bM/N28cw63fYQ/Yp46mp+RIgrkwBSMBh1xacupVyN2+Av2cEFOw
	 tU8K/6zt8fViNyOhXwLiu4VxtkrN10nRJFHr8UGEZXw7ZHn8Wuqty2L/BvY51oq2eV
	 pafB5ngDT6M9RVRjEuXU40w3aZI4/kfWl+V43H6o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92760F8022D;
	Thu,  2 Jul 2020 16:22:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B815BF800ED; Thu,  2 Jul 2020 16:22:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 38834F800ED
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 16:22:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38834F800ED
Received: from xps.home (unknown [IPv6:2a01:e35:2fb5:1510:315a:ecf0:6250:a3ed])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: aferraris)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 3CE162A1D11;
 Thu,  2 Jul 2020 15:22:49 +0100 (BST)
From: Arnaud Ferraris <arnaud.ferraris@collabora.com>
To: 
Subject: [PATCH 0/4] ASoC: fsl_asrc: allow selecting arbitrary clocks
Date: Thu,  2 Jul 2020 16:22:31 +0200
Message-Id: <20200702142235.235869-1-arnaud.ferraris@collabora.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, kernel@collabora.com,
 Fabio Estevam <festevam@gmail.com>
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

The current ASRC driver hardcodes the input and output clocks used for
sample rate conversions. In order to allow greater flexibility and to
cover more use cases, it would be preferable to select the clocks using
device-tree properties.

This series also fix register configuration and clock assignment so
conversion can be conducted effectively in both directions with a good
quality.

Arnaud Ferraris (4):
  dt-bindings: sound: fsl,asrc: add properties to select in/out clocks
  ASoC: fsl_asrc: allow using arbitrary input and output clocks
  ASoC: fsl_asrc: always use ratio for conversion
  ASoC: fsl_asrc: swap input and output clocks in capture mode

 Documentation/devicetree/bindings/sound/fsl,asrc.txt |  8 ++++++++
 sound/soc/fsl/fsl_asrc.c                             | 69 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----
 sound/soc/fsl/fsl_asrc_common.h                      |  3 +++
 3 files changed, 75 insertions(+), 5 deletions(-)


