Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8426B968D
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Mar 2023 14:41:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CEE5A139D;
	Tue, 14 Mar 2023 14:40:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CEE5A139D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678801306;
	bh=xItASfbtEYH1zZF+ZujltlFOKEboTad6SUEztiARR3E=;
	h=Date:To:Subject:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=jI2mwu6KQggSjIpDGAgkn7GSg0dFHNveDoDCxotJmNu58/fQDculRucAs+yFO4pDO
	 KdCIy49hPMp64GRD7AQfZ0Huv7EbuTGAs5z5/d+sDwuZvvn3Vl/X5MFUMDCeXMmC6S
	 w+hBoBu6JeRmeEId2ykWVds4OmueXetelpA0c8lo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BC52F8032D;
	Tue, 14 Mar 2023 14:40:56 +0100 (CET)
Date: Tue, 14 Mar 2023 09:40:36 -0400
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 1/2] ASoC: mt8192: Remove function name log messages
References: <20230313212908.2282961-1-nfraprado@collabora.com>
 <20230313212908.2282961-2-nfraprado@collabora.com>
 <f8d1fb49-c802-5c2f-0c7a-aeea1b25968c@collabora.com>
In-Reply-To: <f8d1fb49-c802-5c2f-0c7a-aeea1b25968c@collabora.com>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M4E5WKWN47TBCDN5GFQMFTM5DGIZALDI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167880125544.26.17371587657549663461@mailman-core.alsa-project.org>
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado_via_Alsa-devel?=
 <alsa-devel@alsa-project.org>
Reply-To: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
Cc: Mark Brown <broonie@kernel.org>, kernel@collabora.com,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Tzung-Bi Shih <tzungbi@kernel.org>, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 67C51F80423; Tue, 14 Mar 2023 14:40:52 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id DAB45F800C9
	for <alsa-devel@alsa-project.org>; Tue, 14 Mar 2023 14:40:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DAB45F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=URtjOTkW
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B331B6602FE7;
	Tue, 14 Mar 2023 13:40:41 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678801245;
	bh=SFPwXvcjYlpe+WHZRER6c+pWCXhtFKTjbX1zkF7J7ao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=URtjOTkW6TkqD7dIl9lJAed9SJ5pALFeq7VnUAo7hHEoDZCN5h8tZVJai+SwcL/30
	 QbYGjxpYRH0EvmOVkKhfK44JjvFbZUUOsByrNE5H7OXm5MRzdBA51V57vGiuBoebjG
	 puOPfP9F0mMRnV7ALTzcSuvlwkuqwLu1AW2HQWtTgOM9Qe8X5TPWPO/0VS4J5LpHfV
	 QX2IAuX2s6UEJdz357jNLiBPDlpKGAwKILc6FWwduDBclFXleme5oLRiscHQRMVynT
	 5vrKCG4nNqq+mYN6lQiferPbBCQBlyBPUS9ZHQaOCmp435gp5EvfpZ9NrM4cW4uzpI
	 pzDszWupqPZQw==
Date: Tue, 14 Mar 2023 09:40:36 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 1/2] ASoC: mt8192: Remove function name log messages
Message-ID: <20230314134036.wo6oib55dhzsgv4d@notapiano>
References: <20230313212908.2282961-1-nfraprado@collabora.com>
 <20230313212908.2282961-2-nfraprado@collabora.com>
 <f8d1fb49-c802-5c2f-0c7a-aeea1b25968c@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f8d1fb49-c802-5c2f-0c7a-aeea1b25968c@collabora.com>
Message-ID-Hash: M4E5WKWN47TBCDN5GFQMFTM5DGIZALDI
X-Message-ID-Hash: M4E5WKWN47TBCDN5GFQMFTM5DGIZALDI
X-MailFrom: nfraprado@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Mark Brown <broonie@kernel.org>, kernel@collabora.com,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Tzung-Bi Shih <tzungbi@kernel.org>, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M4E5WKWN47TBCDN5GFQMFTM5DGIZALDI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Mar 14, 2023 at 09:30:15AM +0100, AngeloGioacchino Del Regno wrote:
> Il 13/03/23 22:29, Nícolas F. R. A. Prado ha scritto:
> > There are some log messages in the mt8192 sound code that print the
> > function name, presumably to aid in tracing. However this can also be
> > achieved by ftrace and without spamming the console, so remove these
> > messages.
> 
> Yeah, I totally agree.
> Did you check the others (8173, 83, 86, 95) as well?

Not yet. I can check later if the patches from Mark didn't already address this
for those other SoCs and send another patch/series if needed.

> 
> > 
> > Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 

Thanks,
Nícolas
