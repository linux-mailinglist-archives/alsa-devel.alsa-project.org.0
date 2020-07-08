Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF31A218209
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jul 2020 10:13:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 452841675;
	Wed,  8 Jul 2020 10:12:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 452841675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594196028;
	bh=sJxqwEav5m/liphTX7Uv4mCFYX9xUN1LrCWjQGAsOYw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iXWejjCI8PCWPMaL8/nZlE7Q+C4NCf0cbyqPJc0SLegXH5OKh5XDSzu/hEzv9Tme9
	 fczsWsWhpK1QAVd+5cEzZkMex6Swyp64PBp6mOo+FDlG2bAM85RjI6wi1jKTfuP+bZ
	 Bt6mJ9xKws5/7d552cZgCbB1ML0Xc6qDQTwp/ePM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68B32F8015A;
	Wed,  8 Jul 2020 10:12:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D866AF8015A; Wed,  8 Jul 2020 10:12:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93DA1F800AE
 for <alsa-devel@alsa-project.org>; Wed,  8 Jul 2020 10:11:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93DA1F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="PkJNSR/z"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="JkUebIEf"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id CBECD7F8;
 Wed,  8 Jul 2020 04:11:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 08 Jul 2020 04:11:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=s
 JxqwEav5m/liphTX7Uv4mCFYX9xUN1LrCWjQGAsOYw=; b=PkJNSR/zWWZRkE02B
 +yGV5sDueqZldn9bODN8dDQrmtDocgOltweXn0VJstNF7WN71bmdzAfXsJ+hR764
 sFtZ1pwobR9cbVf1gW710vzzhyHwf4JQI11ki5fkphOR5fy2xBtCFr3ucNMDLfyj
 L1niymzpCrXrAxxiYFEBBqdZurUSkVVEvDGNWcZ306t/Ukt4xDRiG2lgSrYXoM70
 gDWlgam+gB2PpKEcI60r2i9JcBg61JZzwJb2VRoSTN0Y5BvAonA0V2G7ULn1YIIb
 Uop0YQwjB2NvuxNizqattdpU+myfhQ0VkdfYNFTM9EacbTb8AaY+Tw0BcVgWDNfT
 eN3+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=sJxqwEav5m/liphTX7Uv4mCFYX9xUN1LrCWjQGAsO
 Yw=; b=JkUebIEfX5+achqCYV3faj+Nrbws8MrRpRCr6BJj4ruuutEwddsF32phW
 3hJLZv3oVcnrGT0GCesPGX6GmoYapaJzk5kMlcIzlYVvWHb4t9RIu8LfR8OHwBVm
 y7xIZ4l5dBMFnZ/65PUgXr9oTZylSfFPyq2zd8oHtOVtLqvxRrCf/yi4Wnos6+h3
 KJLYHylYC3GWOzMHvqLfbIYPBoq+igA2FFNhvxhwW0gbEQJPSRRNz95dSDEJAg+C
 SsOxY14sgaycGHIyPk9SoqGRDld4DW2D61EQVRKDqn2UJF9yUv+11deSruXMJMRR
 OJrkBBntExrF3ZFhy/WhRTpuWzVoQ==
X-ME-Sender: <xms:xX8FXxCqSmc8QZVz8zp-5N6vnYh2aMKnCfUm-Zkjh-M3H92_Daaksg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudejgddtudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggugfgjsehtqhertddttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepgfejtedtjefggfffvdetuedthedtheegheeuteekfeeghfdtteejkeeludeg
 vddunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepudenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:xX8FX_jkSv4P9VgdlqD5DZgxpy3tlfTxQqb5uRPKPOg3iepvNG3Tkw>
 <xmx:xX8FX8mlmqsenaW6bZmS_IVP64mNdb8P7uKyJX63tPlMW6swMpZRAQ>
 <xmx:xX8FX7yY-mlmTtgiwCIt_8H1AkRt0qrMVYr278aAyDLbGZO94MvMFw>
 <xmx:yX8FX5GSUn7TWTRR4pAjdM2NPRllLF3JKnlPUSOzg_CtkEpHaxo3UVBffVU>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id CBECD3060067;
 Wed,  8 Jul 2020 04:11:48 -0400 (EDT)
Date: Wed, 8 Jul 2020 10:11:47 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v3 02/10] ASoC: sunxi: sun4i-i2s: fix kernel-doc
Message-ID: <20200708081147.3azg42jocodq7noc@gilmour.lan>
References: <20200707191615.98296-1-pierre-louis.bossart@linux.intel.com>
 <20200707191615.98296-3-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200707191615.98296-3-pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Marcus Cooper <codekipper@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, broonie@kernel.org,
 Lee Jones <lee.jones@linaro.org>,
 "moderated list:ARM/Allwinner sunXi SoC support"
 <linux-arm-kernel@lists.infradead.org>
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

On Tue, Jul 07, 2020 at 02:16:07PM -0500, Pierre-Louis Bossart wrote:
> Fix W=3D1 warnings - missing fields in description
>=20
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
