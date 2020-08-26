Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E7B2527B0
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Aug 2020 08:48:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65A781706;
	Wed, 26 Aug 2020 08:47:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65A781706
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598424498;
	bh=KCh0kHJM37TrJpXz/oAEeY5y+HnwvLfwwvUcXInx6HA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H9xGxqqRuzdx12g/+c04bvKP443AkzHST+wbQKuiU8F3aU9PzCWOuOZgVSCjhjT8m
	 /s5vFUvhzwrWiQJwQj1kIhmpUMFCKuoGUqYr2nN+JwMJ3bH2+7pMJ8DGhQ411PN+kK
	 3pdJGmV4uU8XkIvZIHL8DEeIvtk8SSbvJffh9llA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BD3DF801EC;
	Wed, 26 Aug 2020 08:46:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 530ECF801D9; Wed, 26 Aug 2020 08:46:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EAA25F80105
 for <alsa-devel@alsa-project.org>; Wed, 26 Aug 2020 08:46:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EAA25F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="XFCx8mJX"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f4605000002>; Tue, 25 Aug 2020 23:45:20 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 25 Aug 2020 23:46:23 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 25 Aug 2020 23:46:23 -0700
Received: from [10.25.99.87] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 26 Aug
 2020 06:46:16 +0000
Subject: Re: More Generic Audio Graph Sound Card idea
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <87k0xszlep.wl-kuninori.morimoto.gx@renesas.com>
 <20200821121844.GF4870@sirena.org.uk>
 <878se4zybn.wl-kuninori.morimoto.gx@renesas.com>
 <58220f32-0b3e-d666-5bb0-bbeae27f6aab@nvidia.com>
 <87364by23u.wl-kuninori.morimoto.gx@renesas.com>
 <e6e04e2c-2695-b7ba-3eb2-79158f317e4a@nvidia.com>
 <87r1rvwbsd.wl-kuninori.morimoto.gx@renesas.com>
 <2d9140c7-7cba-34d9-d4b7-c9f9f395d9e7@nvidia.com>
 <87mu2jw7zd.wl-kuninori.morimoto.gx@renesas.com>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <f21353ca-5d47-afac-3451-f951eced36e2@nvidia.com>
Date: Wed, 26 Aug 2020 12:16:13 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87mu2jw7zd.wl-kuninori.morimoto.gx@renesas.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1598424320; bh=dhWvXX24pbLSGO7UURHDj8bFJNRxlTLYZoA+mtEWjlc=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
 Content-Language;
 b=XFCx8mJXDdA4dZWWLmimYwmSxaPJtmFgUA+SGLKFOD4fALX9INO/vsLqc8CERg6l3
 Y7eukjlOGU/b0Ya7IqLzoTmxUQHvss50Xve3P6WYLV40Kk1FQ8iDrM2D0HyRxR6zwn
 PSwejbv+nhfttqyleVB+h8n0YzozfXIGjNsZAUkQ0xDyc8ZVNKCu7LE4yk/hfPtdXV
 riSajOBN4m+RmpXPdIGzfzf5okeDrpcyz6AETt678YiWAXqRzbfv30H/TWjyiEie0F
 Rp2zknSmK2Ul6xRiKIwVym8B5tCsGohcQdFKDAfhnZKn9LWVCYCK4VWWZvi7nFVxLI
 iyLdeBtYxEB0A==
Cc: sharadg@nvidia.com, Linux-ALSA <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>,
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

Hi Morimoto-san,

>> If we plan to go this way, I think we need to consider board specific
>> configuration at init time and one at runtime. In that case there
>> could be multiple compatibles that would get added to the driver and
>> various other requirements can be managed with behavioral flags
>> instead from DT?
> This is still just idea though...
> But for example, if you want to
>          1) basically, DT is almost audio-graph
>          2) but want to have customized operation for some part

> And if "audio-graph-card2" driver has graph_init() exported function,
> you can create your own drviver, and use customized audio-graph
> by using .hooks.

