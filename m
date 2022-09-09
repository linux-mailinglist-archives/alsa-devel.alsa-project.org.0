Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 478195B3015
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Sep 2022 09:37:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA3C316B1;
	Fri,  9 Sep 2022 09:36:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA3C316B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662709021;
	bh=5VvwnbXofTSVecEzap842tdZGEPaG2MhXLhAO0Qr1uE=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IgdyZOsFjLVQvSQl1wg7wOA73YLEuZbqzAsIcT+BWyb8RPgYlUpfGB3mSPlCCkSnF
	 sbLvy+zZKT+OGDkr6KZmYuqqXG2GLMdjGAIEGi7KJjNZwlmq9xM1SI5KFGRiGE6EEp
	 185x5L3nbI3t8xvkPK21ZLvRiBjZWsC7KSUzxYek=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A94C7F8055A;
	Fri,  9 Sep 2022 09:34:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D932AF8055A; Fri,  9 Sep 2022 09:34:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 656FDF80537
 for <alsa-devel@alsa-project.org>; Fri,  9 Sep 2022 09:34:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 656FDF80537
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="DR8eG5rO"
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 5A7A06601FAE;
 Fri,  9 Sep 2022 08:34:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1662708877;
 bh=5VvwnbXofTSVecEzap842tdZGEPaG2MhXLhAO0Qr1uE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=DR8eG5rO8nqbt0vO7cWvvbgPnu4vs92+CAEGSKvmgoD7++/LVTMNQ2RjTJeUwl0fQ
 bW87Q0NELXwTBKeKPx7pb41Lyrd71itLmxs+RduZqOaEMmvjlj6/l5y1ZV5p398kdh
 o+1pxbi7K4y9rch1ufgvPVrWJpOh5yXwuwBZNYsyP7GFmUUfbd72x9yofdd6tAroyj
 yPicSUfMmnR+055S1tCcFOi2sYENo8/aMVQRiuykI1vLoWPYckH0OHvWaXWTLskFqs
 lqvSgA0MGZue42utV+SAv1KfyoXaz9gKzgbtYaHcqNGri0rrv1pgP6rLaVULDVAFz7
 1lPmdZuUxJI4A==
Message-ID: <ecb5fb65-9e87-aeaa-48f4-f825646b5228@collabora.com>
Date: Fri, 9 Sep 2022 09:34:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 06/10] ASoC: mediatek: mt8183: Remove clock share parsing
 from DT
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
References: <20220908161154.648557-1-nfraprado@collabora.com>
 <20220908161154.648557-7-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220908161154.648557-7-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-mediatek@lists.infradead.org, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
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

Il 08/09/22 18:11, Nícolas F. R. A. Prado ha scritto:
> Now that the clock sharing for i2s ports can be configured from the
> sound machine driver, remove the logic that was used to parse the
> properties from the devicetree.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


