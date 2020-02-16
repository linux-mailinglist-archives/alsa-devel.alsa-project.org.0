Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 382D0160730
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 00:23:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C99B7167D;
	Mon, 17 Feb 2020 00:23:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C99B7167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581895433;
	bh=yGbfih2V2iX44HWJw0YaJ+GePAQQ5gk5IHHfXI+F5Go=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aCHx3LuWH7infXiLHk9qS9tduEkslosf1P8qFpgxGAp7IXgdZmB+NXc6T9cQAXP+S
	 tPyeLTPO0cQRzK/Mt2orQ/7KzVicHmDRwNgH+A9t5JCU4szeEC4EAGqJpgmkf7qxBH
	 gpkupYoTZI8ITKe0Cwk0xqGs4MRA0qxRUKLR+hJc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86822F8015D;
	Mon, 17 Feb 2020 00:21:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86DF1F800B6; Mon, 17 Feb 2020 00:21:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82039F80142
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 00:21:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82039F80142
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="tS+a52Lz"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="UmrVFZU3"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 90DDB35C;
 Sun, 16 Feb 2020 18:21:17 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Sun, 16 Feb 2020 18:21:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=UZCtLu13K7pBoKdVcBGA3CuNTA
 Yit6KVzt20iCDpYH0=; b=tS+a52Lzt8lez+wz+VZKEn2pZ92WHEMq6WNhjawLwv
 JRhCVQVegKYgRq+1f2dRHfeqYMCVrVDU+gXTjUaxsyCjt9w+ruuwQFBC8FZ+FtFP
 +CURfUzo1BNwuUXT3M8277kymerNlHfIPm61Mzs+i7DeqSJ/YF6oN+TgjIUK36zu
 uCdQXysoBCFxWfGZvws9l+7vS4sGrjpQ1qYiYR/sGSW47xb2Mgu/n0SUKsQt8JUg
 /h6StKufrUAtLIuaxGdcj+z2uRKD+0KBEM9J7RDP38TseM+DXdlQxJj8SfKRki9O
 1dLCxvWmdS5coxV2gfvnhEfaZfGd2u1P4RK76vz/NkvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=UZCtLu13K7pBoKdVc
 BGA3CuNTAYit6KVzt20iCDpYH0=; b=UmrVFZU3AZC5/PYk4L3RbIKCh5JAca09X
 d/68g6BnItC0FgkrfSzqNvrOf2spm3mjiy7du2AH01ceEqnv6UEX9y7hkT9Taaar
 CUsMlAVr/ampvNsb6E/buB/GcRcOW7y4ifQ5U8PkTvGcdkz/e+in+eok3vwLELYq
 iZ20pPX3PIcxS3wOJQ2XuG1LfVsshtcWm9xNrtkwoTDuIsPsxQO3ExkgK1OJ0Cen
 fOMdBMGF1pJquHF4YOsTfFoAsrm3ibPQX9IdyfnmsDjL0XJIOyYrMPZ++y1Bkhyq
 YbXxcDUd1AyVyLx3ungkPikwDnJ3+lHvTMLrYFu6jS3y2G9dVGp7A==
X-ME-Sender: <xms:a85JXvWwLdOqHYCMGfaKmBk-F9AMJNPL1OAnCJpSBQkA5tpGxTdqCA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjeehgddtkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghlucfj
 ohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecukfhppeejtd
 drudefhedrudegkedrudehudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
 mhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:a85JXnQ4xxjUMIjDMeOMQkxvdO7buS0jc2zsh6hnBgd0kBeMTIkutQ>
 <xmx:a85JXnDH844wNKDEJz_b33AdDsFlzdYP7YdhwtC4hP5F_fRQr0hu_w>
 <xmx:a85JXmLOiNVu-IcHyC-OrU3cEVdYbTtpmjN6RWQ0BEaVzteE5o8qtA>
 <xmx:bc5JXsGOl72sBSAFWPqUg6yNNOirTVCo-ebGjAS3aV0CyzbV0joaxA>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6DD2F3060D1A;
 Sun, 16 Feb 2020 18:21:15 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Jerome Brunet <jbrunet@baylibre.com>
Date: Sun, 16 Feb 2020 17:21:11 -0600
Message-Id: <20200216232114.15742-1-samuel@sholland.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Samuel Holland <samuel@sholland.org>,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [alsa-devel] [PATCH v2 0/3] simple-audio-card codec2codec support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

We are currently using simple-audio-card on the Allwinner A64 SoC.
The digital audio codec there (sun8i-codec) has 3 AIFs, one each for the
CPU, the modem, and Bluetooth. Adding support for the secondary AIFs
requires adding codec2codec DAI links.

Since the modem and bt-sco codec DAI drivers only have one set of
possible PCM parameters (namely, 8kHz mono S16LE), there's no real
need for a machine driver to specify the DAI link configuration. The
parameters for these "simple" DAI links can be chosen automatically.

This series adds codec2codec DAI link support to simple-audio-card.
Codec to codec links are automatically detected when DAIs in the link
belong to codec components.

I tried to reuse as much code as possible, so the first two patches
refactor a couple of helper functions to be more generic.

The last patch adds the new feature and its documentation.

Samuel Holland (3):
  ALSA: pcm: Add a non-runtime version of snd_pcm_limit_hw_rates
  ASoC: pcm: Export parameter intersection logic
  ASoC: simple-card: Add support for codec to codec DAI links

 Documentation/sound/soc/codec-to-codec.rst |  9 +++-
 include/sound/pcm.h                        |  9 +++-
 include/sound/soc.h                        |  3 ++
 sound/core/pcm_misc.c                      | 18 +++----
 sound/soc/generic/simple-card-utils.c      | 50 ++++++++++++++++++++
 sound/soc/soc-pcm.c                        | 55 +++++++++++++++-------
 6 files changed, 116 insertions(+), 28 deletions(-)

-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
