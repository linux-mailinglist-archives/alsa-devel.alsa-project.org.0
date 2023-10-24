Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8847D4C1E
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Oct 2023 11:27:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE765850;
	Tue, 24 Oct 2023 11:26:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE765850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698139642;
	bh=eyPjnlFwB9ESs7GpmfTaYODwRkcUD8KIZ9RhyRcSESQ=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=OxavjYiY9mFNEdK1NqPCIz3+eZv4O4MbffBL1kmudedlM0126S9WBcV7Vf4N6nXo+
	 O0nRo88DBiDR530/mHC4gS7qms6q9GbUKHdQYSD1eAyePaWwDwSSkQPg4n1ECifaGK
	 p8jQyTRyCTUvAG6GNZYhJ5Hb2BM+wUm0lwjEIRIM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C534F8024E; Tue, 24 Oct 2023 11:26:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B7AB6F80157;
	Tue, 24 Oct 2023 11:26:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C7C14F8019B; Tue, 24 Oct 2023 11:26:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A0109F8012B
	for <alsa-devel@alsa-project.org>; Tue, 24 Oct 2023 11:26:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0109F8012B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=hO+1C/+j
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 51CEE66072F6;
	Tue, 24 Oct 2023 10:26:24 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698139584;
	bh=eyPjnlFwB9ESs7GpmfTaYODwRkcUD8KIZ9RhyRcSESQ=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=hO+1C/+jaErCZfqqRqqHjQGulYk7w+MiPuEXZESWII4l4TeGM2pBldxFcFW19gn7B
	 3YChhT37kbYsi+kfHnsit30kt4IUo9mBODAXgp78Wlzadhrwjvm1Hr5cOO/6yTC/bz
	 N5vyzsgTOZ4Bh7A95FqPVDljYsgfape72asxOLXeDr19EIQwmAbxs/eH/1VYMZqvTp
	 DGwamU3f8Ctw26km+JgtI8tRE38IGmSAEvbjzNSiE3NCltwidvqAMTg5mp9NLmnxAv
	 lvsJGdFGEA78M9JGVMuOuh16RFwI7zRje8UKg67zYb9is2oAQzPjTjRmitabihpUpm
	 5EeTQZD9eOUVQ==
Message-ID: <1d524b37-f95a-4f36-b78a-dcf865c1a922@collabora.com>
Date: Tue, 24 Oct 2023 11:26:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] ASoC: mediatek: mt7986: remove the
 mt7986_wm8960_priv structure
Content-Language: en-US
To: Maso Huang <maso.huang@mediatek.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20231024035019.11732-1-maso.huang@mediatek.com>
 <20231024035019.11732-3-maso.huang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231024035019.11732-3-maso.huang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: IP22ND5P7FJB3MEN22ANUZOYP2DNLOKM
X-Message-ID-Hash: IP22ND5P7FJB3MEN22ANUZOYP2DNLOKM
X-MailFrom: angelogioacchino.delregno@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IP22ND5P7FJB3MEN22ANUZOYP2DNLOKM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Il 24/10/23 05:50, Maso Huang ha scritto:
> Remove the mt7986_wm8960_priv structure.
> 
> Signed-off-by: Maso Huang <maso.huang@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

