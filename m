Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC11A4BCB40
	for <lists+alsa-devel@lfdr.de>; Sun, 20 Feb 2022 01:18:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 890D416AB;
	Sun, 20 Feb 2022 01:17:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 890D416AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645316284;
	bh=l0xCggp3Yorfo51MhNJ5eHrZulTF5l9FLnm8udQmpJU=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g/8U+BQomsJTK3B6ogjta7UHuGhjhr5c2rnvcdHC8h+gJzldBh+VQ/MSjh4g9b2ns
	 6rBGi7Zz3cHfYq5WcyHSjPW6XEurkBX3d7obzzc9driOUYEkn4JiZOaKxRrO5fM7Wx
	 9cO6DIMq9YKZFBP1+iYVShYN3RsiviBInBWVIkaM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77A2EF80524;
	Sun, 20 Feb 2022 01:16:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 254B1F80518; Sun, 20 Feb 2022 01:16:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from sender11-of-o51.zoho.eu (sender11-of-o51.zoho.eu
 [31.186.226.237])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F69CF804AA
 for <alsa-devel@alsa-project.org>; Sun, 20 Feb 2022 01:16:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F69CF804AA
ARC-Seal: i=1; a=rsa-sha256; t=1645316162; cv=none; d=zohomail.eu; s=zohoarc; 
 b=BpN+CjmxVbFd5iL6o3ttWjd6VLBrUp8QsteaPHo/XeNSDzCisLhxM/VT0d4J2x74fNOYf/G6iYJTBJmsD2YLlCrTBj2b0uIs6ePznBpuMXGWzbPzAXnVGjJ33jV2sdtyygCpaPScMpaIkPcplCpp8Dzd+H0BfJN21cmulH6DHco=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu;
 s=zohoarc; t=1645316162;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=SS8zOxqh5kA3jFU2G4euNrkYb3yGEgk+OrxXHHhdCYg=; 
 b=Fh+YYavSUi7RcaBNxvCmYl5ppYu3aSYMZVQ8olmOqNaEkb5iiskpTwCbrtAC9ApXabQYNdaa2JZ6ttYbWkrdHoRL40HTv8cBpCHYd1wE/2/cU6NeqX776otHh8o8dhKPBKH/+AIOoBI5HZyj2p+77bPWo7S0VSZL6LtIdAgIfao=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
 spf=pass  smtp.mailfrom=philipp@uvos.xyz;
 dmarc=pass header.from=<philipp@uvos.xyz>
Received: from UVOSLinux (ip-037-201-192-120.um10.pools.vodafone-ip.de
 [37.201.192.120]) by mx.zoho.eu
 with SMTPS id 16453161602811012.2654051731125;
 Sun, 20 Feb 2022 01:16:00 +0100 (CET)
Date: Sun, 20 Feb 2022 01:15:59 +0100
From: Carl Philipp Klemm <philipp@uvos.xyz>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 5/6] ARM: dts: motorola-mapphone: add has-hp-jack for
 audio-graph-card
Message-Id: <20220220011559.474b4f7cacdef2865a6780f3@uvos.xyz>
In-Reply-To: <OS3PR01MB8426FD3FD1B45BB31C971A56D4509@OS3PR01MB8426.jpnprd01.prod.outlook.com>
References: <20211228190931.df5d518220080a734532ebfd@uvos.xyz>
 <87a6gawxpe.wl-kuninori.morimoto.gx@gmail.com>
 <20220105101028.620b7f2cb7727eedfccd933e@uvos.xyz>
 <87r19ld48v.wl-kuninori.morimoto.gx@gmail.com>
 <20220108145749.f55500222b049f344415a5c3@uvos.xyz>
 <OS3PR01MB8426FD3FD1B45BB31C971A56D4509@OS3PR01MB8426.jpnprd01.prod.outlook.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tony@atomide.com" <tony@atomide.com>,
 "merlijn@wizzup.org" <merlijn@wizzup.org>, "sre@kernel.org" <sre@kernel.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "kuninori.morimoto.gx@gmail.com" <kuninori.morimoto.gx@gmail.com>
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

Signed-off-by: Carl Philipp Klemm <philipp@uvos.xyz>
---
 arch/arm/boot/dts/motorola-mapphone-common.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/motorola-mapphone-common.dtsi b/arch/arm/boot/dts/motorola-mapphone-common.dtsi
index e26950d8ca85..800017ce096f 100644
--- a/arch/arm/boot/dts/motorola-mapphone-common.dtsi
+++ b/arch/arm/boot/dts/motorola-mapphone-common.dtsi
@@ -150,6 +150,8 @@ soundcard {
 			"Headphone Jack", "HSR",
 			"MICR", "Internal Mic";
 
+		has-hp-jack;
+
 		dais = <&mcbsp2_port>, <&mcbsp3_port>;
 	};
 
-- 
2.35.1
