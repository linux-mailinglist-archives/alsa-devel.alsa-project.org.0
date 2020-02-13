Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B05315B9AE
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Feb 2020 07:40:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB8EB1682;
	Thu, 13 Feb 2020 07:39:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB8EB1682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581576039;
	bh=8YR5J10J4nWzubr6xkR/JZiPyPGrsx9VdmYHNtfLM9E=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FCNbQpp4/r4jK1iO986/dqQ/ez/4ZFuO9qRvfSyp/x7RCbxDCDL4FtS+QbQjScxv3
	 e6LCI0x+A3kxUGYsvizvvU11LhFUNLGEctDkVkdU2wzvIMhpnSl9eRqfGRbszyb3oq
	 GkVH9LV6jqp+omEHyupDGy+jEe1ecmoAGtoVNKz4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 27510F80292;
	Thu, 13 Feb 2020 07:36:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3DC64F801DA; Thu, 13 Feb 2020 07:12:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A047F8013E
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 07:11:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A047F8013E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="BAvfeaTQ"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="jjY5YAj1"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id F40B55604;
 Thu, 13 Feb 2020 01:11:49 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 13 Feb 2020 01:11:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=e9e1sQnXhr72HpZZYSvle3HwJO
 ivmu7Jj2yYJpKIjBM=; b=BAvfeaTQFfuZBFSD83RIFgUnKGoLYwSW5SKAWokzo2
 /okcCgX2JWOzz9DUKszGSS6Ag6+RrASZY6jxNGLOyTPxEZpjSqG88bBa8K+i/+Ug
 B6rufqO6Yh8z5+hFJnSPfch/2A9SyHc9EPWImK7csuJE//97Pmf8n3n45yEFAy40
 Yfl7iVvYTOZd3/h2eZ12rjtpAjKoQlGo6YdUTGpmJmW1R5w1WDUSmkMdaCdw/qag
 EVv4EXQzLjt54NzsskveymNcF0y5ayH1mxwNS7u40RSp5Ei7YFWlsvaR+4jVuBis
 QXGvKR0kuySyjhRhdBANlABipxDf+l2UfipBe216Zcww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=e9e1sQnXhr72HpZZY
 Svle3HwJOivmu7Jj2yYJpKIjBM=; b=jjY5YAj1jw0QeFpU8BHe02Q5cRp546yxJ
 d6/FotXbnGPjprW59lTr/VmhpszV3xW3Cq9EUHmoJWmlG2zrEfqpZMybosydjbTC
 cE4vNpL749SYUkUn/XMYJBuJnwDQ10j0vhMO9AC5j9wYL0HA4UOQ5PNWjfkAdhW2
 hxIOqPQY95CuSVn+fEhrWNDjJ9O1GPvIJqFGtrT+sM/aBPj+XMlm+T1rtfie6IRW
 CSiB0wy0acfRqU4fvsMtyxN7mQ/qroHtHYsnen4ShZtUIyO0zgljonkFDG1ZaZns
 BgFCeiTHs67TV1bNcbQjKdZXJ0Fc11paQN71wr8fJEQK3BB7n/4og==
X-ME-Sender: <xms:pehEXkfoIo0fCETACFiEazh08z5LfdL96YaynEeaMkrdeQ3_fg2KmA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrieejgdelhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghlucfj
 ohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecukfhppeejtd
 drudefhedrudegkedrudehudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
 mhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:pehEXkqtw_vjOTYUhmO8CLJ8sOKlrzjyqQ6BcOCpkc4QrNkRd3XpTg>
 <xmx:pehEXoTP7gjsC8GjYzPdFE-6sMJpIHskoS0pz4WI3tz0EoEY97Ws9w>
 <xmx:pehEXuy4RXlQ9AC4EWBg3pBIAKGohgjvXGDN40nOQWypI7u30idEJg>
 <xmx:pehEXkYjTdP3iMv3aB5S8vCLbDNUf2PHfhfWrjVXO4m-ASYLrDcYgg>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 486353280065;
 Thu, 13 Feb 2020 01:11:48 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 13 Feb 2020 00:11:43 -0600
Message-Id: <20200213061147.29386-1-samuel@sholland.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 13 Feb 2020 07:36:42 +0100
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: [alsa-devel] [PATCH 0/4] simple-audio-card codec2codec support
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

This series adds a single "codec-to-codec" property to the
simple-audio-card binding, which does exactly what it says. It works out
rather nicely without making the device tree binding too complicated.

The first patch fixes a bug I found while implementing this feature.

I tried to reuse as much code as possible, so the middle two patches
refactor a couple of helper functions to be more generic.

Finally, the last patch adds the new feature and its documentation.

Samuel Holland (4):
  ASoC: codec2codec: avoid invalid/double-free of pcm runtime
  ALSA: pcm: Make snd_pcm_limit_hw_rates take hw directly
  ASoC: pcm: Export parameter intersection logic
  ASoC: simple-card: Add support for codec-to-codec dai_links

 .../devicetree/bindings/sound/simple-card.txt |  1 +
 Documentation/sound/soc/codec-to-codec.rst    |  9 ++-
 .../drm/bridge/synopsys/dw-hdmi-ahb-audio.c   |  2 +-
 include/sound/pcm.h                           |  2 +-
 include/sound/simple_card_utils.h             |  1 +
 include/sound/soc.h                           |  3 +
 sound/arm/aaci.c                              |  2 +-
 sound/arm/pxa2xx-ac97.c                       |  2 +-
 sound/core/pcm_misc.c                         | 14 ++---
 sound/firewire/dice/dice-pcm.c                |  2 +-
 sound/firewire/digi00x/digi00x-pcm.c          |  2 +-
 sound/firewire/fireworks/fireworks_pcm.c      |  2 +-
 sound/firewire/motu/motu-pcm.c                |  2 +-
 sound/firewire/tascam/tascam-pcm.c            |  2 +-
 sound/pci/atiixp.c                            |  2 +-
 sound/pci/cs5535audio/cs5535audio_pcm.c       |  4 +-
 sound/pci/hda/hda_controller.c                |  4 +-
 sound/pci/intel8x0.c                          |  2 +-
 sound/pci/sis7019.c                           |  2 +-
 sound/pci/via82xx.c                           |  4 +-
 sound/soc/generic/simple-card-utils.c         | 39 +++++++++++++
 sound/soc/generic/simple-card.c               | 12 ++++
 sound/soc/soc-dapm.c                          |  3 -
 sound/soc/soc-pcm.c                           | 57 +++++++++++++------
 sound/usb/caiaq/audio.c                       |  4 +-
 25 files changed, 130 insertions(+), 49 deletions(-)

-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
