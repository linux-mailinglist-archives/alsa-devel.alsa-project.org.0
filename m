Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4371872DD01
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jun 2023 10:50:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E55373E8;
	Tue, 13 Jun 2023 10:49:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E55373E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686646220;
	bh=13QxIeZfhU5GLFvayprb0+agNd+CZDWoGxFWOWD3MhM=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=rw4Qj33Yj0ILmJXzqg3TxlHYR9PKjucXgcCYcWm01I7+tt9URrSH7ZmK5fSo0YLx4
	 agmHhuV1ngQVKWoj29OigQA/QraaDkme6p23c5jK4KLLkqeLblb2XYFir3yo9ARYy6
	 UCB7/LMhdBykOzoIHf9APsNx0Pg11cRMIFoysPZc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E6CEF80544; Tue, 13 Jun 2023 10:49:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EE047F80132;
	Tue, 13 Jun 2023 10:49:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1B5BF80149; Tue, 13 Jun 2023 10:49:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F01BAF80130
	for <alsa-devel@alsa-project.org>; Tue, 13 Jun 2023 10:49:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F01BAF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ZNOh2FB1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C5C1B61956;
	Tue, 13 Jun 2023 08:49:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1677C433D2;
	Tue, 13 Jun 2023 08:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686646160;
	bh=13QxIeZfhU5GLFvayprb0+agNd+CZDWoGxFWOWD3MhM=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=ZNOh2FB1/xMCR9XW9z3iU/U+scSh5i+/NQHd/VfoS2b4vP9bEuKOPbNpGjW3QE3UQ
	 QtOo67gei1ki9H6yJ94Z7MdlZ4pyOwSL/+xkAJ1VM2kQqmWIwP8HE3LBAglu9+a+3l
	 JE5+q5ZA7J/Yesfi1oBZCT/h9BlH/pwjSI9c42gtIDrbyxq/Sr36kkRqOT4e2lAanC
	 e5OtFco8ih63s64epRhj6/Cf57d2BvXQD4ELyJ+zn7PJpk0xf8PJ9Qkm/PvhtjBDYP
	 08X5c5thabZbROWDQATmBsCoCuU9Cyh+u7Wo7aUWVXVK+s2N1DVDTcRG2WkjtaWukF
	 vN7a5K7fw5hTQ==
Message-ID: <7bf1395a-eba8-fe27-a359-9c50af7add2a@kernel.org>
Date: Tue, 13 Jun 2023 10:49:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 6/7] ASoC: dt-bindings: mediatek,mt79xx-wm8960: add
 mt79xx-wm8960 document
Content-Language: en-US
To: Maso Hunag <maso.huang@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Trevor Wu <trevor.wu@mediatek.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Ren Zhijie <renzhijie2@huawei.com>, Arnd Bergmann <arnd@arndb.de>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230612105250.15441-1-maso.huang@mediatek.com>
 <20230612105250.15441-7-maso.huang@mediatek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230612105250.15441-7-maso.huang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: XOO47MOM25JN4DQL2GSC5PTRLVFMBWXJ
X-Message-ID-Hash: XOO47MOM25JN4DQL2GSC5PTRLVFMBWXJ
X-MailFrom: krzk@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XOO47MOM25JN4DQL2GSC5PTRLVFMBWXJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 12/06/2023 12:52, Maso Hunag wrote:
> From: Maso Huang <maso.huang@mediatek.com>
> 
> Add document for mt79xx board with wm8960.

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC.  It might happen, that command when run on an older
kernel, gives you outdated entries.  Therefore please be sure you base
your patches on recent Linux kernel.

> 
> Signed-off-by: Maso Huang <maso.huang@mediatek.com>
> ---
>  .../sound/mediatek,mt79xx-wm8960.yaml         | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt79xx-wm8960.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt79xx-wm8960.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt79xx-wm8960.yaml
> new file mode 100644
> index 000000000000..26b38bb629da
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/mediatek,mt79xx-wm8960.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/mediatek,mt79xx-wm8960.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT79xx ASOC sound card with WM8960 codec

What is a MT79xx ASOC? Is it some specific SoC name? What does "A"
stands for in SoC? XX also looks odd, I thought Mediatek uses only numbers.

> +
> +maintainers:
> +  - Maso Huang <maso.huang@mediatek.com>
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt79xx-wm8960-machine
> +
> +  mediatek,platform:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle of MT79xx ASoC platform.

What is MT79xx ASoC platform?



Best regards,
Krzysztof

