Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 389997D4B3A
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Oct 2023 10:55:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B75A84B;
	Tue, 24 Oct 2023 10:54:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B75A84B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698137743;
	bh=dr+lBL0FhFKWb9fkKS+Z6wsuWwCRxXkpjetaSpWWU+U=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=qzA0WTfoNR7kzu8bSEDlZ5nrY+nFZ1kzn+Ss/9lrZqH5PDpnJSNgGkWpVDjJOrhep
	 cFIz5sCLDp5DFlZCigMpRwMSQMsOM+UyPIfKXJLFrjtfZyC3KV61Oi0ZqdpG5dmdso
	 vQJqXmjSncEmieHlIbKNdYmjKG9Gp0KeNw12CzpU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF45CF8024E; Tue, 24 Oct 2023 10:54:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4464AF80157;
	Tue, 24 Oct 2023 10:54:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2616F8024E; Tue, 24 Oct 2023 10:54:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EA151F8012B
	for <alsa-devel@alsa-project.org>; Tue, 24 Oct 2023 10:54:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA151F8012B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=ifelwKcb
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 95BE966072F6;
	Tue, 24 Oct 2023 09:54:38 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698137679;
	bh=dr+lBL0FhFKWb9fkKS+Z6wsuWwCRxXkpjetaSpWWU+U=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=ifelwKcb3an0VpTpu9qbwzXJhr/WmrDR/RqxpI9+1u7spvHLHzIb1XvWnzbnHGoyQ
	 t9/9M2BxRSPx+1wvGBXqDU6bSBl1SlNcL/lfixtdsfhpgmvb2whna8wyecEJUNw97m
	 qseei79MZLdAdAQ7QYKhpXUQ2u8sOSBqv49lLhPDuJV7YiewnhS+HaESASEx/p3gjC
	 u7u2L4q8HmvpRctEQ+Qvq+IZnTLWGrdEF3vhg1/lCSx1/WDSlK8aSgtKS8wuAP+5qp
	 xIZTA0mLK2TVV5JhWmbxw7smn7UJ97OzQC8nHgDDZqdiGQqdecAb1X2WoTFs2hvCX2
	 8jGQId2sfVldg==
Message-ID: <46f21faa-7e67-4339-a75b-c5d531baf844@collabora.com>
Date: Tue, 24 Oct 2023 10:54:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFT PATCH 15/17] ASoC: mediatek: mt8192: Handle component name
 prefix
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Lars-Peter Clausen <lars@metafoo.de>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Oder Chiou <oder_chiou@realtek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org
References: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
 <20231023095428.166563-16-krzysztof.kozlowski@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231023095428.166563-16-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: JJZWDHZJKRIENOHKUYHMVBPIDDQTWJ6N
X-Message-ID-Hash: JJZWDHZJKRIENOHKUYHMVBPIDDQTWJ6N
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JJZWDHZJKRIENOHKUYHMVBPIDDQTWJ6N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Il 23/10/23 11:54, Krzysztof Kozlowski ha scritto:
> Use snd_soc_dapm_widget_name_cmp() helper when comparing widget names,
> to include also the component's name prefix.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

