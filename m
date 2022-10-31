Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E273613845
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Oct 2022 14:42:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89E57165E;
	Mon, 31 Oct 2022 14:41:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89E57165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667223749;
	bh=2dz1M+B8TIpl43v5vd4vjUv91V2N3rN90HT3YVMZ6Do=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BfEPD7xzjSLOi4HrnjgON5rqWxXSn/kDULjkj2PLdX5ed0PX5733X7PbcXEfS6TGP
	 tJmdaaDMskYq6i1UYJ+nLha0cMRMUBHsGcgX4kbDCxc4IjvP4yan9Yid5wApdFBvxX
	 zWgT6QLZnTSn7rho7wTX3IrWHH/fUFsNjpIp+Wmk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EBBFEF800F3;
	Mon, 31 Oct 2022 14:41:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 387A2F80163; Mon, 31 Oct 2022 14:41:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_HI,RCVD_IN_ZEN_BLOCKED_OPENDNS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0842EF800F3
 for <alsa-devel@alsa-project.org>; Mon, 31 Oct 2022 14:41:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0842EF800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="YJCX/qGj"
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 29C146602040;
 Mon, 31 Oct 2022 13:41:28 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1667223688;
 bh=2dz1M+B8TIpl43v5vd4vjUv91V2N3rN90HT3YVMZ6Do=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=YJCX/qGjDqMSKn7g/SEhQmVycMgs11cemi9QciV8uD1hy2D1p+d5tDx7TUncfpGU+
 7m7Ls95h/Fsp682coUMlyVzdoVD8ETmVgMX+x2C0xqBKJi7mZ10MWOChbDGLd0Uika
 VTexgi78Nn70zLD6vffC55VoW9yJXNNy1su1fgCiCY+6oPPU2nXIWYvMCBrVZ6NNi3
 49nfnElNQKgbaZh4QTgJ/94TEH5DjWzHOhXnUw7Xnc5nEu71zeTUxSoHB33MIYVGL3
 8XB3ACUe1BcJ6ibOdYNWIOIlMViU6HXNqYiQ7SAmaWtEAK/MgJrc+70s6K7a+RGuCP
 Lq/w60prWCAMg==
Message-ID: <9599f3d0-670e-f971-f5be-96061ab0531c@collabora.com>
Date: Mon, 31 Oct 2022 14:41:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 6/8] ASoC: rt5682: Support dbvdd and ldo1-in supplies
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
References: <20221028205540.3197304-1-nfraprado@collabora.com>
 <20221028205540.3197304-7-nfraprado@collabora.com>
 <Y1/JCN+mtlT0r/rw@sirena.org.uk>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <Y1/JCN+mtlT0r/rw@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 kernel@collabora.com
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

Il 31/10/22 14:09, Mark Brown ha scritto:
> On Fri, Oct 28, 2022 at 04:55:38PM -0400, Nícolas F. R. A. Prado wrote:
> 
>> @@ -35,6 +35,8 @@ const char *rt5682_supply_names[RT5682_NUM_SUPPLIES] = {
>>   	"AVDD",
>>   	"MICVDD",
>>   	"VBAT",
>> +	"dbvdd",
>> +	"ldo1-in",
> 
> Why are we making these inconsistent in style with the other supplies?

Right. That would be the same for rt5682s, and for the entire series. :\

Cheers,
angelo
