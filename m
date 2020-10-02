Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54983280F4B
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Oct 2020 10:52:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B4E91EFF;
	Fri,  2 Oct 2020 10:52:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B4E91EFF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601628774;
	bh=PvFeElEFS2USE9VjlDip+jwUSEhI08UCvWZTwNzyB5c=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Nfg8seATGstoBml9h42qwruG8TFuayrcEDs6mkzIprvj0ehxmsOHccC4ZrZhX9tBt
	 +HxxxFQJV3fWJeB8grIigX5nw6zARHNdjzPKPYqyfahN+aMBFqeMmTSQbyceaJ5aER
	 5fq/Q25H53Dn3+le1jsgHTxA5ocQG9B1NyFgpKrc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3ED9EF801A3;
	Fri,  2 Oct 2020 10:51:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6EBEF801F9; Fri,  2 Oct 2020 10:51:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1CF5F800E5
 for <alsa-devel@alsa-project.org>; Fri,  2 Oct 2020 10:51:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1CF5F800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="GKeHIFRB"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f76e98c0000>; Fri, 02 Oct 2020 01:49:16 -0700
Received: from [10.25.97.216] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 2 Oct
 2020 08:50:50 +0000
Subject: Re: [PATCH v3 01/13] ASoC: soc-core: Fix component name_prefix parsing
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
References: <1601573587-15288-1-git-send-email-spujar@nvidia.com>
 <1601573587-15288-2-git-send-email-spujar@nvidia.com>
 <20201001185308.GC23339@qmqm.qmqm.pl>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <a63c8898-540c-f89b-8997-27d6385cb2c3@nvidia.com>
Date: Fri, 2 Oct 2020 14:20:47 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201001185308.GC23339@qmqm.qmqm.pl>
Content-Type: text/plain; charset="iso-8859-2"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1601628556; bh=BI4fp6pD/W2VIRJQVhnrK4iPbG7U8OWA4NPdWAoCl4I=;
 h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 Content-Language:X-Originating-IP:X-ClientProxiedBy;
 b=GKeHIFRBa0MxGfztlF548b8USZc5XGny2A7IUep8pOfpw2vGOX46cC9Ajb167YL1Q
 b5DEJ5hTAB7ZH27nNMNvtdG+IKgiJV4y3d1UKqaRV9Lb4//rXSx6JrHZHVtKmD+wWk
 eqyG/IzxhUrWUAi7RPWzxbPWfvOYPYfvZCpZpcAE7qAJ9GroRgorLmjl7E6/rFxiLx
 MZRWLuUPagxloUc9yhKBi7Qu+xxDPax+fCeyA+GsvmRxE4p64qTdXJUS5KetSs4yEG
 c3g8wKTvKSxgLfUF+gMF0uYkz4UEDFtf3kCyzq5yWYV0HVRJIwbmxFvqNnNmOtimAT
 wB0CsooB6zk/A==
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 lgirdwood@gmail.com, atalambedu@nvidia.com, tiwai@suse.com,
 thierry.reding@gmail.com, rlokhande@nvidia.com, swarren@nvidia.com,
 pierre-louis.bossart@linux.intel.com, jonathanh@nvidia.com,
 nwartikar@nvidia.com, devicetree@vger.kernel.org, nicoleotsuka@gmail.com,
 robh+dt@kernel.org, linux-tegra@vger.kernel.org, mkumard@nvidia.com,
 viswanathl@nvidia.com, linux-kernel@vger.kernel.org, broonie@kernel.org,
 sharadg@nvidia.com, dramesh@nvidia.com
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


>> The "prefix" can be defined in DAI link node or it can be specified as
>> part of the component node itself. Currently "sound-name-prefix" defined
>> in a component is not taking effect. Actually the property is not gettin=
g
>> parsed. It can be fixed by parsing "sound-name-prefix" property whenever
>> "prefix" is missing in DAI link Codec node.
> [...]
>> --- a/sound/soc/soc-core.c
>> +++ b/sound/soc/soc-core.c
>> @@ -1124,7 +1124,8 @@ static void soc_set_name_prefix(struct snd_soc_car=
d *card,
>>        for (i =3D 0; i < card->num_configs; i++) {
>>                struct snd_soc_codec_conf *map =3D &card->codec_conf[i];
>>
>> -             if (snd_soc_is_matching_component(&map->dlc, component)) {
>> +             if (snd_soc_is_matching_component(&map->dlc, component) &&
>> +                 map->name_prefix) {
>>                        component->name_prefix =3D map->name_prefix;
>>                        return;
>>                }
> Hi,
>
> It is not obvious how the patch fixes the problem described. I guess now
> map->name_prefix is NULL on some level and overrides prefix found earlier=
?
>
> Best Regards,
> Micha=B3 Miros=B3aw

If map->name_prefix is NULL (which is the prefix defined for Codec DAI=20
component in a DAI link), then go ahead and check if "sound-name-prefix"=20
is provided under component device node itself.
