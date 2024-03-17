Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8326E87DF78
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Mar 2024 20:01:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B41222AC;
	Sun, 17 Mar 2024 20:00:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B41222AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710702068;
	bh=/RZ6vS60NQ7l2KxzbBNyf5FX1EAhwhbDNKM40sUmExI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QaIwbhjQYtCh0uOq7+uzdqhmBxj1vhblQGC7liS5fsQv9P+AgSOHolsC4MndDS/Mi
	 zWiisY+HXhUqJs4kRnlN4HveCqkHD3YB4oZY/OIPntHFKz7ymAICwEc4ERsuMaPE/u
	 4wp9kZS8KwSisiTXqiUKJNouTbQQA7qumb2dJhCU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3BD4AF80588; Sun, 17 Mar 2024 20:00:33 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 24E33F805A0;
	Sun, 17 Mar 2024 20:00:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 15C6BF804E7; Sun, 17 Mar 2024 20:00:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EF07EF80093
	for <alsa-devel@alsa-project.org>; Sun, 17 Mar 2024 20:00:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF07EF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ih7u9U78
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1014B60B8B;
	Sun, 17 Mar 2024 19:00:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37FE5C43390;
	Sun, 17 Mar 2024 19:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710702025;
	bh=/RZ6vS60NQ7l2KxzbBNyf5FX1EAhwhbDNKM40sUmExI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ih7u9U78GGrQuPaX/EAqYOT9tSSJaddG94KNscTMDdJo03OTevfT6uZn3C+QOgrS4
	 AqCsZxcPMGIDNXyNEBFS/VBSIDIkvBm1YZPZUVipttQxhNYIKHifZ8QrH6y/PH4hUY
	 fuwPgcvHgv/UNDZKcMyfqqSCKE1zSeZEVngPRrSYHyt/lQQnJP6rmrEl6tdN6iAhWf
	 H2zQi+DflwByVG/oUxlUTSh20x5Z1ncK+fOEUrJIVl49o6P67tjnP66YONe5qnNoBf
	 aaFLmcc8i5VoQgMCxmJZ+LcheVCcHxhBsUwlSmPmMQafUak80+G+vJj9yQrpsGMkX2
	 8Xvuu2viBgl2w==
Date: Sun, 17 Mar 2024 13:00:17 -0600
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org,
	matthias.bgg@gmail.com, shraash@google.com,
	linux-arm-kernel@lists.infradead.org, wenst@chromium.org,
	tiwai@suse.com, trevor.wu@mediatek.com, jiaxin.yu@mediatek.com,
	nicolas.ferre@microchip.com, ckeepax@opensource.cirrus.com,
	linux-sound@vger.kernel.org, amergnat@baylibre.com,
	linux-mediatek@lists.infradead.org, broonie@kernel.org,
	dianders@chromium.org, claudiu.beznea@tuxon.dev,
	nfraprado@collabora.com, conor+dt@kernel.org, kernel@collabora.com,
	alsa-devel@alsa-project.org,
	xiazhengqiao@huaqin.corp-partner.google.com,
	zhourui@huaqin.corp-partner.google.com, lgirdwood@gmail.com,
	alpernebiyasak@gmail.com, shane.chien@mediatek.com, perex@perex.cz,
	u.kleine-koenig@pengutronix.de, jarkko.nikula@bitmer.com,
	frank.li@vivo.com, krzysztof.kozlowski+dt@linaro.org,
	maso.huang@mediatek.com, arnd@arndb.de, devicetree@vger.kernel.org,
	allen-kh.cheng@mediatek.com, eugen.hristev@collabora.com
Subject: Re: [PATCH v3 20/22] ASoC: dt-bindings: mt8186: Document
 audio-routing and dai-link subnode
Message-ID: <171070201412.2068024.3707863657848316004.robh@kernel.org>
References: <20240313110147.1267793-1-angelogioacchino.delregno@collabora.com>
 <20240313110147.1267793-21-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <20240313110147.1267793-21-angelogioacchino.delregno@collabora.com>
Message-ID-Hash: P7YRVNWC5KLJUTCLAVTQWETRCBQAVZRR
X-Message-ID-Hash: P7YRVNWC5KLJUTCLAVTQWETRCBQAVZRR
X-MailFrom: robh@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P7YRVNWC5KLJUTCLAVTQWETRCBQAVZRR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Wed, 13 Mar 2024 12:01:45 +0100, AngeloGioacchino Del Regno wrote:
> Document the dai-link subnodes and the audio-routing property, allowing
> to describe machine specific audio hardware and links in device tree.
> 
> While at it, also deprecate the old properties which were previously
> used with the driver's partially hardcoded configuration.
> 
> Also, since describing machine specific audio hardware and links replaces
> the now deprecated old logic doing the same in a driver hardcoded fashion,
> it is not allowed to have both the old and new properties together.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../sound/mt8186-mt6366-da7219-max98357.yaml  | 131 ++++++++++++++++--
>  .../sound/mt8186-mt6366-rt1019-rt5682s.yaml   | 120 ++++++++++++++--
>  2 files changed, 233 insertions(+), 18 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

