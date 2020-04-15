Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7A91AAB2F
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Apr 2020 17:01:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32DE61676;
	Wed, 15 Apr 2020 17:01:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32DE61676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586962918;
	bh=R2ui3V1fBRvMg6XwEcl5g0t1TMGJAyL118heTVC002E=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=q2A07Hqn4GSloFaU93O5Zk8bI+iBqZD/Cisn7yDf0rGyGH4wnH/2PFS8LszZHg/rJ
	 yihY7KgBdHp8fXLoX90E7L946zE9QHuyYhow6S/39xGtm8hIrfGxCf4k7Vq8wwcyYh
	 CaqbMVfh0Q/rDG7UbSISpYtzToJsWPY8CbL3OM4A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64F2AF802BE;
	Wed, 15 Apr 2020 16:58:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42508F80245; Wed, 15 Apr 2020 16:10:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE
 autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BCEA0F80115
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 16:10:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BCEA0F80115
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1M433w-1jOikV1ArA-0008D6; Wed, 15 Apr 2020 16:10:43 +0200
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
 by mail.cetitecgmbh.com (Postfix) with ESMTP id 0D300650EBC;
 Wed, 15 Apr 2020 14:10:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
 by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com
 [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a9FxySuCWEi3; Wed, 15 Apr 2020 16:10:41 +0200 (CEST)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
 by mail.cetitecgmbh.com (Postfix) with ESMTPS id A77C564C0D9;
 Wed, 15 Apr 2020 16:10:41 +0200 (CEST)
Received: from pflmmbl.corp.cetitec.com (10.8.5.60) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Wed, 15 Apr 2020 16:10:41 +0200
From: Matthias Blankertz <matthias.blankertz@cetitec.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/2] ASoC: rsnd: Fixes for multichannel HDMI audio output
Date: Wed, 15 Apr 2020 16:10:15 +0200
Message-ID: <20200415141017.384017-1-matthias.blankertz@cetitec.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.8.5.60]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536B647460
X-Provags-ID: V03:K1:ls00uf4IlbrL5k+iWkD/WTmWYJj2Y84rUbhh+RZdOmEf3f68PT4
 FNEAZa4F7Phw66UR0nWjFpSj8t3Voz1xizvTTK53uk9EADtZ/ZitvNm85mdgfti69qH5I6a
 UinE9tuhDB0krwi7u8TPxThlkypNIWsC2fBFky4+MKCdLbwLUA/ZpnQ0gmR5QyyZnHw6A8N
 SX51zgcEnCyz2rJlqvYYg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:jytcsZGxxWc=:QLEgfUO1mDZFEbghCIOVbk
 KY+vl+FRwGZVX9VdnmNGQ6fM4ZUfxE6XOkLI077L9TkwYRBnBXzKcVeqYliL1Q2mV+1krDhQ6
 xrSmfpQUMiDNkobLrBMGVHbAzsbUs6IBqNp7H+//64Dyrlmz6MS8lhnUoVnNnNMr/wTrnR9FM
 uYNwExBslY3O1/9A2KrKX0lSXJLk2DyYBRzQoe2DgwQQJyWckGy/vR1X7qrvbVYkWZbYDtkTY
 iOMF1RvasrIZVG2abdGuXQoxBkAKjUyx6Uod+7UOD7emQoBKCtp1oe6Jpr3g49IFbKRT7pMOM
 gmYiyyiDxEDCRoidNw2p5sfyKiN4I+gXNfs4bkEDy4m5GsnBQRwNIO8gYnrZK1APEyU4C+617
 lyG5PDKwP6m23PSdajBjRTyiQblQBAAMk7M8ldOM4h16as43qnrqrmwGejLHElNva0Rt5UuRk
 f3PYk2i8fD35JeRwsuZQChyc1Xyf5S5MS34WIRwZxla1sz2A9oHff3pvxRHKL8Yu3jkxCzkR9
 SyvMqAyxjLprSDRe20DED+C9DDYMY6j4FwSUh/Xyw2N/Jxy4XKrMj6s7WrvuJlNsTOMGUkSzA
 5/cr+B20n9elSaNcdGRwIGGMuhI4YH54Jjynpm7etXzSazH48vIScId0YUnL6du+UaJyMyYZz
 r4YDm9AJrRfAL9J2txtkE0GvTkvvNCe5xH9BFMj++CtyRgYFYQtNcRMCRlmkN/kArtDEu8uvv
 OSDK7PfRzQPfozY+pxYJTeURAeQkMNkDpgoFJMNFUPrtUl0qwnIdC0Xo0/IjygnHU2UBKRFbw
 YqD9znHvaYh/PPI5m3GFlY34NtLW+uz06NpxrjVqO8wx1z3dDV1xhvxgYfHWzKCQkUk+IfrL5
 s4eP2fOsKWedPqZtPvYw==
X-Mailman-Approved-At: Wed, 15 Apr 2020 16:57:55 +0200
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-renesas-soc@vger.kernel.org
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

This fixes two issues in the snd-soc-rcar driver blocking multichannel
HDMI audio out: The parent SSI in a multi-SSI configuration is not
correctly set up and started, and the SSI->HDMI channel mapping is
wrong.

With these patches, the following device tree snippet can be used on an
r8a7795-based platform (Salvator-X) to enable multichannel HDMI audio on
HDMI0:

rsnd_port1: port@1 {
	rsnd_endpoint1: endpoint {
		remote-endpoint = <&dw_hdmi0_snd_in>;

		dai-format = "i2s";
		bitclock-master = <&rsnd_endpoint1>;
		frame-master = <&rsnd_endpoint1>;

		playback = <&ssi0 &ssi1 &ssi2 &ssi9>;
	};
};

With a capable receiver attached, all of 2ch (stereo), 6ch (e.g. 5.1)
and 8ch audio output should work.


Matthias Blankertz (2):
  ASoC: rsnd: Fix parent SSI start/stop in multi-SSI mode
  ASoC: rsnd: Fix HDMI channel mapping for multi-SSI mode

 sound/soc/sh/rcar/ssi.c  | 8 ++++----
 sound/soc/sh/rcar/ssiu.c | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)


base-commit: 7111951b8d4973bda27ff663f2cf18b663d15b48
-- 
2.26.0

