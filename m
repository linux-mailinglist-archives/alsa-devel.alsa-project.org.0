Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 022405B2FDF
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Sep 2022 09:35:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 874D9166A;
	Fri,  9 Sep 2022 09:34:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 874D9166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662708928;
	bh=5VvwnbXofTSVecEzap842tdZGEPaG2MhXLhAO0Qr1uE=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nIvEuo7meYhr99GVj2GWRoRVzLX1HRUuV72PYrgFYGO6pj4fkaLfR0mxzghuxK+OZ
	 qU7Iscu/UryX39bhKa31wl3y5KBny7drow9b3un6EfcrbAj+FdsTpf1VoD2djps1YK
	 SPYXDOnKBtoz3RHBurCop1mpUHs44yUuIl7Vfsac=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CAA9F8016C;
	Fri,  9 Sep 2022 09:34:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21924F803DD; Fri,  9 Sep 2022 09:34:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F28EDF8016C
 for <alsa-devel@alsa-project.org>; Fri,  9 Sep 2022 09:34:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F28EDF8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="lW89EY4a"
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id A06196601F9D;
 Fri,  9 Sep 2022 08:34:18 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1662708859;
 bh=5VvwnbXofTSVecEzap842tdZGEPaG2MhXLhAO0Qr1uE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=lW89EY4aJ1eVZPFDlLcJbiY7aMi1pW1MfbFb5qV7LHA2vwyz0wB8tM3jLVkG9iJSu
 L9t1WVM5JudnYNeflvKwmC9G1+DE7J4PPfHe3YGyXWoMIUmix6Ql8vFOPzeSVj5E1e
 OLTqNqhyHrlK73YknZY5XTiZB4izUpq0RDvK/KCX+DAnIAbN92o+ARW5pTZ9doiTlG
 V4363hwwUO/ftJ/EGyIJl6dMrzZi0Voce20DxA82Ne0jMmVUUFvnz/OH0DSwNcpXYR
 S8mvOP/zztacZn5lUcS/niCQqsrIbc3L8vFbT6WCHQoBYCOs3bdnsI1E8k2ukwQCwG
 KAh7F/sL9KYZA==
Message-ID: <fb1d20f2-2ea4-613c-a79b-f2d309943540@collabora.com>
Date: Fri, 9 Sep 2022 09:34:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 10/10] ASoC: mediatek: mt8186: Remove clock share parsing
 from DT
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
References: <20220908161154.648557-1-nfraprado@collabora.com>
 <20220908161154.648557-11-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220908161154.648557-11-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Chunxu Li <chunxu.li@mediatek.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, Dan Carpenter <dan.carpenter@oracle.com>
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


