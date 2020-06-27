Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C8D20BEB1
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Jun 2020 07:02:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCBED169E;
	Sat, 27 Jun 2020 07:01:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCBED169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593234138;
	bh=rs5u6Z0ljtwWZX2Qno5ukmvdhRudIgVnqO/UEQdpKMk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u1Zs3z1alSXN5d8HxJXifs3OrQIdAYSmLeGFltxhebESRPqQg8UDQNocgz9pipuzM
	 V1By5obv6HQOXW2U3droopUtWpnbBwvUozgNHgVsjoBFWG19XWCnuwU/fqhWeT6TZT
	 z8e3KPouq/DSUsc4aL9nmKnU+IvgSANU6xeFiz7I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11D8AF80339;
	Sat, 27 Jun 2020 06:55:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3B62F80334; Sat, 27 Jun 2020 06:55:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 476A4F80321
 for <alsa-devel@alsa-project.org>; Sat, 27 Jun 2020 06:55:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 476A4F80321
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="WenHyCXa"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ef6d0ff0000>; Fri, 26 Jun 2020 21:54:23 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 26 Jun 2020 21:55:10 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 26 Jun 2020 21:55:10 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 27 Jun
 2020 04:55:10 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Sat, 27 Jun 2020 04:55:10 +0000
Received: from audio.nvidia.com (Not Verified[10.24.34.185]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5ef6d1290000>; Fri, 26 Jun 2020 21:55:10 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <kuninori.morimoto.gx@renesas.com>, <robh+dt@kernel.org>,
 <lgirdwood@gmail.com>
Subject: [PATCH v4 10/23] ASoC: simple-card: Wrong daifmt for CPU end of DPCM
 DAI link
Date: Sat, 27 Jun 2020 10:23:32 +0530
Message-ID: <1593233625-14961-11-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
References: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1593233663; bh=vVYW4f/pCLYZ36xP15PLoq3kyazclU18UxXT1+1RNpQ=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:Content-Type;
 b=WenHyCXa2EfRW78JapwtCGMLHSorz8SNRKNIwmj6pjZ7ALgXNmmvyP45PEotFqCTx
 WI49leaTGoy5YiX+B8hEZWcQskoBibzGZoliTTmxToYtXiU+tXAi5HqLb01r1FJSig
 v5IXvHy0di7PrWfVjTHFQRIve8gX0tmoWQdGbSV5joFAq3Q2Csd0imEaKWq5tsGMEy
 3f+ukwvHvf/XoYwIWQH4KdXnBivObiXsWwWUUMvUhPy9RkBUz0FB6ypksi42CrxawY
 RFC5rgqiD7sYpoy+mLh059SH9rpDAPi+z9j3cihlawuds8Lo7ZojeGeVTf6mk8TlpL
 O37E4RS+Lrfjw==
Cc: nicoleotsuka@gmail.com, alsa-devel@alsa-project.org, swarren@nvidia.com,
 Sameer Pujar <spujar@nvidia.com>, nwartikar@nvidia.com,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com, viswanathl@nvidia.com,
 sharadg@nvidia.com, thierry.reding@gmail.com, atalambedu@nvidia.com,
 linux-tegra@vger.kernel.org, digetx@gmail.com, rlokhande@nvidia.com,
 mkumard@nvidia.com, dramesh@nvidia.com
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

Consider following DPCM DAI link for example:

 simple-audio-card,dai-link@xxx {
     format = "i2s";
     bitclock-master=<&cpu1>;
     frame-master=<&cpu1>;

     cpu1: cpu@0 {
         ...
     };

     codec@0 {
         ...
     };

     ...
 };

In above case CPU is expected to be configured as a master and Codec as
a slave device. But both CPU/Codec are being configured as slave devices.
This happens because asoc_simple_parse_daifmt() uses Codec reference and
sets up the 'dai_link->dai_fmt' accordingly while parsing both CPU and
Codec. Though populating 'non_legacy_dai_naming' flag as true for CPU
component can address above issue in simple cases, but with multiple
CPU/Codecs with DPCM DAI link it becomes tricky because right now the
first Codec in the DAI link is used as reference.

This is fixed by passing current DAI link child node reference to
asoc_simple_parse_daifmt(). It parses a CPU/Codec node independently and
sets daifmt as per 'bitcloclk/frame-master' property.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/generic/simple-card.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 0f443c0..39cdc71 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -228,7 +228,7 @@ static int simple_dai_link_of_dpcm(struct asoc_simple_priv *priv,
 	if (ret)
 		goto out_put_node;
 
-	ret = asoc_simple_parse_daifmt(dev, node, codec,
+	ret = asoc_simple_parse_daifmt(dev, node, np,
 				       prefix, &dai_link->dai_fmt);
 	if (ret < 0)
 		goto out_put_node;
-- 
2.7.4

