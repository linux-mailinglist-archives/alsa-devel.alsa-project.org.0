Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FE47BF6D5
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Oct 2023 11:08:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2FB30102D;
	Tue, 10 Oct 2023 11:07:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2FB30102D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696928889;
	bh=RpOgGZRGVhfUaO4u/weyo+Vj7fpIhUpNL+R1Rudo1sU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EpJaGYgjaVbkBVFtMy7mViZGDnSuO9kS5JhVUiP2vMO1ZCNqCjTHchqTviQLfnRMJ
	 L855KyGTqpRB6t5Y1s8WCAlSIl8RrxU5qDkbAM1KXNT6CyIOSlVmXCxzOPoeiBbZQ1
	 epVPQV2xvsHeuQHXdU8hF4Lp6N1OzYY++UmyITeM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 894C6F80558; Tue, 10 Oct 2023 11:07:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 32D9AF8019B;
	Tue, 10 Oct 2023 11:07:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03D8AF8027B; Tue, 10 Oct 2023 11:07:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C003CF80130
	for <alsa-devel@alsa-project.org>; Tue, 10 Oct 2023 11:06:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C003CF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=f8nnC0ti
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0B84766030BF;
	Tue, 10 Oct 2023 10:06:57 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696928817;
	bh=RpOgGZRGVhfUaO4u/weyo+Vj7fpIhUpNL+R1Rudo1sU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=f8nnC0tixyeaQ39u6/zLCNXjdI3HCSnbV0aG9spQlHPTvmtsY9fuR/Eg3S4KNwWr9
	 xwWd+6bIX27CapM/QJtvN/HV1xGU+Z9iB00208mLMM6o+Ug97skqP6ezFr2YYdQM1/
	 7yoh8SzwIBNKh5cSpwdK87bwkQzPPhIuXI7q3gcWlQNFUSzInj6xVY4MQ1x5/62mge
	 24qZ58CT09x5R1V/fdhbrQy6piCWQNkeBxm3eQnk2813+63IvY7YuVjTDWS7dOKNLb
	 RhWKIhvO/W+/RbTXivZo0SZk3TCBG4f08miEAxd/0h2F+3t3iC37tZhF4c83cxMHbg
	 XNj810FLiNykA==
Message-ID: <673dcc99-cf42-81ff-47fe-e20079a5e17c@collabora.com>
Date: Tue, 10 Oct 2023 11:06:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [v5 2/2] ASoC: mediatek: mt8188-mt6359: add rt5682s support
Content-Language: en-US
To: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>,
 lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
 matthias.bgg@gmail.com, perex@perex.cz, trevor.wu@mediatek.com
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: 
 <20231010023738.8241-1-xiazhengqiao@huaqin.corp-partner.google.com>
 <20231010023738.8241-3-xiazhengqiao@huaqin.corp-partner.google.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: 
 <20231010023738.8241-3-xiazhengqiao@huaqin.corp-partner.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 7OWLYIX7YBWY6L7AIW554CSCHMSNQN3S
X-Message-ID-Hash: 7OWLYIX7YBWY6L7AIW554CSCHMSNQN3S
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7OWLYIX7YBWY6L7AIW554CSCHMSNQN3S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Il 10/10/23 04:37, xiazhengqiao ha scritto:
> To use RT5682S as the codec and MAX98390 as the amp, add a new
> sound card named mt8188_rt5682s.
> 
> Signed-off-by: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
> Reviewed-by: Trevor Wu <trevor.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


