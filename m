Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6EA467CDF
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Dec 2021 18:52:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B820D2489;
	Fri,  3 Dec 2021 18:51:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B820D2489
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638553934;
	bh=yGwScbDhyL1oOF9cERSZ73Apg4NOw/m+9XA+Lj/me2k=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MroM6CKINb/SGKcCEVhtLc06TtJfTYRqADNh93NKbLu96SEvn3uf/h9X5Y/2jHVK1
	 YPBDqBYZaU6xzAplvQq3r3erEQNIs2avqx4eiG1q0a2AOoTnOV6QWqL6zBGNVT3kgC
	 q/pLVUP7it/Vc0ZYjwSuor++diX6DA2DIuIPAzMI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2EB40F80249;
	Fri,  3 Dec 2021 18:50:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 527D2F80249; Fri,  3 Dec 2021 18:50:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BAB9DF8015B
 for <alsa-devel@alsa-project.org>; Fri,  3 Dec 2021 18:50:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BAB9DF8015B
Authentication-Results: alsa1.perex.cz;
 dkim=fail reason="signature verification failed" (2048-bit key)
 header.d=collabora.com header.i=@collabora.com header.b="Vxtjt6fa"
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: adalessandro) with ESMTPSA id 24DA11F41317
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1638553842; bh=yGwScbDhyL1oOF9cERSZ73Apg4NOw/m+9XA+Lj/me2k=;
 h=From:To:Cc:Subject:Date:From;
 b=Vxtjt6famLNA0bPuSzq3bwFuOHlAF37VLUzF6Xnh5G+AEhTP3PK68JyVyLf2GDPSM
 nukyGs3LqgrALzxv8qz6K6lUp3sngRdfKg4ZQ3zP+Sdupj96LyVycjFMvKbylR34ob
 Q0cZlKVmXEVjXVHUNLff+O4/1OCqRFhuOTpCca9ZV9VLs4oSgwLb6Af+009/xCkKDk
 WSN/5bTtQiWnYUTYdjvaeUwcAkpIQZLA6LiGbKeXWiGvz5/xJR6WxiakHvta8BN+QT
 aoM/ptM7faU2Vu1rRGdqm/W7jNx0l2Oh4E6UlLp4r/V/T57DneNnHeKaZmsGj+syxD
 +WHh8is4OL9Sg==
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/1] ASoC: fsl-asoc-card: Add missing Kconfig option for
 tlv320aic31xx
Date: Fri,  3 Dec 2021 14:50:17 -0300
Message-Id: <20211203175018.252641-1-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: ariel.dalessandro@collabora.com, kuninori.morimoto.gx@renesas.com,
 Xiubo.Lee@gmail.com, tony@atomide.com, shengjiu.wang@gmail.com, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, nicoleotsuka@gmail.com,
 broonie@kernel.org, bcousson@baylibre.com, michael@amarulasolutions.com,
 festevam@gmail.com
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

This is a follow up of patchsets:

  [RFC patch 0/5] Support BCLK input clock in tlv320aic31xx
  [PATCH 0/4] fsl-asoc-card: Add optional dt property for setting mclk-id

Patch "ASoC: fsl-asoc-card: Support fsl,imx-audio-tlv320aic31xx codec"
in "[RFC patch 0/5] Support BCLK input clock in tlv320aic31xx" missed a
Kconfig option. Sending incremental patch fix.

Regards,
Ariel

Ariel D'Alessandro (1):
  ASoC: fsl-asoc-card: Add missing Kconfig option for tlv320aic31xx

 sound/soc/fsl/Kconfig | 1 +
 1 file changed, 1 insertion(+)

-- 
2.30.2

