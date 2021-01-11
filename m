Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3AF2F0BF3
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Jan 2021 05:51:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8EAEA16AB;
	Mon, 11 Jan 2021 05:51:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8EAEA16AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610340711;
	bh=6prArE3e1adeqkRe9nYdbuwYqIrKzrY1o7gpc43KFyg=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ghEB0GDsnq3NJSruXULOI+WvRMgGNBvZnboKfVsFiSnpgHKIGthS3qbXRJrS/BMTl
	 wOY5xRbPxcj3kW8ozC0kuitLAxJrH6MFPuRGCjDbFkSNgZiK6cuDMp4fccNQ5DvSEz
	 S7k569REiWpppCDfMtPMRHubRnuFBxPz+Z9ZaNFg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F176F80113;
	Mon, 11 Jan 2021 05:50:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3156F8016D; Mon, 11 Jan 2021 05:50:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 17633F80113
 for <alsa-devel@alsa-project.org>; Mon, 11 Jan 2021 05:50:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17633F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="SHyf0qx0"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5ffbd8f50000>; Sun, 10 Jan 2021 20:49:58 -0800
Received: from [10.25.100.239] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 11 Jan
 2021 04:49:53 +0000
Subject: Re: [PATCH] ASoC: audio-graph-card: Drop remote-endpoint as required
 property
From: Sameer Pujar <spujar@nvidia.com>
To: Rob Herring <robh@kernel.org>
References: <1607498532-19518-1-git-send-email-spujar@nvidia.com>
 <20201210021550.GA1498001@robh.at.kernel.org>
 <1fd0f074-c437-2b83-e395-d4b83ae49444@nvidia.com>
Message-ID: <5bb5c1bf-34c8-6c59-63c1-fa93d4b68f08@nvidia.com>
Date: Mon, 11 Jan 2021 10:19:49 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1fd0f074-c437-2b83-e395-d4b83ae49444@nvidia.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1610340598; bh=e8XqNFSxdK2VUGmE8qRW6SXK86Nnm5AcKjr9gMHphpI=;
 h=Subject:From:To:CC:References:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 Content-Language:X-Originating-IP:X-ClientProxiedBy;
 b=SHyf0qx0lz6wC1LySFTX6c68Jw05DuZkrLD49WuG+GnRT+MaEvEf93UUbFuM6ib/C
 kZUGyNYmjqrB3UDOAu2J2P428P889msgtivFmL2WjyoToQfs4Jjip8bxsTG3n1rgL3
 SAhGhom8o2YdGo5xZD418i+GEDUqab35W5leyPlJ0PnW3Jhc67+AAxDpdtIcRm9uFd
 BtCTx3OsSW7h/z6DlGDoHmHzlCzzolDj7HY6AIe0e1ABaOsdUIIuyLCghljNYOhjCP
 E68vpgIjA0Yo71lOFeplpmHi1bH8K6S5tTjly2UVCm0Io2PYTQ3CNI8A0HK24M6voi
 X7eJ7K0GlPV1A==
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


On 12/10/2020 8:14 PM, Sameer Pujar wrote:
> Hi Rob,
>
>>> The remote-endpoint may not be available if it is part of some
>>> pluggable module. One such example would be an audio card, the
>>> Codec endpoint will not be available until it is plugged in.
>>> Hence drop 'remote-endpoint' as a required property.
>> Please hold off on this. I have more changes coming.

Sorry to bother you again. Is it possible if we take this patch now and 
your remaining changes can come later? This would help to unblock below 
series, which is pending quite some time now.

>
> OK, I will wait for your patch. Kindly note that this is currently 
> blocking series 
> https://patchwork.kernel.org/project/alsa-devel/list/?series=391735&state=*

