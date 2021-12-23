Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F82D47E32F
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Dec 2021 13:26:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 657101910;
	Thu, 23 Dec 2021 13:25:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 657101910
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640262403;
	bh=16hyhifqlJw3MOpeqh1sXe/x7sXeQH/LVJtY7EOiWno=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DopyWixkbPVytBSslRxfrJ6GcwTVXPySEdFwEhHtQIO3qYGjzx8W3nK5zEVojU+6c
	 cs6Vdz7wC0Pu3OJVb7MJjjN0hhbMorn9eQ6u1tpLBfZmzVRXPo6wUDhio7F0a/S62a
	 F27dUNaxQwTxm/3+DV2crOjWlDKq2UaLVUtjcVSE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 730B4F804E4;
	Thu, 23 Dec 2021 13:25:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8F17CF804EB; Thu, 23 Dec 2021 13:25:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org
 [IPv6:2001:67c:2050::465:102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 07772F800FF
 for <alsa-devel@alsa-project.org>; Thu, 23 Dec 2021 13:24:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07772F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org
 header.b="MuD5cR/m"
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:4:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4JKTsZ714bzQjf1;
 Thu, 23 Dec 2021 13:24:50 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1640262288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=aKcMJ+j2oyWpNwagklOb+qQvqMvdN8cr0o6AoVgyaHc=;
 b=MuD5cR/m8AYNiIEcP9IXw2JpBwT+zbjuYta36LHUX0URRpgUQ5RCil8wWakye1peNQmbMq
 MXijqQEF1vdSOE087O6S0m70mX2q5mXewA9SRziyMTBEmKxlZD2Rs9xZeWLeeFLeepAr6B
 1jiRlatxkFDkgfFH7rH1rUWiO0cuv3ANVoZtONocGzAQWArchRPmFpaUUNEXy77yuq4Vt8
 mmpYvCZIOaVgpNegNlY5sQGvCU3IJndlKDyU0G/QiyAfs/RYU/tOjf8ZSgCRXbBLoYV+8S
 ovhYqnkR81t2YlBipaW1/I0DRAgDkbtbLXcP+1QOgLggwaNwtjow2kQPBQcr1w==
From: Alexander Stein <alexander.stein@mailbox.org>
To: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 0/3] More amlogic sound-name-prefix DT fixes
Date: Thu, 23 Dec 2021 13:24:31 +0100
Message-Id: <20211223122434.39378-1-alexander.stein@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Alexander Stein <alexander.stein@mailbox.org>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org
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

Following up [1] here are more fix for missing sound-name-prefix properties in
the arch/arm64/boot/dts/amlogic/ subtree.

[1] https://www.spinics.net/lists/devicetree/msg466125.html

Alexander Stein (3):
  dt-bindings: display: meson-dw-hdmi: add missing sound-name-prefix
    property
  ASoC: dt-bindings: spdif-dit: add missing sound-name-prefix property
  ASoC: dt-bindings: aiu: spdif-dit: add missing sound-name-prefix
    property

 .../devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml   | 5 +++++
 Documentation/devicetree/bindings/sound/amlogic,aiu.yaml     | 5 +++++
 Documentation/devicetree/bindings/sound/linux,spdif-dit.yaml | 5 +++++
 3 files changed, 15 insertions(+)

-- 
2.34.1

