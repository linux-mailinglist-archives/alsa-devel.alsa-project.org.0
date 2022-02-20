Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E244BCB42
	for <lists+alsa-devel@lfdr.de>; Sun, 20 Feb 2022 01:20:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 671A516E0;
	Sun, 20 Feb 2022 01:19:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 671A516E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645316430;
	bh=CjW1qSeHC9/OWs28PAMcgi7i8z5QAYnN2OeQMhwRnhQ=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eLcTP1BiVZaevHUR1/nJOGlzzg98GSOOXo19jy9bqEXDOrywkuuHpPSmFqWDPFf4l
	 PrfecXPd26f8sa6LAQgNomRkBLjw1C2ZgN6cAnflwlsIHB35+VGzJgwzW+NlyZbj3n
	 8LYqVzBXi+UjKNKtRMeVM5zEDYg3nr7nS3atlIEU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D74B5F8014B;
	Sun, 20 Feb 2022 01:19:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CBB23F8016A; Sun, 20 Feb 2022 01:19:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from sender11-of-o51.zoho.eu (sender11-of-o51.zoho.eu
 [31.186.226.237])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B426FF800EB
 for <alsa-devel@alsa-project.org>; Sun, 20 Feb 2022 01:19:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B426FF800EB
ARC-Seal: i=1; a=rsa-sha256; t=1645316342; cv=none; d=zohomail.eu; s=zohoarc; 
 b=ANJbQkDemwckzFSq+2xpdp8T2cyPG9vn8p476qj5LWOs51BQPu3EzGnJ92NVZTu21KcC/vByCKjifnFIglMzop/se9/LdkUBuLBnnaPEPB/5GGzhN/9jrXsZY/NTLtIetHi1SsLVPvvRwLyv2d0tCxDbBOk2pI/MkRNFTDDr7Ms=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu;
 s=zohoarc; t=1645316342;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=3HCff0o6L0WKF7HPzVEAjwajRGUlkG9L5kSxZwlqVrk=; 
 b=fUbKkdkQ+biq2Ebzk9Cm94OeWoaFS3WVf0B1Ezkke+8HdDxD72n+uv/SV6qvAhfc71P23TgvMBKQWxhYmwWwZuQAgIb0E/xI749twmEWMxrUL4G8/LtVAZkK/jTsa4vr5s4U0YHcqkDIn8pgi0bVL3cjYnHDnb8EFZjpcmsxhCY=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
 spf=pass  smtp.mailfrom=philipp@uvos.xyz;
 dmarc=pass header.from=<philipp@uvos.xyz>
Received: from UVOSLinux (ip-037-201-192-120.um10.pools.vodafone-ip.de
 [37.201.192.120]) by mx.zoho.eu
 with SMTPS id 1645316339280515.4397359881773;
 Sun, 20 Feb 2022 01:18:59 +0100 (CET)
Date: Sun, 20 Feb 2022 01:18:58 +0100
From: Carl Philipp Klemm <philipp@uvos.xyz>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 6/6] Documentation: sound: audio-graph-card: update dts
 bindings to add has-hp-jack
Message-Id: <20220220011858.d07e957747d22299a1c37df8@uvos.xyz>
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
 Documentation/devicetree/bindings/sound/audio-graph.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/audio-graph.yaml b/Documentation/devicetree/bindings/sound/audio-graph.yaml
index 4b46794e5153..5844b900789a 100644
--- a/Documentation/devicetree/bindings/sound/audio-graph.yaml
+++ b/Documentation/devicetree/bindings/sound/audio-graph.yaml
@@ -38,6 +38,8 @@ properties:
     maxItems: 1
   mic-det-gpio:
     maxItems: 1
+  hp-det-gpio:
+    description: Set this properties if the device has a headphone jack to be reported on by a snd_soc_component
 
 required:
   - dais
-- 
2.35.1

