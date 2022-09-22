Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1CE5E706D
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Sep 2022 02:01:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2429C1F2;
	Fri, 23 Sep 2022 02:00:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2429C1F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663891261;
	bh=XI3oHZqDLqJjLNw81Hk83f5UFOa5J7x8UqAktxIuW38=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=C80sQCxxiGvNGsGW/upStYjugaWV8zib2OF8QsK92Mhk2BvcRnfAdZM9/TNht6C5q
	 Li+HueumsKvoq8O5JESnM6qMg25jaUjwEhmF/Q7X7WplfisszX1W7yeQRikqegNkk6
	 i+dKAKMzk8SSPJREp1KXUqPSngBvSnOz+wlwNwmE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F86CF8027B;
	Fri, 23 Sep 2022 02:00:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8F5DF8027B; Fri, 23 Sep 2022 02:00:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E7DA2F80107
 for <alsa-devel@alsa-project.org>; Fri, 23 Sep 2022 01:59:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7DA2F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="knOY+Gi2"
Received: from notapiano.myfiosgateway.com (unknown [71.190.76.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 1E0D76602229;
 Fri, 23 Sep 2022 00:59:55 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1663891197;
 bh=XI3oHZqDLqJjLNw81Hk83f5UFOa5J7x8UqAktxIuW38=;
 h=From:To:Cc:Subject:Date:From;
 b=knOY+Gi223BPJ4Tvih1evj2OSeaF5P6zcFgDAyjXpgbYQ4Mh0hIS2g+c00gB/eQEh
 u7upkEyny6/K8T+scWUOQeUixpGnynKlUWfRTX0iA/KnycVTGYX6RYTK6ZuQebDC4R
 2nk9Nm47p/OzFYhgmbTrCHzVOo9roJOrGq1djpnR0wPVHDYAto+dDXwzNn92AOOVte
 B/mihfKE8PUCKfUbOwIuiVVyX9xwA3CK2iWxk1XeOzo4GszZBZ0ykgEt6HBjlYCAdS
 VmuxwbXJHxF+Uq3VLy4Gc6JHCJdRmMUcMAho6zy1M5FoMttw1di1/4816b731cAZkj
 z44E2JwJ4jzXA==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/6] ASoC: mediatek: Allow separate handling of headphone and
 headset mic jack
Date: Thu, 22 Sep 2022 19:59:45 -0400
Message-Id: <20220922235951.252532-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Miaoqian Lin <linmq006@gmail.com>,
 "chunxu.li" <chunxu.li@mediatek.com>,
 =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Tzung-Bi Shih <tzungbi@google.com>,
 linux-mediatek@lists.infradead.org, Trevor Wu <trevor.wu@mediatek.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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


This series allows the headphone and headset mic jack status to be
handled separately by userspace on MT8192, MT8195 and MT8186.

Changes based on commit d0508b4f1604 ("ASoC: rk3399_gru_sound: Add DAPM
pins, kcontrols for jack detection"). Found while searching for an
alternative for JackSwitch [1].

[1] https://lore.kernel.org/all/b98a8a77-7652-1995-27ba-eb7b6d30202a@gmail.com/


Nícolas F. R. A. Prado (6):
  ASoC: mediatek: mt8192-mt6359: Expose individual headset jack pins
  ASoC: mediatek: mt8195: Expose individual headset jack pins
  ASoC: mediatek: mt8186-da7219: Add headset widgets with switches
  ASoC: mediatek: mt8186-da7219: Expose individual headset jack pins
  ASoC: mediatek: mt8186-rt5682: Add headset widgets with switches
  ASoC: mediatek: mt8186-rt5682: Expose individual headset jack pins

 .../mt8186/mt8186-mt6366-da7219-max98357.c    | 25 +++++++++++++++++--
 .../mt8186/mt8186-mt6366-rt1019-rt5682s.c     | 25 +++++++++++++++++--
 .../mt8192/mt8192-mt6359-rt1015-rt5682.c      | 17 +++++++++++--
 sound/soc/mediatek/mt8195/mt8195-mt6359.c     | 17 +++++++++++--
 4 files changed, 76 insertions(+), 8 deletions(-)

-- 
2.37.3

