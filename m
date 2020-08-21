Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB0524CD46
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 07:28:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1A451687;
	Fri, 21 Aug 2020 07:27:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1A451687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597987725;
	bh=ZIdabHpoxIGB/X89geZHtDWGmBBN0Sr3tzFvowG6rxQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k/t98W6tGwCEcIvIvpdZNow9ATECaOJVemLFVKOfuOQZj3STfUGDyn1BMUZ/QZ8Ma
	 84hCdVeXEyAiDlJz7G7o+XAIKhOBJNvEz34OWT6OeVaYX3n64TJ3UOgL8/xUZy0ML6
	 ch//MmsOnySDB0Z8taGb6eqyTF+2p4AxpUCWLU1g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF104F80253;
	Fri, 21 Aug 2020 07:27:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F131F800D3; Fri, 21 Aug 2020 07:27:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C9ABF800D3
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 07:26:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C9ABF800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="MORD8OPm"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f3f5aa80000>; Thu, 20 Aug 2020 22:24:56 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 20 Aug 2020 22:26:51 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 20 Aug 2020 22:26:51 -0700
Received: from [10.25.96.247] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 21 Aug
 2020 05:26:48 +0000
Subject: Re: More Generic Audio Graph Sound Card idea
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
 <broonie@kernel.org>
References: <87k0xszlep.wl-kuninori.morimoto.gx@renesas.com>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <097e3fc4-4a84-e101-e6b6-045c3e9e5bfc@nvidia.com>
Date: Fri, 21 Aug 2020 10:56:44 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87k0xszlep.wl-kuninori.morimoto.gx@renesas.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1597987496; bh=xvtQEKLivKJyeSnurZhd5ryhyoyVzP2bE8LpjHgRp4Q=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
 Content-Language;
 b=MORD8OPmjUlccxXXzfLX2fpduCN2iubHgb4iU1J7IYjcTeMbm82lhm20GnWBS6+BJ
 nt2VCvCnrkLUrm1CEV7haF56aSnhpToQFeEaoL72lNhHD2WUYWwnI9XVt/l0x402QL
 RUM80swFDfN+3Ob3Jj6YjqfnC8cV2z48BkGXuk3L3FCBrtIeKvMQmYal1jvvN+rYti
 Qd9BSK3IEQzL9eYQFFBUHZ/vHEeBxwBsSwfIsdOLuOxxTL2FaFUA5Z/925ASuBb4zv
 KIpXAeIfzcekHyi+rHwwiS0AsKUyo7vOIXcARODzqsx8LCMbyCSzTP/0JOOI9kmtWi
 UCmzg4Q1Jnqlg==
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 jonathanh@nvidia.com
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


Hi Kuninori,

CC Jon

Some of my thoughts on below.

On 8/21/2020 9:45 AM, Kuninori Morimoto wrote:
> External email: Use caution opening links or attachments
>
>
> Hi Mark
> Cc Pierre-Louis, Sameer
>
> Current audio-graph-card driver has DPCM support,
> but it is limited (= Mix/Mux/TDM-split/rate-convert/channel-convert).
> It was expanded forcibly expanded.

Yes it appears to be so. Right now it does not seem to be supporting 
'demux' kind of use case.

>
> Because of it, the connection judgement for normal vs DPCM is tricky.

Please note that asoc_simple_init_dai_link_params() makes the link 
codec-to-codec if any component involved has 'non_legacy_dai_naming' 
flag enabled. It is used by both audio-graph and simple-card. So it is a 
combination of three (DPCM, normal and codec-to-codec). To avoid all 
this complication, I am treating all links as DPCM in the series [0] I sent.

> I know Pierre-Louis want to use it for SOF, but something is missing,
> thus, can't use (?).

> I know now Sameer is currently trying to expand it now.
> It is OK for me, but, more expansion in the future will be difficult/buggy.
> For example supporting many *generic* DPCM and normal connection in the
> same time will be difficult.

If we encode use case information in DT, it would become regid and is 
not flexible when the HW is giving us the all flexibility (at least in 
my case). Thus may lead to complications. If there is a way to configure 
PCM parameters from the user space it would help to simplify things. 
Then DT can just describe the HW links.

