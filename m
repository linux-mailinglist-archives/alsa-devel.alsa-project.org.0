Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A269145EDAD
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Nov 2021 13:12:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2746E1A3C;
	Fri, 26 Nov 2021 13:12:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2746E1A3C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637928773;
	bh=dj2wyPkbyn7gApbtIg2geaaFyZHLewmQWww8/OOcwjY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=clXppn6MGqxKesns5PA6XPEHplRnHV2vQk8XZh/rWZC8QwnOujSY6quqETmPW+h2k
	 g8gUe12QTEmlxz54xzh9rlBPwrOvx5cdxbv28oXLZeYy2v+mVdREGJE/gM5QWVwtSD
	 6VaylIG6vgKVHyUUAia1jIv1qfZMmPbNN4L5wLc0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 548F3F804F3;
	Fri, 26 Nov 2021 13:07:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22650F804EB; Fri, 26 Nov 2021 13:07:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 51229F804E6
 for <alsa-devel@alsa-project.org>; Fri, 26 Nov 2021 13:07:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51229F804E6
Authentication-Results: alsa1.perex.cz;
 dkim=fail reason="signature verification failed" (2048-bit key)
 header.d=collabora.com header.i=@collabora.com header.b="Az76iqIe"
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 3EA201F46821
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1637928440; bh=dj2wyPkbyn7gApbtIg2geaaFyZHLewmQWww8/OOcwjY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Az76iqIeCUTTCWBpk7fpTJfqJeU1u4CPWP9K+xYrfFGv/0dB9VO/tXACSwBiWAL3F
 EAqKvqKUkb3xqeMHFuUetdTIX36FVVSmXMgxlkgGCAD4IUsFDxspbvkIve/RwXv/jX
 BJinM1irXDoV2KqilKafoYDmYfGrpMrelH7XbbcEIDLWaL9rwjkx5nNFAqR+qG9nfn
 BAvUfweBRwMsRh5DMb2yXS/4MRvo0f05BeZ3j3Mq3ufsrhqtn+KKqwhfZ52Olvrwfj
 dk+ow6aRijgPT/AJ/d+smDIR/0l4IRuWql8CmwMqRs71yCO7jPA36E1WjRffyzF9to
 HbbVCD2458/lw==
Subject: Re: [PATCH v2 8/8] ASoC: SOF: mediatek: Add DSP system PM callback
 for mt8195
To: Daniel Baluta <daniel.baluta@oss.nxp.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
References: <20211118100749.54628-1-daniel.baluta@oss.nxp.com>
 <20211118100749.54628-9-daniel.baluta@oss.nxp.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <3cc9c55c-16ad-26aa-c41b-2f3f9302f021@collabora.com>
Date: Fri, 26 Nov 2021 13:07:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211118100749.54628-9-daniel.baluta@oss.nxp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: daniel.baluta@gmail.com, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, linux-mediatek@lists.infradead.org,
 yc.hung@mediatek.com, daniel.baluta@nxp.com
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

Il 18/11/21 11:07, Daniel Baluta ha scritto:
> From: YC Hung <yc.hung@mediatek.com>
> 
> Add DSP system PM callback for suspend and resume
> 
> Signed-off-by: YC Hung <yc.hung@mediatek.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


