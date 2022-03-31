Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6024ED0AB
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Mar 2022 02:06:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5878190B;
	Thu, 31 Mar 2022 02:05:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5878190B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648685203;
	bh=UaVkOwDkwYtQNi2ywSQmSUL/TjktmCr/9E/lbyyATKU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dHhr6upoaSutxTXk2o0GW6TF0j++dXhfCa9OGI09nxCLt3Zgc9gZFTkZ9BTjx4QkJ
	 5GzULCZPePQcRL/t0J2OSqxmV2rk+CVKDIikKV4g1CoUW5DneLTUsnNUpu8Dl7qran
	 HY3Wu7B2uJPoV+feM3Z2C7GOyP1S/5mcMKjn1Bgs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B0B8F804E4;
	Thu, 31 Mar 2022 02:05:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3ABAEF804B4; Thu, 31 Mar 2022 02:05:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from hutie.ust.cz (unknown [IPv6:2a03:3b40:fe:f0::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5C44F800B8
 for <alsa-devel@alsa-project.org>; Thu, 31 Mar 2022 02:05:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5C44F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="B0fRJWdA"
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1648685129; bh=HXScMbGBfgV0fbImwE4gIcpKqpz7fQkb4L1fzYH+Fso=;
 h=From:To:Cc:Subject:Date;
 b=B0fRJWdALfz7GcETLruf1Gh/cLy3aSP/crDVyreGkMZfOtu6HnzaB4V9e/4lj23u6
 ZaoczdY+elmFiZNsL+VSd+ioKCPFA5vbBqWIhIWskd4YdNeOjyMbdwvFsVgHEZr74/
 JpiuhFfXnbAsgIxgDJvcF2+TMHBIyOzTwF6hFDMQ=
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [RFC PATCH 0/5] Apple Macs machine-level ASoC driver
Date: Thu, 31 Mar 2022 02:04:44 +0200
Message-Id: <20220331000449.41062-1-povik+lin@cutebit.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sven Peter <sven@svenpeter.dev>, Hector Martin <marcan@marcan.st>,
 linux-kernel@vger.kernel.org, Mark Kettenis <kettenis@openbsd.org>,
 =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
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

Hi,

I put together a machine-level ASoC driver for recent Apple Macs (the
ones with ARM64 SoCs) and want to gauge opinions.

Commit 1 is the binding. It is some subset of simple-audio-card with
the extra distinction of allowing multiple CPU/CODEC DAIs per a DAI
link. I want to draw special attention to the issue of describing
speaker topologies. The way it now works is that the driver expects
the speakers to be declared in a fixed order in the sound-dai= list.
This populates a topology the driver expects on a particular machine
model. Mark (in CC) has made the suggestion of keeping the topology
descriptions with the codec nodes themselves in some generic manner,
akin to how sound-name-prefix= already helps identify codecs to the
user.

Commit 2 adds a new ASoC card method (filter_controls) to let the card
prevent some codec kcontrols from being visible to userspace. For example
the TAS2770 speaker amp driver would be happy to expose TDM slot selection
and ISENSE/VSENSE enables which is ridiculous. I am all ears on how to
make the patch acceptable to upstream.

Commit 3 makes ASoC tolerate N-to-M DAI links, not sure what the right
(simple) approach should be there. Commit 4 adds some utility function
and commit 5 is the driver itself.

Let me know what you think.

Martin

Martin Povišer (5):
  dt-bindings: sound: Add Apple Macs sound system
  HACK: ASoC: Add card->filter_controls hook
  HACK: ASoC: Tolerate N-cpus-to-M-codecs links
  ASoC: Introduce snd_soc_of_get_dai_link_cpus
  ASoC: Add macaudio machine driver

 .../bindings/sound/apple,macaudio.yaml        | 103 +++
 include/sound/soc.h                           |   7 +
 sound/soc/apple/Kconfig                       |  10 +
 sound/soc/apple/Makefile                      |   3 +
 sound/soc/apple/macaudio.c                    | 597 ++++++++++++++++++
 sound/soc/soc-core.c                          | 125 +++-
 sound/soc/soc-dapm.c                          |  34 +-
 sound/soc/soc-pcm.c                           |   3 +
 8 files changed, 860 insertions(+), 22 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/apple,macaudio.yaml
 create mode 100644 sound/soc/apple/Kconfig
 create mode 100644 sound/soc/apple/Makefile
 create mode 100644 sound/soc/apple/macaudio.c

-- 
2.33.0

