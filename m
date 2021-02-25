Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3A832552A
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Feb 2021 19:08:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2122B1680;
	Thu, 25 Feb 2021 19:07:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2122B1680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614276518;
	bh=96qwSzlHZcvcA0o1NyC+sdolrRgJiHCaqC/S5iEvO4c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gRwDgDntcbnYYWGpQ5IIXInbwjidYFvXkvg9QS5SAQwrWMgua7B/ADn2AT9SjEMJZ
	 4467WOj7Deb9oblYgAspIjXZOEbE3+XjcAAvAzG8c2EoOeJ6ClEE/N5Jr4R4PkyzuW
	 +vlVGJZ41HQOC4f0FPyZcudsQWwW60L1r5LyWQMY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30867F802E0;
	Thu, 25 Feb 2021 19:06:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC557F8016D; Thu, 25 Feb 2021 19:06:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 233B2F80169
 for <alsa-devel@alsa-project.org>; Thu, 25 Feb 2021 19:06:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 233B2F80169
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="rjwIH2Ek"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B6037e72f0000>; Thu, 25 Feb 2021 10:06:39 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 25 Feb
 2021 18:06:38 +0000
Received: from audio.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 25 Feb 2021 18:06:36 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <robh@kernel.org>
Subject: [RFC PATCH 1/5] ASoC: soc-component: Fix return value of
 snd_soc_component_set_pll()
Date: Thu, 25 Feb 2021 23:36:00 +0530
Message-ID: <1614276364-13655-2-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614276364-13655-1-git-send-email-spujar@nvidia.com>
References: <1614276364-13655-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1614276399; bh=MRsEzDmf7J4bxm3LNb2m3+5Sy3ePQpn1ormjOx9bR/Y=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Type;
 b=rjwIH2EkYa0ZBOPnaNJu7vhjIgmBT2tQ8vnw6WoTJB9a5ab17z4EgJSmbwECxUM4O
 FpxT9CjPwJQRe001VBcNuN4szeZscfAf92f5sekbJYkU2AaWe02c8AErvX7C9DVKQd
 FxS35NvFyuprX6GiJ7HcsTvXVut34PGx4PDRxfgua7ZXxMOnVMjQCLjchyDYtHJabB
 SB4ApQEEvW5UxhECAlmf94Nfah26k5+sVHSYll3BejpAbSV9triIpPCB3ZOSYwtVJe
 7FPubV607Hul0rT4/1tO6uYwZnd9QlAv6LhqnSTy6eoQqcb1HV+8Qxoyy26WbXZRrm
 mUmC4Lr+xT0Pw==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, Sameer Pujar <spujar@nvidia.com>,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com
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

snd_soc_component_set_pll() returns "-EINVAL" and prints following
error if a component does not implement set_pll() callback exposed
by the component driver. This happens when snd_soc_dai_set_sysclk()
is invoked, which in turn calls snd_soc_component_set_pll().

  "ASoC: error at snd_soc_dai_set_pll on xxx: -22"

Above is not necessary because a component may not need additional
configuration and chooses to not implement this.

Fix this by changing default return value to "-ENOTSUPP" and driver
code which invokes snd_soc_component_set_pll() can ignore this error.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/soc-component.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 159bf88..fd04e75 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -109,7 +109,7 @@ int snd_soc_component_set_pll(struct snd_soc_component *component, int pll_id,
 			      int source, unsigned int freq_in,
 			      unsigned int freq_out)
 {
-	int ret = -EINVAL;
+	int ret = -ENOTSUPP;
 
 	if (component->driver->set_pll)
 		ret = component->driver->set_pll(component, pll_id, source,
-- 
2.7.4

