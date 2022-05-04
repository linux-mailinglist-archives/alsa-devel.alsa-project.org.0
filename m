Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9B751A88F
	for <lists+alsa-devel@lfdr.de>; Wed,  4 May 2022 19:10:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 647731664;
	Wed,  4 May 2022 19:09:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 647731664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651684217;
	bh=feomN2b+ZdFLensfyJb9Rv4j/KSlGbqvb8o4ekR48CU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eECtf2by59Ap4RMNCKbRhDsT6m4bbzixqKhCARuS5P6zxxiaIoJSevbsiU2G2CfNs
	 NVa+Cz4KPUpxJlRiBC0qm4j1kEdfJ4AxMe8/MvIk4ERMUykzXuBaLRV6hpLk6meAuo
	 1tHp3QRbAQfqcPnXh3OFkanbzrpoSL1GIv2TeYrk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42AB9F80526;
	Wed,  4 May 2022 19:09:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60C51F80508; Wed,  4 May 2022 19:09:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49B5AF80163
 for <alsa-devel@alsa-project.org>; Wed,  4 May 2022 19:09:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49B5AF80163
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="CCMTzY/V"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2446EsA5021058;
 Wed, 4 May 2022 12:09:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=2beTP+VHsh/r8Jl6uXGaBqsuGkWb7YUrylFfVtD6Gsg=;
 b=CCMTzY/V7jJpjIyoXbvnwOKxirh9bHl07d4K3TuBJe6hG5bW6ppzMODC6DmPbNkdYDvE
 IqZNsCZzKzNCL7clpyswkhPSKkG6apwJSbL2B9jxJzS5TPXbFaKNC9QX1SI1q5B3XNia
 1WbAj70Y2OlbEutAADaAvwyeRBepo62/tctS6OF1zj5z8xEvtzct00AMiAhOck/sFDaQ
 WVgwTNEvngA0bGG1/9mMce13zoh27AiteP64Iq7f7NQXuYW6fE0+EYv05VYFcRxbPycu
 pqks87/5/nQjIGh8FIJ/eAnvvzr6dU6JtTgFv5ZWijdw47SfHP4E2alt1JUdfR8k9Ufy 1Q== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3fs1hpcxs0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 04 May 2022 12:09:08 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 4 May
 2022 18:09:05 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Wed, 4 May 2022 18:09:05 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 2B7F3459;
 Wed,  4 May 2022 17:09:05 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 00/38] Clean up usage of the endianness flag
Date: Wed, 4 May 2022 18:08:27 +0100
Message-ID: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: GXNTo8I6X7-bi8nNsAYS80XtharKQek4
X-Proofpoint-GUID: GXNTo8I6X7-bi8nNsAYS80XtharKQek4
X-Proofpoint-Spam-Reason: safe
Cc: oder_chiou@realtek.com, steven.eckhoff.opensource@gmail.com,
 alexandre.belloni@bootlin.com, lars@metafoo.de,
 kuninori.morimoto.gx@renesas.com, kmarinushkin@birdec.com,
 patches@opensource.cirrus.com, linux-mediatek@lists.infradead.org,
 lgirdwood@gmail.com, jiaxin.yu@mediatek.com, tzungbi@google.com,
 srinivas.kandagatla@linaro.org, matthias.bgg@gmail.com,
 chrome-platform@lists.linux.dev, codrin.ciubotariu@microchip.com,
 alsa-devel@alsa-project.org, bleung@chromium.org, cychiang@chromium.org
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

Before componentisation any part registered as a CODEC would have
automatically supported both little and big endian, ie. the core
would duplicate any supported LE or BE PCM format to support the other
endian as well. As componentisation removed the distinction between
CODEC drivers and platform drivers, a flag was added to specify
if this behaviour is required for a particular component. However,
as most systems tend to use little endian the absence of the flag
is rarely noticed. Also the naming of the flag "endianness" is a
little unobvious as to if it should be applied to a particular
component.

This series adds a comment to better explain the meaning of the
flag and then tidys up the usage of the flag. A couple of uses
of the flag are removed where is has been used inappropriately
on the CPU side of the DAI link, this is clearly not valid in the
cases it has been used, and I suspect never would be valid. Then
some redundant formats are removed, since they would be covered by
existing endianness flags. And finally a bunch of devices that are
missing the flag have it added.

It is worth noting that since componenisation there are now a couple
of cases where it is not entire clear to me that the flag should
be applied to all CODECs as it was before. In those cases I haven't
updated the driver to add the flag and they are outlined here:

1) Build into the AP CODECs, these are actual silicon inside the main
processor and they typically receive audio directly from an internal
bus. It is not obvious to me that these can happily ignore endian. On
the CODEC side these include: jz4725b.c, jz4760.c, jz4770.c,
rk3328_codec.c, lpass-va-macro.c, lpass-rx-macro.c, lpass-tx-macro.c,
lpass-wsa-macro.c. There are also some examples of this scattered
around the various platform support directories in sound/soc.

2) Devices behind non-audio buses, SPI just moves bits and doesn't
really define an endian for audio data on the bus. Thus it seems the
CODEC probably can care about the endian. The only devices that fall
into this group (mostly for AoV) are: rt5514-spi.c, rt5677-spi.c,
cros_ec_codec.c (only the AoV).

3) CODECs with no DAIs, these could specify the flag and plenty of
them do; CODECs from the initial conversion to componentisation. But
the flag makes no difference here since there is nothing for it to
apply to. This includes purely analogue CODECs: aw8738.c, ssm2305.c,
tpa6130a2.c, tda7419.c, max9759.c, max9768.c, max9877.c, lm4857.c,
simple-mux.c, simple-amplifier.c. And devices that only do jack
detection: ts3a227e.c, mt6359-accdet.c.

