Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F555EF1E7
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Sep 2022 11:26:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C161815CA;
	Thu, 29 Sep 2022 11:25:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C161815CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664443590;
	bh=qCJlWCzZUOjlbWhUBr+CjY4sGdMeJ1qenSLOO28pr3Y=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t7/hEY/e6BnJSD3cBNZKlqdUMsqGnYxGqkxtwHwMFgwRuuNIq1mKIBXoopN7zKMXJ
	 MGCioPSAZY/sdP/1K2cT+PpSj2zpvpNbsdTCqpHGbzqiKUJrTOTClOtF7/cIpMFqpZ
	 4Imgn4ZO1wfgd2hXnh5f6EI4BQcUxPv/Gzda8HFc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24ACCF8016D;
	Thu, 29 Sep 2022 11:25:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54C43F803DD; Thu, 29 Sep 2022 11:25:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 326A5F800AA
 for <alsa-devel@alsa-project.org>; Thu, 29 Sep 2022 11:25:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 326A5F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="LO/GFqKu"
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 8446366022B4;
 Thu, 29 Sep 2022 10:25:22 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1664443523;
 bh=qCJlWCzZUOjlbWhUBr+CjY4sGdMeJ1qenSLOO28pr3Y=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=LO/GFqKuGCASvKu0rA1gy3hLof1Q7Ud3Oy1HSNPRtfDtnfSyP/cg6zkjBtI9uJJmH
 b0+rhEmqlTR36W5AeatLZSTYpKtwXueOCXLuX2OCLIV6oF2I7GwcUi+G5tPxzSS96P
 X7mnXMU766MFUsCwZSXr/IUjvD++RJy3h4EtWX+2K7AMjNX4az3cd5GuhTF7dHv4aj
 Me9R0v8J2MdFArLgh928AQzFcfbf8owpK8jUFt1AWSWmubcK6NIolsse3jgVf2cUiX
 ETRIdFG9wb7rkFWn3sEj+7ar2mJAf+iVYgSPt9o5dF/tQnrhB/GzzNabNSLeAMRXgZ
 5Q0ICPrtRx1Zw==
Message-ID: <aed50d17-3010-a5ee-a19d-14bfe5e6ac3d@collabora.com>
Date: Thu, 29 Sep 2022 11:25:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] ASoC: mediatek: mt8186: Fix spelling mistake "slect" ->
 "select"
Content-Language: en-US
To: Colin Ian King <colin.i.king@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220928220417.66799-1-colin.i.king@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220928220417.66799-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

Il 29/09/22 00:04, Colin Ian King ha scritto:
> There are some spelling mistakes in dev_err messages. Fix them.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