>
> I'm thinking below style as new audio-graph-card2.
> It is not tricky, thus connection judgement for normal vs DSP is easy.
> Then, code can be more readable (= no guaranty :P) ?
>
> I guss "audio-graph-card" and "audio-graph-card2" can have some (= not full)
> compatible for normal connection. But has no compatible for DPCM connection.
>
> I think I need to keep as-is for current audio-graph-card,
> and create new audio-graph-card2 driver.
> Because there is users, and card2 implementation will have huge different.
> Keeping compatible and update will be very difficult or buggy.
>
> But what do you think ?
>
> Note 1 is that this is just idea for now.
> I'm very happy to implement it, but it will be after that
> my all remaining patch was posted/accepted.
>
> Note 2 is that I'm not full DPCM analyst.
> Thus, maybe audio-graph-card2 can solve current connection issue,
> but might can't for unknown connection case.
> In such came we need ver3 (?).

>    ------------ image ---------------------------
>
>    | Front End PCMs    |  SoC DSP  | Back End DAIs | Audio devices |
>
>                        *************
>    PCM0 <------------> *           * <----DAI0-----> Codec Headset
>                        *           *
>    PCM1 <------------> *           * <----DAI1-----> Codec Speakers
>                        *   DSP     *
>    PCM2 <------------> *           * <----DAI2-----> MODEM
>                        *           *
>    PCM3 <------------> *           * <----DAI3-----> BT
>                        *           *
>                        *           * <----DAI4-----> DMIC
>                        *           *
>                        *           * <----DAI5-----> FM
>                        *************
>    ------------ DT sample ---------------------------
>
>          sound {
>                  compatible = "audio-graph-card2";
>
>                  dais = <&pcm0,
>                          &pcm1,
>                          &pcm2,
>                          &pcm3>;
>          };
>
>          front-end {
>                  ports {
>                          pcm0: port@0 { pcm0_endpoint: endpoint { remote-endpoint = <&dsp_f0>; }; };
>                          pcm1: port@1 { pcm1_endpoint: endpoint { remote-endpoint = <&dsp_f1>; }; };
>                          pcm2: port@2 { pcm2_endpoint: endpoint { remote-endpoint = <&dsp_f2>; }; };
>                          pcm3: port@3 { pcm3_endpoint: endpoint { remote-endpoint = <&dsp_f3>; }; };
>                  };
>          };
>
>          dsp {
>                  compatible = "audio-graph-card2-dsp";
>
>                  ports {
>                          /* Front End side */
>                          port@0 { dsp_f0: endpoint { remote-endpoint = <&pcm0>; }; };
>                          port@1 { dsp_f1: endpoint { remote-endpoint = <&pcm1>; }; };
>                          port@2 { dsp_f2: endpoint { remote-endpoint = <&pcm2>; }; };
>                          port@3 { dsp_f3: endpoint { remote-endpoint = <&pcm3>; }; };
>
>                          /* Back End side */
>                          port@4 { dsp_b0: endpoint { remote-endpoint = <&dai0>; }; };
>                          port@5 { dsp_b1: endpoint { remote-endpoint = <&dai1>; }; };
>                          port@6 { dsp_b2: endpoint { remote-endpoint = <&dai2>; }; };
>                          port@7 { dsp_b3: endpoint { remote-endpoint = <&dai3>; }; };
>                          port@8 { dsp_b4: endpoint { remote-endpoint = <&dai4>; }; };
>                          port@9 { dsp_b5: endpoint { remote-endpoint = <&dai5>; }; };
>                  };
>          };
>
>          back-end {
>                  ports {
>                          port@0 { dai0: endpoint { remote-endpoint = <&dsp_b0>; }; };
>                          port@1 { dai1: endpoint { remote-endpoint = <&dsp_b1>; }; };
>                          port@2 { dai2: endpoint { remote-endpoint = <&dsp_b2>; }; };
>                          port@3 { dai3: endpoint { remote-endpoint = <&dsp_b3>; }; };
>                          port@4 { dai4: endpoint { remote-endpoint = <&dsp_b4>; }; };
>                          port@5 { dai5: endpoint { remote-endpoint = <&dsp_b5>; }; };
>                  };
>          };

In my series [0], I am trying to achieve the similar as above though the 
description may look little different in my case, but that is what HW 
describes I believe.

[0] https://lkml.org/lkml/2020/8/5/42