What you are suggesting is 'audio-graph-card2' is a new restructured=20
version of 'audio-graph-card' with some additional customization=20
available for specific users. Do you think updating existing=20
'audio-graph-card' itself, with necessary hooks, would be too=20
complicated to handle?

> This is just idea/sample, but I'm not sure this is enough or not,
> and/or if I can do what I want.
> But do you think it can solve your issue ?

 From a brief overview, it may solve my issue in customizing few stuff.=20
But I am not too sure if we want to go that way, because eventually we=20
end up in writing a separate machine driver for Tegra (though there can=20
be common stuff used from the generic graph card). The original idea was=20
to use 'audio-graph-card' and people facing similar issues could use=20
"-cc-" compatible.

...

>          static audio_graph_hooks hooks =3D {
>                  .parse_of_hook_pre  =3D xxx,
> =3D>              .parse_of_hook_post =3D sameer_parse_of_post,

We may end up re-parsing the whole stuff under 'hook_post' (which=20
appears redundant) because I am forcing DPCM and would like func_dpcm()=20
to execute for all links. If I could set a flag under 'hooks' and if=20
'audio-graph-card' can use it to force DPCM, it would appear to be a=20
better choice.

...

> ---- my-dt ----------
>
>            /*
>             * DT setting is almost same as audio_graph
>             * which is supporting normal and DPCM.
>             * You can add own property which will be handled under .hook
>             */
>                                *************
>            PCM0 <------------> *           * <----DAI0----->
>                                *  DSP      *
>                                *           * <----DAI1----->
>                                *************
>            PCM1 <------------------------------------------> DAI2

I think, the main issue is you want to keep both normal/DPCM link=20
detections, where as I am trying to force DPCM usage. That is mainly=20
because I do have N components and would like to connect M(<=3DN)=20
components with DPCM usage. My DT would be like this.

 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *************
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PCM0 <-------------=
> *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * <------ D=
AI0 (component-0)=20
------>
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ... =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * <=
------ DAI1 (component-1)=20
------>
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Crossbar=C2=A0 * ...
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PCMX <-------------=
> *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * <------ D=
AIN (component-N)=20
------>
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 *
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *************

So at runtime my audio path could be,
at t0: PCM0 -> DAI0 -> DAI1
at t1: PCM0 -> DAI1 -> DAIN

Audio path can have ideally any combination of DAIs (and components) in=20
the path. DT may look like it is similar to having normal links, but=20
conceptually any PCMx can be routed to any set of DAIs. DAIs can be=20
resampler, mixer, multiplexer etc., in SoC. I hope this makes clear as=20
to what I am looking for.

...

>                  dsp {
>                          compatible =3D "audio-graph-card2-dsp";

Sorry I did not understand this. Do you intend to parse 'dsp' separately=20
with some version of audio graph card? In my case 'dsp' is just a=20
'crossbar' and is registered as a component exposing all routes. However=20
I have described links in the DT in a similar way where my 'crossbar' is=20
exposing FEs and BEs like below.

>
>                          ports {
>                                  /* Front End side */
>                                  port@0 { dsp_f0: endpoint { remote-endpo=
int =3D <&pcm0>; }; };
>
>                                  /* Back End side */
>                                  port@4 { dsp_b0: endpoint { remote-endpo=
int =3D <&dai0>; }; };
>                                  port@5 { dsp_b1: endpoint { remote-endpo=
int =3D <&dai1>; }; };
>                          };
>                  };
>
>                  back-end {
>                          ports {
>                                  port@0 { dai0: endpoint { remote-endpoin=
t =3D <&dsp_b0>; }; };
>                                  port@1 { dai1: endpoint { remote-endpoin=
t =3D <&dsp_b1>; }; };
>                          };
>                  };
>
>                  codec {
>                          port { dai2: endpoint { remote-endpoint =3D <&pc=
m1>; }; };
>                  };
>
>
> Thank you for your help !!
>
> Best regards
> ---
> Kuninori Morimoto

