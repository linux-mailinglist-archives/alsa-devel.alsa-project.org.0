Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 437792D5E43
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Dec 2020 15:46:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B68891678;
	Thu, 10 Dec 2020 15:45:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B68891678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607611572;
	bh=T7GMlxxh3+Xq/u2q4sWIkHInRoIaIO3i/AMg4ONr2zk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O0KjRq31f6XdAGL7U5v42+La2gPIr276sKDqBRsF+6zo//IM0sMirIK/t+w94D5xY
	 6vkboQRMNbDhhNtBULAO/rFNJDF5VkTIgbHFuqOVifAG9Kzkp9tnhJpadEoqKqst3+
	 EgUAsHKHdOkD6/h9pmL0xAI1DWqpjhlUEqYVYk+A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE739F8019D;
	Thu, 10 Dec 2020 15:44:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F977F8016E; Thu, 10 Dec 2020 15:44:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C446DF800EF
 for <alsa-devel@alsa-project.org>; Thu, 10 Dec 2020 15:44:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C446DF800EF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="IWYTgTMQ"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5fd2344c0000>; Thu, 10 Dec 2020 06:44:28 -0800
Received: from [10.25.96.159] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 10 Dec
 2020 14:44:24 +0000
Subject: Re: [PATCH] ASoC: audio-graph-card: Drop remote-endpoint as required
 property
To: Rob Herring <robh@kernel.org>
References: <1607498532-19518-1-git-send-email-spujar@nvidia.com>
 <20201210021550.GA1498001@robh.at.kernel.org>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <1fd0f074-c437-2b83-e395-d4b83ae49444@nvidia.com>
Date: Thu, 10 Dec 2020 20:14:20 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201210021550.GA1498001@robh.at.kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1607611468; bh=Cn2SdbKc4vj3vjwSOffVYXifLl5CSX4BiFvujeiwYyA=;
 h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 Content-Language:X-Originating-IP:X-ClientProxiedBy;
 b=IWYTgTMQuAogrtBAGH0xtCBdKpmv1/fmKy+5tfawqo47inp5CQyf830M5uwP7Avp/
 GZVOehJ6zMj1kckajdiEHHvCakFIV3s8eulB2PtSPTa2Rh7tu58bry/JPfyFL/5vHZ
 Plbl6Nc7/0iNEArrM6yRhraUS1havEPGZGgrRkvpxPBH9VlGY3v7Q3dQnN43VLvKbD
 A5qyYaW+QVPCLFOrsz6j5x0dSOH8mBhnek9nbOukM8EDAsX+oIKX/KjmMfSVQgVC+O
 MUJEbEVXVDQAxCNIr1KeYxBYNobgSOboZqa0pMH80NrvwQsL6BYyL/yjwNm55/3rKm
 mMIS/zNo0Gdxw==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, broonie@kernel.org,
 linux-kernel@vger.kernel.org, kuninori.morimoto.gx@renesas.com
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

Hi Rob,

>> The remote-endpoint may not be available if it is part of some
>> pluggable module. One such example would be an audio card, the
>> Codec endpoint will not be available until it is plugged in.
>> Hence drop 'remote-endpoint' as a required property.
> Please hold off on this. I have more changes coming.

OK, I will wait for your patch. Kindly note that this is currently 
blocking series 
https://patchwork.kernel.org/project/alsa-devel/list/?series=391735&state=*

Thanks,
Sameer.
