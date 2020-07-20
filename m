Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1712122567A
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jul 2020 06:19:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9096F165E;
	Mon, 20 Jul 2020 06:18:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9096F165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595218748;
	bh=n8v2LPODfX9Xg0IajV25nuEDtPn5lEeDEIxiJOPCh4s=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UO7r2SmtAfidfCEXqr3jyxDISznrxuiyppnrcujzsSi3ZYbqXxX2qQ2DkFtxt9GOa
	 ivouG13/bZEYTKUBAb33vTWXxSjV/d7PPddkFCzkpf1xUXAwNZAvoXqAM0wzv0NjhN
	 eWOSbKzg4/MmF5xzrNluGyMZhUN2qiL6OROQiNMw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CAE84F80125;
	Mon, 20 Jul 2020 06:17:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10753F800F5; Mon, 20 Jul 2020 06:17:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD6EBF800BF
 for <alsa-devel@alsa-project.org>; Mon, 20 Jul 2020 06:17:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD6EBF800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="XdHGmzsL"
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f151ac10003>; Sun, 19 Jul 2020 21:17:05 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Sun, 19 Jul 2020 21:17:17 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Sun, 19 Jul 2020 21:17:17 -0700
Received: from [10.25.99.163] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 20 Jul
 2020 04:17:09 +0000
Subject: Re: [PATCH 09/10] arm64: tegra: Audio graph header for Tegra210
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <1595135417-16589-1-git-send-email-spujar@nvidia.com>
 <1595135417-16589-10-git-send-email-spujar@nvidia.com>
 <871rl72gjb.wl-kuninori.morimoto.gx@renesas.com>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <b5484f5d-6ed4-e04b-3e62-8f4f3893ed67@nvidia.com>
Date: Mon, 20 Jul 2020 09:47:05 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <871rl72gjb.wl-kuninori.morimoto.gx@renesas.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1595218625; bh=lWBM6E+QzEDtmyDZPFCowyLU1JN5PwFJvJc2iSnzkRY=;
 h=X-PGP-Universal:CC:Subject:To:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
 Content-Language;
 b=XdHGmzsL8bTrzEavdy6VRGHQjucOqIxSPTh0Gcs2yztT/WBPcnyX62goRm7gglP4E
 HQ6VzjmW6/wPxBfbEaxkAsu6Qrn0xGujlp8yn8FAweNG/mTHqn5UjDr+fCGiONiIjp
 3RPA1F4Pxct3ZhednRhm472Pw2YLhj39QWZMcM3h/MSdh9LnFMuJxozIsYbg5YiwB4
 wgE2JWD0plPzssbrRkHeg1wZ4f+dag888kCTciNMQ7QMvWFvh7n5u/SrOvdJK8d7uw
 aIfrKC1q7uyH+Oq+hR89MoAusG1fq/hwiiKr6sIvi+dE4++sbNDnk3F8w2IqGavB/R
 ZV/ZWRnLXGIoA==
Cc: jonathanh@nvidia.com, nicoleotsuka@gmail.com, alsa-devel@alsa-project.org,
 atalambedu@nvidia.com, swarren@nvidia.com, linux-kernel@vger.kernel.org,
 spujar@nvidia.com, nwartikar@nvidia.com, lgirdwood@gmail.com,
 robh+dt@kernel.org, tiwai@suse.com, viswanathl@nvidia.com, sharadg@nvidia.com,
 broonie@kernel.org, thierry.reding@gmail.com, linux-tegra@vger.kernel.org,
 rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
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



On 7/20/2020 5:40 AM, Kuninori Morimoto wrote:
> External email: Use caution opening links or attachments
>
>
> Hi Sameer
>
>> +&tegra_admaif {
>> +     admaif_port: port {
>> +             admaif0: endpoint@0 {
>> +                     remote-endpoint = <&xbar_admaif0>;
>> +             };
>> +             admaif1: endpoint@1 {
>> +                     remote-endpoint = <&xbar_admaif1>;
>> +             };
> (snip)
>> +             admaif8: endpoint@8 {
>> +                     remote-endpoint = <&xbar_admaif8>;
>> +             };
>> +             admaif9: endpoint@9 {
>> +                     remote-endpoint = <&xbar_admaif9>;
>> +             };
>> +     };
>> +};
> I'm not familiar with your system, so, one question.
> Does this ADMAIF has total 10 interface which is used in the same time ?
> or select one of 10 connections when use ?

One ore more ADMAIF interfaces can be used simultaneously. In fact all 
of them can be used at the same time.

>
> Thank you for your help !!
>
> Best regards
> ---
> Kuninori Morimoto

