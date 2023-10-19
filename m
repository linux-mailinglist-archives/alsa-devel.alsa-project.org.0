Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC607CF32E
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Oct 2023 10:49:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C361F836;
	Thu, 19 Oct 2023 10:48:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C361F836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697705367;
	bh=/BFGk10tJjdGi8ZC+k20TXUYuEY9bU4gZOhY1NmRH4M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CrzkkKNu+oKNiUUYkzr0w0TaXw4V/3k6jKUyBZ8S8xWdC8PuQtROBO70i04ayOT/s
	 x/am2yWtM5wOddrc2XoycN7jnCbzWvn6S2g9gA4A5BdgeYhWarz8GsOtjfCICT1d2/
	 zK2kTFKLWui/NmvNwQJDmmUq5S+fUJ+ABA3JIrjk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28C18F80553; Thu, 19 Oct 2023 10:48:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BDD1FF8024E;
	Thu, 19 Oct 2023 10:48:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9BA52F8024E; Thu, 19 Oct 2023 10:48:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 56A05F80166
	for <alsa-devel@alsa-project.org>; Thu, 19 Oct 2023 10:48:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56A05F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=blxTpEVu
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4D02C6607322;
	Thu, 19 Oct 2023 09:48:24 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697705304;
	bh=/BFGk10tJjdGi8ZC+k20TXUYuEY9bU4gZOhY1NmRH4M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=blxTpEVuBwBTp3VTVME8VhWvZxYN+1GFZOnX8n4Ckh3h4JAJHFOXIrnoGtsSwYQzD
	 +wP2btruyVVFmob5omYRTLDjOArySMB7uVoGiwWNlgPQbMN3rXo9HdJgsZtvRHTiim
	 UDhSewj75kIMePj/MDIKTR0zEVNIgU+Wq+4VI3/fK18sB+6ysUvwpcKlCRkvl6/727
	 22+4dt3Vq1wnNul1fbEgDqUjColnop/zNlccBfof0nLdsaIP/CrU4MOa7wyzMSSMFR
	 bD0pf5Vzs5lyWqnR71Uoa0aAoCzH/PPUM0nUgYKQq+wkxTsFC989IfawUPgu54Lqc4
	 lw4O/RJfB60Lw==
Message-ID: <8de0772b-3145-44e3-8174-702c7dc729bb@collabora.com>
Date: Thu, 19 Oct 2023 10:48:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v1 1/2] ASoC: dt-bindings: mt8186-mt6366-rt1019-rt5682s: add
 RT5650 support
Content-Language: en-US
To: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>,
 lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
 matthias.bgg@gmail.com, perex@perex.cz, trevor.wu@mediatek.com,
 jiaxin.yu@mediatek.com
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: 
 <20231019021133.23855-1-xiazhengqiao@huaqin.corp-partner.google.com>
 <20231019021133.23855-2-xiazhengqiao@huaqin.corp-partner.google.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: 
 <20231019021133.23855-2-xiazhengqiao@huaqin.corp-partner.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 4AUHML5SLIBQJPINY6HNGGP6AOLF2HPY
X-Message-ID-Hash: 4AUHML5SLIBQJPINY6HNGGP6AOLF2HPY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4AUHML5SLIBQJPINY6HNGGP6AOLF2HPY/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Il 19/10/23 04:11, xiazhengqiao ha scritto:
> Add new sound card "mt8186_rt5650". RT5650 comes with amp and
> earphone codec.
> 
> Signed-off-by: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


