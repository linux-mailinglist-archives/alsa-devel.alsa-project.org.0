Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C2D2B7607
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Nov 2020 06:48:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 148FE1673;
	Wed, 18 Nov 2020 06:47:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 148FE1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605678503;
	bh=86J8ZLNu6/dpG0vAAXaD89CXGBhSnG3k5TxaPEfqwmc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JMopZ1MNOdshdy9Yz2pG7RgNJn/e8Bw7iJ0aIq//VV7yOIE0KRam3zNcohetqdbj0
	 56fcbv718Xcd/JlGd1MkIgCY3KULlATxHG0ihdm4cKdrNjPZDK7xJmNz8x/8yPAGFP
	 yCU/FUHcqBzOftB0ivJEQjEpZp9FKk5y7JenrryY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AAFD8F8016D;
	Wed, 18 Nov 2020 06:46:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B4DFF8016C; Wed, 18 Nov 2020 06:46:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F0ECF80158
 for <alsa-devel@alsa-project.org>; Wed, 18 Nov 2020 06:46:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F0ECF80158
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="Vz3RHLxB"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5fb4b5490000>; Tue, 17 Nov 2020 21:46:49 -0800
Received: from [10.25.102.221] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 18 Nov
 2020 05:46:36 +0000
Subject: Re: [PATCH 4/4] ASoC: dt-bindings: Refine 'frame-master' and
 'bitclock-master' type
To: Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>
References: <20201117013349.2458416-1-robh@kernel.org>
 <20201117013349.2458416-5-robh@kernel.org>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <569d30e4-48ba-51b1-39f3-0edba303873b@nvidia.com>
Date: Wed, 18 Nov 2020 11:16:33 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201117013349.2458416-5-robh@kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1605678409; bh=mKzhZMKh4pc2zrzu7v+eVTID84+eLb68P87ZBywkT5c=;
 h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 Content-Language:X-Originating-IP:X-ClientProxiedBy;
 b=Vz3RHLxBAQtnNScnPW/4o3vVH1QeYbRV0vuOfS/s9vHRIhgvKdhqIhdXGKyaFg+3J
 k5vBd8wYRHyfesCtedTW1L3jYXuCY3ZGwT66vZW2cmiozrNc5gGrWMp1c6VE7N4LFi
 8enlacCNFfXxOUBDBuTRm072APmkaCtayBDmv4sHBSXnaRl/8qWa/IipfTrYyM8wFV
 zvn1rQW/LkOFXTKHS0GLVeUXspksfJYBkLDFq6zyzWO+7+7jqzUvHguxTnEa4yEuyG
 JWSECBvgq+jmGFNQyD7+QJoEQqjhrlWdOUJfrW7ZAgaPVLdtfJCvYyyEaQwWz5nN0/
 3h/DDMn1z2zOQ==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Lubomir Rintel <lkundrak@v3.sk>
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


> 'frame-master' and 'bitclock-master' are only a single phandle, so use
> the more specific 'phandle' type definition instead.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>   .../devicetree/bindings/sound/audio-graph-port.yaml         | 6 ++----
>   Documentation/devicetree/bindings/sound/simple-card.yaml    | 6 ++----
>   2 files changed, 4 insertions(+), 8 deletions(-)
>

Acked-by: Sameer Pujar <spujar@nvidia.com>