If there are any opinions on adding the flag to any of those three
groups they would be greatfully received. But I am leaning towards
leaving 1,2 without endianness flags since it feels inappropriate,
and removing the endian flag from devices in catagory 3 that already
have it. Assuming no one objects to that I will do a follow up
series for that.

Thanks,
Charles

Charles Keepax (38):
  ASoC: soc-component: Add comment for the endianness flag
  ASoC: atmel-pdmic: Remove endianness flag on pdmic component
  ASoC: atmel-classd: Remove endianness flag on class d component
  ASoC: cs4270: Remove redundant big endian formats
  ASoC: cs42l51: Remove redundant big endian formats
  ASoC: cs4349: Remove redundant big endian formats
  ASoC: hdmi-codec: Remove redundant big endian formats
  ASoC: sta32x: Remove redundant big endian formats
  ASoC: sta350: Remove redundant big endian formats
  ASoC: hdac_hda: Add endianness flag in snd_soc_component_driver
  ASoC: max98504: Add endianness flag in snd_soc_component_driver
  ASoC: adau1372: Add endianness flag in snd_soc_component_driver
  ASoC: cs4234: Add endianness flag in snd_soc_component_driver
  ASoC: cs35l41: Add endianness flag in snd_soc_component_driver
  ASoC: cx2072x: Add endianness flag in snd_soc_component_driver
  ASoC: lochnagar: Add endianness flag in snd_soc_component_driver
  ASoC: mt6351: Add endianness flag in snd_soc_component_driver
  ASoC: mt6358: Add endianness flag in snd_soc_component_driver
  ASoC: mt6359: Add endianness flag in snd_soc_component_driver
  ASoC: mt6660: Add endianness flag in snd_soc_component_driver
  ASoC: pcm3060: Add endianness flag in snd_soc_component_driver
  ASoC: rt1019: Add endianness flag in snd_soc_component_driver
  ASoC: rt9120: Add endianness flag in snd_soc_component_driver
  ASoC: tlv320adc3xxx: Add endianness flag in snd_soc_component_driver
  ASoC: tscs454: Add endianness flag in snd_soc_component_driver
  ASoC: cros_ec_codec: Add endianness flag in i2s_rx_component_driver
  ASoC: wcd934x: Add endianness flag in snd_soc_component_driver
  ASoC: wcd9335: Add endianness flag in snd_soc_component_driver
  ASoC: rt700: Add endianness flag in snd_soc_component_driver
  ASoC: rt711: Add endianness flag in snd_soc_component_driver
  ASoC: rt711-sdca: Add endianness flag in snd_soc_component_driver
  ASoC: rt715: Add endianness flag in snd_soc_component_driver
  ASoC: rt715-sdca: Add endianness flag in snd_soc_component_driver
  ASoC: rt1308-sdw: Add endianness flag in snd_soc_component_driver
  ASoC: rt1316-sdw: Add endianness flag in snd_soc_component_driver
  ASoC: wcd938x: Add endianness flag in snd_soc_component_driver
  ASoC: wsa881x: Add endianness flag in snd_soc_component_driver
  ASoC: sdw-mockup: Add endianness flag in snd_soc_component_driver

 include/sound/soc-component.h    |  9 +++++++++
 sound/soc/atmel/atmel-classd.c   |  1 -
 sound/soc/atmel/atmel-pdmic.c    |  1 -
 sound/soc/codecs/adau1372.c      |  1 +
 sound/soc/codecs/cros_ec_codec.c |  7 ++++---
 sound/soc/codecs/cs35l41.c       |  2 ++
 sound/soc/codecs/cs4234.c        |  1 +
 sound/soc/codecs/cs4270.c        | 15 +++------------
 sound/soc/codecs/cs42l51.c       |  7 ++-----
 sound/soc/codecs/cs4349.c        |  9 +++------
 sound/soc/codecs/cx2072x.c       |  1 +
 sound/soc/codecs/hdac_hda.c      | 15 ++++++++-------
 sound/soc/codecs/hdmi-codec.c    | 15 +++++----------
 sound/soc/codecs/lochnagar-sc.c  |  5 +++--
 sound/soc/codecs/max98504.c      |  1 +
 sound/soc/codecs/mt6351.c        | 10 ++++------
 sound/soc/codecs/mt6358.c        | 10 ++++------
 sound/soc/codecs/mt6359.c        | 10 ++++------
 sound/soc/codecs/mt6660.c        |  1 +
 sound/soc/codecs/pcm3060.c       |  1 +
 sound/soc/codecs/rt1019.c        |  3 ++-
 sound/soc/codecs/rt1308-sdw.c    |  1 +
 sound/soc/codecs/rt1316-sdw.c    |  1 +
 sound/soc/codecs/rt700.c         |  1 +
 sound/soc/codecs/rt711-sdca.c    |  1 +
 sound/soc/codecs/rt711.c         |  1 +
 sound/soc/codecs/rt715-sdca.c    |  1 +
 sound/soc/codecs/rt715.c         |  1 +
 sound/soc/codecs/rt9120.c        |  1 +
 sound/soc/codecs/sdw-mockup.c    |  1 +
 sound/soc/codecs/sta32x.c        |  9 +++------
 sound/soc/codecs/sta350.c        |  9 +++------
 sound/soc/codecs/tlv320adc3xxx.c | 11 ++++++-----
 sound/soc/codecs/tscs454.c       | 12 ++++++------
 sound/soc/codecs/wcd9335.c       |  1 +
 sound/soc/codecs/wcd934x.c       |  1 +
 sound/soc/codecs/wcd938x.c       |  1 +
 sound/soc/codecs/wsa881x.c       |  1 +
 38 files changed, 90 insertions(+), 89 deletions(-)

-- 
2.30.2

