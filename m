Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 831C44C8BE0
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Mar 2022 13:43:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1CC41ADA;
	Tue,  1 Mar 2022 13:42:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1CC41ADA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646138603;
	bh=5Pwfcm6aNmDj0mI6EWjI98AtfbDm2xOFOnRK6rvWcdM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DRwsS7cG4LcKjj601p4dJC8maJl+dox8BfNreKJV5tR/Gy+gL0Q2eNzwTUDHxJAda
	 fLureSK1BakNAYfgupbPnoyOLt3xZVH/qrED9KS0/giNe3o3QfWZUQuMtYtOAbLEoW
	 pNuhy4mlRtxEAY65FkKtPC7jRs2wGhVwSF/o+Bmk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75A8DF802DB;
	Tue,  1 Mar 2022 13:42:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49379F802DB; Tue,  1 Mar 2022 13:42:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2DA9F80095
 for <alsa-devel@alsa-project.org>; Tue,  1 Mar 2022 13:42:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2DA9F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="AYIBRWCl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1646138525;
 s=strato-dkim-0002; d=gerhold.net;
 h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
 bh=6ESSSYUXH0g5xxYHZ1NDK6bk0HEPMFivAANN8KZKLTE=;
 b=AYIBRWCl7An1D4P1vV0qv8goHz4YZK9LitlDcycS2x+a6c8HXfypiARhNyC0LzMPK+
 6keDMByZv94HXpbM4OaRGzqVRoLyBSLHlHtymEuQ9G947Qp3jjaGUIyuRq0CUp0zw9xR
 +tdLPO/XyI7Ucne/VErxiG2yBVw//6Dmej5ys3fPBbKcU1+nnCLlXDyCfYCrl9zyxDFx
 nTVQ6o8UoeyFRWBYvJf0SQ5ryZysy1Rn1pF/++MUkmDoBRB/vfzRCbqxEVgNBVPhB4IN
 cOIurxHZ7zO4SszEJzcbyY0w+vqwSn+ld9j77cJC2h3Vv9yoMASJeFnZ/zyLe05e33d7
 ToOA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQ7UOGqRde+a0fiL2ZP6Q"
X-RZG-CLASS-ID: mo00
Received: from droid.. by smtp.strato.de (RZmta 47.40.1 AUTH)
 with ESMTPSA id kdc58dy21Cg3a4m
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 1 Mar 2022 13:42:03 +0100 (CET)
From: Stephan Gerhold <stephan@gerhold.net>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/2] ASoC: codecs: Add Awinic AW8738 audio amplifier driver
Date: Tue,  1 Mar 2022 13:37:40 +0100
Message-Id: <20220301123742.72146-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Stephan Gerhold <stephan@gerhold.net>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht,
 Jonathan Albrieux <jonathan.albrieux@gmail.com>
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

This series adds a simple driver and DT schema for the Awinic AW8738 
audio amplifier. It's fairly simple - the main difference to 
simple-amplifier is that there is a "one-wire pulse control" that 
allows configuring the amplifier to one of a few pre-defined modes.

Jonathan Albrieux (1):
  ASoC: codecs: Add Awinic AW8738 audio amplifier driver

Stephan Gerhold (1):
  ASoC: dt-bindings: Add schema for "awinic,aw8738"

 .../bindings/sound/awinic,aw8738.yaml         |  48 ++++++++
 sound/soc/codecs/Kconfig                      |  10 ++
 sound/soc/codecs/Makefile                     |   2 +
 sound/soc/codecs/aw8738.c                     | 104 ++++++++++++++++++
 4 files changed, 164 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/awinic,aw8738.yaml
 create mode 100644 sound/soc/codecs/aw8738.c

-- 
2.35.1

