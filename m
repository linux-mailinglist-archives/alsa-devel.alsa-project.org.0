Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53706280593
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 19:38:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FF401942;
	Thu,  1 Oct 2020 19:37:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FF401942
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601573916;
	bh=GKPLOUQxFgGyDVRjmfRFvHk/t75T60mCxPQb7CdL+Gc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Iw+bQJQs1IOJlxW0HDaG4wJ5FHQqO4+dBSgBxAYDHLtYC3AI4V/N3Nn5Lz07ouJCE
	 6F+BMk37cmCyRnw0u5tOtxn5T7CxrWLH9ZV4YEmqXAbCHOrniTCwMCx6vNmQYlX/Uv
	 u/pjy7PQSbS5aOk3r3k2YEgE6Jj1yi0Dd7Hr6NF8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8F0EF801DB;
	Thu,  1 Oct 2020 19:34:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 471BCF802FE; Thu,  1 Oct 2020 19:34:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A452DF801DB
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 19:34:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A452DF801DB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="RpitwpNM"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f7612f30002>; Thu, 01 Oct 2020 10:33:39 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 1 Oct
 2020 17:34:27 +0000
Received: from audio.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Thu, 1 Oct 2020 17:34:22 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
 <kuninori.morimoto.gx@renesas.com>, <pierre-louis.bossart@linux.intel.com>,
 <perex@perex.cz>, <tiwai@suse.com>, <thierry.reding@gmail.com>,
 <jonathanh@nvidia.com>
Subject: [PATCH v3 06/13] ASoC: simple-card-utils: Expose new members for
 asoc_simple_priv
Date: Thu, 1 Oct 2020 23:03:00 +0530
Message-ID: <1601573587-15288-7-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601573587-15288-1-git-send-email-spujar@nvidia.com>
References: <1601573587-15288-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1601573619; bh=TnQC3AMzHJvCLc6PzO7nm4Imy6ab/tEd095RThQjCi0=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Type;
 b=RpitwpNMhaOfs6SsD/PwdvmVMQH79tV7duBLmM49M6xf85Cx1d62RKWPgi1rS2tPq
 RUIz917LCh3Im01vIBDRu++l2h9Enkp6A/y2axdmen4ryp0iMTJZpjfPT13MN3AIXn
 1KplgaPsPfHwVS/e5so9ESktrrZQYBlZ6HJy4kQALNFXDJ71eWu74Aio3SaXnQzgxt
 fKdf0aHbIXpV6XIDcp1fYGEclXkZAkpkjMe2Gg/BJbpME0HSPG1vrXzKvKsmj3a5p+
 nL/ZxbJfsU68Oh0VlGD7Y0j/4a5Zze+52EzXhGp29lLw2WjyHF9zGzBMZxdTKLb4yw
 uCZqW1KVyxrGA==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 nicoleotsuka@gmail.com, swarren@nvidia.com, Sameer Pujar <spujar@nvidia.com>,
 linux-kernel@vger.kernel.org, atalambedu@nvidia.com, viswanathl@nvidia.com,
 sharadg@nvidia.com, nwartikar@nvidia.com, linux-tegra@vger.kernel.org,
 rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
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

Add new members in struct 'asoc_simple_priv'. Idea is to leverage
simple or graph card driver as much as possible and vendor can
maintain a thin driver to control the behavior by populating these
newly exposed members.

Following are the members added in 'asoc_simple_priv':

  - 'ops' struct: In some cases SoC vendor drivers may want to
    implement 'snd_soc_ops' callbacks differently. In such cases
    custom callbacks would be used.

  - 'force_dpcm' flag: Right now simple or graph card drivers
    detect DAI links as DPCM links if:

      * The dpcm_selectable is set AND
      * Codec is connected to multiple CPU endpoints or aconvert
        property is used for rate/channels.

    So there is no way to directly specify usage of DPCM alone. So a
    flag is exposed to mark all links as DPCM. Vendor driver can
    set this if required.

  - 'dpcm_selectable': Currently simple or audio graph drivers
    provide a way to enable this for specific compatibles. However
    vendor driver may want to define some additional info. Thus
    expose this variable where vendor drivers can set this if
    required.

  - 'data': A void pointer member is provided. This would be useful
    when vendor driver wants to define its own structure for internal
    usage and still wants to rely on most of the other members from
    'asoc_simple_priv'.

Subsequent patches in the series illustrate usage for above.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/simple_card_utils.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index 86a1e95..9825308 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -56,6 +56,10 @@ struct asoc_simple_priv {
 	struct asoc_simple_dai *dais;
 	struct snd_soc_codec_conf *codec_conf;
 	struct gpio_desc *pa_gpio;
+	const struct snd_soc_ops *ops;
+	unsigned int force_dpcm:1;
+	uintptr_t dpcm_selectable;
+	void *data;
 };
 #define simple_priv_to_card(priv)	(&(priv)->snd_card)
 #define simple_priv_to_props(priv, i)	((priv)->dai_props + (i))
-- 
2.7.4

