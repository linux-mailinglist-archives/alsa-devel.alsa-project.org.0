Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 507D161370D
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Oct 2022 13:54:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C04371661;
	Mon, 31 Oct 2022 13:53:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C04371661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667220870;
	bh=hnFiepKNZT31pHoNxZvk70yYkyK1gU+Ahp8W5ZKMecw=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tZ3iL6mJ0b1Ot5K24gucMfb+shpD72Bzi40VA4co2mI58MMGChwGuXtOHhs5DFlog
	 lpJ8vvo3q/CnWjIY4z6pfk1ixs2M5QUqHr2PHud1CWbURZLvXUaKkopfmNWpQnUDiX
	 NGGofVImxj2xWWtba41++kXcbqtLmh0xNDj9I52E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 366C4F802E8;
	Mon, 31 Oct 2022 13:53:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9B57F802E8; Mon, 31 Oct 2022 13:53:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BEE51F800CC
 for <alsa-devel@alsa-project.org>; Mon, 31 Oct 2022 13:53:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEE51F800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="delCIGyA"
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id AD4D76602387;
 Mon, 31 Oct 2022 12:53:23 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1667220804;
 bh=hnFiepKNZT31pHoNxZvk70yYkyK1gU+Ahp8W5ZKMecw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=delCIGyAXICYlknRExX3yUmYgdvpSSFiye1VZi9PmAXRVGN3+4X/NPbOFkSEpV4yr
 bbv7pMmCDjA/74wp3ERVA2wEi1NAuP/4Gi9fQkdLokJgvMM12gXXVlnbkyiZJaXZaO
 SgPeQETwgnE5beJSkWmm3fw1SPFZ2R9m3lMsQ0zFep0Q0HGmxRR0/FXjcgiUPcSIx8
 y9aEqN4bN4hNb+pk8TYdWU7NZtVQfiko4mX+Aj8dYKpZji5mbmEVu22hlqmdPRD03z
 CBdjrx19qRfvyDcChYl01vuU4ZwlrVTo2bCxmU7EiqItzNijHnnHSzbetETTSUsSHL
 IOqRNUR9WPPOQ==
Message-ID: <f36e8fa1-4c53-32b8-a569-99cb07f288be@collabora.com>
Date: Mon, 31 Oct 2022 13:53:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 5/8] ASoC: rt5682s: Support dbvdd and ldo1-in supplies
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Mark Brown <broonie@kernel.org>, Bjorn Andersson <andersson@kernel.org>
References: <20221028205540.3197304-1-nfraprado@collabora.com>
 <20221028205540.3197304-6-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221028205540.3197304-6-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, kernel@collabora.com
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

Il 28/10/22 22:55, Nícolas F. R. A. Prado ha scritto:
> Add support for the dbvdd and ldo1-in supplies.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


