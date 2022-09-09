Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4815B2DDA
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Sep 2022 06:55:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6568F1688;
	Fri,  9 Sep 2022 06:55:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6568F1688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662699358;
	bh=cvp+o0A81+OwAMSNrmw69UzADajzITspKDDc01Qefv8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uSUCz/CSz7SCbIoqjEGCYZBcsxV183Rtbp1iP1Tb5InV9r+awHij9KMrWgbS8qEdB
	 voogVteb7b+PFmwxuM2K96edPSWo8eSityfjL3S+uEFkKW99BlLtr1Z6ukRv7PnVJf
	 +HZoILjDqVCCo/eTJ2tOA7rOCCa/NVD8u/tTI7TQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A838CF8032B;
	Fri,  9 Sep 2022 06:54:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0E3BEF8023A; Fri,  9 Sep 2022 06:54:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_26,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0788F80105
 for <alsa-devel@alsa-project.org>; Fri,  9 Sep 2022 06:54:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0788F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="UBepp5En"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="mqZQEF/A"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id BDA8E5C00E5;
 Fri,  9 Sep 2022 00:54:44 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 09 Sep 2022 00:54:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1662699284; x=
 1662785684; bh=amv9ICltjZk+eIYa+llWaKBwwrexAvmDG285zE+xSs4=; b=U
 Bepp5EnGejqtxUrflkxrG2bfdX6wWVkuEr6E5JnQgq+bVXY+r90c6/JLTVkQNSSI
 6y3NRGAIt+ViAnXdMBAHJqcCduYN6Gb4QKsxEZpYdYRzzzYv4o0h3q4bzNgoAbOM
 m3hV7uKDO5h9Rnbl4gLMC5xnHNJ/9ynneNFEWGaWR7FZ0oCaqLLQV+cnwTWWezBi
 OKoOLtdEiIczsuycfbq7rx5hi967OXSl25gFYzwMA8tcNYwkPwBU3INOAcfsM3jo
 M0CIHUcpxTT/7ZHqArKmvX4Xf7cgJZVu7N1+p1s2DZx8i44tbaVdCh8RsoEQ9v2C
 WFfH3t4Oy2I5AwWhLBNAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1662699284; x=
 1662785684; bh=amv9ICltjZk+eIYa+llWaKBwwrexAvmDG285zE+xSs4=; b=m
 qZQEF/A34CRE9SqJEHjn/J3BnC+MEwhtVSjNObo/Re7gfIQYRUbPt4HZ1Kk2hlpe
 dRDVgR0T7NEzSgzBxvZXtSaOWb82/1fgWzDXv/7dZAT4BiZ6S6r54Q8H1GM/cKli
 3pCzqoUUp6FXfs6J4pVvoNMl8U4s8g5fbEAKZzEgINvrUUP2+6IU8qrUDQ4zH0xu
 zbmTjhAGd9mX8MJ7Jcs3+rmDng43TOkppOEQwMdgrpYFx0XkV+xXTzWzxS8x38uV
 O56B7Q6bBcUzSLqvRKdvrdB8uDFT03oe6Ddn5t2V5l2j6DzLqW9G10AxZIe0Nl70
 HAbiXY3IEehfAF5aOsHKg==
X-ME-Sender: <xms:FMcaY3rDW-O_HgBHCJCb6hgT_Y8e573Oy_1BHFc0NWY3L8Pqw87ppQ>
 <xme:FMcaYxrzH4imNxLTJt_WXmoWOzpo_hugEmnua_G-4NfDUsSH2vJO-aMd7dDQkv4I5
 eFSW27riT_disZWSA>
X-ME-Received: <xmr:FMcaY0M2XEn1s8BDKWSKJ7W8WPKD27XAgJ-qaQJFGCReOSH8EhCmxhpYo_JjSBUTjD-a95XiNe0D818pv2wauOGkJY7PZcfzmUZ7KgmQM93lSbP2NYHRgRQ2gQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedtgedgledtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefuvfevfhfhkffffgggjggtgfesth
 ejredttdefjeenucfhrhhomhepufgrmhhuvghlucfjohhllhgrnhguuceoshgrmhhuvghl
 sehshhholhhlrghnugdrohhrgheqnecuggftrfgrthhtvghrnhepffdtveekvdegkeeuue
 etgfetffeileevudekuefhheelvdfhiedtheduhfduhefhnecuvehluhhsthgvrhfuihii
 vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghnug
 drohhrgh
X-ME-Proxy: <xmx:FMcaY664qnk1pDT8q_nKVVrHilvpdVsGEIhCM7ukH2eBeuu0XpEmCQ>
 <xmx:FMcaY266SJD-Rg_ff8h-41H76Ms_czO8xdOR-GGfdKDqTvOt2c6t4A>
 <xmx:FMcaYyjRxIhM7PDeRc3bTCT-b_BycRvVG_UmRlzyaE5tVCOAG7GCvw>
 <xmx:FMcaY_Fgt0WpstGGPYE-nzc_VuDsaTOxlLxjJGwP0WQj2g1ZKHDfaw>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Sep 2022 00:54:43 -0400 (EDT)
Subject: Re: [PATCH v9 1/2] ASoC: sunxi: Add Allwinner H6 Digital MIC driver
To: Ban Tao <fengzheng923@gmail.com>, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com, wens@csie.org,
 jernej.skrabec@gmail.com
References: <1661870696-31042-1-git-send-email-fengzheng923@gmail.com>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <2e7a0006-00c9-c85a-8d05-144bed24dfba@sholland.org>
Date: Thu, 8 Sep 2022 23:54:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <1661870696-31042-1-git-send-email-fengzheng923@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
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

On 8/30/22 9:44 AM, Ban Tao wrote:
> The Allwinner H6 and later SoCs have an DMIC block
> which is capable of capture.
> 
> Signed-off-by: Ban Tao <fengzheng923@gmail.com>
> Tested-by: Samuel Holland <samuel@sholland.org>

Looks good, thanks!

Reviewed-by: Samuel Holland <samuel@sholland.org>
